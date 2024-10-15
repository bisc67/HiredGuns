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

********************************************************************************
********************************** Hatch eggs **********************************
********************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:       none
hatch_eggs
		move.w	hatch_count,d0
		cmpi.w	#5,d0
		blt.s	.skip_hatch
		bsr	do_hatch
		subi.w	#5,hatch_count
		bra.s	hatch_eggs
.skip_hatch
		rts

do_hatch	lea	map(a5),a0
		move.l	a0,a1
		add.l	#map_data1,a0
		add.l	#map_data2,a1

		move.w	variables+hatch_level(a5),d4
		move.w	variables+hatch_line(a5),d6

		move.w	d4,d0
		mulu	#MAP_WIDTH*MAP_DEPTH*map_cell_size,d0
		move.w	d6,d1
		mulu	#MAP_WIDTH*map_cell_size,d1
		add.l	d1,d0
		add.l	d0,a0				;address of level on part 1
		add.l	d0,a1				;address of level on part 2

		move.w	#aux_data_shift,d2
		move.w	#32-hatch_time_shift,d3
		moveq.l	#0,d5				;current x co

.loop		btst.b	#aux_here_bit_num,3(a0)
		beq	.not_egg			;branch if no aux block

		move.l	(a0),d1
		and.l	#erase_aux_here_bit,d1
		and.l	#keep_aux,d1
		bne.s	.not_egg			;branch if aux is not an egg

		bsr	examine_egg

.not_egg	addq.l	#4,a0
		addq.l	#4,a1
		addq.w	#1,d5
		cmpi.w	#MAP_WIDTH,d5
		blt.s	.loop

		addq.w	#1,d6
		cmp.w	#MAP_DEPTH,d6
		blt.s	.y_ok				;branch if not end of vert
		moveq.l	#1,d6

		addq.w	#1,d4
		cmpi.w	#MAP_HEIGHT,d4
		blt.s	.z_ok
		moveq.l	#1,d4
.z_ok		move.w	d4,variables+hatch_level(a5)

.y_ok		move.w	d6,variables+hatch_line(a5)

		rts

examine_egg	move.l	(a1),d2
		and.l	#keep_aux_data,d2		;d2=type of monster

		move.l	(a1),d1
		and.l	#keep_hatch_time,d1
		rol.l   d3,d1
		cmpi.w	#4093,d1
		beq	.ret
		cmpi.w	#4095,d1
		beq	.ret
		cmpi.w	#4094,d1
		bne	.not_random
		move.w	variables+random_num(a5),d1
		and.l	#%111111111111,d1
.not_random	mulu	#20*50,d1
		cmp.w	timer,d1
		bhi	.ret

.hatch		btst.b	#block_here_bit_num,3(a0)
		bne.s	.ret				;branch if no room to hatch

		bsr	add_monster
		tst.l	d0
		bne.s	.ret				;branch if 32 monsters out already
		and.l	#erase_aux,(a0)
		and.l	#erase_aux_data,(a1)

		add.l	#map_part_size,a1
		btst.b	#32-remove_egg_bit_num,(a1)
		bne.s	.remove_egg
		or.l	#(1<<aux_shift)!keep_aux_here_bit,(a0)	;change to an open egg

		move.l  a0,d1
		sub.l	a5,d1
		subi.l	#map+map_data1,d1
		move.w	d1,variables+fx_position(a5)
		move.b	#5,variables+fx_sample(a5)
		move.w	#0,variables+fx_channel(a5)
		move.w	#360,variables+fx_period(a5)

.remove_egg	st.b	variables+redraw_flag(a5)
		suba.l	#map_part_size,a1

.ret		rts

********************************************************************************
;INPUT		a5=base address of fast memory (long)
;		a0=memory posn
;		d2=monster type number
;		d4=floor
;		d5=x
;		d6=y
;OUTPUT:        d0=error code (0=ok, -1=too many monsters)
;CHANGES:	none
add_monster
		movem.l	d1-d3/d7/a0-a4,-(sp)

		tst.b	d4
		bmi.s	.error
		tst.b	d5
		bmi.s	.error
		tst.b	d6
		bmi.s	.error
		cmpi.b	#19,d4
		bgt.s	.error
		cmpi.b	#22,d5
		bgt.s	.error
		cmpi.b	#22,d6
		bgt.s	.error

		moveq.l	#aux_data_shift,d0
		ror.l	d0,d2
		mulu	#mdfn_size,d2
		lea	0(a5,d2.w),a2
		add.l	#monsters_defns,a2	;address of monster type data

		lea	map+monsters(a5),a3	;address of active monster list

		moveq.l	#0,d7

.next_entry	tst.l	monster_type(a3)
		beq.s	.found_space

		add.w	#monster_size,a3
		addq.w	#1,d7
		cmpi.w	#num_monsters,d7
		blt.s	.next_entry

.error		movem.l	(sp)+,d1-d3/d7/a0-a4
		moveq.l	#-1,d0			;flag error
		rts

.found_space
		move.l	a2,monster_type(a3)
		move.l	a0,monster_posn(a3)
		move.w	#65535,monster_fitness(a3)
		move.b	#0,monster_direct(a3)
		move.b	d5,monster_x(a3)
		move.b	d6,monster_y(a3)
		move.b	d4,monster_floor(a3)
		move.b	#4,monster_dr(a3)
		move.b	mdfn_speed(a2),monster_count(a3)
		clr.b	monster_white(a3)

		move.w	variables+random_num(a5),d0
		mulu	#47,d0
		rol.w	#8,d0
		move.w	d0,variables+random_num(a5)
		andi.w	#%11,d0			;face random direction

		move.l	a2,a4
		bsr	put_monster_in_map

.no_error	movem.l	(sp)+,d1-d3/d7/a0-a4
		moveq.l	#0,d0			;flag no error
		rts

fucked_monster
		jsr	kill_screen
		move.w	#150,d0
.f_loop		move.w	#$fff,color00(a6)
		WAIT_VBLANK
		dbf	d0,.f_loop
		jsr	restore_system
		move.l	stack_ptr,a7
		moveq.l	#-1,d0
		rts

********************************************************************************
********************************* Monster Movement *****************************
********************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:       none
move_monsters
		move.l	a4,-(sp)

		move.w	mons_count,d0
		cmpi.w	#10,d0
		bhi	.do_monsters

		move.l	(sp)+,a4
		rts

.do_monsters	subi.w	#10,mons_count
		jsr	move_sentries

;-------------------------------------------------------------------------------

		lea	map+monsters(a5),a3
		move.w	#num_monsters-1,d7

.next_monster	tst.l	monster_type(a3)
		beq	.next

		move.l	monster_type(a3),a4

		tst.b	monster_stun_count(a3)
		beq.s	.not_stunned
		subi.b	#1,monster_stun_count(a3)
		bra.s	.put
.not_stunned
		tst.b	monster_count(a3)
		bmi.s	.doesnt_move
		subi.b	#1,monster_count(a3)
		bne.s	.next
		move.b	mdfn_speed(a4),monster_count(a3)
.doesnt_move
		bsr	find_closest_player	;d3=dist to player, a0=player (0=none)
		cmpa.l	#0,a0
		beq	.next

		tst.b	mdfn_speed(a4)		;sentry gun?
		bmi.s	.reasess		;yes, then cant attack hand-to-hand
		cmp.w	#1,d3
		bgt	.skip_reasess
		move.b	#4,monster_dr(a3)
		bra.s	.do_move_towards
.reasess	move.b	#4,monster_dr(a3)
.skip_reasess
		tst.b	mdfn_fireball(a4)
		beq.s	.no_fireball
		bsr	monster_fire_fireball
		tst.w	d0
		bne	.next			;end if fireball fired
.no_fireball
		move.w	mdfn_bravery(a4),d1
		cmp.w	monster_fitness(a3),d1
		bls	.do_move_towards
		bsr	move_away
		bra.s	.skip_move_towards
.do_move_towards
		bsr	move_towards
.skip_move_towards

;-------------------------------------------------------------------------------

.put		bsr	put_monster_in_map

.next		add.w	#monster_size,a3
		dbf	d7,.next_monster
		move.l	(sp)+,a4
		rts

********************************************************************************
********************************************************************************
********************************************************************************

move_towards	move.b	monster_dr(a3),d1
		cmpi.b	#4,d1
		blt	do_movement
		cmpi.b	#5,d1
		beq	random_direction
		clr.b	monster_dr(a3)

		move.b	xpos(a0),d1
		cmp.b	monster_x(a3),d1
		blt.s	.146
		beq.s	.27
.356		move.b	ypos(a0),d1
		cmp.b	monster_y(a3),d1
		blt.s	.3
		beq.s	.5
		bra.s	.8
.146		move.b	ypos(a0),d1
		cmp.b	monster_y(a3),d1
		blt.s	.1
		beq.s	.4
		bra.s	.6
.27		move.b	ypos(a0),d1
		cmp.b	monster_y(a3),d1
		blt.s	.2
		bra.s	.7

.1		move.l	#$00030105,monster_move(a3)
		bra	do_movement
.2		move.l	#$00030105,monster_move(a3)
		bra	do_movement
.3		move.l	#$00010305,monster_move(a3)
		bra	do_movement
.4		move.l	#$03000205,monster_move(a3)
		bra	do_movement
.5		move.l	#$01000205,monster_move(a3)
		bra	do_movement
.6		move.l	#$03020005,monster_move(a3)
		bra	do_movement
.7		move.l	#$02030105,monster_move(a3)
		bra	do_movement
.8		move.l	#$01020005,monster_move(a3)
		bra	do_movement

;-------------------------------------------------------------------------------

move_away	move.b	monster_dr(a3),d1
		cmpi.b	#4,d1
		blt	do_movement
		cmpi.b	#5,d1
		beq	random_direction
		clr.b	monster_dr(a3)

		move.b	xpos(a0),d1
		cmp.b	monster_x(a3),d1
		blt.s	.146
		beq.s	.27
.356		move.b	ypos(a0),d1
		cmp.b	monster_y(a3),d1
		blt.s	.3
		beq.s	.5
		bra.s	.8
.146		move.b	ypos(a0),d1
		cmp.b	monster_y(a3),d1
		blt.s	.1
		beq.s	.4
		bra.s	.6
.27		move.b	ypos(a0),d1
		cmp.b	monster_y(a3),d1
		blt.s	.2
		bra.s	.7

.1		move.l	#$02010305,monster_move(a3)
		bra	do_movement
.2		move.l	#$02010305,monster_move(a3)
		bra	do_movement
.3		move.l	#$02030105,monster_move(a3)
		bra	do_movement
.4		move.l	#$01020005,monster_move(a3)
		bra	do_movement
.5		move.l	#$03020005,monster_move(a3)
		bra	do_movement
.6		move.l	#$01000205,monster_move(a3)
		bra	do_movement
.7		move.l	#$00010305,monster_move(a3)
		bra	do_movement
.8		move.l	#$03000205,monster_move(a3)
		bra	do_movement

;-------------------------------------------------------------------------------

random_direction
		move.l	#$000000ff,monster_move(a3)
		move.b	#3,monster_dr(a3)
		bra	do_movement

********************************************************************************
********************************************************************************
********************************************************************************

do_movement
		moveq.l	#0,d1
		move.b	monster_dr(a3),d1
		move.b	monster_move(a3,d1.w),d1

.retry		tst.b	d1
		beq	try_mon_north
		cmpi.b	#1,d1
		beq	try_mon_east
		cmpi.b	#2,d1
		beq	try_mon_south
		cmpi.b	#3,d1
		beq	try_mon_west

		move.w	variables+random_num(a5),d1
		mulu	#47,d1
		rol.w	#8,d1
		move.w	d1,variables+random_num(a5)
		andi.w	#%11,d1

		bra.s	.retry

********************************************************************************
********************************************************************************
********************************************************************************
find_closest_player
		move.w	#$7fff,d3
                suba.l	a0,a0

		lea	variables+player1(a5),a1
		bsr	find_nearest_player

		lea	variables+player2(a5),a1
		bsr	find_nearest_player

		lea	variables+player3(a5),a1
		bsr	find_nearest_player

		lea	variables+player4(a5),a1
		bsr	find_nearest_player

		cmp.w	#100,d3
		blt	.move_now
		suba.l	a0,a0
.move_now
		rts

********************************************************************************
********************************************************************************
********************************************************************************

try_mon_north
		move.b	monster_direct(a3),d0

		tst.b	d0
		beq	monster_forward
		cmpi.b	#2,d0
		beq.s	.not_east_or_west
		clr.b	monster_direct(a3)
		st.b	variables+redraw_flag(a5)
		rts
.not_east_or_west
		move.b	#1,monster_direct(a3)
		st.b	variables+redraw_flag(a5)
		rts

;-------------------------------------------------------------------------------

try_mon_east
		move.b	monster_direct(a3),d0

		cmpi.b	#1,d0
		beq.s	monster_forward
		cmpi.b	#3,d0
		beq.s	.not_north_or_south
		move.b	#1,monster_direct(a3)
		st.b	variables+redraw_flag(a5)
		rts
.not_north_or_south
		clr.b	monster_direct(a3)
		st.b	variables+redraw_flag(a5)
		rts

;-------------------------------------------------------------------------------

try_mon_south
		move.b	monster_direct(a3),d0

		cmpi.b	#2,d0
		beq.s	monster_forward
		tst.b	d0
		beq.s	.not_east_or_west
		move.b	#2,monster_direct(a3)
		st.b	variables+redraw_flag(a5)
		rts
.not_east_or_west
		move.b	#1,monster_direct(a3)
		st.b	variables+redraw_flag(a5)
		rts

;-------------------------------------------------------------------------------

try_mon_west
		move.b	monster_direct(a3),d0

		cmpi.b	#3,d0
		beq.s	monster_forward
		cmpi.b	#1,d0
		beq.s	.not_north_or_south
		move.b	#3,monster_direct(a3)
		st.b	variables+redraw_flag(a5)
		rts
.not_north_or_south
		move.b	#2,monster_direct(a3)
		st.b	variables+redraw_flag(a5)
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		none
;OUTPUT:	none
;CHANGES:	all

monster_forward
		cmpi.b	#-1,monster_count(a3)
		bne.s	.do_move
		rts
.do_move
		move.l	monster_posn(a3),a2
		andi.l	#erase_person,(a2)

		move.b	monster_direct(a3),d0

		tst.b	d0
		bne	.not_north
		lea	-map_cell_size*MAP_WIDTH(a2),a1
		move.l	#(8<<aux_shift)!keep_aux_here_bit,d2		;up
		move.l	#(18<<block_shift)!keep_block_here_bit,d3	;down
		move.b	#0,d4						;x
		move.b	#-1,d5						;y
		move.b	#0,d6						;floor
.not_north
		cmpi.b	#1,d0
		bne	.not_east
		lea	map_cell_size(a2),a1
		move.l	#(9<<aux_shift)!keep_aux_here_bit,d2		;up
		move.l	#(19<<block_shift)!keep_block_here_bit,d3	;down
		move.b	#1,d4						;x
		move.b	#0,d5						;y
		move.b	#0,d6						;floor
.not_east
		cmpi.b	#2,d0
		bne	.not_south
		lea	map_cell_size*MAP_WIDTH(a2),a1
		move.l	#(10<<aux_shift)!keep_aux_here_bit,d2		;up
		move.l	#(16<<block_shift)!keep_block_here_bit,d3	;down
		move.b	#0,d4						;x
		move.b	#1,d5						;y
		move.b	#0,d6						;floor
.not_south
		cmpi.b	#3,d0
		bne	.not_west
		lea	-map_cell_size(a2),a1
		move.l	#(11<<aux_shift)!keep_aux_here_bit,d2		;up
		move.l	#(17<<block_shift)!keep_block_here_bit,d3	;down
		move.b	#-1,d4						;x
		move.b	#0,d5						;y
		move.b	#0,d6						;floor
.not_west
		bsr	move_monster

		tst.w	d0
		beq	.end_move
		cmpi.w	#1,d0
		beq	.bump
		cmpi.w	#2,d0
		beq	.moved

;-------------------------------------------------------------------------------
;INPUT :	a1.l = address of destination

.bump		movem.l	d0-d1/d4/a0-a4,-(sp)
		move.l	(a1),d0
		move.l	a3,-(sp)
		jsr	find_heads_owner
		move.l	a3,a1
		move.l	(sp)+,a3
		tst.w	d2
		bmi	.no_head

		move.l	monster_type(a3),a0
		move.w	mdfn_modifier(a0),d0
		lsl.w	#5,d0

		tst.w	mdfn_effect(a0)
		beq.s	.not_noise
		PLAY_EX_SAMPLE_RAND mdfn_effect(a0),aud_ch(a4),#63,mdfn_period(a0)
.not_noise
		tst.b	mdfn_poison(a0)
		beq.s	.not_poisonous
		tst.w	spell_immu(a4)
		bne.s	.not_poisonous
		cmpi.b	#1,gender(a1)
		bgt.s	.not_poisonous
		move.w	variables+random_num(a5),d3
		mulu	#33,d3
		rol.w	#5,d3
		move.w	d3,variables+random_num(a5)
		andi.w	#%1111,d3		;face random direction
		cmp.b	mdfn_poison(a0),d3
		bgt.s	.not_poisonous
		move.b	mdfn_poison(a0),d3
		ext.w	d3
		mulu	#655,d3
		cmp.w	poisoned_strength(a4),d3
		ble.s	.not_poisonous
		move.w	physique(a1),poisoned_count(a4)
		move.w	physique(a1),poisoned_count_store(a4)
		move.w	d3,poisoned_strength(a4)
.not_poisonous
		move.l	a4,a0
		jsr	punch_fitness
		movem.l	(sp)+,d0-d1/d4/a0-a4
		bra	.attacked
.no_head	movem.l	(sp)+,d0-d1/d4/a0-a4

		movem.l	a0-a4/d4/d0-d1,-(sp)
		move.l	d1,d0
		jsr	find_sentries_owner
		tst.w	d2
		bmi.s	.no_sentry
		move.l	monster_type(a3),a1
		tst.w	mdfn_effect(a1)
		beq.s	.not_noise2
		PLAY_EX_SAMPLE_RAND mdfn_effect(a1),#1,#63,mdfn_period(a1)
.not_noise2	move.l	a4,a0
		move.l	#0,d0
		move.w	mdfn_modifier(a1),d0
		lsl.w	#3,d0
		jsr	decr_sentry_fitness
		movem.l	(sp)+,a0-a4/d4/d0-d1
		bra	.attacked
.no_sentry	movem.l	(sp)+,a0-a4/d4/d0-d1

		add.b	#1,monster_dr(a3)
		rts

.attacked
;		move.w	mdfn_bravery(a4),d1
;		cmp.w	monster_fitness(a3),d1
;		blt.s	.brave

;		move.b	monster_direct(a3),d1
;		cmp.b	monster_move(a3),d1
;		beq.s	.reasses3
;		move.b	#5,monster_dr(a3)
;		bra.s	.skip_reasses3
;.reasses3	move.b	#4,monster_dr(a3)
;.skip_reasses3
;.brave
		rts

;-------------------------------------------------------------------------------

.end_move	add.b	#1,monster_dr(a3)
		rts

;-------------------------------------------------------------------------------

.moved
;		move.w	mdfn_bravery(a4),d1
;		cmp.w	monster_fitness(a3),d1
;		blt.s	.brave

;		move.b	monster_direct(a3),d1
;		cmp.b	monster_move(a3),d1
;		beq.s	.reasses
;		move.b	#5,monster_dr(a3)
;		bra.s	.skip_reasses
;.reasses	move.b	#4,monster_dr(a3)
;		bra.s	.skip_reasses

;.brave		move.b	monster_direct(a3),d1
;		cmp.b	monster_move(a3),d1
;		beq.s	.reasses2
;		move.b	#5,monster_dr(a3)
;		bra.s	.skip_reasses
;.reasses2
		move.b	#4,monster_dr(a3)
;.skip_reasses
		move.l	a3,a0
		jsr	test_mine_monster
		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT :	a2.l = address of monster in map
;		a1.l = address of destination
;		a3.l = monster
;		a4.l = monster defn
;		d2.l = aux for stairs up
;		d3.l = block for stairs down
;		d4.b = amount to move on x
;		d5.b = amount to move on y
;		d6.b = amount to move on z
;OUTPUT :	d0.l = movement flag (0 = end, 1 = bump, 2 = moved)
;       	( d1.l = bumped into )
;		a2.l = new address of monster in map

move_monster
		move.l	(a2),d1
		and.l	#keep_floor,d1
		bne	.on_floor
		move.l	-map_cell_size*MAP_WIDTH*MAP_DEPTH(a2),d1
		and.l	#keep_block,d1
		bne.s	.on_floor
		move.l	-2*map_cell_size*MAP_WIDTH*MAP_DEPTH(a2),d1
		and.l	#keep_block,d1
		cmpi.l	#(4<<block_shift)!keep_block_here_bit,d1
		beq	.on_floor
		move.l	(a2),d1
		and.l	#keep_water,d1
		cmp.l	#(2<<water_shift)!keep_water_here_bit,d1
		blt	.end				;cant move if not
.on_floor						; standing on anything
		move.l	(a2),d1
		and.l	#keep_aux,d1			;on stairs up ?
		beq.s	.not_stairs_up			;no, then branch
		cmp.l	d2,d1
		beq.s	.stairs_up
.not_stairs_up
		move.l	-map_cell_size*MAP_WIDTH*MAP_DEPTH(a2),d1
		and.l	#keep_block,d1			;on stairs down ?
		beq.s	.not_stairs_down		;no, then branch
		cmp.l	d3,d1
		beq.s	.stairs_down
.not_stairs_down
		bra.s	.move

;-------------------------------------------------------------------------------

.stairs_up	move.l	map_cell_size*MAP_WIDTH*MAP_DEPTH(a2),d1
		and.l	#keep_block!keep_floor!keep_opaque_bit,d1	;obstructed above ?
		bne	.end				;yes, then branch
		add.l	#map_cell_size*MAP_WIDTH*MAP_DEPTH,a1
		add.b	#1,d6
		bra.s	.move

;-------------------------------------------------------------------------------

.stairs_down	move.l	(a1),d1
		and.l	#keep_floor,d1			;floor on stairs ?
		bne.s	.move				;yes, then move
		move.l	-map_cell_size*MAP_WIDTH*MAP_DEPTH(a1),d1
		and.l	#keep_block!keep_opaque_bit,d1	;obstructed below ?
		beq.s	.down
		cmpi.l	#(32<<block_shift)!keep_block_here_bit,d1
		blt.s	.move
		cmpi.l	#(47<<block_shift)!keep_block_here_bit,d1
		bgt.s	.move
.down		sub.l	#map_cell_size*MAP_WIDTH*MAP_DEPTH,a1
		sub.b	#1,d6

;-------------------------------------------------------------------------------

.move
		move.l	a1,-(sp)
		add.l	#2*map_part_size,a1
		move.l	(a1),d1
		move.l	(sp)+,a1
		btst.l	#no_monster_bit_num,d1
                bne	.end

		tst.b	mdfn_two_high(a4)
		beq.s	.not_two_high1
		move.l	(a1),d1
		move.l	map_cell_size*MAP_WIDTH*MAP_DEPTH(a1),d1
		and.l	#keep_floor!keep_block!keep_opaque_bit,d1
		bne	.end
.not_two_high1
		tst.b	mdfn_water_only(a4)
		beq.s	.not_water_only
		move.l	(a1),d1
		and.l	#keep_water,d1
		cmpi.l	#(3<<water_shift)!keep_water_here_bit,d1
		blt	.end
.not_water_only
		move.l	(a1),d1
		and.l	#keep_block!keep_opaque_bit,d1
		beq.s	.no_obstruction
		cmpi.l	#(20<<block_shift)!keep_block_here_bit,d1
		blt	.bump
		cmpi.l	#(21<<block_shift)!keep_block_here_bit,d1
		bgt.s	.bump
		move.l	a3,-(sp)
		move.l	a1,a3
		suba.l	a0,a0
		jsr	open_door
		move.l	(sp)+,a3
		bra	.end
.no_obstruction
		move.l	(a1),d1
		and.l	#keep_floor,d1			;about to stand on floor ?
		bne	.onto_floor			;yes, then branch
		move.l	-map_cell_size*MAP_WIDTH*MAP_DEPTH(a1),d1
		and.l	#keep_block,d1
		beq.s	.end				;end if going to fall
		cmpi.l	#(4<<block_shift)!keep_block_here_bit,d1
		beq	.end
		cmpi.l	#(8<<block_shift)!keep_block_here_bit,d1
		blt	.moved
		cmpi.l	#(47<<block_shift)!keep_block_here_bit,d1
		bgt	.moved
		cmpi.l	#(15<<block_shift)!keep_block_here_bit,d1
		ble	.end
		cmpi.l	#(22<<block_shift)!keep_block_here_bit,d1
		bge	.end
		bra	.moved

.onto_floor	tst.b	mdfn_two_high(a4)
		bne.s	.two_high
		tst.b	mdfn_water_only(a4)
		beq.s	.not_two_high2
.two_high	cmpi.l	#(2<<floor_shift)!keep_floor_here_bit,d1
		beq.s	.end
.not_two_high2	bra	.moved

;-------------------------------------------------------------------------------

.bump		moveq.l	#1,d0
		rts

;-------------------------------------------------------------------------------

.moved		move.l	a1,monster_posn(a3)
		move.l	a1,a2
		add.b	d4,monster_x(a3)
		add.b	d5,monster_y(a3)
		add.b	d6,monster_floor(a3)
		st.b	variables+redraw_flag(a5)	;set redraw flag
		moveq.l	#2,d0
		rts

;-------------------------------------------------------------------------------

.end		moveq.l	#0,d0
		rts

********************************************************************************
********************************************************************************
********************************************************************************

monster_fire_fireball
		movem.l	a1/d3,-(sp)

		move.l	#locn,a1
		add.l	a5,a1
		move.l	monster_posn(a3),a2

		tst.b	monster_direct(a3)
		bne.s	.not_north
		move.w	#-map_cell_size*MAP_WIDTH,d0
		bra.s	.see_player
.not_north
		cmpi.b	#1,monster_direct(a3)
		bne.s	.not_east
		move.w	#map_cell_size,d0
		bra.s	.see_player
.not_east
		cmpi.b	#2,monster_direct(a3)
		bne.s	.not_south
		move.w	#map_cell_size*MAP_WIDTH,d0
		bra.s	.see_player
.not_south
		cmpi.b	#3,monster_direct(a3)
		bne.s	.not_west
		move.w	#-map_cell_size,d0
		bra.s	.see_player
.not_west
		moveq.l	#0,d0			;no fireball fired
		movem.l	(sp)+,a1/d3
		rts

.see_player	moveq.l	#0,d2
		move.b  mdfn_maxdist(a4),d2

.loop		add.w	d0,a2
		move.l	(a2),d1

		btst.l	#block_here_bit_num,d1
		beq	.no_block

		move.w	#block_shift,d3
		and.l	#keep_block,d1
		ror.l	d3,d1

		cmpi.b	#4,d1
		bne.s	.not_tree
		tst.b	locn_style(a1)
		beq	.no_block
		cmpi.b	#2,locn_style(a1)
		beq	.no_block
		bra	.end
.not_tree	cmpi.b	#5,d1
		beq	.no_block
		cmpi.b	#7,d1
		beq.s	.no_block

		cmpi.b	#24,d1
		blt.s	.end
		cmpi.b	#47,d1
		bgt.s	.end
		cmpi.b	#28,d1
		blt.s	.fire
		cmpi.b	#32,d1
		blt.s	.end

.fire		move.l	monster_posn(a3),d0
		sub.l	a5,d0
		subi.l	#map+map_data1,d0
		PLAY_EX_SAMPLE_MEM #8,#1,#95,d0

		movem.l	a0-a3/d1-d5,-(sp)
		move.b	monster_direct(a3),d0		;direction
		move.l	monster_posn(a3),a3
		move.b	mdfn_fspeed(a4),d1		;speed
		move.b	mdfn_fdecay(a4),d4		;decay on
		move.b	d0,d5				;no flameback
		move.b	mdfn_fireball(a4),d3		;density
		subi.b	#1,d3
		jsr	chuck_fireball
		movem.l	(sp)+,a0-a3/d1-d5
		moveq.l	#-1,d0			;fireball fired
		movem.l	(sp)+,a1/d3
		rts

.no_block	dbf	d2,.loop

.end		moveq.l	#0,d0			;no fireball fired
		movem.l	(sp)+,a1/d3
		rts

********************************************************************************
********************************************************************************
********************************************************************************
find_nearest_player
		tst.w	dead_flag2(a1)
		bne.s	.not_closer
		cmpi.w	#7,window_type(a1)
		beq.s	.not_closer
		tst.b	control_method(a1)
		beq	.not_closer

.get_value	moveq.l	#0,d0
		move.b	xpos(a1),d0
		sub.b	monster_x(a3),d0
		ext.w	d0
		mulu	d0,d0

		moveq.l	#0,d1
		move.b	ypos(a1),d1
		sub.b	monster_y(a3),d1
		ext.w	d1
		mulu	d1,d1

		moveq.l	#0,d2
		move.b	floor(a1),d2
		sub.b	monster_floor(a3),d2
		ext.w	d2
		lsl.w	#2,d2
		mulu	d2,d2

		add.w	d0,d1
		add.w	d2,d1

		cmp.w	d1,d3
		blt.s	.not_closer

		move.w	d1,d3
		move.l	a1,a0
.not_closer
		rts

********************************************************************************
********************************************************************************
********************************************************************************
put_monster_in_map
		moveq.l	#0,d0
		move.b	monster_direct(a3),d0
		cmp.b	#20,mdfn_number(a4)
		bne.s	.not20
		add.b	#8,d0
		bra.s	.rotated
.not20
		move.b	locn+locn_mons1(a5),d1
		cmp.b	mdfn_number(a4),d1
		bne.s	.not_mons1
		add.b	#8,d0
		bra.s	.rotated
.not_mons1	move.b	locn+locn_mons2(a5),d1
		cmp.b	mdfn_number(a4),d1
		bne.s	.bad_monster
		add.b	#12,d0
.rotated
		moveq.l	#block_shift,d1
		rol.l	d1,d0
		or.l	#keep_block_here_bit,d0

		tst.b	monster_white(a3)
		beq.s	.not_white
		bset.l	#m_flashed,d0
.not_white
		move.l	monster_type(a3),a2
		tst.b	mdfn_outline(a2)
		beq.s	.not_outlined
		bset.l	#m_outlined,d0
.not_outlined
		move.l	monster_posn(a3),a2
		and.l	#erase_person,(a2)
		or.l	d0,(a2)

		sf.b	monster_white(a3)

.ok		rts

.bad_monster
		jsr	kill_screen
		move.w	#150,d0
.bad_loop	move.w	#bad_monster,color00(a6)
		WAIT_VBLANK
		dbf	d0,.bad_loop

		tst.l	os_kill
		bne	.os_dead
		jsr	restore_system
		move.l	stack_ptr,a7
		moveq.l	#-1,d0
		rts
.os_dead	move.w	#bad_monster,color00(a6)
		bra.s	.bad_monster

********************************************************************************
;a2=mdfn struct
;a0=monster struct
;a2=monster mdfn struct
damage_monster_fitness
		move.w	mdfn_physique(a2),d1
		divu	d1,d0
		mulu	#100,d0
		jsr	decr_monster_fitness	;damage = ( hit / physique ) * 100
		rts

;a2=mdfn struct
;a0=monster struct
;d0.l=damage to inflict
decr_monster_fitness
		st.b	monster_white(a0)
		st.b	variables+redraw_flag(a5)

		moveq.l	#0,d1
		move.w	monster_fitness(a0),d1
		sub.l	d0,d1
		bpl.s	.not_dead
		clr.w	monster_fitness(a0)

		move.l	monster_posn(a0),a3	;kill monster
		clr.l	monster_posn(a0)
		and.l	#erase_person,(a3)
		btst.b	#aux_here_bit_num,3(a3)
		bne.s	.no_room
		btst.b	#floor_here_bit_num,3(a3)	;floor for aux ?
		bne.s	.do_aux				;yes, then do aux
		move.l	-map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),d1
		btst.l	#block_here_bit_num,d1		;block below for aux ?
		beq.s	.no_room			;no, then dont do aux
		and.l	#keep_block,d1
		cmp.l	#(1<<block_shift),d1
		bgt.s	.no_room
.do_aux
		move.l	#14,d0
		move.l	a4,-(sp)
		move.l	monster_type(a0),a4
		move.b	locn+locn_mons1(a5),d1
		cmp.b	#20,mdfn_number(a4)
		beq.s	.mons1
		cmp.b	mdfn_number(a4),d1
		beq.s	.mons1
		move.l	#15,d0
.mons1		move.l	(sp)+,a4
		move.w	#32-aux_shift,d1
		ror.l	d1,d0
		or.l	#keep_aux_here_bit,d0
		or.l	d0,(a3)
.no_room
		clr.l	monster_type(a0)
		moveq.l	#-1,d0				;flag dead
		rts
.not_dead
		move.w	d1,monster_fitness(a0)
		tst.b	mdfn_stunned(a2)
		beq.s	.not_stunned
		divu	#5000,d0
		cmpi.w	#127,d0
		ble.s	.ok
		move.b	#127,d0
.ok		move.b	d0,monster_stun_count(a0)
.not_stunned
		moveq.l	#0,d0				;flag ok
		rts

********************************************************************************
********************************************************************************
;INPUT:		a2.l=address of monster
;OUTPUT:	d2.w=monster number (-1 if not found)
;		a4.l=address of monsters structure if found
;CHANGES:    	none

find_monsters_owner
		lea	map(a5),a4
		add.l	#monsters,a4		;address of active monster list

		moveq.l	#num_monsters-1,d2

.next		tst.l	monster_type(a4)
		beq.s	.next_mons
		cmp.l	monster_posn(a4),a2
		beq.s	.found
.next_mons	add.w	#monster_size,a4
		dbf	d2,.next
		moveq.l	#-1,d2
		rts

.found		subi.w	#num_monsters-1,d2
		neg.w	d2
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	d0-d4,a0-a3
reset_monsters
		lea	map(a5),a0
		add.l	#monsters,a0		;address of active monster list

		moveq.l	#num_monsters-1,d2

.next		clr.l	monster_type(a0)
		clr.l	monster_posn(a0)
		clr.w	monster_fitness(a0)
		clr.b	monster_direct(a0)
		clr.b	monster_x(a0)
		clr.b	monster_y(a0)
		clr.b	monster_floor(a0)
		clr.b	monster_count(a0)
		clr.b	monster_white(a0)
		clr.l	monster_move(a0)
		move.b	#4,monster_dr(a0)
		clr.b	monster_stun_count(a0)
		add.w	#monster_size,a0
		dbf	d2,.next

		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	d0-d4,a0-a3
monsters_fall
		lea	map(a5),a0
		add.l	#monsters,a0		;address of active monster list

		moveq.l	#num_monsters-1,d2

.next		tst.l	monster_type(a0)
		beq.s	.no_monster
		bsr	.monster_fall
.no_monster	add.w	#monster_size,a0
		dbf	d2,.next

		rts

********************************************************************************
.monster_fall
		move.l	monster_posn(a0),a2

		move.l	(a2),d1

		btst.l	#floor_here_bit_num,d1		;any floor below?
		bne.s	.end_fall			;yes, then dont fall

		move.l	-MAP_WIDTH*MAP_DEPTH*map_cell_size(a2),d0			;get block below

		btst.l	#block_here_bit_num,d0		;any floor below?
		bne	.block_below			;yes, then dont fall

		andi.l	#erase_person,(a2)
		andi.l	#erase_person,-MAP_WIDTH*MAP_DEPTH*map_cell_size(a2)
		andi.l	#keep_person,d1
		or.l	d1,-MAP_WIDTH*MAP_DEPTH*map_cell_size(a2)

		sub.l	#MAP_WIDTH*MAP_DEPTH*map_cell_size,monster_posn(a0)
		sub.b	#1,monster_floor(a0)
		st.b	variables+redraw_flag(a5)	;set redraw flag
.end_fall
		rts
.block_below
		and.l	#keep_block,d0

		cmpi.l	#(6<<block_shift)!keep_block_here_bit,d0
		bne.s	.not_teleport
		andi.l	#erase_person,(a2)		;remove person
		lea	-MAP_WIDTH*MAP_DEPTH*map_cell_size(a2),a3
		jsr	teleport_monster
		andi.l	#keep_person,d1
		move.l	monster_posn(a0),a3
		or.l	d1,(a3)
		rts
.not_teleport
		cmp.l	#(8<<block_shift)!keep_block_here_bit,d0
		blt.s	.no_squash
		cmp.l	#(47<<block_shift)!keep_block_here_bit,d0
		bgt.s   .no_squash
		cmp.l	#(16<<block_shift)!keep_block_here_bit,d0
		blt	.squash_monster
		cmp.l	#(32<<block_shift)!keep_block_here_bit,d0
		bge	.squash_player
		cmp.l	#(22<<block_shift)!keep_block_here_bit,d0
		blt.s   .no_squash
		cmp.l	#(27<<block_shift)!keep_block_here_bit,d0
		bgt.s   .no_squash
		cmp.l	#(24<<block_shift)!keep_block_here_bit,d0
		bge	.squash_sentry
.no_squash
                bra	.end_fall

;-------------------------------------------------------------------------------

.squash_monster
		movem.l	d2/d5/a0-a1/a2-a4,-(sp)

		lea	-map_cell_size*MAP_WIDTH*MAP_DEPTH(a2),a2
		jsr	find_monsters_owner
		tst.l	d2
		bmi.s	.no_monster2

		move.l	a4,a0
		move.l	monster_type(a4),a2
		move.l	#2500,d0
		lsl.l	#6,d0
		jsr	damage_monster_fitness

.no_monster2	movem.l	(sp)+,d2/d5/a0-a1/a2-a4
		bra	.no_squash

;-------------------------------------------------------------------------------

.squash_player
		movem.l	d2/d5/a0-a1/a3-a4,-(sp)

		move.l	-map_cell_size*MAP_WIDTH*MAP_DEPTH(a2),d0
		jsr	find_heads_owner
		tst.l	d2
		bmi.s	.no_head

		move.l	a3,a1
		move.l	a4,a0
		move.l	#2500,d0
		jsr	damage_fitness

.no_head	movem.l	(sp)+,d2/d5/a0-a1/a3-a4
		bra	.no_squash

;-------------------------------------------------------------------------------

.squash_sentry
		movem.l	d2/d5/a0-a1/a3-a4,-(sp)

		move.l	-map_cell_size*MAP_WIDTH*MAP_DEPTH(a2),d0
		jsr	find_sentries_owner
		tst.l	d2
		bmi.s	.no_sentry2

		move.l	a4,a0
		move.l	#2500,d0
		jsr	damage_sentry_fitness

.no_sentry2	movem.l	(sp)+,d2/d5/a0-a1/a3-a4
		bra	.no_squash

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5=base address of fast memory (long)
;		a0=address of monster structure (long)
;		a3=mem position of field (long)
;OUTPUT:	none
;CHANGES:       none
teleport_monster
		movem.l	d1/a1-a4,-(sp)

		add.l	#map_part_size*2,a3
		move.l	(a3),a3
		move.l  a3,d1
		adda.l	a5,a3
		adda.l	#map+map_data1,a3

		btst.b	#block_here_bit_num,3(a3)
		bne.s	.blocked

		move.l	a3,monster_posn(a0)

		lsr.l	#2,d1
		divu    #MAP_WIDTH*MAP_DEPTH,d1
		move.b	d1,monster_floor(a0)
		swap	d1

		ext.l	d1
		divu    #MAP_WIDTH,d1
		move.b	d1,monster_y(a0)
		swap	d1

		move.b	d1,monster_x(a0)

		move.l	#map+map_data1,d1
		add.l	a5,d1
		sub.l	d1,a3
		move.l	#miscsfx,a1
		add.l	chip_mem_base,a1
		PLAY_SAMPLE_MEM a1,#3,#1,#683,a3

		st.b	variables+redraw_flag(a5)	;set redraw flag

.blocked	movem.l	(sp)+,d1/a1-a4
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT		a5=base address of fast memory (long)
;		a0=address of monster struct (long)
;OUTPUT:	none
;CHANGES:	d0-d4,a0-a3

test_mine_monster
		movem.l	d0-d4/a1-a3,-(sp)

		move.l	monster_posn(a0),a3
		move.l	monster_type(a0),a2

		jsr	trigger_mine

		tst.l	d0
		beq.s	.no_damage
		jsr	damage_monster_fitness
.no_damage
		movem.l	(sp)+,d0-d4/a1-a3
		rts

