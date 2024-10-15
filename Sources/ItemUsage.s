********************************************************************************
********************************************************************************
********************************************************************************
*                                                                              *
*          ##\ ##\##\#####\ ##### #####     #### /## /##/#####  /####          *
*          ## \## ## ##\ ## ##\   ##  ##   ##  ## ##  ## ## /##/##  ##         *
*          ##  ## ## ##  ## ##    ##  ##   ##     ##  ## ##  ## ##             *
*          ###### ## #####  ####  ##  ##   ##     ##  ## ##  ##  ####          *
*          ##  ## ## ##  ## ##    ##  ##   ##  ## ##  ## ##  ##     ##         *
*          ## /## ## ##  ## ##/   ##  ##   ##  ##\##  ## ##  ##\## \##         *
*          ##/ ##/##/##/ ##/##### #####     ##### \#### \## \## \####          *
*                                                                              *
********************************************************************************
**************************** © Scott Johnston 1990-93 **************************
********************************************************************************

;INPUT:         a0=address of players structure (long)
;		a1=address of current item structure(long)
;OUTPUT:	none
;CHANGES:	none

.use_launcher
		cmp.b	#3,fire_duration(a0)
		bgt	.already_firing

		tst.b	inven_using+inven_item_gun_ammo(a0)
		beq	.no_ammo

		moveq.l	#0,d0
		move.b	item_animduration(a1),d0
		cmp.b	inven_using+inven_item_gun_ammo(a0),d0
		bls.s	.enough_ammo
		move.b	inven_using+inven_item_gun_ammo(a0),d0

.enough_ammo	sub.b	d0,inven_using+inven_item_gun_ammo(a0)

		move.b	itemgun_accuracy(a1),fire_accuracy(a0)

		bsr	do_fx
		move.l	a1,-(sp)
		lea	itemgun_firefront(a1),a1
		bsr	do_fireballs
		move.l	(sp)+,a1
		bsr	fire_missile
		rts

.no_ammo	move.b	#3,variables+fx_sample(a5)
		move.w	#360,variables+fx_period(a5)
		move.w	aud_ch(a0),variables+fx_channel(a5)
		rts

********************************************************************************
;INPUT:         a0=address of players structure (long)
;		a1=address of current item structure(long)
;OUTPUT:	none
;CHANGES:	none

.use_sentrycntrl
		rts

********************************************************************************
;INPUT:         a0=address of players structure (long)
;		a1=address of current item structure(long)
;OUTPUT:	none
;CHANGES:	none

.use_gun
		cmp.b	#3,fire_duration(a0)
		bgt	.already_firing

		tst.b	inven_using+inven_item_gun_ammo(a0)
		beq.s	.no_gun_ammo

		moveq.l	#0,d0
		move.b	item_animduration(a1),d0
		cmp.b	inven_using+inven_item_gun_ammo(a0),d0
		bls.s	.enough_gun_ammo
		move.b	inven_using+inven_item_gun_ammo(a0),d0
.enough_gun_ammo
		sub.b	d0,inven_using+inven_item_gun_ammo(a0)

		move.b	itemgun_accuracy(a1),fire_accuracy(a0)

		bsr	do_fx
		bsr	fire_missile
		rts

.no_gun_ammo
		cmp.b	#49,itemgun_clip1(a1)
		bne.s	.not_beam
		tst.l	exchip_mem_base
		beq.s	.not_beam
		PLAY_EX_SAMPLE #18,aud_ch(a0),#63,#180
		rts
.not_beam
		move.b	#3,variables+fx_sample(a5)
		move.w	#360,variables+fx_period(a5)
		move.w	aud_ch(a0),variables+fx_channel(a5)
		rts

********************************************************************************

;INPUT:         a0=address of players structure (long)
;		a1=address of current item structure(long)
;OUTPUT:	none
;CHANGES:	none

.use_grenade
		cmp.b	#CNTRL_MOUSE1,control_method(a0)
		beq.s	.wrong_cntrl
		cmp.b	#CNTRL_MOUSE2,control_method(a0)
		beq.s	.wrong_cntrl

		bsr	throw_g4
.wrong_cntrl
		rts

********************************************************************************

;INPUT:         a0=address of players structure (long)
;		a1=address of current item structure(long)
;OUTPUT:	none
;CHANGES:	none

.use_sentry
		tst.b	inven_using+inven_item_gun_ammo(a0)
		beq	.out

		move.l	mem_position(a0),a2
		move.b	direction(a0),d0

		tst.b	d0
		bne.s	.not_north
		suba.l	#map_cell_size*MAP_WIDTH,a2
.not_north	cmpi.b	#1,d0
		bne.s	.not_east
		adda.l	#map_cell_size,a2
.not_east	cmpi.b	#2,d0
		bne.s	.not_south
		adda.l	#map_cell_size*MAP_WIDTH,a2
.not_south	cmpi.b	#3,d0
		bne.s	.not_west
		suba.l	#map_cell_size,a2
.not_west
		move.l	(a2),d2
		and.l	#keep_block,d2
		bne.s	.no_room

		move.l	-map_cell_size*MAP_WIDTH*MAP_DEPTH(a2),d2
		btst.l	#floor_here_bit_num,d2
		bne.s	.ok
		and.l	#keep_block,d2
		beq.s	.invalid2
		cmp.l	#(4<<block_shift)!keep_block_here_bit,d2
		beq.s	.invalid2
		cmp.l	#(20<<block_shift)!keep_block_here_bit,d2
		bge.s	.invalid2
		cmp.l	#(8<<block_shift)!keep_block_here_bit,d2
		blt.s	.ok
		cmp.l	#(15<<block_shift)!keep_block_here_bit,d2
		ble.s	.invalid2
.ok
		move.b	inven_using+inven_item_num(a0),d1
		move.b	player_num+1(a0),d2
		addi.b	#1,d2
		bsr	add_sentry
		tst.l	d0
		bne.s	.no_room

		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
		bne.s	.not_out
.out		clr.b	inven_using+inven_item_num(a0)
.not_out
		rts

.no_room	move.w	#150,noroom_count(a0)
		st.b	variables+redraw_flag(a5)
		rts

.invalid2	move.w	#150,invalid_count(a0)
		st.b	variables+redraw_flag(a5)
		rts

********************************************************************************
;INPUT:         a0=address of players structure (long)
;		a1=address of current item structure(long)
;OUTPUT:	none
;CHANGES:	none

.use_mine
		move.b	itemmine_armeditem(a1),inven_using+inven_item_num(a0)
		st.b	variables+redraw_flag(a5)
		bra	do_fx

********************************************************************************
;INPUT:         a0=address of players structure (long)
;		a1=address of current item structure(long)
;OUTPUT:	none
;CHANGES:	none

.use_ammo
		bra	do_fx

********************************************************************************
;INPUT:         a0=address of players structure (long)
;		a1=address of current item structure(long)
;OUTPUT:	none
;CHANGES:	none

.use_food
		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.l	d1,a2

		cmpi.b	#1,race(a2)
		beq.s	.cant_use
		cmpi.b	#4,race(a2)
		beq.s	.cant_use

		cmpi.b	#64,inven_using+inven_item_num(a0)	;medical pack?
		bne.s	.not_med_pack
		clr.w	poisoned_strength(a0)
		clr.w	poisoned(a0)
		clr.w	poisoned_total(a0)
		clr.b	fitness_flash_dur(a2)
.not_med_pack
		moveq.l	#0,d0
		move.w	itemfood_fitnessboost(a1),d0
		beq.s	.not_fitness
		move.l	a1,-(sp)
		move.l	a2,a1
		jsr	incr_fitness
		move.l	(sp)+,a1
		clr.b	fitness_flash_dur(a2)
.not_fitness
		clr.b	inven_using+inven_item_num(a0)

		st.b	variables+redraw_flag(a5)	;set redraw flag

		bra	do_fx

.cant_use	rts

********************************************************************************
;INPUT:         a0=address of players structure (long)
;		a1=address of current item structure(long)
;OUTPUT:	none
;CHANGES:	none

.use_repair
		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.l	d1,a2

		cmpi.b	#1,race(a2)
		beq.s	.ok2
		cmpi.b	#4,race(a2)
		bne.s	.cant_use2
.ok2
		moveq.l	#0,d0
		move.w	itemrepair_fitnessboost(a1),d0
		beq.s	.not_repair_fitness
		move.l	a1,-(sp)
		move.l	a2,a1
		jsr	incr_fitness
		move.l	(sp)+,a1
		clr.b	fitness_flash_dur(a2)
.not_repair_fitness
		clr.b	inven_using+inven_item_num(a0)

		st.b	variables+redraw_flag(a5)	;set redraw flag

		bra	do_fx

.cant_use2	rts

********************************************************************************
;INPUT:         a0=address of players structure (long)
;		a1=address of current item structure(long)
;OUTPUT:	none
;CHANGES:	none

.use_immu
		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.l	d1,a2

		cmpi.b	#1,race(a2)
		beq.s	.cant_use4
		cmpi.b	#4,race(a2)
		beq.s	.cant_use4

		clr.w	poisoned_strength(a0)
		clr.w	poisoned(a0)
		clr.w	poisoned_total(a0)

		move.w	#-1,spell_immu(a0)
		move.w	itemimmu_duration(a1),icon_immu_dur(a0)

		clr.b	inven_using+inven_item_num(a0)

		st.b	variables+redraw_flag(a5)	;set redraw flag

		bra	do_fx

.cant_use4	rts

********************************************************************************
;INPUT:         a0=address of players structure (long)
;		a1=address of current item structure(long)
;OUTPUT:	none
;CHANGES:	none

.use_grlauncher
		cmp.b	#3,fire_duration(a0)
		bgt	.already_firing

		tst.b	inven_using+inven_item_gun_ammo(a0)
		beq	.no_gr_ammo

		moveq.l	#0,d0
		move.b	direction(a0),d0

		move.l	a2,a3
		tst.b   d0
		bne.s	.not_north2
		suba.l	#map_cell_size*MAP_WIDTH,a3
.not_north2
		cmpi.b	#1,d0
		bne.s	.not_east2
		add.l	#map_cell_size,a3
.not_east2
		cmpi.b	#2,d0
		bne.s	.not_south2
		add.l	#map_cell_size*MAP_WIDTH,a3
.not_south2
		cmpi.b	#3,d0
		bne.s	.not_west2
		sub.l	#map_cell_size,a3
.not_west2
		move.l	(a3),d1
		btst.l	#opaque_bit_num,d1
		beq.s	.not_hit_wall
		move.l	a2,a3
.not_hit_wall
		moveq.l	#0,d1
		move.b	itemgun_clip1(a1),d1
		subq.w	#1,d1
		mulu	#item_size,d1
		move.l	#items,a2
		add.l	a5,a2
                add.l	d1,a2

		move.w	#-1,d3
		move.w	#-1000,d1		;yvel
		move.w	#25,d2			;height
		jsr	add_grenade

		tst.l	d0
		bne.s	.end2
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
		st.b	variables+redraw_flag(a5)
		bra	do_fx
.end2
		rts

.no_gr_ammo	move.b	#3,variables+fx_sample(a5)
		move.w	#360,variables+fx_period(a5)
		move.w	aud_ch(a0),variables+fx_channel(a5)
		rts

********************************************************************************
;INPUT:         a0=address of players structure (long)
;		a1=address of current item structure(long)
;OUTPUT:	none
;CHANGES:	none

.use_dts
		bra	do_fx

********************************************************************************
;INPUT:         a0=address of players structure (long)
;		a1=address of current item structure(long)
;OUTPUT:	none
;CHANGES:	none

.use_dts2
		bra	do_fx

********************************************************************************
;INPUT:         a0=address of players structure (long)
;		a1=address of current item structure(long)
;OUTPUT:	none
;CHANGES:	none

.use_psiamp
		cmp.b	#3,fire_duration(a0)
		bgt	.already_firing

		tst.b	inven_using+inven_item_gun_ammo(a0)
		beq	.no_psi_ammo

		moveq.l	#0,d0
		move.b	inven_using+inven_item_num(a0),d0
		move.l	d0,d1
		sub.l	#82,d0

		cmp.b	#1,inven_using+inven_item_gun_ammo(a0)
		bne.s	.not_last_psi_ammo
		clr.b	inven_using+inven_item_num(a0)
		st.b	variables+redraw_flag(a5)
.not_last_psi_ammo

		st.b	dofx(a0)

		lea	psi_table(pc),a3
		lsl.w	#2,d0
		jmp	0(a3,d0.w)

.no_psi_ammo	clr.b	inven_using+inven_item_num(a0)
		st.b	variables+redraw_flag(a5)
		rts

********************************************************************************
;INPUT:         a0=address of players structure (long)
;		a1=address of current item structure(long)
;OUTPUT:	none
;CHANGES:	none

.use_flamer
		cmp.b	#3,fire_duration(a0)
		bgt	.already_firing

		tst.b	inven_using+inven_item_gun_ammo(a0)
		beq.s	.no_fuel

		moveq.l	#0,d0
		move.b	item_animduration(a1),d0
		bne.s	.not_zero
		moveq.l	#1,d0
.not_zero	cmp.b	inven_using+inven_item_gun_ammo(a0),d0
		bls.s	.enough_fuel
		move.b	inven_using+inven_item_gun_ammo(a0),d0

.enough_fuel	sub.b	d0,inven_using+inven_item_gun_ammo(a0)

		move.b	itemgun_accuracy(a1),fire_accuracy(a0)

		movem.l	a0-a1,-(sp)
		lea	itemgun_firefront(a1),a1
		bsr	do_fireballs
		movem.l	(sp)+,a0-a1

		bra	do_fx

.no_fuel	move.b	#3,variables+fx_sample(a5)
		move.w	#360,variables+fx_period(a5)
		move.w	aud_ch(a0),variables+fx_channel(a5)
		rts


********************************************************************************

get_dist
		move.b	#63,fire_dist_vol(a0)
		sf.b	fire_against_door(a0)

		move.l	mem_position(a0),a2
		move.b	direction(a0),d1
		moveq.l	#0,d0

.next		tst.b	d1
		bne.s   .not_north
		sub.w	#map_cell_size*MAP_WIDTH,a2
.not_north	cmpi.b	#1,d1
		bne.s   .not_east
		add.w	#map_cell_size,a2
.not_east	cmpi.b	#2,d1
		bne.s   .not_south
		add.w	#map_cell_size*MAP_WIDTH,a2
.not_south	cmpi.b	#3,d1
		bne.s   .not_west
		sub.w	#map_cell_size,a2
.not_west
		move.l	(a2),d2
		btst.l	#opaque_bit_num,d2
		bne.s	.hit_wall
		and.l	#keep_block,d2
		bne.s	.hit_wall
		btst.b	#aux_here_bit_num,3(a2)
		bne.s	.hit_aux

.do_next	sub.b	#10,fire_dist_vol(a0)
		bpl.s	.vol_ok
		clr.b	fire_dist_vol(a0)
.vol_ok		addq.w	#1,d0
		bra.s	.next
.hit_wall
		and.l	#keep_block,d2
		cmp.l	#(20<<block_shift)!keep_block_here_bit,d2
		beq.s	.hit_door
		cmp.l	#(21<<block_shift)!keep_block_here_bit,d2
		beq.s	.hit_door
		cmp.l	#(1<<block_shift)!keep_block_here_bit,d2
		beq.s	.hit_metal
		cmp.l	#(7<<block_shift)!keep_block_here_bit,d2
		beq.s	.hit_metal
		cmp.l	#(24<<block_shift)!keep_block_here_bit,d2
		blt.s	.no_hit
		cmp.l	#(27<<block_shift)!keep_block_here_bit,d2
		ble.s	.hit_metal
.no_hit		rts

.hit_metal
		st.b	fire_against_door(a0)
		rts
.hit_door
		move.l	(a2),d2
		and.l	#keep_variant,d2
		cmp.l	#(5<<variant_shift),d2
		bge.s	.do_next
		st.b	fire_against_door(a0)
		rts

.hit_aux
		move.l	#locn+locn_style,a3
		add.l	a5,a3
		cmp.b	#4,(a3)
		beq.s	.do_next

		move.l	(a2),d2

		and.l	#keep_aux!keep_aux_here_bit,d2
		cmp.l	#(0<<aux_shift)!keep_aux_here_bit,d2
		bne.s	.do_next

		rts

********************************************************************************

get_player_hit
		move.l	(a2),d0
		move.w	#block_shift,d1
		and.l	#keep_block,d0
		ror.l	d1,d0

		cmpi.b	#32,d0
		blt.s	.not_player
		cmpi.b	#47,d0
		bgt.s	.not_player

		move.l	(a2),d0
		andi.l	#keep_variant_player,d0
		move.w	#32-variant_shift,d6
		rol.l	d6,d0

		rts

.not_player	moveq.l	#-1,d0
		rts

********************************************************************************

get_sentry_hit
		move.l	(a2),d0
		move.w	#block_shift,d1
		and.l	#keep_block,d0
		ror.l	d1,d0

		cmpi.b	#24,d0
		blt.s	.not_sentry
		cmpi.b	#27,d0
		bgt.s	.not_sentry

		move.l	(a2),d0
		andi.l	#keep_variant_sentry,d0
		move.w	#32-variant_shift,d6
		rol.l	d6,d0

		rts

.not_sentry	moveq.l	#-1,d0
		rts

********************************************************************************

get_monster_hit
		move.l	(a2),d0

		move.l	a4,-(sp)
		jsr	find_monsters_owner
		move.l	(sp)+,a4

		move.l	d2,d0

		rts

********************************************************************************

get_egg_hit
		move.l	(a2),d0

		and.l	#keep_aux!keep_aux_here_bit,d0
                beq.s	.no_hit

		cmp.l	#(0<<aux_shift)!keep_aux_here_bit,d0
		bne.s	.no_hit

		moveq.l	#0,d0
		rts

.no_hit		moveq.l	#-1,d0
		rts

********************************************************************************

do_fx
		bsr	calc_weight

		clr.b	fire_ricochet(a0)

		tst.l	exchip_mem_base
		beq.s	.not_ex

		tst.w	item_exsample(a1)
		beq.s	.not_ex
		cmpi.w	#24,item_exsample(a1)
		bne.s	.ricochet1
		st.b	fire_ricochet(a0)
.ricochet1
		PLAY_EX_SAMPLE item_exsample(a1),aud_ch(a0),#63,item_exsampleperiod(a1)
		bra.s	.skip
.not_ex
		cmpi.b	#8,item_sample(a1)
		bne.s	.ricochet3
		bne.s	.ricochet3
		st.b	fire_ricochet(a0)
.ricochet3
		cmpi.b	#9,item_sample(a1)
		bne.s	.ricochet2
		st.b	fire_ricochet(a0)
.ricochet2
	IFD	CD32
		cmpi.b	#18,item_image(a1)
		bne.s	.not_blaster
		PLAY_EX_SAMPLE #30,aud_ch(a0),#63,#128
		bra.s	.skip
.not_blaster
	ENDC
		move.b	item_sample(a1),fire_sample(a0)
		move.w	item_sampleperiod(a1),fire_period(a0)
.skip
		bsr	get_dist

		move.b	d0,fire_dist(a0)
		move.b	item_anim(a1),fire_anim+1(a0)
		st.b	fire_splat(a0)
		move.b	item_animduration(a1),fire_duration(a0)
		bpl.s	.not_neg_1
		clr.w	fire_splat(a0)
		move.b	#1,fire_duration(a0)
.not_neg_1	move.w	item_animcolour(a1),fire_colour(a0)

		move.b	item_flashcolour(a1),fire_flash(a0)
		move.b	#5,fire_flash_dur(a0)

		cmpi.w	#1,window_type(a0)
		bne.s	.not_window2
		st.b	variables+redraw_flag(a5)
.not_window2
		rts

********************************************************************************
do_fireballs
		move.l	mem_position(a0),a3
		move.w	#20000,d2			;damage
		moveq.l	#1,d1				;speed
		moveq.l	#EXPL_DECAY,d4			;decay on

		move.b	(a1)+,d3			;fire front?
		beq.s	.no_front
		movem.l	a0-a3/d1-d5,-(sp)
		subi.b	#1,d3              		;density
		move.b	direction(a0),d0		;direction
		move.b	d0,d5				;no flameback
		bsr	chuck_fireball
		movem.l	(sp)+,a0-a3/d1-d5
.no_front
		move.b	(a1)+,d3			;fire rear?
		beq.s	.no_rear
		movem.l	a0-a3/d1-d5,-(sp)
		subi.b	#1,d3              		;density
		move.b	direction(a0),d0		;direction
		add.b	#2,d0
		cmpi.b	#3,d0
		ble.s	.rear_dir_ok
		sub.b	#3,d0
.rear_dir_ok	move.b	d0,d5				;no flameback
		bsr	chuck_fireball
		movem.l	(sp)+,a0-a3/d1-d5
.no_rear
		move.b	(a1)+,d3			;fire right?
		beq.s	.no_right
		movem.l	a0-a3/d1-d5,-(sp)
		subi.b	#1,d3              		;density
		move.b	direction(a0),d0		;direction
		add.b	#1,d0
		cmpi.b	#3,d0
		ble.s	.right_dir_ok
		sub.b	#3,d0
.right_dir_ok	move.b	d0,d5				;no flameback
		bsr	chuck_fireball
		movem.l	(sp)+,a0-a3/d1-d5
.no_right
		move.b	(a1)+,d3			;fire left?
		beq.s	.no_left
		movem.l	a0-a3/d1-d5,-(sp)
		subi.b	#1,d3              		;density
		move.b	direction(a0),d0		;direction
		subi.b	#1,d0
		cmpi.b	#3,d0
		ble.s	.left_dir_ok
		sub.b	#3,d0
.left_dir_ok	move.b	d0,d5				;no flameback
		bsr	chuck_fireball
		movem.l	(sp)+,a0-a3/d1-d5
.no_left
		move.b	(a1)+,d3			;fire down?
		beq.s	.no_down
		movem.l	a0-a3/d1-d5,-(sp)
		subi.b	#1,d3              		;density
		move.b	#5,d0				;direction
		move.b	d0,d5				;no flameback
		bsr	chuck_fireball
		movem.l	(sp)+,a0-a3/d1-d5
.no_down
		move.b	(a1)+,d3			;fire up?
		beq.s	.no_up
		movem.l	a0-a3/d1-d5,-(sp)
		subi.b	#1,d3              		;density
		move.b	#4,d0				;direction
		move.b	d0,d5				;no flameback
		bsr	chuck_fireball
		movem.l	(sp)+,a0-a3/d1-d5
.no_up
		rts

chuck_fireball
		movem.l	a1-a2/d1,-(sp)

		move.l	#locn,a1
		add.l	a5,a1

		move.l	a3,a2

		tst.b	d0
		bne.s	.not_fire_north
		suba.l	#map_cell_size*MAP_WIDTH,a3
.not_fire_north
		cmpi.b	#1,d0
		bne.s	.not_fire_east
		adda.l	#map_cell_size,a3
.not_fire_east
		cmpi.b	#2,d0
		bne.s	.not_fire_south
		adda.l	#map_cell_size*MAP_WIDTH,a3
.not_fire_south
		cmpi.b	#3,d0
		bne.s	.not_fire_west
		suba.l	#map_cell_size,a3
.not_fire_west
		move.l	(a3),d1
		btst.l	#opaque_bit_num,d1
		beq.s	.move
		move.l	a2,a3
		bra.s	.skip_door
.move
		and.l	#keep_block,d1
		beq.s	.skip_door
		cmp.l	#(4<<block_shift)!keep_block_here_bit,d1
		bne.s	.tree_not_opaque
		tst.b	locn_style(a1)
		beq.s	.tree_not_opaque
		cmpi.b	#2,locn_style(a1)
		beq.s	.tree_not_opaque
		move.l	a2,a3
		bra.s	.skip_door
.tree_not_opaque
		cmp.l	#(20<<block_shift)!keep_block_here_bit,d1
		beq.s	.door
		cmp.l	#(21<<block_shift)!keep_block_here_bit,d1
		bne.s	.skip_door
.door
		cmp.b	#1,locn_style(a1)
		beq.s	.skip_door
		cmp.b	#3,locn_style(a1)
		beq.s	.skip_door
		move.l	(a3),d1
		and.l	#keep_variant,d1
		cmp.l	#(5<<variant_shift),d1
		bge.s	.skip_door
		move.l	a2,a3
.skip_door
		movem.l	(sp)+,a1-a2/d1

		jsr	add_fireball
		rts

********************************************************************************
;a1=item struct
;a0=player struct
;a2=targets address

fire_missile
		bsr     get_player_hit
		tst.w	d0
		bpl	.player_hit
		bsr     get_monster_hit
		tst.w	d0
		bpl	.monster_hit
		bsr     get_sentry_hit
		tst.w	d0
		bpl	.sentry_hit
		bsr     get_egg_hit
		tst.w	d0
		bmi	.no_hit

.egg_hit
		move.l	a2,d5
		sub.l	#map+map_data1,d5
		sub.l	a5,d5
		divu	#map_cell_size*MAP_WIDTH*MAP_DEPTH,d5
		move.w	d5,d4
		swap	d5
		ext.l	d5
		divu	#map_cell_size*MAP_WIDTH,d5
		move.w	d5,d6
		swap	d5
		lsr.w	#2,d5

		movem.l	a0/a2,-(sp)

		moveq.l	#-1,d0
		move.l	a2,a1
		move.l	a2,a0

		add.l	#map_part_size,a0
		move.l	(a0),d2
		and.l	#keep_hatch_time,d2
		cmp.l	#(4093<<hatch_time_shift),d2
		beq.s	.hatch_no_monster		;branch if egg empty
		move.l	(a0),d2
		and.l	#keep_aux_data,d2

		move.l	a1,a0
		jsr	add_monster
.hatch_no_monster
		movem.l	(sp)+,a0/a2

		tst.l	d0
		bne.s	.hatch_too_many_monsters	;branch if 32 monsters out already

		and.l	#erase_aux,(a1)
		or.l	#(1<<aux_shift)!keep_aux_here_bit,(a1)	;change to an open egg
		add.l	#map_part_size,a1
		and.l	#erase_aux_data,(a1)
.hatch_too_many_monsters
		rts

.monster_hit
		move.l	a0,-(sp)

		mulu	#monster_size,d0
		lea	map+monsters(a5),a0
		add.w	d0,a0

		moveq.l	#0,d0
		move.b	itemgun_damageperhit(a1),d0
		moveq.l	#0,d2
		move.b	item_animduration(a1),d2
		mulu	d2,d0
		lsl.l	#8,d0
		lsl.l	#1,d0

		move.l	monster_type(a0),a2
		jsr	damage_monster_fitness

		move.l	(sp)+,a0

		tst.l	d0
		beq.s	.not_dead
		moveq.l	#0,d0
		move.w	mdfn_physique(a2),d0
		divu	#EXP_KILL,d0
		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a1
		add.w	d1,a1
		INCR_EXP d0,experience(a1)
.not_dead

		rts

.player_hit	move.w	d0,d1
		mulu	#player_struct_size,d0
		lea	variables+player1(a5,d0.w),a2

		moveq.l	#0,d0
		move.b	itemgun_damageperhit(a1),d0
		moveq.l	#0,d2
		move.b	item_animduration(a1),d2
		mulu	d2,d0
		lsl.l	#8,d0
		lsl.l	#1,d0

		movem.l	d0/a0-a2,-(sp)
		move.w	d1,d2
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a1
		add.w	d1,a1
		mulu	#player_struct_size,d2
		lea	variables+player1(a5),a0
		add.w	d2,a0
		jsr	damage_fitness
		movem.l	(sp)+,d0/a0-a2

		jsr	damage_inventory

		move.b	#5,fire_flash_dur(a2)
		move.b	#1,fire_flash(a2)
		st.b	variables+redraw_flag(a5)

.no_hit		rts

.sentry_hit
		move.l	a0,-(sp)

		mulu	#sn_struct_size,d0
		lea	sentries(a5),a0
		add.w	d0,a0

		moveq.l	#0,d0
		move.b	itemgun_damageperhit(a1),d0
		moveq.l	#0,d2
		move.b	item_animduration(a1),d2
		mulu	d2,d0
		lsl.l	#8,d0
		lsl.l	#1,d0

		jsr	damage_sentry_fitness

		move.l	(sp)+,a0
		rts

********************************************************************************
;a0=player struct
;a2=targets address
;d0=damage to inflict

blast
		move.l	d0,blast_damage(a5)

		bsr     get_player_hit
		tst.w	d0
		bpl	.player_hit
		bsr     get_monster_hit
		tst.w	d0
		bpl	.monster_hit
		bsr     get_sentry_hit
		tst.w	d0
		bpl	.sentry_hit
		bsr     get_egg_hit
		tst.w	d0
		bmi	.no_hit

.egg_hit	move.l	a2,d5
		sub.l	#map+map_data1,d5
		sub.l	a5,d5
		divu	#map_cell_size*MAP_WIDTH*MAP_DEPTH,d5
		move.w	d5,d4
		swap	d5
		ext.l	d5
		divu	#map_cell_size*MAP_WIDTH,d5
		move.w	d5,d6
		swap	d5
		lsr.w	#2,d5

		movem.l	a0/a2,-(sp)

		moveq.l	#-1,d0
		move.l	a2,a1
		move.l	a2,a0

		add.l	#map_part_size,a0
		move.l	(a0),d2
		and.l	#keep_hatch_time,d2
		cmp.l	#(4093<<hatch_time_shift),d2
		beq.s	.hatch_no_monster		;branch if egg empty
		move.l	(a0),d2
		and.l	#keep_aux_data,d2

		move.l	a1,a0
		jsr	add_monster
.hatch_no_monster
		movem.l	(sp)+,a0/a2

		tst.l	d0
		bne.s	.hatch_too_many_monsters	;branch if 32 monsters out already

		and.l	#erase_aux,(a1)
		or.l	#(1<<aux_shift)!keep_aux_here_bit,(a1)	;change to an open egg
		add.l	#map_part_size,a1
		and.l	#erase_aux_data,(a1)
.hatch_too_many_monsters
		rts

.monster_hit
		move.l	a0,-(sp)

		mulu	#monster_size,d0
		lea	map+monsters(a5),a0
		add.w	d0,a0

		move.l	blast_damage(a5),d0

		move.l	monster_type(a0),a2
		jsr	damage_monster_fitness

		move.l	(sp)+,a0

		tst.l	d0
		beq.s	.not_dead
		moveq.l	#0,d0
		move.w	mdfn_physique(a2),d0
		divu	#EXP_KILL,d0
		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a1
		add.w	d1,a1
		INCR_EXP d0,experience(a1)
.not_dead

		rts

.player_hit	move.w	d0,d1
		mulu	#player_struct_size,d0
		lea	variables+player1(a5,d0.w),a2

		move.l	blast_damage(a5),d0

		movem.l	d0/a0-a2,-(sp)
		move.w	d1,d2
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a1
		add.w	d1,a1
		mulu	#player_struct_size,d2
		lea	variables+player1(a5),a0
		add.w	d2,a0
		jsr	damage_fitness
		movem.l	(sp)+,d0/a0-a2

		move.b	#5,fire_flash_dur(a2)
		move.b	#1,fire_flash(a2)
		st.b	variables+redraw_flag(a5)

.no_hit		rts

.sentry_hit
		move.l	a0,-(sp)

		mulu	#sn_struct_size,d0
		lea	sentries(a5),a0
		add.w	d0,a0

		move.l	blast_damage(a5),d0

		jsr	damage_sentry_fitness

		move.l	(sp)+,a0
		rts

********************************************************************************
********************************************************************************
********************************************************************************

psi_table
		bra.w	.fireball	;0
		bra.w	.inferno	;2
		bra.w	.blast		;4
		bra.w	.devastate	;6
		bra.w	.fireshield	;8
		bra.w	.shield		;10
		bra.w	.granite_str	;12
		bra.w	.titanium_str	;14
		bra.w	.wall		;16
		bra.w	.banish_wall	;18
		bra.w	.bridge		;20
		bra.w	.float		;22
		bra.w	.feather	;24
		bra.w	.sonic_blast	;26
		bra.w	.shock_blast	;28
		bra.w	.gills		;30
		bra.w	.part_waves	;32
		bra.w	.quench		;34
		bra.w	.water_tight	;36
		bra.w	.electrify
		bra.w	.lightning
		bra.w	.fry
		bra.w	.farsight
		bra.w	.teleport
		bra.w	.shift
		bra.w	.cure_poison
		bra.w	.heal
		bra.w	.transmute
		bra.w	.miracle

********************************************************************************
.fireball
		tst.b	dofx(a0)
		beq.s	.fireball_nofx
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
.fireball_nofx
		move.l	mem_position(a0),a3
		move.w	#20000,d2			;damage
		moveq.l	#0,d1				;speed
		moveq.l	#EXPL_DECAY,d4			;decay on
		move.b	#1,d3				;density
		move.b	direction(a0),d0		;direction
		move.b	d0,d5				;no flameback
		jsr	chuck_fireball

		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.w	d1,a2
		INCR_EXP #EXP_PSI,experience(a2)

		rts

********************************************************************************
.inferno
		tst.b	dofx(a0)
		beq.s	.inferno_nofx
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
.inferno_nofx
		move.l	mem_position(a0),a3
		move.w	#20000,d2			;damage
		moveq.l	#0,d1				;speed
		moveq.l	#EXPL_DECAY,d4			;decay on
		move.b	#3,d3				;density
		move.b	direction(a0),d0		;direction
		move.b	d0,d5				;no flameback
		jsr	chuck_fireball

		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.w	d1,a2
		INCR_EXP #EXP_PSI,experience(a2)

		rts

********************************************************************************
.blast
		tst.b	dofx(a0)
		beq.s	.blast_nofx
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
.blast_nofx
		move.l	mem_position(a0),a3
		move.w	#20000,d2			;damage
		moveq.l	#0,d1				;speed
		moveq.l	#EXPL_DECAY,d4			;decay on
		move.b	#1,d3				;density
		moveq.l	#3,d0				;direction
		move.b	d0,d5				;no flameback
.next_blast
		movem.l	a3/d0-d5,-(sp)
		jsr	chuck_fireball
		movem.l	(sp)+,a3/d0-d5

		dbf     d0,.next_blast

		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.w	d1,a2
		INCR_EXP #EXP_PSI,experience(a2)

		rts

********************************************************************************
.devastate
		tst.b	dofx(a0)
		beq.s	.devastate_nofx
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
.devastate_nofx
		move.l	mem_position(a0),a3
		move.w	#20000,d2			;damage
		moveq.l	#0,d1				;speed
		moveq.l	#EXPL_NO_DECAY,d4		;decay off!!!!!!
		move.b	#3,d3				;density
		moveq.l	#3,d0				;direction
		move.b	d0,d5				;no flameback
.next_devastate
		movem.l	a3/d0-d5,-(sp)
		jsr	chuck_fireball
		movem.l	(sp)+,a3/d0-d5

		dbf     d0,.next_devastate

		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.w	d1,a2
		INCR_EXP #EXP_PSI,experience(a2)

		rts

********************************************************************************
.fireshield
		move.w	#3000,icon_shield_dur(a0)
		move.w	d1,spell_shield(a0)

		tst.b	dofx(a0)
		beq.s	.fireshield_nofx
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
.fireshield_nofx

		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.w	d1,a2
		INCR_EXP #EXP_PSI,experience(a2)

		rts

********************************************************************************
.shield
		move.w	#3000,icon_shield_dur(a0)
		move.w	d1,spell_shield(a0)

		tst.b	dofx(a0)
		beq.s	.shield_nofx
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
.shield_nofx
		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.w	d1,a2
		INCR_EXP #EXP_PSI,experience(a2)

		rts

********************************************************************************
.granite_str
		tst.b	dofx(a0)
		beq.s	.granite_str_nofx
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
.granite_str_nofx
		move.w	player_num(a0),d0
		mulu	#stats_struct_size,d0
		lea	global_vars+player1_stats(a5),a1
		add.l	d0,a1

		moveq.l	#0,d0
		move.w	spell_weights(a0),d0
		beq.s	.no_granite_already
		jsr	decr_physique
.no_granite_already

		move.w	#3000,icon_weights_dur(a0)
		moveq.l	#0,d0
		move.w	physique(a1),d0
		lsr.w	#1,d0
		move.w	d0,spell_weights(a0)
		jsr	incr_physique

		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.w	d1,a2
		INCR_EXP #EXP_PSI,experience(a2)

		rts

********************************************************************************
.titanium_str
		tst.b	dofx(a0)
		beq.s	.titanium_str_nofx
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
.titanium_str_nofx
		move.w	player_num(a0),d0
		mulu	#stats_struct_size,d0
		lea	global_vars+player1_stats(a5),a1
		add.l	d0,a1

		moveq.l	#0,d0
		move.w	spell_weights(a0),d0
		beq.s	.no_titanium_already
		jsr	decr_physique
.no_titanium_already

		move.w	#3000,icon_weights_dur(a0)
		moveq.l	#0,d0
		move.w	physique(a1),d0
		move.w	d0,spell_weights(a0)
		jsr	incr_physique

		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.w	d1,a2
		INCR_EXP #EXP_PSI,experience(a2)

		rts

********************************************************************************
.wall
		move.l	mem_position(a0),a3

		tst.b	direction(a0)
		bne.s	.not_wall_north
		btst.b	#block_here_bit_num,-map_cell_size*MAP_WIDTH+3(a3)
		bne	.wall_blocked
		and.l	#erase_block,-map_cell_size*MAP_WIDTH(a3)
		or.l	#(5<<block_shift)!keep_block_here_bit,-map_cell_size*MAP_WIDTH(a3)
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
		bra	.wall_ret
.not_wall_north
		cmpi.b	#1,direction(a0)
		bne.s	.not_wall_east
		btst.b	#block_here_bit_num,map_cell_size+3(a3)
		bne	.wall_blocked
		and.l	#erase_block,map_cell_size(a3)
		or.l	#(5<<block_shift)!keep_block_here_bit,map_cell_size(a3)
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
		bra	.wall_ret
.not_wall_east
		cmpi.b	#2,direction(a0)
		bne.s	.not_wall_south
		btst.b	#block_here_bit_num,map_cell_size*MAP_WIDTH+3(a3)
		bne.s	.wall_blocked
		and.l	#erase_block,map_cell_size*MAP_WIDTH(a3)
		or.l	#(5<<block_shift)!keep_block_here_bit,map_cell_size*MAP_WIDTH(a3)
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
		bra	.wall_ret
.not_wall_south
		cmpi.b	#3,direction(a0)
		bne.s	.not_wall_west
		btst.b	#block_here_bit_num,-map_cell_size+3(a3)
		bne.s	.wall_blocked
		and.l	#erase_block,-map_cell_size(a3)
		or.l	#(5<<block_shift)!keep_block_here_bit,-map_cell_size(a3)

		tst.b	dofx(a0)
		beq.s	.wall_nofx
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
.wall_nofx
.not_wall_west
.wall_ret
		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.w	d1,a2
		INCR_EXP #EXP_PSI,experience(a2)

		rts

.wall_blocked
		move.w	#150,invalid_count(a0)
		rts

********************************************************************************
.banish_wall
		move.l	mem_position(a0),a3

		tst.b	direction(a0)
		bne.s	.not_banish_north
		suba.l	#map_cell_size*MAP_WIDTH,a3
.not_banish_north
		cmpi.b	#1,direction(a0)
		bne.s	.not_banish_east
		adda.l	#map_cell_size,a3
.not_banish_east
		cmpi.b	#2,direction(a0)
		bne.s	.not_banish_south
		adda.l	#map_cell_size*MAP_WIDTH,a3
.not_banish_south
		cmpi.b	#3,direction(a0)
		bne.s	.not_banish_west
		suba.l	#map_cell_size,a3
.not_banish_west
		move.l	(a3),d0
		and.l	#keep_block,d0
		cmp.l	#(5<<block_shift)!keep_block_here_bit,d0
		bne.s	.no_banish
		and.l	#erase_block,(a3)

		tst.b	dofx(a0)
		beq.s	.banish_wall_nofx
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
.banish_wall_nofx
		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.w	d1,a2
		INCR_EXP #EXP_PSI,experience(a2)

		rts

.no_banish
		move.w	#150,invalid_count(a0)
		rts

********************************************************************************
.bridge
		move.l	mem_position(a0),a3

		tst.b	direction(a0)
		bne.s	.not_bridge_north
		btst.b	#floor_here_bit_num,-map_cell_size*MAP_WIDTH+3(a3)
		bne	.bridge_blocked
		btst.b	#opaque_bit_num,-map_cell_size*MAP_WIDTH*MAP_DEPTH-map_cell_size*MAP_WIDTH+3(a3)
		bne	.bridge_blocked
		and.l	#erase_floor,-map_cell_size*MAP_WIDTH(a3)
		or.l	#(2<<floor_shift)!keep_floor_here_bit,-map_cell_size*MAP_WIDTH(a3)
		bra	.do_bridge
.not_bridge_north
		cmpi.b	#1,direction(a0)
		bne.s	.not_bridge_east
		btst.b	#floor_here_bit_num,map_cell_size+3(a3)
		bne	.bridge_blocked
		btst.b	#opaque_bit_num,-map_cell_size*MAP_WIDTH*MAP_DEPTH+map_cell_size+3(a3)
		bne	.bridge_blocked
		and.l	#erase_floor,map_cell_size(a3)
		or.l	#(2<<floor_shift)!keep_floor_here_bit,map_cell_size(a3)
		bra	.do_bridge
.not_bridge_east
		cmpi.b	#2,direction(a0)
		bne.s	.not_bridge_south
		btst.b	#floor_here_bit_num,map_cell_size*MAP_WIDTH+3(a3)
		bne.s	.bridge_blocked
		btst.b	#opaque_bit_num,-map_cell_size*MAP_WIDTH*MAP_DEPTH+map_cell_size*MAP_WIDTH+3(a3)
		bne.s	.bridge_blocked
		and.l	#erase_floor,map_cell_size*MAP_WIDTH(a3)
		or.l	#(2<<floor_shift)!keep_floor_here_bit,map_cell_size*MAP_WIDTH(a3)
		bra	.do_bridge
.not_bridge_south
		cmpi.b	#3,direction(a0)
		bne.s	.not_bridge_west
		btst.b	#floor_here_bit_num,-map_cell_size+3(a3)
		bne.s	.bridge_blocked
		btst.b	#opaque_bit_num,-map_cell_size*MAP_WIDTH*MAP_DEPTH-map_cell_size+3(a3)
		bne.s	.bridge_blocked
		and.l	#erase_floor,-map_cell_size(a3)
		or.l	#(2<<floor_shift)!keep_floor_here_bit,-map_cell_size(a3)

.do_bridge
		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.w	d1,a2
		INCR_EXP #EXP_PSI,experience(a2)

		tst.b	dofx(a0)
		beq.s	.bridge_nofx
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
.bridge_nofx
.not_bridge_west
.bridge_ret
		rts
.bridge_blocked
		move.w	#150,invalid_count(a0)
		rts

********************************************************************************
.float
;not used

********************************************************************************
.feather
		move.w	#12000,icon_wings_dur(a0)
		move.w	#24,spell_wings(a0)
		bsr	calc_weight
		st.b	variables+redraw_flag(a5)

		tst.b	dofx(a0)
		beq.s	.feather_nofx
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
.feather_nofx

		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.w	d1,a2
		INCR_EXP #EXP_PSI,experience(a2)

		rts

********************************************************************************
.sonic_blast
		tst.b	dofx(a0)
		beq.s	.sonic_blast_nofx
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
.sonic_blast_nofx
		move.l	#20000,d0

		move.b	#17,shake_power(a5)
		move.b	#0,shake_x(a5)
		move.b	#0,shake_y(a5)
		move.b	#0,shake_z(a5)

		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.w	d1,a2
		INCR_EXP #EXP_PSI,experience(a2)

		bra.s	.do_blast

.do_blast	move.w	#-3,d3
.next_sonic_z	move.w	#-3,d2
.next_sonic_y	move.w	#-3,d1
.next_sonic_x
		movem.l	d0-d3,-(sp)
		move.l	mem_position(a0),a2
		muls.w	#map_cell_size,d1
		muls.w	#map_cell_size*MAP_WIDTH,d2
		muls.w	#map_cell_size*MAP_WIDTH*MAP_DEPTH,d3
		add.l	d1,a2
		add.l	d2,a2
		add.l	d3,a2

		tst.l	d1
		bne.s	.do_sonic_blast
		tst.l	d2
		bne.s	.do_sonic_blast
		tst.l	d3
		beq.s	.skip_sonic_blast
.do_sonic_blast	bsr	blast
.skip_sonic_blast
		movem.l	(sp)+,d0-d3

		addq.w	#1,d1
		cmp.w	#3,d1
		ble.s	.next_sonic_x

		addq.w	#1,d2
		cmp.w	#3,d2
		ble.s	.next_sonic_y

		addq.w	#1,d3
		cmp.w	#3,d3
		ble.s	.next_sonic_z

		rts

********************************************************************************
.shock_blast
		tst.b	dofx(a0)
		beq.s	.shock_blast_nofx
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
.shock_blast_nofx
		move.l	#40000,d0

		move.b	#1,shake_power(a5)
		move.b	#0,shake_x(a5)
		move.b	#0,shake_y(a5)
		move.b	#0,shake_z(a5)

		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.w	d1,a2
		INCR_EXP #EXP_PSI,experience(a2)

		bra	.do_blast

********************************************************************************
.gills
		move.w	#12000,icon_water_dur(a0)
		move.w	d1,spell_water(a0)

		tst.b	dofx(a0)
		beq.s	.gills_nofx
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
.gills_nofx
		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.w	d1,a2
		INCR_EXP #EXP_PSI,experience(a2)

		rts

********************************************************************************
.part_waves
		move.l	mem_position(a0),a2

		moveq.l	#0,d1

		move.l	(a2),d0
		and.l	#keep_water,d0
		beq	.cont_part_waves
		bsr	.cleave_wave
		moveq.l	#1,d1
		bra	.cont_part_waves
.next_part_waves
		move.l	(a2),d0
		and.l	#keep_water,d0
		beq.s	.end_part_waves
		bsr	.cleave_wave
		moveq.l	#1,d1
.cont_part_waves
		tst.b	direction(a0)
		bne.s	.not_part_waves_north
		suba.l	#map_cell_size*MAP_WIDTH,a2
.not_part_waves_north
		cmpi.b	#1,direction(a0)
		bne.s	.not_part_waves_east
		adda.l	#map_cell_size,a2
.not_part_waves_east
		cmpi.b	#2,direction(a0)
		bne.s	.not_part_waves_south
		adda.l	#map_cell_size*MAP_WIDTH,a2
.not_part_waves_south
		cmpi.b	#3,direction(a0)
		bne.s	.not_part_waves_west
		suba.l	#map_cell_size,a2
.not_part_waves_west
		bra	.next_part_waves
.end_part_waves
		tst.l	d1
		beq.s	.no_part_waves

		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.w	d1,a2
		INCR_EXP #EXP_PSI,experience(a2)

		tst.b	dofx(a0)
		beq.s	.part_waves_nofx
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
.part_waves_nofx
		rts
.no_part_waves
		move.w	#150,invalid_count(a0)
		rts

.cleave_wave	movem.l	a2-a3,-(sp)
		move.l	a2,a3
		add.l	#map_part_size,a3

.next_cleave	btst.b	#water_here_bit_num,3(a2)
		bne.s	.do_cleave
		btst.b	#flowing_bit_num-8,2(a3)
		beq.s	.end_cleave
.do_cleave
		and.l	#erase_water,(a2)
		and.l	#erase_flowing_bit,(a3)

		add.l	#map_cell_size*MAP_WIDTH*MAP_DEPTH,a2
		add.l	#map_cell_size*MAP_WIDTH*MAP_DEPTH,a3
		bra.s	.next_cleave

.end_cleave	movem.l	(sp)+,a2-a3
		rts

********************************************************************************
.quench
		move.l	mem_position(a0),a1
		move.l	(a1),d0
		btst.l	#water_here_bit_num,d0
		beq.s	.no_quench
		btst.l	#aux_here_bit_num,d0
		bne.s	.no_quench
		btst.l	#floor_here_bit_num,d0
		bne.s	.do_quench
		sub.l	#map_cell_size*MAP_WIDTH*MAP_DEPTH,a1
		move.l	(a1),d0
		btst.l	#opaque_bit_num,d0
		beq.s	.no_quench
.do_quench
		move.l	mem_position(a0),a1
		and.l	#erase_aux,(a1)
		or.l	#(CONT_CONSUMABLE<<aux_shift)!keep_aux_here_bit,(a1)
		add.l	#map_part_size*2,a1
		and.l	#erase_item_type&erase_item_damage&erase_item_ammo,(a1)
		or.l	#(56<<item_type_shift)!(0<<item_damage_shift)!(0<<item_ammo_shift),(a1)

		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.w	d1,a2
		INCR_EXP #EXP_PSI,experience(a2)

		tst.b	dofx(a0)
		beq.s	.quench_nofx
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
.quench_nofx
		rts
.no_quench
		move.w	#150,invalid_count(a0)
		rts

********************************************************************************
.water_tight
		move.w	#12000,icon_water_dur(a0)
		move.w	d1,spell_water(a0)

		tst.b	dofx(a0)
		beq.s	.water_tight_nofx
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
.water_tight_nofx
		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.w	d1,a2
		INCR_EXP #EXP_PSI,experience(a2)

		rts

********************************************************************************
.electrify
		tst.b	dofx(a0)
		beq.s	.electrify_nofx
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
.electrify_nofx
		move.l	#10000,d0

		move.l	a2,-(sp)
		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.w	d1,a2
		INCR_EXP #EXP_PSI,experience(a2)
		move.l	(sp)+,a2

		bsr	blast

		rts

********************************************************************************
.lightning
		tst.b	dofx(a0)
		beq.s	.lightning_nofx
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
.lightning_nofx
		move.l	#30000,d0

		move.l	a2,-(sp)
		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.w	d1,a2
		INCR_EXP #EXP_PSI,experience(a2)
		move.l	(sp)+,a2

		bsr	blast

		rts

********************************************************************************
.fry
		tst.b	dofx(a0)
		beq.s	.fry_nofx
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
.fry_nofx
		move.l	#60000,d0

		move.l	a2,-(sp)
		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.w	d1,a2
		INCR_EXP #EXP_PSI,experience(a2)
		move.l	(sp)+,a2

		bsr	blast

		rts

********************************************************************************
.farsight
		tst.b	dofx(a0)
		beq.s	.farsight_nofx
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
.farsight_nofx
		move.l	#map+map_data1+map_part_size,a1
		add.l   a5,a1
		moveq.l	#0,d0
		move.b	floor(a0),d0
		mulu.w	#MAP_WIDTH*MAP_DEPTH*map_cell_size,d0
		add.l	d0,a1

		move.w	#MAP_WIDTH*MAP_DEPTH-1,d0
		moveq.l	#0,d1
		move.w	seen_bit_num(a0),d2
		bset.l	d2,d1

.next_farsight
                or.l	d1,(a1)+
		dbf	d0,.next_farsight

		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.w	d1,a2
		INCR_EXP #EXP_PSI,experience(a2)

		rts

********************************************************************************
.teleport
		andi.l	#erase_person,(a2)		;remove person

		moveq.l	#100,d3				;try 100 times

.next_teleport
		move.w	variables+random_num(a5),d0
		mulu	#67,d0
		rol.w	#3,d0
		move.w	d0,variables+random_num(a5)
		and.l	#$ffff,d0
		divu	#23,d0
                swap	d0
		move.b	d0,xpos(a0)

		move.w	variables+random_num(a5),d0
		mulu	#47,d0
		rol.w	#6,d0
		move.w	d0,variables+random_num(a5)
		and.l	#$ffff,d0
		divu	#23,d0
                swap	d0
		move.b	d0,ypos(a0)

		move.w	variables+random_num(a5),d0
		mulu	#77,d0
		rol.w	#5,d0
		move.w	d0,variables+random_num(a5)
		and.l	#$ffff,d0
		divu	#20,d0
                swap	d0
		move.b	d0,floor(a0)

		move.b	floor(a0),d0
		ext.w	d0
		mulu.w	#MAP_WIDTH*MAP_DEPTH*map_cell_size,d0
		move.b	ypos(a0),d1
		ext.w	d1
		mulu.w	#MAP_WIDTH,d1
		move.b	xpos(a0),d2
		ext.w	d2
		add.w	d2,d1
		lsl.w	#2,d1
		ext.l	d1
		add.l	d1,d0
                move.l	#map+map_data1,a2
		add.l	a5,a2
		add.l	d0,a2

		btst.b	#block_here_bit_num,3(a2)
		bne.s	.retry_teleport

		btst.b	#explosion_here_bit_num,3(a2)
		bne.s	.retry_teleport

		btst.b	#opaque_bit_num,3(a2)
		bne.s	.retry_teleport

		btst.b	#floor_here_bit_num,3(a2)
		bne.s	.ok_teleport

		btst.b	#opaque_bit_num,-map_cell_size*MAP_WIDTH*MAP_DEPTH+3(a2)
		beq.s	.retry_teleport

		btst.b	#block_here_bit_num,-map_cell_size*MAP_WIDTH*MAP_DEPTH+3(a2)
		bne.s	.ok_teleport
.retry_teleport
		dbf	d3,.next_teleport

		move.w	#150,blocked_count(a0)
		rts
.ok_teleport
		move.l	a2,mem_position(a0)
		bsr	put_head_in_map

		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.w	d1,a2
		INCR_EXP #EXP_PSI,experience(a2)

		tst.b	dofx(a0)
		beq.s	.teleport_nofx
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
.teleport_nofx

		move.l	#miscsfx,a1
		add.l	chip_mem_base,a1
		PLAY_SAMPLE a1,#3,aud_ch(a0),#63,#683

		move.b	#10,fire_flash_dur(a0)
		move.b	#17,fire_flash(a0)

		jsr	test_mine

		rts

********************************************************************************
.shift
;not used

********************************************************************************
.cure_poison
		tst.b	dofx(a0)
		beq.s	.cure_nofx
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
.cure_nofx
		clr.w	poisoned_strength(a0)
		clr.w	poisoned(a0)
		clr.w	poisoned_total(a0)

		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.w	d1,a2
		INCR_EXP #EXP_PSI,experience(a2)

		rts

********************************************************************************
.heal
		tst.b	dofx(a0)
		beq.s	.heal_nofx
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
.heal_nofx
		move.w	player_num(a0),d0
		mulu	#stats_struct_size,d0
		lea	global_vars+player1_stats(a5),a1
		add.l	d0,a1

		move.w	#65535,fitness(a1)

		clr.w	poisoned_strength(a0)
		clr.w	poisoned(a0)
		clr.w	poisoned_total(a0)

		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.w	d1,a2
		INCR_EXP #EXP_PSI,experience(a2)

		rts

********************************************************************************
.transmute
		move.w	inven_posn(a0),d1
		mulu.w	#inven_item_size,d1
		lea	inven_store(a0),a1
		tst.b	inven_item_num(a1,d1.w)
		beq.s	.transmute_invalid

		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.w	d1,a2
		INCR_EXP #EXP_PSI,experience(a2)

		tst.b	dofx(a0)
		beq.s	.transmute_nofx
		bsr	do_fx
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
.transmute_nofx
		move.w	variables+random_num(a5),d0
		mulu	#77,d0
		rol.w	#5,d0
		move.w	d0,variables+random_num(a5)
		and.l	#$ffff,d0
		divu	#11,d0
                swap	d0
		add.w	#54,d0

		move.w	inven_posn(a0),d1
		mulu.w	#inven_item_size,d1
		lea	inven_store(a0),a1
		move.b	d0,inven_item_num(a1,d1.w)
		move.b	#0,inven_item_damage(a1,d1.w)
		move.b	#0,inven_item_gun_ammo(a1,d1.w)
		move.b	#0,inven_item_outlined(a1,d1.w)

		rts

.transmute_invalid
		move.w	#150,invalid_count(a0)
		rts

********************************************************************************
.miracle
		move.w	variables+random_num(a5),d0
		mulu	#77,d0
		rol.w	#5,d0
		move.w	d0,variables+random_num(a5)
		and.l	#$ffff,d0
		divu	#28,d0
                swap	d0
		add.w	#82,d0
		ext.l	d0

		move.l	d0,d1
		sub.l	#82,d0

		lea	psi_table(pc),a3
		lsl.w	#2,d0
		jmp	0(a3,d0.w)
