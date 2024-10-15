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
********************************** Draw Views **********************************
********************************************************************************
;Draw views for active players.
;INPUT:		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	d0-d1,a0-a2
draw_views
	IFD	MINIMAL_REDRAW
		tst.b	variables+redraw_flag(a5)
		beq	no_redraw
	ENDC

		sf.b	variables+redraw_flag(a5)

	IFD	DOUBLE_BUFFER
		BOB_INFO drawing_buffer,#views_plane_width/8,#views_plane_height,#views_num_planes,#0,#0,#views_plane_width,#views_plane_height-1,#0
	ELSEIF
		BOB_INFO viewing_buffer,#views_plane_width/8,#views_plane_height,#views_num_planes,#0,#0,#views_plane_width,#views_plane_height-1,#0
	ENDC
;		move.l	#copperlist+views_bplpt,a0
;		add.l	a4,a0
;		move.l	drawing_buffer,a1
;		SET_UP_BITPLANE_POINTERS (a0),a1,#views_plane_size,#views_num_planes
;		move.l	#copperlist+scrolly_bplpt2,a0
;		add.l	a4,a0
;		move.l	drawing_buffer,a1
;		add.l	#views_split*views_plane_width/8,a1
;		SET_UP_BITPLANE_POINTERS (a0),a1,#views_plane_size,#views_num_planes

		sf.b 	variables+changed(a5)

		move.l	a4,-(sp)

		lea	variables+player1(a5),a0
		jsr	put_head_in_map

		lea	variables+player2(a5),a0
		jsr	put_head_in_map

		lea	variables+player3(a5),a0
		jsr	put_head_in_map

		lea	variables+player4(a5),a0
		jsr	put_head_in_map

		move.w	#$400,waitcol

		lea	variables+player1(a5),a0
		clr.w	exp(a0)
		lea	global_vars+player1_stats(a5),a3
		bsr	draw_view
		move.w	exp(a0),d0
		INCR_EXP d0,global_vars+player1_stats+experience(a5)

		move.w	#$040,waitcol

		lea	variables+player2(a5),a0
		clr.w	exp(a0)
		lea	global_vars+player2_stats(a5),a3
		bsr	draw_view
		move.w	exp(a0),d0
		INCR_EXP d0,global_vars+player2_stats+experience(a5)

		move.w	#$440,waitcol

		lea	variables+player3(a5),a0
		clr.w	exp(a0)
		lea	global_vars+player3_stats(a5),a3
		bsr	draw_view
		move.w	exp(a0),d0
		INCR_EXP d0,global_vars+player3_stats+experience(a5)

		move.w	#$004,waitcol

		lea	variables+player4(a5),a0
		clr.w	exp(a0)
		lea	global_vars+player4_stats(a5),a3
		bsr	draw_view
		move.w	exp(a0),d0
		INCR_EXP d0,global_vars+player4_stats+experience(a5)

		move.w	#$404,waitcol

		move.l	(sp)+,a4

;		tst.b 	variables+changed(a5)
;		beq	no_redraw
.swap
	IFD	DOUBLE_BUFFER
		cmpi.w	#old_view1,variables+last_view(a5)
		bne.s	.skip1
		move.w	#old_view2,variables+last_view(a5)
		bra.s	.skip2
.skip1		move.w	#old_view1,variables+last_view(a5)
.skip2
	ENDC

		WAIT_BLIT

		btst.b	#7,dmaconr+1(a6)
		beq.s	no_copint

		bsr	scan_sky
		st.b	variables+swap(a5)
		tst.l	os_kill
		bne	.os_dead1
		jsr	temp_restore_system
.os_dead1
.wait		tst.w	variables+swap(a5)
		bne.s	.wait
		tst.l	os_kill
		bne	.os_dead2
		jsr	temp_take_system
.os_dead2	bsr	draw_team
		rts

no_copint
		bsr	scan_sky
		tst.l	os_kill
		bne	.os_dead1
		jsr	temp_restore_system
.os_dead1
		WAIT_VBLANK
		tst.l	os_kill
		bne	.os_dead2
		jsr	temp_take_system
.os_dead2	bsr	swap_screen
		bsr	draw_team
		rts

no_redraw	tst.l	os_kill
		bne	.os_dead1
		jsr	temp_restore_system
.os_dead1	WAIT_VBLANK
		tst.l	os_kill
		bne	.os_dead2
		jsr	temp_take_system
.os_dead2
		rts

swap_screen
	IFD	DOUBLE_BUFFER
		move.l	#copperlist+views_bplpt,a0
		add.l	a4,a0
		SWAP_PLANE_BUFFERS (a0),#views_plane_size,#views_num_planes
		move.l	#copperlist+scrolly_bplpt2,a0
		add.l	a4,a0
		move.l	viewing_buffer,a1
		add.l	#views_split*views_plane_width/8,a1
		SET_UP_BITPLANE_POINTERS (a0),a1,#views_plane_size,#views_num_planes
	ENDC
		clr.w	variables+swap(a5)
		rts

****************************************************************************
****************************************************************************
scan_sky
		tst.w	global_vars+player1_stats+dead_flag(a5)
		bne.s	.no_sky1
		tst.w	variables+player1+window_type(a5)
		bne.s	.no_sky1
		move.l	variables+player1+mem_position(a5),a0
		add.l	#map_part_size*2,a0
		move.l	(a0),d0
		move.w	#sky_shift,d1
		add.b	variables+player1+direction(a5),d1
		btst.l	d1,d0
		beq.s	.no_sky1
		move.w	#1,variables+player1+sky_flag(a5)
		bra.s	.skip_sky1
.no_sky1	clr.w	variables+player1+sky_flag(a5)
.skip_sky1
		tst.w	global_vars+player2_stats+dead_flag(a5)
		bne.s	.no_sky2
		tst.w	variables+player2+window_type(a5)
		bne.s	.no_sky2
		move.l	variables+player2+mem_position(a5),a0
		add.l	#map_part_size*2,a0
		move.l	(a0),d0
		move.w	#sky_shift,d1
		add.b	variables+player2+direction(a5),d1
		btst.l	d1,d0
		beq.s	.no_sky2
		move.w	#1,variables+player2+sky_flag(a5)
		bra.s	.skip_sky2
.no_sky2	clr.w	variables+player2+sky_flag(a5)
.skip_sky2
		tst.w	global_vars+player3_stats+dead_flag(a5)
		bne.s	.no_sky3
		tst.w	variables+player3+window_type(a5)
		bne.s	.no_sky3
		move.l	variables+player3+mem_position(a5),a0
		add.l	#map_part_size*2,a0
		move.l	(a0),d0
		move.w	#sky_shift,d1
		add.b	variables+player3+direction(a5),d1
		btst.l	d1,d0
		beq.s	.no_sky3
		move.w	#1,variables+player3+sky_flag(a5)
		bra.s	.skip_sky3
.no_sky3	clr.w	variables+player3+sky_flag(a5)
.skip_sky3
		tst.w	global_vars+player4_stats+dead_flag(a5)
		bne.s	.no_sky4
		tst.w	variables+player4+window_type(a5)
		bne.s	.no_sky4
		move.l	variables+player4+mem_position(a5),a0
		add.l	#map_part_size*2,a0
		move.l	(a0),d0
		move.w	#sky_shift,d1
		add.b	variables+player4+direction(a5),d1
		btst.l	d1,d0
		beq.s	.no_sky4
		move.w	#1,variables+player4+sky_flag(a5)
		bra.s	.skip_sky4
.no_sky4	clr.w	variables+player4+sky_flag(a5)
.skip_sky4
		rts

****************************************************************************
****************************************************************************
;INPUT:		a0=address of players structure (long)
;		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	d0-d1,d5,d7
draw_team
		BOB_INFO viewing_buffer,#views_plane_width/8,#views_plane_height,#views_num_planes,#0,#0,#views_plane_width,#views_plane_height-1,0

		move.l	a0,-(sp)

		move.w	#$044,waitcol

		lea	variables+player1(a5),a0
		lea	global_vars+player1_stats(a5),a1
		bsr	.draw_leader_bob

		move.w	#$444,waitcol

		lea	variables+player2(a5),a0
		lea	global_vars+player2_stats(a5),a1
		bsr	.draw_leader_bob

		move.w	#$f40,waitcol

		lea	variables+player3(a5),a0
		lea	global_vars+player3_stats(a5),a1
		bsr	.draw_leader_bob

		move.w	#$f04,waitcol

		lea	variables+player4(a5),a0
		lea	global_vars+player4_stats(a5),a1
		bsr	.draw_leader_bob

		move.w	#$f44,waitcol

		move.l	(sp)+,a0
		rts

.draw_leader_bob
		tst.b	control_method(a0)
		beq	.not_active
		tst.w	dead_flag(a1)
		bne	.not_active

		move.l	mem_position(a0),a2
		tst.b	direction(a0)
		bne.s	.not_north
		move.l	-map_cell_size*MAP_WIDTH(a2),d0
.not_north
		cmpi.b	#1,direction(a0)
		bne.s	.not_east
		move.l	map_cell_size(a2),d0
.not_east
		cmpi.b	#2,direction(a0)
		bne.s	.not_south
		move.l	map_cell_size*MAP_WIDTH(a2),d0
.not_south
		cmpi.b	#3,direction(a0)
		bne.s	.not_west
		move.l	-map_cell_size(a2),d0
.not_west
		btst.l	#pushable_bit_num,d0
		beq.s	.not_pushable
		move.w	#2,behind_pushable(a0)
		bra.s	.skip_pushable
.not_pushable	and.l	#keep_panel,d0
		beq.s	.no_panel
		cmp.l	#(0<<panel_shift)!keep_panel_here_bit,d0
		beq.s	.no_panel
		move.w	#2,behind_pushable(a0)
		bra.s	.skip_pushable
.no_panel	clr.w	behind_pushable(a0)
.skip_pushable

		tst.b	fire_white(a0)
		beq.s	.no_white
		st.b	variables+redraw_flag(a5)
		sf.b	fire_white(a0)
.no_white
		move.w	view_xoffset(a0),d5	;d5=window top left x
		move.w	view_yoffset(a0),d7	;d7=window top left y

		tst.w	window_type(a0)		;is window 'view'?
		beq.s	.window1		;yes, then branch
		cmpi.w	#1,window_type(a0)	;is window 'store'?
		beq	.window2		;yes, then branch
		cmpi.w	#2,window_type(a0)	;is window 'vdu'?
		beq	.window3		;yes, then branch
		cmpi.w	#3,window_type(a0)	;is window 'stats'?
		beq	.window4		;yes, then branch
		cmpi.w	#6,window_type(a0)	;is window 'info'?
		beq	.window6		;yes, then branch

		rts

.window1	add.w	#145,d5
		add.w	#11,d7
		bra.s	.blit_bob

.window2	add.w	#147,d5
		add.w	#11,d7
		bra.s	.blit_bob

.window6	add.w	#147,d5
		add.w	#11,d7
		bra.s	.blit_bob

.window3	add.w	#143,d5
		add.w	#11,d7
		bra.s	.blit_bob

.window4	add.w	#147,d5
		add.w	#11,d7

.blit_bob	moveq.l	#0,d0
		tst.w	in_team(a0)
		bne.s	.in_team
		add.w	#4,d0
.in_team	add.l	#miscgfx+leader_bob,d0
		add.l	chip_mem_base,d0

		move.l  d0,a0
		move.l  (a0),a0
		adda.l	#miscgfx,a0		;a0=address of bob structure
		add.l	chip_mem_base,a0

		lea	bob_struct_size(a0),a2
		move.l	a2,(a0)

		move.w	#%11111,d6
		bsr	blit_bob		;draw leader bob now

.not_active	rts

****************************************************************************
****************************************************************************
;This will draw the views for all the active players if required.
;INPUT:		a0=address of players structure (long)
;		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	d0-d1,d5,d7
draw_view
		tst.b	control_method(a0)	;player active?
		beq	exit			;no, then exit

		move.l	mem_position(a0),a1	;a1=player position in map
		move.w	view_xoffset(a0),d5	;d5=window top left x
		move.w	view_yoffset(a0),d7	;d7=window top left y

		tst.w	dead_flag(a3)
		beq.s	.not_dead
		move.w	#5,window_type(a0)
.not_dead
		tst.w	lock_count(a0)
		beq.s	.no_lock
		move.l	#-1,view+VIEW_LOCK(a0)
		bra.s	.skip_lock
.no_lock	clr.l   view+VIEW_LOCK(a0)
.skip_lock
		tst.w	used_count(a0)
		beq.s	.no_used
		move.l	#-1,view+VIEW_USED(a0)
		bra.s	.skip_used
.no_used	clr.l   view+VIEW_USED(a0)
.skip_used
		tst.w	drowning_count(a0)
		beq.s	.no_drowning
		move.l	#-1,view+VIEW_DROWNING(a0)
		bra.s	.skip_drowning
.no_drowning	clr.l   view+VIEW_DROWNING(a0)
.skip_drowning
		tst.w	active_count(a0)
		beq.s	.no_active
		move.l	#-1,view+VIEW_ACTIVE(a0)
		bra.s	.skip_active
.no_active	clr.l   view+VIEW_ACTIVE(a0)
.skip_active
		tst.w	noammo_count(a0)
		beq.s	.no_noammo
		move.l	#-1,view+VIEW_NOAMMO(a0)
		bra.s	.skip_noammo
.no_noammo	clr.l   view+VIEW_NOAMMO(a0)
.skip_noammo
		tst.w	blocked_count(a0)
		beq.s	.no_blocked
		move.l	#-1,view+VIEW_BLOCKED(a0)
		bra.s	.skip_blocked
.no_blocked	clr.l   view+VIEW_BLOCKED(a0)
.skip_blocked
		tst.w	blocked2_count(a0)
		beq.s	.no_blocked2
		move.l	#-1,view+VIEW_BLOCKED2(a0)
		bra.s	.skip_blocked2
.no_blocked2	clr.l   view+VIEW_BLOCKED2(a0)
.skip_blocked2
		tst.w	invalid_count(a0)
		beq.s	.no_invalid
		move.l	#-1,view+VIEW_INVALID(a0)
		bra.s	.skip_invalid
.no_invalid	clr.l   view+VIEW_INVALID(a0)
.skip_invalid
		tst.w	noroom_count(a0)
		beq.s	.no_noroom
		move.l	#-1,view+VIEW_NOROOM(a0)
		bra.s	.skip_noroom
.no_noroom	clr.l   view+VIEW_NOROOM(a0)
.skip_noroom
		tst.b	tooheavy(a0)
		beq.s	.no_heavy
		move.l	#-1,view+VIEW_HEAVY(a0)
		bra.s	.skip_heavy
.no_heavy	clr.l   view+VIEW_HEAVY(a0)
.skip_heavy
		tst.w	claw_count(a0)
		beq.s	.no_claw
		tst.l	view+VIEW_CLAW(a0)
		bne.s	.skip_claw
		moveq.l	#0,d0
		move.w	variables+random_num(a5),d0
		mulu	#37,d0
		rol.w	#7,d0
		move.w	d0,variables+random_num(a5)
		andi.w	#%1111111,d0
		move.l	d0,view+VIEW_CLAW(a0)
		bra.s	.skip_claw
.no_claw	clr.l   view+VIEW_CLAW(a0)
.skip_claw
		tst.w	bigclaw_count(a0)
		beq.s	.no_bigclaw
		tst.l	view+VIEW_BIGCLAW(a0)
		bne.s	.skip_bigclaw
		moveq.l	#0,d0
		move.w	variables+random_num(a5),d0
		mulu	#57,d0
		rol.w	#5,d0
		move.w	d0,variables+random_num(a5)
		andi.w	#%1111111,d0
		move.l	d0,view+VIEW_BIGCLAW(a0)
		bra.s	.skip_bigclaw
.no_bigclaw	clr.l   view+VIEW_BIGCLAW(a0)
.skip_bigclaw

SETCLR_ICON	MACRO	;icon
		tst.w	spell_\1(a0)
		beq.s	.no_icon\@
		move.l	#-1,view+VIEW_\2_ICON(a0)
		bra.s	.skip_icon\@
.no_icon\@	clr.l   view+VIEW_\2_ICON(a0)
.skip_icon\@
		ENDM
		SETCLR_ICON weights,WEIGHTS
		SETCLR_ICON immu,IMMU
		SETCLR_ICON shield,SHIELD
		SETCLR_ICON wings,WINGS
		SETCLR_ICON water,WATER

		tst.b	fire_flash(a0)
		beq.s	.no_flash
		tst.b	fire_flash_dur(a0)
		beq.s	.no_flash
		subi.b	#1,fire_flash_dur(a0)
		move.l	#-1,view+VIEW_FLASH(a0)
		move.b	fire_flash(a0),view+VIEW_FLASH(a0)
		st.b	variables+redraw_flag(a5)
		bra.s	.skip_flash
.no_flash	clr.l   view+VIEW_FLASH(a0)
		sf.b	fire_flash(a0)
.skip_flash
		move.l	a3,-(sp)

		tst.w	window_type(a0)		;is window 'view'?
		beq.s	window1			;yes, then branch
		cmpi.w	#1,window_type(a0)	;is window 'store'?
		beq	window2			;yes, then branch
		cmpi.w	#2,window_type(a0)	;is window 'dts'?
		beq	window3			;yes, then branch
		cmpi.w	#3,window_type(a0)	;is window 'stats'?
		beq	window4			;yes, then branch
		cmpi.w	#5,window_type(a0)	;is window 'dead'?
		beq	window6			;yes, then branch
		cmpi.w	#6,window_type(a0)	;is window 'info'?
		beq	window2			;yes, then branch
		cmpi.w	#7,window_type(a0)	;is window 'exit'?
		beq	window7			;yes, then branch

window_exit	move.l	(sp)+,a3
exit
		IFD	DOUBLE_BUFFER
		move.w	view_window(a0),draw_window(a0)
		move.w	window_type(a0),view_window(a0)
		ENDC
		IFND	DOUBLE_BUFFER
		move.w	window_type(a0),draw_window(a0)
		ENDC
		rts

****************************************************************************
window1
		tst.b	direction(a0)		;looking north?
		bne.s	.not_north
		lea	north,a2
		lea	descan_north,a3
		bra.s	.drc_found

.not_north	cmpi.b	#1,direction(a0)	;looking east?
		bne.s	.not_east
		lea	east,a2
		lea	descan_east,a3
		bra.s	.drc_found

.not_east	cmpi.b	#2,direction(a0)	;looking south?
		bne.s	.not_south
		lea	south,a2
		lea	descan_south,a3
		bra.s	.drc_found

.not_south	lea	west,a2
		lea	descan_west,a3
		bra.s	.drc_found

.drc_found
		bsr	scan_view		;remove hidden blocks
		bsr	descan_view		;update overhead map

		lea	view(a0),a1
		move.w	warning(a0),VIEW_WARNING(a1)
		move.w	poisoned(a0),VIEW_POISONED(a1)

		move.w	draw_window(a0),d1
		cmp.w	window_type(a0),d1	;has window changed?
		bne	.force_update		;yes, then branch

		bsr	compare_views

		tst.l	view+VIEW_FLASH(a0)
		beq	.no_flash
		bsr	flash_view
		addq.w	#2,d5
		add.w	#14,d7
		move.w	d5,d0
		add.w	#142,d0
		move.w	d7,d1
		add.w	#84,d1
		BOB_WINDOW d5,d7,d0,d1
		st.b 	variables+changed(a5)
		bra	.no_view
.no_flash
	IFD	MINIMAL_REDRAW
		tst.w	d0			;any changes?
		beq	window_exit		;no, then branch
	ENDC
;		move.w	d5,d2
;		move.w	d7,d3
;		addq.w	#2,d2
;		add.w	#14,d3
;		move.w	d2,d0
;		add.w	#142,d0
;		move.w	d3,d1
;		add.w	#84,d1
;		BOB_WINDOW d2,d3,d0,d1		;define clipping window
;		moveq.l	#4<<2,d0		;clear view
;		move.w	#%1111111,d6
;		bsr	blit_player_window
;		bsr	black_out_window
;		bsr	draw_horizon
		bra.s	.same_window

.force_update
		BOB_WINDOW #0,#0,#views_plane_width,#views_plane_height-1	;define clipping window
		moveq.l	#0<<2,d0
		move.w	#%1111111,d6
		bsr     cpu_player_window

.same_window
		move.w	d5,d2
		move.w	d7,d3
		addq.w	#2,d2
		add.w	#14,d3
		move.w	d2,d0
		add.w	#142,d0
		move.w	d3,d1
		add.w	#84,d1
		BOB_WINDOW d2,d3,d0,d1		;define clipping window
		bsr	draw_horizon

		addq.w	#2,d5
		add.w	#14,d7
		move.w	d5,d0
		add.w	#142,d0
		move.w	d7,d1
		add.w	#84,d1

		BOB_WINDOW d5,d7,d0,d1		;define clipping window

		st.b 	variables+changed(a5)
		bsr	blit_view		;draw view

		tst.l	view+VIEW_CLAW(a0)
		beq	.no_claw_mesg
		movem.l	a0/d5-d7,-(sp)
		sub.w	#20,d5
		add.l	view+VIEW_CLAW(a0),d5
		move.l	#miscgfx+claws_bob,a2
		add.l	chip_mem_base,a2
		move.l  (a2),a2
		adda.l	#miscgfx,a2		;a2=address of bob structure
		add.l	chip_mem_base,a2
		lea	bob_struct_size(a2),a0	;a0=address of block structure
		move.w	#%1111111,variables+redraw_temp(a5)
		bsr	blit_block		;draw warning now
		movem.l	(sp)+,a0/d5-d7
.no_claw_mesg

		tst.l	view+VIEW_BIGCLAW(a0)
		beq	.no_bigclaw_mesg
		movem.l	a0/d5-d7,-(sp)
		sub.w	#32,d5
		add.l	view+VIEW_BIGCLAW(a0),d5
		addq.w	#2,d7
		move.l	#miscgfx+bigclaws_bob,a2
		add.l	chip_mem_base,a2
		move.l  (a2),a2
		adda.l	#miscgfx,a2		;a2=address of bob structure
		add.l	chip_mem_base,a2
		lea	bob_struct_size(a2),a0	;a0=address of block structure
		move.w	#%1111111,variables+redraw_temp(a5)
		bsr	blit_block		;draw warning now
		movem.l	(sp)+,a0/d5-d7
.no_bigclaw_mesg

.no_view	movem.l	a0/d5-d7,-(sp)
		moveq.l	#0,d0
		move.b	direction(a0),d0	;get direction
		lsl.b	#2,d0
		addi.l	#miscgfx+compass_n_bob,d0
		add.l	chip_mem_base,d0
		move.l	d0,a2
		move.l	(a2),a2
		adda.l	#miscgfx,a2		;a2=address of bob structure
		add.l	chip_mem_base,a2
		lea	bob_struct_size(a2),a0	;a0=address of block structure
		move.w	#%111111,variables+redraw_temp(a5)
		bsr	blit_block		;draw compass now
		movem.l	(sp)+,a0/d5-d7

		movem.l	d5/d7,-(sp)
		move.w	view_xoffset(a0),d5	;d5=window top left x
		move.w	view_yoffset(a0),d7	;d7=window top left y

DRAW_ICON	MACRO	;icon,icon_num
		tst.l	view+VIEW_\1_ICON(a0)
		beq	.no_icon\@
		movem.l	a0/d5-d7,-(sp)
		move.l	#miscgfx+icon\2_bob,a2
		add.l	chip_mem_base,a2
		move.l  (a2),a2
		adda.l	#miscgfx,a2		;a2=address of bob structure
		add.l	chip_mem_base,a2
		lea	bob_struct_size(a2),a0	;a0=address of block structure
		move.w	#%111111,variables+redraw_temp(a5)
		bsr	blit_block		;draw warning now
		movem.l	(sp)+,a0/d5-d7
		subi.w	#17,d5
.no_icon\@
		ENDM

		DRAW_ICON SHIELD,1
		DRAW_ICON WEIGHTS,2
		DRAW_ICON WINGS,3
		DRAW_ICON WATER,4
		DRAW_ICON IMMU,5

		movem.l	(sp)+,d5/d7

		tst.l	view+VIEW_LOCK(a0)
		beq	.no_lock_mesg
		tst.b	lock_key(a0)
		bne	.not_locked2

		movem.l	a0/d5-d7,-(sp)
		move.w	view_xoffset(a0),d5	;d5=window top left x
		move.w	view_yoffset(a0),d7	;d7=window top left y
		addi.w	#-45,d5
		addi.w	#23,d7
		move.l	#miscgfx+locked2_bob,a2
		add.l	chip_mem_base,a2
		move.l  (a2),a2
		adda.l	#miscgfx,a2		;a2=address of bob structure
		add.l	chip_mem_base,a2
		lea	bob_struct_size(a2),a0	;a0=address of block structure
		move.w	#%10111111,variables+redraw_temp(a5)
		bsr	blit_block		;draw warning now
		movem.l	(sp)+,a0/d5-d7
		bra	.no_lock_mesg
.not_locked2

		movem.l	a0/d5-d7,-(sp)
		move.w	view_xoffset(a0),d5	;d5=window top left x
		move.w	view_yoffset(a0),d7	;d7=window top left y
		addi.w	#-46,d5
		addi.w	#23,d7
		move.l	#miscgfx+locked_bob,a2
		add.l	chip_mem_base,a2
		move.l  (a2),a2
		adda.l	#miscgfx,a2		;a2=address of bob structure
		add.l	chip_mem_base,a2
		lea	bob_struct_size(a2),a0	;a0=address of block structure
		move.w	#%10111111,variables+redraw_temp(a5)
		bsr	blit_block		;draw warning now
		movem.l	(sp)+,a0/d5-d7

		movem.l	a0/d5-d7,-(sp)
		moveq.l	#0,d0
		move.b	lock_key(a0),d0
		subq.l	#1,d0
		mulu	#item_size,d0
		move.l	#items,a1
		add.w	d0,a1
		add.l	a5,a1
		moveq.l	#0,d0
		move.b	item_image(a1),d0			;image
		move.w	view_xoffset(a0),d5	;d5=window top left x
		move.w	view_yoffset(a0),d7	;d7=window top left y
		add.w	#75-46,d5
		add.w	#61+23,d7
		move.l	#item_images,a2
		add.l	a5,a2
		mulu.w	#block_structure_size,d0
		lea	bob_struct_size(a2,d0.w),a0	;a0=address of block structure
		move.w	#%10111111,variables+redraw_temp(a5)
		move.b	#set,bob_plane+0(a2)		;set colour for shadow
		move.b	#clear,bob_plane+1(a2)
		move.b	#set,bob_plane+2(a2)
		move.b	#clear,bob_plane+3(a2)
		move.b	#clear,bob_plane+4(a2)
		bsr	blit_block			;draw block now
		movem.l	(sp)+,a0/d5-d7

		movem.l	a0/d5-d7,-(sp)
		moveq.l	#0,d0
		move.b	lock_key(a0),d0
		subq.l	#1,d0
		mulu	#item_size,d0
		move.l	#items,a1
		add.w	d0,a1
		add.l	a5,a1
		moveq.l	#0,d0
		move.b	item_image(a1),d0			;image
		move.w	view_xoffset(a0),d5	;d5=window top left x
		move.w	view_yoffset(a0),d7	;d7=window top left y
		add.w	#73-46,d5
		add.w	#59+23,d7
		move.l	#item_images,a2
		add.l	a5,a2
		mulu.w	#block_structure_size,d0
		lea	bob_struct_size(a2,d0.w),a0	;a0=address of block structure
		move.w	#%0100000010111111,variables+redraw_temp(a5)
		move.b	#copy,bob_plane+0(a2)		;set colours to draw item
		move.b	#copy,bob_plane+1(a2)
		move.b	#copy,bob_plane+2(a2)
		move.b	#copy,bob_plane+3(a2)
		move.b	#copy,bob_plane+4(a2)
		move.b	#copy,bob_plane+5(a2)
		bsr	blit_block			;draw block now
		movem.l	(sp)+,a0/d5-d7
.no_lock_mesg

		tst.l	view+VIEW_USED(a0)
		beq	.no_used_mesg

		movem.l	a0/d5-d7,-(sp)
		move.w	view_xoffset(a0),d5	;d5=window top left x
		move.w	view_yoffset(a0),d7	;d7=window top left y
		addi.w	#-46,d5
		addi.w	#23,d7
		move.l	#miscgfx+locked_bob,a2
		add.l	chip_mem_base,a2
		move.l  (a2),a2
		adda.l	#miscgfx,a2		;a2=address of bob structure
		add.l	chip_mem_base,a2
		lea	bob_struct_size(a2),a0	;a0=address of block structure
		move.w	#%10111111,variables+redraw_temp(a5)
		bsr	blit_block		;draw warning now
		movem.l	(sp)+,a0/d5-d7

		movem.l	a0/d5-d7,-(sp)
		move.w	view_xoffset(a0),d5	;d5=window top left x
		move.w	view_yoffset(a0),d7	;d7=window top left y
		addi.w	#-46,d5
		addi.w	#23,d7
		move.l	#miscgfx+used_bob,a2
		add.l	chip_mem_base,a2
		move.l  (a2),a2
		adda.l	#miscgfx,a2		;a2=address of bob structure
		add.l	chip_mem_base,a2
		lea	bob_struct_size(a2),a0	;a0=address of block structure
		move.w	#%10111111,variables+redraw_temp(a5)
		bsr	blit_block		;draw warning now
		movem.l	(sp)+,a0/d5-d7

		movem.l	a0/d5-d7,-(sp)
		moveq.l	#0,d0
		move.b	used_key(a0),d0
		subq.l	#1,d0
		mulu	#item_size,d0
		move.l	#items,a1
		add.w	d0,a1
		add.l	a5,a1
		moveq.l	#0,d0
		move.b	item_image(a1),d0			;image
		move.w	view_xoffset(a0),d5	;d5=window top left x
		move.w	view_yoffset(a0),d7	;d7=window top left y
		add.w	#75-46,d5
		add.w	#61+23,d7
		move.l	#item_images,a2
		add.l	a5,a2
		mulu.w	#block_structure_size,d0
		lea	bob_struct_size(a2,d0.w),a0	;a0=address of block structure
		move.w	#%10111111,variables+redraw_temp(a5)
		move.b	#set,bob_plane+0(a2)		;set colour for shadow
		move.b	#clear,bob_plane+1(a2)
		move.b	#set,bob_plane+2(a2)
		move.b	#clear,bob_plane+3(a2)
		move.b	#clear,bob_plane+4(a2)
		bsr	blit_block			;draw block now
		movem.l	(sp)+,a0/d5-d7

		movem.l	a0/d5-d7,-(sp)
		moveq.l	#0,d0
		move.b	used_key(a0),d0
		subq.l	#1,d0
		mulu	#item_size,d0
		move.l	#items,a1
		add.w	d0,a1
		add.l	a5,a1
		moveq.l	#0,d0
		move.b	item_image(a1),d0			;image
		move.w	view_xoffset(a0),d5	;d5=window top left x
		move.w	view_yoffset(a0),d7	;d7=window top left y
		add.w	#73-46,d5
		add.w	#59+23,d7
		move.l	#item_images,a2
		add.l	a5,a2
		mulu.w	#block_structure_size,d0
		lea	bob_struct_size(a2,d0.w),a0	;a0=address of block structure
		move.w	#%0100000010111111,variables+redraw_temp(a5)
		move.b	#copy,bob_plane+0(a2)		;set colours to draw item
		move.b	#copy,bob_plane+1(a2)
		move.b	#copy,bob_plane+2(a2)
		move.b	#copy,bob_plane+3(a2)
		move.b	#copy,bob_plane+4(a2)
		move.b	#copy,bob_plane+5(a2)
		bsr	blit_block			;draw block now
		movem.l	(sp)+,a0/d5-d7
.no_used_mesg
		move.w	#%10111111,variables+redraw_temp(a5)
		bsr	messages

		movem.l	a0/d5-d7,-(sp)
		move.w	view_xoffset(a0),d5	;d5=window top left x
		move.w	view_yoffset(a0),d7	;d7=window top left y
		moveq.l	#0,d0
		move.w	player_num(a0),d0
		lsl.w	#2,d0
		move.l	#miscgfx+face1_bob,a2
		add.l	chip_mem_base,a2
		add.l	d0,a2
		move.l  (a2),a2
		adda.l	#miscgfx,a2		;a2=address of bob structure
		add.l	chip_mem_base,a2
		lea	bob_struct_size(a2),a0	;a0=address of block structure
		move.w	#%10111111,variables+redraw_temp(a5)
		bsr	blit_block		;draw warning now
		movem.l	(sp)+,a0/d5-d7

		bra     window_exit
draw_horizon
		movem.l	a0-a1/d5-d7,-(sp)

		move.l	mem_position(a0),a1
		add.l	#map_part_size*2,a1
		move.l	(a1),d0
		move.w	#sky_shift,d1
		add.b	direction(a0),d1
		btst.l	d1,d0
		beq	.no_sky

		bsr	skyline_window

		cmpi.b	#2,direction(a0)
		bne.s	.no_planet

		movem.l	a0-a1/d5-d7,-(sp)
		add.w	#22,d5
		add.w	#14,d7
		moveq.l	#0,d0
		move.l	#miscgfx+planet_bob,a2
		add.l	chip_mem_base,a2
		move.l  (a2),a2
		adda.l	#miscgfx,a2		;a2=address of bob structure
		add.l	chip_mem_base,a2
		lea	bob_struct_size(a2),a0	;a0=address of block structure
		move.w	#%10010000,variables+redraw_temp(a5)
		bsr	blit_block		;draw warning now
		movem.l	(sp)+,a0-a1/d5-d7
.no_planet
		move.l	a0,-(sp)
		move.l	#horizon_images,a1
		add.l	chip_mem_base,a1
		move.b	direction(a0),d0
		add.b	#2,d0
		andi.l	#%11,d0
		mulu	#horizon_size,d0
		add.w	d0,a1
		lea	.horizon_bob(pc),a0
		move.l	a1,(a0)
		addq.w	#2,d5
		addi.w	#24,d7
		move.w	#%110000,d6
		bsr	blit_bob
		move.l	(sp)+,a0

		move.l	#horizon_images,a1
		add.l	chip_mem_base,a1
		moveq.l	#0,d0
		move.b	direction(a0),d0
		mulu	#horizon_size,d0
		add.w	d0,a1
		lea	.horizon_bob2(pc),a0
		move.l	a1,(a0)
		move.w	#%110110,d6
		bsr	blit_bob

		movem.l	(sp)+,a0-a1/d5-d7
		rts

.no_sky		movem.l	(sp)+,a0-a1/d5-d7
		bsr	black_out_window
		rts

.horizon_bob	dc.l    0	;address of image data
		dc.w	144	;width in pixels
		dc.w	32	;height in pixels
		dc.w	0	;plane for mask 0-5 (6=no mask)
		dc.b	0	;0=unflipped 1=flipped
		dc.b	0	;0=clipping disabled 1=clipping enabled
		dc.b	2	;0=no draw 1=copy 2=clear 3=set
		dc.b    3
		dc.b    3
		dc.b    2
		dc.b    3
		dc.b    2

.horizon_bob2	dc.l    0	;address of image data
		dc.w	144	;width in pixels
		dc.w	32	;height in pixels
		dc.w	0	;plane for mask 0-5 (6=no mask)
		dc.b	0	;0=unflipped 1=flipped
		dc.b	0	;0=clipping disabled 1=clipping enabled
		dc.b	2	;0=no draw 1=copy 2=clear 3=set
		dc.b    2
		dc.b    2
		dc.b    2
		dc.b    2
		dc.b    2

flash_view
		moveq.l	#0,d1
		move.b	view+VIEW_FLASH(a0),d1	;colour
		move.w	#%1111111,d6
		move.w	#%1111111,variables+redraw_temp(a5)

		movem.l	a0/d5/d7,-(sp)
		bsr	set_window5_colour
		move.w	d5,d2
		move.w	d7,d3
		addq.w	#2,d2
		add.w	#14,d3
		move.w	d2,d0
		add.w	#142,d0
		move.w	d3,d1
		add.w	#84,d1
		BOB_WINDOW d2,d3,d0,d1		;define clipping window
		moveq.l	#4<<2,d0		;clear view
		bsr	blit_player_window
		movem.l	(sp)+,a0/d5/d7

		moveq.l	#0,d1			;colour
		bsr	set_window5_colour

		rts

flash_view2
		movem.l	a0/d5/d7,-(sp)

		move.w	#%1111111,d6
		move.w	#%1111111,variables+redraw_temp(a5)

		bsr	set_window5_colour
		moveq.l	#4<<2,d0		;clear view
		bsr	blit_player_window

		moveq.l	#0,d1			;colour
		bsr	set_window5_colour

		movem.l	(sp)+,a0/d5/d7

		rts

set_window5_colour
		movem.l	a0-a2/d0-d1,-(sp)

		move.l	#windows,a2
		add.l	a5,a2
		move.l	a2,d2
		add.w	#4<<2,a2
		move.l	(a2),a2
		add.l	d2,a2
		move.l	a2,a0			;a0=address of bob structure

		lea	bob_plane(a0),a1
	IFD	CD32
		move.w	#5,d0
	ELSEIF
		move.w	#4,d0
	ENDC
.next_plane	roxr.w	#1,d1
		bcc.s	.clear
		move.b	#3,(a1)+
		bra.s	.skip_clear
.clear		move.b	#2,(a1)+
.skip_clear	dbf	d0,.next_plane

		movem.l	(sp)+,a0-a2/d0-d1
		rts

****************************************************************************
messages
		move.w	#26,variables+info_height(a5)

		move.w	view_xoffset(a0),d5	;d5=window top left x
		move.w	view_yoffset(a0),d7	;d7=window top left y
		add.w	#3,d5
		add.w	variables+info_height(a5),d7

		tst.l	view+VIEW_NOAMMO(a0)
		beq	.no_noammo_mesg
		move.l	a0,-(sp)
		move.l	#miscgfx+noammo_bob,a2
		add.l	chip_mem_base,a2
		move.l  (a2),a2
		adda.l	#miscgfx,a2		;a2=address of bob structure
		add.l	chip_mem_base,a2
		lea	bob_struct_size(a2),a0	;a0=address of block structure
		bsr	blit_block		;draw warning now
		move.l	(sp)+,a0
		bra	.no_heavy_mesg
.no_noammo_mesg
		tst.l	view+VIEW_NOROOM(a0)
		beq	.no_noroom_mesg
		move.l	a0,-(sp)
		move.l	#miscgfx+noroom_bob,a2
		add.l	chip_mem_base,a2
		move.l  (a2),a2
		adda.l	#miscgfx,a2		;a2=address of bob structure
		add.l	chip_mem_base,a2
		lea	bob_struct_size(a2),a0	;a0=address of block structure
		bsr	blit_block		;draw warning now
		move.l	(sp)+,a0
		bra	.no_heavy_mesg
.no_noroom_mesg
		cmp.w	#6,window_type(a0)		;not info?
		beq	.ret

		tst.l	view+VIEW_HEAVY(a0)
		beq	.no_heavy_mesg
		move.l	a0,-(sp)
		move.l	#miscgfx+heavy_bob,a2
		add.l	chip_mem_base,a2
		move.l  (a2),a2
		adda.l	#miscgfx,a2		;a2=address of bob structure
		add.l	chip_mem_base,a2
		lea	bob_struct_size(a2),a0	;a0=address of block structure
		bsr	blit_block		;draw warning now
		move.l	(sp)+,a0
.no_heavy_mesg
.info
		addi.w	#17,d7

		cmpi.w	#1,window_type(a0)
		beq	.no_warning

		tst.l	view+VIEW_DROWNING(a0)
		beq	.no_drowning_mesg
		move.l	a0,-(sp)
		move.l	#miscgfx+drowning_bob,a2
		add.l	chip_mem_base,a2
		move.l  (a2),a2
		adda.l	#miscgfx,a2		;a2=address of bob structure
		add.l	chip_mem_base,a2
		lea	bob_struct_size(a2),a0	;a0=address of block structure
		bsr	blit_block		;draw warning now
		move.l	(sp)+,a0
		bra	.no_warning
.no_drowning_mesg
                tst.w	view+VIEW_POISONED(a0)
		beq.s	.no_poison
		move.l	a0,-(sp)
		moveq.l	#0,d0
		move.l	#miscgfx+poisoned_bob,a2
		add.l	chip_mem_base,a2
		move.l  (a2),a2
		adda.l	#miscgfx,a2		;a2=address of bob structure
		add.l	chip_mem_base,a2
		lea	bob_struct_size(a2),a0	;a0=address of block structure
		bsr	blit_block		;draw warning now
		move.l	(sp)+,a0
		bra	.no_warning
.no_poison
		tst.w	view+VIEW_WARNING(a0)
		beq.s	.no_warning
		move.l	a0,-(sp)
		moveq.l	#0,d0
		move.l	#miscgfx+warning_bob,a2
		add.l	chip_mem_base,a2
		move.l  (a2),a2
		adda.l	#miscgfx,a2		;a2=address of bob structure
		add.l	chip_mem_base,a2
		lea	bob_struct_size(a2),a0	;a0=address of block structure
		bsr	blit_block		;draw warning now
		move.l	(sp)+,a0
.no_warning
		addi.w	#17,d7

		cmpi.w	#1,window_type(a0)
		beq	.no_blocked2_mesg

		tst.l	view+VIEW_ACTIVE(a0)
		beq	.no_active_mesg
		move.l	a0,-(sp)
		move.l	#exgfx+active_bob,a2
		add.l	a5,a2
		move.l  (a2),a2
		adda.l	#exgfx,a2		;a2=address of bob structure
		add.l	a5,a2
		lea	bob_struct_size(a2),a0	;a0=address of block structure
		bsr	blit_block		;draw warning now
		move.l	(sp)+,a0
		bra	.no_invalid_mesg
.no_active_mesg
		tst.l	view+VIEW_BLOCKED(a0)
		beq	.no_blocked_mesg
		move.l	a0,-(sp)
		move.l	#miscgfx+blocked_bob,a2
		add.l	chip_mem_base,a2
		move.l  (a2),a2
		adda.l	#miscgfx,a2		;a2=address of bob structure
		add.l	chip_mem_base,a2
		lea	bob_struct_size(a2),a0	;a0=address of block structure
		bsr	blit_block		;draw warning now
		move.l	(sp)+,a0
		bra	.no_invalid_mesg
.no_blocked_mesg
		tst.l	view+VIEW_BLOCKED2(a0)
		beq	.no_blocked2_mesg
		move.l	a0,-(sp)
		move.l	#miscgfx+blocked2_bob,a2
		add.l	chip_mem_base,a2
		move.l  (a2),a2
		adda.l	#miscgfx,a2		;a2=address of bob structure
		add.l	chip_mem_base,a2
		lea	bob_struct_size(a2),a0	;a0=address of block structure
		bsr	blit_block		;draw warning now
		move.l	(sp)+,a0
		bra	.no_invalid_mesg
.no_blocked2_mesg
		tst.l	view+VIEW_INVALID(a0)
		beq	.no_invalid_mesg
		move.l	a0,-(sp)
		move.l	#miscgfx+invalid_bob,a2
		add.l	chip_mem_base,a2
		move.l  (a2),a2
		adda.l	#miscgfx,a2		;a2=address of bob structure
		add.l	chip_mem_base,a2
		lea	bob_struct_size(a2),a0	;a0=address of block structure
		bsr	blit_block		;draw warning now
		move.l	(sp)+,a0
.no_invalid_mesg

.ret
		rts

****************************************************************************
****************************************************************************
****************************************************************************
window2
		lea	view(a0),a1
		move.b	inven_using+inven_item_damage(a0),(a1)+
		move.b	inven_using+inven_item_gun_ammo(a0),(a1)+
		move.w	inven_posn(a0),(a1)+
		move.l	inven_using+inven_item_num(a0),(a1)+

		move.w	inven_posn(a0),d1
		mulu.w	#inven_item_size,d1
		lea	inven_store(a0),a2
		add.w	d1,a2
		move.l	inven_item_size*3(a2),(a1)+
		move.l	inven_item_size*2(a2),(a1)+
		move.l	inven_item_size*1(a2),(a1)+
		move.l	(a2),(a1)+
		move.l	inven_item_size*1(a2),(a1)+
		move.l	inven_item_size*2(a2),(a1)+
		move.l	inven_item_size*3(a2),(a1)+

		BOB_WINDOW #0,#0,#views_plane_width,#views_plane_height-1	;define clipping window

		bsr	compare_views

		move.w	draw_window(a0),d1

		cmp.w	#6,window_type(a0)	;not info?
		bne	.not_info2
		cmp.w	#1,d1
		bne	.not_info2
		tst.w	d0			;any changes?
		beq	.skip_force_update	;no, then branch
.not_info2

	IFD	MINIMAL_REDRAW
		cmp.w	window_type(a0),d1	;has window changed?
		bne.s	.force_update		;yes, then branch
	ENDC
		tst.w	d0			;any changes?
		beq	window_exit		;no, then branch
.force_update
		moveq.l	#1<<2,d0
		move.w	#%111111,d6
		bsr     cpu_player_window
.skip_force_update
		st.b 	variables+changed(a5)

		move.w	#%0100000000111111,variables+redraw_temp(a5)

		move.l	#item_images,a2
		add.l   a5,a2

		lea	inven_using(a0),a1
		moveq.l	#0,d1
		move.b	inven_using+inven_item_num(a0),d0
		move.w	#116,d5				;centre x
		move.w	#54,d7				;centre y
		bsr	.draw_item

		bsr	blit_item_text

		cmp.w	#6,window_type(a0)		;not info?
		bne	.not_info

		move.w	view_xoffset(a0),d5		;d5=window top left x
		move.w	view_yoffset(a0),d7		;d7=window top left y
		add.w	#1,d5
		add.w	#18,d7
		move.w	d5,d0
		add.w	#79,d0
		move.w	d7,d1
		add.w	#75,d1
		BOB_WINDOW d5,d7,d0,d1			;define clipping window

		move.w	view_xoffset(a0),d5		;d5=window top left x
		move.w	view_yoffset(a0),d7		;d7=window top left y
		add.w	#18,d7
		moveq.l	#5<<2,d0
		move.w	#%111111,d6
		bsr     cpu_player_window
                bsr	blit_info_text
		bra	.info
.not_info
		move.w	view_xoffset(a0),d5		;d5=window top left x
		move.w	view_yoffset(a0),d7		;d7=window top left y
		add.w	#18,d7
		move.w	d5,d0
		add.w	#80,d0
		move.w	d7,d1
		add.w	#75,d1
		BOB_WINDOW d5,d7,d0,d1			;define clipping window

		move.w	inven_posn(a0),d1		;position in inventory
		subi.w	#3,d1
		bmi.s	.no_item_3_up
		mulu.w	#inven_item_size,d1
		lea	inven_store(a0),a1
		move.b	inven_item_num(a1,d1.w),d0
		move.w	#33,d5				;centre x
		move.w	#13,d7				;centre y
		bsr	.draw_item
.no_item_3_up
		move.w	inven_posn(a0),d1		;position in inventory
		subi.w	#2,d1
		bmi.s	.no_item_2_up
		mulu.w	#inven_item_size,d1
		lea	inven_store(a0),a1
		move.b	inven_item_num(a1,d1.w),d0
		move.w	#33,d5				;centre x
		move.w	#27,d7				;centre y
		bsr	.draw_item
.no_item_2_up
		move.w	inven_posn(a0),d1		;position in inventory
		subi.w	#1,d1
		bmi.s	.no_item_1_up
		mulu.w	#inven_item_size,d1
		lea	inven_store(a0),a1
		move.b	inven_item_num(a1,d1.w),d0
		move.w	#33,d5				;centre x
		move.w	#41,d7				;centre y
		bsr	.draw_item
.no_item_1_up
		move.w	inven_posn(a0),d1		;position in inventory
		mulu.w	#inven_item_size,d1
		lea	inven_store(a0),a1
		move.b	inven_item_num(a1,d1.w),d0
		move.w	#33,d5				;centre x
		move.w	#55,d7				;centre y
		bsr	.draw_item

		move.w	inven_posn(a0),d1		;position in inventory
		addi.w	#1,d1
		cmpi.w	#inven_size+1,d1
		beq.s	.no_item_1_down
		mulu.w	#inven_item_size,d1
		lea	inven_store(a0),a1
		move.b	inven_item_num(a1,d1.w),d0
		move.w	#33,d5				;centre x
		move.w	#69,d7				;centre y
		bsr	.draw_item
.no_item_1_down
		move.w	inven_posn(a0),d1		;position in inventory
		addi.w	#2,d1
		cmpi.w	#inven_size+2,d1
		beq.s	.no_item_2_down
		mulu.w	#inven_item_size,d1
		lea	inven_store(a0),a1
		move.b	inven_item_num(a1,d1.w),d0
		move.w	#33,d5				;centre x
		move.w	#83,d7				;centre y
		bsr	.draw_item
.no_item_2_down
		move.w	inven_posn(a0),d1		;position in inventory
		addi.w	#3,d1
		cmpi.w	#inven_size+3,d1
		beq.s	.no_item_3_down
		mulu.w	#inven_item_size,d1
		lea	inven_store(a0),a1
		move.b	inven_item_num(a1,d1.w),d0
		move.w	#33,d5				;centre x
		move.w	#97,d7				;centre y
		bsr	.draw_item
.no_item_3_down
.info
		move.w	#%1111111,variables+redraw_temp(a5)
		bsr	messages

		move.w	view_xoffset(a0),d5		;d5=window top left x
		move.w	view_yoffset(a0),d7		;d7=window top left y
		move.w	d5,d0
		add.w	#32,d0
		move.w	d7,d1
		add.w	#10,d1
		BOB_WINDOW d5,d7,d0,d1			;define clipping window

		movem.l	a0/d5-d7,-(sp)
		move.w	view_xoffset(a0),d5	;d5=window top left x
		move.w	view_yoffset(a0),d7	;d7=window top left y
		moveq.l	#0,d0
		move.w	player_num(a0),d0
		lsl.w	#2,d0
		move.l	#miscgfx+face1_bob,a2
		add.l	chip_mem_base,a2
		add.l	d0,a2
		move.l  (a2),a2
		adda.l	#miscgfx,a2		;a2=address of bob structure
		add.l	chip_mem_base,a2
		lea	bob_struct_size+14(a2),a0	;a0=address of block structure
		move.w	#%111111,variables+redraw_temp(a5)
		bsr	blit_block		;draw warning now
		movem.l	(sp)+,a0/d5-d7

		bra     window_exit

;INPUT:		d0.b=item num
.draw_item
		tst.b	d0
		beq	.no_item

		move.b	inven_item_outlined(a1,d1.w),d2

		and.l	#$ff,d0
		subq.l	#1,d0
		mulu	#item_size,d0
		move.l	#items,a1
		add.w	d0,a1
		add.l	a5,a1

		move.b	item_image(a1),d3		;image

		add.w	view_xoffset(a0),d5		;d5=window top left x
		add.w	view_yoffset(a0),d7		;d7=window top left y

		tst.b	d2
		bne.s	.no_shadow
		move.b	#clear,bob_plane+0(a2)		;set colour for shadow
		move.b	#clear,bob_plane+1(a2)
		move.b	#set,bob_plane+2(a2)
		move.b	#clear,bob_plane+3(a2)
		move.b	#set,bob_plane+4(a2)
		move.b	#clear,bob_plane+5(a2)
		addi.w	#2,d5				;offset shadow slightly
		addi.w	#2,d7
		bsr	.blit_item
		subi.w	#2,d5
		subi.w	#2,d7
.no_shadow
		bsr	.outline

		move.b	#copy,bob_plane+0(a2)		;set colours to draw item
		move.b	#copy,bob_plane+1(a2)
		move.b	#copy,bob_plane+2(a2)
		move.b	#copy,bob_plane+3(a2)
		move.b	#copy,bob_plane+4(a2)
		move.b	#copy,bob_plane+5(a2)
		bsr	.blit_item

.no_item	rts

.outline
		tst.b	d2
		beq.s	.no_outline

		move.b	#set,bob_plane+0(a2)
		move.b	#clear,bob_plane+1(a2)
		move.b	#clear,bob_plane+2(a2)
		move.b	#clear,bob_plane+3(a2)
		move.b	#clear,bob_plane+4(a2)
		move.b	#clear,bob_plane+5(a2)
		subi.w	#1,d5
		bsr	.blit_item
		addi.w	#1,d5
		subi.w	#1,d7
		bsr	.blit_item
		addi.w	#1,d5
		addi.w	#1,d7
		bsr	.blit_item
		subi.w	#1,d5
		addi.w	#1,d7
		bsr	.blit_item
		subi.w	#1,d7

.no_outline	rts

.blit_item
		movem.l	a0-a2/d0-d7,-(sp)
		and.w	#$ff,d3
		mulu.w	#block_structure_size,d3
		lea	bob_struct_size(a2,d3.w),a0	;a0=address of block structure
		bsr	blit_block			;draw block now
		movem.l	(sp)+,a0-a2/d0-d7
		rts

blit_info_text
		move.l	a2,-(sp)

		move.l	#miscgfx+game_font,a2
		add.l	chip_mem_base,a2
		move.l	(a2),a2
		add.l	#miscgfx,a2
		add.l   chip_mem_base,a2
		move.w	#%001011111,d6

		TEXT_COLOUR (a2),0,0,0,0,1

		move.b	inven_using+inven_item_num(a0),d0
		beq	.no_item
		and.l	#$ff,d0
		subq.l	#1,d0
		mulu	#item_size,d0
		move.l	#items,a1
		add.w	d0,a1
		add.l	a5,a1

		move.w	view_xoffset(a0),d5
		move.w	view_yoffset(a0),d7

		add.w	#1,d5
		add.w	#20,d7
		BLIT_TEXT item_info1(a1),a2,d5,d7

		add.w	#7,d7
		BLIT_TEXT item_info2(a1),a2,d5,d7

		add.w	#7,d7
		BLIT_TEXT item_info3(a1),a2,d5,d7

		add.w	#7,d7
		BLIT_TEXT item_info4(a1),a2,d5,d7

		add.w	#7,d7
		BLIT_TEXT item_info5(a1),a2,d5,d7

		add.w	#7,d7
		BLIT_TEXT item_info6(a1),a2,d5,d7

		add.w	#7,d7
		BLIT_TEXT item_info7(a1),a2,d5,d7

		add.w	#7,d7
		BLIT_TEXT item_info8(a1),a2,d5,d7

		add.w	#7,d7
		BLIT_TEXT item_info9(a1),a2,d5,d7

		add.w	#7,d7
		BLIT_TEXT item_info10(a1),a2,d5,d7

.no_item	move.l	(sp)+,a2
		rts

blit_item_text
		move.l	a2,-(sp)

		move.l	#miscgfx+game_font,a2
		add.l	chip_mem_base,a2
		move.l	(a2),a2
		add.l	#miscgfx,a2
		add.l   chip_mem_base,a2
		move.w	#%001111111,d6

		move.w	view_xoffset(a0),d5		;name
		move.w	view_yoffset(a0),d7
		add.w	#2,d5
		add.w	#22,d7
		TEXT_COLOUR (a2),1,0,0,0,1
		move.b	#set,text_plane+5(a2)

		move.b	inven_using+inven_item_num(a0),d0
		beq	.no_item

		and.l	#$ff,d0
		subq.l	#1,d0
		mulu	#item_size,d0
		move.l	#items,a1
		add.w	d0,a1
		add.l	a5,a1
		BLIT_TEXT item_header1(a1),a2,d5,d7
		addi.w	#7,d7
		BLIT_TEXT item_header2(a1),a2,d5,d7

		cmpi.b	#"~",item_footer1+2(a1)
		beq	.no_ammo
		cmpi.b	#127,item_footer1+2(a1)
		beq	.do_ammo
		cmpi.b	#"*",item_footer1+2(a1)
		beq.s	.do_ammo

		moveq.l	#0,d0
		move.b	inven_using+inven_item_gun_ammo(a0),d0

		cmpi.b	#" ",item_footer1+1+2(a1)
		bne.s	.not_1_digit
		ITOA_1U	d0,item_footer1+2(a1)
		bra.s	.do_ammo
.not_1_digit
		cmpi.b	#" ",item_footer1+2+2(a1)
		bne.s	.not_2_digit
		ITOA_BU	d0,item_footer1+2(a1)
		bra.s	.do_ammo
.not_2_digit
		cmpi.b	#" ",item_footer1+3+2(a1)
		bne.s	.not_3_digit
		ITOA_3U	d0,item_footer1+2(a1)
.not_3_digit
.do_ammo	addi.w	#47,d7
		BLIT_TEXT item_footer1(a1),a2,d5,d7
		bra.s	.cont
.no_ammo	addi.w	#47,d7
.cont
		cmpi.b	#127,item_footer2+2(a1)
		beq.s	.do_footer2
		cmpi.b	#"~",item_footer2+2(a1)
		beq.s	.no_damage

	     	moveq.l	#0,d0
		move.b	inven_using+inven_item_damage(a0),d0
		lsl.w	#8,d0
		mulu	#100,d0
		divu	item_maxdamage(a1),d0
		ITOA_BU	d0,item_footer2+2(a1)
.do_footer2	addi.w	#7,d7
		BLIT_TEXT item_footer2(a1),a2,d5,d7
.no_damage
.no_item
		move.b	#0,text_plane+5(a2)
		move.l	(sp)+,a2

		rts

****************************************************************************
window3
		sf.b	dts_farsight(a0)
		move.l	#80,d0
		jsr	carrying_item
		cmpa.l	#0,a2
		beq.s	.not_carrying
		st.b	dts_farsight(a0)
.carrying	clr.l	view+VIEW_CARRYING_DTS(a0)
		bra.s	.skip_carrying
.not_carrying	move.l	#79,d0
		jsr	carrying_item
		cmpa.l	#0,a2
		bne.s	.carrying
		move.w	variables+random_num(a5),d1
		mulu	#53,d1
		rol.w	#7,d1
		move.w	d1,variables+random_num(a5)
		andi.l	#$3fff,d1
		add.l	#miscsfx,d1
		add.l	chip_mem_base,d1
		move.l	d1,view+VIEW_CARRYING_DTS(a0)
		bra.s	.skip_carrying
.skip_carrying
		tst.b	direction(a0)		;looking north?
		bne.s	.not_north
		lea	north,a2
		lea	descan_north,a3
		bra.s	.drc_found

.not_north	cmpi.b	#1,direction(a0)	;looking east?
		bne.s	.not_east
		lea	east,a2
		lea	descan_east,a3
		bra.s	.drc_found

.not_east	cmpi.b	#2,direction(a0)	;looking south?
		bne.s	.not_south
		lea	south,a2
		lea	descan_south,a3
		bra.s	.drc_found

.not_south	lea	west,a2
		lea	descan_west,a3
.drc_found
		bsr	scan_view		;remove hidden blocks
		bsr	descan_view		;update overhead map
		lea	view(a0),a4
		move.b	scroll_x(a0),VIEW_SCROLL(a4)
		move.b	scroll_y(a0),VIEW_SCROLL+1(a4)

		bsr	compare_views

		move.w	draw_window(a0),d1
		cmp.w	window_type(a0),d1	;has window type changed?
		bne.s	.force_update		;yes, then branch

	IFD	MINIMAL_REDRAW
		tst.w	d0			;any changes?
		beq	window_exit		;no, then branch
	ENDC
		bra	.same_window

.force_update
		st.b 	variables+changed(a5)
		BOB_WINDOW #0,#0,#views_plane_width,#views_plane_height-1	;define clipping window
		moveq.l	#2<<2,d0
		move.w	#%1111111,d6
		bsr	cpu_player_window

		move.w	view_xoffset(a0),d5		;d5=window top left x
		move.w	view_yoffset(a0),d7		;d7=window top left y
		move.w	d5,d0
		add.w	#48,d0
		move.w	d7,d1
		add.w	#10,d1
		BOB_WINDOW d5,d7,d0,d1			;define clipping window

		movem.l	a0/d5-d7,-(sp)
		move.w	view_xoffset(a0),d5	;d5=window top left x
		move.w	view_yoffset(a0),d7	;d7=window top left y
		moveq.l	#0,d0
		move.w	player_num(a0),d0
		lsl.w	#2,d0
		move.l	#miscgfx+face1_bob,a2
		add.l	chip_mem_base,a2
		add.l	d0,a2
		move.l  (a2),a2
		adda.l	#miscgfx,a2		;a2=address of bob structure
		add.l	chip_mem_base,a2
		lea	bob_struct_size+14(a2),a0	;a0=address of block structure
		move.w	#%10011111,variables+redraw_temp(a5)
		bsr	blit_block		;draw warning now
		movem.l	(sp)+,a0/d5-d7

		BOB_WINDOW #0,#0,#views_plane_width,#views_plane_height-1	;define clipping window

		bra	.skip_same_window
.same_window
		st.b 	variables+changed(a5)
		move.w	d5,window_start_x
		add.w	#144,window_start_x
		move.w	d7,window_start_y
		add.w	#52,window_start_y
		move.w	window_start_x,window_end_x
		add.w	#16,window_end_x
		move.w	window_start_y,window_end_y
		add.w	#6,window_end_y

		moveq.l	#2<<2,d0
		move.w	#%1101111,d6
		bsr	cpu_player_window

		move.w	d5,window_start_x
		add.w	#13,window_start_x
		move.w	d7,window_start_y
		add.w	#16,window_start_y
		move.w	window_start_x,window_end_x
		add.w	#128,window_end_x
		move.w	window_start_y,window_end_y
		add.w	#79,window_end_y

		move.l	view+VIEW_CARRYING_DTS(a0),d0
		bne.s	.not_carrying_dts
		moveq.l	#2<<2,d0
		move.w	#%1010000,d6
		bsr	cpu_player_window
.not_carrying_dts
.skip_same_window
		add.w	#13,d5
		add.w	#16,d7
		move.w	d5,d0
		add.w	#128,d0
		move.w	d7,d1
		add.w	#79,d1
		BOB_WINDOW d5,d7,d0,d1		;define clipping window
.skip_window_size
		move.l	view+VIEW_CARRYING_DTS(a0),d0
		beq.s	.carrying_dts
		bsr	white_out_window
		st.b	variables+redraw_flag(a5)
		bra     window_exit
.carrying_dts
		move.l	#gamegfx+mapblocks,a2
		add.l	chip_mem_base,a2
		move.l	(a2),a2
		adda.l	#gamegfx,a2
		add.l	chip_mem_base,a2

		move.w	#16,bob_width(a2)
		move.w	#16,bob_height(a2)

		move.l	#map,a1
		add.l   a5,a1
		moveq.l	#0,d0
		moveq.l	#0,d1
		move.b	floor(a0),d0
		mulu.w	#MAP_WIDTH*MAP_DEPTH*map_cell_size,d0
		move.b	scroll_y(a0),d1

		cmpi.b	#2,d1
		bgt.s	.y_l_ok
		move.b	#2,d1
		move.b	d1,scroll_y(a0)
.y_l_ok		cmpi.b	#20,d1
		blt.s	.y_g_ok
		move.b	#20,d1
		move.b	d1,scroll_y(a0)
.y_g_ok
		mulu.w	#MAP_WIDTH,d1
		move.b	scroll_x(a0),d2

		cmpi.b	#4,d2
		bgt.s	.x_l_ok
		move.b	#4,d2
		move.b	d2,scroll_x(a0)
.x_l_ok		cmpi.b	#18,d2
		blt.s	.x_g_ok
		move.b	#18,d2
		move.b	d2,scroll_x(a0)
.x_g_ok
		ext.w	d2
		add.w	d2,d1
		lsl.w	#2,d1
		add.l	d0,a1
		add.w	d1,a1
		add.l	#map_data1,a1

		move.l	a1,a4				;address of player in part 1
		add.l	#map_part_size,a1		;address of player in part 2
		move.w	seen_bit_num(a0),d2
		move.w	#44,d0				;number of blocks to draw
		lea	map_offsets,a3
.next_block
		move.w	(a3)+,d3
		move.w	view_xoffset(a0),d5		;d5=window top left x
		move.w	view_yoffset(a0),d7		;d7=window top left y
		add.w	#69,d5				;x co
		add.w	#48,d7				;y co
		add.w	(a3)+,d5
		add.w	(a3)+,d7

		move.w	d3,d4
		sub.w	#map_cell_size*MAP_WIDTH*MAP_DEPTH,d4
		move.l  0(a4,d4.w),d6
		move.l  0(a4,d3.w),d4

		movem.l	d0/a1,-(sp)
		add.l	#map_part_size,a1
		move.l  0(a1,d3.w),d0
		move.b	#2,bob_plane+5(a2)
		btst.l	#keep_light_bit_num,d0		;light here?
		beq.s	.no_light			;no, then branch
		move.b	#3,bob_plane+5(a2)
.no_light	movem.l	(sp)+,d0/a1

		move.l  0(a1,d3.w),d3

		tst.b	dts_farsight(a0)
		bne.s	.farsight
		btst.l	d2,d3				;seen this block?
		bne.s	.block_here			;no, then branch
		moveq.l	#0,d3
		move.b	#2,bob_plane+5(a2)
		bra.s	.no_block_here
.block_here
.farsight
		btst.l	#question_mark_bit_num,d3	;question mark here?
		beq.s	.no_q_mark			;no, then branch
		move.w	#31,d3
.no_q_mark
		btst.l	#pushable_bit_num,d4		;pushable block?
		beq.s	.no_p_mark			;no, then branch
		and.l	#keep_block,d4
		move.w	#23,d3
		cmp.l	#(1<<block_shift)!keep_block_here_bit,d4
		bne.s	.not_a_pushable
		move.w	#15,d3
.not_a_pushable
.no_p_mark
		andi.w	#keep_2D_block,d3
		bne.s	.not_blank
		and.l	#keep_block,d6
		cmpi.l	#(1<<block_shift)!keep_block_here_bit,d6
		bne.s	.not_blank2
		move.w	#63,d3
		bra.s	.not_blank
.not_blank2	move.b	#2,bob_plane+5(a2)
.not_blank
		lsl.w	#7,d3

.no_block_here
		move.w	#%101111,d6
		cmpi.w	#39*128,d3
		bne.s	.not_field
		move.b	#2,bob_plane+5(a2)
		move.w	#%111111,d6
.not_field	movem.l	a0-a4/d0-d2,-(sp)
		lea	bob_struct_size(a2,d3.w),a4
		move.l	a4,bob_address(a2)		;set address of image
		lea	(a2),a0
		jsr	blit_bob
		movem.l	(sp)+,a0-a4/d0-d2

		dbf	d0,.next_block

		moveq.l	#0,d5
		move.b	xpos(a0),d5
		sub.b	scroll_x(a0),d5
		ext.w	d5
		asl.w	#4,d5
		add.w	view_xoffset(a0),d5		;d5=window top left x
		move.w	view_yoffset(a0),d7		;d7=window top left y

		move.l	a0,-(sp)
		move.l	#miscgfx+vertline_bob,a2
		add.l	chip_mem_base,a2
		move.l	(a2),a2
		adda.l	#miscgfx,a2
		add.l	chip_mem_base,a2
		move.b	#2,bob_plane+5(a2)
		lea	bob_struct_size(a2),a0
		move.w	#%101111,variables+redraw_temp(a5)
		bsr	blit_block
		move.l	(sp)+,a0

		move.w	view_xoffset(a0),d5		;d5=window top left x
		moveq.l	#0,d7
		move.b	ypos(a0),d7
		sub.b	scroll_y(a0),d7
		ext.w	d7
		asl.w	#4,d7
		add.w	view_yoffset(a0),d7		;d7=window top left y

		move.l	a0,-(sp)
		move.l	#miscgfx+horizline_bob,a2
		add.l	chip_mem_base,a2
		move.l	(a2),a2
		adda.l	#miscgfx,a2
		add.l	chip_mem_base,a2
		move.b	#2,bob_plane+5(a2)
		lea	bob_struct_size(a2),a0
		move.w	#%101111,variables+redraw_temp(a5)
		bsr	blit_block
		move.l	(sp)+,a0

		moveq.l	#0,d5
		move.b	xpos(a0),d5
		sub.b	scroll_x(a0),d5
		ext.w	d5
		asl.w	#4,d5
		add.w	view_xoffset(a0),d5		;d5=window top left x
		subq.w	#7,d5
		moveq.l	#0,d7
		move.b	ypos(a0),d7
		sub.b	scroll_y(a0),d7
		ext.w	d7
		asl.w	#4,d7
		add.w	view_yoffset(a0),d7		;d7=window top left y
		subq.w	#7,d7

		move.l	a0,-(sp)
		move.l	#miscgfx+rotations_bob,a2
		add.l	chip_mem_base,a2
		move.l  (a2),a2
		adda.l	#miscgfx,a2		;a2=address of bob structure
		add.l	chip_mem_base,a2
		move.b	#2,bob_plane+5(a2)
		moveq.l	#0,d0
		move.b	direction(a0),d0
		mulu	#block_structure_size,d0
		lea	bob_struct_size(a2,d0.w),a0	;a0=address of block structure
		move.w	#%1101111,variables+redraw_temp(a5)
		bsr	blit_block		;draw warning now
		move.l	(sp)+,a0

		BOB_WINDOW #0,#0,#views_plane_width,#views_plane_height-1	;define clipping window

		move.l	#miscgfx+game_font,a2
		add.l	chip_mem_base,a2
		move.l	(a2),a2
		add.l	#miscgfx,a2
		add.l   chip_mem_base,a2
		move.w	#%001001111,d6

		moveq.l	#0,d0
		move.b	map+exit_pos+0(a5),d0
		sub.b	xpos(a0),d0
		bpl.s	.x_plus
		neg.b	d0
.x_plus		lsl.w	#1,d0
		mulu	d0,d0
		moveq.l	#0,d1
		move.b	map+exit_pos+1(a5),d1
		sub.b	ypos(a0),d1
		bpl.s	.y_plus
		neg.b	d1
.y_plus		lsl.w	#1,d1
		mulu	d1,d1
		moveq.l	#0,d2
		move.b	map+exit_pos+2(a5),d2
		sub.b	floor(a0),d2
		bpl.s	.floor_plus
		neg.b	d2
.floor_plus	lsl.w	#1,d2
		mulu	d2,d2
		add.l	d1,d0
		add.l	d2,d0
		jsr	square_root
		ITOA_BU	d3,.range_finder

		TEXT_COLOUR (a2),0,1,0,0,1
		move.w	view_xoffset(a0),d5
		move.w	view_yoffset(a0),d7
		add.w	#144,d5
		add.w	#52,d7
		BLIT_TEXT .range_finder,a2,d5,d7

		bra     window_exit

.range_finder	dc.b	"88",0
		even

****************************************************************************
window4
		lea	view(a0),a1
		move.w	fitness(a3),(a1)+
		move.w	physique(a3),(a1)+
		move.w	agility(a3),(a1)+
		move.w	experience(a3),(a1)+
		move.w	weight(a0),(a1)+

		lea	view(a0),a1
		bsr	compare_views

		move.w	draw_window(a0),d1
		cmp.w	window_type(a0),d1	;has window changed?
		bne.s	.force_update		;yes, then branch

	IFD	MINIMAL_REDRAW
		tst.w	d0			;any changes?
		beq	window_exit		;no, then branch
	ENDC

		movem.l	d0-d7/a0-a6,-(sp)
		move.w	d5,d2
		move.w	d7,d3
		add.w	#112,d2
		add.w	#41,d3
		move.w	d2,d0
		add.w	#32,d0
		move.w	d3,d1
		add.w	#47,d1
		BOB_WINDOW d2,d3,d0,d1		;define clipping window
		bra	.same_window
.force_update
		movem.l	d0-d7/a0-a6,-(sp)

		BOB_WINDOW #0,#0,#views_plane_width,#views_plane_height-1	;define clipping window

.same_window
		st.b 	variables+changed(a5)

		moveq.l	#3<<2,d0
		move.w	#%1111111,d6
		bsr     cpu_player_window

		movem.l	a0/d5-d7,-(sp)
		move.w	view_xoffset(a0),d5	;d5=window top left x
		move.w	view_yoffset(a0),d7	;d7=window top left y
		moveq.l	#0,d0
		move.w	player_num(a0),d0
		lsl.w	#2,d0
		move.l	#miscgfx+face1_bob,a2
		add.l	chip_mem_base,a2
		add.l	d0,a2
		move.l  (a2),a2
		adda.l	#miscgfx,a2		;a2=address of bob structure
		add.l	chip_mem_base,a2
		lea	bob_struct_size+14(a2),a0	;a0=address of block structure
		move.w	#%10011111,variables+redraw_temp(a5)
		bsr	blit_block		;draw warning now
		movem.l	(sp)+,a0/d5-d7

		move.w	head_images(a0),d0
		subi.w	#32,d0
		move.l	#miscgfx+player_addresses,a1
		add.l	chip_mem_base,a1
		lsl.w	#2,d0
		move.l	0(a1,d0.w),a2		;get address of structures
		add.l	#miscgfx,a2
		add.l	chip_mem_base,a2

		move.w	#44,d3
		mulu.w	#block_structure_size,d3

		move.w	view_xoffset(a0),d5
		add.w	#19,d5
		move.w	view_yoffset(a0),d7
		add.w	#25,d7

		move.l	a0,-(sp)
		lea	bob_struct_size(a2,d3.w),a0	;a0=address of block structure
		clr.w	d4
		move.w	#%1011111,variables+redraw_temp(a5)
		move.b	#3,bob_plane+0(a2)
		move.b	#2,bob_plane+1(a2)
		move.b	#3,bob_plane+2(a2)
		move.b	#2,bob_plane+3(a2)
		move.b	#3,bob_plane+4(a2)
		bsr	block_draw		;draw block now

		subq.l	#1,d5
		subq.l	#1,d7
		move.b	#2,bob_plane+0(a2)
		move.b	#2,bob_plane+1(a2)
		move.b	#3,bob_plane+2(a2)
		move.b	#2,bob_plane+3(a2)
		move.b	#3,bob_plane+4(a2)
		bsr	block_draw		;draw block now

		subq.l	#1,d5
		subq.l	#1,d7
		move.b	#3,bob_plane+0(a2)
		move.b	#3,bob_plane+1(a2)
		move.b	#2,bob_plane+2(a2)
		move.b	#2,bob_plane+3(a2)
		move.b	#3,bob_plane+4(a2)
		bsr	block_draw		;draw block now

		subq.l	#1,d5
		subq.l	#1,d7
		move.b	#1,bob_plane+0(a2)
		move.b	#1,bob_plane+1(a2)
		move.b	#1,bob_plane+2(a2)
		move.b	#1,bob_plane+3(a2)
		move.b	#2,bob_plane+4(a2)
		bsr	block_draw		;draw block now
		move.l	(sp)+,a0

		move.l	#miscgfx+game_font,a2
		add.l	chip_mem_base,a2
		move.l	(a2),a2
		add.l	#miscgfx,a2
		add.l   chip_mem_base,a2
		move.w	#%1011111,d6

		move.w	view_xoffset(a0),d5		;name
		move.w	view_yoffset(a0),d7
		add.w	#55,d5
		add.w	#20,d7
		TEXT_COLOUR (a2),0,0,0,1,0
		BLIT_TEXT player_name(a3),a2,d5,d7

		move.b	race(a3),d0			;race
		ext.w	d0
		lsl.w	#4,d0
		lea	races(pc),a1
		add.w	d0,a1

		move.w	view_xoffset(a0),d5
		move.w	view_yoffset(a0),d7
		add.w	#113,d5
		add.w	#29,d7
		TEXT_COLOUR (a2),1,0,0,0,1
		BLIT_TEXT (a1),a2,d5,d7

		move.b	gender(a3),d0			;gender
		ext.w	d0
		lsl.w	#4,d0
		lea	genders(pc),a1
		add.w	d0,a1

		move.w	view_xoffset(a0),d5
		move.w	view_yoffset(a0),d7
		add.w	#113,d5
		add.w	#20,d7
		TEXT_COLOUR (a2),1,0,0,0,1
		BLIT_TEXT (a1),a2,d5,d7

		move.b	class(a3),d0			;class
		ext.w	d0
		lsl.w	#4,d0
		lea	classes(pc),a1
		add.w	d0,a1

		move.w	view_xoffset(a0),d5
		move.w	view_yoffset(a0),d7
		add.w	#55,d5
		add.w	#29,d7
		TEXT_COLOUR (a2),0,1,1,0,1
		BLIT_TEXT (a1),a2,d5,d7

		move.w	view_xoffset(a0),d5		;fitness
		move.w	view_yoffset(a0),d7
		add.w	#111,d5
		add.w	#41,d7
		moveq.l	#0,d0
		move.w	fitness(a3),d0
		divu	#655,d0
		ITOA_WU d0,fitness_text(pc)
		TEXT_COLOUR (a2),0,0,0,0,1
		tst.w	poisoned_strength(a0)
		beq.s	.not_red2
		TEXT_COLOUR (a2),0,1,0,0,1
.not_red2	BLIT_TEXT fitness_text(pc),a2,d5,d7

		move.w	view_xoffset(a0),d5		;physique
		move.w	view_yoffset(a0),d7
		add.w	#114,d5
		add.w	#51,d7
		ITOA_WU physique(a3),physique_text(pc)
		TEXT_COLOUR (a2),0,0,0,0,1
		BLIT_TEXT physique_text(pc),a2,d5,d7

		move.w	view_xoffset(a0),d5		;agility
		move.w	view_yoffset(a0),d7
		add.w	#114,d5
		add.w	#61,d7
		ITOA_WU agility(a3),intell_text(pc)
		TEXT_COLOUR (a2),0,0,0,0,1
		BLIT_TEXT intell_text(pc),a2,d5,d7

		move.w	view_xoffset(a0),d5		;experience
		move.w	view_yoffset(a0),d7
		add.w	#114,d5
		add.w	#71,d7
		ITOA_WU experience(a3),weap_skill_text(pc)
		TEXT_COLOUR (a2),0,0,0,0,1
		BLIT_TEXT weap_skill_text(pc),a2,d5,d7

		move.w	view_xoffset(a0),d5		;carrying
		move.w	view_yoffset(a0),d7
		add.w	#104,d5
		add.w	#81,d7
		move.l	weight(a0),d0
		divu	#1000,d0
		ITOA_WU d0,weight_text(pc)
		TEXT_COLOUR (a2),0,0,0,0,1
		tst.b	tooheavy(a0)
		beq.s	.not_red
		TEXT_COLOUR (a2),0,1,0,0,1
.not_red	BLIT_TEXT weight_text(pc),a2,d5,d7

		movem.l	(sp)+,d0-d7/a0-a6

		bra     window_exit

fitness_text	dc.b	"      ",0
physique_text	dc.b	"      ",0
intell_text	dc.b	"      ",0
weap_skill_text	dc.b	"      ",0
weight_text	dc.b	"      ",0

		CNOP	0,16
races		PHRASE	241
		dc.b	ENDTEXT				;0
		CNOP	0,16
		PHRASE	242
		dc.b	ENDTEXT			;1
		CNOP	0,16
		PHRASE	243
		dc.b	ENDTEXT			;2
		CNOP	0,16
		PHRASE	244
		dc.b	ENDTEXT		;3
		CNOP	0,16
		PHRASE	245
		dc.b	ENDTEXT		;4
		CNOP	0,16
		dc.b	"",ENDTEXT		;5
		CNOP	0,16
		dc.b	"",ENDTEXT		;6
		CNOP	0,16
		dc.b	"",ENDTEXT		;7
		CNOP	0,16
		dc.b	"",ENDTEXT		;8
		CNOP	0,16
		dc.b	"",ENDTEXT		;9
		CNOP	0,16

genders		PHRASE  246
		dc.b	ENDTEXT			;0
		CNOP	0,16
		PHRASE  247
		dc.b	ENDTEXT		;1
		CNOP	0,16
		PHRASE  248
		dc.b	ENDTEXT			;2
		CNOP	0,16

classes		PHRASE  249
		dc.b	ENDTEXT		;0
		CNOP	0,16
		PHRASE	250
		dc.b	ENDTEXT		;1
		CNOP	0,16
		PHRASE	251
		dc.b	ENDTEXT		;2
		CNOP	0,16
		PHRASE	252,
		dc.b	ENDTEXT			;3
		CNOP	0,16
		PHRASE	253,
		dc.b	ENDTEXT		;4
		CNOP	0,16
		PHRASE	254,
		dc.b	ENDTEXT			;5
		CNOP	0,16
		PHRASE	255,
		dc.b	ENDTEXT		;6
		CNOP	0,16
		PHRASE	256,
		dc.b	ENDTEXT		;7
		CNOP	0,16
		PHRASE	257,
		dc.b	ENDTEXT			;8
		CNOP	0,16
		PHRASE	258,
		dc.b	ENDTEXT		;9
		CNOP	0,16
		PHRASE	259,
		dc.b	ENDTEXT		;10
		CNOP	0,16
		PHRASE	255,
		dc.b	ENDTEXT		;11
		CNOP	0,16
		PHRASE	260,
		dc.b	ENDTEXT		;12
		CNOP	0,16
		PHRASE	261,
		dc.b	ENDTEXT			;13
		CNOP	0,16
		dc.b	"Porn King"
		dc.b	ENDTEXT		;14
		CNOP	0,16

		dc.b	"Borg",ENDTEXT			;15
		CNOP	0,16
		dc.b	"Early Cyborg",ENDTEXT		;16
		CNOP	0,16
		dc.b	"Barbarella",ENDTEXT		;17
		CNOP	0,16

		even

****************************************************************************
window6
		lea	view(a0),a1
		bsr	compare_views

		move.w	draw_window(a0),d1
		cmp.w	window_type(a0),d1	;has window changed?
	IFD	MINIMAL_REDRAW
		bne.s	.force_update		;yes, then branch
	ENDC
		tst.w	d0			;any changes?
		beq	window_exit		;no, then branch
.force_update
		st.b 	variables+changed(a5)

		moveq.l	#0,d1
		move.b	#%101,d1		;colour
		bsr	set_window5_colour

		BOB_WINDOW #0,#0,#views_plane_width,#views_plane_height-1	;define clipping window
		moveq.l	#4<<2,d0
		move.w	#%1111111,d6
		bsr     blit_player_window

		movem.l	a0/d5-d7,-(sp)
		add.w	#23,d5
		add.w	#22,d7
		move.l	#miscgfx+rip_bob,a2
		add.l	chip_mem_base,a2
		move.l	(a2),a2
		adda.l	#miscgfx,a2
		add.l	chip_mem_base,a2
		lea	bob_struct_size(a2),a0
		move.w	#%11111,variables+redraw_temp(a5)
		bsr	blit_block		;draw compass now
		movem.l	(sp)+,a0/d5-d7

		moveq.l	#0,d1
		move.b	#%0,d1			;colour
		bsr	set_window5_colour

		bra     window_exit

****************************************************************************
window7
		lea	view(a0),a1
		bsr	compare_views

		move.w	draw_window(a0),d1
		cmp.w	window_type(a0),d1	;has window changed?
	IFD	MINIMAL_REDRAW
		bne.s	.force_update		;yes, then branch
	ENDC
		tst.w	d0			;any changes?
		beq	window_exit		;no, then branch
.force_update
		st.b 	variables+changed(a5)

		moveq.l	#0,d1
		move.b	#%101,d1		;colour
		bsr	set_window5_colour

		BOB_WINDOW #0,#0,#views_plane_width,#views_plane_height-1	;define clipping window
		moveq.l	#4<<2,d0
		move.w	#%1111111,d6
		bsr     blit_player_window

		movem.l	a0/d5-d7,-(sp)
		add.w	#22,d7
		move.l	#miscgfx+exit_bob,a2
		add.l	chip_mem_base,a2
		move.l	(a2),a2
		adda.l	#miscgfx,a2
		add.l	chip_mem_base,a2
		lea	bob_struct_size(a2),a0
		move.w	#%11111,variables+redraw_temp(a5)
		bsr	blit_block
		movem.l	(sp)+,a0/d5-d7

		moveq.l	#0,d1
		move.b	#%0,d1			;colour
		bsr	set_window5_colour

		move.l	#miscgfx+game_font,a2
		add.l	chip_mem_base,a2
		move.l	(a2),a2
		add.l	#miscgfx,a2
		add.l   chip_mem_base,a2
		move.w	#%1011111,d6

		move.w	#"0",d0
		move.w	player_num(a0),d0

		cmpi.w	#0,d0
		bne.s	.not_player1
		move.w	#"1",d0
		bra.s	.do_it
.not_player1
		cmpi.w	#1,d0
		bne.s	.not_player2
		move.w	#"3",d0
		bra.s	.do_it
.not_player2
		cmpi.w	#2,d0
		bne.s	.not_player3
		move.w	#"2",d0
		bra.s	.do_it
.not_player3
		cmpi.w	#3,d0
		bne.s	.not_player4
		move.w	#"4",d0
		bra.s	.do_it
.not_player4

.do_it		move.b	d0,.win7_key

		move.w	view_xoffset(a0),d5		;name
		move.w	view_yoffset(a0),d7
		add.w	#32,d5
		add.w	#80,d7
		TEXT_COLOUR (a2),1,0,1,0,0
		BLIT_TEXT .win7_text,a2,d5,d7

		add.w	#7,d7
		BLIT_TEXT .win7_text2,a2,d5,d7

		tst.l	view+VIEW_BLOCKED(a0)
		beq	.no_blocked_mesg

		movem.l	a0/d5-d7,-(sp)
		move.w	view_xoffset(a0),d5	;d5=window top left x
		move.w	view_yoffset(a0),d7	;d7=window top left y
		move.l	#miscgfx+blocked_bob,a2
		add.l	chip_mem_base,a2
		move.l  (a2),a2
		adda.l	#miscgfx,a2		;a2=address of bob structure
		add.l	chip_mem_base,a2
		lea	bob_struct_size(a2),a0	;a0=address of block structure
		move.w	#%10011111,variables+redraw_temp(a5)
		bsr	blit_block		;draw warning now
		movem.l	(sp)+,a0/d5-d7
.no_blocked_mesg

		bra     window_exit

.win7_text	PHRASE	262
.win7_key	dc.b	"x "
		dc.b    ENDTEXT

.win7_text2	PHRASE	263
		dc.b    ENDTEXT
		even

****************************************************************************
cpu_player_window
		movem.l	a0-a1,-(sp)

		move.l	#windows,a2
		add.l	a5,a2
		move.l	a2,d1

		add.w	d0,a2
		move.l	(a2),a2
		add.l	d1,a2
		move.l	a2,a0			;a0=address of bob structure

		lea	bob_struct_size(a0),a1
		move.l	a1,bob_address(a0)

		move.b	#2,bob_plane+5(a0)
		jsr	cpu_bob			;draw block now
		movem.l	(sp)+,a0-a1

		rts

blit_player_window
		movem.l	a0-a1,-(sp)

		move.l	#windows,a2
		add.l	a5,a2
		move.l	a2,d2

		add.w	d0,a2
		move.l	(a2),a2
		add.l	d2,a2
		move.l	a2,a0			;a0=address of bob structure

		lea	bob_struct_size(a0),a1
		move.l	a1,bob_address(a0)

		move.b	#2,bob_plane+5(a0)
		jsr	blit_bob		;draw block now
		movem.l	(sp)+,a0-a1

		rts


white_out_window
		movem.l	a0-a1,-(sp)

		move.l	d0,.bob
		lea	.bob,a0
		move.w	#%1,d6
		jsr	blit_bob		;draw block now

		movem.l	(sp)+,a0-a1

		rts

.bob		dc.l    0	;address of image data
		dc.w	160	;width in pixels
		dc.w	103	;height in pixels
		dc.w	6	;plane for mask 0-5 (6=no mask)
		dc.b	%100	;1=flipped 2=ignore d5/d7 3=random flip
		dc.b	1	;0=clipping disabled 1=clipping enabled
		dc.b	1	;0=no draw 1=copy 2=clear 3=set
		dc.b    0
		dc.b    0
		dc.b    0
		dc.b    0
		dc.b    0

black_out_window
		movem.l	a0-a1,-(sp)

		lea	.bob,a0
		move.w	#%111111,d6
		jsr	blit_bob		;draw block now

		movem.l	(sp)+,a0-a1

		rts

.bob		dc.l    0	;address of image data
		dc.w	160	;width in pixels
		dc.w	103	;height in pixels
		dc.w	6	;plane for mask 0-5 (6=no mask)
		dc.b	0	;1=flipped 2=ignore d5/d7 3=random flip
		dc.b	1	;0=clipping disabled 1=clipping enabled
		dc.b	2	;0=no draw 1=copy 2=clear 3=set
		dc.b    2
		dc.b    2
		dc.b    2
		dc.b    2
		dc.b    2

skyline_window
		movem.l	a0-a1/d7,-(sp)

		lea	.bob1,a0
		move.w	#%111111,d6
		jsr	blit_bob		;draw block now

		add.w	#56,d7

		lea	.bob2,a0
		move.w	#%111111,d6
		jsr	blit_bob		;draw block now

		movem.l	(sp)+,a0-a1/d7

		rts

.bob1		dc.l    0	;address of image data
		dc.w	160	;width in pixels
		dc.w	56	;height in pixels
		dc.w	6	;plane for mask 0-5 (6=no mask)
		dc.b	0	;1=flipped 2=ignore d5/d7 3=random flip
		dc.b	1	;0=clipping disabled 1=clipping enabled
		dc.b	2	;0=no draw 1=copy 2=clear 3=set
		dc.b    3
		dc.b    3
		dc.b    2
		dc.b    2
		dc.b    3

.bob2		dc.l    0	;address of image data
		dc.w	160	;width in pixels
		dc.w	56	;height in pixels
		dc.w	6	;plane for mask 0-5 (6=no mask)
		dc.b	0	;1=flipped 2=ignore d5/d7 3=random flip
		dc.b	1	;0=clipping disabled 1=clipping enabled
		dc.b	2	;0=no draw 1=copy 2=clear 3=set
		dc.b    2
		dc.b    2
		dc.b    2
		dc.b    2
		dc.b    2

****************************************************************************
****************************************************************************
;Flag which blocks have been seen in the overhead map.
;INPUT:		a3=address of pointers to descan block positions (long)
;		a0=address of players structure (long)
;		a1=player memory position in map (long)
;		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	d0-d4,a2

descan_view
		move.l	a1,a4
		add.l	#map_part_size,a4	;address of player in part 2

		move.w	#66,d0
		moveq.l	#0,d4

		move.w	seen_bit_num(a0),d1
		bset.l	d1,d4
		lea	view+3(a0),a2

.next_block	move.w	(a3)+,d1
		cmpi.w	#-1,d1
		beq.s	.cant_see_block

		btst.b	#invisible_bit_num,(a2)
		bne.s	.cant_see_block

		move.l	0(a4,d1.w),d2
		and.l	d4,d2
		bne.s	.seen_already
		addi.w	#EXP_NEWBLOCK,exp(a0)
.seen_already	or.l	d4,0(a4,d1.w)

.cant_see_block	addq.l	#4,a2
		dbf	d0,.next_block

		rts

****************************************************************************
****************************************************************************
;This will scan the view and remove hidden blocks.
;INPUT:		a2=address of pointers to view block positions (long)
;		a1=player memory position in map (long)
;		a0=address of players structure (long)
;		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	d0-d4

scan_view
	IFD	CD32
		movem.l	a0/a2-a4,-(sp)
		lea	view(a0),a0
		lea	VIEW_SIZE*map_cell_size(a0),a3
		move.l	a1,a4
                add.l	#map_part_size*2,a4
		move.w	#66,d0
.next_block	move.l	(a2)+,d1		;d1=offset to a block
		move.l	0(a1,d1.w),(a0)+	;insert compacted block code
		move.l	0(a4,d1.w),(a3)+	;insert compacted block3 code
		dbf	d0,.next_block
		movem.l	(sp)+,a0/a2-a4
	ELSEIF
		movem.l	a0/a2,-(sp)
		lea	view(a0),a0
		move.w	#66,d0
.next_block	move.l	(a2)+,d1		;d1=offset to a block
		move.l	0(a1,d1.w),(a0)+	;insert compacted block code
		dbf	d0,.next_block
		movem.l	(sp)+,a0/a2
	ENDC

	IFD	CHEAT
		jsr	flash_block
	ENDC

		move.w	#66,d4
		moveq.l	#opaque_bit_num,d3
		moveq.l	#0,d0
		lea	block_removal,a4

		movem.l	a3-a4,-(sp)
		lea	view(a0),a3

.remove_hidden	move.l	a4,a2
.next_case	addq.w	#8,a2

		move.w	-8(a2),d2
		bmi.s	.return
		btst.b	d3,view+3(a0,d2.w)
		beq.s	.next_case

		move.w	-6(a2),d2
		bmi.s	.make_invisible
		btst.b	d3,view+3(a0,d2.w)
		beq.s	.next_case

		move.w	-4(a2),d2
		bmi.s	.make_invisible
		btst.b	d3,view+3(a0,d2.w)
		beq.s	.next_case

		move.w	-2(a2),d2
		bmi.s	.make_invisible
		btst.b	d3,view+3(a0,d2.w)
		beq.s	.next_case

.make_invisible	move.l	#keep_invisible_bit,(a3)+
		add.w	#64,a4
		dbf	d4,.remove_hidden

.return		addq.w	#4,a3
		add.w	#64,a4
		dbf	d4,.remove_hidden

		movem.l	(sp)+,a3-a4

		rts

****************************************************************************
;This compares the new view with the old one to find any changes.
;INPUT:		a0=address of players structure (long)
;OUTPUT:	d0=change flag (word, 0=no change/1=change)
;CHANGES:       d1-d3,a1-a2
compare_views
	IFD	CD32
		movem.l a3/a5,-(sp)

		move.w	variables+last_view(a5),d1
		lea	0(a0,d1.w),a2
		lea	VIEW_SIZE*map_cell_size(a2),a3
		lea	view(a0),a4
		lea	VIEW_SIZE*map_cell_size(a4),a5

		moveq.l	#0,d0
		move.w	#VIEW_SIZE-1,d1

.loop		move.l	(a4)+,d2
		move.l	(a2)+,d3

		cmp.l   d2,d3
		beq.s	.same1
		moveq.l	#1,d0
		move.l	d2,-map_cell_size(a2)
.same1
		move.l	(a5)+,d2
		move.l	(a3)+,d3

		cmp.l	d2,d3
		beq.s	.same2
		moveq.l	#1,d0
		move.l	d2,-map_cell_size(a3)
.same2
		dbf	d1,.loop

		movem.l (sp)+,a3/a5
		rts
	ELSEIF
		move.w	variables+last_view(a5),d1
		lea	0(a0,d1.w),a2
		lea	view(a0),a4

		moveq.l	#0,d0
		move.w	#VIEW_SIZE-1,d1

.loop		move.l	(a4)+,d2
		move.l	(a2)+,d3

		cmp.l   d2,d3
		beq.s	.same
		moveq.l	#1,d0
		move.l	d2,-4(a2)

.same		dbf	d1,.loop

		rts
	ENDC

****************************************************************************
****************************************************************************
;This will draw a view.
;INPUT:		d5=window top left x (word)
;		d7=window top left y (word)
;		a0=address of players structure (long)
;		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	d1-d4
blit_view
		movem.l	a0-a4,-(sp)

		lea	(a0),a3			;a3=address of player structure
		move.w	#0,aux_here_temp(a3)
		lea	view_offsets,a4
		moveq.l	#0,d0			;d0=number of block drawn
.next_block
		lea	view(a3),a0
		move.l	(a0,d0.w),d1		;get new block type
		btst.l	#invisible_bit_num,d1	;empty block?
		bne.s	.return			;yes, then branch

		lea	viewb(a3),a1
		move.l	(a1,d0),d4
		move.l	([4,a4],a0.l),variables+block_rear(a5)		;get block type to rear
		move.l	([8,a4],a1.l),variables+block_side(a5)		;get block type to side
		move.l	([12,a4],a0.l),variables+block_below(a5)	;get block type below

		move.l	(a4),variables+position(a5)		;get position of block

		cmpi.w	#20,variables+position+2(a5)		;is it on the floor above
		ble.s	.blocks_above				;yes, then branch
		bra	.blocks_below
.return
		add.w	#16,a4

		addq.w	#4,d0
		cmpi.w	#67*map_cell_size,d0
		bne.s	.next_block

		move.w	#0,aux_here(a3)
		cmpi.w	#2,aux_here_temp(a3)
		blt.s	.not_a_container
		cmpi.w	#6,aux_here_temp(a3)
		bgt.s	.not_a_container
		move.w  #1,aux_here(a3)
.not_a_container

.draw_foam
		move.l	mem_position(a3),a3
		move.l	(a3),d3

		btst.l	#water_here_bit_num,d3
		beq.s	.no_water

		move.w	#water_shift,d2
		and.l	#keep_water,d3
		ror.l	d2,d3				;d3=water level at player

		move.l	#miscgfx+foam_bob,a0
		add.l	chip_mem_base,a0
		move.l	(a0),a2
		adda.l	#miscgfx,a2			;a2=address of bob structure
		add.l	chip_mem_base,a2
		mulu.w	#block_structure_size,d3
		lea	bob_struct_size(a2,d3.w),a0	;a0=address of block structure
		move.w	#%1011111,variables+redraw_temp(a5)
		movem.l	d0-d7,-(sp)
		bsr	blit_block			;draw block now
		movem.l	(sp)+,d0-d7
.no_water
		movem.l	(sp)+,a0-a4

		rts

****************************************************************************

.blocks_above
	IFD	CD32
		btst.l	#keep_light_bit_num,d4
		beq.s	.no_light_rear_wall_above
		move.l	variables+block_rear(a5),d2
		and.l	#keep_block_here_bit!keep_block,d2
		cmp.l	#keep_block_here_bit!(0<<block_shift),d2
		beq.s	.light_rear_wall_above
		cmp.l	#keep_block_here_bit!(1<<block_shift),d2
		bne.s	.no_light_rear_wall_above
.light_rear_wall_above
		moveq.l	#1,d2
		move.l	#miscgfx+light_addresses,a0	;draw light
		add.l	chip_mem_base,a0
		move.l	#miscgfx,d3
		add.l	chip_mem_base,d3
		move.w	#%1000000000100000,variables+redraw_temp(a5)
		clr.w	variables+offsetx(a5)
		clr.w	variables+offsety(a5)
		bsr	.draw_bob
.no_light_rear_wall_above
	ENDC

		btst.l	#aux_here_bit_num,d1
		beq	.no_aux_above
		move.w	#32-aux_shift,d3
		move.l	d1,d2
		and.l	#keep_aux&(~keep_aux_here_bit),d2
		rol.l	d3,d2
		cmpi.w	#7,d2
		beq.s	.skel_above
		bsr     rotate_aux
		move.l	#gamegfx+aux_addresses,a0		;draw aux
		add.l	chip_mem_base,a0
		move.l	#gamegfx,d3
		add.l	chip_mem_base,d3
		move.w	#%0000000000111111,variables+redraw_temp(a5)
		moveq.l	#0,d6
		clr.w	variables+offsetx(a5)
		clr.w	variables+offsety(a5)
		bsr	.draw_bob_illuminate

		bra.s	.no_aux_above
.skel_above	subi.w	#7,d2
		move.l	#miscgfx+skeleton_bob,a0
		add.l	chip_mem_base,a0
		move.l	#miscgfx,d3
		add.l	chip_mem_base,d3
		move.w	#%0000000000111111,variables+redraw_temp(a5)
		moveq.l	#0,d6
		clr.w	variables+offsetx(a5)
		clr.w	variables+offsety(a5)
		bsr	.draw_bob_illuminate

.no_aux_above	btst.l	#block_here_bit_num,d1
		beq	.no_block_above
		move.w	#block_shift,d3
		move.l	d1,d2
		and.l	#keep_block,d2
		ror.l	d3,d2
		bsr	activate_planes
		bsr     rotate_block
		cmpi.b	#31,d2
		bgt.s	.player_above
		cmpi.b	#21,d2
		bgt.s	.exgfx_above
		move.l	#gamegfx+block_addresses,a0		;draw blocks
		add.l	chip_mem_base,a0
		move.l	#gamegfx,d3
		add.l	chip_mem_base,d3
		move.l	d1,d6
		bsr	.draw_bob_illuminate
		bra.s	.no_block_above
.player_above	subi.w	#32,d2
		move.l	#miscgfx+player_addresses,a0
		add.l	chip_mem_base,a0
		move.l	#miscgfx,d3
		add.l	chip_mem_base,d3
		bsr	.draw_bob_illuminate
		bra.s	.no_block_above
.exgfx_above	subi.w	#22,d2
		cmpi.w	#1,d2
		bgt.s	.not_gr_above
		bsr	.draw_grenade
		bra.s	.no_block_above
.not_gr_above	move.l	#exgfx,a0
		add.l	a5,a0
		move.l	a0,d3
		bsr	.draw_bob_illuminate

.no_block_above	btst.l	#panel_here_bit_num,d1
		beq.s	.no_panel_above
		move.w	#32-panel_shift,d3
		move.l	d1,d2
		and.l	#keep_panel,d2
		rol.l	d3,d2
		bsr     rotate_block
		move.l	#gamegfx+panel_addresses,a0		;draw panels
		add.l	chip_mem_base,a0
		move.l	#gamegfx,d3
		add.l	chip_mem_base,d3
		move.w	#%0000000000111111,variables+redraw_temp(a5)
		clr.w	variables+offsetx(a5)
		clr.w	variables+offsety(a5)
		bsr	.draw_bob

.no_panel_above	btst.l	#water_here_bit_num,d1
		beq.s	.no_water_above
		move.w	#water_shift,d3
		move.l	d1,d2
		and.l	#keep_water,d2
		ror.l	d3,d2
		move.l	#miscgfx+water_addresses,a0	;draw water
		add.l	chip_mem_base,a0
		move.l	#miscgfx,d3
		add.l	chip_mem_base,d3
		move.w	#%0000000000110000,variables+redraw_temp(a5)
		clr.w	variables+offsetx(a5)
		clr.w	variables+offsety(a5)
		bsr	.draw_bob_illuminate

.no_water_above	btst.l	#explosion_here_bit_num,d1
		beq.s	.no_expl_above
		move.w	#32-explosion_shift,d3
		move.l	d1,d2
		and.l	#keep_explosion,d2
		rol.l	d3,d2
		move.l	#miscgfx+explosion_addresses,a0	;draw explosion
		add.l	chip_mem_base,a0
		move.l	#miscgfx,d3
		add.l	chip_mem_base,d3
		move.w	#%0100000000111111,variables+redraw_temp(a5)
		clr.w	variables+offsetx(a5)
		clr.w	variables+offsety(a5)
		bsr	.draw_bob
.no_expl_above
		move.l	variables+block_side(a5),d2
		btst.l	#keep_light_bit_num,d2
		beq.s	.no_light_side_above
		move.l	d1,d2
		and.l	#keep_block_here_bit!keep_block,d2
		cmp.l	#keep_block_here_bit!(0<<block_shift),d2
		beq.s	.light_side_above
		cmp.l	#keep_block_here_bit!(1<<block_shift),d2
		bne.s	.no_light_side_above
.light_side_above
		moveq.l	#0,d2
		move.l	#miscgfx+light_addresses,a0	;draw light
		add.l	chip_mem_base,a0
		move.l	#miscgfx,d3
		add.l	chip_mem_base,d3
		move.w	#%1000000000100000,variables+redraw_temp(a5)
		clr.w	variables+offsetx(a5)
		clr.w	variables+offsety(a5)
		bsr	.draw_bob
.no_light_side_above

		btst.l	#floor_here_bit_num,d1
		beq.s	.no_floor_above
		move.w	#floor_shift,d3
		move.l	d1,d2
		and.l	#keep_floor,d2
		ror.l	d3,d2
		cmp.b	#3,d2
		bne.s	.not_light_bulb
		move.l	d1,d3
		and.l	#keep_block_here_bit!keep_block,d3
		cmp.l	#keep_block_here_bit!(0<<block_shift),d3
		bne.s	.not_light_bulb
		move.l	#4,d2
		move.l	#gamegfx+floor_addresses,a0	;draw light bulb
		add.l	chip_mem_base,a0
		move.l	#gamegfx,d3
		add.l	chip_mem_base,d3
		move.w	#%1000000000111111,variables+redraw_temp(a5)
		clr.w	variables+offsetx(a5)
		clr.w	variables+offsety(a5)
		bsr	.draw_bob
		bra.s	.no_floor_above
.not_light_bulb
		move.l	#gamegfx+floor_addresses,a0	;draw floors
		add.l	chip_mem_base,a0
		move.l	#gamegfx,d3
		add.l	chip_mem_base,d3
		move.w	#%0000000000111111,variables+redraw_temp(a5)
		clr.w	variables+offsetx(a5)
		clr.w	variables+offsety(a5)
		bsr	.draw_bob
.no_floor_above
		bra	.return

;------------------------------------------------------------------------------

.blocks_below
	IFD	CD32
		btst.l	#keep_light_bit_num,d4
		beq.s	.no_light_rear_wall_below
		move.l	variables+block_rear(a5),d2
		and.l	#keep_block_here_bit!keep_block,d2
		cmp.l	#keep_block_here_bit!(0<<block_shift),d2
		beq.s	.light_rear_wall_below
		cmp.l	#keep_block_here_bit!(1<<block_shift),d2
		bne.s	.no_light_rear_wall_below
.light_rear_wall_below
		moveq.l	#1,d2
		move.l	#miscgfx+light_addresses,a0	;draw light
		add.l	chip_mem_base,a0
		move.l	#miscgfx,d3
		add.l	chip_mem_base,d3
		move.w	#%1000000000100000,variables+redraw_temp(a5)
		clr.w	variables+offsetx(a5)
		clr.w	variables+offsety(a5)
		bsr	.draw_bob
.no_light_rear_wall_below
	ENDC

		btst.l	#floor_here_bit_num,d1
		beq.s	.no_floor_below
		move.w	#floor_shift,d3
		move.l	d1,d2
		and.l	#keep_floor,d2
		ror.l	d3,d2
		move.w	d2,-(sp)
		move.l	#gamegfx+floor_addresses,a0	;draw floors
		add.l	chip_mem_base,a0
		move.l	#gamegfx,d3
		add.l	chip_mem_base,d3
		move.w	#%0000000000111111,variables+redraw_temp(a5)
		clr.w	variables+offsetx(a5)
		clr.w	variables+offsety(a5)
		bsr	.draw_bob_illuminate
		move.w	(sp)+,d2
		cmpi.b	#0,d2
		beq.s	.no_light_floor_below
		cmpi.b	#2,d2
		beq.s	.no_light_floor_below
.no_floor_below
	IFD	CD32
		btst.l	#keep_light_bit_num,d4
		beq.s	.no_light_floor_below
		move.l	variables+block_below(a5),d2
		and.l	#keep_block_here_bit!keep_block,d2
		cmp.l	#keep_block_here_bit!(0<<block_shift),d2
		beq.s	.light_floor_below
		cmp.l	#keep_block_here_bit!(1<<block_shift),d2
		bne.s	.no_light_floor_below
.light_floor_below
		moveq.l	#2,d2
		move.l	#miscgfx+light_addresses,a0	;draw light
		add.l	chip_mem_base,a0
		move.l	#miscgfx,d3
		add.l	chip_mem_base,d3
		move.w	#%1000000000100000,variables+redraw_temp(a5)
		clr.w	variables+offsetx(a5)
		clr.w	variables+offsety(a5)
		bsr	.draw_bob
.no_light_floor_below
	ENDC

		btst.l	#aux_here_bit_num,d1
		beq	.no_aux_below
		move.w	#32-aux_shift,d3
		move.l	d1,d2
		and.l	#keep_aux&(~keep_aux_here_bit),d2
		rol.l	d3,d2

		cmpi.w	#2,d2
		blt.s	.aux_below
		cmpi.w	#6,d2
		bgt.s	.aux_below
		cmpi.w	#66*map_cell_size,d0
		beq	.no_aux_below
.aux_below
		cmpi.w	#7,d2
		beq.s	.skel_below

		bsr     rotate_aux

		move.l	#gamegfx+aux_addresses,a0	;draw aux
		add.l	chip_mem_base,a0
		move.l	#gamegfx,d3
		add.l	chip_mem_base,d3
		move.w	#%0000000000111111,variables+redraw_temp(a5)
		moveq.l	#0,d6
		clr.w	variables+offsetx(a5)
		clr.w	variables+offsety(a5)
		bsr	.draw_bob_illuminate
		bra	.no_aux_below

.skel_below
		cmpi.w	#66*map_cell_size,d0
		beq     .no_aux_below

		subi.w	#7,d2
		move.l	#miscgfx+skeleton_bob,a0
		add.l	chip_mem_base,a0
		move.l	#miscgfx,d3
		add.l	chip_mem_base,d3
		move.w	#%0000000000111111,variables+redraw_temp(a5)
		moveq.l	#0,d6
		clr.w	variables+offsetx(a5)
		clr.w	variables+offsety(a5)
		bsr	.draw_bob_illuminate

.no_aux_below	btst.l	#water_here_bit_num,d1
		beq	.no_water_below
		move.w	#water_shift,d3
		move.l	d1,d2
		and.l	#keep_water,d2
		ror.l	d3,d2
                cmp.w	#3,d2
		beq.s	.no_water_below
		move.l	#miscgfx+water_addresses,a0	;draw water
		add.l	chip_mem_base,a0
		move.l	#miscgfx,d3
		add.l	chip_mem_base,d3
		move.w	#%0000000000110000,variables+redraw_temp(a5)
		clr.w	variables+offsetx(a5)
		clr.w	variables+offsety(a5)
		bsr	.draw_bob_illuminate

.no_water_below
		move.w	#%0000000000111111,variables+redraw_temp(a5)
		btst.l	#block_here_bit_num,d1
		beq	.no_block_below
		move.w	#block_shift,d3
		move.l	d1,d2
		and.l	#keep_block,d2
		ror.l	d3,d2
		bsr	activate_planes
		bsr     rotate_block
		tst.w   monster_attacking(a3)
		bne	.attack
.no_attack	cmpi.b	#31,d2
		bgt.s	.player_below
		cmpi.b	#21,d2
		bgt.s	.exgfx_below
		move.l	#gamegfx+block_addresses,a0	;draw blocks
		add.l	chip_mem_base,a0
		move.l	#gamegfx,d3
		add.l	chip_mem_base,d3
		move.l	d1,d6
		bsr	.draw_bob_illuminate
		bra	.no_block_below
.player_below	subi.w	#32,d2
		move.l	#miscgfx+player_addresses,a0
		add.l	chip_mem_base,a0
		move.l	#miscgfx,d3
		add.l	chip_mem_base,d3
		bsr	.draw_bob_illuminate
		bra	.skip_attack2
.exgfx_below	subi.w	#22,d2
		cmpi.w	#1,d2
		bgt	.not_gr_below
		bsr	.draw_grenade
		bra	.skip_attack2
.not_gr_below	move.l	#exgfx,a0
		add.l	a5,a0
		move.l	a0,d3
		bsr	.draw_bob_illuminate
		bra	.skip_attack2

.attack
		cmpi.w	#57*map_cell_size,d0
		bne	.no_attack
		btst.l	#keep_light_bit_num,d4
		beq.s	.no_light_attack
		move.w	#%1000000000111111,variables+redraw_temp(a5)
		bra.s	.skip_no_light_attack
.no_light_attack
		move.w	#%0000000000111111,variables+redraw_temp(a5)
.skip_no_light_attack
		cmpi.w	#8,d2
		beq.s	.do_attack1
		cmpi.w	#12,d2
		beq.s	.do_attack2
		bra	.no_attack
.do_attack1	movem.l	d0-d7,-(sp)
		move.l	#locn+locn_style,a2
		add.l	a5,a2
		cmpi.b	#4,(a2)
		bne.s	.not_style5
		move.l	#gamegfx,a0
		add.l	chip_mem_base,a0
		move.l	mon2in_bob(a0),a2
		add.l	a0,a2
		bra.s	.do_it
.not_style5
		move.l	#attack1,a2
		add.l	a5,a2			;a2=address of bob structure
.do_it		lea	bob_struct_size(a2),a0	;a0=address of block structure
		move.w	view_xoffset(a3),d5	;d5=window top left x
		move.w	view_yoffset(a3),d7	;d7=window top left y
		bsr	blit_block
		movem.l	(sp)+,d0-d7
		bra.s	.skip_attack2
.do_attack2	movem.l	d0-d7,-(sp)
		move.l	#attack2,a2
		add.l	a5,a2			;a2=address of bob structure
		lea	bob_struct_size(a2),a0	;a0=address of block structure
		move.w	view_xoffset(a3),d5	;d5=window top left x
		move.w	view_yoffset(a3),d7	;d7=window top left y
		bsr	blit_block
		movem.l	(sp)+,d0-d7
.skip_attack2

.no_block_below	btst.l	#panel_here_bit_num,d1
		beq	.no_panel_below
		move.w	#32-panel_shift,d3
		move.l	d1,d2
		and.l	#keep_panel,d2
		rol.l	 d3,d2
		move.w	d2,-(sp)
		move.l	#gamegfx+panel_addresses,a0	;draw panels
		add.l	chip_mem_base,a0
		move.l	#gamegfx,d3
		add.l	chip_mem_base,d3
		move.w	#%0000000000111111,variables+redraw_temp(a5)
		clr.w	variables+offsetx(a5)
		clr.w	variables+offsety(a5)
		bsr	.draw_bob
		move.w	(sp)+,d2

		tst.w	d2					;text panel?
		bne.s	.no_panel_below				;no, then branch

		cmpi.w	#57*map_cell_size,d0
		bne.s	.no_panel_below				;no, then branch

		move.w	#variant_shift,d3
		move.l	d1,d2
		and.l	#keep_variant,d2
		ror.l	d3,d2
		mulu	#text_size,d2
		lea	map+texts(a5),a0
		adda.w	d2,a0					;a0=address of text image

		IFD     DOUBLE_BUFFER
		move.l	drawing_buffer,a2
                ELSEIF
		move.l	viewing_buffer,a2
                ENDC
		move.w	d7,d3
		mulu	#40,d3
		adda.w	d3,a2

		move.w	d5,d3
		subq.l	#2,d3
		lsr.w	#3,d3
		add.w	d3,a2

		move.w	#39,d3				;lines to draw
		adda.w	#886,a2				;top left
.loop1		move.l	(a0)+,d2
		or.l	d2,(a2)
		move.w	(a0)+,d2
		or.w	d2,4(a2)
		adda.w	#40,a2
		dbf     d3,.loop1

		adda.w	#6880,a2
		move.w	#39,d3
.loop2		move.l	(a0)+,d2
		or.l	d2,(a2)
		move.w	(a0)+,d2
		or.w	d2,4(a2)
		adda.w	#40,a2
		dbf     d3,.loop2

.no_panel_below	btst.l	#explosion_here_bit_num,d1
		beq.s	.no_expl_below
		move.w	#32-explosion_shift,d3
		move.l	d1,d2
		and.l	#keep_explosion,d2
		rol.l	d3,d2
		move.l	#miscgfx+explosion_addresses,a0	;draw explosion
		add.l	chip_mem_base,a0
		move.l	#miscgfx,d3
		add.l	chip_mem_base,d3
		move.w	#%0100000000111111,variables+redraw_temp(a5)
		clr.w	variables+offsetx(a5)
		clr.w	variables+offsety(a5)
		bsr	.draw_bob

.no_expl_below
		btst.l	#aux_here_bit_num,d1
		beq	.no_aux_below2

		move.w	#32-aux_shift,d3
		move.l	d1,d2
		and.l	#keep_aux&(~keep_aux_here_bit),d2
		rol.l	d3,d2

		cmpi.w	#2,d2
		blt	.no_aux_below2
		cmpi.w	#7,d2
		bgt	.no_aux_below2
		cmpi.w	#66*map_cell_size,d0
		bne	.no_aux_below2

		move.w	variables+last_view(a5),d6
		lea	0(a3,d6.w),a0
		clr.w	VIEW_OBJECT(a0)

		cmpi.w	#7,d2
		beq.s	.skel_below2

		bsr     rotate_aux
		cmpi.w	#66*map_cell_size,d0
		bne.s	.not_at_aux2
		move.w	d2,aux_here_temp(a3)
.not_at_aux2
		move.l	#gamegfx+aux_addresses,a0	;draw aux
		add.l	chip_mem_base,a0
		move.l	#gamegfx,d3
		add.l	chip_mem_base,d3
		move.w	#%0000000000111111,variables+redraw_temp(a5)
		moveq.l	#0,d6
		clr.w	variables+offsetx(a5)
		clr.w	variables+offsety(a5)
		bsr	.draw_bob
		bra	.no_aux_below2
.skel_below2
		movem.l	d1/a1,-(sp)
		move.l	mem_position(a3),a1
		add.l	#map_part_size,a1
		move.l	(a1),d2
		and.l	#keep_aux_data,d2
		move.w	#aux_data_shift,d1
		lsr.l	d1,d2
		lea	variables+player1(a5),a1
		mulu	#player_struct_size,d2
		add.w	d2,a1
		moveq.l	#0,d2
		move.b	inven_using+inven_item_num(a1),d2
		bne.s	.show_this
		move.b	inven_store+inven_item_num(a1),d2
		bne.s	.show_this
		movem.l	(sp)+,d1/a1
		bra	.no_aux_below2

.show_this	subq.w	#1,d2
		mulu	#item_size,d2
		move.l	#items,a1
		add.l	a5,a1
		add.l	d2,a1
		moveq.l	#0,d2
		move.b	item_container_type(a1),d2
		movem.l	(sp)+,d1/a1

		move.w	d2,aux_here_temp(a3)
		move.w	variables+last_view(a5),d6
		lea	0(a3,d6.w),a0
		move.w	d2,VIEW_OBJECT(a0)
		move.l	#gamegfx+aux_addresses,a0	;draw aux
		add.l	chip_mem_base,a0
		move.l	#gamegfx,d3
		add.l	chip_mem_base,d3
		move.w	#%0000000000111111,variables+redraw_temp(a5)
		moveq.l	#0,d6
		clr.w	variables+offsetx(a5)
		clr.w	variables+offsety(a5)
		bsr	.draw_bob
.no_aux_below2
		btst.l	#water_here_bit_num,d1
		beq	.no_water_below2
		move.w	#water_shift,d3
		move.l	d1,d2
		and.l	#keep_water,d2
		ror.l	d3,d2
                cmp.w	#3,d2
		blt.s	.no_water_below2
		move.l	#miscgfx+water_addresses,a0	;draw water
		add.l	chip_mem_base,a0
		move.l	#miscgfx,d3
		add.l	chip_mem_base,d3
		move.w	#%0000000000110000,variables+redraw_temp(a5)
		clr.w	variables+offsetx(a5)
		clr.w	variables+offsety(a5)
		bsr	.draw_bob_illuminate
.no_water_below2
		move.l	variables+block_side(a5),d2
		btst.l	#keep_light_bit_num,d2
		beq.s	.no_light_side_below
		move.l	d1,d2
		and.l	#keep_block_here_bit!keep_block,d2
		cmp.l	#keep_block_here_bit!(0<<block_shift),d2
		beq.s	.light_side_below
		cmp.l	#keep_block_here_bit!(1<<block_shift),d2
		bne.s	.no_light_side_below
.light_side_below
		moveq.l	#0,d2
		move.l	#miscgfx+light_addresses,a0	;draw light
		add.l	chip_mem_base,a0
		move.l	#miscgfx,d3
		add.l	chip_mem_base,d3
		move.w	#%1000000000100000,variables+redraw_temp(a5)
		clr.w	variables+offsetx(a5)
		clr.w	variables+offsety(a5)
		bsr	.draw_bob
.no_light_side_below
		bra	.return

****************************************************************************

.draw_bob_illuminate
		btst.l	#keep_light_bit_num,d4
		beq.s	.no_light_bob
		bset.b	#7,variables+redraw_temp(a5)
.no_light_bob	bsr	.draw_bob
		bclr.b	#7,variables+redraw_temp(a5)
		rts

.draw_bob
		lsl.w	#2,d2
		move.l	0(a0,d2.w),a2		;get address of structures
		cmp.l	#0,a2
		beq.s	.no_graphic
		add.l	d3,a2
		move.w	variables+position+2(a5),d3
		mulu.w	#block_structure_size,d3
		lea	bob_struct_size(a2,d3.w),a0	;a0=address of block structure

		movem.l	d0-d7/a0,-(sp)
		add.w	variables+offsetx(a5),d5
		add.w	variables+offsety(a5),d7
		bsr	blit_block		;draw block now
		movem.l	(sp)+,d0-d7/a0

.no_graphic	rts

****************************************************************************
.draw_grenade
		move.w	d7,-(sp)

		move.w	d2,-(sp)
		move.w	#variant_shift,d3
		move.l	d1,d2
		and.l	#keep_variant,d2
		ror.l	d3,d2

		cmpi.w	#16*map_cell_size,d0
		bgt.s	.not_dist4
		move.w	#18,d3
		bra	.skip
.not_dist4	cmpi.w	#33*map_cell_size,d0
		bgt.s	.not_dist3
		move.w	#26,d3
		bra.s	.skip
.not_dist3	cmpi.w	#48*map_cell_size,d0
		bgt.s	.not_dist2
		move.w	#38,d3
		bra.s	.skip
.not_dist2	move.w	#62,d3
.skip
		mulu	d3,d2
		divu	#31,d2

		sub.w	d2,d7
		move.w	(sp)+,d2

		move.l	#exgfx,a0
		add.l	a5,a0
		move.l	a0,d3
		bsr	.draw_bob
		move.w	(sp)+,d7

		rts

****************************************************************************
activate_planes
		cmpi.b	#32,d2
		blt.s	.not_player
		cmpi.b	#47,d2
		bgt.s	.not_player

		move.l	d1,d3
		andi.l	#keep_variant_player,d3
		move.w	#32-variant_shift,d6
		rol.l	d6,d3

		mulu	#player_struct_size,d3
		lea	variables+player1(a5,d3.w),a0

		tst.w	spell_shield(a0)
		beq.s	.no_glow
		move.w	#%0000010000111111,variables+redraw_temp(a5)
		move.w	#6,variables+redraw_solid(a5)
		rts
.no_glow	tst.b	fire_white(a0)
		beq.s	.no_white
		move.w	#%0000010000111111,variables+redraw_temp(a5)
		move.w	#1,variables+redraw_solid(a5)
		rts
.no_white	move.w	#%0000000000111111,variables+redraw_temp(a5)
		rts

.not_player
		cmpi.b	#8,d2
		blt.s	.not_monster
		cmpi.b	#15,d2
		bgt.s	.not_monster

		btst.l	#m_flashed,d1
		beq.s	.no_mwhite
		move.w	#%0000010000111111,variables+redraw_temp(a5)
		move.w	#1,variables+redraw_solid(a5)
		rts
.no_mwhite	btst.l	#m_outlined,d1
		beq.s	.no_moutlined
		move.w	#%0001000000111111,variables+redraw_temp(a5)
		move.w	#6,variables+redraw_solid(a5)
		rts
.no_moutlined	move.w	#%0000000000111111,variables+redraw_temp(a5)
		rts

.not_monster	cmpi.b	#24,d2
		blt.s	.not_sentry
		cmpi.b	#27,d2
		bgt.s	.not_sentry

		move.l	d1,d3
		andi.l	#keep_variant,d3
		move.w	#32-variant_shift,d6
		rol.l	d6,d3

		cmpi.w	#15,d3
		ble.s	.no_swhite
		move.w	#%0000010000111111,variables+redraw_temp(a5)
		move.w	#1,variables+redraw_solid(a5)
		rts
.no_swhite	move.w	#%0000000000111111,variables+redraw_temp(a5)
		rts

.not_sentry	move.w	#%0000000000111111,variables+redraw_temp(a5)
		rts

****************************************************************************
rotate_block	moveq.l	#0,d3
		move.b	direction(a3),d3		;d3=my direction
		lsl.w	#6,d3
		add.w	d2,d3

		lea	block_rotations(pc),a2
		move.b	0(a2,d3.w),d2

		rts

block_rotations	dc.b	0,1,2,3,4,5,6,7			;looking north
		dc.b	08+3,08+2,08+0,08+1
		dc.b	12+3,12+2,12+0,12+1
		dc.b	16+0,16+1,16+3,16+2
		dc.b	20,21,22,23
		dc.b	24+2,24+0,24+3,24+1
		dc.b	28,29,30,31
		dc.b	32+3,32+2,32+0,32+1
		dc.b	36+3,36+2,36+0,36+1
		dc.b	40+3,40+2,40+0,40+1
		dc.b	44+3,44+2,44+0,44+1
		dc.b	48,49,50,51,52,53,54,55
		dc.b	56,57,58,59,60,61,62,63

		dc.b    0,1,2,3,4,5,6,7			;looking east
		dc.b	08+1,08+3,08+2,08+0
		dc.b	12+1,12+3,12+2,12+0
		dc.b	16+2,16+0,16+1,16+3
		dc.b    21,20,22,23
		dc.b	24+1,24+2,24+0,24+3
		dc.b	28,29,30,31
		dc.b	32+1,32+3,32+2,32+0
		dc.b	36+1,36+3,36+2,36+0
		dc.b	40+1,40+3,40+2,40+0
		dc.b	44+1,44+3,44+2,44+0
		dc.b	48,49,50,51,52,53,54,55
		dc.b	56,57,58,59,60,61,62,63

		dc.b    0,1,2,3,4,5,6,7			;looking south
		dc.b	08+0,08+1,08+3,08+2
		dc.b	12+0,12+1,12+3,12+2
		dc.b	16+3,16+2,16+0,16+1
		dc.b    20,21,22,23
		dc.b	24+3,24+1,24+2,24+0
		dc.b	28,29,30,31
		dc.b	32+0,32+1,32+3,32+2
		dc.b	36+0,36+1,36+3,36+2
		dc.b	40+0,40+1,40+3,40+2
		dc.b	44+0,44+1,44+3,44+2
		dc.b	48,49,50,51,52,53,54,55
		dc.b	56,57,58,59,60,61,62,63

		dc.b    0,1,2,3,4,5,6,7			;looking west
		dc.b	08+2,08+0,08+1,08+3
		dc.b	12+2,12+0,12+1,12+3
		dc.b	16+1,16+3,16+2,16+0
		dc.b    21,20,22,23
		dc.b	24+0,24+3,24+1,24+2
		dc.b	28,29,30,31
		dc.b	32+2,32+0,32+1,32+3
		dc.b	36+2,36+0,36+1,36+3
		dc.b	40+2,40+0,40+1,40+3
		dc.b	44+2,44+0,44+1,44+3
		dc.b	48,49,50,51,52,53,54,55
		dc.b	56,57,58,59,60,61,62,63

rotate_aux	moveq.l	#0,d3
		move.b	direction(a3),d3		;d3=my direction
		lsl.w	#4,d3
		add.w	d2,d3

		lea	aux_rotations(pc),a2
		move.b	0(a2,d3.w),d2

		rts

aux_rotations	dc.b	0,1,2,3,4,5,6,7			;looking north
		dc.b	8+0,8+1,8+3,8+2
		dc.b	12,13
		dc.b	14,15

		dc.b	0,1,2,3,4,5,6,7			;looking east
		dc.b	8+2,8+0,8+1,8+3
		dc.b	13,12
		dc.b	14,15

		dc.b	0,1,2,3,4,5,6,7			;looking south
		dc.b	8+3,8+2,8+0,8+1
		dc.b	12,13
		dc.b	14,15

		dc.b	0,1,2,3,4,5,6,7			;looking west
		dc.b	8+1,8+3,8+2,8+0
		dc.b	13,12
		dc.b	14,15

****************************************************************************
****************************** Blit A Block ********************************
****************************************************************************
;Blit a block.
;INPUT:		a0=address of block structure (long)
;		a2=address of bob structure (long)
;		a6=base address of hardware registers (long)
;		d6=mirror image offset (word)
;		d1=map part 1 long (long)
;		d5=x pixel offset (word)
;		d7=y pixel offset (word)
;OUTPUT:	none
;CHANGES:	d4-d7

blit_block
		move.w	control(a0),d4
		cmpi.w	#3,d4			;anything to draw?
		beq	.exit			;no, then exit

		add.w	xposition(a0),d5
		add.w	yposition(a0),d7

		cmpi.w	#-1,d4
		bne.s	.not_random
		moveq.l	#2,d4
		bra	block_draw
.not_random

		cmpi.w	#3,d4
		bgt.s	.mirror
		cmpi.w	#2,d4			;is block at eyesight level?
		bne	block_draw

		move.w	#0,d4
		bsr	block_draw		;draw right way up
		move.w	#1,d4
		add.w	block_height(a0),d7	;now draw it flipped
		bsr	block_draw
		bra	.exit

.mirror		move.w	window_start_y,-(sp)
		move.w	window_end_y,-(sp)

		tst.b	d6
		beq	.clip_end

		move.w	#32-variant_shift,d2
		and.l	#keep_variant,d6
		rol.l	d2,d6

		tst.b	d6
		beq	.clip_end

		move.w	d7,d2
		move.w	d7,d1
		add.w	#52,d1

		cmpi.w	#16*map_cell_size,d0
		bgt.s	.not_dist4
		move.b	.dist4(pc,d6),d6
		sub.w	#38,d1
		bra	.skip
.not_dist4	cmpi.w	#33*map_cell_size,d0
		bgt.s	.not_dist3
		move.b	.dist3(pc,d6),d6
		sub.w	#30,d1
		bra.s	.skip
.not_dist3	cmpi.w	#48*map_cell_size,d0
		bgt.s	.not_dist2
		move.b	.dist2(pc,d6),d6
		sub.w	#22,d1
		bra.s	.skip
.not_dist2	move.b	.dist1(pc,d6),d6
		bra.s	.skip

dh1		equ	2
dh2		equ     6
dh3		equ     9
dh4		equ     12
dh5		equ     14
dh6		equ     16
dh7		equ     18
dh8		equ     20
dh9		equ     21
dh10		equ     22
dh11		equ     23

.dist1		dc.b	dh1,dh2,dh3,dh4,dh5,dh6,dh7,dh8,dh9,dh10,dh11
.dist2		dc.b	(dh1*13)/23,(dh2*13)/23,(dh3*13)/23,(dh4*13)/23,(dh5*13)/23,(dh6*13)/23,(dh7*13)/23,(dh8*13)/23,(dh9*13)/23,(dh10*13)/23,(dh11*13)/23
.dist3		dc.b	(dh1*10)/23,(dh2*10)/23,(dh3*10)/23,(dh4*10)/23,(dh5*10)/23,(dh6*10)/23,(dh7*10)/23,(dh8*10)/23,(dh9*10)/23,(dh10*10)/23,(dh11*10)/23
.dist4		dc.b	(dh1*6)/23,(dh2*6)/23,(dh3*6)/23,(dh4*6)/23,(dh5*6)/23,(dh6*6)/23,(dh7*6)/23,(dh8*6)/23,(dh9*6)/23,(dh6*6)/23,(dh11*6)/23
		even
.skip


		cmp.w	window_start_y,d2
		blt.s	.clip_start
		move.w	d2,window_start_y
.clip_start
		cmp.w	window_end_y,d1
		bgt.s	.clip_end
		move.w	d1,window_end_y
.clip_end

		sub.w	d6,d7
		move.w  d4,-(sp)
		move.w	#0,d4
		bsr.s	block_draw		;draw right way up
		move.w  (sp)+,d4
		add.w	d4,d7
		add.w	d6,d7
		add.w	d6,d7
		move.w	#1,d4
		bsr.s	block_draw

		move.w	(sp)+,window_end_y
		move.w	(sp)+,window_start_y

.exit		rts

****************************************************************************
;Set up structure for blit and draw it.
;INPUT:		a0=address of block_structure (long)
;		a2=address of bob structure (long)
;		d4= 0=unflipped 1=flipped (byte)
;		d5=x pixel offset (word)
;		d7=y pixel offset (word)
;OUTPUT:	none
;CHANGES:	a1
block_draw	movem.l	a0/d6,-(sp)

		move.w	block_width(a0),bob_width(a2)
		move.w	block_height(a0),bob_height(a2)

		move.b	d4,bob_control(a2)	;flipped/unflipped

		move.l	data(a0),a1
		adda.l	a2,a1
		move.l	a1,bob_address(a2)

		lea	(a2),a0

		moveq.l	#0,d6
		move.w	variables+redraw_temp(a5),d6

	IFD	CD32
		btst.l	#14,d6
		bne.s	.not_lit
		move.b	#2,bob_plane+5(a0)
		cmp.b	#%00110000,d6
		bne.s	.not_water
		move.b	#0,bob_plane+5(a0)
.not_water	btst.l	#15,d6
		beq.s	.not_lit
		move.b	#3,bob_plane+5(a0)
.not_lit
	ENDC
		btst.l	#10,d6
		bne.s	.solid
		btst.l	#12,d6
		beq.s	.not_solid
.solid		move.w	variables+redraw_solid(a5),d4
.not_solid
		jsr	draw_bob
		movem.l	(sp)+,a0/d6
		rts

****************************************************************************
