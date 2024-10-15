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

MIN_FACES_X	equ     87-16
	IFD	CD32
MAX_FACES_X	equ     (faces_plane_width/2)-329-32
	ELSEIF
MAX_FACES_X	equ     faces_plane_width-329
	ENDC

********************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:       none
select_characters
		move.w	#MODE_CHSELECT,variables+mode(a5)

	IFND	demo

		jsr	kill_screen

		move.l  #ch_screen_buffer,a0
		add.l	a4,a0
		move.l	#front_anim_in,a1
		add.l	a5,a1
		jsr	play_anim

		move.l	#lc_mesg_buffer,a0
		add.l	a4,a0
		jsr	set_up_message_screen

		move.w	#0,variables+file_mode(a5)

	ENDC

		bsr	load_and_decrunch_chselect_data

		tst.w	global_vars+training_flag(a5)
		beq.s	.not_training

		move.w	#1,global_vars+chselect_ch(a5)
		moveq.l	#2,d0  			;cheule
		bsr	copy_stats
		move.w	#2,global_vars+chselect_ch(a5)
		moveq.l	#3,d0  			;cim
		bsr	copy_stats
		move.w	#3,global_vars+chselect_ch(a5)
		moveq.l	#7,d0  			;rorian
		bsr	copy_stats
		move.w	#4,global_vars+chselect_ch(a5)
		moveq.l	#8,d0	  		;jenillee
		bsr	copy_stats

		rts
.not_training

	IFD	demo

		move.w	#1,global_vars+chselect_ch(a5)
		moveq.l	#2,d0  			;cheule
		bsr	copy_stats
		move.w	#2,global_vars+chselect_ch(a5)
		moveq.l	#3,d0  			;cim
		bsr	copy_stats
		move.w	#3,global_vars+chselect_ch(a5)
		moveq.l	#7,d0  			;rorian
		bsr	copy_stats
		move.w	#4,global_vars+chselect_ch(a5)
		moveq.l	#8,d0	  		;jenillee
		bsr	copy_stats

		rts

	ELSEIF

		jsr	unshow_message
		move.l  #ch_screen_buffer,a0
		add.l	a4,a0
		move.l	#front_anim_out,a1
		add.l	a5,a1
		jsr	play_anim

		move.w	#-1,last_drawn
	IFD	CD32
		move.w	#MIN_FACES_X*2,global_vars+chselect_x(a5)
	ELSEIF
		move.w	#MIN_FACES_X,global_vars+chselect_x(a5)
	ENDC
		clr.w	global_vars+chselect_direct(a5)
		move.w	#-1,global_vars+chselect_timer(a5)
		clr.w	global_vars+chselect_ch1(a5)
		clr.w	global_vars+chselect_ch2(a5)
		clr.w	global_vars+chselect_ch3(a5)
		clr.w	global_vars+chselect_ch4(a5)
		clr.w	global_vars+chselect_ch(a5)
		moveq.l	#0,d0
		move.w	#4,global_vars+chselect_num(a5)
		cmpi.b	#3,global_vars+num_players(a5)
		bne.s	.not3pl
		move.w	#3,global_vars+chselect_num(a5)
.not3pl

		jsr	set_up_chselect_screen

		BOB_INFO drawing_buffer,#chselect_plane_width/8,#chselect_plane_height,#chselect_num_planes,#0,#0,#640,#209,#0
		bsr	redraw_chselect_all_rock
		bsr	redraw_small_faces

		WAIT_COPINT
		move.l	#ch_copperlist,a2
		add.l	a4,a2
		DISPLAY_PALETTE chselect_palette,chselect_palette1(a2)
		DISPLAY_PALETTE chselect_palette,chselect_palette2(a2)
		DISPLAY_PALETTE chselect2_palette,chselect_palette1b(a2)
		DISPLAY_PALETTE chselect2_palette,chselect_palette2b(a2)

	IFD	CD32
;		move.w	joy0dat(a6),variables+mouse0_trip(a5)
		clr.w	variables+mouse0_x(a5)
	ENDC
		move.w	#MODE_CHSELECT_SCROLL,variables+mode(a5)

		bsr	redraw_info

		tst.l	os_kill
		bne.s	.skip_wait1
		jsr	temp_restore_system
.skip_wait1
.loop
		bsr	chselect_grab

		tst.b	chselect_return
		beq.s	.not_return
		clr.b	chselect_return
		move.w	global_vars+chselect_ch(a5),d0
		cmp.w	global_vars+chselect_num(a5),d0
		beq	.end
		tst.l	os_kill
		bne.s	.skip_wait2
		jsr	temp_take_system
.skip_wait2	bsr	select_character
		tst.l	os_kill
		bne.s	.skip_wait3
		jsr	temp_restore_system
.skip_wait3
.not_return
		move.b	chselect_del1,d0
		or.b	chselect_del2,d0
		tst.b	d0
		beq.s	.not_del
		clr.b	chselect_del1
		clr.b	chselect_del2
		tst.l	os_kill
		bne.s	.skip_wait4
		jsr	temp_take_system
.skip_wait4	bsr	delete_character
		tst.l	os_kill
		bne.s	.skip_wait5
		jsr	temp_restore_system
.skip_wait5
.not_del
		tst.l	os_kill
		bne.s	.skip_wait7
		jsr	temp_take_system
.skip_wait7	bsr	redraw_info
		tst.l	os_kill
		bne.s	.skip_wait6
		jsr	temp_restore_system
.skip_wait6
		bsr	chselect_scan_quit

		tst.w	variables+restart_flag(a5)
		beq	.loop
.end
		move.w	#MODE_CHSELECT,variables+mode(a5)

		tst.l	os_kill
		bne.s	.skip_wait8
		jsr	temp_take_system
.skip_wait8

		move.l	#ch_copperlist,a0
		add.l	a4,a0
		move.l	#ch_copperlist+chselect_clist_start2,a2
		add.l	a4,a2
		jsr	fade_copper_to_black_interlace

		movem.l	d0-d7/a0-a6,-(sp)
		jsr	_StopPlayer
		movem.l	(sp)+,d0-d7/a0-a6

		jsr	killaud

		rts

********************************************************************************
********************************************************************************
********************************************************************************

chselect_vblank
		move.w	global_vars+default_cntrl(a5),d0
		btst.l	#ACTV_MOUSE1B,d0
		beq.s	.no_mouse1
		jsr	mouse0_hires_read
		moveq.l	#0,d0
		move.w	variables+mouse0_x(a5),d0
		sub.w	#mouse_hires_xmin,d0
		muls	#(MAX_FACES_X-MIN_FACES_X)*2,d0
		divs	#mouse_hires_xmax-mouse_hires_xmin,d0
		add.w	#MIN_FACES_X*2,d0
		move.w	d0,global_vars+chselect_x(a5)
		tst.w	variables+mouse0_old_left_bt(a5)
		bne.s	.not_mouse1_fire
		tst.w	variables+mouse0_left_bt(a5)
		beq.s	.not_mouse1_fire
		st.b	chselect_return
.not_mouse1_fire
		tst.w	variables+mouse0_old_right_bt(a5)
		bne.s	.not_mouse1_del
		tst.w	variables+mouse0_right_bt(a5)
		beq.s	.not_mouse1_del
		st.b	chselect_del1
.not_mouse1_del
		bra	.set_position
.no_mouse1
		move.w	global_vars+default_cntrl(a5),d0
		btst.l	#ACTV_PAD1B,d0
		bne.s	.joy1
		btst.l	#ACTV_JOY1B,d0
		beq.s	.no_joy1
.joy1		move.b	variables+joystick1_temp(a5),d0
		move.b	variables+joystick1_old(a5),d1
		bsr	chselect_read_joy
.no_joy1



		tst.b	chselect_left
		beq.s	.not_left
		tst.w	global_vars+chselect_direct(a5)
		blt.s	.not_left
        IFD	CD32
		subi.w	#160,global_vars+chselect_direct(a5)
	ELSEIF
		subi.w	#80,global_vars+chselect_direct(a5)
	ENDC
.not_left
		tst.b	chselect_right
		beq.s	.not_right
		tst.w	global_vars+chselect_direct(a5)
		bgt.s	.not_right
        IFD	CD32
		addi.w	#160,global_vars+chselect_direct(a5)
	ELSEIF
		addi.w	#80,global_vars+chselect_direct(a5)
	ENDC
.not_right

.end
		tst.w	global_vars+chselect_direct(a5)
		bmi.s	.left
		beq.s	.none
	IFD	CD32
		add.w	#8,global_vars+chselect_x(a5)
		subi.w	#8,global_vars+chselect_direct(a5)
		bra.s	.none
.left		sub.w	#8,global_vars+chselect_x(a5)
		addi.w	#8,global_vars+chselect_direct(a5)
	ELSEIF
		add.w	#4,global_vars+chselect_x(a5)
		subi.w	#4,global_vars+chselect_direct(a5)
		bra.s	.none
.left		sub.w	#4,global_vars+chselect_x(a5)
		addi.w	#4,global_vars+chselect_direct(a5)
	ENDC
.none

.set_position
		moveq.l	#0,d4
		jsr	reposition_faces

		rts

chselect_read_joy
		btst.l	#left,d0
		beq.s	.not_left
		tst.w	global_vars+chselect_direct(a5)
		blt.s	.not_left
        IFD	CD32
		subi.w	#160,global_vars+chselect_direct(a5)
	ELSEIF
		subi.w	#80,global_vars+chselect_direct(a5)
	ENDC
.not_left
		btst.l	#right,d0
		beq.s	.not_right
		tst.w	global_vars+chselect_direct(a5)
		bgt.s	.not_right
        IFD	CD32
		addi.w	#160,global_vars+chselect_direct(a5)
	ELSEIF
		addi.w	#80,global_vars+chselect_direct(a5)
	ENDC
.not_right
		btst.l	#fire,d1
		bne.s	.not_fire
		btst.l	#fire,d0
		beq.s	.not_fire
		st.b	chselect_return
.not_fire
		btst.l	#buta,d1
		bne.s	.not_buta
		btst.l	#buta,d0
		beq.s	.not_buta
		st.b	chselect_del1
.not_buta
		btst.l	#butc,d1
		bne.s	.not_butc
		btst.l	#butc,d0
		beq.s	.not_butc
		st.b	chselect_del1
.not_butc
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:       none

reposition_faces
		moveq.l	#0,d2
		move.w	global_vars+chselect_x(a5),d2

	IFD	CD32
		cmpi.w	#MIN_FACES_X*2,d2
		bge.s	.x_min_ok
		clr.w	global_vars+chselect_direct(a5)
		move.w	#MIN_FACES_X*2,d2
.x_min_ok
		cmpi.w	#MAX_FACES_X*2,d2
		ble.s	.x_max_ok
		clr.w	global_vars+chselect_direct(a5)
		move.w	#MAX_FACES_X*2,d2
.x_max_ok
		move.w	d2,global_vars+chselect_x(a5)

		move.w	#$3f,d1
		sub.w	d2,d1
		andi.w	#$3f,d1
		move.w	d1,d0
		andi.w	#$1,d0
		lsr	#1,d1
		ror.w	#4,d1
		rol.b	#6,d1
		rol.w	#4,d1
		move.w	d1,d3
		rol.w	#4,d3
		or.w	d3,d1
		lsl.w	#8,d0
		lsl.w	#1,d0
		or.w	d0,d1
		lsl.w	#4,d0
		or.w	d0,d1

		lsr.w	#5,d2
		lsl.w	#2,d2
		add.l	viewing_buffer,d2
	ELSEIF
		cmpi.w	#MIN_FACES_X,d2
		bge.s	.x_min_ok
		clr.w	global_vars+chselect_direct(a5)
		move.w	#MIN_FACES_X,d2
.x_min_ok
		cmpi.w	#MAX_FACES_X,d2
		ble.s	.x_max_ok
		clr.w	global_vars+chselect_direct(a5)
		move.w	#MAX_FACES_X,d2
.x_max_ok
		move.w	d2,global_vars+chselect_x(a5)

		moveq.l	#15,d1
		sub.w	d2,d1
		andi.w	#$f,d1
		move.w	d1,d3
		rol.w	#4,d3
		or.w	d3,d1

		asr.w	#4,d2
		asl.w	#1,d2
		add.l	viewing_buffer,d2
	ENDC

		tst.l	d4
		beq.s	.skip_cop
		WAIT_COPINT
.skip_cop
		move.l	#ch_copperlist,a0
		add.l	a4,a0

		move.w	d1,chselect_bplcon11+2(a0)

		SET_UP_BITPLANE_POINTERS chselect_bplpt1(a0),d2,#faces_plane_size,#faces_num_planes

		move.w	d1,chselect_bplcon12+2(a0)

		add.l	#faces_plane_width/8,d2
		SET_UP_BITPLANE_POINTERS chselect_bplpt2(a0),d2,#faces_plane_size,#faces_num_planes

		move.l	#ch_anti_scroll,a1
		add.l	a4,a1

	IFD	CD32
		move.w	global_vars+chselect_x(a5),d1
		andi.w	#$1f,d1
		lsl.w	#2,d1
		move.l	anti_scrolls(pc,d1.w),d1

		move.l	d1,3*4(a1)
		not.l	d1
		move.l	d1,8*4(a1)

		rts
anti_scrolls
		dc.l	%10000000000000000000000000000000
		dc.l	%11000000000000000000000000000000
		dc.l	%11100000000000000000000000000000
		dc.l	%11110000000000000000000000000000
		dc.l	%11111000000000000000000000000000
		dc.l	%11111100000000000000000000000000
		dc.l	%11111110000000000000000000000000
		dc.l	%11111111000000000000000000000000
		dc.l	%11111111100000000000000000000000
		dc.l	%11111111110000000000000000000000
		dc.l	%11111111111000000000000000000000
		dc.l	%11111111111100000000000000000000
		dc.l	%11111111111110000000000000000000
		dc.l	%11111111111111000000000000000000
		dc.l	%11111111111111100000000000000000
		dc.l	%11111111111111110000000000000000
		dc.l	%11111111111111111000000000000000
		dc.l	%11111111111111111100000000000000
		dc.l	%11111111111111111110000000000000
		dc.l	%11111111111111111111000000000000
		dc.l	%11111111111111111111100000000000
		dc.l	%11111111111111111111110000000000
		dc.l	%11111111111111111111111000000000
		dc.l	%11111111111111111111111100000000
		dc.l	%11111111111111111111111110000000
		dc.l	%11111111111111111111111111000000
		dc.l	%11111111111111111111111111100000
		dc.l	%11111111111111111111111111110000
		dc.l	%11111111111111111111111111111000
		dc.l	%11111111111111111111111111111100
		dc.l	%11111111111111111111111111111110
		dc.l	%11111111111111111111111111111111

	ELSEIF
		move.w	global_vars+chselect_x(a5),d1
		andi.w	#$f,d1
		lsl.w	#1,d1
		move.w	anti_scrolls(pc,d1.w),d1

		move.w	d1,3*2(a1)
		not.w	d1
		move.w	d1,7*2(a1)

		rts
anti_scrolls
		dc.w	%0000000000000000
		dc.w	%1000000000000000
		dc.w	%1100000000000000
		dc.w	%1110000000000000
		dc.w	%1111000000000000
		dc.w	%1111100000000000
		dc.w	%1111110000000000
		dc.w	%1111111000000000
		dc.w	%1111111100000000
		dc.w	%1111111110000000
		dc.w	%1111111111000000
		dc.w	%1111111111100000
		dc.w	%1111111111110000
		dc.w	%1111111111111000
		dc.w	%1111111111111100
		dc.w	%1111111111111110
		dc.w	%1111111111111111
	ENDC


********************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:       none
select_character
		moveq.l	#0,d0
		move.w	global_vars+chselect_x(a5),d0
        IFD	CD32
		subi.w	#(MIN_FACES_X*2)-80,d0
		divu	#160,d0
	ELSEIF
		subi.w	#MIN_FACES_X-40,d0
		divu	#80,d0
	ENDC
		addq.l	#1,d0

		tst.b	cheat_mode
		bne.s	.skip_selected_already
		cmp.w	global_vars+chselect_ch1(a5),d0
		beq	.selected_already
		cmp.w	global_vars+chselect_ch2(a5),d0
		beq	.selected_already
		cmp.w	global_vars+chselect_ch3(a5),d0
		beq	.selected_already
		cmp.w	global_vars+chselect_ch4(a5),d0
		beq	.selected_already
.skip_selected_already

		lea	global_vars+chselect_ch1(a5),a0
		move.w	global_vars+chselect_ch(a5),d1

		move.w	d1,d2
		addq.w	#1,d2
		cmp.w	global_vars+chselect_num(a5),d2
		blt	.alter
		cmp.w	global_vars+chselect_num(a5),d2
		bgt	.ret

		move.w	d0,-(sp)
		lsl.w	#1,d1
		move.w	d0,0(a0,d1.w)
		bsr	redraw_small_faces
		add.w	#1,global_vars+chselect_ch(a5)
		move.w	(sp)+,d0

		bsr	copy_stats

		bsr	redraw_chselect_left_rock
		move.l	#front_font_s,a2
		add.l	a5,a2

	IFD	CD32
		BLIT_TEXT .mesg1,a2,#50,#50,#%1111
	ELSEIF
		BLIT_TEXT .mesg1,a2,#50,#25,#%1111
		BLIT_TEXT .mesg2,a2,#73,#100,#%1111
		BLIT_TEXT .mesg3,a2,#73,#140,#%1111
	ENDC

		bra.s	.ret

.mesg1
		PHRASE	79
		dc.b 	ENDTEXT
	IFND	CD32
.mesg2
		PHRASE  80
		dc.b 	ENDTEXT
.mesg3
		PHRASE  81
		dc.b 	ENDTEXT
	ENDC
		even

.alter		move.w	d0,-(sp)
		lsl.w	#1,d1
		move.w	d0,0(a0,d1.w)
		bsr	redraw_small_faces
		move.w  (sp)+,d0

		add.w	#1,global_vars+chselect_ch(a5)

		bsr	copy_stats

.selected_already
.ret		rts

	ENDC

copy_stats	movem.l	d0/a1-a2,-(sp)

		subq.w	#1,d0
		move.l	#front_player_dat,a1
		add.l	a5,a1
		mulu	#player_dat_size,d0
		add.l	d0,a1

		add.l	#player_game_name,a1
		move.w	global_vars+chselect_ch(a5),d0
		subq.w	#1,d0
		lea	global_vars+orig_player1_stats(a5),a2
		mulu	#stats_struct_size+inven_item_size+(inven_item_size*inven_size),d0
		add.l	d0,a2
		move.w	#old_fitness_band-1,d0
		move.l	a1,-(sp)
.loop		move.b	(a1)+,(a2)+
		dbf	d0,.loop
		move.l	(sp)+,a1

		clr.w	(a2)+
		clr.w	(a2)+
		clr.b	(a2)+
		clr.b	(a2)+
		clr.l	(a2)+

		lea	global_inven_store(a1),a1
		move.w	#init_inven_size-1,d0
.loop2		move.l	(a1)+,(a2)+
		dbf	d0,.loop2

		move.w	#inven_size-init_inven_size-1,d0
.loop3		clr.l	(a2)+
		dbf	d0,.loop3

		movem.l	(sp)+,d0/a1-a2

		rts

	IFND	demo

********************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:       none
delete_character
		tst.w	global_vars+chselect_ch(a5)
		beq.s	.first_ch

		move.w	global_vars+chselect_ch(a5),d0
		cmp.w	global_vars+chselect_num(a5),d0
		bne	.not_last
		move.w	#50,global_vars+chselect_timer(a5)
.not_last
		sub.w	#1,global_vars+chselect_ch(a5)

		lea	global_vars+chselect_ch1(a5),a0
		move.w	global_vars+chselect_ch(a5),d1

		lsl.w	#1,d1
		clr.w	0(a0,d1.w)

		bsr	redraw_small_faces

.first_ch	rts

********************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:       none
redraw_info
		move.w	global_vars+chselect_ch(a5),d0
		cmp.w	global_vars+chselect_num(a5),d0
		beq	.ret

		move.l	#front_font_s,a2
		add.l	a5,a2

		moveq.l	#0,d0
		move.w	global_vars+chselect_x(a5),d0
        IFD	CD32
		subi.w	#(MIN_FACES_X*2)-80,d0
		divu	#160,d0
	ELSEIF
		subi.w	#MIN_FACES_X-40,d0
		divu	#80,d0
	ENDC

		cmp.w	last_drawn,d0
		beq	.ret
		move.w	d0,last_drawn

		move.l	d0,-(sp)
		bsr	redraw_chselect_left_rock
		move.l	(sp)+,d0

		move.l	#front_player_dat,a1
		add.l	a5,a1
		mulu	#player_dat_size,d0
		add.l	d0,a1

		moveq.l	#0,d0
		move.b	lang,d0
		mulu.w	#12*272,d0
		add.w	d0,a1

		BLIT_TEXT player_origin_text(a1),a2,#42,#15,#%1111
		BLIT_TEXT player_chselect_name(a1),a2,#42,#55,#%1111
		BLIT_TEXT player_gender_text(a1),a2,#42,#110,#%1111
		BLIT_TEXT player_class_text(a1),a2,#42,#150,#%1111

.ret		rts

last_drawn	dc.w	0

********************************************************************************
redraw_chselect_all_rock
		WAIT_COPINT
		BOB_INFO drawing_buffer,#chselect_plane_width/8,#chselect_plane_height,#chselect_num_planes,#0,#0,#chselect_plane_width,#chselect_plane_height-1,#0
		bsr	copy_chselect_rock
		rts

********************************************************************************
redraw_chselect_left_rock
		WAIT_COPINT
		BOB_INFO drawing_buffer,#chselect_plane_width/8,#chselect_plane_height,#chselect_num_planes,#0,#0,#448,#chselect_plane_height-1,#0
		bsr     copy_chselect_rock
		BOB_INFO drawing_buffer,#chselect_plane_width/8,#chselect_plane_height,#chselect_num_planes,#0,#0,#chselect_plane_width,#chselect_plane_height-1,#0
		rts

********************************************************************************
;INPUT:		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	d0,a1-a2

copy_chselect_rock
		movem.l	d0/d7/a0-a1,-(sp)

		move.l	#ch_fill,a1
		add.l	a4,a1
		moveq.l	#10-1,d0
		moveq.l	#0,d7
.loop
		BLIT_BOB a1,#0,d7,#%1111
		addi.w	#42,d7
		dbf	d0,.loop

		movem.l	(sp)+,d0/d7/a0-a1

		rts

********************************************************************************
;INPUT		a5=base address of fast memory (long)
;		d0.w=character number 1 (1-12, 0=none)
;		d1.w=character number 2 (1-12, 0=none)
;		d2.w=character number 3 (1-12, 0=none)
;		d3.w=character number 4 (1-12, 0=none)
;OUTPUT:	none
;CHANGES:       none
redraw_small_faces
		move.w	global_vars+chselect_ch1(a5),d0
		mulu	#(64/8)*80*3,d0
		add.l	#ch_smallfaces,d0
		add.l	a4,d0
                move.l	d0,.small_face_add

		lea	.small_face_bob(pc),a0
		move.w	#458+80*0,d5
		move.w	#16+96*0,d7
		move.l	#%1111,d6
		WAIT_VBLANK
		jsr 	blit_bob

		move.w	global_vars+chselect_ch2(a5),d0
		mulu	#(64/8)*80*3,d0
		add.l	#ch_smallfaces,d0
		add.l	a4,d0
                move.l	d0,.small_face_add

		lea	.small_face_bob(pc),a0
		move.w	#458+80*1,d5
		move.w	#16+96*0,d7
		move.l	#%1111,d6
                WAIT_VBLANK
		jsr 	blit_bob

		move.w	global_vars+chselect_ch3(a5),d0
		mulu	#(64/8)*80*3,d0
		add.l	#ch_smallfaces,d0
		add.l	a4,d0
                move.l	d0,.small_face_add

		lea	.small_face_bob(pc),a0
		move.w	#458+80*0,d5
		cmpi.b	#3,global_vars+num_players(a5)
		bne.s	.not_3pl
		add.w	#40,d5
.not_3pl	move.w	#16+96*1,d7
		move.l	#%1111,d6
                WAIT_VBLANK
		jsr 	blit_bob

		cmpi.b	#3,global_vars+num_players(a5)
		beq.s	.3pl

		move.w	global_vars+chselect_ch4(a5),d0
		mulu	#(64/8)*80*3,d0
		add.l	#ch_smallfaces,d0
		add.l	a4,d0
                move.l	d0,.small_face_add

		lea	.small_face_bob(pc),a0
		move.w	#458+80*1,d5
		move.w	#16+96*1,d7
		move.l	#%1111,d6
                WAIT_VBLANK
		jsr 	blit_bob
.3pl
		rts

.small_face_bob
.small_face_add	dc.l    0	;address of image data
		dc.w	64	;width in pixels (multiple of 16)
		dc.w	80	;height in pixels
		dc.w	6	;plane for mask 0-5 (6=no mask)
		dc.b	0	;bit 1=flipped 2=ignore d5/d7 offset
		dc.b	1	;0=clipping disabled 1=clipping enabled
		dc.b	1	;0=no draw 1=copy 2=clear 3=set
		dc.b    1
		dc.b    1
		dc.b    2
		dc.b	0
		dc.b	0

	ENDC

********************************************************************************
************************ Load And Decrunch ChSelect Data ***********************
********************************************************************************

load_and_decrunch_chselect_data
	IFND	demo

		move.l  #lc_disk_buffer,a2
		add.l	a4,a2
		PRELOG_DISK #1,a2,#2

		SHOW_MESG diskio_mesg_1

		movem.l	d0-d7/a0-a6,-(sp)
		jsr	_StopPlayer
		movem.l	(sp)+,d0-d7/a0-a6

		move.w	#0,aud0lch+vol(a6)
		move.w	#0,aud1lch+vol(a6)
		move.w	#0,aud2lch+vol(a6)
		move.w	#0,aud3lch+vol(a6)

		move.l	#ch_copperlist,a1
		add.l	a4,a1
		LOAD_FILE <"ChSelect/ChSelect.dat">,a1

	ENDC

	IFD	editor
		move.l  #lc_disk_buffer,a2
		add.l	a4,a2
		PRELOG_DISK #1,a2,#2
	ENDC

		move.l	#front_player_dat,a1
		add.l	a5,a1
		LOAD_FILE <"ChSelect/Characters.dat">,a1

	IFD	demo
		rts
        ENDC

		SHOW_MESG decrunch_message

		move.l	#ch_copperlist,a1
		add.l	a4,a1
		PP_DECRUNCH a1

		move.l	#front_player_dat,a1
		add.l	a5,a1
		PP_DECRUNCH a1

	IFD	CD32
		move.l	#ch_fill,a0
		add.l	a4,a0
		move.l	a0,d0
		add.l	d0,(a0)
	ENDC

		tst.w	global_vars+training_flag(a5)
		bne.s	.training

		move.l  #ch_music,a0
		add.l	a4,a0
		movem.l	d0-d7/a0-a6,-(sp)
		jsr	_RelocModule
		movem.l	(sp)+,d0-d7/a0-a6

		move.l	#ch_music,a0
		add.l	a4,a0
		movem.l	d0-d7/a0-a6,-(sp)
		jsr	_PlayModule
		movem.l	(sp)+,d0-d7/a0-a6
.training

;set up in-line pointers
		move.l	#ch_copperlist,a1
		add.l	a4,a1

		move.l	#ch_anti_scroll,d0
		add.l	a4,d0

		move.w	d0,chselect_loop1+10(a1)
		move.w	d0,chselect_loop2+10(a1)
		move.w	d0,chselect_loop1b+10(a1)
		move.w	d0,chselect_loop2b+10(a1)
		swap	d0
		move.w	d0,chselect_loop1+6(a1)
		move.w	d0,chselect_loop2+6(a1)
		move.w	d0,chselect_loop1b+6(a1)
		move.w	d0,chselect_loop2b+6(a1)

		move.l	#ch_copperlist+chselect_loop1,d0
		add.l	a4,d0

		move.w	d0,chselect_loop_point1+2(a1)
		swap	d0
		move.w	d0,chselect_loop_point1+6(a1)

		move.l	#ch_copperlist+chselect_loop2,d0
		add.l	a4,d0

		move.w	d0,chselect_loop_point2+2(a1)
		swap	d0
		move.w	d0,chselect_loop_point2+6(a1)

		move.l	#ch_copperlist+chselect_loop1b,d0
		add.l	a4,d0

		move.w	d0,chselect_loop_point1b+2(a1)
		swap	d0
		move.w	d0,chselect_loop_point1b+6(a1)

		move.l	#ch_copperlist+chselect_loop2b,d0
		add.l	a4,d0

		move.w	d0,chselect_loop_point2b+2(a1)
		swap	d0
		move.w	d0,chselect_loop_point2b+6(a1)

;set up dummy line for anti scroll
		move.l	#ch_anti_scroll,a1
		add.l	a4,a1

		moveq.l	#-1,d0
		moveq.l	#0,d1

	IFD	CD32
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
		move.l	d0,(a1)+
	ELSEIF
		move.w	d0,(a1)+
		move.w	d0,(a1)+
		move.w	d0,(a1)+
		move.w	d1,(a1)+
		move.w	d1,(a1)+
		move.w	d1,(a1)+
		move.w	d1,(a1)+
		move.w	d1,(a1)+
		move.w	d0,(a1)+
		move.w	d0,(a1)+
		move.w	d0,(a1)+
		move.w	d0,(a1)+
		move.w	d0,(a1)+
		move.w	d0,(a1)+
		move.w	d0,(a1)+
		move.w	d0,(a1)+
		move.w	d0,(a1)+
		move.w	d0,(a1)+
		move.w	d0,(a1)+
		move.w	d0,(a1)+
		move.w	d0,(a1)+
	ENDC

		rts

********************************************************************************
********************************************************************************
********************************************************************************

chselect_scan_quit
		move.b	chselect_ctrl,d0
		add.b	chselect_quit_game,d0
		cmpi.b	#2,d0
		bne.s	.end

.wait_up	move.b	chselect_ctrl,d0
		add.b	chselect_quit_game,d0
		cmpi.b	#2,d0
		beq.s	.wait_up

		move.w	#1,variables+restart_flag(a5)
.end		rts

********************************************************************************
********************************* Responsive keys ******************************
********************************************************************************
;Format : keydown, keycode, release
; Keydown is set while the key is pressed.
; Use keycode as specified in Hardware Reference Manual page 249.
; Set release for keyup messages to be interpreted.

chselect_key_list
chselect_key_down	dc.b	0
chselect_key_up		dc.b	0
chselect_ctrl		dc.b	0,$63,1		;ctrl
chselect_left		dc.b	0,$4f,1		;cursor left
chselect_right		dc.b	0,$4e,1		;cursor right
chselect_return		dc.b	0,$44,0		;return
chselect_del1		dc.b	0,$41,0		;backspace
chselect_del2		dc.b	0,$46,0		;delete
chselect_screen_grab	dc.b	0,$24,1		;g
chselect_quit_game	dc.b	0,$10,1		;q
			dc.b	0,$ff,0		;eod marker

                even

********************************************************************************
************************************* Palette **********************************
********************************************************************************

chselect_palette
		dc.w	$000,$101,$212,$323,$434,$545,$656,$767
		dc.w	$877,$988,$a99,$baa,$cbb,$dcc,$edd,$fee
		dc.w	$000,$000,$101,$111,$212,$222,$323,$333
		dc.w	$433,$444,$544,$555,$655,$666,$766,$777

chselect2_palette
		dc.w	$000,$fff,$ccd,$aac,$88a,$669,$447,$224
		dc.w	$000,$cdf,$79b,$236,$134,$023,$012,$011
		dc.w	$000,$000,$000,$000,$000,$000,$000,$000
		dc.w	$000,$000,$000,$000,$000,$000,$000,$000
