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

	IFD	CD32
MIN_MAP_Y	equ	0
MAX_MAP_Y	equ	map_plane_height-162
MIN_MAP_X	equ	16
MAX_MAP_X	equ	(map_plane_width/2)-258
	ELSEIF
MIN_MAP_Y	equ	0
MAX_MAP_Y	equ	map_plane_height-160
MIN_MAP_X	equ	16
MAX_MAP_X	equ	map_plane_width-258
	ENDC

********************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:       none
do_worldmap
        IFND     demo
		move.l	a4,-(sp)

		movem.l	d0-d2/a0,-(sp)

		jsr	kill_screen

		move.l  #worldmap_anim_buffer,a0
		add.l	a4,a0
		move.l	#front_anim_in,a1
		add.l	a5,a1
		jsr	play_anim

		move.l	#lc_mesg_buffer,a0
		add.l	chip_mem_base,a0
		jsr	set_up_message_screen

		move.w	#0,variables+file_mode(a5)
	ENDC

		bsr	load_and_decrunch_worldmap_data

	IFD	demo

		move.w	#1,global_vars+worldmap_loc(a5)
		move.l	#front_locations_dat,a1

		tst.w	global_vars+action_flag(a5)
		beq.s	.not_action_game
		move.w	#2,global_vars+worldmap_loc(a5)
		move.l	#front_locations_dat+locn_struct_size,a1
.not_action_game
		tst.w	global_vars+attract_mode(a5)
		beq.s	.not_attract_game
		move.w	#3,global_vars+worldmap_loc(a5)
		move.l	#front_locations_dat+locn_struct_size*2,a1
.not_attract_game
		move.w	#locn_struct_size-1,d0
		add.l	a5,a1
		lea	global_vars+curr_locn(a5),a2
.loop		move.b	(a1)+,(a2)+
		dbf	d0,.loop
		move.w	global_vars+worldmap_loc(a5),global_vars+worldmap_last_locn(a5)
		rts

	ELSEIF

		tst.w	global_vars+action_flag(a5)
		beq.s	.campaign_game
		movem.l	(sp)+,d0-d2/a0
		bsr     set_up_action_game_map
		move.l	(sp)+,a4
		rts
.campaign_game
		jsr	unshow_message
		move.l	#worldmap_anim_buffer,a0
		add.l	a4,a0
		move.l	#front_anim_out,a1
		add.l	a5,a1
		jsr	play_anim

		movem.l	(sp)+,d0-d2/a0

	IFD	CD32
		move.l	#static_music-40800,a0
		add.l	exchip_mem_base,a0
	ELSEIF
		move.l	#worldmap_map,a0
		add.l	a4,a0
	ENDC
		move.l	a0,viewing_buffer
		move.l	#worldmap_panel,a0
		add.l	a4,a0
		move.l	a0,drawing_buffer
		BOB_INFO drawing_buffer,#map_p_plane_width/8,#map_p_plane_height,#map_p_num_planes,#0,#0,#map_p_plane_width,#map_p_plane_height,#0

		bsr	copy_map_rock

		bsr	remove_keys

		move.l	#front_locations_dat,a4
		add.l	a5,a4
		move.w	global_vars+worldmap_loc(a5),d0

		tst.w	global_vars+game_count(a5)
		bne.s	.not_first_game
		bsr	first_campaign_map
		bra.s	.skip_not_first_game
.not_first_game
		mulu	#locn_struct_size,d0
		add.l	d0,a4
.skip_not_first_game
		addi.w	#1,global_vars+game_count(a5)

		cmpi.w	#RESTART_ABORT,variables+restart_flag(a5)
		beq.s	.skip_completed
		lea	global_vars+completed(a5),a1
		move.w	global_vars+worldmap_loc(a5),d0
		st.b	0(a1,d0.w)
		bra.s	.completed
.skip_completed
		move.w	#RESTART_MAP,variables+restart_flag(a5)
		move.w	global_vars+worldmap_last_locn(a5),d0
		move.w	d0,global_vars+worldmap_loc(a5)
		move.l	#front_locations_dat,a4
		add.l	a5,a4
		mulu	#locn_struct_size,d0
		add.l	d0,a4
.completed

		move.w	#0,global_vars+worldmap_glow(a5)
		clr.w	global_vars+world_strobe(a5)

	IFD	CD32
		move.w	#map_plane_width/4-128,global_vars+worldmap_x(a5)
		move.w	#map_plane_height/4-80,global_vars+worldmap_y(a5)
	ELSEIF
		move.w	#map_plane_width/2-128,global_vars+worldmap_x(a5)
		move.w	#map_plane_height/2-80,global_vars+worldmap_y(a5)
	ENDC
		move.w	locn_x(a4),global_vars+worldmap_cur_x(a5)
		move.w	locn_y(a4),global_vars+worldmap_cur_y(a5)
	IFD	CD32
		add.w	#16,global_vars+worldmap_cur_x(a5)
	ENDC
		add.w	#8,global_vars+worldmap_cur_x(a5)
		add.w	#8,global_vars+worldmap_cur_y(a5)
		move.w	#-1,global_vars+worldmap_last_scan(a5)
		move.w	#0,global_vars+worldmap_anim1(a5)
                move.l	#worldmap_sprites,a3
		add.l	chip_mem_base,a3

		move.l	#worldmap_sprites+1340+20*72,a0
		add.l	chip_mem_base,a0
		move.l	#worldmap_copperlist+map_sprites,a1
		add.l	chip_mem_base,a1
		HDW_SPRITE16 #0,a0,#144,#41,#160,a1

		bsr	draw_locns

		jsr	set_up_map_screen
		bsr	reposition_worldmap

		move.w	#MODE_WORLD,variables+mode(a5)
		clr.b	map_select

		cmpi.w	#RESTART_MAP,variables+restart_flag(a5)
		bne.s	.not_back_to_map
		clr.w	variables+restart_flag(a5)
.not_back_to_map

.loop
		TASKSWITCH

                bsr	world_grab
		bsr	hit_location

		cmp.w	global_vars+worldmap_last_scan(a5),d1
		beq.s	.not_new_locn
		bsr	show_map_info
.not_new_locn
		tst.w	d0
		bmi	.not_selected
		tst.b	map_select
		beq	.not_selected
		clr.b	map_select

		bsr	validate_choice
		tst.w	d0
		bmi	.not_selected

		bsr	already_completed
		tst.w	d0
		bpl.s	.explore
.move_there	move.w	global_vars+worldmap_loc(a5),global_vars+worldmap_last_locn(a5)
		move.w	d1,global_vars+worldmap_loc(a5)
		move.b	locn_map_num(a0),global_vars+worldmap_map_num+1(a5)
		move.l	a0,a4
		bra	.loop

.explore	bsr	copy_map_rock
		move.l	#%0010001111,d6
		move.l	#worldmap_font,a2
		add.l	chip_mem_base,a2
		WAIT_COPINT
		BLIT_TEXT move_msg(pc),a2,#0,#0
		move.w	global_vars+worldmap_loc(a5),global_vars+worldmap_last_locn(a5)
		move.w	d1,global_vars+worldmap_loc(a5)
		bra.s	.end_map
.not_selected
		bsr	map_scan_quit

		tst.w   variables+restart_flag(a5)
		beq	.loop

		movem.l	d0-d7/a0-a6,-(sp)
		jsr	_StopPlayer
		movem.l	(sp)+,d0-d7/a0-a6

		jsr	killaud

		move.l	(sp)+,a4
		rts

.end_map
		movem.l	d0-d7/a0-a6,-(sp)
		jsr	_StopPlayer
		movem.l	(sp)+,d0-d7/a0-a6

		move.w	#0,aud0lch+vol(a6)
		move.w	#0,aud1lch+vol(a6)
		move.w	#0,aud2lch+vol(a6)
		move.w	#0,aud3lch+vol(a6)

		move.l	(sp)+,a4

		move.w  #50,d0
.wait
		WAIT_VBLANK
		dbf     d0,.wait

		rts

********************************************************************************
set_up_action_game_map
		move.w	global_vars+action_map(a5),d0
		move.w	d0,global_vars+worldmap_loc(a5)
		move.w	d0,global_vars+worldmap_last_locn(a5)

		move.l	#front_locations_dat,a1
		add.l	a5,a1
		subq.w	#1,d0
		mulu	#locn_struct_size,d0
		add.l	d0,a1

		move.w	#locn_struct_size-1,d0
		lea	global_vars+curr_locn(a5),a2
.loop		move.b	(a1)+,(a2)+
		dbf	d0,.loop

		clr.w	variables+restart_flag(a5)

		rts

********************************************************************************
first_campaign_map
		move.w	variables+random_num(a5),d2
		mulu	#27,d2
		rol.w	#7,d2
		move.w	d2,variables+random_num(a5)
		and.w	#%111111,d2

.start_again	move.w	variables+num_locns(a5),d1
		subq.w	#1,d1
		move.l	#front_locations_dat,a4
		add.l	a5,a4

.start_loop	cmpi.b	#2,locn_type_flag(a4)
		bne.s	.not_start
		dbf	d2,.not_start

		sub.w	variables+num_locns(a5),d1
		addi.w	#1,d1
		neg.w	d1
		move.w	d1,d0
		move.w	d0,global_vars+worldmap_loc(a5)
		bra.s	.not_first_game

.not_start	add.l	#locn_struct_size,a4
		dbf	d1,.start_loop
		bra.s	.start_again

.not_first_game
		mulu	#locn_struct_size,d0
		move.l	#front_locations_dat,a4
		add.l	a5,a4
		add.l	d0,a4

		rts

********************************************************************************
validate_choice
		cmpi.b	#2,locn_type_flag(a0)
		beq.s	.not_found

	IFD	se
		cmp.w	#2,d1
		ble.s	.ok
		cmp.w	#17,d1
		beq.s	.ok
		cmp.w	#6,d1
		beq.s	.ok
		bra.s	.not_found
.ok
	ENDC

		tst.b	cheat_mode
		beq.s   .no_cheat
		moveq.l	#0,d0
		rts
.no_cheat
		cmp.w	global_vars+worldmap_loc(a5),d1
		beq.s	.found

		lea	locn_destinations(a4),a1
		move.w	#3,d0
.loop
		move.w	(a1)+,d2
		beq.s	.not_found
		subq.w	#1,d2

		cmp.w	d1,d2
		beq.s	.found

		dbf	d0,.loop
.not_found	moveq.l	#-1,d0
		rts

.found		moveq.l	#0,d0
		rts

********************************************************************************
already_completed
		lea	global_vars+completed(a5),a2
		tst.b	0(a2,d1.w)
		beq.s	.go_there

		bsr	copy_map_rock
		move.l	#%0010001111,d6
		move.l	#worldmap_font,a2
		add.l	chip_mem_base,a2
		WAIT_COPINT
		BLIT_TEXT .redo_msg,a2,#0,#0

		sf.b	map_f1
		sf.b	map_f2

.wait		tst.b	map_f2
		beq.s	.not_f2
		sf.b	map_f2
		move.w	#-1,global_vars+worldmap_last_scan(a5)
		moveq.l	#-1,d0
		rts
.not_f2
		tst.b	map_f1
		beq.s	.wait
		sf.b	map_f1

.go_there
		move.w	#locn_struct_size-1,d0
		lea	(a0),a1
		lea	global_vars+curr_locn(a5),a2
.loop		move.b	(a1)+,(a2)+
		dbf	d0,.loop

		moveq.l	#0,d0
		rts

.redo_msg	dc.b	ABSPOS,10>>8,10&$ff,5>>8,5&$ff
		PHRASE	82
		dc.b	ABSPOS,60>>8,60&$ff,15>>8,15&$ff
		PHRASE	83
		dc.b	ABSPOS,180>>8,180&$ff,25>>8,25&$ff
		dc.b	"F1     ",ALIGN
		PHRASE	84
		dc.b	ABSPOS,180>>8,180&$ff,35>>8,35&$ff
		dc.b	"F2    ",ALIGN
		PHRASE	85
		dc.b	ENDTEXT
		even

move_msg	dc.b	ABSPOS,10>>8,10&$ff,5>>8,5&$ff
		PHRASE	86
		dc.b	ABSPOS,60>>8,60&$ff,15>>8,15&$ff
		PHRASE	87
		dc.b	ENDTEXT
		even

********************************************************************************
copy_map_rock
		movem.l	d0/a0-a1,-(sp)

		move.w	#(map_p_plane_size*map_p_num_planes/4)-1,d0

		move.l	#worldmap_panel_buffer,a0
		add.l	chip_mem_base,a0

		move.l	#worldmap_panel,a1
		add.l	chip_mem_base,a1

.loop		move.l	(a0)+,(a1)+
		dbf	d0,.loop

		movem.l	(sp)+,d0/a0-a1
		rts

********************************************************************************
show_map_info
		WAIT_COPINT

		bsr	copy_map_rock

		tst.w	d1
		bmi	.no_text

		move.l	#%0010001111,d6
		move.l	#worldmap_font,a2
		add.l	chip_mem_base,a2
		WAIT_COPINT
		BLIT_TEXT locn_legend(a0),a2,#0,#-2

		move.w	global_vars+worldmap_loc(a5),d0
		lea	global_vars+completed(a5),a1
		tst.b	0(a1,d1.w)
		beq.s	.not_completed
		BLIT_TEXT .completed,a2,#0,#-2
		bra.s	.no_text
.not_completed
		BLIT_TEXT .uncompleted,a2,#0,#0
.no_text
		move.w	d1,global_vars+worldmap_last_scan(a5)

		rts

.completed	dc.b	ABSPOS,10>>8,10&$ff,35>>8,35&$ff
		PHRASE	88
		dc.b	ENDTEXT
		even
.uncompleted	dc.b	ABSPOS,10>>8,10&$ff,35>>8,35&$ff
		PHRASE	89
		dc.b	ENDTEXT
		even

********************************************************************************
********************************************************************************
********************************************************************************
reposition_worldmap
		moveq.l	#0,d1
		moveq.l	#0,d2
		move.w	global_vars+worldmap_x(a5),d1
		move.w	global_vars+worldmap_y(a5),d2
		add.w	#128,d1
		add.w	#80,d2

		cmp.w	global_vars+worldmap_cur_x(a5),d1
		beq.s	.map_x_on_cursor
		bgt.s	.map_x_greater
		addi.w	#4,d1
.map_x_greater	subi.w	#2,d1
.map_x_on_cursor
		cmp.w	global_vars+worldmap_cur_y(a5),d2
		beq.s	.map_y_on_cursor
		bgt.s	.map_y_greater
		addi.w	#4,d2
.map_y_greater	subi.w	#2,d2
.map_y_on_cursor

		sub.w	#128,d1
		sub.w	#80,d2

		cmpi.w	#MIN_MAP_Y,d2
		bge.s	.y_min_ok
		move.w	#MIN_MAP_Y,d2
.y_min_ok
		cmpi.w	#MAX_MAP_Y,d2
		ble.s	.y_max_ok
		move.w	#MAX_MAP_Y,d2
.y_max_ok
		cmpi.w	#MIN_MAP_X,d1
		bge.s	.x_min_ok
		move.w	#MIN_MAP_X,d1
.x_min_ok
		cmpi.w	#MAX_MAP_X,d1
		ble.s	.x_max_ok
		move.w	#MAX_MAP_X,d1
.x_max_ok

		move.w	d1,global_vars+worldmap_x(a5)
		move.w	d2,global_vars+worldmap_y(a5)

		mulu	#map_plane_width/8,d2
		add.l	viewing_buffer,d2

	IFD	CD32
                subi.l	#32,d1
		asr.l	#4,d1
		asl.l	#2,d1
		add.l	d1,d2

		moveq.l	#$1f,d1
		sub.w	global_vars+worldmap_x(a5),d1
		andi.w	#$1f,d1
		ror.w	#4,d1
		rol.b	#6,d1
		rol.w	#4,d1
		move.w	d1,d3
		rol.w	#4,d3
		or.w	d3,d1
	ELSEIF
                subi.l	#16,d1
		asr.l	#4,d1
		asl.l	#1,d1
		add.l	d1,d2

		moveq.l	#15,d1
		sub.w	global_vars+worldmap_x(a5),d1
		andi.w	#$f,d1
		move.w 	d1,d3
		rol.w	#4,d3
		or.w	d3,d1
	ENDC

		move.l	#worldmap_copperlist,a0
		add.l	chip_mem_base,a0

		move.w	d1,map_bplcon1+2(a0)

		SET_UP_BITPLANE_POINTERS map_bplpt1(a0),d2,#map_plane_size,#map_num_planes

		move.w	global_vars+worldmap_cur_x(a5),d1
		move.w	global_vars+worldmap_cur_y(a5),d2

	IFD	CD32
		cmpi.w	#MIN_MAP_Y+9,d2
		bge.s	.cur_y_min_ok
		move.w	#MIN_MAP_Y+9,d2
.cur_y_min_ok
		cmpi.w	#map_plane_height+9,d2
		ble.s	.cur_y_max_ok
		move.w	#map_plane_height+9,d2
.cur_y_max_ok
	ELSEIF
		cmpi.w	#MIN_MAP_Y+8,d2
		bge.s	.cur_y_min_ok
		move.w	#MIN_MAP_Y+8,d2
.cur_y_min_ok

		cmpi.w	#map_plane_height+7,d2
		ble.s	.cur_y_max_ok
		move.w	#map_plane_height+7,d2
.cur_y_max_ok
	ENDC
		cmpi.w	#MIN_MAP_X+10,d1
		bge.s	.cur_x_min_ok
		move.w	#MIN_MAP_X+10,d1
.cur_x_min_ok
	IFD	CD32
		cmpi.w	#(map_plane_width/2)+7,d1
		ble.s	.cur_x_max_ok
		move.w	#(map_plane_width/2)+7,d1
.cur_x_max_ok
	ELSEIF
		cmpi.w	#map_plane_width+7,d1
		ble.s	.cur_x_max_ok
		move.w	#map_plane_width+7,d1
.cur_x_max_ok
	ENDC
		andi.w	#%1111111111111110,d1
		andi.w	#%1111111111111110,d2
		move.w	d1,global_vars+worldmap_cur_x(a5)
		move.w	d2,global_vars+worldmap_cur_y(a5)

		moveq.l	#0,d1
		moveq.l	#0,d2

		rts



;d1.w=x
;d2.w=y
;d5.w=colour
draw_ham
		move.w	d1,-(sp)

		bsr	.draw_it
		addq.w	#1,d1
		bsr	.draw_it
		addq.w	#1,d1
		bsr	.draw_it
		addq.w	#1,d1
		bsr	.draw_it
		addq.w	#1,d1
		bsr	.draw_it
	IFD	CD32
		addq.w	#1,d1
		bsr	.draw_it
		addq.w	#1,d1
		bsr	.draw_it
		addq.w	#1,d1
		bsr	.draw_it
		addq.w	#1,d1
		bsr	.draw_it
		addq.w	#1,d1
		bsr	.draw_it
	ENDC

		move.w	(sp)+,d1
		rts

.draw_it	movem.l	d1-d7/a0,-(sp)

		move.w	d1,d3
		andi.w	#$f,d3
		andi.w	#$fff0,d1
		move.w	#$7fff,d4
		ror.w	d3,d4

	IFD	CD32
		move.l	#static_music-40800,a0
		add.l	exchip_mem_base,a0

		mulu	#map_plane_width/8,d2
                add.l	d2,a0
		lsr.w	#3,d1
		add.w	d1,a0
	ELSEIF
		move.l	#worldmap_map,a0
		add.l	chip_mem_base,a0

		mulu	#map_plane_width/8,d2
                add.l	d2,a0
		lsr.w	#3,d1
		add.w	d1,a0
	ENDC

	IFD	CD32
		moveq.l	#7,d7
	ELSEIF
		moveq.l	#5,d7
	ENDC

.aloop		ror.w	#1,d5
		move.w	d5,d6
		andi.w	#%1000000000000000,d6
		lsr.w	d3,d6

		and.w	d4,0*map_plane_width/8(a0)
		and.w	d4,1*map_plane_width/8(a0)
		and.w	d4,2*map_plane_width/8(a0)
		and.w	d4,3*map_plane_width/8(a0)
		and.w	d4,4*map_plane_width/8(a0)

		or.w	d6,0*map_plane_width/8(a0)
		or.w	d6,1*map_plane_width/8(a0)
		or.w	d6,2*map_plane_width/8(a0)
		or.w	d6,3*map_plane_width/8(a0)
		or.w	d6,4*map_plane_width/8(a0)

		add.l	#map_plane_size,a0

		dbf	d7,.aloop

		movem.l	(sp)+,d1-d7/a0
		rts

	IFD	CD32
CHANGE_RED	equ	%10111111
CHANGE_GRN	equ	%11111111
CHANGE_BLU	equ	%01111111
	ELSEIF
CHANGE_RED	equ	%101111
CHANGE_GRN	equ	%111111
CHANGE_BLU	equ	%011111
	ENDC

draw_locns
		movem.l a0-a6/d0-d7,-(sp)

		move.l	#front_locations_dat,a0
		add.l	a5,a0
		lea	global_vars+completed(a5),a1
		move.w	#15,d3

		move.w	#20,d4
.loop
		move.b	locn_type_flag(a0),d1
		cmpi.b	#1,d1
		beq.s	.skip
		cmpi.b	#2,d1
		beq.s	.skip

		move.w	locn_x(a0),d1
		move.w	locn_y(a0),d2
		subq.w	#2,d1
		subq.w	#2,d2

	IFD	CD32
		cmpi.w	#198,d1
		bne.s	.not_ammo
		addi.w	#1,d1
.not_ammo
		cmpi.w	#189,d1
		bne.s	.not_martin
		subi.w	#1,d2
.not_martin
		cmpi.w	#418,d1
		bne.s	.not_hally
		addi.w	#2,d1
.not_hally
		lsl.w	#1,d1
	ENDC

		move.w	d3,d5
		tst.b	(a1)
		bne.s	.completed
		move.w	#CHANGE_RED,d5
		bra.s	.skip_completed
.completed	move.w	#CHANGE_GRN,d5
.skip_completed
		bsr	draw_ham

.skip		add.w	#locn_struct_size,a0
		add.w	#1,a1
		dbf	d4,.loop

		movem.l	(sp)+,a0-a6/d0-d7
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a6=base address of hardware registers (long)
;OUTPUT:	d1.w=location under cursor (-1=none)
;		a0.l=address of location under cursor (long)
;CHANGES:	none
hit_location
		move.w	global_vars+worldmap_cur_x(a5),d1
		move.w	global_vars+worldmap_cur_y(a5),d2
		sub.w	#7,d1
		sub.w	#7,d2
	IFD	CD32
		sub.w	#16,d1
		sub.w	#1,d2
	ENDC

		move.l	a5,a0
		add.l	#front_locations_dat,a0
		move.w	variables+num_locns(a5),d0
		subq.w	#1,d0

.loop		move.w	locn_x(a0),d3
		move.w	locn_x(a0),d4
		sub.w	locn_hit_width(a0),d3
		add.w	locn_hit_width(a0),d4

		cmp.w	d3,d1
		blt.s	.not_hit
		cmp.w	d4,d1
		bgt.s	.not_hit

		move.w	locn_y(a0),d3
		move.w	locn_y(a0),d4
		sub.w	locn_hit_height(a0),d3
		add.w	locn_hit_height(a0),d4

		cmp.w	d3,d2
		blt.s	.not_hit
		cmp.w	d4,d2
		bgt.s	.not_hit

		move.w	d0,d1
		sub.w	variables+num_locns(a5),d1
		addq.w	#1,d1
		neg.w	d1

		move.b	locn_type_flag(a0),d0
		tst.w	global_vars+action_flag(a5)
		beq.s	.campaign

.action		cmpi.b	#1,d0
		bne.s	.end
		moveq.l	#0,d0
		rts

.campaign	cmpi.b	#1,d0
		beq.s	.end
		moveq.l	#0,d0
		rts

.not_hit	add.w	#locn_struct_size,a0
		dbf	d0,.loop

.end		moveq.l	#-1,d0
		moveq.l	#-1,d1
		rts

	ENDC

********************************************************************************
********************************************************************************
********************************************************************************
map_copper_interrupt

	IFD	demo

		rts

	ELSEIF

		move.w	global_vars+worldmap_loc(a5),d0
		mulu	#locn_struct_size,d0
		lea	0(a5,d0),a4
		add.l	#front_locations_dat,a4		;a4=address of current location

		tst.b	map_up
		beq.s	.not_up
		subi.w	#2,global_vars+worldmap_cur_y(a5)
		move.w	#76,global_vars+worldmap_anim1(a5)
.not_up
		tst.b	map_down
		beq.s	.not_down
		addi.w	#2,global_vars+worldmap_cur_y(a5)
		move.w	#76,global_vars+worldmap_anim1(a5)
.not_down
		tst.b	map_left
		beq.s	.not_left
		subi.w	#2,global_vars+worldmap_cur_x(a5)
		move.w	#76,global_vars+worldmap_anim1(a5)
.not_left
		tst.b	map_right
		beq.s	.not_right
		addi.w	#2,global_vars+worldmap_cur_x(a5)
		move.w	#76,global_vars+worldmap_anim1(a5)
.not_right

		bsr	reposition_worldmap

		move.w	global_vars+worldmap_glow(a5),d0
		subq.w	#1,d0
		bpl.s	.glow_ok
		move.w	#23,d0
.glow_ok	move.w	d0,global_vars+worldmap_glow(a5)
		lea	glow_table(pc),a0
		lsl.w	#1,d0
		move.l	#worldmap_copperlist,a1
		add.l	chip_mem_base,a1
	IFND	CD32
		move.w	0(a0,d0.w),map_palette+6+24*4(a1)
		move.w	0(a0,d0.w),map_palette+6+28*4(a1)
	ENDC

		move.w	locn_x(a4),d1		;animate flag
		move.w	locn_y(a4),d2
		sub.w	global_vars+worldmap_x(a5),d1
		sub.w	global_vars+worldmap_y(a5),d2
		add.w	#158-5,d1
		add.w	#41-6,d2
	IFD	CD32
		add.w	#16,d1
		sub.w	#1,d2
	ENDC
		move.w	global_vars+worldmap_anim2(a5),d3
                lea     flag_anim(pc),a3
		move.w	0(a3,d3.w),a3
		add.l	#worldmap_sprites,a3
		add.l	chip_mem_base,a3
		add.w	#2,global_vars+worldmap_anim2(a5)
		cmp.w	#40,global_vars+worldmap_anim2(a5)
		blt.s	.anim_ok
		move.w	#0,global_vars+worldmap_anim2(a5)
.anim_ok
		bsr	position_hdw_sprite

		move.w	global_vars+worldmap_cur_y(a5),d2
		sub.w	global_vars+worldmap_y(a5),d2
		move.l	#worldmap_sprites,a0
		add.l	chip_mem_base,a0

		move.l	global_vars+worldmap_add1(a5),a1
                cmp.l	#0,a1
		beq.s	.no_store
		move.l	global_vars+worldmap_store1(a5),(a1)
		move.l	global_vars+worldmap_add2(a5),a1
		move.l	global_vars+worldmap_store2(a5),(a1)
.no_store
		move.l	#worldmap_copperlist,a1
		add.l	chip_mem_base,a1
		cmpi.w  #8,d2
		bge.s	.line1
		move.b	#8,d2
		move.b	#8+33,map_line_wait1(a1)
		move.b	#8+33,map_line_wait2(a1)
		bra.s	.line3
.line1		cmpi.w  #165,d2
		ble.s	.line2
		move.b	#165,d2
		move.b	#165+33,map_line_wait1(a1)
		move.b	#165+33,map_line_wait2(a1)
		bra.s	.line3
.line2		move.b	d2,map_line_wait1(a1)
		add.b	#33,map_line_wait1(a1)
		move.b	map_line_wait1(a1),map_line_wait2(a1)
.line3
		moveq.l	#0,d0
		move.b	d2,d0
		subq.w	#7,d0
		mulu	#map_plane_width/8,d0

		move.w	map_bplpt1+2+4*0(a1),d1
		swap	d1
		move.w	map_bplpt1+2+4*1(a1),d1
		add.l	d0,d1
		move.w	d1,map_line_bplpt+2+4*1(a1)
		swap	d1
		move.w	d1,map_line_bplpt+2+4*0(a1)

		move.w	map_bplpt1+2+4*2(a1),d1
		swap	d1
		move.w	map_bplpt1+2+4*3(a1),d1
		add.l	d0,d1
		move.w	d1,map_line_bplpt+2+4*3(a1)
		swap	d1
		move.w	d1,map_line_bplpt+2+4*2(a1)

		move.w	map_bplpt1+2+4*4(a1),d1
		swap	d1
		move.w	map_bplpt1+2+4*5(a1),d1
		add.l	d0,d1
		move.w	d1,map_line_bplpt+2+4*5(a1)
		swap	d1
		move.w	d1,map_line_bplpt+2+4*4(a1)

		move.w	map_bplpt1+2+4*6(a1),d1
		swap	d1
		move.w	map_bplpt1+2+4*7(a1),d1
		add.l	d0,d1
		move.w	d1,map_line_bplpt+2+4*7(a1)
		swap	d1
		move.w	d1,map_line_bplpt+2+4*6(a1)

		move.w	map_bplpt1+2+4*8(a1),d1
		swap	d1
		move.w	map_bplpt1+2+4*9(a1),d1
		add.l	d0,d1
		move.w	d1,map_line_bplpt+2+4*9(a1)
		swap	d1
		move.w	d1,map_line_bplpt+2+4*8(a1)

		move.w	map_bplpt1+2+4*10(a1),d1
		swap	d1
		move.w	map_bplpt1+2+4*11(a1),d1
		add.l	d0,d1
		move.w	d1,map_line_bplpt+2+4*11(a1)
		swap	d1
		move.w	d1,map_line_bplpt+2+4*10(a1)

	IFD	CD32
		move.w	map_bplpt1+2+4*12(a1),d1
		swap	d1
		move.w	map_bplpt1+2+4*13(a1),d1
		add.l	d0,d1
		move.w	d1,map_line_bplpt+2+4*13(a1)
		swap	d1
		move.w	d1,map_line_bplpt+2+4*12(a1)

		move.w	map_bplpt1+2+4*14(a1),d1
		swap	d1
		move.w	map_bplpt1+2+4*15(a1),d1
		add.l	d0,d1
		move.w	d1,map_line_bplpt+2+4*15(a1)
		swap	d1
		move.w	d1,map_line_bplpt+2+4*14(a1)
	ENDC

		sub.w	#167-1+8,d2
		neg.w	d2

		cmpi.w  #1,d2
		bge.s	.ok1
		move.w	#1,d2
		bra.s	.ok2
.ok1		cmpi.w  #166,d2
		ble.s	.ok2
		move.w	#166,d2
.ok2
		lsl.w	#2,d2
		add.l	d2,a0
		move.l	a0,a1
		move.l	a0,global_vars+worldmap_add1(a5)
		move.l	(a0),global_vars+worldmap_store1(a5)
		add.w	#652,a1
		move.l	a1,global_vars+worldmap_add2(a5)
		move.l	(a1),global_vars+worldmap_store2(a5)

		move.l	#worldmap_copperlist+map_sprites,a1
		add.l	chip_mem_base,a1

		move.w	global_vars+worldmap_cur_x(a5),d1
		sub.w	global_vars+worldmap_x(a5),d1
		add.w	#160-9-7,d1
		HDW_SPRITE16 #2,a0,d1,#41,#163,a1

		rts

flag_anim	dc.w    1340+0*72,1340+0*72,1340+1*72,1340+1*72,1340+2*72
		dc.w	1340+2*72,1340+3*72,1340+3*72,1340+4*72,1340+4*72
		dc.w    1340+5*72,1340+5*72,1340+6*72,1340+6*72,1340+7*72
		dc.w	1340+7*72,1340+8*72,1340+8*72,1340+9*72,1340+9*72

********************************************************************************
position_hdw_sprite
		cmpi.w	#144,d1
		blt.s	.not_visible		;if off left then dont display
		cmp.w	#416,d1
		bgt.s	.not_visible		;if off right then dont display

		cmpi.w	#27,d2
		blt.s	.not_visible		;if off top then dont display
		cmp.w	#200,d2
		bgt.s	.not_visible		;if off bottom then dont display

		move.l	#worldmap_copperlist+map_sprites,a1
		add.l	chip_mem_base,a1
		HDW_SPRITE16 #3,a3,d1,d2,#16,a1
		rts

.not_visible
		move.l	#worldmap_copperlist+map_sprites,a1
		add.l	chip_mem_base,a1
		HDW_SPRITE16 #3,a3,#0,#0,#16,a1
		rts

********************************************************************************
position_hdw_sprite2
		cmpi.w	#7,d3
		bgt.s	.end

		cmpi.w	#144,d1
		blt.s	.not_visible		;if off left then dont display
		cmp.w	#416,d1
		bgt.s	.not_visible		;if off right then dont display

		cmpi.w	#25,d2
		blt.s	.not_visible		;if off top then dont display
		cmp.w	#200,d2
		bgt.s	.not_visible		;if off bottom then dont display

		move.l	#worldmap_copperlist+map_sprites,a1
		add.l	chip_mem_base,a1
		HDW_SPRITE16 d3,a3,d1,d2,#16,a1

		addq.w	#1,d3
.end		rts

.not_visible
		rts

position_hdw_sprite_force
		move.l	#worldmap_copperlist+map_sprites,a1
		add.l	chip_mem_base,a1
		HDW_SPRITE16 d3,a3,d1,d2,#16,a1
		addq.w	#1,d3
		rts

	ENDC

********************************************************************************
*************************** Load And Decrunch Figures **************************
********************************************************************************

load_and_decrunch_figures
	IFND	demo

		move.l	#lc_disk_buffer,a2
		add.l	a4,a2			;disk buffer
		PRELOG_DISK #1,a2,#2

		SHOW_MESG diskio_mesg_1
	ENDC

		move.l	#front_figures_save+load_figure1,a1
		add.l   a5,a1
		LOAD_FILE2 global_vars+orig_player1_stats+load_name(a5),a1
		STRCPY2	global_vars+orig_player1_stats+load_name(a5),loaded_pl1

		move.l	#front_figures_save+load_figure2,a1
		add.l   a5,a1
		LOAD_FILE2 global_vars+orig_player2_stats+load_name(a5),a1
		STRCPY2	global_vars+orig_player2_stats+load_name(a5),loaded_pl2

		move.l	#front_figures_save+load_figure3,a1
		add.l   a5,a1
		LOAD_FILE2 global_vars+orig_player3_stats+load_name(a5),a1
		STRCPY2	global_vars+orig_player3_stats+load_name(a5),loaded_pl3

		cmpi.b	#3,global_vars+num_players(a5)
		beq.s	.3pl
		move.l	#front_figures_save+load_figure4,a1
		add.l   a5,a1
		LOAD_FILE2 global_vars+orig_player4_stats+load_name(a5),a1
		STRCPY2	global_vars+orig_player4_stats+load_name(a5),loaded_pl4
.3pl
		move.l	#front_figures_save+load_figure1,a0
		add.l   a5,a0
		move.l	#front_figures_save+figure1,a1
		add.l   a5,a1
		jsr	cr_decrunch

		move.l	#front_figures_save+load_figure2,a0
		add.l   a5,a0
		move.l	#front_figures_save+figure2,a1
		add.l   a5,a1
		jsr	cr_decrunch

		move.l	#front_figures_save+load_figure3,a0
		add.l   a5,a0
		move.l	#front_figures_save+figure3,a1
		add.l   a5,a1
		jsr	cr_decrunch

		cmpi.b	#3,global_vars+num_players(a5)
		beq.s	.3pl_2
		move.l	#front_figures_save+load_figure4,a0
		add.l   a5,a0
		move.l	#front_figures_save+figure4,a1
		add.l   a5,a1
		jsr	cr_decrunch
.3pl_2
		rts

********************************************************************************
************************* Load And Decrunch WorldMap Data **********************
********************************************************************************

world_pic	dc.b	"static/world.pic",0
		even

load_and_decrunch_worldmap_data
		lea	world_pic,a0
		suba.l	a1,a1
		suba.l	a2,a2
		jsr	show_static_pic
		jsr	wait_for_no_input
		jsr	wait_for_input

		tst.w	global_vars+game_count(a5)
		bne.s	.not_first_time
		bsr	load_and_decrunch_figures
.not_first_time

	IFND	demo

		move.l  #lc_disk_buffer,a2
		add.l	a4,a2
		moveq.l	#-1,d1
		LOG_DISK #2,a2,d1

		SHOW_MESG diskio_mesg_1
	ENDC

	IFND	editor
		move.l	#front_locations_dat,a1
		add.l	a5,a1
		LOAD_FILE <"World/Locations.dat">,a1
	ENDC

	IFND	demo

		tst.b	lang
		beq.s	.no_foreign
		move.l	chip_mem_base,a1
		add.l	#worldmap_foreign,a1
		LOAD_FILE_QUIET <"World/WorldForeign.dat">,a1
.no_foreign
		tst.w	global_vars+action_flag(a5)
		bne	.action_game

		move.l	#worldmap_music,a1
		add.l	a4,a1
		LOAD_FILE <"World/World.dat">,a1

	IFD	CD32
		move.l	#static_music-40800,a1
		add.l	exchip_mem_base,a1
		LOAD_FILE <"World/Map.pic">,a1
	ENDC

		SHOW_MESG decrunch_message

		move.l	#worldmap_music,a1
		add.l	a4,a1
		PP_DECRUNCH a1

		move.l  #worldmap_music,a0
		add.l	chip_mem_base,a0
		movem.l	d0-d7/a0-a6,-(sp)
		jsr	_RelocModule
		movem.l	(sp)+,d0-d7/a0-a6

		move.l	#worldmap_music,a0
		add.l	chip_mem_base,a0
		movem.l	d0-d7/a0-a6,-(sp)
		jsr	_PlayModule
		movem.l	(sp)+,d0-d7/a0-a6

		clr.l	global_vars+worldmap_add1(a5)
		clr.l	global_vars+worldmap_store1(a5)
		clr.l	global_vars+worldmap_add2(a5)

;set up in-line pointers

		move.l	#worldmap_font,a0
		add.l	a4,a0
		move.l	a0,d0
		add.l	d0,text_address(a0)
		clr.l	global_vars+worldmap_store2(a5)
.action_game

        ENDC

	IFND	editor
		move.l	#front_locations_dat,a1
		add.l	a5,a1
		PP_DECRUNCH a1

		divu	#locn_struct_size,d0
		move.w	d0,variables+num_locns(a5)

		tst.b	lang
		beq.s	.no_foreign2
		move.l	chip_mem_base,a0
		add.l	#worldmap_foreign,a0
		PP_DECRUNCH_QUIET a0
		bsr	modify_mesgs
.no_foreign2
        ENDC
		rts

********************************************************************************
modify_mesgs
		moveq.l	#0,d0
		move.b	lang,d0
		beq.s	.english

		move.l	a5,a0
		add.l	#front_locations_dat,a0
		move.l	chip_mem_base,a1
		add.l	#worldmap_foreign,a1
		subq.w	#1,d0
		mulu	#for_size*47,d0
		add.l   d0,a1

		move.w	#47-1,d1

.loop		lea	locn_legend2(a0),a2
		move.w	#6+60+6+60-1,d0
.copy_loop	move.b	(a1)+,(a2)+
		dbf	d0,.copy_loop

		lea	locn_info(a0),a2
		move.w	#6+60+6+60+6+60+6+60+1-1,d0
.copy_loop2	move.b	(a1)+,(a2)+
		dbf	d0,.copy_loop2

		add.w	#locn_struct_size,a0

		dbf	d1,.loop

.english	rts

********************************************************************************
load_foreignfont2
		tst.b	lang
		beq.s	.not_forgn

		move.l	#miscgfx,a1
		add.l	a4,a1
		add.l	game_font(a1),a1

		LOAD_FILE <"Game/Foreign.font">,a1
.not_forgn
		rts

********************************************************************************
********************************************************************************

map_scan_quit	move.b	map_ctrl,d0
		add.b	map_quit_game,d0
		cmpi.b	#2,d0
		bne.s	.end

.wait_up	move.b	map_ctrl,d0
		add.b	map_quit_game,d0
		cmpi.b	#2,d0
		beq.s	.wait_up

		move.w	#1,variables+restart_flag(a5)
.end		rts

********************************************************************************
********************************************************************************
;remove any keys that the players are carrying
remove_keys
		lea	global_vars+orig_pl1_using(a5),a2
		bsr	.remove_keys
		lea	global_vars+orig_pl2_using(a5),a2
		bsr	.remove_keys
		lea	global_vars+orig_pl3_using(a5),a2
		bsr	.remove_keys
		lea	global_vars+orig_pl4_using(a5),a2
		bsr	.remove_keys
		rts

.remove_keys
		bsr	.remove_key
		tst.l	d1
		beq.s	.no_remove1
		clr.l	(a2)
.no_remove1	add.l	#inven_item_size,a2

		move.w	#inven_size-1,d0
.loop		bsr	.remove_key
		tst.l	d1
		beq.s	.no_remove2
		bsr	.remove_item
		dbf	d0,.loop
		rts
.no_remove2	add.l	#inven_item_size,a2
		dbf	d0,.loop
		rts

.remove_key	move.b	inven_item_num(a2),d1
		cmp.b	#71,d1
		blt.s	.no_item
		cmp.b	#76,d1
		bgt.s	.no_item

.key		moveq.l	#-1,d1
		rts
.no_item	moveq.l	#0,d1
		rts

.remove_item	movem.l	d0/a2,-(sp)
		subq.w	#1,d0
		bmi.s	.end_list
.remove_loop	move.l	4(a2),(a2)
		add.l	#inven_item_size,a2
		dbf	d0,.remove_loop
		sub.l	#inven_item_size,a2
.end_list	clr.l	(a2)
		movem.l	(sp)+,d0/a2
		rts

********************************************************************************
********************************* Responsive keys ******************************
********************************************************************************
;Format : keydown, keycode, release
; Keydown is set while the key is pressed.
; Use keycode as specified in Hardware Reference Manual page 249.
; Set release for keyup messages to be interpreted.

map_key_list
map_key_down	dc.b	0
map_key_up	dc.b	0
map_f1		dc.b	0,$50,0		;f1
map_f2		dc.b	0,$51,0		;f2
map_up		dc.b	0,$4c,1		;cursor up
map_down	dc.b	0,$4d,1		;cursor down
map_left	dc.b	0,$4f,1		;cursor left
map_right	dc.b	0,$4e,1		;cursor right
map_select	dc.b	0,$44,1		;return
map_ctrl	dc.b	0,$63,1		;ctrl
map_screen_grab	dc.b	0,$24,1		;g
map_quit_game	dc.b	0,$10,1		;q
map_lshift	dc.b	0,$60,1		;lshift
map_rshift	dc.b	0,$61,1		;rshift
		dc.b	0,$ff,0		;eod marker

                even

********************************************************************************
************************************* Palette **********************************
********************************************************************************

worldmap_palette
		dc.w	$000,$332,$260,$553,$254,$572,$566,$5a2
		dc.w	$877,$7a6,$9b7,$8aa,$ba7,$bba,$dca,$ded
		dc.w	$000,$dfe,$aec,$000
		dc.w	$000,$e22,$f66,$000
		dc.w	$000,$f22,$2f2,$000
		dc.w	$000,$f22,$2f2,$000

glow_table	dc.w	$f22
		dc.w	$f22
		dc.w	$f32
		dc.w	$f32
		dc.w	$f42
		dc.w	$f52
		dc.w	$f72
		dc.w	$fa2
		dc.w	$fc2
		dc.w	$fd2
		dc.w	$fe2
		dc.w	$fe2
		dc.w	$ff2
		dc.w	$ff2
		dc.w	$fe2
		dc.w	$fe2
		dc.w	$fd2
		dc.w	$fc2
		dc.w	$fa2
		dc.w	$f72
		dc.w	$f52
		dc.w	$f42
		dc.w	$f32
		dc.w	$f32

worldmap_palette2
		dc.w	$000,$fff,$aaa,$666,$000,$000,$000,$000
		dc.w	$000,$cdf,$79b,$236,$134,$023,$012,$011
		dc.w	$000,$000,$000,$000,$000,$000,$000,$000
		dc.w	$000,$000,$000,$000,$000,$000,$000,$000

		even
