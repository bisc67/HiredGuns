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

CUP		equ	$4c
CDOWN		equ	$4d
CLEFT		equ	$4f
CRIGHT		equ	$4e
CRET		equ	$44

F1		equ	$50
F2		equ	$51
F3		equ	$52
F4		equ	$53
F5		equ	$54
F6		equ	$55
F7		equ	$56
F8		equ	$57
F9		equ	$58
F10		equ	$59
ESC		equ	$45

KBA		equ	$20
KBB		equ	$35
KBC		equ	$33
KBD		equ	$22
KBE		equ	$12
KBF		equ	$23
KBG		equ	$24
KBH		equ	$25
KBI		equ	$17
KBJ		equ	$26
KBK		equ	$27
KBL		equ	$28

********************************************************************************
;INPUT:		a1.l -> sprites in copperlist
;		a2.l -> sprites in copperlist (field 2)
;		a0.l -> table
;OUTPUT:        d0.w = selection

do_selections
		movem.l	d1-d4,-(sp)

		move.w	global_vars+default_cntrl(a5),d0
		btst.l	#ACTV_MOUSE1B,d0
		beq.s	.no_mouse1
		jsr	mouse0_hires_read
		moveq.l	#0,d0
		move.w	variables+mouse0_y(a5),d0
		sub.w	#mouse_hires_ymin,d0
		move.w	4(a0),d1
		divs.w	6(a0),d1
		muls	d1,d0
		divs	#mouse_hires_ymax-mouse_hires_ymin,d0
		cmp.w	d1,d0
		bne.s	.not_maxy
		subq.w	#1,d0
.not_maxy	mulu.w	6(a0),d0

		moveq.l	#0,d2
		move.w	variables+mouse0_x(a5),d2
		sub.w	#mouse_hires_xmin,d2
		move.w	6(a0),d1
		muls	d1,d2
		divs	#mouse_hires_xmax-mouse_hires_xmin,d2
		cmp.w	6(a0),d2
		bne.s	.not_maxx
		subq.w	#1,d2
.not_maxx	add.w	d2,d0

		move.w	d0,(a0)
		bsr	position_selection

		tst.w	variables+mouse0_old_left_bt(a5)
		bne.s	.not_mouse1_fire
		tst.w	variables+mouse0_left_bt(a5)
		beq.s	.not_mouse1_fire
		st.b	chselect_return
		bra	.ret
.not_mouse1_fire
		bra	.not_ret
.no_mouse1

		move.w	global_vars+default_cntrl(a5),d0
		btst.l	#ACTV_PAD1B,d0
		bne.s	.joy1
		btst.l	#ACTV_JOY1B,d0
		beq.s	.no_joy1
.joy1		move.b	variables+joystick1_temp(a5),d0
		move.b	variables+joystick1_old(a5),d1
		bsr	front_read_joy
.no_joy1




		move.w	(a0),d0				;selection
		move.w	4(a0),d1			;choices
		move.w	6(a0),d3			;vert mod

		cmpi.b	#CUP,front_key_down
		bne.s	.not_up
		clr.b	front_key_down
		cmp.w	d3,d0
		blt.s	.not_up
		sub.w	d3,d0
.not_up
		cmpi.b	#CDOWN,front_key_down
		bne.s	.not_down
		clr.b	front_key_down
		move.w	d0,d4
		add.w	d3,d4
		cmp.w	d1,d4
		bge.s	.not_down
		add.w	d3,d0
.not_down
		cmpi.b	#CLEFT,front_key_down
		bne.s	.not_left
		clr.b	front_key_down
		move.w	d0,d4
		subq.w	#1,d3
		and.w	d3,d4
		addq.w	#1,d3
		tst.w	d4
		beq.s	.not_left
		subq.w	#1,d0
.not_left
		cmpi.b	#CRIGHT,front_key_down
		bne.s	.not_right
		clr.b	front_key_down
		move.w	d0,d4
		addq.w	#1,d4
		subq.w	#1,d3
		and.w	d3,d4
		addq.w	#1,d3
		tst.w	d4
		beq.s	.not_right
		addq.w	#1,d0
.not_right
		move.w	d0,(a0)

		bsr	position_selection

		cmpi.b	#CRET,front_key_down
		bne.s	.not_ret
		clr.b	front_key_down
.ret		movem.l	(sp)+,d1-d4
		rts
.not_ret
		moveq.l	#-1,d0
		movem.l	(sp)+,d1-d4
		rts




front_read_joy
		btst.l	#left,d0
		beq.s	.not_left
		cmp.b	#CLEFT,last_reading
		beq	.end
		move.b	#CLEFT,front_key_down
		move.b	#CLEFT,last_reading
		rts
.not_left
		btst.l	#right,d0
		beq.s	.not_right
		cmp.b	#CRIGHT,last_reading
		beq.s	.end
		move.b	#CRIGHT,front_key_down
		move.b	#CRIGHT,last_reading
		rts
.not_right
		btst.l	#up,d0
		beq.s	.not_up
		cmp.b	#CUP,last_reading
		beq.s	.end
		move.b	#CUP,front_key_down
		move.b	#CUP,last_reading
		rts
.not_up
		btst.l	#down,d0
		beq.s	.not_down
		cmp.b	#CDOWN,last_reading
		beq.s	.end
		move.b	#CDOWN,front_key_down
		move.b	#CDOWN,last_reading
		rts
.not_down
		btst.l	#fire,d0
		beq.s	.not_fire
		cmp.b	#CRET,last_reading
		beq.s	.end
		move.b	#CRET,front_key_down
		move.b	#CRET,last_reading
		rts
.not_fire
		clr.b	last_reading
.end		rts

last_reading	dc.b	0
		even

********************************************************************************
;INPUT:		a1.l -> sprites in copperlist
;		a2.l -> sprites in copperlist (field 2)

cursor_off
		movem.l	d0/a0,-(sp)

		lea	.off_table,a0
		moveq.l	#0,d0
		bsr	position_selection

		movem.l	(sp)+,d0/a0
		rts

.off_table	dc.w	0
		dc.w	8
		dc.w	1
		dc.w    0
		dc.w	100,0

********************************************************************************
;INPUT:		a1.l -> sprites in copperlist
;		a2.l -> sprites in copperlist (field 2)
;		a0.l -> table
;		d0.w = selection

position_selection
		movem.l	d0-d2,-(sp)

		tst.w	d0
		bpl.s	.new_selection
		move.w	(a0),d0
.new_selection

		move.w	8(a0,d0.w*4),d1
		move.w	10(a0,d0.w*4),d2
		move.w	2(a0),d0

		bsr	position_cursor
		movem.l	(sp)+,d0-d2
		rts

********************************************************************************
;INPUT:		a1.l -> sprites in copperlist
;		a2.l -> sprites in copperlist (field 2)
;		d0.w = width (2-8)
;		d1.w = x
;		d2.w = y

position_cursor
		move.l	a1,-(sp)

		bsr	.position
		cmpa.l	#0,a2
		beq.s	.end_position
		move.l	a2,a1
		bsr	.position
.end_position
		move.l	(sp)+,a1
		rts

.position	movem.l	d0-d2/a3-a4,-(sp)

		move.l	#lace_cursor,a3
		add.l	chip_mem_base,a3

		subi.w	#1,d0

		lea	0*192(a3),a4
		HDW_SPRITE #0,a4,d1,d2,#22,a1

		add.w	#32,d1
		subi.w	#1,d0
		bne.s	.not_2_wide
		lea	7*192(a3),a4
		HDW_SPRITE #1,a4,d1,d2,#22,a1
		bra	.hide_2
.not_2_wide	lea	1*192(a3),a4
		HDW_SPRITE #1,a4,d1,d2,#22,a1

		add.w	#32,d1
		subi.w	#1,d0
		bne.s	.not_3_wide
		lea	7*192(a3),a4
		HDW_SPRITE #2,a4,d1,d2,#22,a1
		bra	.hide_3
.not_3_wide	lea	2*192(a3),a4
		HDW_SPRITE #2,a4,d1,d2,#22,a1

		add.w	#32,d1
		subi.w	#1,d0
		bne.s	.not_4_wide
		lea	7*192(a3),a4
		HDW_SPRITE #3,a4,d1,d2,#22,a1
		bra	.hide_4
.not_4_wide	lea	3*192(a3),a4
		HDW_SPRITE #3,a4,d1,d2,#22,a1

		add.w	#32,d1
		subi.w	#1,d0
		bne.s	.not_5_wide
		lea	7*192(a3),a4
		HDW_SPRITE #4,a4,d1,d2,#22,a1
		bra	.hide_5
.not_5_wide	lea	4*192(a3),a4
		HDW_SPRITE #4,a4,d1,d2,#22,a1

		add.w	#32,d1
		subi.w	#1,d0
		bne.s	.not_6_wide
		lea	7*192(a3),a4
		HDW_SPRITE #5,a4,d1,d2,#22,a1
		bra	.hide_6
.not_6_wide	lea	5*192(a3),a4
		HDW_SPRITE #5,a4,d1,d2,#22,a1

		add.w	#32,d1
		subi.w	#1,d0
		bne.s	.not_7_wide
		lea	7*192(a3),a4
		HDW_SPRITE #6,a4,d1,d2,#22,a1
		bra	.end
.not_7_wide	lea	6*192(a3),a4
		HDW_SPRITE #6,a4,d1,d2,#22,a1

		add.w	#32,d1
		lea	7*192(a3),a4
		HDW_SPRITE #7,a4,d1,d2,#22,a1

		bra	.end

.hide_2		move.w	#0,d2
		lea	2*192(a3),a4
		HDW_SPRITE #2,a4,d1,d2,#22,a1
		add.w	#32,d1

.hide_3		move.w	#0,d2
		lea	3*192(a3),a4
		HDW_SPRITE #3,a4,d1,d2,#22,a1
		add.w	#32,d1

.hide_4		move.w	#0,d2
		lea	4*192(a3),a4
		HDW_SPRITE #4,a4,d1,d2,#22,a1
		add.w	#32,d1

.hide_5		move.w	#0,d2
		lea	5*192(a3),a4
		HDW_SPRITE #5,a4,d1,d2,#22,a1
		add.w	#32,d1

.hide_6		move.w	#0,d2
		lea	6*192(a3),a4
		HDW_SPRITE #6,a4,d1,d2,#22,a1
		add.w	#32,d1
.end
		movem.l	(sp)+,d0-d2/a3-a4
		rts

********************************************************************************

do_front
		move.w	#MODE_FRONT,variables+mode(a5)

	IFD	demo
		clr.w	variables+restart_flag(a5)

	  IFND	editor

		move.b	#1,global_vars+num_players(a5)

		tst.w	global_vars+action_flag(a5)
		beq.s	.campaign_game

		move.b	#2,global_vars+num_players(a5)

          ELSEIF

		move.b	#1,global_vars+num_players(a5)

		cmpi.w	#2,number_players
		bne.s	.not_2pl
		move.b	#2,global_vars+num_players(a5)
.not_2pl
		cmpi.w	#3,number_players
		bne.s	.not_3pl
		move.b	#3,global_vars+num_players(a5)
		move.b	#CNTRL_MOUSE1,global_vars+pl1_control(a5)
		move.b	#CNTRL_MOUSE2,global_vars+pl2_control(a5)
		move.b	#CNTRL_KEYS1,global_vars+pl3_control(a5)
		move.b	#0,global_vars+pl4_control(a5)
		move.w	#ACTV_MOUSE1M!ACTV_MOUSE2M!ACTV_KEYS1M,global_vars+active_controls(a5)
.not_3pl
		cmpi.w	#4,number_players
		bne.s	.not_4pl
		move.b	#4,global_vars+num_players(a5)
		move.b	#CNTRL_MOUSE1,global_vars+pl1_control(a5)
		move.b	#CNTRL_MOUSE2,global_vars+pl2_control(a5)
		move.b	#CNTRL_KEYS1,global_vars+pl3_control(a5)
		move.b	#CNTRL_JOY3,global_vars+pl4_control(a5)
		move.w	#ACTV_MOUSE1M!ACTV_MOUSE2M!ACTV_KEYS2M!ACTV_JOY3M,global_vars+active_controls(a5)
.not_4pl
	  ENDC
.campaign_game
		move.b	global_vars+num_players(a5),d0

                cmpi.b	#1,d0
		bne.s	.not1
		move.w	#4,variables+players_alive(a5)
		move.b	#CNTRL_MOUSE1,variables+player1+control_method(a5)
		move.b	#CNTRL_MOUSE1,variables+player2+control_method(a5)
		move.b	#CNTRL_MOUSE1,variables+player3+control_method(a5)
		move.b	#CNTRL_MOUSE1,variables+player4+control_method(a5)
		move.w	#ACTV_MOUSE1M,global_vars+active_controls(a5)
.not1
                cmpi.b	#2,d0
		bne.s	.not2
		move.w	#4,variables+players_alive(a5)
		move.b	#CNTRL_MOUSE1,variables+player1+control_method(a5)
		move.b	#CNTRL_MOUSE2,variables+player2+control_method(a5)
		move.b	#CNTRL_MOUSE1,variables+player3+control_method(a5)
		move.b	#CNTRL_MOUSE2,variables+player4+control_method(a5)
		move.w	#ACTV_MOUSE1M!ACTV_MOUSE2M,global_vars+active_controls(a5)
.not2
		cmpi.b	#3,d0
		bne.s	.not3
		move.w	#3,variables+players_alive(a5)
		move.b	global_vars+pl1_control(a5),variables+player1+control_method(a5)
		move.b	global_vars+pl2_control(a5),variables+player2+control_method(a5)
		move.b	global_vars+pl3_control(a5),variables+player3+control_method(a5)
		move.b	#0,variables+player4+control_method(a5)
.not3
		cmpi.b	#4,d0
		bne.s	.not4
		move.w	#4,variables+players_alive(a5)
		move.b	global_vars+pl1_control(a5),variables+player1+control_method(a5)
		move.b	global_vars+pl2_control(a5),variables+player2+control_method(a5)
		move.b	global_vars+pl3_control(a5),variables+player3+control_method(a5)
		move.b	global_vars+pl4_control(a5),variables+player4+control_method(a5)
.not4
		rts

	ELSEIF

		tst.w	variables+restart_flag(a5)
		beq.s	.skip_anim

		jsr	kill_screen

		move.l  #lace_anim_buffer,a0
		add.l	a4,a0
		move.l	#front_anim_in,a1
		add.l	a5,a1
		jsr	play_anim

		move.l	#lc_mesg_buffer,a0
		add.l	a4,a0
		jsr	set_up_message_screen

		move.w	#0,variables+file_mode(a5)
.skip_anim
		bsr	load_and_decrunch_menu_data

		tst.w	variables+restart_flag(a5)
		beq.s	.skip_anim2

		jsr	unshow_message
		move.l  #lace_anim_buffer,a0
		add.l	a4,a0
		move.l	#front_anim_out,a1
		add.l	a5,a1
		jsr	play_anim
.skip_anim2
	IFND	CD32
		tst.w	variables+restart_flag(a5)
		bne.s	.skip_wait
		cmpi.w	#2,global_vars+attract_mode(a5)
		beq.s	.skip_wait
		tst.l	os_kill
		bne.s	.skip_wait
		jsr	temp_restore_system
		jsr	wait_for_input
		jsr	temp_take_system
.skip_wait
	ENDC
		clr.w	variables+restart_flag(a5)

		move.l  #lace_music,a0
		add.l	a4,a0
		movem.l	d0-d7/a0-a6,-(sp)
		jsr	_RelocModule
		movem.l	(sp)+,d0-d7/a0-a6

		move.l	#lace_music,a0
		add.l	a4,a0
		movem.l	d0-d7/a0-a6,-(sp)
		jsr	_PlayModule
		movem.l	(sp)+,d0-d7/a0-a6

		bsr	menus

		move.l	#lace_copperlist,a0
		add.l	a4,a0
		move.l	#lace_copperlist+lace_clist_start2,a2
		add.l	a4,a2
		move.l	#front_player_dat,a3		;workspace
		add.l	a5,a3
		jsr	fade_copper_to_black_interlace

		movem.l	d0-d7/a0-a6,-(sp)
		jsr	_StopPlayer
		movem.l	(sp)+,d0-d7/a0-a6

		jsr	killaud
		rts

********************************************************************************
********************************************************************************
********************************************************************************

display_credits	lea	front_font_s,a2
		adda.l	a5,a2
		BLIT_TEXT (a0),a2,#0,#0,#%11111
		tst.l	d0
		bne	.main_menu

		tst.l	d1
		beq.s	.skip_long
		bsr	timed_wait_long
		bra.s	.skip_short
.skip_long	bsr	timed_wait
.skip_short

		bsr	front_grab
		tst.w	d0
		bmi	.main_menu

		clr.w	joystick1
		clr.w	joystick2
		clr.w	joystick3
		clr.w	joystick4
		sf.b    front_key_down

		bsr	scan_rock
		rts

.main_menu	add.l	#4,sp
		bra	main_menu



DISPLAY_CREDITS	macro
		lea	credit\1_text,a0
		moveq.l	#\2,d1
		bsr	display_credits
		endm



	IFD	se
show_se		move.l	#front_se_logo,a0
		add.l	a5,a0

		move.w	#0,d5
		move.w	#167,d7
		move.w	#%1111,d6

		jsr	cpu_bob		;draw block now

		bsr	timed_wait_long

		bsr	front_grab
		tst.w	d0
		bmi	.main_menu

		clr.w	joystick1
		clr.w	joystick2
		clr.w	joystick3
		clr.w	joystick4
		sf.b    front_key_down

		bsr	scan_rock
		rts

.main_menu	add.l	#4,sp
		bra	main_menu

SHOW_SE		macro
		bsr	show_se
		endm

	ENDC

********************************************************************************
;INPUT:		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	d0,a1-a2
copy_rock_title
		WAIT_VBLANK
		WAIT_LINE #100
	IFD	CD32
		BOB_WINDOW #0,#10,#lace_plane_width,#105
	ELSEIF
		BOB_WINDOW #0,#40,#lace_plane_width,#115
	ENDC
		bsr	copy_rock
		BOB_WINDOW #0,#0,#lace_plane_width,#lace_plane_height-1
		rts

********************************************************************************
;INPUT:		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	d0,a1-a2
copy_rock
		movem.l	d0/d7/a0-a1,-(sp)

	IFD	CD32
		add.l	#(lace_plane_width/8)*25,plane_address

		move.l	#ex_effects,a1
		add.l	exchip_mem_base,a1
		BLIT_BOB a1,#0,#0,#%11111

		sub.l	#(lace_plane_width/8)*25,plane_address
	ELSEIF
		move.l	#lace_fill,a1
		add.l	a4,a1
		moveq.l	#10-1,d0
		moveq.l	#0,d7
.loop
		BLIT_BOB a1,#0,d7,#%11111
		addi.w	#42,d7
		dbf	d0,.loop
	ENDC

		movem.l	(sp)+,d0/d7/a0-a1

		rts

********************************************************************************
;INPUT:		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	d0,a1-a2

	IFD	CD32
SCAN_SIZE	equ	72
SCAN_START	equ     58
	ELSEIF
SCAN_SIZE	equ	36
SCAN_START	equ     70
	ENDC

MOVE_SCAN	macro
	IFD	CD32
		cmp.b	#244,SCAN_SIZE*\1(a0)
		bcc.s	.ok\@
		add.b	d7,SCAN_SIZE*\1(a0)
		add.b	d7,SCAN_SIZE*\1(a1)
	ELSEIF
		cmp.b	#252,SCAN_SIZE*\1(a0)
		bcc.s	.ok\@
		add.b	#2,SCAN_SIZE*\1(a0)
		add.b	#2,SCAN_SIZE*\1(a1)
	ENDC
.ok\@
		endm

MOVE_SCAN_FIRST	macro
	IFD	CD32
		cmp.b	#244,SCAN_SIZE*\1(a0)
		bcc	.end
		add.b	d7,SCAN_SIZE*\1(a0)
		add.b	d7,SCAN_SIZE*\1(a1)
	ELSEIF
		cmp.b	#252,SCAN_SIZE*\1(a0)
		bcc.s	.ok\@
		add.b	#2,SCAN_SIZE*\1(a0)
		add.b	#2,SCAN_SIZE*\1(a1)
	ENDC
		endm

scan_rock
		move.l	#lace_copperlist,a0
		add.l	chip_mem_base,a0
		lea	lace_sprites1(a0),a1
		lea	lace_sprites2(a0),a2
		jsr	cursor_off

	IFD	CD32
		move.w	#17,d7
	ENDC

		move.l	#lace_copperlist+lace_scanA1,a0
		add.l	a4,a0
		move.l	#lace_copperlist+lace_scanA2,a1
		add.l	a4,a1

	IFD	CD32
		move.l	#105,d4
	ELSEIF
		move.l	#130,d4
	ENDC
	IFND	CD32
		moveq.l	#0,d1
		move.l	#130,d5
		add.w	#4,d5
	ENDC

		move.b	#SCAN_START+5,SCAN_SIZE*0(a0)
		move.b	#SCAN_START+9,SCAN_SIZE*1(a0)
		move.b	#SCAN_START+13,SCAN_SIZE*2(a0)
		move.b	#SCAN_START+16,SCAN_SIZE*3(a0)
		move.b	#SCAN_START+19,SCAN_SIZE*4(a0)
		move.b	#SCAN_START+22,SCAN_SIZE*5(a0)
		move.b	#SCAN_START+24,SCAN_SIZE*6(a0)
		move.b	#SCAN_START+26,SCAN_SIZE*7(a0)
		move.b	#SCAN_START+28,SCAN_SIZE*8(a0)
		move.b	#SCAN_START+30,SCAN_SIZE*9(a0)
		move.b	#SCAN_START+31,SCAN_SIZE*10(a0)
		move.b	#SCAN_START+32,SCAN_SIZE*11(a0)
		move.b	#SCAN_START+33,SCAN_SIZE*12(a0)
		move.b	#SCAN_START+34,SCAN_SIZE*13(a0)
		move.b	#SCAN_START+35,SCAN_SIZE*14(a0)
		move.b	#SCAN_START+36,SCAN_SIZE*15(a0)

		move.b	#SCAN_START+5,SCAN_SIZE*0(a1)
		move.b	#SCAN_START+9,SCAN_SIZE*1(a1)
		move.b	#SCAN_START+13,SCAN_SIZE*2(a1)
		move.b	#SCAN_START+16,SCAN_SIZE*3(a1)
		move.b	#SCAN_START+19,SCAN_SIZE*4(a1)
		move.b	#SCAN_START+22,SCAN_SIZE*5(a1)
		move.b	#SCAN_START+24,SCAN_SIZE*6(a1)
		move.b	#SCAN_START+26,SCAN_SIZE*7(a1)
		move.b	#SCAN_START+28,SCAN_SIZE*8(a1)
		move.b	#SCAN_START+30,SCAN_SIZE*9(a1)
		move.b	#SCAN_START+31,SCAN_SIZE*10(a1)
		move.b	#SCAN_START+32,SCAN_SIZE*11(a1)
		move.b	#SCAN_START+33,SCAN_SIZE*12(a1)
		move.b	#SCAN_START+34,SCAN_SIZE*13(a1)
		move.b	#SCAN_START+35,SCAN_SIZE*14(a1)
		move.b	#SCAN_START+36,SCAN_SIZE*15(a1)

.loop
		WAIT_VBLANK

		MOVE_SCAN_FIRST 0
		MOVE_SCAN 1
		MOVE_SCAN 2
		MOVE_SCAN 3
		MOVE_SCAN 4
		MOVE_SCAN 5
		MOVE_SCAN 6
		MOVE_SCAN 7
		MOVE_SCAN 8
		MOVE_SCAN 9
		MOVE_SCAN 10
		MOVE_SCAN 11
		MOVE_SCAN 12
		MOVE_SCAN 13
		MOVE_SCAN 14
		MOVE_SCAN 15

	IFD	CD32
		move.w	d4,d5
		add.w	d7,d5
		add.w	d7,d5
		cmpi.w	#lace_plane_height-10,d5
		blt.s	.bot_ok
		move.w	#lace_plane_height-10,d5
.bot_ok
		cmp.w	d4,d5
		blt.s	.skip_win
		movem.w	d4/d7,-(sp)
		BOB_WINDOW #0,d4,#lace_plane_width,d5
		bsr	copy_rock
		movem.w	(sp)+,d4/d7
.skip_win
		add.w	d7,d4
		add.w	d7,d4
	ELSEIF
		cmpi.w	#lace_plane_height-7,d5
		bge.s	.no_bob

		BOB_WINDOW #0,d4,#lace_plane_width,d5
		bsr	copy_rock
		add.w	#4,d4
		add.w	#4,d5
.no_bob
	ENDC

	IFD	CD32
		sub.w	#1,d7
		cmpi.w	#2,d7
		bgt.s	.not_zero
		moveq.l	#2,d7
.not_zero
		bra	.loop
	ELSEIF
		add.w	#2,d1

		cmp.w	#180,d1
		blt	.loop
	ENDC
.end
		BOB_WINDOW #0,#0,#lace_plane_width,#lace_plane_height-1

		rts

********************************************************************************
********************************************************************************
********************************************************************************
menus
		jsr	kill_screen

		move.l	#lace_screen_buffer1,a0
		add.l	a4,a0
		move.l	a0,viewing_buffer
	IFD	CD32
		sub.l	#(lace_plane_width/8)*25,a0
	ENDC
		move.l	a0,drawing_buffer

		BOB_INFO drawing_buffer,#lace_plane_width/8,#lace_plane_height,#lace_num_planes,#0,#0,#lace_plane_width,#lace_plane_height-1,#0

		bsr	copy_rock

		move.w	#%11111,d6		;no save & replace
		move.l	#lace_fontb,a2
		add.l	a4,a2
		BLIT_TEXT credit_title,a2,#0,#0

	IFD	CD32
		move.l	#front_font_s_small,a2
		add.l	a5,a2
		BLIT_TEXT start1b_title,a2,#0,#0
	ENDC

		jsr	set_up_front_screen

	IFD	se
		st.b	variables+abort_drawtext(a5)
		jsr	wait_for_no_input
		clr.w	last_key

		SHOW_SE
	ELSEIF
		st.b	variables+abort_drawtext(a5)
		jsr	wait_for_no_input
		clr.w	last_key

		tst.b	global_vars+first_time_at_front(a5)
		bne	main_menu_no_scan

		lea	front_font_s,a2
		adda.l	a5,a2
		BLIT_TEXT credit1_text,a2,#0,#0,#%11111

		st.b	global_vars+first_time_at_front(a5)
;		move.w	#MODE_NOPOTGO,variables+mode(a5)

_LVOSetJoyPortAttrsA	equ	-132
		movem.l	d0-d1/a0-a1/a6,-(sp)
		move.l	vars_block,a6
		move.l	lowlevel_base(a6),a6
		move.l	#0,d0
		lea	setjoyattrs_tags,a1
		jsr	_LVOSetJoyPortAttrsA(a6)
		move.l	#1,d0
		lea	setjoyattrs_tags,a1
		jsr	_LVOSetJoyPortAttrsA(a6)
		movem.l	(sp)+,d0-d1/a0-a1/a6

;		bsr	timed_wait2
		bsr	timed_wait

;_LVOReadJoyPort	equ	-30
;		movem.l	d0-d1/a0-a1/a6,-(sp)
;		move.l	vars_block,a6
;		move.l	lowlevel_base(a6),a6
;		move.l	#0,d0
;		jsr	_LVOReadJoyPort(a6)

;		move.w	#ACTV_PAD1M,global_vars+default_cntrl(a5)
;		and.l	#JP_TYPE_MASK,d0
;		cmp.l	#JP_TYPE_NOTAVAIL,d0
;		beq.s	.mouse
;		cmp.l	#JP_TYPE_MOUSE,d0
;		bne.s	.not_mouse
;.mouse		move.w	#ACTV_MOUSE1M,global_vars+default_cntrl(a5)
;.not_mouse
;		move.w	global_vars+default_cntrl(a5),global_vars+active_controls(a5)
;
;		movem.l	(sp)+,d0-d1/a0-a1/a6
;
;		move.w	#MODE_FRONT,variables+mode(a5)
.skip_first_time
		tst.w	d0
		bmi     main_menu

		bsr	scan_rock
	ENDC

credit2
	IFD	se
		DISPLAY_CREDITS 1,0
	ENDC
	IFND	CD32
		DISPLAY_CREDITS 1a,1
	ENDC
		DISPLAY_CREDITS 2,1
		DISPLAY_CREDITS 3,0
		DISPLAY_CREDITS 4,0
		DISPLAY_CREDITS 17,0
		DISPLAY_CREDITS 18,0
		DISPLAY_CREDITS 5,0
		DISPLAY_CREDITS 8,0
		DISPLAY_CREDITS 9,0
	IFND	CD32
		DISPLAY_CREDITS 14,0
		DISPLAY_CREDITS 15,0
		DISPLAY_CREDITS 16,0
	ENDC
		DISPLAY_CREDITS 6,0
	IFND	CD32
		DISPLAY_CREDITS 7,0
		DISPLAY_CREDITS 13,0
		DISPLAY_CREDITS 11,1
		DISPLAY_CREDITS 12,1
	ENDC                  
	IFD	se
		SHOW_SE
	ELSEIF
		DISPLAY_CREDITS 1,0
	ENDC

		jmp	credit2

setjoyattrs_tags
;		dc.l	SJA_Type,SJA_TYPE_AUTOSENSE
		dc.l	SJA_Type,SJA_TYPE_GAMECTLR
		dc.l	TAG_END

********************************************************************************

ALL		equ	0
NOT_TITLE	equ     1

DISPLAY_SCREEN	macro
		sf.b    front_key_down

		IFNE	\3
		bsr	scan_rock
		WAIT_BLIT
		ELSEIF
		bsr	scan_rock
		bsr	copy_rock_title
                WAIT_VBLANK
		WAIT_LINE #100
		move.w	#%11111,d6		;no save & replace
		move.l	#lace_fontb,a2
		add.l	a4,a2
		BLIT_TEXT \1_title,a2,#0,#0
		ENDC

		lea	front_font_s,a2
		adda.l	a5,a2
		BLIT_TEXT \2_text,a2,#0,#0,#%11111

		endm

********************************************************************************
********************************************************************************
********************************************************************************

main_menu_no_scan
		clr.w	variables+abort_drawtext(a5)
		bra.s	skip_scan
main_menu
		clr.w	variables+abort_drawtext(a5)
		bsr     copy_rock_title
		bsr	scan_rock

		sf.b    front_key_down
		WAIT_BLIT
		WAIT_VBLANK
		move.w	#%11111,d6		;no save & replace
		move.l	#lace_fontb,a2
		add.l	a4,a2
		BLIT_TEXT main_menu_title,a2,#0,#0
	IFD	CD32
		move.l	#front_font_s_small,a2
		add.l	a5,a2
		BLIT_TEXT start1b_title,a2,#0,#0
	ENDC
skip_scan

		lea	front_font_s,a2
		adda.l	a5,a2
		tst.b	noexit
		beq.s	.not_noexit
		BLIT_TEXT main_menu_text_noexit,a2,#0,#0,#%1111
		bra.s	.skip_not_noexit
.not_noexit
		BLIT_TEXT main_menu_text,a2,#0,#0,#%1111
.skip_not_noexit

		tst.l	os_kill
		beq.s	.os_not_dead
		lea	main_menu_exit,a0
		tst.b	lang
		bne.s	.for
		lea	main_menu_exit2,a0
.for
		BLIT_TEXT (a0),a2,#0,#0,#%1111
.os_not_dead
		sf.b    front_key_down

		tst.l	os_kill
		bne.s	.skip_wait1
		jsr	temp_restore_system
.skip_wait1

.loop
		bsr	front_grab

		movem.l	a0-a2/d1-d7,-(sp)
		move.l	#lace_copperlist,a0
		add.l	chip_mem_base,a0
		lea	lace_sprites1(a0),a1
		lea	lace_sprites2(a0),a2
		tst.b	noexit
		beq.s	.not_no_exit
		lea	main_menu_table_no_exit,a0
		bra.s	.skip_not_no_exit
.not_no_exit	lea	main_menu_table,a0
.skip_not_no_exit
		bsr	do_selections
		movem.l	(sp)+,a0-a2/d1-d7

		cmpi.w	#0,d0
		beq.s	training
		cmpi.w	#1,d0
		beq.s	campaign
		cmpi.w	#2,d0
		beq.s	action
		cmpi.w	#3,d0
		beq	continue_old_game
		cmpi.w	#4,d0
		bne.s	.not_exit
		move.w	#2,variables+restart_flag(a5)
		jsr	temp_take_system
		rts
.not_exit
		bra.s	.loop

********************************************************************************
********************************************************************************
********************************************************************************

	IFND	CD32
game_type
		tst.l	os_kill
		bne.s	.skip_wait2
		jsr	temp_take_system
.skip_wait2
		bsr     copy_rock_title
	IFD	CD32
		DISPLAY_SCREEN start1,start1,NOT_TITLE
	ELSEIF
		DISPLAY_SCREEN start1,start1,ALL
	ENDC

		sf.b    front_key_down

		tst.l	os_kill
		bne.s	.skip_wait1
		jsr	temp_restore_system
.skip_wait1

.loop
		bsr	front_grab
		cmpi.b	#F1,front_key_down
		beq.s	training
		cmpi.b	#F2,front_key_down
		beq.s	campaign
		cmpi.b	#F3,front_key_down
		beq.s	action

		tst.b	front_ctrl
		beq	.loop
		tst.b	front_quit_game
		beq.s	.loop
		sf.b	front_ctrl
		sf.b	front_quit_game
		tst.l	os_kill
		bne.s	.skip_wait3
		jsr	temp_take_system
.skip_wait3
		bra	main_menu

	ENDC

training	move.w	#1,global_vars+action_flag(a5)
		move.w	#1,global_vars+training_flag(a5)
		bra.s	select_players

campaign	clr.w	global_vars+action_flag(a5)
		clr.w	global_vars+training_flag(a5)
		bra.s	select_players

action		move.w	#1,global_vars+action_flag(a5)
		clr.w	global_vars+training_flag(a5)
		bra.s	select_players

********************************************************************************
********************************************************************************
********************************************************************************
select_players
		tst.w	global_vars+training_flag(a5)
		bne	.1player

		tst.l	os_kill
		bne.s	.skip_wait2
		jsr	temp_take_system
.skip_wait2
		cmp.w	#2,global_vars+max_num_players(a5)
		bne.s	.not_2_players
		DISPLAY_SCREEN start2b,start2b,NOT_TITLE
		bra.s	.skip_not_2_players
.not_2_players
		DISPLAY_SCREEN start2,start2,NOT_TITLE
.skip_not_2_players

		sf.b    front_key_down

		tst.l	os_kill
		bne.s	.skip_wait1
		jsr	temp_restore_system
.skip_wait1

.loop
		bsr	front_grab

		movem.l	a0-a2/d1-d7,-(sp)
		move.l	#lace_copperlist,a0
		add.l	chip_mem_base,a0
		lea	lace_sprites1(a0),a1
		lea	lace_sprites2(a0),a2
		cmp.w	#2,global_vars+max_num_players(a5)
		bne.s	.not_2_playersb
		lea	select_players_2pl_table,a0
		bra.s	.skip_not_2_playersb
.not_2_playersb	lea	select_players_table,a0
.skip_not_2_playersb
		bsr	do_selections
		movem.l	(sp)+,a0-a2/d1-d7

		cmpi.w	#0,d0
		beq.s	.1player
		cmpi.w	#1,d0
		beq.s	.2player
		cmpi.w	#2,d0
		beq.s	.3player
		cmpi.w	#3,d0
		beq.s	.4player

		bra.s	.loop

.1player	move.b	#1,global_vars+num_players(a5)
		bra	select_controls
.2player	move.b	#2,global_vars+num_players(a5)
		bra	select_controls
.3player	move.b	#3,global_vars+num_players(a5)
		bra	select_controls
.4player	move.b	#4,global_vars+num_players(a5)
		bra	select_controls

choose_chars
		tst.l	os_kill
		bne.s	.skip_wait4
		jsr	temp_take_system
.skip_wait4
		tst.w	global_vars+training_flag(a5)
		bne	choose_training_map
		tst.w	global_vars+action_flag(a5)
		bne	play_action_map_pl1

		rts

********************************************************************************
********************************************************************************
********************************************************************************

DISPLAY_CONTROL_FORCE	macro
		move.w	#\1-1,d0
		lea	global_vars+control\1(a5),a0
		lea	control\1_n,a1
		lea	control\1_y,a2
		jsr	display_control_quick_force
		endm

DISPLAY_CONTROL	macro
		move.w	#\1-1,d0
		lea	global_vars+control\1(a5),a0
		lea	control\1_n,a1
		lea	control\1_y,a2
		jsr	display_control_quick
		endm

display_control_quick
		lea	front_font_s,a3
		adda.l	a5,a3
		move.w  global_vars+enabled_controls(a5),d1
		btst.l	d0,d1
		beq.s	.disabled
		tst.b	(a0)
		beq.s	.not_chosen
.disabled	BLIT_TEXT (a1),a3,#0,#0,#%11111
		bra.s	.skip
.not_chosen	BLIT_TEXT (a2),a3,#0,#0,#%11111
.skip
		rts

display_control_quick_force
		lea	front_font_s,a3
		adda.l	a5,a3
		move.w  global_vars+enabled_controls(a5),d1
		btst.l	d0,d1
		beq.s	.disabled
		tst.b	(a0)
		beq.s	.not_chosen
.disabled	st.b	(a0)
		BLIT_TEXT (a2),a3,#0,#0,#%11111
		BLIT_TEXT (a1),a3,#0,#0,#%11111
		bra.s	.skip
.not_chosen	BLIT_TEXT (a2),a3,#0,#0,#%11111
.skip
		rts

********************************************************************************
select_controls
		tst.l	os_kill
		bne.s	.skip_wait2
		jsr	temp_take_system
.skip_wait2
		lea	global_vars+control1(a5),a1
		clr.l	(a1)+
		clr.l	(a1)+
		clr.l	(a1)+
		clr.b	(a1)+
                move.b	#1,global_vars+curr_player(a5)
                clr.w	global_vars+new_active_controls(a5)
		clr.w	global_vars+new_default_cntrl(a5)

		cmp.b	#1,global_vars+num_players(a5)
		bgt.s	.more_1_player
		st.b	global_vars+control1(a5)
		st.b	global_vars+control2(a5)
		st.b	global_vars+control3(a5)
		st.b	global_vars+control4(a5)
		st.b	global_vars+control6(a5)
		st.b	global_vars+control7(a5)
		st.b	global_vars+control8(a5)
		st.b	global_vars+control9(a5)
		st.b	global_vars+control10(a5)
		st.b	global_vars+control13(a5)
.more_1_player
		cmp.b	#2,global_vars+num_players(a5)
		bgt.s	.more_2_players
		st.b	global_vars+control1(a5)
		st.b	global_vars+control2(a5)
		st.b	global_vars+control3(a5)
		st.b	global_vars+control4(a5)
		st.b	global_vars+control7(a5)
		st.b	global_vars+control8(a5)
		st.b	global_vars+control9(a5)
		st.b	global_vars+control10(a5)
.more_2_players
		cmp.b	#3,global_vars+num_players(a5)
		bgt.s	.more_3_players
		st.b	global_vars+control4(a5)
.more_3_players

		bsr     copy_rock_title
		DISPLAY_SCREEN start31,start3,ALL
		DISPLAY_CONTROL_FORCE 1
		DISPLAY_CONTROL_FORCE 2
		DISPLAY_CONTROL_FORCE 3
		DISPLAY_CONTROL_FORCE 4
		DISPLAY_CONTROL_FORCE 5
		DISPLAY_CONTROL_FORCE 6
		DISPLAY_CONTROL_FORCE 12
		DISPLAY_CONTROL_FORCE 13
		DISPLAY_CONTROL_FORCE 7
		DISPLAY_CONTROL_FORCE 8
		DISPLAY_CONTROL_FORCE 9
		DISPLAY_CONTROL_FORCE 10

		lea	global_vars+pl1_control(a5),a1
		move.l	a1,global_vars+curr_player_ctl(a5)

		bra   first_control

next_control	move.b  global_vars+num_players(a5),d0
		cmp.b	global_vars+curr_player(a5),d0
		blt     end_select_controls

		bsr	copy_rock_title
		move.w	#%11111,d6		;no save & replace
		move.l	#lace_fontb,a2
		add.l	a4,a2

		cmpi.b	#1,global_vars+curr_player(a5)
		bne.s	.not_player1
		BLIT_TEXT start31_title,a2,#0,#0
.not_player1
		cmpi.b	#2,global_vars+curr_player(a5)
		bne.s	.not_player2
		BLIT_TEXT start32_title,a2,#0,#0
.not_player2
		cmpi.b	#3,global_vars+curr_player(a5)
		bne.s	.not_player3
		BLIT_TEXT start33_title,a2,#0,#0
.not_player3
		cmpi.b	#4,global_vars+curr_player(a5)
		bne.s	.not_player4
		BLIT_TEXT start34_title,a2,#0,#0
.not_player4

first_control	add.b	#1,global_vars+curr_player(a5)

********************************************************************************

		sf.b    front_key_down

		tst.l	os_kill
		bne.s	.skip_wait1
		jsr	temp_restore_system
.skip_wait1

.loop
		movem.l	a0-a2/d1-d7,-(sp)
		move.l	#lace_copperlist,a0
		add.l	chip_mem_base,a0
		lea	lace_sprites1(a0),a1
		lea	lace_sprites2(a0),a2
		lea	controls_table,a0
		bsr	do_selections
		movem.l	(sp)+,a0-a2/d1-d7

		cmpi.b	#0,d0
		beq	.choose1
		cmpi.b	#2,d0
		beq	.choose2
		cmpi.b	#4,d0
		beq	.choose3
		cmpi.b	#6,d0
		beq	.choose4
		cmpi.b	#8,d0
		beq	.choose5
		cmpi.b	#10,d0
		beq	.choose6
		cmpi.b	#1,d0
		beq	.choose12
		cmpi.b	#3,d0
		beq	.choose13
		cmpi.b	#5,d0
		beq	.choose7
		cmpi.b	#7,d0
		beq	.choose8
		cmpi.b	#9,d0
		beq	.choose9
		cmpi.b	#11,d0
		beq	.choose10

.already_chosen	bra	.loop

********************************************************************************
.choose1	tst.b	global_vars+control1(a5)
		bne	.already_chosen
		tst.l	os_kill
		bne.s	.skip_wait3
		jsr	temp_take_system
.skip_wait3	st.b	global_vars+control1(a5)
		st.b	global_vars+control5(a5)
		st.b	global_vars+control12(a5)
		DISPLAY_CONTROL 1
		DISPLAY_CONTROL 5
		DISPLAY_CONTROL 12
		move.l	global_vars+curr_player_ctl(a5),a1
		move.b	#1,(a1)
		add.w	#1,a1
		move.l	a1,global_vars+curr_player_ctl(a5)
		ori.w	#1<<0,global_vars+new_active_controls(a5)
		ori.w	#ACTV_JOY1M,global_vars+new_default_cntrl(a5)
                bra	next_control

.choose2	tst.b	global_vars+control2(a5)
		bne	.already_chosen
		tst.l	os_kill
		bne.s	.skip_wait4
		jsr	temp_take_system
.skip_wait4	st.b	global_vars+control2(a5)
		st.b	global_vars+control6(a5)
		st.b	global_vars+control13(a5)
		DISPLAY_CONTROL 2
		DISPLAY_CONTROL 6
		DISPLAY_CONTROL 13
		move.l	global_vars+curr_player_ctl(a5),a1
		move.b	#2,(a1)
		add.w	#1,a1
		move.l	a1,global_vars+curr_player_ctl(a5)
		ori.w	#1<<1,global_vars+new_active_controls(a5)
                bra	next_control

.choose3	tst.b	global_vars+control3(a5)
		bne	.already_chosen
		tst.l	os_kill
		bne.s	.skip_wait5
		jsr	temp_take_system
.skip_wait5	st.b	global_vars+control3(a5)
		DISPLAY_CONTROL 3
		move.l	global_vars+curr_player_ctl(a5),a1
		move.b	#3,(a1)
		add.w	#1,a1
		move.l	a1,global_vars+curr_player_ctl(a5)
		ori.w	#1<<2,global_vars+new_active_controls(a5)
                bra	next_control

.choose4	tst.b	global_vars+control4(a5)
		bne	.already_chosen
		tst.l	os_kill
		bne.s	.skip_wait6
		jsr	temp_take_system
.skip_wait6	st.b	global_vars+control4(a5)
		DISPLAY_CONTROL 4
		move.l	global_vars+curr_player_ctl(a5),a1
		move.b	#4,(a1)
		add.w	#1,a1
		move.l	a1,global_vars+curr_player_ctl(a5)
		ori.w	#1<<3,global_vars+new_active_controls(a5)
                bra	next_control

.choose5	tst.b	global_vars+control5(a5)
		bne	.already_chosen
		tst.l	os_kill
		bne.s	.skip_wait7
		jsr	temp_take_system
.skip_wait7	st.b	global_vars+control5(a5)
		st.b	global_vars+control1(a5)
		st.b	global_vars+control12(a5)
		DISPLAY_CONTROL 5
		DISPLAY_CONTROL 1
		DISPLAY_CONTROL 12
		move.l	global_vars+curr_player_ctl(a5),a1
		move.b	#5,(a1)
		add.w	#1,a1
		move.l	a1,global_vars+curr_player_ctl(a5)
		ori.w	#1<<4,global_vars+new_active_controls(a5)
		ori.w	#ACTV_MOUSE1M,global_vars+new_default_cntrl(a5)
                bra	next_control

.choose6	tst.b	global_vars+control6(a5)
		bne	.already_chosen
		tst.l	os_kill
		bne.s	.skip_wait8
		jsr	temp_take_system
.skip_wait8	st.b	global_vars+control6(a5)
		st.b	global_vars+control2(a5)
		st.b	global_vars+control13(a5)
		DISPLAY_CONTROL 6
		DISPLAY_CONTROL 2
		DISPLAY_CONTROL 13
		move.l	global_vars+curr_player_ctl(a5),a1
		move.b	#6,(a1)
		add.w	#1,a1
		move.l	a1,global_vars+curr_player_ctl(a5)
		ori.w	#1<<5,global_vars+new_active_controls(a5)
                bra	next_control

.choose7	tst.b	global_vars+control7(a5)
		bne	.already_chosen
		tst.l	os_kill
		bne.s	.skip_wait9
		jsr	temp_take_system
.skip_wait9	st.b	global_vars+control7(a5)
		st.b	global_vars+control8(a5)
		DISPLAY_CONTROL 7
		DISPLAY_CONTROL 8
		move.l	global_vars+curr_player_ctl(a5),a1
		move.b	#7,(a1)
		add.w	#1,a1
		move.l	a1,global_vars+curr_player_ctl(a5)
                bra	next_control

.choose8	tst.b	global_vars+control8(a5)
		bne	.already_chosen
		tst.l	os_kill
		bne.s	.skip_wait10
		jsr	temp_take_system
.skip_wait10	st.b	global_vars+control8(a5)
		st.b	global_vars+control7(a5)
		DISPLAY_CONTROL 8
		DISPLAY_CONTROL 7
		move.l	global_vars+curr_player_ctl(a5),a1
		move.b	#8,(a1)
		add.w	#1,a1
		move.l	a1,global_vars+curr_player_ctl(a5)
                bra	next_control

.choose9	tst.b	global_vars+control9(a5)
		bne	.already_chosen
		tst.l	os_kill
		bne.s	.skip_wait11
		jsr	temp_take_system
.skip_wait11	st.b	global_vars+control9(a5)
		st.b	global_vars+control10(a5)
		DISPLAY_CONTROL 9
		DISPLAY_CONTROL 10
		move.l	global_vars+curr_player_ctl(a5),a1
		move.b	#CNTRL_KEYS3,(a1)
		add.w	#1,a1
		move.l	a1,global_vars+curr_player_ctl(a5)
                bra	next_control

.choose10	tst.b	global_vars+control10(a5)
		bne	.already_chosen
		tst.l	os_kill
		bne.s	.skip_wait12
		jsr	temp_take_system
.skip_wait12	st.b	global_vars+control10(a5)
		st.b	global_vars+control9(a5)
		DISPLAY_CONTROL 10
		DISPLAY_CONTROL 9
		move.l	global_vars+curr_player_ctl(a5),a1
		move.b	#CNTRL_KEYS4,(a1)
		add.w	#1,a1
		move.l	a1,global_vars+curr_player_ctl(a5)
                bra	next_control

.choose12	tst.b	global_vars+control12(a5)
		bne	.already_chosen
		tst.l	os_kill
		bne.s	.skip_wait13
		jsr	temp_take_system
.skip_wait13	st.b	global_vars+control1(a5)
		st.b	global_vars+control5(a5)
		st.b	global_vars+control12(a5)
		DISPLAY_CONTROL 1
		DISPLAY_CONTROL 5
		DISPLAY_CONTROL 12
		move.l	global_vars+curr_player_ctl(a5),a1
		move.b	#CNTRL_PAD1,(a1)
		add.w	#1,a1
		move.l	a1,global_vars+curr_player_ctl(a5)
		ori.w	#ACTV_PAD1M,global_vars+new_active_controls(a5)
		ori.w	#ACTV_PAD1M,global_vars+new_default_cntrl(a5)
                bra	next_control

.choose13	tst.b	global_vars+control13(a5)
		bne	.already_chosen
		tst.l	os_kill
		bne.s	.skip_wait14
		jsr	temp_take_system
.skip_wait14	st.b	global_vars+control2(a5)
		st.b	global_vars+control6(a5)
		st.b	global_vars+control13(a5)
		DISPLAY_CONTROL 2
		DISPLAY_CONTROL 6
		DISPLAY_CONTROL 13
		move.l	global_vars+curr_player_ctl(a5),a1
		move.b	#CNTRL_PAD2,(a1)
		add.w	#1,a1
		move.l	a1,global_vars+curr_player_ctl(a5)
		ori.w	#ACTV_PAD2M,global_vars+new_active_controls(a5)
                bra	next_control

********************************************************************************
end_select_controls
		move.w	global_vars+new_active_controls(a5),global_vars+active_controls(a5)
		move.w	global_vars+new_default_cntrl(a5),global_vars+default_cntrl(a5)

		move.b	global_vars+num_players(a5),d0

		cmpi.b	#1,d0
		bne.s	.not1
		move.b	global_vars+pl1_control(a5),variables+player1+control_method(a5)
		move.b	global_vars+pl1_control(a5),variables+player2+control_method(a5)
		move.b	global_vars+pl1_control(a5),variables+player3+control_method(a5)
		move.b	global_vars+pl1_control(a5),variables+player4+control_method(a5)
.not1
		cmpi.b	#2,d0
		bne.s	.not2
		move.b	global_vars+pl1_control(a5),variables+player1+control_method(a5)
		move.b	global_vars+pl2_control(a5),variables+player2+control_method(a5)
		move.b	global_vars+pl1_control(a5),variables+player3+control_method(a5)
		move.b	global_vars+pl2_control(a5),variables+player4+control_method(a5)
.not2
		cmpi.b	#3,d0
		bne.s	.not3
		move.b	global_vars+pl1_control(a5),variables+player1+control_method(a5)
		move.b	global_vars+pl2_control(a5),variables+player2+control_method(a5)
		move.b	global_vars+pl3_control(a5),variables+player3+control_method(a5)
		move.b	#0,variables+player4+control_method(a5)
.not3
		cmpi.b	#4,d0
		bne.s	.not4
		move.b	global_vars+pl1_control(a5),variables+player1+control_method(a5)
		move.b	global_vars+pl2_control(a5),variables+player2+control_method(a5)
		move.b	global_vars+pl3_control(a5),variables+player3+control_method(a5)
		move.b	global_vars+pl4_control(a5),variables+player4+control_method(a5)
.not4
		tst.w	global_vars+training_flag(a5)
		bne	choose_training_map
		tst.w	global_vars+action_flag(a5)
		bne	play_action_map_pl1

		rts

********************************************************************************
********************************************************************************
********************************************************************************
continue_old_game
		tst.l	os_kill
		bne.s	.skip_wait2
		jsr	temp_take_system
.skip_wait2
		move.w	#RESTART_LOAD,variables+restart_flag(a5)
		rts

********************************************************************************
********************************************************************************
********************************************************************************

choose_training_map
		move.l	#training_table,table
		lea	training_title,a0
		lea	training_text,a1
		suba.l	a2,a2
		moveq.l	#43,d0
		moveq.l	#47,d1
		suba.l	a3,a3
		bra	play_action_map

********************************************************************************
********************************************************************************
********************************************************************************

play_action_map_pl1
		move.l	#action1_table,table

		lea	action1_title,a0
		lea	play_action_map_pl2,a2
		moveq.l	#23,d0
		lea	action1_players,a1
	IFND	se
		suba.l	a3,a3
		moveq.l	#3,d1
	ELSEIF
		lea	action1_players_ghosted,a3
		moveq.l	#0,d1
	ENDC
		bra	play_action_map

play_action_map_pl2
		move.l	#action2_table,table

		lea	action2_title,a0
		lea	play_action_map_pl3,a2
		moveq.l	#28,d0
		lea	action2_players,a1
	IFND	se
		suba.l	a3,a3
		moveq.l	#3,d1
	ELSEIF
		lea	action2_players_ghosted,a3
		moveq.l	#1,d1
	ENDC
		bra	play_action_map

play_action_map_pl3
		move.l	#action3_table,table

		lea	action3_title,a0
		lea	play_action_map_pl4,a2
		moveq.l	#33,d0
		lea	action3_players,a1
	IFND	se
		suba.l	a3,a3
		moveq.l	#3,d1
	ELSEIF
		lea	action3_players_ghosted,a3
		moveq.l	#0,d1
	ENDC
		bra	play_action_map

play_action_map_pl4
		move.l	#action4_table,table

		lea	action4_title,a0
		lea	play_action_map_pl1,a2
		moveq.l	#38,d0
		lea	action4_players,a1
	IFND	se
		suba.l	a3,a3
		moveq.l	#4,d1
	ELSEIF
		lea	action4_players_ghosted,a3
		moveq.l	#0,d1
	ENDC
		bra	play_action_map


play_action_map	movem.l	d0-d1/a2,-(sp)
		move.l	a3,-(sp)
		move.l	a1,-(sp)
		move.l	a0,-(sp)

		sf.b	front_key_down

		bsr	copy_rock_title
		bsr	scan_rock
                WAIT_VBLANK
		WAIT_LINE #100
		move.w	#%11111,d6		;no save & replace
		move.l	#lace_fontb,a2
		add.l	a4,a2

		move.l	(sp)+,a0

		BLIT_TEXT (a0),a2,#0,#0

		lea	front_font_s,a2
		adda.l	a5,a2

		move.l	(sp)+,a1

		BLIT_TEXT (a1),a2,#0,#0,#%11111

		move.l	(sp)+,a3

		cmpa.l	#0,a3
		beq.s	.skip_ghost
		BLIT_TEXT (a3),a2,#0,#0,#%11111
.skip_ghost
		movem.l	(sp)+,d0-d1/a2

		tst.l	os_kill
		bne.s	.skip_wait1
		jsr	temp_restore_system
.skip_wait1

.loop
		bsr	front_grab

		movem.l	a0-a2/d0/d2-d7,-(sp)
		move.l	#lace_copperlist,a0
		add.l	chip_mem_base,a0
		lea	lace_sprites1(a0),a1
		lea	lace_sprites2(a0),a2
		move.l	table,a0
		bsr	do_selections
		move.w	d0,d1
		movem.l	(sp)+,a0-a2/d0/d2-d7

		clr.w	global_vars+action_map(a5)
		cmpi.w	#0,d1
		beq	.map1
		cmpi.w	#1,d1
		beq.s	.map2
		cmpi.w	#2,d1
		beq	.map3
		cmpi.w	#3,d1
		beq	.map4
		cmpi.w	#23,d0
		beq.s	.test_4_next
		cmpi.w	#28,d0
		beq.s	.test_4_next
		cmpi.w	#33,d0
		beq.s	.test_4_next
		cmpi.w	#4,d1
		beq	.map5
		bra.s	.skip_test_4_next
.test_4_next	cmpi.w	#4,d1
		beq	.next
.skip_test_4_next

		cmpa.l	#0,a2
		beq.s	.training
		cmpi.w	#5,d1
		beq	.next
.training
		bra	.loop

;-------------------------------------------------------------------------------
.map1		move.w	#0,global_vars+action_map(a5)
		moveq.l	#0,d2
		bra.s	.ok2

;-------------------------------------------------------------------------------
.map2		move.w	#1,global_vars+action_map(a5)
		moveq.l	#1,d2

		cmpi.w	#23,d0
		bne.s	.map2_23
		move.w	#2,global_vars+action_map(a5)
.map2_23
		bra.s	.ok2

;-------------------------------------------------------------------------------
.map3		move.w	#2,global_vars+action_map(a5)
		moveq.l	#2,d2

		cmpi.w	#23,d0
		bne.s	.map3_23
		move.w	#3,global_vars+action_map(a5)
.map3_23
		bra.s	.ok2

;-------------------------------------------------------------------------------
.map4		move.w	#3,global_vars+action_map(a5)
		moveq.l	#3,d2

		cmpi.w	#23,d0
		bne.s	.map4_23
		move.w	#4,global_vars+action_map(a5)
.map4_23
		cmpi.w	#33,d0
		bne.s	.map4_33
		move.w	#4,global_vars+action_map(a5)
.map4_33
		bra.s	.ok2

;-------------------------------------------------------------------------------
.map5		move.w	#4,global_vars+action_map(a5)
		moveq.l	#4,d2

		bra.s	.ok2

;-------------------------------------------------------------------------------
.next		pea	(a2)
		bra.s	.ok

.ok2		add.w	d0,global_vars+action_map(a5)

		cmp.w	d1,d2
		bgt	.loop

.ok		tst.l	os_kill
		bne.s	.skip_wait2
		jsr	temp_take_system
.skip_wait2
		rts

table		dc.l	0

********************************************************************************
*************************** Load And Decrunch Menu Data ************************
********************************************************************************

load_and_decrunch_menu_data
		move.l	#lc_disk_buffer,a2
		add.l	a4,a2				;disk buffer
		LOG_DISK #1,a2,#2

		SHOW_MESG diskio_mesg_1

		move.l	#lace_copperlist,a1
		add.l	a4,a1
		LOAD_FILE <"Front/Front.dat">,a1

	IFD	CD32
		move.l	#ex_effects,a1
		add.l	exchip_mem_base,a1
		LOAD_FILE <"Front/Fill.dat">,a1

		move.l	#front_font_s_small,a1
		add.l	a5,a1
		LOAD_FILE <"Front/SmallMesg.dat">,a1

		move.l	#front_font_s_small,a0
		adda.l	a5,a0
		move.l	a0,d0
		add.l	d0,text_address(a0)
		move.b	#3,text_plane+3(a0)
		move.b	#2,text_plane+4(a0)
	ENDC

	IFD	se
		move.l	#front_se_logo,a1
		add.l	a5,a1
		LOAD_FILE <"Front/SE.dat">,a1
	ENDC

		SHOW_MESG decrunch_message

	IFD	se
		move.l	#front_se_logo,a1
		add.l	a5,a1
		PP_DECRUNCH a1
	ENDC

		move.l	#lace_copperlist,a1
		add.l	a4,a1
		PP_DECRUNCH a1

;Set up in-line pointers
	IFD	se
		move.l	#front_se_logo,a0
		add.l	a5,a0
		move.l	a0,d0
		add.l	d0,(a0)
	ENDC

		move.l	#lace_fontb,d0
		add.l	a4,d0
		move.l	#lace_fontb+text_address,a0
		add.l	a4,a0
		add.l	d0,(a0)
		move.b	#2,text_plane+4(a0)

	IFD	CD32
		move.l	#ex_effects,a0
		add.l	exchip_mem_base,a0
		move.l	a0,d0
		add.l	d0,(a0)
	ELSEIF
		move.l	#lace_fill,a0
		add.l	a4,a0
		move.l	a0,d0
		add.l	d0,(a0)
	ENDC
		rts
	ENDC

********************************************************************************
********************************************************************************
********************************************************************************
mesg_wait
		tst.l	os_kill
		bne.s	.skip_wait1
		jsr	temp_restore_system
.skip_wait1
		clr.w	joystick1
		clr.w	joystick2
		clr.w	joystick3
		clr.w	joystick4
		sf.b    mesg_key_down

.loop		tst.b   mesg_key_down
		bne.s	.end
		tst.w	joystick1
		bne.s	.end
		tst.w	joystick2
		bne.s	.end
		tst.w	joystick3
		bne.s	.end
		tst.w	joystick4
		bne.s	.end

		bra.s	.loop
.end
		tst.l	os_kill
		bne.s	.skip_wait2
		jsr	temp_take_system
.skip_wait2
		clr.w	joystick1
		clr.w	joystick2
		clr.w	joystick3
		clr.w	joystick4
		sf.b    mesg_key_down
		rts

********************************************************************************
********************************************************************************
********************************************************************************
timed_wait
		tst.l	os_kill
		bne.s	.skip_wait1
		jsr	temp_restore_system
.skip_wait1	clr.w   timer

.loop		jsr	test_input
		tst.l	d0
		bne	.end

		move.w	timer,d0
		cmpi.w	#200,d0
		bls.s	.loop
		tst.l	os_kill
		bne.s	.skip_wait2
		jsr	temp_take_system
.skip_wait2	rts

.end		tst.l	os_kill
		bne.s	.skip_wait3
		jsr	temp_take_system
.skip_wait3	clr.w	last_key
		moveq.l	#-1,d0
		rts

;timed_wait2
;		tst.l	os_kill
;		bne.s	.skip_wait1
;		jsr	temp_restore_system
;.skip_wait1	clr.w   timer
;
;.loop
;		WAIT_VBLANK
;		movem.l	d0-d1/a0-a1/a6,-(sp)
;		move.l	vars_block,a6
;		move.l	lowlevel_base(a6),a6
;		move.l	#0,d0
;		jsr	_LVOReadJoyPort(a6)
;		movem.l	(sp)+,d0-d1/a0-a1/a6
;
;		jsr	test_input
;		tst.l	d0
;		bne	.end
;
;		move.w	timer,d0
;		cmpi.w	#200,d0
;		bls.s	.loop
;		tst.l	os_kill
;		bne.s	.skip_wait2
;		jsr	temp_take_system
;.skip_wait2	rts
;
;.end		tst.l	os_kill
;		bne.s	.skip_wait3
;		jsr	temp_take_system
;.skip_wait3	clr.w	last_key
;		moveq.l	#-1,d0
;		rts

timed_wait_long
		tst.l	os_kill
		bne.s	.skip_wait1
		jsr	temp_restore_system
.skip_wait1	clr.w   timer

.loop		jsr	test_input
		tst.l	d0
		bne	.end

		move.w	timer,d0
		cmpi.w	#400,d0
		bls.s	.loop
		tst.l	os_kill
		bne.s	.skip_wait2
		jsr	temp_take_system
.skip_wait2	rts

.end		tst.l	os_kill
		bne.s	.skip_wait3
		jsr	temp_take_system
.skip_wait3	clr.w	last_key
		moveq.l	#-1,d0
		rts

********************************************************************************
********************************* Responsive keys ******************************
********************************************************************************
		even
;Format : keydown, keycode, release
; Keydown is set while the key is pressed.
; Use keycode as specified in Hardware Reference Manual page 249.
; Set release for keyup messages to be interpreted.


front_key_list
front_key_down	dc.b	0
front_key_up	dc.b	0

front_ctrl	dc.b	0,$63,1		;control
front_screen_grab	dc.b	0,$24,1		;g
front_quit_game	dc.b	0,$10,1		;q

		dc.b	0,$ff,0		;eod marker

                even

********************************************************************************
********************************************************************************
********************************************************************************

	IFND	demo

	IFD	CD32
main_menu_title	dc.b	ABSPOS,45>>8,45,34>>8,34
		PHRASE  6
	ELSEIF
main_menu_title	dc.b	ABSPOS,45>>8,45,49>>8,49
		PHRASE  1
	ENDC
		dc.b	NEWLINE,ENDTEXT

	IFD	CD32
main_menu_text_noexit
		dc.b	ABSPOS,75>>8,75,182>>8,182
		PHRASE  27
		dc.b	ABSPOS,75>>8,75,226>>8,226&$ff
		PHRASE  28
		dc.b	ABSPOS,75>>8,75,270>>8,270&$ff
		PHRASE  29
		dc.b	ABSPOS,75>>8,75,344>>8,344&$ff
		PHRASE  3
		dc.b    ENDTEXT

main_menu_text	dc.b	ABSPOS,75>>8,75,150>>8,150
		PHRASE  27
		dc.b	ABSPOS,75>>8,75,194>>8,194&$ff
		PHRASE  28
		dc.b	ABSPOS,75>>8,75,238>>8,238&$ff
		PHRASE  29
		dc.b	ABSPOS,75>>8,75,316>>8,316&$ff
		PHRASE  3
		dc.b	ABSPOS,75>>8,75,360>>8,360&$ff
		PHRASE  4
		dc.b    ENDTEXT
	ELSEIF
main_menu_text	dc.b	ABSPOS,75>>8,75,174>>8,174
		dc.b	"F1    ",ALIGN
		PHRASE  2
		dc.b	ABSPOS,75>>8,75,219>>8,219&$ff
		dc.b	"F2   ",ALIGN
		PHRASE  3
		dc.b	ABSPOS,75>>8,75,264>>8,264&$ff
		dc.b	"F3   ",ALIGN
		PHRASE  4
		dc.b	ABSPOS,75>>8,75,340>>8,340&$ff
		PHRASE  5
		dc.b    ENDTEXT
	ENDC

main_menu_exit	dc.b	ABSPOS,65>>8,65,264>>8,264&$ff
		dc.b	"$$$$$$$$$$$$$$$$$$$$$$$$$$$"
		dc.b    ENDTEXT

main_menu_exit2	dc.b	ABSPOS,65>>8,65,264>>8,264&$ff
		dc.b	"$$$$$$$$$$$$$$$$$"
		dc.b    ENDTEXT

		even

********************************************************************************

	IFD	CD32
credit_title	dc.b	ABSPOS,0>>8,0,34>>8,34
	ELSEIF
credit_title	dc.b	ABSPOS,0>>8,0,49>>8,49
	ENDC
		PHRASE  6
		dc.b    ENDTEXT

credit1_text	dc.b	ABSPOS,0>>8,0,160>>8,160
		PHRASE  7
		dc.b	ENDTEXT

credit1a_text	dc.b	ABSPOS,0>>8,0,140>>8,140
		PHRASE  8
		dc.b    ENDTEXT

credit2_text	dc.b	ABSPOS,0>>8,0,150>>8,150
		PHRASE  9
		dc.b	CENTRE,"SCOTT JOHNSTON",NEWLINE
		dc.b    ENDTEXT

credit3_text	dc.b	ABSPOS,0>>8,0,160>>8,160
		PHRASE  10
		dc.b	NEWLINE
	IFD	CD32
		dc.b	CENTRE,"SCOTT JOHNSTON",NEWLINE
		dc.b	CENTRE,"GRAEME ANDERSON",NEWLINE
	ELSEIF
		dc.b	CENTRE,"GRAEME ANDERSON",NEWLINE
		dc.b	CENTRE,"SCOTT JOHNSTON",NEWLINE
	ENDC
		dc.b	CENTRE,"DAVID OSBORNE",NEWLINE
		dc.b    ENDTEXT

credit4_text	dc.b	ABSPOS,0>>8,0,160>>8,160
		PHRASE	11
		dc.b	NEWLINE
		dc.b	CENTRE,"BRIAN JOHNSTON",NEWLINE,NEWLINE
		PHRASE	12
		dc.b	NEWLINE
		dc.b	CENTRE,"STEVE HAMMOND",NEWLINE
		dc.b    ENDTEXT

credit17_text	dc.b	ABSPOS,0>>8,0,150>>8,150
		PHRASE	13
		dc.b	NEWLINE
		dc.b	CENTRE,"SCOTT JOHNSTON",NEWLINE
		dc.b	CENTRE,"GRAEME ANDERSON",NEWLINE
		dc.b	CENTRE,"MARTIN GOOD",NEWLINE
		dc.b	CENTRE,"DAVID HALLY",NEWLINE
		dc.b    ENDTEXT

	IFD	CD32
credit18_text	dc.b	ABSPOS,0>>8,0,160>>8,160
		PHRASE	13
		dc.b	NEWLINE
		dc.b	CENTRE,"STEVE HAMMOND",NEWLINE
		dc.b	CENTRE,"MIKE DAILLY",NEWLINE
		dc.b	CENTRE,"IAN DUNLOP",NEWLINE
		dc.b    ENDTEXT
	ELSEIF
credit18_text	dc.b	ABSPOS,0>>8,0,150>>8,150
		PHRASE	13
		dc.b	NEWLINE
		dc.b	CENTRE,"STEVE HAMMOND",NEWLINE
		dc.b	CENTRE,"MIKE DAILLY",NEWLINE
		dc.b	CENTRE,"IAN DUNLOP",NEWLINE
		dc.b	CENTRE,"MIKE CLARKE",NEWLINE
		dc.b    ENDTEXT
	ENDC

credit5_text	dc.b	ABSPOS,0>>8,0,160>>8,160
		PHRASE	14
		dc.b	NEWLINE
		dc.b	CENTRE,"JAMIE GRANT",NEWLINE,NEWLINE
		PHRASE	15
		dc.b	NEWLINE
		dc.b	CENTRE,"BRIAN WATSON",NEWLINE
		dc.b	ENDTEXT

credit6_text	dc.b	ABSPOS,0>>8,0,160>>8,160
		PHRASE	16
		dc.b	NEWLINE
		dc.b	CENTRE,"RUSSELL KAY",NEWLINE,NEWLINE
		PHRASE	17
		dc.b	NEWLINE
		dc.b	CENTRE,"TEIJO KINNUNEN",NEWLINE
		dc.b	ENDTEXT

credit7_text	dc.b	ABSPOS,0>>8,0,160>>8,160&$ff
		PHRASE	18
		dc.b	NEWLINE
		dc.b	CENTRE,"ROB NORTHEN COMPUTING",NEWLINE,NEWLINE
		PHRASE	19
		dc.b	NEWLINE
		dc.b	CENTRE,"MIKE DAILLY",NEWLINE,NEWLINE
		dc.b    ENDTEXT

credit13_text	dc.b	ABSPOS,0>>8,0,160>>8,160&$ff
		PHRASE  20
		dc.b	CENTRE,"ANTHONY BALL &",NEWLINE
		dc.b	CENTRE,"EDMUND BAMBER",NEWLINE
		dc.b    ENDTEXT

	IFD	CD32
credit8_text	dc.b	ABSPOS,0>>8,0,150>>8,150
		PHRASE	21
		dc.b	NEWLINE
		dc.b	CENTRE,"GRAEME ANDERSON",NEWLINE
		dc.b	CENTRE,"MARTIN GOOD",NEWLINE
		dc.b	CENTRE,"IAN DUNLOP",NEWLINE
		dc.b	CENTRE,"STEVE HAMMOND",NEWLINE
		dc.b    ENDTEXT

credit9_text	dc.b	ABSPOS,0>>8,0,150>>8,150
		PHRASE	21
		dc.b	NEWLINE
		dc.b	CENTRE,"MIKE DAILLY",NEWLINE
		dc.b	CENTRE,"SCOTT CHEETHAM",NEWLINE
		dc.b	CENTRE,"DERRICK ANGUS",NEWLINE
		dc.b	CENTRE,"JOSHUA RAITE",NEWLINE
		dc.b    ENDTEXT

	ELSEIF

credit8_text	dc.b	ABSPOS,0>>8,0,150>>8,150
		PHRASE	21
		dc.b	NEWLINE
		PHRASE	22
		dc.b	NEWLINE
		dc.b	CENTRE,"SCOTT CHEETHAM",NEWLINE
		dc.b	CENTRE,"DERRICK ANGUS",NEWLINE
		dc.b	CENTRE,"JOSHUA RAITE",NEWLINE
		dc.b    ENDTEXT

credit9_text	dc.b	ABSPOS,0>>8,0,150>>8,150
		PHRASE	21
		dc.b	NEWLINE
		dc.b	CENTRE,"TONY PARKES",NEWLINE
		dc.b	CENTRE,"CHRIS STANLEY",NEWLINE
		dc.b	CENTRE,"MARK O'CONNOR",NEWLINE
		dc.b	CENTRE,"PAUL HOLMES",NEWLINE
		dc.b    ENDTEXT


credit14_text	dc.b	ABSPOS,0>>8,0,150>>8,150
		PHRASE	21
		dc.b	NEWLINE
		dc.b	CENTRE,"PAUL WALLACE",NEWLINE
		dc.b	CENTRE,"JASON ENNION",NEWLINE
		dc.b	CENTRE,"GARY MERCER",NEWLINE
		dc.b	CENTRE,"JEFF CULSHAW",NEWLINE
		dc.b    ENDTEXT

credit15_text	dc.b	ABSPOS,0>>8,0,150>>8,150
		PHRASE	21
		dc.b	NEWLINE
		dc.b	CENTRE,"PAUL EVASON",NEWLINE
		dc.b	CENTRE,"PAUL JONES",NEWLINE
		dc.b	CENTRE,"PAUL HILTON",NEWLINE
		dc.b	CENTRE,"JED ADAMS",NEWLINE
		dc.b    ENDTEXT

credit16_text	dc.b	ABSPOS,0>>8,0,150>>8,150
		PHRASE	21
		dc.b	NEWLINE
		dc.b	CENTRE,"PHIL SNAPE",NEWLINE
		dc.b	CENTRE,"& DEVELOPMENT TEAM",NEWLINE
		dc.b    ENDTEXT
	ENDC

credit11_text	dc.b	ABSPOS,0>>8,0,175>>8,175
		PHRASE	23
		dc.b    ENDTEXT

credit12_text	dc.b	ABSPOS,0>>8,0,140>>8,140
		PHRASE	24
		dc.b    ENDTEXT

		even

********************************************************************************

	IFD	CD32
start1_title	dc.b	ABSPOS,45>>8,45,34>>8,34
		PHRASE  6
	ELSEIF
start1_title	dc.b	ABSPOS,45>>8,45,39>>8,39
		PHRASE  25
	ENDC
		dc.b	NEWLINE
		dc.b    ENDTEXT

	IFD	CD32
start1b_title	dc.b	ABSPOS,45>>8,45,89>>8,89,CENTRE
		dc.b	"AMIGA   CD   AGA   V"
		dc.b	(VERSION>>24)&$ff,(VERSION>>16)&$ff,".",(VERSION>>8)&$ff,VERSION&$ff
		dc.b    ENDTEXT
	ENDC

start1_text	dc.b	ABSPOS,0>>8,0,162>>8,162
		PHRASE	26
		dc.b	ABSPOS,135>>8,135,234>>8,234&$ff
		PHRASE	27
		dc.b	ABSPOS,135>>8,135,278>>8,278&$ff
		PHRASE	28
		dc.b	ABSPOS,135>>8,135,322>>8,322&$ff
		PHRASE	29
		dc.b    ENDTEXT

no_action_maps	dc.b	ABSPOS,135>>8,135,323>>8,323&$ff
		dc.b	"$$$$$$$$$$$$$$$$"
		dc.b    ENDTEXT

no_training_maps
		dc.b	ABSPOS,135>>8,135,235>>8,235&$ff
		dc.b	"$$$$$$$$$$$$$$$$"
		dc.b	ENDTEXT

start2_text
		dc.b	ABSPOS,0>>8,0,150>>8,150
		PHRASE	30
		dc.b	ABSPOS,135>>8,135,216>>8,216
		PHRASE	31
		dc.b	ABSPOS,135>>8,135,260>>8,260&$ff
		PHRASE	32
		dc.b	ABSPOS,135>>8,135,304>>8,304&$ff
		PHRASE	33
		dc.b	ABSPOS,135>>8,135,348>>8,348&$ff
		PHRASE	34
		dc.b	ENDTEXT

start2b_text
		dc.b	ABSPOS,0>>8,0,150>>8,150
		PHRASE	30
		dc.b	ABSPOS,135>>8,135,216>>8,216&$ff
		PHRASE	31
		dc.b	ABSPOS,135>>8,135,260>>8,260&$ff
		PHRASE	32
		dc.b	ENDTEXT

action1_title	dc.b	ABSPOS,45>>8,45,49>>8,49
		PHRASE	35
		dc.b	NEWLINE
		dc.b    ENDTEXT
action1_players	dc.b	ABSPOS,170>>8,170,130>>8,130
		PHRASE	36
		dc.b	ABSPOS,170>>8,170,174>>8,174&$ff
		PHRASE	37
		dc.b	ABSPOS,170>>8,170,218>>8,218&$ff
		PHRASE	38
		dc.b	ABSPOS,170>>8,170,262>>8,262&$ff
		PHRASE	39
		dc.b	ABSPOS,170>>8,170,358>>8,358&$ff
		PHRASE  40
		dc.b    ENDTEXT
action1_players_ghosted
		dc.b	ABSPOS,170>>8,170,174>>8,174&$ff
		dc.b	CENTRE,"$$$$$$$$$$$$$$$$$",NEWLINE
		dc.b	ABSPOS,170>>8,170,218>>8,218&$ff
		dc.b	CENTRE,"$$$$$$$$$$$$$$$$$",NEWLINE
		dc.b	ABSPOS,170>>8,170,262>>8,262&$ff
		dc.b	CENTRE,"$$$$$$$$$$$$$$$$$",NEWLINE
		dc.b    ENDTEXT

action2_title	dc.b	ABSPOS,45>>8,45,49>>8,49
		PHRASE  41
		dc.b	NEWLINE
		dc.b    ENDTEXT
action2_players	dc.b	ABSPOS,170>>8,170,130>>8,130
		PHRASE  42
		dc.b	ABSPOS,170>>8,170,174>>8,174&$ff
		PHRASE  43
		dc.b	ABSPOS,170>>8,170,218>>8,218&$ff
		PHRASE  44
		dc.b	ABSPOS,170>>8,170,262>>8,262&$ff
		PHRASE  45
		dc.b	ABSPOS,170>>8,170,358>>8,358&$ff
		PHRASE  40
		dc.b    ENDTEXT
action2_players_ghosted
		dc.b	ABSPOS,170>>8,170,218>>8,218&$ff
		dc.b	CENTRE,"$$$$$$$$$$$$$$$$$",NEWLINE
		dc.b	ABSPOS,170>>8,170,262>>8,262&$ff
		dc.b	CENTRE,"$$$$$$$$$$$$$$$$$",NEWLINE
		dc.b    ENDTEXT

action3_title	dc.b	ABSPOS,45>>8,45,49>>8,49
		PHRASE  46
		dc.b    NEWLINE
		dc.b    ENDTEXT
action3_players	dc.b	ABSPOS,170>>8,170,130>>8,130
		PHRASE  47
		dc.b	ABSPOS,170>>8,170,174>>8,174&$ff
		PHRASE  48
		dc.b	ABSPOS,170>>8,170,218>>8,218&$ff
		PHRASE  49
		dc.b	ABSPOS,170>>8,170,262>>8,262&$ff
		PHRASE  50
		dc.b	ABSPOS,170>>8,170,358>>8,358&$ff
		PHRASE  40
		dc.b    ENDTEXT
action3_players_ghosted
		dc.b	ABSPOS,170>>8,170,174>>8,174&$ff
		dc.b	CENTRE,"$$$$$$$$$$$$$$$$$",NEWLINE
		dc.b	ABSPOS,170>>8,170,218>>8,218&$ff
		dc.b	CENTRE,"$$$$$$$$$$$$$$$$$",NEWLINE
		dc.b	ABSPOS,170>>8,170,262>>8,262&$ff
		dc.b	CENTRE,"$$$$$$$$$$$$$$$$$",NEWLINE
		dc.b    ENDTEXT

action4_title	dc.b	ABSPOS,45>>8,45,49>>8,49
		dc.b	CENTRE
		PHRASE  51
		dc.b    NEWLINE
		dc.b    ENDTEXT
action4_players	dc.b	ABSPOS,170>>8,170,130>>8,130
		PHRASE  52
		dc.b	ABSPOS,170>>8,170,174>>8,174&$ff
		PHRASE  53
		dc.b	ABSPOS,170>>8,170,218>>8,218&$ff
		PHRASE  54
		dc.b	ABSPOS,170>>8,170,262>>8,262&$ff
		PHRASE  55
		dc.b	ABSPOS,170>>8,170,306>>8,306&$ff
		PHRASE  56
		dc.b	ABSPOS,170>>8,170,358>>8,358&$ff
		PHRASE  40
		dc.b    ENDTEXT
action4_players_ghosted
		dc.b	ABSPOS,170>>8,170,174>>8,174&$ff
		dc.b	CENTRE,"$$$$$$$$$$$$$$$$$",NEWLINE
		dc.b	ABSPOS,170>>8,170,218>>8,218&$ff
		dc.b	CENTRE,"$$$$$$$$$$$$$$$$$",NEWLINE
		dc.b	ABSPOS,170>>8,170,262>>8,262&$ff
		dc.b	CENTRE,"$$$$$$$$$$$$$$$$$",NEWLINE
		dc.b	ABSPOS,170>>8,170,306>>8,306&$ff
		dc.b	CENTRE,"$$$$$$$$$$$$$$$$$",NEWLINE
		dc.b    ENDTEXT

training_title	dc.b	ABSPOS,45>>8,45,49>>8,49
		dc.b	CENTRE
		PHRASE  57
		dc.b    NEWLINE
		dc.b    ENDTEXT
training_text	dc.b	ABSPOS,170>>8,170,150>>8,150
		PHRASE  58
		dc.b	ABSPOS,170>>8,170,194>>8,194&$ff
		PHRASE  59
		dc.b	ABSPOS,170>>8,170,238>>8,238&$ff
		PHRASE  60
		dc.b	ABSPOS,170>>8,170,282>>8,282&$ff
		PHRASE  61
		dc.b	ABSPOS,170>>8,170,326>>8,326&$ff
		PHRASE  62
		dc.b    ENDTEXT

start31_title	dc.b	ABSPOS,45>>8,45,49>>8,49
		dc.b	CENTRE
		PHRASE	63
		dc.b	NEWLINE
		dc.b    ENDTEXT

start32_title	dc.b	ABSPOS,45>>8,45,49>>8,49
		dc.b	CENTRE
		PHRASE	64
		dc.b	NEWLINE
		dc.b    ENDTEXT

start33_title	dc.b	ABSPOS,45>>8,45,49>>8,49
		dc.b	CENTRE
		PHRASE	65
		dc.b	NEWLINE
		dc.b    ENDTEXT

start34_title	dc.b	ABSPOS,45>>8,45,49>>8,49
		dc.b	CENTRE
		PHRASE	66
		dc.b	NEWLINE
		dc.b    ENDTEXT

start3_text	dc.b	ENDTEXT

control1_y	dc.b	ABSPOS,51>>8,51,145>>8,145
		PHRASE	67
		dc.b	ENDTEXT
control1_n	dc.b	ABSPOS,42>>8,42,145>>8,145
		dc.b	"$$$$$$$$$"
		dc.b    ENDTEXT

control2_y	dc.b	ABSPOS,51>>8,51,189>>8,189&$ff
		PHRASE	68
		dc.b    ENDTEXT
control2_n	dc.b	ABSPOS,42>>8,42,189>>8,189&$ff
		dc.b	"$$$$$$$$$"
		dc.b    ENDTEXT

control3_y	dc.b	ABSPOS,51>>8,51,233>>8,233&$ff
		PHRASE	69
		dc.b    ENDTEXT
control3_n	dc.b	ABSPOS,42>>8,42,233>>8,233&$ff
		dc.b	"$$$$$$$$$"
		dc.b    ENDTEXT

control4_y	dc.b	ABSPOS,51>>8,51,277>>8,277&$ff
		PHRASE	70
		dc.b    ENDTEXT
control4_n	dc.b	ABSPOS,42>>8,42,277>>8,277&$ff
		dc.b	"$$$$$$$$$"
		dc.b    ENDTEXT

control5_y	dc.b	ABSPOS,51>>8,51&$ff,321>>8,321&$ff
		PHRASE	71
		dc.b    ENDTEXT
control5_n	dc.b	ABSPOS,42>>8,42&$ff,321>>8,321&$ff
		dc.b	"$$$$$$$$$"
		dc.b    ENDTEXT

control6_y	dc.b	ABSPOS,51>>8,51&$ff,365>>8,365&$ff
		PHRASE	72
		dc.b    ENDTEXT
control6_n	dc.b	ABSPOS,42>>8,42&$ff,365>>8,365&$ff
		dc.b	"$$$$$$$$$"
		dc.b    ENDTEXT

control12_y	dc.b    ABSPOS,304>>8,304&$ff,145>>8,145&$ff
		PHRASE	73
		dc.b    ENDTEXT
control12_n	dc.b    ABSPOS,295>>8,295&$ff,145>>8,145&$ff
		dc.b	"$$$$$$$$$"
		dc.b    ENDTEXT

control13_y	dc.b    ABSPOS,304>>8,304&$ff,189>>8,189&$ff
		PHRASE	74
		dc.b    ENDTEXT
control13_n	dc.b    ABSPOS,295>>8,295&$ff,189>>8,189&$ff
		dc.b	"$$$$$$$$$"
		dc.b    ENDTEXT

control7_y	dc.b	ABSPOS,304>>8,304&$ff,233>>8,233&$ff
		PHRASE	75
		dc.b    ENDTEXT
control7_n	dc.b	ABSPOS,295>>8,295&$ff,233>>8,233&$ff
		dc.b	"$$$$$$$$$"
		dc.b    ENDTEXT

control8_y	dc.b	ABSPOS,304>>8,304&$ff,277>>8,277&$ff
		PHRASE	76
		dc.b    ENDTEXT
control8_n	dc.b	ABSPOS,295>>8,295&$ff,277>>8,277&$ff
		dc.b	"$$$$$$$$$"
		dc.b    ENDTEXT

control9_y	dc.b	ABSPOS,304>>8,304&$ff,321>>8,321&$ff
		PHRASE	77
		dc.b    ENDTEXT
control9_n	dc.b	ABSPOS,295>>8,295&$ff,321>>8,321&$ff
		dc.b	"$$$$$$$$$"
		dc.b    ENDTEXT

control10_y	dc.b	ABSPOS,304>>8,304&$ff,365>>8,365&$ff
		PHRASE	78
		dc.b    ENDTEXT
control10_n	dc.b	ABSPOS,295>>8,295&$ff,365>>8,365&$ff
		dc.b	"$$$$$$$$$"
		dc.b    ENDTEXT

		even

	ENDC




	IFD	CD32

main_menu_table
		dc.w	0			;current choice
		dc.w	7			;width
		dc.w	5			;choices
		dc.w	1			;vert mod

		dc.w	153,100+22*0		;choice 0 (x,y)
		dc.w	153,100+22*1		;choice 1 (x,y)
		dc.w	153,100+22*2		;choice 2 (x,y)
		dc.w	153,117+22*3		;choice 3 (x,y)
		dc.w	153,117+22*4		;choice 4 (x,y)

main_menu_table_no_exit
		dc.w	0			;current choice
		dc.w	7			;width
		dc.w	4			;choices
		dc.w	1			;vert mod

		dc.w	174,100+22*0		;choice 0 (x,y)
		dc.w	174,100+22*1		;choice 1 (x,y)
		dc.w	174,100+22*2		;choice 2 (x,y)
		dc.w	174,117+22*3		;choice 3 (x,y)

select_players_table
		dc.w	0			;current choice
		dc.w	5			;width
		dc.w	4			;choices
		dc.w	1			;vert mod

		dc.w	208,133+22*0		;choice 0 (x,y)
		dc.w	208,133+22*1		;choice 1 (x,y)
		dc.w	208,133+22*2		;choice 2 (x,y)
		dc.w	208,133+22*3		;choice 3 (x,y)

select_players_2pl_table
		dc.w	0			;current choice
		dc.w	5			;width
		dc.w	2			;choices
		dc.w	1			;vert mod

		dc.w	208,122+22*0		;choice 0 (x,y)
		dc.w	208,122+22*1		;choice 1 (x,y)

controls_table
		dc.w	0			;current choice
		dc.w	4			;width
		dc.w	12			;choices
		dc.w	2			;vert mod

		dc.w	139,98+22*0		;choice 0 (x,y)
		dc.w	265,98+22*0		;choice 1 (x,y)
		dc.w	139,98+22*1		;choice 2 (x,y)
		dc.w	265,98+22*1		;choice 3 (x,y)
		dc.w	139,98+22*2		;choice 4 (x,y)
		dc.w	265,98+22*2		;choice 5 (x,y)
		dc.w	139,98+22*3		;choice 6 (x,y)
		dc.w	265,98+22*3		;choice 7 (x,y)
		dc.w	139,98+22*4		;choice 8 (x,y)
		dc.w	265,98+22*4		;choice 9 (x,y)
		dc.w	139,98+22*5		;choice 10 (x,y)
		dc.w	265,98+22*5		;choice 11 (x,y)

training_table
		dc.w	0			;current choice
		dc.w	6			;width
		dc.w	5			;choices
		dc.w	1			;vert mod

		dc.w	194,100+22*0		;choice 0 (x,y)
		dc.w	194,100+22*1		;choice 1 (x,y)
		dc.w	194,100+22*2		;choice 2 (x,y)
		dc.w	194,100+22*3		;choice 3 (x,y)
		dc.w	194,100+22*4		;choice 4 (x,y)

action1_table
		dc.w	0			;current choice
		dc.w	6			;width
		dc.w	5			;choices
		dc.w	1			;vert mod

		dc.w	194,90+22*0		;choice 0 (x,y)
		dc.w	194,90+22*1		;choice 1 (x,y)
		dc.w	194,90+22*2		;choice 2 (x,y)
		dc.w	194,90+22*3		;choice 3 (x,y)
		dc.w	194,116+22*4		;choice 4 (x,y)

action2_table
		dc.w	0			;current choice
		dc.w	6			;width
		dc.w	5			;choices
		dc.w	1			;vert mod

		dc.w	194,90+22*0		;choice 0 (x,y)
		dc.w	194,90+22*1		;choice 1 (x,y)
		dc.w	194,90+22*2		;choice 2 (x,y)
		dc.w	194,90+22*3		;choice 3 (x,y)
		dc.w	194,116+22*4		;choice 4 (x,y)

action3_table
		dc.w	0			;current choice
		dc.w	6			;width
		dc.w	5			;choices
		dc.w	1			;vert mod

		dc.w	194,90+22*0		;choice 0 (x,y)
		dc.w	194,90+22*1		;choice 1 (x,y)
		dc.w	194,90+22*2		;choice 2 (x,y)
		dc.w	194,90+22*3		;choice 3 (x,y)
		dc.w	194,116+22*4		;choice 4 (x,y)

action4_table
		dc.w	0			;current choice
		dc.w	6			;width
		dc.w	6			;choices
		dc.w	1			;vert mod

		dc.w	194,90+22*0		;choice 0 (x,y)
		dc.w	194,90+22*1		;choice 1 (x,y)
		dc.w	194,90+22*2		;choice 2 (x,y)
		dc.w	194,90+22*3		;choice 3 (x,y)
		dc.w	194,90+22*4		;choice 3 (x,y)
		dc.w	194,116+22*4		;choice 4 (x,y)

	ENDC
