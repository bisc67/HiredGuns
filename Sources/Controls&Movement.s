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

scan_help	tst.b	help
		beq.s	.end
.wait_up	tst.b	help
		bne.s	.wait_up
		jsr	do_help
.end		rts

********************************************************************************

scan_grab
	IFD	CHEAT
		tst.b   grab_screen
		beq	.end
.wait_up	tst.b   grab_screen
		bne.s	.wait_up
		sf.b	grab_screen
		SAVE_FILE <"GameGrab.bin">,viewing_buffer,#views_plane_size*views_num_planes
		move.l	#scrolly,a0
		add.l	a4,a0
		SAVE_FILE <"ScrollyGrab.bin">,a0,#864
	ENDC
.end		rts


front_grab
	IFD	CHEAT
		tst.b   front_screen_grab
		beq.s	.end
.wait_up	tst.b   front_screen_grab
		bne.s	.wait_up
		sf.b	front_screen_grab
		SAVE_FILE <"FrontGrab.bin">,viewing_buffer,#lace_plane_size*lace_num_planes
	ENDC
.end		rts

chselect_grab
	IFD	CHEAT
		tst.b   chselect_screen_grab
		beq.s	.end
.wait_up	tst.b   chselect_screen_grab
		bne.s	.wait_up
		sf.b	chselect_screen_grab
		SAVE_FILE <"ChselectGrab.bin">,drawing_buffer,#chselect_plane_size*chselect_num_planes
        ENDC
.end		rts

world_grab
	IFD	CHEAT
		tst.b   map_screen_grab
		beq.s	.end
.wait_up	tst.b   map_screen_grab
		bne.s	.wait_up
		sf.b	map_screen_grab
		SAVE_FILE <"WorldGrab.bin">,drawing_buffer,#map_p_plane_size*map_p_num_planes
	ENDC
.end		rts

********************************************************************************

scan_freeze	move.b	ctrl,d0
		add.b	freeze_frame,d0
		cmpi.b	#2,d0
		bne	.end

		cmpi.w	#MODE_GAME,variables+mode(a5)
		bne.s	.end

		move.w	#MODE_NONE,variables+mode(a5)

.wait_up	move.b	ctrl,d0
		add.b	freeze_frame,d0
		cmpi.b	#2,d0
		beq.s	.wait_up

		TASKSWITCH

.wait_down	move.b	ctrl,d0
		add.b	freeze_frame,d0
		cmpi.b	#2,d0
		bne.s	.wait_down

.wait_up2	move.b	ctrl,d0
		add.b	freeze_frame,d0
		cmpi.b	#2,d0
		beq.s	.wait_up2

		move.w	#MODE_GAME,variables+mode(a5)
.end		rts

********************************************************************************

scan_quit
	IFND	demo
		move.b	ctrl,d0
		add.b	quit_game,d0
		cmpi.b	#2,d0
		bne.s	.end

.wait_up	move.b	ctrl,d0
		add.b	quit_game,d0
		cmpi.b	#2,d0
		beq.s	.wait_up

		move.w	#RESTART_QUIT,variables+restart_flag(a5)
		sf.b	ctrl
		sf.b	quit_game
	ENDC
.end		rts

********************************************************************************

scan_abort
	IFND	demo
		tst.w	global_vars+action_flag(a5)
		bne.s	.end

		move.b	ctrl,d0
		add.b	abort_game,d0
		cmpi.b	#2,d0
		bne.s	.end

.wait_up	move.b	ctrl,d0
		add.b	abort_game,d0
		cmpi.b	#2,d0
		beq.s	.wait_up

		move.w	#RESTART_ABORT,variables+restart_flag(a5)
		sf.b	ctrl
		sf.b	quit_game
	ENDC
.end		rts

********************************************************************************

scan_retry	move.b	ctrl,d0
		add.b	retry_game,d0
		cmpi.b	#2,d0
		bne.s	.end

.wait_up	move.b	ctrl,d0
		add.b	retry_game,d0
		cmpi.b	#2,d0
		beq.s	.wait_up

		move.w	#RESTART_RETRY,variables+restart_flag(a5)
		sf.b	ctrl
		sf.b	retry_game

.end		rts

********************************************************************************

scan_save
		tst.w	global_vars+action_flag(a5)
		bne.s	.end

		move.b	ctrl,d0
		add.b	save_game,d0
		cmpi.b	#2,d0
		bne.s	.end

.wait_up	move.b	ctrl,d0
		add.b	save_game,d0
		cmpi.b	#2,d0
		beq.s	.wait_up

		sf.b	ctrl
		sf.b	save_game
		jsr	do_save_game
		bsr	unfill
		INITIALISE_KEYS	#game_key_list

.end		rts

scan_save_no_unfill
		tst.w	global_vars+action_flag(a5)
		bne.s	.end

		move.b	ctrl,d0
		add.b	save_game,d0
		cmpi.b	#2,d0
		bne.s	.end

.wait_up	move.b	ctrl,d0
		add.b	save_game,d0
		cmpi.b	#2,d0
		beq.s	.wait_up

		sf.b	ctrl
		sf.b	save_game
		jsr	do_save_game
		INITIALISE_KEYS	#game_key_list

		moveq.l	#-1,d0
		rts

.end		moveq.l	#0,d0
		rts

********************************************************************************

scan_wbench
		tst.b	noexit
		bne.s	.end

		move.b	ctrl,d0
		add.b	wbench_front,d0
		cmpi.b	#2,d0
		bne.s	.end

.wait_up	move.b	ctrl,d0
		add.b	wbench_front,d0
		cmpi.b	#2,d0
		beq.s	.wait_up

		sf.b	ctrl
		sf.b    wbench_front

		tst.l	os_kill
		bne.s	.end

		move.w	variables+mode(a5),-(sp)
		move.w	#MODE_NONE,variables+mode(a5)
		jsr     wbench_to_front
		jsr	game_screen_on3
		move.w	(sp)+,variables+mode(a5)

.end		rts

********************************************************************************

scan_load
		tst.w	global_vars+action_flag(a5)
		bne.s	.end

		move.b	ctrl,d0
		add.b	load_game,d0
		cmpi.b	#2,d0
		bne.s	.end

.wait_up	move.b	ctrl,d0
		add.b	load_game,d0
		cmpi.b	#2,d0
		beq.s	.wait_up

		sf.b	ctrl
		sf.b	load_game
		jsr	do_load_game
		bsr	unfill
		INITIALISE_KEYS	#game_key_list
.end		rts

scan_load_no_unfill
		tst.w	global_vars+action_flag(a5)
		bne.s	.end

		move.b	ctrl,d0
		add.b	load_game,d0
		cmpi.b	#2,d0
		bne.s	.end

.wait_up	move.b	ctrl,d0
		add.b	load_game,d0
		cmpi.b	#2,d0
		beq.s	.wait_up

		sf.b	ctrl
		sf.b	load_game
		jsr	do_load_game
		INITIALISE_KEYS	#game_key_list

		moveq.l	#-1,d0
		rts

.end		moveq.l	#0,d0
		rts

********************************************************************************

scan_exit
		tst.b	noexit
		bne.s	.end

		move.b	ctrl,d0
		add.b	exit_game,d0
		cmpi.b	#2,d0
		bne.s	.end

.wait_up	move.b	ctrl,d0
		add.b	exit_game,d0
		cmpi.b	#2,d0
		beq.s	.wait_up

		sf.b	ctrl
		sf.b	exit_game
		tst.l	os_kill
		bne.s	.end
		move.w	#RESTART_EXIT,variables+restart_flag(a5)

.end		rts

********************************************************************************
********************************************************************************
********************************************************************************
;Scan active controls.
;INPUT:		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	a0-a1,d0-d1

forward_action		equ	1
backward_action		equ     2
turn_left_action	equ     3
turn_right_action	equ     4
push_action		equ     5
pull_action		equ     6
left_icon_action	equ     7
right_icon_action	equ     8

action_table	dc.b	0		;000000  none
		dc.b	1		;000001  up	        forward
		dc.b	2		;000010  down            backward
		dc.b	0		;000011  ILLEGAL
		dc.b	3		;000100  left            turn left
		dc.b	0		;000101  ILLEGAL
		dc.b	0		;000110  ILLEGAL
		dc.b	0		;000111  ILLEGAL
		dc.b	4		;001000  right           turn right
		dc.b	0		;001001  ILLEGAL
		dc.b	0		;001010  ILLEGAL
		dc.b	0		;001011  ILLEGAL
		dc.b	0		;001100  ILLEGAL
		dc.b	0		;001101  ILLEGAL
		dc.b	0		;001110  ILLEGAL
		dc.b	0		;001111  ILLEGAL
		dc.b	0		;010000  fire
		dc.b	5		;010001  fire+up         push/fire/activate
		dc.b	6		;010010  fire+down       pull/reload
		dc.b	0		;010011  ILLEGAL
		dc.b	7		;010100  fire+left       window left
		dc.b	0		;010101  ILLEGAL
		dc.b	0		;010110  ILLEGAL
		dc.b	0		;010111  ILLEGAL
		dc.b	8		;011000  fire+right      window right
		dc.b	0		;011001  ILLEGAL
		dc.b	0		;011010  ILLEGAL
		dc.b	0		;011011  ILLEGAL
		dc.b	0		;011100  ILLEGAL
		dc.b	0		;011101  ILLEGAL
		dc.b	0		;011110  ILLEGAL
		dc.b	0		;011111  ILLEGAL
		dc.b	22		;100000  pickup
		dc.b	0		;100001  ILLEGAL
		dc.b	0		;100010  ILLEGAL
		dc.b	0		;100011  ILLEGAL
		dc.b	0		;100100  ILLEGAL
		dc.b	0		;100101  ILLEGAL
		dc.b	0		;100110  ILLEGAL
		dc.b	0		;100111  ILLEGAL
		dc.b	0		;101000  ILLEGAL
		dc.b	0		;101001  ILLEGAL
		dc.b	0		;101010  ILLEGAL
		dc.b	0		;101011  ILLEGAL
		dc.b	0		;101100  ILLEGAL
		dc.b	0		;101101  ILLEGAL
		dc.b	0		;101110  ILLEGAL
		dc.b	0		;101111  ILLEGAL
		dc.b	0		;110000  ILLEGAL
		dc.b	0		;110001  ILLEGAL
		dc.b	0		;110010  ILLEGAL
		dc.b	0		;110011  ILLEGAL
		dc.b	0		;110100  ILLEGAL
		dc.b	0		;110101  ILLEGAL
		dc.b	0		;110110  ILLEGAL
		dc.b	0		;110111  ILLEGAL
		dc.b	0		;111000  ILLEGAL
		dc.b	0		;111001  ILLEGAL
		dc.b	0		;111010  ILLEGAL
		dc.b	0		;111011  ILLEGAL
		dc.b	0		;111100  ILLEGAL
		dc.b	0		;111101  ILLEGAL
		dc.b	0		;111110  ILLEGAL
		dc.b	0		;111111  ILLEGAL

scan_controls
	IFD	demo
		cmpi.w	#2,global_vars+attract_mode(a5)
		bne.s	.do_scan
		tst.b	game_key_down
		beq.s	.skip_scan
		clr.w	global_vars+attract_mode(a5)
		clr.w	logo_count
		st.b	global_vars+playtime(a5)
		tst.w	global_vars+which_logo(a5)
		beq.s	.do_scan
		jsr	flash_logo2
.do_scan
		tst.b	global_vars+playtime(a5)
		bne.s	.skip_for_play
	ENDC
		bsr	scan_wbench
		bsr	scan_help
		bsr	scan_save
		bsr	scan_load
		bsr	scan_quit
		bsr	scan_abort
		bsr	scan_freeze
        	bsr	scan_grab
.skip_for_play	bsr	scan_exit
		bsr	scan_retry
.skip_scan

	IFND	demo
		cmpi.b	#10,global_vars+map_count(a5)
		blt.s	.not_pass_w
		clr.b	global_vars+map_count(a5)
	  IFND	SKIPCHECK
		bsr	do_pass
	  ENDC
.not_pass_w
	ENDC
		moveq.l	#1,d1
		lea	variables+player1(a5),a0
		bsr.s	.scan_control

		moveq.l	#2,d1
		lea	variables+player2(a5),a0
		bsr.s	.scan_control

		moveq.l	#3,d1
		lea	variables+player3(a5),a0
		bsr.s	.scan_control

		moveq.l	#4,d1
		lea	variables+player4(a5),a0
		bsr.s	.scan_control

		bsr.s	.scan_general

		rts

****************************************************************************
.scan_control
		lea	action_table(pc),a2
		moveq.l	#0,d0
		move.b	control_method(a0),d0
		lea	.control_table(pc),a1
		lsl.w	#2,d0
		jmp	0(a1,d0.w)

.control_table	rts					;0
		nop
		bra.w	.joystick1			;1
		bra.w	.joystick2			;2
		bra.w	.joystick3			;3
		bra.w	.joystick4			;4
		bra.w	mouse				;5
		bra.w	mouse				;6
		bra.w	keyboard1			;7
		bra.w	keyboard2			;8
		bra.w	keyboard3			;9
		bra.w	keyboard4			;10
		rts
                nop
		bra.w	jpad1				;12
		bra.w	jpad2				;13

****************************************************************************
.scan_general
		tst.b	kbf6
		beq.s	.not_f6
		sf.b	kbf6
		cmpi.w	#6,variables+player1+window_type(a5)
		bne.s	.not_off_f6
		st.b	variables+redraw_flag(a5)	;set redraw flag
		move.w	#1,variables+player1+window_type(a5)
		bra.s	.not_f6
.not_off_f6	cmpi.w	#1,variables+player1+window_type(a5)
		bne.s	.not_f6
		move.b	#19,variables+player1+control_action(a5)
.not_f6
		tst.b	kbf7
		beq.s	.not_f7
		sf.b	kbf7
		cmpi.w	#6,variables+player3+window_type(a5)
		bne.s	.not_off_f7
		st.b	variables+redraw_flag(a5)	;set redraw flag
		move.w	#1,variables+player3+window_type(a5)
		bra.s	.not_f7
.not_off_f7	cmpi.w	#1,variables+player3+window_type(a5)
		bne.s	.not_f7
		move.b	#19,variables+player3+control_action(a5)
.not_f7
		tst.b	kbf8
		beq.s	.not_f8
		sf.b	kbf8
		cmpi.w	#6,variables+player2+window_type(a5)
		bne.s	.not_off_f8
		st.b	variables+redraw_flag(a5)	;set redraw flag
		move.w	#1,variables+player2+window_type(a5)
		bra.s	.not_f8
.not_off_f8	cmpi.w	#1,variables+player2+window_type(a5)
		bne.s	.not_f8
		move.b	#19,variables+player2+control_action(a5)
.not_f8
		tst.b	kbf9
		beq.s	.not_f9
		sf.b	kbf9
		cmpi.w	#6,variables+player4+window_type(a5)
		bne.s	.not_off_f9
		st.b	variables+redraw_flag(a5)	;set redraw flag
		move.w	#1,variables+player4+window_type(a5)
		bra.s	.not_f9
.not_off_f9	cmpi.w	#1,variables+player4+window_type(a5)
		bne.s	.not_f9
		move.b	#19,variables+player4+control_action(a5)
.not_f9

		tst.b	kbf1
		beq.s	.not_f1
		sf.b	kbf1

		cmpi.w	#7,variables+player1+window_type(a5)
		bne.s	.not_back_f1
		st.b	variables+redraw_flag(a5)	;set redraw flag
		lea	variables+player1(a5),a0
		move.l	mem_position(a0),a1
		btst.b	#block_here_bit_num,3(a1)
		beq.s	.ok_back_f1
		st.b	variables+redraw_flag(a5)	;set redraw flag
		move.w	#150,blocked_count(a0)
		bra.s	.not_f1
.ok_back_f1	move.w	#0,window_type(a0)
		jsr	put_head_in_map
		bra.s	.not_f1

.not_back_f1	move.b	#16,variables+player1+control_action(a5)
.not_f1
		tst.b	kbf2
		beq.s	.not_f2
		sf.b	kbf2

		cmpi.w	#7,variables+player3+window_type(a5)
		bne.s	.not_back_f2
		st.b	variables+redraw_flag(a5)	;set redraw flag
		lea	variables+player3(a5),a0
		move.l	mem_position(a0),a1
		btst.b	#block_here_bit_num,3(a1)
		beq.s	.ok_back_f2
		st.b	variables+redraw_flag(a5)	;set redraw flag
		move.w	#150,blocked_count(a0)
		bra.s	.not_f2
.ok_back_f2	move.w	#0,window_type(a0)
		jsr	put_head_in_map
		bra.s	.not_f2

.not_back_f2	move.b	#16,variables+player3+control_action(a5)
.not_f2
		tst.b	kbf3
		beq.s	.not_f3
		sf.b	kbf3

		cmpi.w	#7,variables+player2+window_type(a5)
		bne.s	.not_back_f3
		st.b	variables+redraw_flag(a5)	;set redraw flag
		lea	variables+player2(a5),a0
		move.l	mem_position(a0),a1
		btst.b	#block_here_bit_num,3(a1)
		beq.s	.ok_back_f3
		st.b	variables+redraw_flag(a5)	;set redraw flag
		move.w	#150,blocked_count(a0)
		bra.s	.not_f3
.ok_back_f3	move.w	#0,window_type(a0)
		jsr	put_head_in_map
		bra.s	.not_f3

.not_back_f3	move.b	#16,variables+player2+control_action(a5)
.not_f3
		tst.b	kbf4
		beq.s	.not_f4
		sf.b	kbf4

		cmpi.w	#7,variables+player4+window_type(a5)
		bne.s	.not_back_f4
		st.b	variables+redraw_flag(a5)	;set redraw flag
		lea	variables+player4(a5),a0
		move.l	mem_position(a0),a1
		btst.b	#block_here_bit_num,3(a1)
		beq.s	.ok_back_f4
		st.b	variables+redraw_flag(a5)	;set redraw flag
		move.w	#150,blocked_count(a0)
		bra.s	.not_f4
.ok_back_f4	move.w	#0,window_type(a0)
		jsr	put_head_in_map
		bra.s	.not_f4

.not_back_f4	move.b	#16,variables+player4+control_action(a5)
.not_f4
		rts

****************************************************************************
.joystick1	moveq.l	#0,d0
		move.b	joystick1(a5),d0
		clr.b	joystick1(a5)
;		tst.w	throw_grenade(a0)
;		beq.s	.no_grenade1
;		move.b	#25,control_action(a0)
;		bra.s	.ret
;.no_grenade1
		tst.b	0(a2,d0.w)
		beq.s	.ret
		move.b	0(a2,d0.w),control_action(a0)
		rts

.joystick2	moveq.l	#0,d0
		move.b	joystick2(a5),d0
		clr.b	joystick2(a5)
;		tst.w	throw_grenade(a0)
;		beq.s	.no_grenade2
;		move.b	#25,control_action(a0)
;		bra.s	.ret
;.no_grenade2
		tst.b	0(a2,d0.w)
		beq.s	.ret
		move.b	0(a2,d0.w),control_action(a0)
		rts

.joystick3	moveq.l	#0,d0
		move.b	joystick3(a5),d0
		clr.b	joystick3(a5)
;		tst.w	throw_grenade(a0)
;		beq.s	.no_grenade3
;		move.b	#25,control_action(a0)
;		bra.s	.ret
;.no_grenade3
		tst.b	0(a2,d0.w)
		beq.s	.ret
		move.b	0(a2,d0.w),control_action(a0)
		rts

.joystick4	moveq.l	#0,d0
		move.b	joystick4(a5),d0
		clr.b	joystick4(a5)
;		tst.w	throw_grenade(a0)
;		beq.s	.no_grenade4
;		move.b	#25,control_action(a0)
;		bra.s	.ret
;.no_grenade4
		tst.b	0(a2,d0.w)
		beq.s	.ret
		move.b	0(a2,d0.w),control_action(a0)
.ret		rts

****************************************************************************
jpad1		moveq.l	#0,d0
		move.b	joystick1(a5),d0
		clr.b	joystick1(a5)

		btst.l	#butc,d0
		beq.s	.not_butc
		move.b	#22,control_action(a0)
		rts
.not_butc	btst.l	#buta,d0
		beq.s	.not_buta
		move.b	#24,control_action(a0)
		rts
.not_buta	btst.l	#butd,d0
		beq.s	.not_butd
		move.b	#19,control_action(a0)
		rts
.not_butd
;		tst.w	throw_grenade(a0)
;		beq.s	.no_grenade
;		move.b	#25,control_action(a0)
;		bra.s	.ret
;.no_grenade
		tst.b	0(a2,d0.w)
		beq.s	.ret
		move.b	0(a2,d0.w),control_action(a0)
.ret		rts

jpad2		moveq.l	#0,d0
		move.b	joystick2(a5),d0
		clr.b	joystick2(a5)

		btst.l	#butc,d0
		beq.s	.not_butc
		move.b	#22,control_action(a0)
		rts
.not_butc	btst.l	#buta,d0
		beq.s	.not_buta
		move.b	#24,control_action(a0)
		rts
.not_buta	btst.l	#butd,d0
		beq.s	.not_butd
		move.b	#19,control_action(a0)
		rts
.not_butd
;		tst.w	throw_grenade(a0)
;		beq.s	.no_grenade
;		move.b	#25,control_action(a0)
;		bra.s	.ret
;.no_grenade
		tst.b	0(a2,d0.w)
		beq.s	.ret
		move.b	0(a2,d0.w),control_action(a0)

.ret		rts

****************************************************************************
keyboard1
		moveq.l	#0,d0
                                                     
		tst.b	kb1up
		beq.s	.not_up
		bset	#0,d0
		sf.b	kb1up
.not_up		tst.b	kb1down
		beq.s	.not_down
		bset	#1,d0
		sf.b	kb1down
.not_down	tst.b	kb1left
		beq.s	.not_left
		bset	#2,d0
		sf.b	kb1left
.not_left	tst.b	kb1right
		beq.s	.not_right
		bset	#3,d0
		sf.b	kb1right
.not_right	tst.b	kb1fire
		beq.s	.not_fire
		bset	#4,d0
.not_fire	tst.b	kb1pickup
		beq.s	.not_pickup
		bset	#5,d0
		sf.b	kb1pickup
.not_pickup
;		tst.w	throw_grenade(a0)
;		beq.s	.no_grenade
;		move.b	#25,control_action(a0)
;		bra.s	.ret
;.no_grenade
		tst.b	0(a2,d0.w)
		beq.s	.ret
		move.b	0(a2,d0.w),control_action(a0)

.ret		rts

****************************************************************************
keyboard2
		moveq.l	#0,d0

		tst.b	kb2up
		beq.s	.not_up
		bset	#0,d0
		sf.b	kb2up
.not_up		tst.b	kb2down
		beq.s	.not_down
		bset	#1,d0
		sf.b	kb2down
.not_down	tst.b	kb2left
		beq.s	.not_left
		bset	#2,d0
		sf.b	kb2left
.not_left	tst.b	kb2right
		beq.s	.not_right
		bset	#3,d0
		sf.b	kb2right
.not_right	tst.b	kb2fire
		beq.s	.not_fire
		bset	#4,d0
.not_fire	tst.b	kb2pickup
		beq.s	.not_pickup
		bset	#5,d0
		sf.b	kb2pickup
.not_pickup
;		tst.w	throw_grenade(a0)
;		beq.s	.no_grenade
;		move.b	#25,control_action(a0)
;		bra.s	.ret
;.no_grenade
		tst.b	0(a2,d0.w)
		beq.s	.ret
		move.b	0(a2,d0.w),control_action(a0)

.ret		rts

****************************************************************************
keyboard3
		moveq.l	#0,d0

		tst.b	kb3up
		beq.s	.not_up
		bset	#0,d0
		sf.b	kb3up
.not_up		tst.b	kb3down
		beq.s	.not_down
		bset	#1,d0
		sf.b	kb3down
.not_down	tst.b	kb3left
		beq.s	.not_left
		bset	#2,d0
		sf.b	kb3left
.not_left	tst.b	kb3right
		beq.s	.not_right
		bset	#3,d0
		sf.b	kb3right
.not_right	tst.b	kb3fire
		beq.s	.not_fire
		bset	#4,d0
.not_fire	tst.b	kb3pickup
		beq.s	.not_pickup
		bset	#5,d0
		sf.b	kb3pickup
.not_pickup
;		tst.w	throw_grenade(a0)
;		beq.s	.no_grenade
;		move.b	#25,control_action(a0)
;		bra.s	.ret
;.no_grenade
		tst.b	0(a2,d0.w)
		beq.s	.ret
		move.b	0(a2,d0.w),control_action(a0)

.ret		rts

****************************************************************************
keyboard4
		moveq.l	#0,d0

		tst.b	kb4up
		beq.s	.not_up
		bset	#0,d0
		sf.b	kb4up
.not_up		tst.b	kb4down
		beq.s	.not_down
		bset	#1,d0
		sf.b	kb4down
.not_down	tst.b	kb4left
		beq.s	.not_left
		bset	#2,d0
		sf.b	kb4left
.not_left	tst.b	kb4right
		beq.s	.not_right
		bset	#3,d0
		sf.b	kb4right
.not_right	tst.b	kb4fire
		beq.s	.not_fire
		bset	#4,d0
.not_fire	tst.b	kb4pickup
		beq.s	.not_pickup
		bset	#5,d0
		sf.b	kb4pickup
.not_pickup
;		tst.w	throw_grenade(a0)
;		beq.s	.no_grenade
;		move.b	#25,control_action(a0)
;		bra.s	.ret
;.no_grenade
		tst.b	0(a2,d0.w)
		beq.s	.ret
		move.b	0(a2,d0.w),control_action(a0)

.ret		rts

****************************************************************************
mouse
		cmp.w	variables+mouse0_player(a5),d1
		bne.s	.no_action0
		tst.b	variables+mouse0_action+1(a5)
		beq.s	.no_action0
		move.b	variables+mouse0_action+1(a5),control_action(a0)
		clr.w	variables+mouse0_action(a5)
.no_action0
		cmp.w	variables+mouse1_player(a5),d1
		bne.s	.no_action1
		tst.b	variables+mouse1_action+1(a5)
		beq.s	.no_action1
		move.b	variables+mouse1_action+1(a5),control_action(a0)
		clr.w	variables+mouse1_action(a5)
.no_action1	rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT		a5=base address of fast memory (long)
;		a0=address of text
;OUTPUT:	none
;CHANGES:	a0-a3,d0-d5

simple_fill
.wait		tst.w	variables+shake_power(a5)
		bne.s	.wait

		move.l	a0,-(sp)

		move.w	#0,aud0lch+vol(a6)
		move.w	#0,aud1lch+vol(a6)
		move.w	#0,aud2lch+vol(a6)
		move.w	#0,aud3lch+vol(a6)
		clr.w	variables+old_back_sample(a5)

		BOB_INFO drawing_buffer,#views_plane_width/8,#views_plane_height,#views_num_planes,#0,#0,#views_plane_width,#views_plane_height-1,#0
		BOB_WINDOW #0,#0,#views_plane_width,#views_plane_height-1	;define clipping window

		BLIT_FILL drawing_buffer,#views_plane_width/16,#views_plane_height,#views_num_planes,#views_plane_size,#0
		WAIT_BLIT

		moveq.l	#0,d5

		moveq.l	#14,d7
.loop1		bsr	blit_fill_line
		addq.w	#2,d7
		cmpi.w	#94,d7
		ble	.loop1

		moveq.l	#119,d7
.loop2		bsr	blit_fill_line
		addq.w	#2,d7
		cmpi.w	#199,d7
		ble	.loop2

		move.l	(sp)+,a0

		move.l	#miscgfx+game_font,a2
		add.l	chip_mem_base,a2
		move.l	(a2),a2
		add.l	#miscgfx,a2
		add.l   chip_mem_base,a2
		move.w	#%0000011111,d6
		BLIT_TEXT (a0),a2,#0,#0

		cmpi.w	#old_view1,variables+last_view(a5)
		bne.s	.skip1
		move.w	#old_view2,variables+last_view(a5)
		bra.s	.skip2
.skip1		move.w	#old_view1,variables+last_view(a5)
.skip2
		rts

blit_fill_line
		movem.l	d5/d7/a0-a2,-(sp)
		move.l	#miscgfx+fill_bob,a2
		add.l	chip_mem_base,a2
		move.l  (a2),a2
		adda.l	#miscgfx,a2		;a2=address of bob structure
		add.l	chip_mem_base,a2
		lea	bob_struct_size(a2),a0	;a0=address of block structure
		move.w	#%11111,variables+redraw_temp(a5)
		jsr	blit_block		;draw warning now
		movem.l	(sp)+,d5/d7/a0-a2
		rts

fill		bsr	simple_fill
		bsr	swap_fill
		rts

swap_fill
		WAIT_BLIT
		move.w	#MODE_HELP,variables+mode(a5)
		WAIT_VBLANK
		clr.w	variables+player1+sky_flag(a5)
		clr.w	variables+player2+sky_flag(a5)
		clr.w	variables+player3+sky_flag(a5)
		clr.w	variables+player4+sky_flag(a5)
		jsr	disable_sprites
		move.l	#copperlist+clist_dma+2,a0
		add.l	a4,a0
		and.w	#~(%1000000000100000),(a0)	;sprites off

		WAIT_COPINT
		move.l	#copperlist+views_bplpt,a0
		add.l	a4,a0
		SWAP_PLANE_BUFFERS (a0),#views_plane_size,#views_num_planes
		move.l	#copperlist+scrolly_bplpt2,a0
		add.l	a4,a0
		move.l	viewing_buffer,a1
		add.l	#views_split*views_plane_width/8,a1
		SET_UP_BITPLANE_POINTERS (a0),a1,#views_plane_size,#views_num_planes

		move.l	#scrolly,a0
		add.l	a4,a0
		move.l	#scrolly+864,a1
		add.l	a4,a1
		CLR_MEM_RANGE (a0),(a1)
		clr.l	variables+scroll_head(a5)
		clr.l	variables+scroll_tail(a5)
		clr.l	variables+scroll_prt(a5)

		rts

****************************************************************************
unfill
		WAIT_COPINT
unfill2		move.w	#MODE_GAME,variables+mode(a5)

		BLIT_FILL drawing_buffer,#views_plane_width/16,#views_plane_height,#views_num_planes,#views_plane_size,#0

		move.w  #-1,variables+player1+draw_window(a5)
		move.w  #-1,variables+player2+draw_window(a5)
		move.w  #-1,variables+player3+draw_window(a5)
		move.w  #-1,variables+player4+draw_window(a5)

		st.b	variables+redraw_flag(a5)	;set redraw flag
		jsr	draw_views

		jsr	enable_sprites
		move.l	#copperlist+clist_dma+2,a0
		add.l	a4,a0
                or.w	#%1000000000100000,(a0)		;sprites on
		jsr	draw_fitness_bars

		BLIT_FILL drawing_buffer,#views_plane_width/16,#views_plane_height,#views_num_planes,#views_plane_size,#0

		move.w  #-1,variables+player1+draw_window(a5)
		move.w  #-1,variables+player2+draw_window(a5)
		move.w  #-1,variables+player3+draw_window(a5)
		move.w  #-1,variables+player4+draw_window(a5)

		st.b	variables+redraw_flag(a5)	;set redraw flag
		jsr	draw_views

		jsr	draw_fitness_bars

		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	a0-a3,d0-d5
do_help
		bsr     .help_fill

.wait
		TASKSWITCH

		bsr	scan_wbench
		bsr	scan_save_no_unfill
		tst.l   d0
		beq.s	.not_saved
		bsr	.help_fill
.not_saved
		bsr	scan_load_no_unfill
		tst.l   d0
		beq.s	.not_loaded
		bsr	.help_fill
.not_loaded
		bsr	scan_abort
		bsr	scan_quit
		bsr	scan_exit
		bsr	scan_retry
        	bsr	scan_grab

		tst.w	variables+restart_flag(a5)
		bne.s	.ok

		tst.b   help
		beq.s	.wait
		sf.b    help
.ok
		bsr	unfill

		rts

.help_fill	lea	.floppy_mesg,a0
		tst.l	os_kill
		bne.s	.dead3
		lea	.hd_mesg,a0
.dead3
		bsr	simple_fill

		move.l	#miscgfx+game_font,a2
		add.l	chip_mem_base,a2
		move.l	(a2),a2
		add.l	#miscgfx,a2
		add.l   chip_mem_base,a2
		move.w	#%0000011111,d6
		BLIT_TEXT .mesg,a2,#0,#0

	IFND	demo
		tst.w	global_vars+action_flag(a5)
		bne.s	.action
		BLIT_TEXT .abort1_mesg,a2,#0,#0
		tst.l	os_kill
		beq.s	.os_ok1
		BLIT_TEXT .saveload_mesg,a2,#0,#0
		bra	.skip_action
.os_ok1
		BLIT_TEXT .hd_saveload_mesg,a2,#0,#0
		bra.s	.skip_action
.action
		BLIT_TEXT .abort2_mesg,a2,#0,#0
		tst.l	os_kill
		beq.s	.os_ok2
		BLIT_TEXT .nosaveload_mesg,a2,#0,#0
		bra.s	.skip_action
.os_ok2
		BLIT_TEXT .hd_nosaveload_mesg,a2,#0,#0
.skip_action
	ENDC

		bsr	swap_fill

		rts

.mesg		dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29,CENTRE
		PHRASE	103

	IFD	se
		dc.b	ABSPOS,0>>8,0&$ff,18>>8,18&$ff,SETPEN,1,CENTRE
		PHRASE	104
	ELSEIF
	 IFD	demo
		dc.b	ABSPOS,0>>8,0&$ff,18>>8,18&$ff,SETPEN,1,CENTRE
		PHRASE	105
	 ELSEIF
		dc.b	ABSPOS,0>>8,0&$ff,18>>8,18&$ff,SETPEN,1,CENTRE,"HIRED GUNS"
	 ENDC
	ENDC
		dc.b	" (V",(VERSION>>24)&$ff,(VERSION>>16)&$ff,".",(VERSION>>8)&$ff,VERSION&$ff,")"
		dc.b	ABSPOS,0>>8,0&$ff,28>>8,28&$ff,SETPEN,2,CENTRE
		PHRASE	106
		dc.b	ABSPOS,0>>8,0&$ff,38>>8,38&$ff,CENTRE
		PHRASE  107

		dc.b	ABSPOS,26>>8,26&$ff,53>>8,53&$ff,SETPEN,17
		PHRASE	108
		dc.b	ABSPOS,26>>8,26&$ff,63>>8,63&$ff
		PHRASE	109
		dc.b	ABSPOS,26>>8,26&$ff,73>>8,73&$ff
		PHRASE	110
		dc.b	ABSPOS,26>>8,26&$ff,83>>8,83&$ff,SETPEN,1,"SCOTT JOHNSTON"

		dc.b	ABSPOS,128>>8,128&$ff,53>>8,53&$ff,SETPEN,17
		PHRASE	111
		dc.b	ABSPOS,128>>8,128&$ff,63>>8,63&$ff,SETPEN,1,"GRAEME ANDERSON"
		dc.b	ABSPOS,128>>8,128&$ff,73>>8,73&$ff,"SCOTT JOHNSTON"
		dc.b	ABSPOS,128>>8,128&$ff,83>>8,83&$ff,"DAVID OSBORNE"

		dc.b	ABSPOS,224>>8,224&$ff,53>>8,53&$ff,SETPEN,17
		PHRASE	112
		dc.b	ABSPOS,224>>8,224&$ff,63>>8,63&$ff,SETPEN,1,"BRIAN JOHNSTON"
		dc.b	ABSPOS,224>>8,224&$ff,73>>8,73&$ff,SETPEN,17
		PHRASE	113
		dc.b	ABSPOS,224>>8,224&$ff,83>>8,83&$ff,SETPEN,1,"STEVE HAMMOND"

		dc.b	ENDTEXT

	IFD	demo
.floppy_mesg	dc.b	ABSPOS,86>>8,86&$ff,120>>8,120&$ff,SETPEN,9,"CTRL S   ",ALIGN,SETPEN,2,"    "
		PHRASE	114
		dc.b	ABSPOS,86>>8,86&$ff,129>>8,129&$ff,SETPEN,9,"CTRL L   ",ALIGN,SETPEN,2,"    "
		PHRASE	115
		dc.b	ABSPOS,86>>8,86&$ff,156>>8,156&$ff,SETPEN,9,"CTRL R   ",ALIGN,SETPEN,2,"    "
		PHRASE	116
		dc.b	ABSPOS,86>>8,86&$ff,147>>8,147&$ff,SETPEN,9,"CTRL F   ",ALIGN,SETPEN,2,"    "
		PHRASE	117
		dc.b	ABSPOS,86>>8,86&$ff,192>>8,192&$ff,SETPEN,9,"HELP     ",ALIGN,SETPEN,2,"    "
		PHRASE  118
		dc.b	ENDTEXT

.hd_mesg	dc.b	ABSPOS,86>>8,86&$ff,120>>8,120&$ff,SETPEN,9,"CTRL S   ",ALIGN,SETPEN,2,"    "
		PHRASE	114
		dc.b	ABSPOS,86>>8,86&$ff,129>>8,129&$ff,SETPEN,9,"CTRL L   ",ALIGN,SETPEN,2,"    "
		PHRASE	115
		dc.b	ABSPOS,86>>8,86&$ff,156>>8,156&$ff,SETPEN,9,"CTRL R   ",ALIGN,SETPEN,2,"    "
		PHRASE	116
		dc.b	ABSPOS,86>>8,86&$ff,183>>8,183&$ff,SETPEN,9,"CTRL ESC ",ALIGN,SETPEN,2,"    "
		PHRASE	119
		dc.b	ABSPOS,86>>8,86&$ff,138>>8,138&$ff,SETPEN,9,"CTRL W   ",ALIGN,SETPEN,2,"    "
		PHRASE	120
		dc.b	ABSPOS,86>>8,86&$ff,147>>8,147&$ff,SETPEN,9,"CTRL F   ",ALIGN,SETPEN,2,"    "
		PHRASE	117
		dc.b	ABSPOS,86>>8,86&$ff,192>>8,192&$ff,SETPEN,9,"HELP     ",ALIGN,SETPEN,2,"    "
		PHRASE  118
		dc.b	ENDTEXT
	ELSEIF

.saveload_mesg	dc.b	ABSPOS,86>>8,86&$ff,120>>8,120&$ff,SETPEN,9,"CTRL S   ",ALIGN,SETPEN,2,"    "
		PHRASE	114
		dc.b	ABSPOS,86>>8,86&$ff,129>>8,129&$ff,SETPEN,9,"CTRL L   ",ALIGN,SETPEN,2,"    "
		PHRASE	115
		dc.b	ABSPOS,86>>8,86&$ff,147>>8,147&$ff,SETPEN,9,"CTRL F   ",ALIGN,SETPEN,2,"    "
		PHRASE	117
		dc.b	ENDTEXT

.nosaveload_mesg
		dc.b	ABSPOS,86>>8,86&$ff,147>>8,147&$ff,SETPEN,9,"CTRL F   ",ALIGN,SETPEN,2,"    "
		PHRASE	117
		dc.b	ENDTEXT

.floppy_mesg	dc.b	ABSPOS,86>>8,86&$ff,192>>8,192&$ff,SETPEN,9,"HELP     ",ALIGN,SETPEN,2,"    "
		PHRASE	121
		dc.b	ABSPOS,86>>8,86&$ff,156>>8,156&$ff,SETPEN,9,"CTRL R   ",ALIGN,SETPEN,2,"    "
		PHRASE	122
		dc.b	ENDTEXT

.hd_saveload_mesg
		dc.b	ABSPOS,86>>8,86&$ff,120>>8,120&$ff,SETPEN,9,"CTRL S   ",ALIGN,SETPEN,2,"    "
		PHRASE	114
		dc.b	ABSPOS,86>>8,86&$ff,129>>8,129&$ff,SETPEN,9,"CTRL L   ",ALIGN,SETPEN,2,"    "
		PHRASE	115
		dc.b	ABSPOS,86>>8,86&$ff,147>>8,147&$ff,SETPEN,9,"CTRL F   ",ALIGN,SETPEN,2,"    "
		PHRASE	117
		dc.b	ABSPOS,86>>8,86&$ff,138>>8,138&$ff,SETPEN,9,"CTRL W   ",ALIGN,SETPEN,2,"    "
		PHRASE	120
		dc.b	ENDTEXT

.hd_nosaveload_mesg
		dc.b	ABSPOS,86>>8,86&$ff,147>>8,147&$ff,SETPEN,9,"CTRL F   ",ALIGN,SETPEN,2,"    "
		PHRASE	117
		dc.b	ABSPOS,86>>8,86&$ff,138>>8,138&$ff,SETPEN,9,"CTRL W   ",ALIGN,SETPEN,2,"    "
		PHRASE	120
		dc.b	ENDTEXT

.hd_mesg	dc.b	ABSPOS,86>>8,86&$ff,192>>8,192&$ff,SETPEN,9,"HELP     ",ALIGN,SETPEN,2,"    "
		PHRASE	118
		dc.b	ABSPOS,86>>8,86&$ff,156>>8,156&$ff,SETPEN,9,"CTRL R   ",ALIGN,SETPEN,2,"    "
		PHRASE	116
		dc.b	ABSPOS,86>>8,86&$ff,183>>8,183&$ff,SETPEN,9,"CTRL ESC ",ALIGN,SETPEN,2,"    "
		PHRASE	119
		dc.b	ENDTEXT

.abort1_mesg	dc.b	ABSPOS,86>>8,86&$ff,165>>8,165&$ff,SETPEN,9,"CTRL A   ",ALIGN,SETPEN,2,"    "
		PHRASE	123
		dc.b	ABSPOS,86>>8,86&$ff,174>>8,174&$ff,SETPEN,9,"CTRL Q   ",ALIGN,SETPEN,2,"    "
		PHRASE	124
		dc.b	ENDTEXT

.abort2_mesg	dc.b	ABSPOS,86>>8,86&$ff,174>>8,174&$ff,SETPEN,9,"CTRL Q   ",ALIGN,SETPEN,2,"    "
		PHRASE	124
		dc.b	ENDTEXT
	ENDC

                even

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	a0-a3,d0-d5

	IFND	SKIPCHECK

columns		dc.w	266,268,270,272,130,132

do_pass
		lea	.mesg,a0
		bsr	fill




		lea	codes1,a0
		move.w	(a0)+,d0		;get number of codes
		subq.w	#1,d0
		move.w	timer,d2
		andi.w	#$ff,d2

.find_again	movem.l	d0/a0,-(sp)
.find		tst.w	d2
		beq.s	.found
		subq.w	#1,d2

		move.b	(a0),d1
		ext.w	d1
		add.w	d1,a0
		dbf	d0,.find
		movem.l	(sp)+,d0/a0
		bra.s	.find_again

.found		movem.l	(sp)+,d0/a1

		add.w	#1,a0

		moveq.l	#0,d0
		move.b	(a0)+,d0
		lsl.w	#8,d0
		move.b	(a0)+,d0
		ITOA_3U	d0,.star
		moveq.l	#0,d0
		move.b	(a0)+,d0
		lsl.w	#1,d0
		move.w	columns(pc,d0.w),d0
		move.w	d0,-(sp)
		move.b	d0,.phrase+1
		lsr.w	#8,d0
		move.b	d0,.phrase
		move.w	(sp)+,d0
		addi.w	#1,d0
		move.b	d0,.phrase2+1
		lsr.w	#8,d0
		move.b	d0,.phrase2

		move.l	a0,-(sp)
		move.l	#miscgfx+game_font,a2
		add.l	chip_mem_base,a2
		move.l	(a2),a2
		add.l	#miscgfx,a2
		add.l	chip_mem_base,a2
		move.w	#%0000011111,d6
		BLIT_TEXT .code,a2,#0,#0
		move.l	(sp)+,a0





		move.l	a0,.code_store

.retry		move.w	#170,d7
		lea	code1(a5),a0
		bsr	delete_text

		bsr	enter_name2
		BOB_INFO viewing_buffer,#views_plane_width/8,#views_plane_height,#views_num_planes,#0,#0,#views_plane_width,#views_plane_height-1,#0
		BOB_WINDOW #0,#0,#views_plane_width,#views_plane_height-1	;define clipping window

		lea	code1(a5),a1
.loop_start	move.b	(a1),d0
		beq.s	.wrong
		cmp.b	#" ",d0
		bne.s	.found_start
		add.w	#1,a1
		bra.s	.loop_start
.found_start
		move.l	.code_store,a0
		move.l	#%10110010010011010101101001110101,d1
.loop_compare	move.b	(a0)+,d0
		beq.s	.correct
		eor.b	d1,d0
		ror.l	#8,d1
		cmp.b	(a1)+,d0
		bne.s	.wrong
		bra.s	.loop_compare


.wrong		BLIT_TEXT .wrong_text,a2,#0,#0
		bra	.retry

.correct	INITIALISE_KEYS	#game_key_list
		clr.w	save_method
		bsr	unfill
		rts

.code_store	dc.l	0

.mesg		dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	125
		dc.b	NEWLINE

		dc.b	ABSPOS,0>>8,0&$ff,18>>8,18&$ff,SETPEN,1
		PHRASE	126
		dc.b	NEWLINE
		dc.b	ABSPOS,0>>8,0&$ff,28>>8,28&$ff,SETPEN,1
		PHRASE	127
		dc.b	NEWLINE
		dc.b	ABSPOS,0>>8,0&$ff,38>>8,38&$ff,SETPEN,1
		PHRASE	128
		dc.b	NEWLINE
		dc.b	ABSPOS,0>>8,0&$ff,48>>8,48&$ff,SETPEN,1
		PHRASE	129
		dc.b	NEWLINE
		dc.b	ENDTEXT

.code		dc.b	ABSPOS,0>>8,0&$ff,135>>8,135&$ff,SETPEN,9
		dc.b	PHRASEBOOK
.phrase		dc.b	0,0
		dc.b	" ",SETPEN,1
.star		dc.b	"000"
		dc.b	PHRASEBOOK
.phrase2	dc.b	0,0

		dc.b	ABSPOS,55>>8,55&$ff,170>>8,170&$ff,SETPEN,2
		PHRASE	134
		dc.b	ENDTEXT

.wrong_text	dc.b	ABSPOS,0>>8,0&$ff,155>>8,155&$ff,SETPEN,1
		PHRASE	135
		dc.b	ENDTEXT

		even

codes1		incbin	pass1

	ENDC

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	a0-a3,d0-d5

do_campaigncomplete
	IFD	demo
		lea	.mesg,a0
		bsr	fill
.wait
		TASKSWITCH
		bsr	scan_wbench
		bsr	scan_load_no_unfill
		tst.l   d0
		beq.s	.not_loaded
		lea	.mesg,a0
		bsr	fill
.not_loaded
		bsr	scan_quit
		bsr	scan_exit
		bsr	scan_retry
        	bsr	scan_grab

		tst.w	variables+restart_flag(a5)
		beq.s	.wait

		rts

.mesg		dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	136
		dc.b	ABSPOS,100>>8,100&$ff,22>>8,22&$ff,SETPEN,2
		PHRASE	137
		dc.b	ABSPOS,100>>8,100&$ff,32>>8,32&$ff
		PHRASE	138
		dc.b	ABSPOS,100>>8,100&$ff,42>>8,42&$ff
		PHRASE	139
		dc.b	ABSPOS,100>>8,100&$ff,52>>8,52&$ff
		PHRASE	140
		dc.b	ABSPOS,100>>8,100&$ff,62>>8,62&$ff
		PHRASE	141
		dc.b	ABSPOS,100>>8,100&$ff,72>>8,72&$ff
		PHRASE	142
		dc.b	ABSPOS,100>>8,100&$ff,82>>8,82&$ff
		PHRASE	143

		dc.b	ABSPOS,86>>8,86&$ff,156>>8,156&$ff,SETPEN,9,"CTRL R   ",ALIGN,SETPEN,2," "
		PHRASE	116
		dc.b	ABSPOS,86>>8,86&$ff,174>>8,174&$ff,SETPEN,9,"CTRL Q   ",ALIGN,SETPEN,2," "
		PHRASE	124
		dc.b	ABSPOS,86>>8,86&$ff,183>>8,183&$ff,SETPEN,9,"CTRL ESC ",ALIGN,SETPEN,2," "
		PHRASE	114

		dc.b	ENDTEXT

                even
	ELSEIF
		move.w	#RESTART_MAP,variables+restart_flag(a5)

		lea	variables+player1(a5),a1
		lea	global_vars+player1_stats(a5),a2
		lea	global_vars+orig_player1_stats(a5),a3
		bsr	.copy_stats

		lea	variables+player2(a5),a1
		lea	global_vars+player2_stats(a5),a2
		lea	global_vars+orig_player2_stats(a5),a3
		bsr	.copy_stats

		lea	variables+player3(a5),a1
		lea	global_vars+player3_stats(a5),a2
		lea	global_vars+orig_player3_stats(a5),a3
		bsr	.copy_stats

		lea	variables+player4(a5),a1
		lea	global_vars+player4_stats(a5),a2
		lea	global_vars+orig_player4_stats(a5),a3
		bsr	.copy_stats

		cmpi.w	#4,variables+nukes_armed(a5)
		bne.s	.not_complete
		move.w	#RESTART_END,variables+restart_flag(a5)
.not_complete

		rts

.copy_stats	movem.l	a1-a3,-(sp)

		move.w	#stats_struct_size-1,d0
.loop		move.b	(a2)+,(a3)+
		dbf	d0,.loop

		move.l	inven_using(a1),(a3)+

		move.w	#inven_size-1,d0
		lea	inven_store(a1),a1
.loop2		move.l	(a1)+,(a3)+
		dbf	d0,.loop2

		movem.l	(sp)+,a1-a3
		rts
	ENDC

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	a0-a3,d0-d5

do_timeup
		lea	.mesg,a0
		bsr	fill

.wait
		tst.l	os_kill
		bne.s	.dead2
		jsr	temp_restore_system
		WAIT_VBLANK
		jsr	temp_take_system
.dead2
		bsr	scan_wbench
		bsr	scan_load_no_unfill
		tst.l   d0
		beq.s	.not_loaded
		lea	.mesg,a0
		bsr	fill
.not_loaded
		bsr	scan_quit
		bsr	scan_exit
		bsr	scan_retry
        	bsr	scan_grab

		tst.w	variables+restart_flag(a5)
		beq.s	.wait

		rts

.mesg		dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	136
		dc.b	ABSPOS,100>>8,100&$ff,22>>8,22&$ff,SETPEN,2
		PHRASE	144
		dc.b	ABSPOS,100>>8,100&$ff,32>>8,32&$ff
		PHRASE	145
		dc.b	ABSPOS,100>>8,100&$ff,42>>8,42&$ff
		PHRASE	146
		dc.b	ABSPOS,100>>8,100&$ff,52>>8,52&$ff
		PHRASE	147
		dc.b	ABSPOS,100>>8,100&$ff,62>>8,62&$ff
		PHRASE	148
		dc.b	ABSPOS,100>>8,100&$ff,72>>8,72&$ff
		PHRASE	149
		dc.b	ABSPOS,100>>8,100&$ff,82>>8,82&$ff
		PHRASE	150

		dc.b	ABSPOS,86>>8,86&$ff,156>>8,156&$ff,SETPEN,9,"CTRL R   ",ALIGN,SETPEN,2," "
		PHRASE	116
		dc.b	ABSPOS,86>>8,86&$ff,174>>8,174&$ff,SETPEN,9,"CTRL Q   ",ALIGN,SETPEN,2," "
		PHRASE	124
		dc.b	ABSPOS,86>>8,86&$ff,183>>8,183&$ff,SETPEN,9,"CTRL ESC ",ALIGN,SETPEN,2," "
		PHRASE	119

		dc.b	ENDTEXT

                even

****************************************************************************
****************************************************************************
****************************************************************************
friendly_wait_for_input
		clr.w	last_key
.wait
		TASKSWITCH
		jsr	test_input
		tst.l	d0
		beq.s	.wait
		rts

****************************************************************************

;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	a0-a3,d0-d5

do_actioncomplete
		bsr     .action_fill
		clr.w	last_key

	IFD	demo
		bsr	friendly_wait_for_input
		move.w	#RESTART_MAP,variables+restart_flag(a5)
	ELSEIF
.wait
		TASKSWITCH

		bsr	scan_quit
		bsr	scan_exit
		bsr	scan_retry
        	bsr	scan_grab

		tst.w	variables+restart_flag(a5)
		beq.s	.wait
        ENDC
		rts

.action_fill	lea	.mesg,a0
		bsr	simple_fill

		move.l	#miscgfx+game_font,a2
		add.l	chip_mem_base,a2
		move.l	(a2),a2
		add.l	#miscgfx,a2
		add.l   chip_mem_base,a2
		move.w	#%1011111,d6

	IFD	demo
		BLIT_TEXT .mesg3,a2,#144,#32
	ELSEIF
		BLIT_TEXT .mesg2,a2,#144,#32
	ENDC

		TEXT_COLOUR (a2),1,0,0,0,1

		move.l	variables+winner_glo(a5),a3
		BLIT_TEXT player_name(a3),a2,#119,#32
		ITOA_WU experience(a3),.exp(pc)
		BLIT_TEXT .exp,a2,#174,#32

		move.w	#62,d7

		lea	global_vars+player1_stats(a5),a3
		cmp.l	variables+winner_glo(a5),a3
		beq.s	.not_name1
		BLIT_TEXT player_name(a3),a2,#119,d7
		ITOA_WU experience(a3),.exp(pc)
		BLIT_TEXT .exp,a2,#174,d7
		add.w	#10,d7
.not_name1
		lea	global_vars+player2_stats(a5),a3
		cmp.l	variables+winner_glo(a5),a3
		beq.s	.not_name2
		BLIT_TEXT player_name(a3),a2,#119,d7
		ITOA_WU experience(a3),.exp(pc)
		BLIT_TEXT .exp,a2,#174,d7
		add.w	#10,d7
.not_name2
		lea	global_vars+player3_stats(a5),a3
		cmp.l	variables+winner_glo(a5),a3
		beq.s	.not_name3
		BLIT_TEXT player_name(a3),a2,#119,d7
		ITOA_WU experience(a3),.exp(pc)
		BLIT_TEXT .exp,a2,#174,d7
		add.w	#10,d7
.not_name3
		tst.b	variables+player4+control_method(a5)
		beq	.no_pl4
		lea	global_vars+player4_stats(a5),a3
		cmp.l	variables+winner_glo(a5),a3
		beq.s	.not_name4
		BLIT_TEXT player_name(a3),a2,#119,d7
		ITOA_WU experience(a3),.exp(pc)
		BLIT_TEXT .exp,a2,#174,d7
.no_pl4
.not_name4
		bsr	swap_fill

		rts

.mesg		dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	136
		dc.b	ABSPOS,100>>8,100&$ff,22>>8,22&$ff,SETPEN,2
		PHRASE	151
		dc.b	ABSPOS,100>>8,100&$ff,42>>8,42&$ff
		PHRASE	152
		dc.b	ABSPOS,100>>8,100&$ff,52>>8,52&$ff
		PHRASE	153
		dc.b	ENDTEXT

.mesg2
		dc.b	ABSPOS,86>>8,86&$ff,128>>8,128&$ff,SETPEN,9,"CTRL R     ",ALIGN,SETPEN,2,"    "
		PHRASE	116
		dc.b	ABSPOS,86>>8,86&$ff,138>>8,138&$ff,SETPEN,9,"CTRL Q     ",ALIGN,SETPEN,2,"    "
		PHRASE	124
		dc.b	ABSPOS,86>>8,86&$ff,148>>8,148&$ff,SETPEN,9,"CTRL ESC   ",ALIGN,SETPEN,2,"    "
		PHRASE	119
		dc.b	ENDTEXT

.mesg3		dc.b	ABSPOS,86>>8,86&$ff,133>>8,133&$ff,SETPEN,9
		PHRASE	154
		dc.b	ALIGN,SETPEN,2,"    "
		PHRASE	155
		dc.b	ENDTEXT

.exp		dc.b	"        ",ENDTEXT

                even

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	a0-a3,d0-d5

do_save_game
	IFND	savegame
		rts
	ELSEIF
		INITIALISE_KEYS	#help_key_list

		lea	.mesg,a0
		bsr	simple_fill

		move.l	#miscgfx+game_font,a2
		add.l	a4,a2
		move.l	(a2),a2
		add.l	#miscgfx,a2
		add.l	a4,a2
		move.w	#%0000011111,d6
		tst.l	os_kill
		bne.s	.not_hard
		BLIT_TEXT .mesg_hard,a2,#0,#0
.not_hard
		bsr	swap_fill

		move.w	#MODE_SAVING,save_mode
		clr.w	save_method
		jsr	wait_for_no_input

.wait_device
		TASKSWITCH

		bsr	scan_ram
		bsr	scan_floppy
		tst.l	os_kill
		bne.s	.dead
		bsr	scan_hard
.dead		bsr	scan_whoops

		tst.w	save_method
		beq.s	.wait_device

		bsr	save_insert
.redo_position	bsr	save_position
		bsr	save_doing
		tst.w	d0
		bne.s	.redo_position
		bsr	save_done

		rts

.mesg		dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	156
		dc.b	ABSPOS,0>>8,0&$ff,38>>8,38&$ff,SETPEN,1
		PHRASE	157
		dc.b	ABSPOS,0>>8,0&$ff,48>>8,48&$ff,SETPEN,1
		PHRASE	158
		dc.b	ABSPOS,96>>8,96&$ff,133>>8,133&$ff,SETPEN,9,"F1        ",ALIGN,SETPEN,2
		PHRASE	159
		dc.b	ABSPOS,96>>8,96&$ff,143>>8,143&$ff,SETPEN,9,"F2        ",ALIGN,SETPEN,2
		PHRASE	160
		dc.b	ABSPOS,96>>8,96&$ff,173>>8,173&$ff,SETPEN,9,"ESC       ",ALIGN,SETPEN,2
		PHRASE	161
		dc.b	ENDTEXT
                even

.mesg_hard	dc.b	ABSPOS,96>>8,96&$ff,153>>8,153&$ff,SETPEN,9,"F3        ",ALIGN,SETPEN,2
		PHRASE	162
		dc.b	ENDTEXT
                even

scan_ram	tst.b	helpf1
		beq.s	.end_ram
		move.w	#SAVE_TO_RAM,save_method
		move.w	#SAVE_TO_RAM,save_device
		sf.b	helpf1
.end_ram	rts

scan_floppy	tst.b	helpf2
		beq.s	.end_floppy
		move.w	#SAVE_TO_FLOPPY,save_method
		move.w	#SAVE_TO_FLOPPY,save_device
		sf.b	helpf2
.end_floppy	rts

scan_hard	tst.b	helpf3
		beq.s	.end_hard
		move.w	#SAVE_TO_HARD,save_method
		move.w	#SAVE_TO_HARD,save_device
		sf.b	helpf3
.end_hard	rts

scan_whoops	tst.b   helpwhoops
		beq.s	.end_whoops
		move.w	#ABANDON_SAVE,save_method
		sf.b    helpwhoops
.end_whoops	rts

	ENDC

****************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	a0-a3,d0-d5

do_load_game
	IFND	savegame
		rts
	ELSEIF
		INITIALISE_KEYS	#help_key_list

		lea	.mesg,a0
		bsr	simple_fill

		move.l	#miscgfx+game_font,a2
		add.l	chip_mem_base,a2
		move.l	(a2),a2
		add.l	#miscgfx,a2
		add.l   chip_mem_base,a2
		move.w	#%0000011111,d6
		tst.l	os_kill
		bne.s	.not_hard
		BLIT_TEXT .mesg_hard,a2,#0,#0
.not_hard
		bsr	swap_fill

		move.w	#MODE_LOADING,save_mode
		clr.w	save_method
		jsr	wait_for_no_input

.wait_device
		TASKSWITCH

		bsr	scan_ram
		bsr	scan_floppy
		tst.l	os_kill
		bne.s	.dead
		bsr	scan_hard
.dead
		bsr	scan_whoops

		tst.w	save_method
		beq.s	.wait_device

		bsr	load_insert
		bsr	load_position
		bsr	load_doing
		bsr	load_done

		cmpi.w	#ABANDON_SAVE,save_method
		bne.s	.not_quit
		cmpi.w	#RESTART_LOAD,variables+restart_flag(a5)
		bne.s	.not_quit
		tst.l	os_kill
		beq.s	.not_dead
		move.w	#1,d0
		jsr	get_disk
.not_dead	move.w	#RESTART_QUIT,variables+restart_flag(a5)
.not_quit
		rts

.mesg
		dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	163
		dc.b	ABSPOS,0>>8,0&$ff,38>>8,38&$ff,SETPEN,1
		PHRASE	164
		dc.b	ABSPOS,0>>8,0&$ff,48>>8,48&$ff,SETPEN,1
		PHRASE	165
		dc.b	ABSPOS,96>>8,96&$ff,133>>8,133&$ff,SETPEN,9,"F1        ",ALIGN,SETPEN,2
		PHRASE	159
		dc.b	ABSPOS,96>>8,96&$ff,143>>8,143&$ff,SETPEN,9,"F2        ",ALIGN,SETPEN,2
		PHRASE	160
		dc.b	ABSPOS,96>>8,96&$ff,173>>8,173&$ff,SETPEN,9,"ESC       ",ALIGN,SETPEN,2
		PHRASE	166
		dc.b	ENDTEXT
                even

.mesg_hard
		dc.b	ABSPOS,96>>8,96&$ff,153>>8,153&$ff,SETPEN,9,"F3        ",ALIGN,SETPEN,2
		PHRASE	162
		dc.b	ENDTEXT
                even

****************************************************************************
save_insert
		cmpi.w	#ABANDON_SAVE,save_method
		beq.s	.quit

		cmpi.w	#SAVE_TO_FLOPPY,save_method
		bne.s	.quit

		jsr	wait_for_no_input
		lea	.mesg,a0
		bsr	fill

		clr.w	last_key
.wait
		TASKSWITCH

		jsr	test_input

		move.b	last_key,d1

		cmpi.b	#$45,d1
		bne.s	.not_abort
		sf.b	helpwhoops
		move.w	#ABANDON_SAVE,save_method
.not_abort
		tst.l	d0
		beq.s	.wait

.quit		rts

.mesg		dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	156
		dc.b	ABSPOS,0>>8,0&$ff,38>>8,38&$ff,SETPEN,1
		PHRASE	167
		dc.b	ABSPOS,0>>8,0&$ff,48>>8,48&$ff,SETPEN,1
		PHRASE	168
		dc.b	ABSPOS,0>>8,0&$ff,58>>8,58&$ff,SETPEN,1
		PHRASE	169
		dc.b	ABSPOS,0>>8,0&$ff,68>>8,68&$ff,SETPEN,1
		PHRASE	170
		dc.b	ABSPOS,96>>8,96&$ff,133>>8,133&$ff,SETPEN,9,"ESC       ",ALIGN,SETPEN,2,"      "
		PHRASE	161
		dc.b	ABSPOS,96>>8,96&$ff,143>>8,143&$ff,SETPEN,9
		PHRASE	171
		dc.b	ALIGN,SETPEN,2,"   "
		PHRASE	172
		dc.b	ENDTEXT
                even

****************************************************************************
load_insert
		cmpi.w	#ABANDON_SAVE,save_method
		beq.s	.quit

		cmpi.w	#SAVE_TO_FLOPPY,save_method
		bne.s	.quit

		jsr	wait_for_no_input
		lea	.mesg,a0
		bsr	fill

		clr.w	last_key
.wait
		TASKSWITCH

		jsr	test_input

		move.b	last_key,d1

		cmpi.b	#$45,d1
		bne.s	.not_abort
		sf.b	helpwhoops
		move.w	#ABANDON_SAVE,save_method
.not_abort
		tst.l	d0
		beq.s	.wait

.quit		rts

.mesg		dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	163
		dc.b	ABSPOS,0>>8,0&$ff,38>>8,38&$ff,SETPEN,1
		PHRASE	173
		dc.b	ABSPOS,0>>8,0&$ff,48>>8,48&$ff,SETPEN,1
		PHRASE	174
		dc.b	ABSPOS,96>>8,96&$ff,133>>8,133&$ff,SETPEN,9,"ESC       ",ALIGN,SETPEN,2,"      "
		PHRASE	166
		dc.b	ABSPOS,96>>8,96&$ff,143>>8,143&$ff,SETPEN,9
		PHRASE	171
		dc.b	ALIGN,SETPEN,2,"   "
		PHRASE	172
		dc.b	ENDTEXT
                even

****************************************************************************

format_verify
		cmpi.w	#ABANDON_SAVE,save_method
		beq.s	.quit

		cmpi.w	#SAVE_TO_FLOPPY,save_device
		bne.s	.quit

		jsr	wait_for_no_input
		lea	.mesg,a0
		bsr	fill

		clr.w	last_key
.wait
		TASKSWITCH

		jsr	test_input

		move.b	last_key,d1

		cmpi.b	#$45,d1
		bne.s	.not_abort
		sf.b	helpwhoops
		move.w	#ABANDON_SAVE,save_method
.not_abort
		tst.l	d0
		beq.s	.wait

.quit		rts

.mesg		dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	175
		dc.b	ABSPOS,0>>8,0&$ff,38>>8,38&$ff,SETPEN,1
		PHRASE	176
		dc.b	ABSPOS,0>>8,0&$ff,48>>8,48&$ff,SETPEN,1
		PHRASE	177
		dc.b	ABSPOS,0>>8,0&$ff,58>>8,58&$ff,SETPEN,2
		PHRASE	178
		dc.b	ABSPOS,0>>8,0&$ff,68>>8,68&$ff,SETPEN,2
		PHRASE	179
		dc.b	ABSPOS,96>>8,96&$ff,133>>8,133&$ff,SETPEN,9,"ESC       ",ALIGN,SETPEN,2,"      "
		PHRASE	180
		dc.b	ABSPOS,96>>8,96&$ff,143>>8,143&$ff,SETPEN,9
		PHRASE	171
		dc.b	ALIGN,SETPEN,2,"   "
		PHRASE	172
		dc.b	ENDTEXT
                even

****************************************************************************

PRINT_BANK	MACRO
		lea	.posn_text,a1
		cmpi.w	#BANK_USED,dir_bank\1+bank_used(a3)
		beq.s	.used\1
		lea	empty_text,a0
		bra.s	.skip_used\1
.used\1		lea	dir_bank\1+bank_name(a3),a0
.skip_used\1	bsr	copy_text
		move.b	#(128+10*(\1-1))>>8,.posn_val1
		move.b	#(128+10*(\1-1))&$ff,.posn_val1+1
		move.b	#"0"+\1,.posn_val2
		move.b	#"0"+\1,.posn_val3
		BLIT_TEXT .posn,a2,#0,#0
		ENDM

save_position
		cmpi.w	#ABANDON_SAVE,save_method
		beq	.quit
		cmpi.w	#SAVE_TO_RAM,save_method
		bne	.not_ram q
		tst.l   ram_disk_base
		beq.s	.ram_error
		move.l	ram_disk_size,d0
		cmp.l	#bank_sector_size*512,d0
		bge	.quit
.ram_error	bsr	no_ram_error
		bra	.quit
.not_ram
		jsr	wait_for_no_input

		move.l	#dir_buffer,a0
		add.l	a5,a0			;data
		bsr	validate_directory
		cmpi.w	#ABANDON_SAVE,save_method
		beq	.quit
		tst.w	d0
		bne	save_position

		lea	.mesg,a0
		bsr	simple_fill

		move.l	#miscgfx+game_font,a2
		add.l	chip_mem_base,a2
		move.l	(a2),a2
		add.l	#miscgfx,a2
		add.l   chip_mem_base,a2
		move.w	#%0000011111,d6

		move.l	#dir_buffer,a3
		add.l	a5,a3

		PRINT_BANK 1
		PRINT_BANK 2
		PRINT_BANK 3
		PRINT_BANK 4
		PRINT_BANK 5

		bsr	swap_fill

		clr.w	last_key

.wait
		TASKSWITCH
		jsr	test_input
		moveq.l	#0,d1
		move.b	last_key,d1

		cmpi.b	#$50,d1
		bne.s	.not_f1
		sf.b	helpf1
		lea	dir_bank1(a3),a0
		bra.s	.ok
.not_f1
		cmpi.b	#$51,d1
		bne.s	.not_f2
		sf.b	helpf2
		lea	dir_bank2(a3),a0
		bra.s	.ok
.not_f2
		cmpi.b	#$52,d1
		bne.s	.not_f3
		sf.b	helpf3
		lea	dir_bank3(a3),a0
		bra.s	.ok
.not_f3
		cmpi.b	#$53,d1
		bne.s	.not_f4
		sf.b	helpf4
		lea	dir_bank4(a3),a0
		bra.s	.ok
.not_f4
		cmpi.b	#$54,d1
		bne.s	.not_f5
		lea	dir_bank5(a3),a0
		bra.s	.ok
.not_f5
		cmpi.b	#$45,d1
		bne.s	.not_abort
		sf.b	helpwhoops
		move.w	#ABANDON_SAVE,save_method
		bra.s	.quit
.not_abort
		bra	.wait
.ok		sub.w	#$50,d1
		move.w	d1,position_chosen
		move.l	a0,bank_chosen

		bsr	enter_name

.quit		rts

.reformat	bsr	format_disk
		bra	save_position

.mesg		dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,1
		PHRASE	156
		dc.b	ABSPOS,0>>8,0&$ff,33>>8,33&$ff,SETPEN,1
		PHRASE	181
		dc.b	ABSPOS,0>>8,0&$ff,43>>8,43&$ff,SETPEN,1
		PHRASE	182
		dc.b	ABSPOS,0>>8,0&$ff,53>>8,53&$ff,SETPEN,1
		PHRASE	183
		dc.b	ABSPOS,0>>8,0&$ff,63>>8,63&$ff,SETPEN,2
		PHRASE	184
		dc.b	ABSPOS,0>>8,0&$ff,73>>8,73&$ff,SETPEN,2
		PHRASE	185
		dc.b	ABSPOS,32>>8,32&$ff,188>>8,188&$ff,SETPEN,9,"ESC   ",ALIGN,SETPEN,2," "
		PHRASE	186
		dc.b	ENDTEXT
                even

.posn		dc.b	ABSPOS,32>>8,32&$ff
.posn_val1	dc.b	128>>8,128&$ff,SETPEN,9,"F"
.posn_val2	dc.b	"1    ",ALIGN,SETPEN,2," "
		PHRASE	187
.posn_val3	dc.b	"1    ",ALIGN,SETPEN,1
.posn_text	dc.b	ENDTEXT,"                                "
		dc.b	ENDTEXT
                even

empty_text
		PHRASE	188
		dc.b	ENDTEXT
                even

****************************************************************************
load_position
		cmpi.w	#ABANDON_SAVE,save_method
		beq	.quit
		cmpi.w	#SAVE_TO_RAM,save_method
		bne	.not_ram
		tst.l   ram_disk_base
		beq.s	.ram_error
		move.l	ram_disk_size,d0
		cmp.l	#bank_sector_size*512,d0
		bge	.quit
.ram_error	bsr	no_ram_error
		bra	.quit
.not_ram
		jsr	wait_for_no_input

		move.l	#dir_buffer,a0
		add.l	a5,a0			;data
		bsr	validate_directory
		cmpi.w	#ABANDON_SAVE,save_method
		beq	.quit
		tst.w	d0
		bne	save_position

		lea	.mesg,a0
		bsr	simple_fill

		move.l	#miscgfx+game_font,a2
		add.l	chip_mem_base,a2
		move.l	(a2),a2
		add.l	#miscgfx,a2
		add.l   chip_mem_base,a2
		move.w	#%0000011111,d6

		move.l	#dir_buffer,a3
		add.l	a5,a3

		PRINT_BANK 1
		PRINT_BANK 2
		PRINT_BANK 3
		PRINT_BANK 4
		PRINT_BANK 5

		bsr	swap_fill

		clr.w	last_key

.wait
		TASKSWITCH
		jsr	test_input
		moveq.l	#0,d1
		move.b	last_key,d1

		cmpi.b	#$50,d1
		bne.s	.not_f1
		sf.b	helpf1
		cmpi.w	#BANK_UNUSED,dir_bank1+bank_used(a3)
		beq.s	.not_f1
		lea	dir_bank1(a3),a0
		bra.s	.ok
.not_f1
		cmpi.b	#$51,d1
		bne.s	.not_f2
		sf.b	helpf2
		cmpi.w	#BANK_UNUSED,dir_bank2+bank_used(a3)
		beq.s	.not_f2
		lea	dir_bank2(a3),a0
		bra.s	.ok
.not_f2
		cmpi.b	#$52,d1
		bne.s	.not_f3
		sf.b	helpf3
		cmpi.w	#BANK_UNUSED,dir_bank3+bank_used(a3)
		beq.s	.not_f3
		lea	dir_bank3(a3),a0
		bra.s	.ok
.not_f3
		cmpi.b	#$53,d1
		bne.s	.not_f4
		sf.b	helpf4
		cmpi.w	#BANK_UNUSED,dir_bank4+bank_used(a3)
		beq.s	.not_f4
		lea	dir_bank4(a3),a0
		bra.s	.ok
.not_f4
		cmpi.b	#$54,d1
		bne.s	.not_f5
		cmpi.w	#BANK_UNUSED,dir_bank5+bank_used(a3)
		beq.s	.not_f5
		lea	dir_bank5(a3),a0
		bra.s	.ok
.not_f5
		cmpi.b	#$45,d1
		bne.s	.not_abort
		sf.b	helpwhoops
		move.w	#ABANDON_SAVE,save_method
		bra.s	.quit
.not_abort
		bra	.wait
.ok		sub.w	#$50,d1
		move.w	d1,position_chosen
		move.l	a0,bank_chosen

.quit		rts

.reformat	bsr	format_disk
		bra	load_position

.mesg		dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,1
		PHRASE	163
		dc.b	ABSPOS,0>>8,0&$ff,33>>8,33&$ff,SETPEN,1
		PHRASE	189
		dc.b	ABSPOS,0>>8,0&$ff,43>>8,43&$ff,SETPEN,1
		PHRASE	190
		dc.b	ABSPOS,32>>8,32&$ff,188>>8,188&$ff,SETPEN,9,"ESC   ",ALIGN,SETPEN,2," "
		PHRASE	166
		dc.b	ENDTEXT
                even

.posn		dc.b	ABSPOS,32>>8,32&$ff
.posn_val1	dc.b	128>>8,128&$ff,SETPEN,9,"F"
.posn_val2	dc.b	"1    ",ALIGN,SETPEN,2," "
		PHRASE	187
		dc.b	" "
.posn_val3	dc.b	"1    ",ALIGN,SETPEN,1
.posn_text	dc.b	ENDTEXT,"                                "
		dc.b	ENDTEXT
                even

****************************************************************************

copy_text	movem.l	a0-a1/d0,-(sp)
.loop		move.b	(a0)+,d0
		move.b	d0,(a1)+
		cmpi.b	#PHRASEBOOK,d0
		bne.s	.not_phrase
		move.b	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
.not_phrase
		tst.b	d0
		bne.s	.loop
		movem.l	(sp)+,a0-a1/d0
		rts

delete_text	movem.l	a0/d0,-(sp)
.loop		move.b	(a0),d0
		beq.s	.end_copy
		move.b	#0,(a0)+
		bra.s	.loop
.end_copy	movem.l	(sp)+,a0/d0
		rts

move_end_text	movem.l	a0,-(sp)
.loop		addq.w	#1,d0
		tst.b	(a0)+
		bne.s	.loop
		subq.w	#1,d0
		movem.l	(sp)+,a0
		rts

****************************************************************************
;a3=address of input buffer

BLIT_A_FILL_LINE	MACRO
		move.l  d7,-(sp)
		move.w	#0,d5
		add.w	#\1,d7
		bsr	blit_fill_line
		move.l	(sp)+,d7
		ENDM

enter_name
		move.w	position_chosen,d7
		mulu    #10,d7
		add.w	#128,d7

		lea	bank_name(a0),a0	;input string

enter_name2
		move.l	a0,-(sp)
		BOB_INFO viewing_buffer,#views_plane_width/8,#views_plane_height,#views_num_planes,#0,#0,#views_plane_width,#views_plane_height-1,#0
		move.w	d7,d6
		add.w	#10,d6
		BOB_WINDOW #112,d7,#views_plane_width,d6
		INITIALISE_KEYS	#dummy_key_list
		move.l	#miscgfx+game_font,a2
		add.l	chip_mem_base,a2
		move.l	(a2),a2
		add.l	#miscgfx,a2
		add.l   chip_mem_base,a2
		move.w	#%0000011110,d6
		TEXT_COLOUR (a2),0,0,0,0,1
		move.l	(sp)+,a0

		lea	.keys,a1		;key table
		moveq.l	#0,d0			;cursor posn
		moveq.l	#0,d1			;key

		bsr	move_end_text

		clr.w	cursor_flash
		clr.w	last_key

.wait		bsr	.draw_text
		move.b	last_key,d1
		beq.s	.wait
		clr.w	last_key
		clr.b	dummy_key_up

		cmpi.b	#$41,d1
		beq.s	.del

		cmpi.b	#$44,d1
		beq.s	.end

		cmpi.b	#$45,d1
		bne.s	.not_abort
		sf.b	helpwhoops
		move.w	#ABANDON_SAVE,save_method
		bra.s	.end
.not_abort
		cmpi.b	#$40,d1
		bhi.s	.wait

		move.b	0(a1,d1.w),d2
		cmpi.b	#".",d2
		beq.s	.wait

		cmpi.w	#BANK_NAME_SIZE-1,d0
		bge.s	.wait

		move.b	d2,0(a0,d0.w)
		addq.w	#1,d0

.wait_key_up	bsr	.draw_text
		tst.b	dummy_key_up
		beq.s	.wait_key_up
		bra.s	.wait

.del		tst.w   d0
		beq.s	.wait
		move.b	#0,0(a0,d0.w)
		subq.w	#1,d0
		bra.s	.wait

.end		move.b	#0,0(a0,d0.w)
		bsr	.draw_text2
		INITIALISE_KEYS	#help_key_list
.quit		rts

.draw_text	move.w	cursor_flash,d2
		cmp.w	#15,d2
		blt.s	.on
		cmp.w	#30,d2
		blt.s	.on2
		clr.w	cursor_flash
.on2		move.b	#0,0(a0,d0.w)
		bra.s	.skip_on
.on		move.b	#"@",0(a0,d0.w)
.skip_on
.draw_text2
		movem.w	d0-d2,-(sp)
		TASKSWITCH
		WAIT_COPINT
                BLIT_A_FILL_LINE -1
                BLIT_A_FILL_LINE 1
                BLIT_A_FILL_LINE 3
                BLIT_A_FILL_LINE 5
                BLIT_A_FILL_LINE 7
		BLIT_TEXT (a0),a2,#112,d7
		movem.w	(sp)+,d0-d2
		rts

.keys		dc.b	".1234567890....0QWERTYUIOP...123ASDFGHJKL....456.ZXCVBNM.....789 "
		even

****************************************************************************
validate_directory
		cmpi.w	#ABANDON_SAVE,save_method
		beq.s	.quit

		move.l	#directory,d1		;position
		move.l	#dir_sector_size,d2	;sectors to read
		move.l	#dir_buffer,a0
		add.l	a5,a0			;data
		bsr	load_data
		tst.w	d0
		beq.s	.skip_error
		cmpi.w	#29,d0
		bne.s	.reformat
		bsr	save_error
		cmpi.w	#FORMAT_DISK,save_method
		beq.s	.reformat
		bra	validate_directory
.skip_error
		cmpi.l	#"HGUN",dir_id(a0)
		bne.s	.reformat
		move.l	dir_version(a0),d2
		cmp.l	#VERSION,d2
		beq.s	.ok
		cmp.l	#COMPATIBLE_VERSION,d2
		bne.s	.reformat
.ok
		move.l	dir_checksum(a0),d2
		clr.l	dir_checksum(a0)
		move.l	#dir_sector_size*512,d0
		bsr	calc_checksum
		cmp.l	d2,d1
		beq.s	.no_error
		move.l	#40,d0
		bsr	save_error
		cmpi.w	#FORMAT_DISK,save_method
		beq.s	.reformat
.quit		moveq.l	#-1,d0
		rts
.no_error	move.l	d1,dir_checksum(a0)
		moveq.l	#0,d0
		rts

.reformat	bsr	format_disk
		bra	validate_directory

****************************************************************************
;a0=data to be checksummed
;d0=length of data in bytes
;output d1=checksum
calc_checksum
		movem.l	d0/a0,-(sp)
		lsr.l	#2,d0

		moveq.l	#0,d1
.loop		add.l	(a0)+,d1
		sub.l	#1,d0
		bne	.loop

		not.l	d1

		movem.l	(sp)+,d0/a0
		rts

****************************************************************************
save_doing
		cmpi.w	#ABANDON_SAVE,save_method
		beq	.quit

		addi.b	#1,global_vars+map_count(a5)
		addi.b	#1,global_vars+save_count(a5)

		cmpi.w	#SAVE_TO_RAM,save_method
		beq	.save_doing_to_ram

		move.l	fast_mem_base,variables+fast_base(a5)
		move.l	chip_mem_base,variables+chip_base(a5)
		move.w	loaded_backsfx,variables+new_backsfx(a5)
		move.w	loaded_style,variables+new_style(a5)
		move.w	loaded_mons1,variables+new_mons1(a5)
		move.w	loaded_mons2,variables+new_mons2(a5)
		move.w	loaded_disk,variables+new_disk(a5)

		STRCPY2	global_vars+orig_player1_stats+load_name(a5),loaded_pl1
		STRCPY2	global_vars+orig_player2_stats+load_name(a5),loaded_pl2
		STRCPY2	global_vars+orig_player3_stats+load_name(a5),loaded_pl3
		STRCPY2	global_vars+orig_player4_stats+load_name(a5),loaded_pl4

		lea	.mesg,a0
		bsr	fill

		move.w	position_chosen,d1
		mulu	#bank_sector_size,d1
		add.w	#dir_sector_size,d1	;position
		move.l	#bank_sector_size,d2	;sectors to write
		move.l	#variables,a0
		add.l	a5,a0			;data
		bsr	save_data

		tst.w	d0
		beq.s	.no_error
		bsr	save_error
		cmpi.w	#FORMAT_DISK,save_method
		beq	.reformat
		bra	save_doing
.no_error
		move.l	bank_chosen,a3

	IFND	SKIPCHECK
	IFND	demo
		cmpi.b	#6,global_vars+save_count(a5)
		blt	.not_failed
		move.l	vars_block,a0
		tst.w	checksum_flag
		beq	.not_failed
		move.l	#dir_buffer,a0
		add.l	a5,a0
                move.l	a1,-(sp)
		lea	dir_bank1(a0),a1
		bsr	.illegal
		lea	dir_bank2(a0),a1
		bsr	.illegal
		lea	dir_bank3(a0),a1
		bsr	.illegal
		lea	dir_bank4(a0),a1
		bsr	.illegal
		lea	dir_bank5(a0),a1
		bsr	.illegal
		bra.s	.skip_illegal

.illegal	move.l	#"THIS",(a1)
		move.l	#" IS ",4(a1)
		move.l	#"AN I",8(a1)
		move.l	#"LLEG",12(a1)
		move.l	#"AL C",16(a1)
		move.l	#"OPY ",20(a1)
		move.b	#0,24(a1)
		move.l	#-1,bank_checksum(a1)
		move.w	#BANK_USED,bank_used(a1)
		rts

.skip_illegal	move.l	a1,-(sp)
		st.b	variables+player1+dead_flag2(a5)
		st.b	variables+player2+dead_flag2(a5)
		st.b	variables+player3+dead_flag2(a5)
		st.b	variables+player4+dead_flag2(a5)
		bra.s	.skip_bank_checksum
.not_failed
	ENDC
	ENDC

		move.l	#variables,a0
		add.l	a5,a0			;data
		clr.l	bank_checksum(a3)
		move.l	#bank_sector_size*512,d0
		bsr	calc_checksum
		move.l	d1,bank_checksum(a3)
		move.w	#BANK_USED,bank_used(a3)
.skip_bank_checksum

		move.l	#dir_buffer,a0
		add.l	a5,a0
		clr.l	dir_checksum(a0)
		move.l	#dir_sector_size*512,d0
		bsr	calc_checksum
		move.l	d1,dir_checksum(a0)

		move.l	#directory,d1		;position
		move.l	#dir_sector_size,d2	;sectors to read
		bsr	save_data
		tst.w	d0
		beq.s	.no_error2
		bsr	save_error
		cmpi.w	#FORMAT_DISK,save_method
		beq.s	.reformat
		bra	save_doing
.no_error2

.quit		moveq.l	#0,d0
		rts

.reformat	bsr	format_disk
		moveq.l	#-1,d0
		rts

.save_doing_to_ram
		move.l	#variables,a0
		add.l	a5,a0
		move.l	ram_disk_base,a1
		move.l	#((bank_sector_size*512)/4)-1,d0
.loop		move.l	(a0)+,(a1)+
		dbf	d0,.loop

		move.w	#-1,ram_disk_used

		moveq.l	#0,d0
		rts

.mesg		dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	156
		dc.b	ABSPOS,0>>8,0&$ff,38>>8,38&$ff,SETPEN,1
		PHRASE	191
		dc.b	ENDTEXT
                even

****************************************************************************
load_doing	cmpi.w	#ABANDON_SAVE,save_method
		beq	.quit

		addi.b	#1,global_vars+map_count(a5)

		cmpi.w	#SAVE_TO_RAM,save_method
		beq	.load_doing_to_ram
.retry
		lea	.mesg,a0
		bsr	fill

		move.w	variables+restart_flag(a5),restart_remember

		move.w	position_chosen,d1
		mulu	#bank_sector_size,d1
		add.w	#dir_sector_size,d1	;position
		move.l	#bank_sector_size,d2	;sectors to read
		move.l	#variables,a0
		add.l	a5,a0			;data
		bsr	load_data

		tst.w	d0
		beq.s	.no_error
		bsr	save_error
		cmpi.w	#ABANDON_SAVE,save_method
		beq	.no_return
		move.w	save_device,save_method
		bra	.retry
.no_error
		move.l	bank_chosen,a3

		move.l	#variables,a0
		add.l	a5,a0			;data
		move.l	bank_checksum(a3),d2
		clr.l	bank_checksum(a3)
		move.l	#bank_sector_size*512,d0
		bsr	calc_checksum
		cmp.l	d2,d1
		beq.s	.no_error2
		move.l	#40,d0
		bsr	save_error
		cmpi.w	#ABANDON_SAVE,save_method
		beq	.no_return
		move.w	save_device,save_method
		bra     .retry
.no_error2
		bsr	relocate

		move.w	restart_remember,variables+restart_flag(a5)

		sf.b	variables+player1+control_action(a5)
		sf.b	variables+player2+control_action(a5)
		sf.b	variables+player3+control_action(a5)
		sf.b	variables+player4+control_action(a5)

		move.w	#-1,variables+curr_disk(a5)

		cmpi.w	#RESTART_LOAD,variables+restart_flag(a5)
		bne	.not_loading_game2
		move.l	#-1,loaded_pl1
		move.l	#-1,loaded_pl2
		move.l	#-1,loaded_pl3
		move.l	#-1,loaded_pl4
		move.w	#-1,loaded_backsfx
		move.w	#-1,loaded_style
		move.w	#-1,loaded_mons1
		move.w	#-1,loaded_mons2
		move.w	#0,loaded_copper
.not_loading_game2

		STRCMP	global_vars+orig_player1_stats+load_name(a5),loaded_pl1
		tst.w	d0
		beq.s	.not_new_pl1
		bsr	load_new_pl1
.not_new_pl1
		STRCMP	global_vars+orig_player2_stats+load_name(a5),loaded_pl2
		tst.w	d0
		beq.s	.not_new_pl2
		bsr	load_new_pl2
.not_new_pl2
		STRCMP	global_vars+orig_player3_stats+load_name(a5),loaded_pl3
		tst.w	d0
		beq.s	.not_new_pl3
		bsr	load_new_pl3
.not_new_pl3
		STRCMP	global_vars+orig_player4_stats+load_name(a5),loaded_pl4
		tst.w	d0
		beq.s	.not_new_pl4
		bsr	load_new_pl4
.not_new_pl4
		cmpi.w	#RESTART_LOAD,variables+restart_flag(a5)
		bne	.not_loading_game
		bsr	load_game_data
.not_loading_game
		moveq.l	#0,d0
		move.b	global_vars+num_players(a5),d1
		cmpi.b	#3,d1
		bne.s	.not_3pl
		moveq.l	#1,d0
.not_3pl	cmp.w	loaded_copper,d0
		beq.s	.not_new_copper
		bsr	load_new_copper
.not_new_copper
		move.w	variables+new_style(a5),d0
		cmp.w	loaded_style,d0
		beq.s	.not_new_style
		bsr	load_new_style
.not_new_style
		bsr	load_new_mons1
		bsr	load_new_mons2

		move.w	variables+new_backsfx(a5),d0
		cmp.w	loaded_backsfx,d0
		beq.s	.not_new_backsfx
		bsr	load_new_atmos
		bsr	load_item_gfx
.not_new_backsfx
		move.w	variables+new_style(a5),loaded_style

		jsr	gs_part2
		clr.b	variables+joystick1(a5)
		clr.b	variables+joystick2(a5)
		clr.b	variables+joystick3(a5)
		clr.b	variables+joystick4(a5)
		clr.b	variables+joystick1_temp(a5)
		clr.b	variables+joystick2_temp(a5)
		clr.b	variables+joystick3_temp(a5)
		clr.b	variables+joystick4_temp(a5)
		clr.w	variables+old_back_sample(a5)
		clr.w	drown_count
		clr.w	water_count
		clr.w	lift_count
		clr.w	fall_count
		clr.w	automove_count
		clr.w	door_count
		clr.w	explosion_count
		clr.w	mons_count
		clr.w	mesg_timer
		move.l	#scrolly,a0
		add.l	a4,a0
		move.l	#scrolly+864,a1
		add.l	a4,a1
		CLR_MEM_RANGE (a0),(a1)
		clr.l	variables+scroll_head(a5)
		clr.l	variables+scroll_tail(a5)
		clr.l	variables+scroll_prt(a5)

		lea	global_vars+orig_player1_stats+player_name(a5),a0
		move.l	a0,variables+scroll_pl1(a5)
		move.l	a0,variables+scrolld_pl1(a5)
		lea	global_vars+orig_player2_stats+player_name(a5),a0
		move.l	a0,variables+scroll_pl2(a5)
		move.l	a0,variables+scrolld_pl2(a5)
		lea	global_vars+orig_player3_stats+player_name(a5),a0
		move.l	a0,variables+scroll_pl3(a5)
		move.l	a0,variables+scrolld_pl3(a5)
		lea	global_vars+orig_player4_stats+player_name(a5),a0
		move.l	a0,variables+scroll_pl4(a5)
		move.l	a0,variables+scrolld_pl4(a5)

.quit		rts

.no_return	bsr	no_return
		move.w	save_device,save_method
		bra	.retry

.load_doing_to_ram
		tst.w	ram_disk_used
		bne.s	.ram_used
		bsr	ram_empty_error
		bra	load_doing
.ram_used
		move.l	#variables,a0
		add.l	a5,a0
		move.l	ram_disk_base,a1
		move.l	#((bank_sector_size*512)/4)-1,d0
.loop		move.l	(a1)+,(a0)+
		dbf	d0,.loop
		moveq.l	#0,d0
		rts

.mesg		dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	163
		dc.b	ABSPOS,0>>8,0&$ff,38>>8,38&$ff,SETPEN,1
		PHRASE	192
		dc.b	ENDTEXT
                even

restart_remember	dc.w	0

********************************************************************************

load_new_pl1	move.w	#1,variables+file_mode(a5)
		move.w	#1,d0
		bsr	get_disk
		lea	mesgt3,a0
		bsr	fill
		move.l	drawing_buffer,current_disk_buffer

		move.l	drawing_buffer,a1
		add.l	#20000+tmp_load_figure,a1
		LOAD_FILE2_TMP global_vars+orig_player1_stats+load_name(a5),a1
		move.l	drawing_buffer,a0
		add.l	#20000+tmp_load_figure,a0
		move.l	drawing_buffer,a1
		add.l	#20000+tmp_figure,a1
		jsr	cr_decrunch
		move.l	#miscgfx,a3
		add.l	a4,a3
		move.l	drawing_buffer,a0
		add.l	#20000+tmp_figure,a0
		move.l	#miscgfx+pl1in_bob,a1
		add.l	a4,a1
		move.l	(a1),a1
		add.l	a3,a1
		jsr	copy_figure
		move.l	drawing_buffer,a0
		add.l	#20000+tmp_face,a0
		move.l	#miscgfx+face1_bob,a1
		add.l	a4,a1
		move.l	(a1),a1
		add.l	a3,a1
		jsr	copy_face

		STRCPY2	global_vars+orig_player1_stats+load_name(a5),loaded_pl1
		rts

load_new_pl2	move.w	#1,variables+file_mode(a5)
		move.w	#1,d0
		bsr	get_disk
		lea	mesgt3,a0
		bsr	fill
		move.l	drawing_buffer,current_disk_buffer

		move.l	drawing_buffer,a1
		add.l	#20000+tmp_load_figure,a1
		LOAD_FILE2_TMP global_vars+orig_player2_stats+load_name(a5),a1
		move.l	drawing_buffer,a0
		add.l	#20000+tmp_load_figure,a0
		move.l	drawing_buffer,a1
		add.l	#20000+tmp_figure,a1
		jsr	cr_decrunch
		move.l	#miscgfx,a3
		add.l	a4,a3
		move.l	drawing_buffer,a0
		add.l	#20000+tmp_figure,a0
		move.l	#miscgfx+pl2in_bob,a1
		add.l	a4,a1
		move.l	(a1),a1
		add.l	a3,a1
		jsr	copy_figure
		move.l	drawing_buffer,a0
		add.l	#20000+tmp_face,a0
		move.l	#miscgfx+face2_bob,a1
		add.l	a4,a1
		move.l	(a1),a1
		add.l	a3,a1
		jsr	copy_face

		STRCPY2	global_vars+orig_player2_stats+load_name(a5),loaded_pl2
		rts

load_new_pl3	move.w	#1,variables+file_mode(a5)
		move.w	#1,d0
		bsr	get_disk
		lea	mesgt3,a0
		bsr	fill
		move.l	drawing_buffer,current_disk_buffer

		move.l	drawing_buffer,a1
		add.l	#20000+tmp_load_figure,a1
		LOAD_FILE2_TMP global_vars+orig_player3_stats+load_name(a5),a1
		move.l	drawing_buffer,a0
		add.l	#20000+tmp_load_figure,a0
		move.l	drawing_buffer,a1
		add.l	#20000+tmp_figure,a1
		jsr	cr_decrunch
		move.l	#miscgfx,a3
		add.l	a4,a3
		move.l	drawing_buffer,a0
		add.l	#20000+tmp_figure,a0
		move.l	#miscgfx+pl3in_bob,a1
		add.l	a4,a1
		move.l	(a1),a1
		add.l	a3,a1
		jsr	copy_figure
		move.l	drawing_buffer,a0
		add.l	#20000+tmp_face,a0
		move.l	#miscgfx+face3_bob,a1
		add.l	a4,a1
		move.l	(a1),a1
		add.l	a3,a1
		jsr	copy_face

		STRCPY2	global_vars+orig_player3_stats+load_name(a5),loaded_pl3
		rts

load_new_pl4	move.w	#1,variables+file_mode(a5)
		move.w	#1,d0
		bsr	get_disk
		lea	mesgt3,a0
		bsr	fill
		move.l	drawing_buffer,current_disk_buffer

		move.l	drawing_buffer,a1
		add.l	#20000+tmp_load_figure,a1
		LOAD_FILE2_TMP global_vars+orig_player4_stats+load_name(a5),a1
		move.l	drawing_buffer,a0
		add.l	#20000+tmp_load_figure,a0
		move.l	drawing_buffer,a1
		add.l	#20000+tmp_figure,a1
		jsr	cr_decrunch
		move.l	#miscgfx,a3
		add.l	a4,a3
		move.l	drawing_buffer,a0
		add.l	#20000+tmp_figure,a0
		move.l	#miscgfx+pl4in_bob,a1
		add.l	a4,a1
		move.l	(a1),a1
		add.l	a3,a1
		jsr	copy_figure
		move.l	drawing_buffer,a0
		add.l	#20000+tmp_face,a0
		move.l	#miscgfx+face4_bob,a1
		add.l	a4,a1
		move.l	(a1),a1
		add.l	a3,a1
		jsr	copy_face

		STRCPY2	global_vars+orig_player4_stats+load_name(a5),loaded_pl4
		rts


load_new_style	move.w	#1,variables+file_mode(a5)
		move.w	variables+new_disk(a5),d0
		bsr	get_disk
		lea	mesgt2,a0
		bsr	fill
		move.l	drawing_buffer,current_disk_buffer

		move.w	variables+new_style(a5),d0
		lea	style_num,a0
 		jsr	itoa_bu
		move.l	#gamegfx,a1
		add.l	a4,a1
		LOAD_FILE2_TMP style_name,a1
		move.l	#gamegfx,a1
		add.l	a4,a1
		PP_DECRUNCH a1

		rts

load_new_mons1	tst.w	variables+new_mons1(a5)
		beq	.no_new_mons
		move.w	variables+new_style(a5),d0
		cmp.w	loaded_style,d0
		bne.s	.force_new
		move.w	variables+new_mons1(a5),d0
		cmp.w	loaded_mons1,d0
		beq	.no_new_mons
.force_new	move.w	#1,variables+file_mode(a5)
		move.w	variables+new_disk(a5),d0
		bsr	get_disk
		lea	mesgt2,a0
		bsr	fill
		move.l	drawing_buffer,current_disk_buffer

		move.w	variables+new_mons1(a5),d0
		move.l	drawing_buffer,a1
		add.l	#20000+tmp_load_monster,a1
		lea	mons1_num,a0
 		jsr	itoa_bu
		LOAD_FILE2_TMP mons1_name,a1
		move.l	#gamegfx,a3
		add.l	a4,a3
		move.l	drawing_buffer,a0
		add.l	#20000+tmp_load_monster,a0
		move.l	drawing_buffer,a1
		add.l	#20000+tmp_monster,a1
		jsr	cr_decrunch
		move.l	drawing_buffer,a0
		add.l	#20000+tmp_monster,a0
		move.l	mon1in_bob(a3),a1
		add.l	a3,a1
		jsr	copy_figure
		move.l	drawing_buffer,a0
		add.l	#20000+tmp_dead,a0
		move.l	monster1_dead_bob(a3),a1
		add.l	a3,a1
		jsr	copy_dead
		move.l	drawing_buffer,a0
		add.l	#20000+tmp_attck,a0
		move.l	#attack1,a1
		add.l	a5,a1
		jsr	copy_attack

		move.w	variables+new_mons1(a5),loaded_mons1
.no_new_mons	rts

load_new_mons2	tst.w	variables+new_mons2(a5)
		beq	.no_new_mons
		move.w	variables+new_style(a5),d0
		cmp.w	loaded_style,d0
		bne.s	.force_new
		move.w	variables+new_mons2(a5),d0
		cmp.w	loaded_mons2,d0
		beq	.no_new_mons
.force_new	move.w	#1,variables+file_mode(a5)
		move.w	variables+new_disk(a5),d0
		bsr	get_disk
		lea	mesgt2,a0
		bsr	fill
		move.l	drawing_buffer,current_disk_buffer

		move.w	variables+new_mons2(a5),d0
		move.l	drawing_buffer,a1
		add.l	#20000+tmp_load_monster,a1
		lea	mons2_num,a0
 		jsr	itoa_bu
		LOAD_FILE2_TMP mons2_name,a1
		move.l	#gamegfx,a3
		add.l	a4,a3
		move.l	drawing_buffer,a0
		add.l	#20000+tmp_load_monster,a0
		move.l	drawing_buffer,a1
		add.l	#20000+tmp_monster,a1
		jsr	cr_decrunch
		move.l	drawing_buffer,a0
		add.l	#20000+tmp_monster,a0
		move.l	mon2in_bob(a3),a1
		add.l	a3,a1
		jsr	copy_figure
		move.l	drawing_buffer,a0
		add.l	#20000+tmp_dead,a0
		move.l	monster2_dead_bob(a3),a1
		add.l	a3,a1
		jsr	copy_dead
		move.l	drawing_buffer,a0
		add.l	#20000+tmp_attck,a0
		move.l	#attack2,a1
		add.l	a5,a1
		jsr	copy_attack

		move.w	variables+new_mons2(a5),loaded_mons2
.no_new_mons	rts

load_new_atmos	move.w	#1,variables+file_mode(a5)
		move.w	#3,d0
		bsr	get_disk
		lea	mesgt4,a0
		bsr	fill
		move.l	drawing_buffer,current_disk_buffer

		tst.w   variables+water_in_buf(a5)
		beq.s	.not_water_in_buf
		jsr	swapit
.not_water_in_buf

		move.w	variables+new_backsfx(a5),d0
		lea	atmos_num,a0
 		jsr	itoa_bu
		move.l	#backsfx_buf,a1
		add.l	chip_mem_base,a1
		LOAD_FILE2_TMP atmos_name,a1
		move.l	#backsfx_buf,a1
		add.l	chip_mem_base,a1
		PP_DECRUNCH a1

		move.w	variables+new_backsfx(a5),loaded_backsfx
.load_water
		tst.w   variables+water_in_buf(a5)
		beq.s	.not_water_in_buf2
		jsr	swapit
.not_water_in_buf2
		move.l	#water,a1
		add.l	a5,a1
		tst.l	exchip_mem_base
		beq.s	.not_ex
		move.l	#ex_water,a1
		add.l	exchip_mem_base,a1
.not_ex		move.l	a1,-(sp)
		LOAD_FILE_TMP <"Atmos/Water.sfx">,a1
		move.l	(sp)+,a1
		PP_DECRUNCH a1
		rts

load_new_copper
		move.w	#1,variables+file_mode(a5)
		move.w	#2,d0
		bsr	get_disk
		lea	mesgt4,a0
		bsr	fill
		move.l	drawing_buffer,current_disk_buffer

		jsr	kill_screen

		move.l	#copperlist,a1
		add.l	a4,a1
		LOAD_FILE <"Game/Game.cpr">,a1
		move.w	#0,loaded_copper

		jsr	set_up_game_screen
		jsr	game_screen_on2
		rts

load_game_data	move.w	#1,variables+file_mode(a5)
		move.w	#2,d0
		bsr	get_disk
		lea	mesgt5,a0
		bsr	fill
		move.l	drawing_buffer,current_disk_buffer

		bsr	.load_miscsfx
		bsr	.load_moresfx

		rts

.load_miscsfx	move.l	#miscsfx,a1
		add.l	a4,a1
		LOAD_FILE_TMP <"Game/GameChip.dat">,a1
		move.l	#miscsfx,a1
		add.l   a4,a1
		PP_DECRUNCH a1
		rts

.load_moresfx	move.l	#moresfx,a1
		add.l	a5,a1
		LOAD_FILE_TMP <"Game/GameFast.dat">,a1
		jsr	decrunch_moresfx
		rts

load_item_gfx	move.l	#item_images,a1
		add.l	a5,a1
		LOAD_FILE_TMP <"Game/Items.gfx">,a1
		move.l	#item_images,a1
		add.l   a5,a1
		PP_DECRUNCH a1

		rts

mesgt2		dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	163
		dc.b	ABSPOS,0>>8,0&$ff,38>>8,38&$ff,SETPEN,1
		PHRASE	193
		dc.b	ENDTEXT
                even

mesgt5		dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	163
		dc.b	ABSPOS,0>>8,0&$ff,38>>8,38&$ff,SETPEN,1
		PHRASE	194
		dc.b	ENDTEXT
                even

mesgt4		dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	163
		dc.b	ABSPOS,0>>8,0&$ff,38>>8,38&$ff,SETPEN,1
		PHRASE	195
		dc.b	ENDTEXT
                even

mesgt3		dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	163
		dc.b	ABSPOS,0>>8,0&$ff,38>>8,38&$ff,SETPEN,1
		PHRASE	196
		dc.b	ENDTEXT
                even

****************************************************************************

tmp_error
		jsr	wait_for_no_input

		cmpi.w	#SAVE_TO_HARD,save_method
		bne.s	.not_hard
		lea	.mesg_hard,a0
.not_hard
		cmpi.w	#SAVE_TO_FLOPPY,save_method
		bne.s	.not_floppy
		lea	.mesg_floppy,a0
.not_floppy
		bsr	fill

		jsr	friendly_wait_for_input

		lea	mesgt2,a0
		bsr	fill

		move.l	drawing_buffer,current_disk_buffer

		rts

.mesg_floppy	dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	197
		dc.b	ABSPOS,0>>8,0&$ff,28>>8,28&$ff,SETPEN,17
		PHRASE	198
		dc.b	ABSPOS,0>>8,0&$ff,38>>8,38&$ff,SETPEN,1
		PHRASE	199
		dc.b	ABSPOS,96>>8,96&$ff,133>>8,133&$ff,SETPEN,9
		PHRASE	201
		dc.b	"   ",ALIGN,SETPEN,2,"    "
		PHRASE	200
		dc.b	ENDTEXT
                even

.mesg_hard	dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	197
		dc.b	ABSPOS,0>>8,0&$ff,28>>8,28&$ff,SETPEN,17
		PHRASE	198
		dc.b	ABSPOS,0>>8,0&$ff,38>>8,38&$ff,SETPEN,1
		PHRASE	202
		dc.b	ABSPOS,96>>8,96&$ff,133>>8,133&$ff,SETPEN,9
		PHRASE	201
		dc.b	"   ",ALIGN,SETPEN,2,"    "
		PHRASE	200
		dc.b	ENDTEXT
                even

****************************************************************************
format_disk
		bsr	format_verify

		cmpi.w	#ABANDON_SAVE,save_method
		beq	.quit

		cmpi.w	#SAVE_TO_HARD,save_device
		beq	.hard

		cmpi.w	#SAVE_TO_FLOPPY,save_device
		bne	.quit

		move.w	#SAVE_TO_FLOPPY,save_method

		lea	.mesg,a0
		bsr	fill

		move.l	#0,d1			;position
		move.l	#1760,d2		;sectors to write
		move.l	#dir_buffer,a0
		add.l	a5,a0			;data
		moveq.l	#0,d0			;df0:
		move.l	#2,d3			;function=format
		or.w	#$8000,d3		;motor off after write
		move.l	drawing_buffer,a1
		jsr	diskio

		tst.w	d0
		beq.s	.no_error
		bsr	save_error
		bra	format_disk
.no_error
.not_floppy
		bsr	.write_header
		tst.w	d0
		beq.s	.no_error2
		bsr	save_error
		bra	format_disk
.no_error2
.quit		rts

.hard		move.w	#SAVE_TO_HARD,save_method
		bsr	.write_header
		tst.w	d0
		beq.s	.no_error3
		bsr	save_error
		bra	format_disk
.no_error3
		rts

.write_header	move.l	#dir_buffer,a0
		add.l	a5,a0
		move.l	#((dir_sector_size*512)/4)-1,d0
.loop		clr.l	(a0)+
		dbf	d0,.loop
		move.l	#dir_buffer,a0
		add.l	a5,a0
		move.l	#"HGUN",dir_id(a0)
		move.l	#VERSION,dir_version(a0)
		clr.l	dir_checksum(a0)
		move.l	#dir_sector_size*512,d0
		bsr	calc_checksum
		move.l	d1,dir_checksum(a0)

		move.l	#directory,d1		;position
		move.l	#dir_sector_size,d2	;sectors to write
		move.l	#dir_buffer,a0
		add.l	a5,a0			;data
		bsr	save_data

		rts

.buffer		dc.l	0

.mesg		dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	175
		dc.b	ABSPOS,0>>8,0&$ff,28>>8,28&$ff,SETPEN,17
		PHRASE	203
		dc.b	ABSPOS,0>>8,0&$ff,38>>8,38&$ff,SETPEN,1
		PHRASE	204
		dc.b	ABSPOS,0>>8,0&$ff,48>>8,48&$ff,SETPEN,1
		PHRASE	205
		dc.b	ABSPOS,0>>8,0&$ff,58>>8,58&$ff,SETPEN,1
		PHRASE	206
		dc.b	ENDTEXT
                even

****************************************************************************
save_data
		movem.l	d1-d7/a0-a6,-(sp)

		cmpi.w	#SAVE_TO_HARD,save_method
		beq.s	.hard

		cmpi.w	#SAVE_TO_FLOPPY,save_method
		bne.s	.not_floppy

		moveq.l	#0,d0			;df0:
		move.l	#1,d3			;function=write
		or.w	#$8000,d3		;motor off after write
		move.l	drawing_buffer,a1
		jsr	diskio
.not_floppy
		movem.l	(sp)+,d1-d7/a0-a6
		rts

.hard
		ITOA_BU d1,.filenum
		lea	.filename,a2		;file
		move.l	a0,a3			;source
		move.l	d2,d3
		mulu	#512,d3			;length

		jsr	temp_restore_system
		jsr	dos_save_file
		jsr	temp_take_system

		tst.l	d0
		beq	.no_error
		move.l	#42,d0

.no_error	movem.l	(sp)+,d1-d7/a0-a6
		rts

.filename	dc.b	"SavedGames/Track"
.filenum	dc.b	"00",0
		even

****************************************************************************
load_data
		movem.l	d1-d7/a0-a6,-(sp)

		cmpi.w	#SAVE_TO_HARD,save_method
		beq.s	.hard

		cmpi.w	#SAVE_TO_FLOPPY,save_method
		bne.s	.not_floppy

		moveq.l	#0,d0			;df0:
		move.l	#0,d3			;function=read
		or.w	#$8000,d3		;motor off after write
		move.l	drawing_buffer,a1
		jsr	diskio
.not_floppy
		movem.l	(sp)+,d1-d7/a0-a6
		rts

.hard
		ITOA_BU d1,.filenum
		lea	.filename,a2		;file
		move.l	a0,a3			;destination

		jsr	temp_restore_system
		jsr	dos_load_file
		jsr	temp_take_system

		tst.l	d0
		beq	.no_error
		move.l	#42,d0

.no_error	movem.l	(sp)+,d1-d7/a0-a6
		rts

.filename	dc.b	"SavedGames/Track"
.filenum	dc.b	"00",0
		even

****************************************************************************

save_error
		move.l	d0,-(sp)
		jsr	wait_for_no_input
		move.l	(sp)+,d0

		lea	.mesg28,a0
		cmpi.w	#28,d0
		beq.s	.do_it
		lea	.mesg40,a0
		cmpi.w	#40,d0
		beq.s	.do_it
		lea	.mesg29,a0
		cmpi.w	#29,d0
		beq.s	.do_it
		lea	.mesgxx,a0

.do_it		bsr	simple_fill

		move.l	#miscgfx+game_font,a2
		add.l	chip_mem_base,a2
		move.l	(a2),a2
		add.l	#miscgfx,a2
		add.l   chip_mem_base,a2
		move.w	#%0000011111,d6
		cmpi.w	#SAVE_TO_FLOPPY,save_method
		bne.s	.not_floppy
		BLIT_TEXT .mesg_floppy,a2,#0,#0
		cmpi.w	#MODE_LOADING,save_mode
		bne.s	.not_loading
		BLIT_TEXT .options1,a2,#0,#0
		bra	.skip
.not_loading	BLIT_TEXT .options2,a2,#0,#0
		bra	.skip
.not_floppy
		cmpi.w	#SAVE_TO_HARD,save_method
		bne.s	.not_hard
		BLIT_TEXT .mesg_hard,a2,#0,#0
		cmpi.w	#MODE_LOADING,save_mode
		bne.s	.not_loading2
		BLIT_TEXT .options1,a2,#0,#0
		bra	.skip
.not_loading2	BLIT_TEXT .options3,a2,#0,#0
		bra	.skip
.not_hard
		cmpi.w	#SAVE_TO_RAM,save_method
		bne.s	.not_ram
		BLIT_TEXT .mesg_ram,a2,#0,#0
		BLIT_TEXT .options1,a2,#0,#0
		bra	.skip
.not_ram
.skip
		bsr	swap_fill

		clr.w	last_key

.wait
		TASKSWITCH

		jsr	test_input

		move.b	last_key,d1

		cmpi.w	#MODE_LOADING,save_mode
		beq.s	.not_format
		cmpi.w	#SAVE_TO_RAM,save_method
		beq.s	.not_format
		cmpi.b	#$50,d1
		bne.s	.not_format
		sf.b	helpf1
		move.w	#FORMAT_DISK,save_method
.not_format
		cmpi.b	#$45,d1
		bne.s	.not_abort
		sf.b	helpwhoops
		move.w	#ABANDON_SAVE,save_method
.not_abort
		tst.l	d0
		beq.s	.wait

		rts

.mesg_floppy	dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	197
		dc.b	ABSPOS,0>>8,0&$ff,28>>8,28&$ff,SETPEN,17
		PHRASE	198
		dc.b	ABSPOS,0>>8,0&$ff,38>>8,38&$ff,SETPEN,1
		PHRASE	199
		dc.b	ENDTEXT
                even

.mesg_hard	dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	197
		dc.b	ABSPOS,0>>8,0&$ff,28>>8,28&$ff,SETPEN,17
		PHRASE	198
		dc.b	ABSPOS,0>>8,0&$ff,38>>8,38&$ff,SETPEN,1
		PHRASE	202
		dc.b	ENDTEXT
                even

.mesg_ram	dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	197
		dc.b	ABSPOS,0>>8,0&$ff,28>>8,28&$ff,SETPEN,17
		PHRASE	198
		dc.b	ABSPOS,0>>8,0&$ff,38>>8,38&$ff,SETPEN,1
		PHRASE	208
		dc.b	ENDTEXT
                even

.mesgxx		dc.b	ABSPOS,0>>8,0&$ff,48>>8,48&$ff,SETPEN,2
		PHRASE	209
		dc.b	ENDTEXT
                even

.mesg28		dc.b	ABSPOS,0>>8,0&$ff,48>>8,48&$ff,SETPEN,2
		PHRASE	210
		dc.b	ENDTEXT
                even

.mesg29		dc.b	ABSPOS,0>>8,0&$ff,48>>8,48&$ff,SETPEN,2
		PHRASE	211
		dc.b	ABSPOS,0>>8,0&$ff,58>>8,58&$ff,SETPEN,2
		PHRASE	212
		dc.b	ENDTEXT
                even

.mesg40		dc.b	ABSPOS,0>>8,0&$ff,48>>8,48&$ff,SETPEN,2
		PHRASE	213
		dc.b	ABSPOS,0>>8,0&$ff,58>>8,58&$ff,SETPEN,2
		PHRASE	214
		dc.b	ENDTEXT
                even

.options1	dc.b	ABSPOS,96>>8,96&$ff,133>>8,133&$ff,SETPEN,9,"ESC       ",ALIGN,SETPEN,2,"      "
		PHRASE	239
		dc.b	ABSPOS,96>>8,96&$ff,143>>8,143&$ff,SETPEN,9
		PHRASE	215
		dc.b	ALIGN,SETPEN,2,"   "
		PHRASE	216
		dc.b	ENDTEXT
                even

.options2	dc.b	ABSPOS,96>>8,96&$ff,133>>8,133&$ff,SETPEN,9,"F1        ",ALIGN,SETPEN,2,"      "
		PHRASE	207
		dc.b	ABSPOS,96>>8,96&$ff,143>>8,143&$ff,SETPEN,9,"ESC       ",ALIGN,SETPEN,2,"      "
		PHRASE	239
		dc.b	ABSPOS,96>>8,96&$ff,153>>8,153&$ff,SETPEN,9,"ANY OTHER KEY",ALIGN,SETPEN,2,"   "
		PHRASE	216
		dc.b	ENDTEXT
                even

.options3	dc.b	ABSPOS,96>>8,96&$ff,133>>8,133&$ff,SETPEN,9,"F1        ",ALIGN,SETPEN,2,"      "
		PHRASE	217
		dc.b	ABSPOS,96>>8,96&$ff,143>>8,143&$ff,SETPEN,9,"ESC       ",ALIGN,SETPEN,2,"      "
		PHRASE	239
		dc.b	ABSPOS,96>>8,96&$ff,153>>8,153&$ff,SETPEN,9,"ANY OTHER KEY",ALIGN,SETPEN,2,"   "
		PHRASE	216
		dc.b	ENDTEXT
                even

****************************************************************************
save_done
		cmpi.w	#ABANDON_SAVE,save_method
		beq.s	.quit

		jsr	wait_for_no_input
		lea	.mesg,a0
		bsr	fill

		jsr	friendly_wait_for_input
		jsr	wait_for_no_input

.quit		rts

.mesg		dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	156
		dc.b	ABSPOS,0>>8,0&$ff,38>>8,38&$ff,SETPEN,1
		PHRASE	218
		dc.b	ABSPOS,96>>8,96&$ff,133>>8,133&$ff,SETPEN,9
		PHRASE	201
		dc.b	ALIGN,SETPEN,2,"        "
		PHRASE	172
		dc.b	ENDTEXT
                even

****************************************************************************
load_done
		cmpi.w	#ABANDON_SAVE,save_method
		beq.s	.quit

		jsr	wait_for_no_input
		lea	.mesg,a0
		bsr	fill

		jsr	friendly_wait_for_input
		jsr	wait_for_no_input

.quit		rts

.mesg		dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	163
		dc.b	ABSPOS,0>>8,0&$ff,38>>8,38&$ff,SETPEN,1
		PHRASE	219
		dc.b	ABSPOS,96>>8,96&$ff,133>>8,133&$ff,SETPEN,9
		PHRASE	201
		dc.b	"   ",ALIGN,SETPEN,2,"        "
		PHRASE	155
		dc.b	ENDTEXT
                even

****************************************************************************
get_disk
		cmp.w	variables+curr_disk(a5),d0
		beq.s	.found_disk
		move.w	d0,variables+curr_disk(a5)

		cmpi.w	#SAVE_TO_HARD,save_method
		beq.s	.found_disk

		move.b	#"0",.mesg_disk
		move.b	#"0",.mesg_disk2
		add.b	d0,.mesg_disk
		add.b	d0,.mesg_disk2

.try_again	lea	.mesg2,a0
		bsr	fill

		move.w	variables+curr_disk(a5),d0
		move.l	drawing_buffer,a2
		jsr	log_disk
		tst.w	d0
		beq.s	.found_disk

		jsr	wait_for_no_input
		lea	.mesg,a0
		bsr	fill
		jsr	friendly_wait_for_input

		bra.s	.try_again

.found_disk	rts

.mesg		dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	163
		dc.b	ABSPOS,0>>8,0&$ff,38>>8,38&$ff,SETPEN,1
		PHRASE	220
.mesg_disk	dc.b	"0 "
		PHRASE	221
		dc.b	ABSPOS,96>>8,96&$ff,133>>8,133&$ff,SETPEN,9
		PHRASE	201
		dc.b	"   ",ALIGN,SETPEN,2,"        "
		PHRASE	155
		dc.b	ENDTEXT
                even

.mesg2		dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	163
		dc.b	ABSPOS,0>>8,0&$ff,38>>8,38&$ff,SETPEN,1
		PHRASE	222
.mesg_disk2	dc.b	"0 "
                PHRASE	240
		dc.b	"."
		dc.b	ENDTEXT
                even

****************************************************************************
no_return
		jsr	wait_for_no_input
		lea	.mesg,a0
		bsr	fill

		jsr	friendly_wait_for_input

		rts

.mesg		dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	163
		dc.b	ABSPOS,0>>8,0&$ff,38>>8,38&$ff,SETPEN,1
		PHRASE	223
		dc.b	ABSPOS,96>>8,96&$ff,133>>8,133&$ff,SETPEN,9
		PHRASE	201
		dc.b	"   ",ALIGN,SETPEN,2,"   "
		PHRASE  200
		dc.b	ENDTEXT
                even

****************************************************************************
no_ram_error
		cmpi.w	#ABANDON_SAVE,save_method
		beq.s	.quit

		jsr	wait_for_no_input
		lea	.mesg,a0
		bsr	fill

		jsr	friendly_wait_for_input

		move.w	#ABANDON_SAVE,save_method

.quit		rts

.mesg		dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	156
		dc.b	ABSPOS,0>>8,0&$ff,38>>8,38&$ff,SETPEN,1
		PHRASE	224
		dc.b	ABSPOS,96>>8,96&$ff,133>>8,133&$ff,SETPEN,9
		PHRASE	201
		dc.b	"   ",ALIGN,SETPEN,2,"        "
		PHRASE	200
		dc.b	ENDTEXT
                even

****************************************************************************
ram_empty_error
		cmpi.w	#ABANDON_SAVE,save_method
		beq.s	.quit

		jsr	wait_for_no_input
		lea	.mesg,a0
		bsr	fill

		jsr	friendly_wait_for_input

		move.w	#ABANDON_SAVE,save_method

.quit		rts

.mesg		dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	163
		dc.b	ABSPOS,0>>8,0&$ff,38>>8,38&$ff,SETPEN,1
		PHRASE	225
		dc.b	ABSPOS,96>>8,96&$ff,133>>8,133&$ff,SETPEN,9
		PHRASE	201
		dc.b	"   ",ALIGN,SETPEN,2,"        "
		PHRASE	200
		dc.b	ENDTEXT
                even

****************************************************************************
relocate
		lea	variables(a5),a0
		lea	.rel_variables,a1
		bsr	rel_seg

		lea	variables+player1(a5),a0
		lea	.rel_player,a1
		bsr	rel_seg

		lea	variables+player2(a5),a0
		lea	.rel_player,a1
		bsr	rel_seg

		lea	variables+player3(a5),a0
		lea	.rel_player,a1
		bsr	rel_seg

		lea	variables+player4(a5),a0
		lea	.rel_player,a1
		bsr	rel_seg

		lea	global_vars(a5),a0
		lea	.rel_global,a1
		bsr	rel_seg

		move.l	#map+monsters,a0
		add.l	a5,a0
		lea	.rel_monster,a1
		move.l	#monster_size,d4
		move.l	#num_monsters,d5
		bsr	rel_seg_with_gap

		rts

F_REL		equ	0
F_CLR		equ	1
F_END		equ	2
F_REL2		equ	3

REL		MACRO
		dc.w	F_REL,\1
		ENDM

REL2		MACRO
		dc.w	F_REL2,\1
		ENDM

CLR		MACRO
		dc.w	F_CLR,\1
		ENDM

REL_END		MACRO
		dc.w    F_END
		ENDM

REL_MULTI	MACRO
inc\@		set	0
		REPT	\2
		dc.w	F_REL,\1+inc\@
inc\@		set	inc\@+4
	        ENDR
		ENDM

.rel_variables
		CLR		scroll_head
		CLR		scroll_tail
		CLR		scroll_prt
		REL_END
.rel_player
		REL		old_mem_position
		REL		mem_position
		REL_MULTI	path,PATH_SIZE
		REL_END
.rel_global
		REL_END

.rel_monster	REL2		monster_type
		REL2		monster_posn
		REL_END

rel_seg		move.l	variables+fast_base(a5),d2
		move.l	fast_mem_base,d3
.loop		move.w	(a1)+,d0
		move.w	(a1)+,d1

		cmpi.w	#F_END,d0
		beq.s	.end

		cmpi.w	#F_CLR,d0
		bne.s	.not_clr
		clr.l	0(a0,d1.w)
		bra.s	.loop
.not_clr
		cmpi.w	#F_REL,d0
		bne.s	.not_rel
		sub.l	d2,0(a0,d1.w)
		add.l	d3,0(a0,d1.w)
		bra.s	.loop
.not_rel
		cmpi.w	#F_REL2,d0
		bne.s	.not_rel2
		tst.l	0(a0,d1.w)
		beq.s	.not_rel2
		sub.l	d2,0(a0,d1.w)
		add.l	d3,0(a0,d1.w)
		bra.s	.loop
.not_rel2
		bra.s	.loop
.end		rts

rel_seg_with_gap
		move.l	a1,a2
		subq.w	#1,d5
		move.l	variables+fast_base(a5),d2
		move.l	fast_mem_base,d3
.loop		move.w	(a1)+,d0
		move.w	(a1)+,d1

		cmpi.w	#F_END,d0
		beq.s	.end

		cmpi.w	#F_CLR,d0
		bne.s	.not_clr
		clr.l	0(a0,d1.w)
		bra.s	.loop
.not_clr
		cmpi.w	#F_REL,d0
		bne.s	.not_rel
		sub.l	d2,0(a0,d1.w)
		add.l	d3,0(a0,d1.w)
		bra.s	.loop
.not_rel
		cmpi.w	#F_REL2,d0
		bne.s	.not_rel2
		tst.l	0(a0,d1.w)
		beq.s	.not_rel2
		sub.l	d2,0(a0,d1.w)
		add.l	d3,0(a0,d1.w)
		bra.s	.loop
.not_rel2
		bra.s	.loop

.end		move.l	a2,a1
		add.l   d4,a0
		dbf	d5,.loop
		rts


	ENDC

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	a0-a3,d0-d5

do_actionfailed
		lea	.floppy_mesg,a0
		tst.l	os_kill
		bne.s	.dead3
		lea	.hd_mesg,a0
.dead3
		bsr	simple_fill

		move.l	#miscgfx+game_font,a2
		add.l	chip_mem_base,a2
		move.l	(a2),a2
		add.l	#miscgfx,a2
		add.l   chip_mem_base,a2
		move.w	#%0000011111,d6
		BLIT_TEXT .mesg,a2,#0,#0

		bsr	swap_fill
.wait
		tst.l	os_kill
		bne.s	.dead2
		jsr	temp_restore_system
		WAIT_VBLANK
		jsr	temp_take_system
.dead2
		bsr	scan_quit
		bsr	scan_exit
		bsr	scan_retry
        	bsr	scan_grab

		tst.w	variables+restart_flag(a5)
		beq.s	.wait

		cmpi.w	#RESTART_QUIT,variables+restart_flag(a5)
		bne.s	.not_quit
		move.w	#RESTART_QUIT_VIA_DEATH,variables+restart_flag(a5)

.not_quit	rts

.mesg		dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	226
		dc.b	ABSPOS,100>>8,100&$ff,32>>8,32&$ff,SETPEN,2
		PHRASE	227
		dc.b	ABSPOS,100>>8,100&$ff,42>>8,42&$ff
		PHRASE	228
		dc.b	ABSPOS,100>>8,100&$ff,52>>8,52&$ff
		PHRASE	229

		dc.b	ENDTEXT

	IFD	demo
.floppy_mesg
		dc.b	ABSPOS,86>>8,86&$ff,136>>8,136&$ff,SETPEN,9,"CTRL R     ",ALIGN,SETPEN,2,"    "
		PHRASE	230

		dc.b	ENDTEXT

.hd_mesg
		dc.b	ABSPOS,86>>8,86&$ff,136>>8,136&$ff,SETPEN,9,"CTRL R     ",ALIGN,SETPEN,2,"    "
		PHRASE	230
		dc.b	ABSPOS,86>>8,86&$ff,146>>8,146&$ff,SETPEN,9,"CTRL ESC   ",ALIGN,SETPEN,2,"    "
		PHRASE	231

		dc.b	ENDTEXT
	ELSEIF

.floppy_mesg
		dc.b	ABSPOS,44>>8,44&$ff,136>>8,136&$ff,SETPEN,9,"CTRL R     ",ALIGN,SETPEN,2,"    "
		PHRASE	230
		dc.b	ABSPOS,44>>8,44&$ff,146>>8,146&$ff,SETPEN,9,"CTRL Q     ",ALIGN,SETPEN,2,"    "
		PHRASE	232

		dc.b	ENDTEXT

.hd_mesg
		dc.b	ABSPOS,44>>8,44&$ff,136>>8,136&$ff,SETPEN,9,"CTRL R     ",ALIGN,SETPEN,2,"    "
		PHRASE	230
		dc.b	ABSPOS,44>>8,44&$ff,146>>8,146&$ff,SETPEN,9,"CTRL Q     ",ALIGN,SETPEN,2,"    "
		PHRASE	232
		dc.b	ABSPOS,44>>8,44&$ff,156>>8,156&$ff,SETPEN,9,"CTRL ESC   ",ALIGN,SETPEN,2,"    "
		PHRASE	231

		dc.b	ENDTEXT
	ENDC

		even

;-------------------------------------------------------------------------------

do_death
		bsr	.death_fill
.wait
		tst.l	os_kill
		bne.s	.dead2
		jsr	temp_restore_system
		WAIT_VBLANK
		jsr	temp_take_system
.dead2
		bsr	scan_wbench
		tst.w	global_vars+action_flag(a5)
		bne.s	.no_load
		bsr	scan_load_no_unfill
		tst.l   d0
		beq.s	.no_load
		cmpi.w	#-1,d0
		beq.s	.loaded
		bsr     .death_fill
.no_load
		bsr	scan_abort
		bsr	scan_quit
		bsr	scan_exit
		bsr	scan_retry
        	bsr	scan_grab

		tst.w	variables+restart_flag(a5)
		beq.s	.wait

		cmpi.w	#RESTART_QUIT,variables+restart_flag(a5)
		bne.s	.not_quit
		move.w	#RESTART_QUIT_VIA_DEATH,variables+restart_flag(a5)

.not_quit	rts

.loaded		bsr	unfill
		rts

.death_fill
		lea	.floppy_mesg,a0
		tst.l	os_kill
		bne.s	.dead3
		lea	.hd_mesg,a0
.dead3
		bsr	simple_fill

		move.l	#miscgfx+game_font,a2
		add.l	chip_mem_base,a2
		move.l	(a2),a2
		add.l	#miscgfx,a2
		add.l   chip_mem_base,a2
		move.w	#%0000011111,d6
		BLIT_TEXT .mesg,a2,#0,#0

		tst.w	global_vars+action_flag(a5)
		bne.s	.action
		BLIT_TEXT .mesg_campaign,a2,#0,#0
.action
		bsr	swap_fill
		rts

.mesg		dc.b	ABSPOS,100>>8,100&$ff,4>>8,4&$ff,SETPEN,29
		PHRASE	233
		dc.b	ABSPOS,100>>8,100&$ff,32>>8,32&$ff,SETPEN,2
		PHRASE	234
		dc.b	ABSPOS,100>>8,100&$ff,42>>8,42&$ff
		PHRASE	235
		dc.b	ABSPOS,100>>8,100&$ff,52>>8,52&$ff
		PHRASE	236
		dc.b	ABSPOS,100>>8,100&$ff,62>>8,62&$ff
		PHRASE	237
		dc.b	ABSPOS,100>>8,100&$ff,72>>8,72&$ff
		PHRASE	238
		dc.b	ABSPOS,44>>8,44&$ff,156>>8,156&$ff,SETPEN,9,"CTRL R     ",ALIGN,SETPEN,2," "
		PHRASE	230
		dc.b	ENDTEXT

.mesg_campaign	dc.b	ABSPOS,44>>8,44&$ff,129>>8,129&$ff,SETPEN,9,"CTRL L     ",ALIGN,SETPEN,2," "
		PHRASE	115
	IFND	demo
		dc.b	ABSPOS,44>>8,44&$ff,165>>8,165&$ff,SETPEN,9,"CTRL A     ",ALIGN,SETPEN,2," "
		PHRASE	123
        ENDC
		dc.b	ENDTEXT

	IFD	demo
.floppy_mesg	dc.b	ENDTEXT

.hd_mesg	dc.b	ABSPOS,44>>8,44&$ff,183>>8,183&$ff,SETPEN,9,"CTRL ESC   ",ALIGN,SETPEN,2," "
		PHRASE	231
		dc.b	ENDTEXT
	ELSEIF

.floppy_mesg	dc.b	ABSPOS,44>>8,44&$ff,174>>8,174&$ff,SETPEN,9,"CTRL Q     ",ALIGN,SETPEN,2," "
		PHRASE	232
		dc.b	ENDTEXT

.hd_mesg	dc.b	ABSPOS,44>>8,44&$ff,174>>8,174&$ff,SETPEN,9,"CTRL Q     ",ALIGN,SETPEN,2," "
		PHRASE	232
		dc.b	ABSPOS,44>>8,44&$ff,183>>8,183&$ff,SETPEN,9,"CTRL ESC   ",ALIGN,SETPEN,2," "
		PHRASE	231
		dc.b	ENDTEXT

	ENDC
                even

****************************************************************************
****************************************************************************
****************************************************************************
;If a leader is activated all other mercs will folow him/her.
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	a0-a3,d0-d5
follow_leader
		move.l	a4,-(sp)

		sf.b	variables+player1+auto_move(a5)
		sf.b	variables+player2+auto_move(a5)
		sf.b	variables+player3+auto_move(a5)
		sf.b	variables+player4+auto_move(a5)

		cmp.w	#10,automove_count	;time to move a player?
		bls	.end			;no, then branch
		subi.w	#10,automove_count	;reset timer

		cmpi.b	#2,global_vars+num_players(a5)
		beq.s	.2_pl

		move.w	variables+leader1(a5),d0
		beq	.no_leader
		lea	variables+player1(a5),a0
		subq.w	#1,d0
		mulu	#player_struct_size,d0
		add.w	d0,a0
		move.b	xpos(a0),d0		;get target for next player
		move.b	ypos(a0),d1

		lea	variables+player1(a5),a1
		bsr	move_player

		lea	variables+player2(a5),a1
		bsr	move_player

		lea	variables+player3(a5),a1
		bsr	move_player

		lea	variables+player4(a5),a1
		bsr	move_player

		bra	.no_leader

.2_pl		move.w	variables+leader1(a5),d0
		beq	.no_leader1
		lea	variables+player1(a5),a0
		subq.w	#1,d0
		mulu	#player_struct_size,d0
		add.w	d0,a0
		move.b	xpos(a0),d0		;get target for next player
		move.b	ypos(a0),d1

		lea	variables+player1(a5),a1
		bsr	move_player

		lea	variables+player3(a5),a1
		bsr	move_player

.no_leader1	move.w	variables+leader2(a5),d0
		beq	.no_leader
		lea	variables+player1(a5),a0
		subq.w	#1,d0
		mulu	#player_struct_size,d0
		add.w	d0,a0
		move.b	xpos(a0),d0		;get target for next player
		move.b	ypos(a0),d1

		lea	variables+player2(a5),a1
		bsr	move_player

		lea	variables+player4(a5),a1
		bsr	move_player

.end
.no_leader	move.l	(sp)+,a4
		rts

****************************************************************************
move_player
		tst.w	dead_flag2(a1)		;this player is dead
		bne     abort_automove
		cmpi.w	#7,window_type(a1)	;this player in exit
		beq     abort_automove

		tst.w	in_team(a1)
		beq	abort_automove

		tst.b	control_method(a1)	;this player not active
		beq     abort_automove

		move.w	variables+leader1(a5),d3	;this player is a leader
		subq.w	#1,d3
		cmp.w	player_num(a1),d3
		beq     abort_automove
		move.w	variables+leader2(a5),d3	;this player is a leader
		subq.w	#1,d3
		cmp.w	player_num(a1),d3
		beq     abort_automove

		tst.w	window_type(a1)
		beq.s	.view
		st.b	auto_move(a1)
		bra     abort_automove

.view		tst.b	control_action(a1)	;this player is becoming leader
		bne     abort_automove
		st.b	auto_move(a1)
		move.l	mem_position(a1),a3

		moveq.l	#-1,d4
		moveq.l	#-1,d3

		lea	(a3),a2
		moveq.l	#-1,d2
		bsr     on_path

		lea	-MAP_WIDTH*map_cell_size(a3),a2
		moveq.l	#0,d2
		bsr     on_path
		lea	MAP_WIDTH*map_cell_size(a3),a2
		moveq.l	#2,d2
		bsr     on_path
		lea	-map_cell_size(a3),a2
		moveq.l	#3,d2
		bsr     on_path
		lea	map_cell_size(a3),a2
		moveq.l	#1,d2
		bsr     on_path

		lea	MAP_WIDTH*MAP_DEPTH*map_cell_size-MAP_WIDTH*map_cell_size(a3),a2
		moveq.l	#0,d2
		bsr     on_path
		lea	MAP_WIDTH*MAP_DEPTH*map_cell_size+MAP_WIDTH*map_cell_size(a3),a2
		moveq.l	#2,d2
		bsr     on_path
		lea	MAP_WIDTH*MAP_DEPTH*map_cell_size-map_cell_size(a3),a2
		moveq.l	#3,d2
		bsr     on_path
		lea	MAP_WIDTH*MAP_DEPTH*map_cell_size+map_cell_size(a3),a2
		moveq.l	#1,d2
		bsr     on_path

		lea	-MAP_WIDTH*MAP_DEPTH*map_cell_size-MAP_WIDTH*map_cell_size(a3),a2
		moveq.l	#0,d2
		bsr     on_path
		lea	-MAP_WIDTH*MAP_DEPTH*map_cell_size+MAP_WIDTH*map_cell_size(a3),a2
		moveq.l	#2,d2
		bsr     on_path
		lea	-MAP_WIDTH*MAP_DEPTH*map_cell_size-map_cell_size(a3),a2
		moveq.l	#3,d2
		bsr     on_path
		lea	-MAP_WIDTH*MAP_DEPTH*map_cell_size+map_cell_size(a3),a2
		moveq.l	#1,d2
		bsr     on_path

		move.b	direction(a1),d2

		tst.w	d4
                beq	try_north

		cmpi.w	#1,d4
		beq	try_east

		cmpi.w	#2,d4
		beq	try_south

		cmpi.w	#3,d4
		beq	try_west

		rts

		sub.b	xpos(a1),d0
		ext.w	d0
		sub.b	ypos(a1),d1
		ext.w	d1
		mulu	d0,d0
		mulu	d1,d1
		add.l	d0,d1
		cmp.l	#5,d1
		bgt	abort_automove		;target too far away

test_east_west	cmp.b	xpos(a1),d0
		beq.s	test_north_south
		bgt     .try_east
		bsr	try_west
		bra.s	test_north_south
.try_east	bsr	try_east

test_north_south
		cmp.b	ypos(a1),d1
		beq.s   abort_automove
		bgt     .try_south
		bsr	try_north
		rts
.try_south	bsr	try_south

abort_automove	rts

****************************************************************************
on_path
		lea	path+PATH_SIZE*4(a0),a4
		move.w	#PATH_SIZE-1,d5
.loop
		cmp.l	-(a4),a2
		beq.s	.found

		dbf	d5,.loop
		rts

.found		cmp.w	d3,d5
		blt.s	.not_nearest

		move.w	d5,d3
		move.w	d2,d4

.not_nearest	rts

****************************************************************************

try_north	tst.b	d2
		bne.s	.not_north
		move.b	#forward_action,control_action(a1)
		rts
.not_north
		cmpi.b	#1,d2
		bne.s	.not_east
		move.b	#turn_left_action,control_action(a1)
		rts
.not_east
		cmpi.b	#2,d2
		bne.s	.not_south
		move.b	#turn_left_action,control_action(a1)
		rts
.not_south
		cmpi.b	#3,d2
		bne.s	.not_west
		move.b	#turn_right_action,control_action(a1)
.not_west	rts

****************************************************************************

try_east	tst.b	d2
		bne.s	.not_north
		move.b	#turn_right_action,control_action(a1)
		rts
.not_north
		cmpi.b	#1,d2
		bne.s	.not_east
		move.b	#forward_action,control_action(a1)
		rts
.not_east
		cmpi.b	#2,d2
		bne.s	.not_south
		move.b	#turn_left_action,control_action(a1)
		rts
.not_south
		cmpi.b	#3,d2
		bne.s	.not_west
		move.b	#turn_left_action,control_action(a1)
.not_west	rts

****************************************************************************

try_south	tst.b	d2
		bne.s	.not_north
		move.b	#turn_left_action,control_action(a1)
		rts
.not_north
		cmpi.b	#1,d2
		bne.s	.not_east
		move.b	#turn_right_action,control_action(a1)
		rts
.not_east
		cmpi.b	#2,d2
		bne.s	.not_south
		move.b	#forward_action,control_action(a1)
		rts
.not_south
		cmpi.b	#3,d2
		bne.s	.not_west
		move.b	#turn_left_action,control_action(a1)
.not_west	rts

****************************************************************************

try_west	tst.b	d2
		bne.s	.not_north
		move.b	#turn_left_action,control_action(a1)
		rts
.not_north
		cmpi.b	#1,d2
		bne.s	.not_east
		move.b	#turn_left_action,control_action(a1)
		rts
.not_east
		cmpi.b	#2,d2
		bne.s	.not_south
		move.b	#turn_right_action,control_action(a1)
		rts
.not_south
		cmpi.b	#3,d2
		bne.s	.not_west
		move.b	#forward_action,control_action(a1)
.not_west	rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:       none

swap_players
		lea	variables+player1(a5),a0
		bsr.s	.swap_player

		lea	variables+player2(a5),a0
		bsr.s	.swap_player

		lea	variables+player3(a5),a0
		bsr.s	.swap_player

		lea	variables+player4(a5),a0
		bsr.s	.swap_player

		rts

.swap_player
		move.w	bumping_into(a0),d0
		bmi	.no_bump

		lea	variables+player1(a5),a1
		mulu	#player_struct_size,d0
		add.l	d0,a1

		move.b	control_method(a0),d0
		cmp.b	control_method(a1),d0
		beq.s	.same_player
		move.w	player_num(a0),d0
		cmp.w   bumping_into(a1),d0
		bne	.no_bump
.same_player
		move.l	#miscsfx,a2
		add.l	chip_mem_base,a2
		tst.w	fire_anim(a0)
		bne.s	.firing
		PLAY_SAMPLE a2,#8,aud_ch(a0),#63,footstep_period(a0)
.firing
		move.l	mem_position(a0),a2
		andi.l	#erase_person,(a2)
		move.l	mem_position(a1),a2
		andi.l	#erase_person,(a2)

		move.b	xpos(a1),d0
		move.b	xpos(a0),xpos(a1)
		move.b	d0,xpos(a0)
		move.b	ypos(a1),d0
		move.b	ypos(a0),ypos(a1)
		move.b	d0,ypos(a0)
		move.l	mem_position(a1),d0
		move.l	d0,old_mem_position(a1)
		move.l	mem_position(a0),mem_position(a1)
		move.l	mem_position(a0),old_mem_position(a0)
		move.l	d0,mem_position(a0)

                move.l	mem_position(a0),a2
		btst.b	#water_here_bit_num,3(a2)
		bne.s	.end
		move.w	player_num(a0),d0
		PUSH_MESG_RAND d0

.end		move.w	#-1,bumping_into(a1)
		move.w	#-1,bumping_into(a0)

		bsr	lay_path
		bsr	put_head_in_map
		move.l	a1,a0
		bsr	lay_path
		bsr	put_head_in_map

		st.b	variables+redraw_flag(a5)
.no_bump	rts

****************************************************************************
****************************************************************************
****************************************************************************
;A routine to test the movements of the players.
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	a0-a2,d0
check_players_controls
		move.l	a4,-(sp)

		lea	variables+player1(a5),a0
		lea	global_vars+player1_stats(a5),a3
		bsr.s	.check_player_controls

		lea	variables+player2(a5),a0
		lea	global_vars+player2_stats(a5),a3
		bsr.s	.check_player_controls

		lea	variables+player3(a5),a0
		lea	global_vars+player3_stats(a5),a3
		bsr.s	.check_player_controls

		lea	variables+player4(a5),a0
		lea	global_vars+player4_stats(a5),a3
		bsr.s	.check_player_controls

		lea	variables+player1(a5),a0
		bsr	lay_path
		lea	variables+player2(a5),a0
		bsr	lay_path
		lea	variables+player3(a5),a0
		bsr	lay_path
		lea	variables+player4(a5),a0
		bsr	lay_path

		move.l	(sp)+,a4

		rts

.check_player_controls
		tst.w   dead_flag2(a0)
		bne.s	.no_action
		cmpi.w	#7,window_type(a0)
		beq.s	.no_action
		tst.b	control_method(a0)
		beq	.no_action

		move.l	mem_position(a0),a2
		move.l	a2,old_mem_position(a0)

		moveq.l	#0,d0
		move.b	control_action(a0),d0	;d0=control code
		beq.s	.action_table

	IFD	demo
		tst.b	global_vars+playtime(a5)
		beq.s	.not_playtime
		clr.w	logo_count
.not_playtime
	ENDC

		sf.b	control_action(a0)
		lea	.action_table(pc),a1
		lsl.w	#2,d0
		jmp	0(a1,d0.w)

.no_action

.action_table	rts				;0
		nop
		bra.w	forward			;1
		bra.w	backward		;2
		bra.w	turn_left		;3
		bra.w	turn_right		;4
		bra.w   activate		;5
		bra.w	pull			;6
		bra.w	left_window		;7
		bra.w	right_window		;8
		bra.w	views_window		;9
		bra.w	store_window		;10
		bra.w	vdu_window		;11
		bra.w	stats_window		;12
		bra.w	sidestep_right		;13
		bra.w	sidestep_left		;14
		bra.w	pick_up			;15
		bra.w	set_team		;16
		bra.w	use_item		;17
		bra.w	reload_item		;18
		bra.w	summon_info		;19
		bra.w	lock_to_player		;20
		bra.w	leave_info		;21
		bra.w	pick_up_into_inven	;22
		bra.w	drop_item		;23
		bra.w	drop_from_inven		;24
		bra.w	throw_g			;25
		bra.w	throw_g4		;26
		bra.w	throw_g3		;27
		bra.w	throw_g2		;28
		bra.w	throw_g1		;29

****************************************************************************
****************************************************************************
****************************************************************************
throw_g
		cmpi.w	#0,window_type(a0)	;view?
		bne	.not_window1

		moveq.l	#0,d0
		move.b	direction(a0),d0

		move.l	a2,a3
		tst.b   d0
		bne.s	.not_north
		suba.l	#map_cell_size*MAP_WIDTH,a3
.not_north
		cmpi.b	#1,d0
		bne.s	.not_east
		add.l	#map_cell_size,a3
.not_east
		cmpi.b	#2,d0
		bne.s	.not_south
		add.l	#map_cell_size*MAP_WIDTH,a3
.not_south
		cmpi.b	#3,d0
		bne.s	.not_west
		sub.l	#map_cell_size,a3
.not_west
		move.l	(a3),d1
		btst.l	#opaque_bit_num,d1
		beq.s	.not_hit_wall
		move.l	a2,a3
.not_hit_wall
		moveq.l	#0,d1
		move.b	inven_using+inven_item_num(a0),d1
		subq.l	#1,d1
		mulu	#item_size,d1
		move.l	#items,a2
		add.l	d1,a2
		add.l	a5,a2

		move.w	throw_grenade(a0),d3

		tst.w	d3
		bne.s	.not0
		move.w	#-5,d1			;yvel
		move.w	#25,d2			;height
.not0
                cmpi.w	#1,d3
		bne.s	.not1
		move.w	#-20,d1			;yvel
		move.w	#25,d2			;height
.not1
                cmpi.w	#2,d3
		bne.s	.not2
		move.w	#-16,d1			;yvel
		move.w	#25,d2			;height
.not2
                cmpi.w	#3,d3
		bne.s	.not3
		move.w	#-9,d1			;yvel
		move.w	#25,d2			;height
.not3
		jsr	add_grenade

		tst.l	d0
		bne.s	.end
		sub.b	#1,inven_using+inven_item_gun_ammo(a0)
		bne.s	.end
		clr.w	using_grenade(a0)
		clr.b	inven_using+inven_item_num(a0)
		st.b	variables+redraw_flag(a5)
.end
.not_window1
		rts

****************************************************************************
****************************************************************************
****************************************************************************

throw_g1	move.w	#0,throw_grenade(a0)
		bra	throw_g

throw_g2	move.w	#1,throw_grenade(a0)
		bra	throw_g

throw_g3	move.w	#2,throw_grenade(a0)
		bra	throw_g

throw_g4	move.w	#3,throw_grenade(a0)
		bra	throw_g

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT :	a2.l = address of player
;		a1.l = address of destination
;		d2.l = aux for stairs up
;		d3.l = block for stairs down
;		d4.b = amount to move on x
;		d5.b = amount to move on y
;		d6.b = amount to move on z
;OUTPUT :	d0.l = movement flag (0 = end, 1 = bump, 2 = moved)
;       	( d1.l = bumped into )
;		a2.l = new address of player

move
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

.move		move.l	(a1),d1
		and.l	#keep_block!keep_opaque_bit,d1
		beq.s	.no_obstruction
		cmpi.l	#(20<<block_shift)!keep_block_here_bit,d1
		blt.s	.bump
		cmpi.l	#(21<<block_shift)!keep_block_here_bit,d1
		bgt.s	.bump
		move.l	a1,a3
		jsr	open_door
		bra	.end
.no_obstruction
		move.l	(a1),d1
		and.l	#keep_floor,d1			;about to stand on floor ?
		bne	.moved				;yes, then branch
		move.l	-map_cell_size*MAP_WIDTH*MAP_DEPTH(a1),d1
		and.l	#keep_block,d1
		beq.s	.going_to_fall
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
.going_to_fall
		tst.w	auto_move(a0)
		bne	.end
		bra	.moved

;-------------------------------------------------------------------------------

.bump		tst.w	auto_move(a0)
		bne	.end_bump

		move.l	(a1),d1
		move.w	#block_shift,d0
		and.l	#keep_block,d1
		ror.l	d0,d1

		cmpi.b	#6,d1
		bne.s	.not_teleport
		move.l	a1,a3
		jsr	teleport
		bra	.end_bump
.not_teleport
		cmpi.b	#2,d1
		bne.s	.not_boost
		move.l	a1,a3
		jsr	boost
		bra	.end_bump
.not_boost
		move.w	#-1,bumping_into(a0)
		cmpi.b	#32,d1
		blt.s	.not_player
		cmpi.b	#47,d1
		bgt.s	.not_player
		move.l	(a1),d0
		bsr	find_heads_owner
		move.w	d2,bumping_into(a0)
		bra	.end_bump
.not_player
		cmpi.b	#3,d1
		bne.s	.not_exit
;		move.b	cheat_mode,d0
;		add.b	cheat_mode2,d0
;		add.b	cheat_mode3,d0
;		bne.s	.not_exit
		move.w	#7,window_type(a0)
		st.b	variables+redraw_flag(a5)	;set redraw flag
		move.l	#miscsfx,a1
		add.l	chip_mem_base,a1
		PLAY_SAMPLE a1,#3,aud_ch(a0),#63,#683
		rts
.not_exit
		move.l	#miscsfx,a1
		add.l	chip_mem_base,a1
		PLAY_SAMPLE a1,#9,aud_ch(a0),#63,#428

.end_bump	bsr	put_head_in_map
		rts

;-------------------------------------------------------------------------------

.moved		move.l	a1,mem_position(a0)
		move.l	a1,a2
		add.b	d4,xpos(a0)
		add.b	d5,ypos(a0)
		add.b	d6,floor(a0)
		st.b	variables+redraw_flag(a5)	;set redraw flag

		move.l	#miscsfx,a1
		add.l	chip_mem_base,a1
		tst.w	fire_anim(a0)
		bne.s	.firing
		PLAY_SAMPLE a1,#8,aud_ch(a0),#63,footstep_period(a0)
.firing
		bsr	put_head_in_map

		jsr	check_pad_released
		jsr	check_pad_pushed
		jsr	test_mine

		clr.w	lock_count(a0)
		clr.w	blocked2_count(a0)
		clr.w	used_count(a0)
		rts

;-------------------------------------------------------------------------------

.end		bsr	put_head_in_map
		rts

********************************************************************************
********************************************************************************
********************************************************************************

forward		cmpi.w	#0,window_type(a0)	;view?
		bne	.window1

		bsr	set_leader

		andi.l	#erase_person,(a2)		;remove person

		tst.b	direction(a0)
		bne	.not_north
		lea	-map_cell_size*MAP_WIDTH(a2),a1
		move.l	#(8<<aux_shift)!keep_aux_here_bit,d2		;up
		move.l	#(18<<block_shift)!keep_block_here_bit,d3	;down
		move.b	#0,d4						;x
		move.b	#-1,d5						;y
		move.b	#0,d6						;floor
.not_north
		cmpi.b	#1,direction(a0)
		bne	.not_east
		lea	map_cell_size(a2),a1
		move.l	#(9<<aux_shift)!keep_aux_here_bit,d2		;up
		move.l	#(19<<block_shift)!keep_block_here_bit,d3	;down
		move.b	#1,d4						;x
		move.b	#0,d5						;y
		move.b	#0,d6						;floor
.not_east
		cmpi.b	#2,direction(a0)
		bne	.not_south
		lea	map_cell_size*MAP_WIDTH(a2),a1
		move.l	#(10<<aux_shift)!keep_aux_here_bit,d2		;up
		move.l	#(16<<block_shift)!keep_block_here_bit,d3	;down
		move.b	#0,d4						;x
		move.b	#1,d5						;y
		move.b	#0,d6						;floor
.not_south
		cmpi.b	#3,direction(a0)
		bne	.not_west
		lea	-map_cell_size(a2),a1
		move.l	#(11<<aux_shift)!keep_aux_here_bit,d2		;up
		move.l	#(17<<block_shift)!keep_block_here_bit,d3	;down
		move.b	#-1,d4						;x
		move.b	#0,d5						;y
		move.b	#0,d6						;floor
.not_west
		bra	move

;-------------------------------------------------------------------------------

.window1	cmpi.w	#1,window_type(a0)		;store?
		bne.s	.window2
		tst.w   inven_posn(a0)
		beq.s	.not_up
		subi.w	#1,inven_posn(a0)
		st.b	variables+redraw_flag(a5)	;set redraw flag
.not_up		rts

;-------------------------------------------------------------------------------

.window2	cmpi.w	#2,window_type(a0)		;vdu?
		bne	.window3
		cmpi.b	#2,scroll_y(a0)
		ble.s	.end_win2
		subi.b	#1,scroll_y(a0)
		st.b	variables+redraw_flag(a5)	;set redraw flag
.end_win2	rts

;-------------------------------------------------------------------------------

.window3	rts

********************************************************************************
********************************************************************************
********************************************************************************

backward	cmpi.w	#0,window_type(a0)	;view?
		bne	.window1

		bsr	set_leader

		andi.l	#erase_person,(a2)		;remove person

		tst.b	direction(a0)
		bne	.not_north
		lea	map_cell_size*MAP_WIDTH(a2),a1
		move.l	#(10<<aux_shift)!keep_aux_here_bit,d2		;up
		move.l	#(16<<block_shift)!keep_block_here_bit,d3	;down
		move.b	#0,d4						;x
		move.b	#1,d5						;y
		move.b	#0,d6						;floor
.not_north
		cmpi.b	#1,direction(a0)
		bne	.not_east
		lea	-map_cell_size(a2),a1
		move.l	#(11<<aux_shift)!keep_aux_here_bit,d2		;up
		move.l	#(17<<block_shift)!keep_block_here_bit,d3	;down
		move.b	#-1,d4						;x
		move.b	#0,d5						;y
		move.b	#0,d6						;floor
.not_east
		cmpi.b	#2,direction(a0)
		bne	.not_south
		lea	-map_cell_size*MAP_WIDTH(a2),a1
		move.l	#(8<<aux_shift)!keep_aux_here_bit,d2		;up
		move.l	#(18<<block_shift)!keep_block_here_bit,d3	;down
		move.b	#0,d4						;x
		move.b	#-1,d5						;y
		move.b	#0,d6						;floor
.not_south
		cmpi.b	#3,direction(a0)
		bne	.not_west
		lea	map_cell_size(a2),a1
		move.l	#(9<<aux_shift)!keep_aux_here_bit,d2		;up
		move.l	#(19<<block_shift)!keep_block_here_bit,d3	;down
		move.b	#1,d4						;x
		move.b	#0,d5						;y
		move.b	#0,d6						;floor
.not_west
		bra	move

;-------------------------------------------------------------------------------

.window1	cmpi.w	#1,window_type(a0)		;store?
		bne	.window2

		cmpi.w	#inven_size-1,inven_posn(a0)	;end of inven?
		beq.s	.not_down

		move.w	inven_posn(a0),d1
		addq.l	#1,d1
		mulu.w	#inven_item_size,d1
		lea     inven_store(a0),a2
		tst.b	inven_item_num(a2,d1.w)		;another item in inven?
		beq.s	.not_down

		addi.w	#1,inven_posn(a0)
		st.b	variables+redraw_flag(a5)	;set redraw flag
.not_down	rts

;-------------------------------------------------------------------------------

.window2	cmpi.w	#2,window_type(a0)		;vdu?
		bne	.window3
		cmpi.b	#20,scroll_y(a0)
		bge.s	.end_win2
		addi.b	#1,scroll_y(a0)
		st.b	variables+redraw_flag(a5)	;set redraw flag
.end_win2	rts

;-------------------------------------------------------------------------------

.window3	rts

****************************************************************************
****************************************************************************
****************************************************************************

sidestep_right	cmpi.w	#0,window_type(a0)	;view?
		bne	.window1

		bsr	set_leader

		andi.l	#erase_person,(a2)		;remove person

		tst.b	direction(a0)
		bne	.not_north
		lea	map_cell_size(a2),a1
		move.l	#(9<<aux_shift)!keep_aux_here_bit,d2		;up
		move.l	#(19<<block_shift)!keep_block_here_bit,d3	;down
		move.b	#1,d4						;x
		move.b	#0,d5						;y
		move.b	#0,d6						;floor
.not_north
		cmpi.b	#1,direction(a0)
		bne	.not_east
		lea	map_cell_size*MAP_WIDTH(a2),a1
		move.l	#(10<<aux_shift)!keep_aux_here_bit,d2		;up
		move.l	#(16<<block_shift)!keep_block_here_bit,d3	;down
		move.b	#0,d4						;x
		move.b	#1,d5						;y
		move.b	#0,d6						;floor
.not_east
		cmpi.b	#2,direction(a0)
		bne	.not_south
		lea	-map_cell_size(a2),a1
		move.l	#(11<<aux_shift)!keep_aux_here_bit,d2		;up
		move.l	#(17<<block_shift)!keep_block_here_bit,d3	;down
		move.b	#-1,d4						;x
		move.b	#0,d5						;y
		move.b	#0,d6						;floor
.not_south
		cmpi.b	#3,direction(a0)
		bne	.not_west
		lea	-map_cell_size*MAP_WIDTH(a2),a1
		move.l	#(8<<aux_shift)!keep_aux_here_bit,d2		;up
		move.l	#(18<<block_shift)!keep_block_here_bit,d3	;down
		move.b	#0,d4						;x
		move.b	#-1,d5						;y
		move.b	#0,d6						;floor
.not_west
		bra	move

;-------------------------------------------------------------------------------

.window1	rts

****************************************************************************
****************************************************************************
****************************************************************************

sidestep_left	cmpi.w	#0,window_type(a0)	;view?
		bne	.window1

		bsr	set_leader

		andi.l	#erase_person,(a2)		;remove person

		tst.b	direction(a0)
		bne	.not_north
		lea	-map_cell_size(a2),a1
		move.l	#(11<<aux_shift)!keep_aux_here_bit,d2		;up
		move.l	#(17<<block_shift)!keep_block_here_bit,d3	;down
		move.b	#-1,d4						;x
		move.b	#0,d5						;y
		move.b	#0,d6						;floor
.not_north
		cmpi.b	#1,direction(a0)
		bne	.not_east
		lea	-map_cell_size*MAP_WIDTH(a2),a1
		move.l	#(8<<aux_shift)!keep_aux_here_bit,d2		;up
		move.l	#(18<<block_shift)!keep_block_here_bit,d3	;down
		move.b	#0,d4						;x
		move.b	#-1,d5						;y
		move.b	#0,d6						;floor
.not_east
		cmpi.b	#2,direction(a0)
		bne	.not_south
		lea	map_cell_size(a2),a1
		move.l	#(9<<aux_shift)!keep_aux_here_bit,d2		;up
		move.l	#(19<<block_shift)!keep_block_here_bit,d3	;down
		move.b	#1,d4						;x
		move.b	#0,d5						;y
		move.b	#0,d6						;floor
.not_south
		cmpi.b	#3,direction(a0)
		bne	.not_west
		lea	map_cell_size*MAP_WIDTH(a2),a1
		move.l	#(10<<aux_shift)!keep_aux_here_bit,d2		;up
		move.l	#(16<<block_shift)!keep_block_here_bit,d3	;down
		move.b	#0,d4						;x
		move.b	#1,d5						;y
		move.b	#0,d6						;floor
.not_west
		bra	move

;-------------------------------------------------------------------------------

.window1	rts

********************************************************************************
********************************************************************************
********************************************************************************

turn_left	cmpi.w	#0,window_type(a0)
		bne.s	.window1

		bsr	set_leader

.do_left	andi.l	#erase_person,(a2)		;remove person

		st.b	variables+redraw_flag(a5)	;set redraw flag
		sub.b	#1,direction(a0)		;turn to left
		bpl.s	.not_west			;should be west?
		move.b	#3,direction(a0)		;yes, then face west

.not_west	bsr	put_head_in_map
		clr.w	fire_anim(a0)
		clr.w	lock_count(a0)
		clr.w	blocked2_count(a0)
		clr.w	used_count(a0)
		rts

;-------------------------------------------------------------------------------

.window1	cmpi.w	#1,window_type(a0)		;inventory?
		bne	.window2

		tst.b	inven_using+inven_item_num(a0)
		beq.s	.no_room

		bsr	insert_item
		tst.w   d0
		bmi.s	.no_room
		lea	inven_using(a0),a1
		move.l	(a1),(a2)
		clr.b	inven_using+inven_item_num(a0)

		bsr	calc_weight

		st.b	variables+redraw_flag(a5)	;set redraw flag
.no_room	rts

;-------------------------------------------------------------------------------

.window2	cmpi.w	#2,window_type(a0)		;vdu?
		bne	.window3
		cmpi.b	#4,scroll_x(a0)
		ble.s	.end_win2
		subi.b	#1,scroll_x(a0)
		st.b	variables+redraw_flag(a5)	;set redraw flag
.end_win2	rts

;-------------------------------------------------------------------------------

.window3	rts

********************************************************************************
********************************************************************************
********************************************************************************

turn_right	cmpi.w	#0,window_type(a0)
		bne	.window1

		bsr	set_leader

.do_right	andi.l	#erase_person,(a2)		;remove person

		st.b	variables+redraw_flag(a5)	;set redraw flag
		add.b	#1,direction(a0)		;turn to right
		cmpi.b	#3,direction(a0)		;should be east?
		ble.s	.not_north			;yes, then face east
		clr.b	direction(a0)

.not_north	bsr	put_head_in_map
		clr.w	fire_anim(a0)
		clr.w	lock_count(a0)
		clr.w	blocked2_count(a0)
		clr.w	used_count(a0)
		rts

;-------------------------------------------------------------------------------

.window1	cmpi.w	#1,window_type(a0)		;inventory?
		bne	.window2

		move.w	inven_posn(a0),d1
		mulu.w	#inven_item_size,d1
		lea     inven_store(a0),a2
		add.w	d1,a2
		tst.b	inven_item_num(a2)		;item in inven?
		beq.s	.not_use

		lea	inven_using(a0),a1

		tst.b	inven_item_num(a1)
		bne.s	.swap

		bsr	copy_item
		bsr	remove_item

		bsr	calc_weight
		st.b	variables+redraw_flag(a5)	;set redraw flag
		rts

.swap		lea	inven_temp(a0),a1
		bsr	copy_item
		move.l	a2,a1
		lea	inven_using(a0),a2
		bsr	copy_item
		move.l	a2,a1
		lea	inven_temp(a0),a2
		bsr	copy_item
		bsr	calc_weight
		st.b	variables+redraw_flag(a5)	;set redraw flag
.not_use	rts

;-------------------------------------------------------------------------------

.window2	cmpi.w	#2,window_type(a0)		;vdu?
		bne	.window3
		cmpi.b	#18,scroll_x(a0)
		bge.s	.end_win2
		addi.b	#1,scroll_x(a0)
		st.b	variables+redraw_flag(a5)	;set redraw flag
.end_win2	rts

;-------------------------------------------------------------------------------

.window3	rts

********************************************************************************
********************************************************************************
********************************************************************************

activate	tst.w	window_type(a0)
		bne.s	.window1

		bsr	set_leader

.do_activate	tst.b	direction(a0)			;push north?
		bne.s	.not_north
		move.w	#-w*map_cell_size,d0
		bsr     activate_it
		bra.s	.end
.not_north
		cmpi.b	#1,direction(a0)		;push east?
		bne.s	.not_east
		move.w	#map_cell_size,d0
		bsr     activate_it
		bra.s	.end
.not_east
		cmpi.b	#2,direction(a0)		;push south?
		bne.s	.not_south
		move.w	#w*map_cell_size,d0
		bsr     activate_it
		bra.s	.end
.not_south
		cmpi.b	#3,direction(a0)		;push west?
		bne.s	.end
		move.w	#-map_cell_size,d0
		bsr	activate_it

.end		rts

;-------------------------------------------------------------------------------

.window1	cmpi.b	#CNTRL_PAD1,control_method(a0)
		beq.s	.window2
		cmpi.b	#CNTRL_PAD2,control_method(a0)
		beq.s	.window2
		cmpi.w	#1,window_type(a0)		;inventory?
		bne	.window2
		bsr	pick_up_into_inven
		rts

;-------------------------------------------------------------------------------

.window2	rts

********************************************************************************

pull		tst.w	window_type(a0)
		bne	.window1

		bsr	set_leader

.do_pull	tst.b	direction(a0)			;north facing?
		bne.s	.not_south			;pull south
		move.w	#w*map_cell_size,d0
		bsr	pull_block
		bra.s	.end
.not_south
		cmpi.b	#1,direction(a0)		;east facing?
		bne.s	.not_west			;pull west
		move.w	#-map_cell_size,d0
		bsr	pull_block
		bra.s	.end
.not_west
		cmpi.b	#2,direction(a0)		;south facing?
		bne.s	.not_north			;pull north
		move.w	#-w*map_cell_size,d0
		bsr	pull_block
		bra.s	.end
.not_north
		cmpi.b	#3,direction(a0)		;west facing?
		bne.s	.end				;pull east
		move.w	#map_cell_size,d0
		bsr	pull_block

.end		rts

;-------------------------------------------------------------------------------

.window1	cmpi.b	#CNTRL_PAD1,control_method(a0)
		beq.s	.window2
		cmpi.b	#CNTRL_PAD2,control_method(a0)
		beq.s	.window2
		cmpi.w	#1,window_type(a0)		;inventory?
		bne	.window2
		bsr	drop_from_inven
		rts

;-------------------------------------------------------------------------------

.window2	rts

********************************************************************************
********************************************************************************
********************************************************************************

summon_info	cmpi.w	#6,window_type(a0)
		beq.s	.back_to_inven

		cmpi.w	#1,window_type(a0)
		bne.s	.nothing_to_info

		tst.b	inven_using+inven_item_num(a0)
		beq.s	.nothing_to_info

		move.w	#6,window_type(a0)
		st.b	variables+redraw_flag(a5)	;set redraw flag
.nothing_to_info
		rts

.back_to_inven	move.w	#1,window_type(a0)
		st.b	variables+redraw_flag(a5)	;set redraw flag
		rts

********************************************************************************
********************************************************************************
********************************************************************************

left_window	cmpi.w	#1,window_type(a0)
		bne.s	.not_inven
		bsr	clear_new_items
		move.w	#0,window_type(a0)
		st.b	variables+redraw_flag(a5)	;set redraw flag
		bra.s	.end
.not_inven
		cmpi.w	#2,window_type(a0)
		bne.s	.not_dts
		move.w	#1,window_type(a0)
		st.b	variables+redraw_flag(a5)	;set redraw flag
		bra.s	.end
.not_dts
		cmpi.w	#3,window_type(a0)
		bne.s	.not_stats
		move.w	#2,window_type(a0)
		st.b	variables+redraw_flag(a5)	;set redraw flag
		bra	vdu_window
.not_stats
.end		rts

********************************************************************************
********************************************************************************
********************************************************************************

right_window	cmpi.w	#0,window_type(a0)
		bne.s	.not_view
		move.w	#1,window_type(a0)
		st.b	variables+redraw_flag(a5)	;set redraw flag
		bra.s	.end
.not_view
		cmpi.w	#1,window_type(a0)
		bne.s	.not_inven
		bsr	clear_new_items
		move.w	#2,window_type(a0)
		st.b	variables+redraw_flag(a5)	;set redraw flag
		bra	vdu_window
.not_inven
		cmpi.w	#2,window_type(a0)
		bne.s	.not_stats
		move.w	#3,window_type(a0)
		st.b	variables+redraw_flag(a5)	;set redraw flag
		bra	stats_window
.not_stats
.end		rts

********************************************************************************

views_window
		cmpi.w	#1,window_type(a0)
		bne.s	.not_inven
		bsr	clear_new_items
.not_inven
		move.w	#0,window_type(a0)
		st.b	variables+redraw_flag(a5)	;set redraw flag
		rts

********************************************************************************

store_window
		move.w	#1,window_type(a0)
		st.b	variables+redraw_flag(a5)	;set redraw flag
		rts

********************************************************************************

vdu_window
		cmpi.w	#1,window_type(a0)
		bne.s	.not_inven
		bsr	clear_new_items
.not_inven
		PLAY_EX_SAMPLE #5,aud_ch(a0),#63,#360

		move.b	xpos(a0),scroll_x(a0)
		move.b	ypos(a0),scroll_y(a0)
		move.w	#2,window_type(a0)
		st.b	variables+redraw_flag(a5)	;set redraw flag
		rts

********************************************************************************

stats_window
		cmpi.w	#1,window_type(a0)
		bne.s	.not_inven
		bsr	clear_new_items
.not_inven
		move.w	#3,window_type(a0)
		st.b	variables+redraw_flag(a5)	;set redraw flag
		rts

********************************************************************************

lock_to_player	move.b	xpos(a0),scroll_x(a0)
		move.b	ypos(a0),scroll_y(a0)
		st.b	variables+redraw_flag(a5)	;set redraw flag
		rts

********************************************************************************

leave_info	move.w	#1,window_type(a0)
		st.b	variables+redraw_flag(a5)	;set redraw flag
		rts

********************************************************************************

clear_new_items
		movem.l	a0/d1,-(sp)
		lea	inven_using(a0),a0
		move.w	#inven_size+1,d1
.loop		clr.b   inven_item_outlined(a0)
		add.w	#inven_item_size,a0
		dbf	d1,.loop
		movem.l	(sp)+,a0/d1
		rts

********************************************************************************

pick_up_into_inven
		cmpi.w	#1,window_type(a0)
		bgt	.nothing_to_pick_up

		tst.b	tooheavy(a0)
		bne	.nothing_to_pick_up

		move.l  (a2),d0
		btst.l	#aux_here_bit_num,d0
		beq	.nothing_to_pick_up

		and.l	#keep_aux,d0
		cmp.l	#(7<<aux_shift)!keep_aux_here_bit,d0
		bne.s	.not_skel
		move.l	mem_position(a0),a1
		add.l	#map_part_size,a1
		move.l	(a1),d2
		and.l	#keep_aux_data,d2
		move.w	#aux_data_shift,d1
		lsr.l	d1,d2
		lea	variables+player1(a5),a3
		mulu	#player_struct_size,d2
		add.w	d2,a3
		moveq.l	#0,d0
		lea	inven_using(a3),a2
		move.b	inven_item_num(a2),d0
		bne.s	.get_this
		lea	inven_store(a3),a2
		move.b	inven_item_num(a2),d0
		beq	.nothing_to_pick_up

.get_this	move.l	a2,a1
		movem.l	d0-d1,-(sp)
		movem.l	a1/a3,-(sp)
		bsr	insert_item
		movem.l	(sp)+,a1/a3
		tst.w   d0
		bmi	.no_room
		movem.l	(sp)+,d0-d1
		move.b	d0,inven_item_num(a2)
		move.b	inven_item_damage(a1),inven_item_damage(a2)
		move.b	inven_item_gun_ammo(a1),inven_item_gun_ammo(a2)
		st.b	inven_item_outlined(a2)
		move.l	a0,-(sp)
		move.l	a3,a0
		move.l	a1,a2
		bsr	remove_item
		move.l	(sp)+,a0
		bsr	calc_weight
		st.b	variables+redraw_flag(a5)	;set redraw flag
		rts
.not_skel
		move.l	mem_position(a0),a1
		add.l	#map_part_size*2,a1

		move.l	(a1),d0
		move.l	d0,d1
		and.l	#keep_item_type,d0
		beq.s	.empty

		movem.l	d0-d1,-(sp)

		bsr	insert_item
		tst.w   d0
		bmi.s	.no_room

		movem.l	(sp)+,d0-d1

		move.b	d0,inven_item_num(a2)

		move.l	mem_position(a0),a1
		and.l	#erase_aux,(a1)

		move.w	#item_damage_shift,d2
		move.l	d1,d0
		and.l	#keep_item_damage,d0
		ror.l	d2,d0
		move.b	d0,inven_item_damage(a2)

		move.w	#32-item_ammo_shift,d2
		move.l	d1,d0
		and.l	#keep_item_ammo,d0
		rol.l	d2,d0
		move.b	d0,inven_item_gun_ammo(a2)

		st.b	inven_item_outlined(a2)

		bsr	calc_weight

		st.b	variables+redraw_flag(a5)	;set redraw flag
.ret		rts

.no_room
		move.w	#150,noroom_count(a0)
		movem.l  (sp)+,d0-d1
		rts

.empty		rts

.nothing_to_pick_up
		rts

********************************************************************************

pick_up		tst.b	tooheavy(a0)
		bne	.nothing_to_pick_up

		move.l  (a2),d0
		btst.l	#aux_here_bit_num,d0
		beq	.nothing_to_pick_up

		and.l	#keep_aux,d0
		cmp.l	#(7<<aux_shift)!keep_aux_here_bit,d0
		bne	.not_skel
		move.l	mem_position(a0),a1
		add.l	#map_part_size,a1
		move.l	(a1),d2
		and.l	#keep_aux_data,d2
		move.w	#aux_data_shift,d1
		lsr.l	d1,d2
		lea	variables+player1(a5),a3
		mulu	#player_struct_size,d2
		add.w	d2,a3
		moveq.l	#0,d0
		lea	inven_using(a3),a2
		move.b	inven_item_num(a2),d0
		bne.s	.get_this
		lea	inven_store(a3),a2
		move.b	inven_item_num(a2),d0
		beq.s	.nothing_to_pick_up

.get_this	movem.l	d0/a2-a3,-(sp)
		lea	inven_using(a0),a2
		tst.b	inven_item_num(a2)
		beq.s	.not_using_anything
		bsr	insert_item
		tst.w   d0
		bmi.s	.no_room2
		lea	inven_using(a0),a1
		move.l	(a1),(a2)
		clr.b	inven_using+inven_item_num(a0)
.not_using_anything
		movem.l	(sp)+,d0/a2-a3

		move.l	a2,a1
		lea	inven_using+inven_item_num(a0),a2

		move.b	d0,inven_item_num(a2)
		move.b	inven_item_damage(a1),inven_item_damage(a2)
		move.b	inven_item_gun_ammo(a1),inven_item_gun_ammo(a2)
		move.l	a0,-(sp)
		move.l	a3,a0
		move.l	a1,a2
		bsr	remove_item
		move.l	(sp)+,a0
		bsr	calc_weight
		st.b	variables+redraw_flag(a5)	;set redraw flag
		rts
.dont_get
.not_skel
		bsr	get_item

.nothing_to_pick_up
		rts

.no_room
		move.w	#150,noroom_count(a0)
		movem.l  (sp)+,d0-d1
		rts

.no_room2
		move.w	#150,noroom_count(a0)
		movem.l  (sp)+,d0/a2-a3
		rts

********************************************************************************

set_team	cmpi.b	#2,global_vars+num_players(a5)
		blt.s	.not_2_pl
		bgt.s	.end

		cmpi.w	#1,player_num(a0)
		bne.s	.not_pl1
		clr.w	variables+leader1(a5)
.not_pl1	cmpi.w	#2,player_num(a0)
		bne.s	.not_pl2
		clr.w	variables+leader2(a5)
.not_pl2	cmpi.w	#3,player_num(a0)
		bne.s	.not_pl3
		clr.w	variables+leader1(a5)
.not_pl3	cmpi.w	#4,player_num(a0)
		bne.s	.not_pl4
		clr.w	variables+leader2(a5)
.not_pl4	bra.s	.skip_not_2_pl
.not_2_pl	clr.w	variables+leader1(a5)
.skip_not_2_pl
		tst.b	in_team(a0)
		beq.s	.set
		sf.b	in_team(a0)
		bra.s	.skip_set
.set		st.b	in_team(a0)
.skip_set
		jsr	draw_team
.end		rts

********************************************************************************

set_leader	tst.w	auto_move(a0)
		bne.s	.following

		tst.w	in_team(a0)
		beq.s	.not_in_team

		move.w	player_num(a0),d0
		addq.w	#1,d0

		cmpi.b	#2,global_vars+num_players(a5)
		blt.s	.not_2_pl
		bgt.s	.end

		cmpi.w	#1,d0
		bne.s	.not_pl1
		cmp.w	variables+leader1(a5),d0
		beq.s	.same_leader
		move.w	d0,variables+leader1(a5)
.not_pl1	cmpi.w	#2,d0
		bne.s	.not_pl2
		cmp.w	variables+leader2(a5),d0
		beq.s	.same_leader
		move.w	d0,variables+leader2(a5)
.not_pl2	cmpi.w	#3,d0
		bne.s	.not_pl3
		cmp.w	variables+leader1(a5),d0
		beq.s	.same_leader
		move.w	d0,variables+leader1(a5)
.not_pl3	cmpi.w	#4,d0
		bne.s	.not_pl4
		cmp.w	variables+leader2(a5),d0
		beq.s	.same_leader
		move.w	d0,variables+leader2(a5)
.not_pl4	bra.s	.skip_not_2_pl
.not_2_pl	cmp.w	variables+leader1(a5),d0
		beq.s	.same_leader
		move.w	d0,variables+leader1(a5)
.skip_not_2_pl
		addi.w	#20,d0
		PUSH_MESG_RAND d0
.following
.not_in_team
.same_leader
.end		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a0=address of players structure (long)
;		d0=map cell (word)
;		a3=address of player stats structure (long)
;OUTPUT:	none
;CHANGES:	none

get_item	move.l	mem_position(a0),a1
		add.l	#map_part_size*2,a1
		move.l	(a1),d1

		move.l	d1,d0
		and.l	#keep_item_type,d0
		beq.s	.empty

		lea	inven_using(a0),a2

		movem.l	d0/a2,-(sp)

		tst.b	inven_item_num(a2)
		beq.s	.not_using_anything
		bsr	insert_item
		tst.w   d0
		bmi.s	.no_room
		lea	inven_using(a0),a1
		move.l	(a1),(a2)
		clr.b	inven_using+inven_item_num(a0)
.not_using_anything

		movem.l	(sp)+,d0/a2

		move.b	d0,inven_item_num(a2)

		move.l	mem_position(a0),a1
		and.l	#erase_aux,(a1)

		move.w	#item_damage_shift,d2
		move.l	d1,d0
		and.l	#keep_item_damage,d0
		ror.l	d2,d0
		move.b	d0,inven_item_damage(a2)

		move.w	#32-item_ammo_shift,d2
		move.l	d1,d0
		and.l	#keep_item_ammo,d0
		rol.l	d2,d0
		move.b	d0,inven_item_gun_ammo(a2)

		bsr	calc_weight

		st.b	variables+redraw_flag(a5)	;set redraw flag
.ret		rts

.no_room
		move.w	#150,noroom_count(a0)
		movem.l  (sp)+,d0/a2
		rts

.empty		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a0=address of players structure (long)
;OUTPUT:	none
;CHANGES:	none

water_damage_items
		cmpi.w	#100,spell_water(a0)
		beq.s	.water_proof

                movem.l d0-d3/a1-a3,-(sp)

		lea	inven_using(a0),a1
		bsr	.water_damage

		lea	inven_store(a0),a1
		move.w	#inven_size-1,d0
.loop		bsr     .water_damage
                add.l	#inven_item_size,a1
		dbf	d1,.loop

                movem.l (sp)+,d0-d3/a1-a3

		bsr	calc_weight

.water_proof	rts

.water_damage
		moveq.l	#0,d2
		move.b	inven_item_num(a1),d2
		beq.s	.no_item

		subq.l	#1,d2
		mulu	#item_size,d2
		move.l	#items,a3
		add.l	d2,a3
		add.l	a5,a3

		moveq.l	#0,d0
		move.b	item_waterdamage(a3),d0
		beq.s	.no_item
		lsl.w	#8,d0

		moveq.l	#0,d3
		move.w	item_maxdamage(a3),d3
		beq.s	.indestructable

		st.b	variables+redraw_flag(a5)	;set redraw flag

		moveq.l	#0,d2
		move.b	inven_item_damage(a1),d2
		lsl.w	#8,d2
		add.w	d0,d2
		cmp.l	d3,d2
		bge.s	.destroyed
		lsr.w	#8,d2

		move.b	d2,inven_item_damage(a1)
		rts

.destroyed	move.b	item_container_type(a3),d0
		cmpi.b	#CONT_BIGCRATE,d0
		bne.s	.not_big
		move.b	#52,inven_item_num(a1)
		bra.s	.no_item
.not_big	cmpi.b	#CONT_SMALLCRATE,d0
		bne.s	.not_small
		move.b	#111,inven_item_num(a1)
		bra.s	.no_item
.not_small	move.b	#22,inven_item_num(a1)
.indestructable
.no_item	rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a0=address of players structure (long)
;OUTPUT:	none
;CHANGES:	none

calc_weight	movem.l	d0-d3/a1-a3,-(sp)

		moveq.l	#0,d3

		moveq.l	#0,d0
		move.b	inven_using+inven_item_num(a0),d0
		subq.l	#1,d0
		bmi.s	.not_g
		mulu	#item_size,d0
		move.l	#items,a1
		add.l	d0,a1
		add.l	a5,a1
		moveq.l	#0,d0
		cmpi.b	#CAT_GRENADE,item_category(a1)
		bne.s	.not_g
		move.w	#2,using_grenade(a0)
		bra.s	.skip_g
.not_g		clr.w	using_grenade(a0)
.skip_g
		moveq.l	#0,d2
		moveq.l	#0,d0
		move.b	inven_using+inven_item_num(a0),d0
		move.b	inven_using+inven_item_gun_ammo(a0),d3
		bsr	add_weight

		lea	inven_store(a0),a2
		move.w	#inven_size-1,d1
.loop		moveq.l	#0,d0
		move.b	inven_item_num(a2),d0
		move.b	inven_item_gun_ammo(a2),d3
		bsr	add_weight
                add.l	#inven_item_size,a2
		dbf	d1,.loop

		cmpi.w	#24,spell_wings(a0)
		bne.s	.not_feather
		moveq.l	#0,d2
.not_feather	move.l	d2,weight(a0)

		divu	#140,d2
		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a3
		add.w	d1,a3
		cmp.w	physique(a3),d2
		ble.s	.ok
		move.w	#50,heavy_count(a0)
		tst.b	tooheavy(a0)
		bne.s	.skip
		st.b	variables+redraw_flag(a5)	;set redraw flag
		st.b	tooheavy(a0)
		bra.s	.skip
.ok		tst.b	tooheavy(a0)
		beq.s	.skip
		st.b	variables+redraw_flag(a5)	;set redraw flag
		clr.b	tooheavy(a0)
.skip		movem.l	(sp)+,d0-d3/a1-a3
		rts

add_weight
		subq.l	#1,d0
		bmi.s	.no_item
		mulu	#item_size,d0
		move.l	#items,a1
		add.l	d0,a1
		add.l	a5,a1
		moveq.l	#0,d0
		move.w	item_weight(a1),d0
                cmpi.b	#CAT_SENTRY,item_category(a1)
		beq.s	.ammo
                cmpi.b	#CAT_GRENADE,item_category(a1)
		beq.s	.ammo
                cmpi.b	#CAT_AMMO,item_category(a1)
		bne.s	.not_ammo
.ammo		mulu	d3,d0
.not_ammo	add.l	d0,d2
.no_item	rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a0=address of players structure (long)
;OUTPUT:	none
;CHANGES:	none

count_items	movem.l	d0-d2/a2,-(sp)

		moveq.l	#0,d2

		tst.b	inven_using+inven_item_num(a0)
		beq.s	.using_nothing
		addq.w	#1,d2
.using_nothing

		lea	inven_store(a0),a2
		move.w	#inven_size-1,d1
.loop
		tst.b	inven_item_num(a2)
		beq.s	.nothing
		addq.w	#1,d2
.nothing	add.l	#inven_item_size,a2
		dbf	d1,.loop

		move.w	d2,inven_num_items(a0)

		movem.l	(sp)+,d0-d2/a2
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a0=address of players structure (long)
;OUTPUT:	none
;CHANGES:	none
drop_from_inven
		tst.b	inven_using+inven_item_num(a0)
		beq.s	.hands_empty

		bsr	inven_to_hands
		tst.l	d0
		bne.s	.skip
		bsr	drop_item
.skip		bsr	inven_to_hands
		bsr	calc_weight
		st.b	variables+redraw_flag(a5)	;set redraw flag
		rts

.hands_empty
		bsr	inven_to_hands
		tst.l	d0
		bne.s	.skip2
		bsr	drop_item
		tst.l	d0
		beq.s	.skip2
		bsr	insert_item
		lea	inven_using(a0),a1
		move.l	(a1),(a2)
		clr.b	inven_using+inven_item_num(a0)
.skip2
		bsr	calc_weight
		st.b	variables+redraw_flag(a5)	;set redraw flag
		rts

inven_to_hands
		move.w	inven_posn(a0),d1
		mulu.w	#inven_item_size,d1
		lea     inven_store(a0),a2
		add.w	d1,a2
		tst.b	inven_item_num(a2)		;item in inven?
		beq.s	.not_use

		lea	inven_using(a0),a1
		tst.b	inven_item_num(a1)
		bne.s	.swap
		bsr	copy_item
		bsr	remove_item
		bra.s	.ok

.swap		lea	inven_temp(a0),a1
		bsr	copy_item
		move.l	a2,a1
		lea	inven_using(a0),a2
		bsr	copy_item
		move.l	a2,a1
		lea	inven_temp(a0),a2
		bsr	copy_item

.ok		moveq.l	#0,d0
		rts
.not_use	moveq.l	#-1,d0
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a0=address of players structure (long)
;OUTPUT:	none
;CHANGES:	none

drop_item	lea	inven_using(a0),a2

		tst.b	inven_item_num(a2)
		beq	.nothing_to_drop

		move.l	mem_position(a0),a1
		move.l	(a1),d0

		and.l	#keep_aux,d0
		beq	.not_skel
		cmp.l	#(0<<aux_shift)!keep_aux_here_bit,d0
		beq	.field_generator
		cmp.l	#(7<<aux_shift)!keep_aux_here_bit,d0
		bne	.no_room
		move.l	mem_position(a0),a1
		add.l	#map_part_size,a1
		move.l	(a1),d2
		and.l	#keep_aux_data,d2
		move.w	#aux_data_shift,d1
		lsr.l	d1,d2
		lea	variables+player1(a5),a3
		mulu	#player_struct_size,d2
		add.w	d2,a3

		moveq.l	#0,d0
		lea	inven_store-inven_item_size(a3),a2
.next		lea	inven_item_size(a2),a2
		addq.w	#1,d0
		cmp.w	#inven_size,d0
		bgt	.no_room2
		tst.b	inven_item_num(a2)
		bne.s	.next
.put_here
		move.l	inven_using(a0),(a2)
		clr.l	inven_using(a0)

		bsr	calc_weight
		st.b	variables+redraw_flag(a5)	;set redraw flag
		moveq.l	#0,d0
		rts

.no_room2	lea	inven_using(a3),a2
		tst.b	inven_item_num(a2)
		beq.s	.put_here
		bra	.no_room
.not_skel

		move.l	(a1),d0
		btst.l	#floor_here_bit_num,d0
		bne.s	.floor
		move.l	-map_cell_size*MAP_WIDTH*MAP_DEPTH(a1),d0
		btst.l	#block_here_bit_num,d0
		beq.s	.no_room
.floor
		moveq.l	#0,d1
		move.b	inven_item_num(a2),d1

		moveq.l	#0,d0
		move.b	inven_item_damage(a2),d0
		move.w	#item_damage_shift,d2
		rol.l	d2,d0
		or.l	d0,d1

		moveq.l	#0,d0
		move.b	inven_item_gun_ammo(a2),d0
		move.w	#item_ammo_shift,d2
		rol.l	d2,d0
		or.l	d0,d1

		moveq.l	#0,d0
		move.b	inven_item_num(a2),d0
		subq.l	#1,d0
		mulu	#item_size,d0
		move.l	#items,a3
		add.l	a5,a3
		add.l	d0,a3
		moveq.l	#0,d0
		move.b	item_container_type(a3),d0

		move.w	#32-aux_shift,d2
		ror.l	d2,d0
		or.l	#keep_aux_here_bit,d0
		or.l	d0,(a1)

		add.l	#map_part_size*2,a1
		and.l	#erase_item_type&erase_item_damage&erase_item_ammo,(a1)
		or.l	d1,(a1)

		clr.b	inven_item_num(a2)

		bsr	calc_weight
		st.b	variables+redraw_flag(a5)	;set redraw flag
.nothing_to_drop
		moveq.l	#0,d0
		rts

.no_room	move.w	#150,noroom_count(a0)
		st.b	variables+redraw_flag(a5)	;set redraw flag
		moveq.l	#-1,d0
		rts

.field_generator
		move.l	#locn+locn_style,a1
		add.l	a5,a1
		cmp.b	#4,(a1)
		bne.s	.no_room
		move.l	mem_position(a0),a1
		add.l	#map_part_size,a1
		move.l	(a1),d0
		and.l	#keep_aux_data,d0
		move.w	#aux_data_shift,d1
		lsr.l	d1,d0

		move.l	#items,a1
		add.l	a5,a1
		moveq.l	#0,d1
		move.b	inven_item_num(a2),d1
		subq.w	#1,d1
		mulu	#item_size,d1
		add.l	d1,a1

		cmp.b	#CAT_NUKE,item_category(a1)
		bne.s	.no_room
		cmp.b	itemnuke_num(a1),d0
		bne.s	.no_room

		move.l	mem_position(a0),a1
		and.l	#erase_aux,(a1)
		or.l	#(1<<aux_shift)!keep_aux_here_bit,(a1)

		addi.w	#1,variables+nukes_armed(a5)

		cmp.w	#4,variables+nukes_armed(a5)
		bne.s	.not_all_4
		movem.l	d0-d2/a0-a2,-(sp)
		move.l	#mesgs,a0
		add.l	a5,a0
		add.w	100(a0),a0
		jsr	push_msg
		movem.l	(sp)+,d0-d2/a0-a2
.not_all_4

		clr.b	inven_item_num(a2)
		bsr	calc_weight
		st.b	variables+redraw_flag(a5)	;set redraw flag
		moveq.l	#0,d0
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a0=address of players structure (long)
;		d0=number of item to find (byte)
;OUTPUT:	a2=address of carried item (long, 0=not found)
;CHANGES:	none

carrying_item	movem.l	d0-d1,-(sp)

		lea	inven_using(a0),a2
		cmp.b	inven_item_num(a2),d0
		beq.s	.found_item

		lea	inven_store(a0),a2
		move.w	#inven_size-1,d1
.loop		cmp.b	inven_item_num(a2),d0
		beq.s	.found_item
                add.l	#inven_item_size,a2
		dbf	d1,.loop

.not_found_item	suba.l	a2,a2
.found_item	movem.l	(sp)+,d0-d1
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a2=address of source (long)
;		a1=address of destination (long)
;OUTPUT:	none
;CHANGES:       d0

copy_item	move.l	(a2),(a1)
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;Shuffle up rest of items in inven when one is removed.
;INPUT:		a0=address of players structure (long)
;		a2=address of item to remove (long)
;OUTPUT:	none
;CHANGES:       d0,a1-a3

remove_item	lea	inven_using(a0),a1
		cmpa.l	a1,a2
		beq	.end

		lea	inven_end_store(a0),a3

		move.l	a2,a1
		add.l	#inven_item_size,a2

		tst.b	inven_item_num(a2)
		bne.s	.into_loop
		clr.b	inven_item_num(a1)
		tst.w	inven_posn(a0)
		beq.s	.ret
		subi.w	#1,inven_posn(a0)
                bra.s	.ret

.loop		move.l	a2,a1
		add.l	#inven_item_size,a2

		tst.b	inven_item_num(a2)
		beq.s	.end
.into_loop	cmpa.l	a2,a3
		beq.s	.end

		bsr	copy_item
		bra.s	.loop

.end		clr.b	inven_item_num(a1)
.ret		bsr	calc_weight

		lea	inven_store(a0),a3
		move.w  inven_posn(a0),d0
		mulu	#inven_item_size,d0
		add.l	d0,a3

		tst.b	inven_item_num(a3)
		bne.s	.dont_scroll
		tst.w	inven_posn(a0)
		beq.s	.dont_scroll
		subi.w	#1,inven_posn(a0)
.dont_scroll
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;Shuffle down rest of items in inven when one is added.
;INPUT:		a0=address of players structure (long)
;OUTPUT:        a2=address of free space
;CHANGES:       d0,a1-a3

insert_item	lea	inven_end_store(a0),a2
		lea	inven_store(a0),a3
		move.w  inven_posn(a0),d0
		move.w  inven_posn(a0),last_posn(a0)
		mulu	#inven_item_size,d0
		add.l	d0,a3

		sub.l	#inven_item_size,a2
		tst.b   inven_item_num(a2)
		bne.s	.full

.loop		move.l	a2,a1
		sub.l	#inven_item_size,a2

		move.l	(a2),(a1)

		cmpa.l	a3,a2
		bgt.s	.loop

		moveq.l	#0,d0
		rts

.full		moveq.l	#-1,d0
		move.w	#150,noroom_count(a0)
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a0=address of players structure (long)
;		a2=address of source (long)
;		a3=address of player stats structure (long)
;OUTPUT:        a1=address of inven structure (long)
;		d1=full flag (-1=full, 0=ok)
;CHANGES:       none

add_item	movem.l	a0/a2-a3,-(sp)

		moveq.l	#0,d0
		move.w	item_weight(a2),d0
		add.l	weight(a0),d0
		divu	#140,d0

		cmp.w	physique(a3),d0
		ble.s	.ok
		st.b	variables+redraw_flag(a5)	;set redraw flag
		move.w	#150,heavy_count(a0)
		bra.s	.full
.ok
		lea	inven_end_store(a0),a2
		lea	inven_store(a0),a3
		move.w  inven_posn(a0),d0
		mulu	#inven_item_size,d0
		add.l	d0,a3

		sub.l	#inven_item_size,a2
		tst.b   inven_item_num(a2)
		bne.s	.full

.loop		move.l	a2,a1
		sub.l	#inven_item_size,a2

		move.l	(a2),(a1)

		cmpa.l	a3,a2
		bgt.s	.loop

		move.l	a2,a1

		movem.l	(sp)+,a0/a2-a3
		moveq.l	#0,d0
		rts

.full		movem.l	(sp)+,a0/a2-a3
		moveq.l	#-1,d0
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:         a0.l=player struct
;OUTPUT:	none
;CHANGES:	none

check_pad_pushed
		movem.l	d0-d7/a0-a4,-(sp)
		move.l	mem_position(a0),a2
		bra.s	check_pad_pushed2

;INPUT:         a2.l=memory postion
;OUTPUT:	none
;CHANGES:	none

check_pad_pushed_raw
		movem.l	d0-d7/a0-a4,-(sp)
check_pad_pushed2
		move.l	(a2),d0

		and.l	#keep_floor,d0
		cmp.l	#(1<<floor_shift)!keep_floor_here_bit,d0
		bne.s	.no_pad

		sub.l	#map_cell_size*MAP_WIDTH*MAP_DEPTH,a2
		move.l	(a2),d1

		move.w	#variant_shift,d2
		and.l	#keep_variant,d1
		ror.l	d2,d1
		mulu.w	#button_size,d1

		move.l	#map+buttons,a3
		add.l   a5,a3
		add.w	d1,a3			;button structure

		moveq.l	#0,d1
		move.b	button_action_in(a3),d1
		move.l	button_data_in(a3),d2
		bsr	do_button_action

		st.b	variables+redraw_flag(a5)	;set redraw flag

.no_pad		movem.l	(sp)+,d0-d7/a0-a4
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:         a0.l=player struct
;OUTPUT:	none
;CHANGES:	none

check_pad_released
		movem.l	d0-d7/a0-a4,-(sp)
		move.l	old_mem_position(a0),a2
		bra.s	check_pad_released2

;INPUT:         a2.l=memory postion
;OUTPUT:	none
;CHANGES:	none

check_pad_released_raw
		movem.l	d0-d7/a0-a4,-(sp)
check_pad_released2
		move.l	(a2),d0

		and.l	#keep_floor,d0
		cmp.l	#(1<<floor_shift)!keep_floor_here_bit,d0
		bne.s	.no_pad

		sub.l	#map_cell_size*MAP_WIDTH*MAP_DEPTH,a2
		move.l	(a2),d1

		move.w	#variant_shift,d2
		and.l	#keep_variant,d1
		ror.l	d2,d1
		mulu.w	#button_size,d1

		move.l	#map+buttons,a3
		add.l   a5,a3
		add.w	d1,a3			;button structure

		moveq.l	#0,d1
		move.b	button_action_out(a3),d1
		move.l	button_data_out(a3),d2
		bsr	do_button_action

		st.b	variables+redraw_flag(a5)	;set redraw flag

.no_pad		movem.l	(sp)+,d0-d7/a0-a4
		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:         d0.w=offset to map block in front of player
;		a2.l=memory position of player
;OUTPUT:	none
;CHANGES:	none

activate_it	move.l	0(a2,d0.w),d1
		btst.l	#pushable_bit_num,d1	;is block pushable?
		bne	.push			;yes, then push it

		move.l	0(a2,d0.w),d1
.push_ret	btst.l	#panel_here_bit_num,d1	;is there a panel?
		bne	.activate_panel		;yes, then activate it

.panel_ret	bra	use_item

.fire_ret
.end_activate	rts

****************************************************************************
.push		movem.l	a1-a3,-(sp)
		andi.l	#erase_person,(a2)	;remove person

		ext.l	d0
		add.l	d0,a2			;point to first block

		move.l	-map_cell_size*MAP_WIDTH*MAP_DEPTH(a2),d1
		btst.l	#block_here_bit_num,d1
		beq.s   .no_head
		and.l	#keep_block,d1
		cmpi.l	#(8<<block_shift),d1	;moving onto player/monsters head?
		blt.s   .no_head
		cmpi.l	#(47<<block_shift),d1
		bgt.s   .no_head
		cmpi.l	#(16<<block_shift),d1
		blt.s	.blocked2
		cmpi.l	#(21<<block_shift),d1
		blt.s	.no_head
.blocked2	move.l	(a2),d1
		btst.l	#floor_here_bit_num,d1
		beq	.blocked
.no_head
		move.l	a2,a1			;a1=address of first block

.no_space_yet	move.l	a1,a3			;a3=last block examined
		add.l	d0,a1
		move.l	(a1),d1

		btst.l	#pushable_bit_num,d1
		bne.s	.no_space_yet

		and.l	#keep_aux,d1
		beq.s	.next_move
		cmp.l	#(1<<aux_shift)!keep_aux_here_bit,d1
		beq.s	.next_move
		cmp.l	#(7<<aux_shift)!keep_aux_here_bit,d1
		bls	.blocked
.next_move
		bsr	move_pushable
		tst.l	d7
		bne	.blocked

		move.l	#miscsfx,a1
		add.l	chip_mem_base,a1
		PLAY_SAMPLE a1,#1,#1,#63,#452

		move.l	a3,a1
		cmpa.l	a2,a3			;all row moved?
		beq.s	.all_moved		;yes, then end
		sub.l	d0,a3			;move back in row
		bra.s	.next_move

.all_moved
		move.l	mem_position(a0),old_mem_position(a0)
		add.l	d0,mem_position(a0)	;head moves

		jsr	check_pad_released
		jsr	check_pad_pushed
		jsr	test_mine

		move.b	direction(a0),d0
		tst.b	d0
		bne.s	.not_north
		subi.b	#1,ypos(a0)
.not_north	cmpi.b	#1,d0
		bne.s	.not_east
		addi.b	#1,xpos(a0)
.not_east	cmpi.b	#2,d0
		bne.s	.not_south
		addi.b	#1,ypos(a0)
.not_south	cmpi.b	#3,d0
		bne.s	.not_west
		subi.b	#1,xpos(a0)
.not_west
		st.b	variables+redraw_flag(a5)	;set redraw flag

		bsr	put_head_in_map
		movem.l	(sp)+,a1-a3
		bra	.end_activate

.blocked	move.w	#150,blocked2_count(a0)
		st.b	variables+redraw_flag(a5)	;set redraw flag
		bsr	put_head_in_map
		movem.l	(sp)+,a1-a3
		bra	.end_activate

****************************************************************************
.activate_panel	move.l	d1,d3
		move.w	#panel_shift,d2
		and.l	#keep_panel,d3
		ror.l	d2,d3

		lea	.panel_table(pc),a3
		lsl.w	#2,d3
		jmp	0(a3,d3.w)

.panel_table	bra.w	.nothing			;0
		bra.w	button_in			;1
		bra.w	button_out			;2
		bra.w	.nothing			;3
		bra.w	.nothing			;4
		bra.w	.nothing			;5
		bra.w	.nothing			;6
		bra.w	.nothing			;7

.nothing	bra	.panel_ret

****************************************************************************
****************************************************************************
****************************************************************************
*
* 1. When a panel is pushed IN, button_in is called
* 2. When a panel is release OUT, button_out is called
* 3. Only players and pushable blocks trigger pads on the floor
* 4. When a player/pushable moves any onto a pad it is pushed IN until the
*    player/pushable moves off it again. The pad is only activated when
*    something steps off or on to it.
*
****************************************************************************
;INPUT:		a5.l=base address of fast memory
;		a2.l=address of player in map
;		d0.w=offset to map block in front of player

button_in
		move.l	0(a2,d0.w),d1

		move.w	#variant_shift,d2
		and.l	#keep_variant,d1
		ror.l	d2,d1
		mulu.w	#button_size,d1

		move.l	#map+buttons,a3
		add.l   a5,a3
		add.w	d1,a3			;button structure

		moveq.l	#0,d1
		move.b	button_action_out(a3),d1
		move.l	button_data_out(a3),d2
		movem.l	a2/d0,-(sp)
		bsr	do_button_action
		movem.l	(sp)+,a2/d0

		btst.b	#panel_here_bit_num,3(a2,d0.w)
		beq.s	.panel_gone
		and.l	#erase_panel,0(a2,d0.w)
		or.l	#(2<<panel_shift)!keep_panel_here_bit,0(a2,d0.w)
.panel_gone
		move.l	#miscsfx,a2
		add.l	chip_mem_base,a2
		PLAY_SAMPLE a2,#7,aud_ch(a0),#63,#182

		st.b	variables+redraw_flag(a5)	;set redraw flag

		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=base address of fast memory
;		a2.l=address of player in map
;		d0.w=offset to map block in front of player

button_out
		move.l	0(a2,d0.w),d1

		move.w	#variant_shift,d2
		and.l	#keep_variant,d1
		ror.l	d2,d1
		mulu.w	#button_size,d1

		move.l	#map+buttons,a3
		add.l   a5,a3
		add.w	d1,a3			;button structure

		moveq.l	#0,d1
		move.b	button_action_in(a3),d1
		move.l	button_data_in(a3),d2
		movem.l	a2/d0,-(sp)
		bsr	do_button_action
		movem.l	(sp)+,a2/d0

		btst.b	#panel_here_bit_num,3(a2,d0.w)
		beq.s	.panel_gone
		and.l	#erase_panel,0(a2,d0.w)
		or.l	#(1<<panel_shift)!keep_panel_here_bit,0(a2,d0.w)
.panel_gone
		move.l	#miscsfx,a2
		add.l	chip_mem_base,a2
		PLAY_SAMPLE a2,#7,aud_ch(a0),#63,#182

		st.b	variables+redraw_flag(a5)	;set redraw flag

		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=base address of fast memory
;		d2.l=button data
;		d1.w=button action
;		d0.w=offset to map block in front of player
;OUTPUT:	none
;CHANGES:       none

do_button_action
		lea	.action_table(pc),a3
		lsl.w	#2,d1
		jmp	0(a3,d1.w)

.action_table	bra.w	.nothing
		bra.w	.floor_on
		bra.w	.floor_off
		bra.w	.floor_toggle
		bra.w	.block_on
		bra.w	.block_off
		bra.w	.block_toggle
		bra.w	.hatch
		bra.w	.psi_effect
		bra.w	.lift_up
		bra.w	.lift_down
		bra.w	.lift_stop
		bra.w	.lift_toggle
		bra.w	.unused
		bra.w	.door_open
		bra.w	.door_close
		bra.w	.door_toggle
		bra.w	.door_lock
		bra.w	.door_unlock

.nothing	rts

****************************************************************************
; INPUT:	d2.l=button data (position in map)
;
;IF no floor already THEN
;  put grass in map
;  put question mark in DTS map
;

.floor_on
		add.l	#map,d2
		add.l	a5,d2
		move.l	d2,a1
.jump_into_floor_on
		btst.b	#floor_here_bit_num,3(a1)
		bne.s	.floor_already

		or.l	#keep_floor_here_bit,(a1)
		add.l	#map_part_size,a1
		or.l	#keep_question_mark_bit,(a1)

		move.l  a1,-(sp)
		move.l	#miscsfx,a1
		add.l	chip_mem_base,a1
		PLAY_SAMPLE a1,#1,#1,#63,#452
		move.l  (sp)+,a1

.floor_already	rts

****************************************************************************
; INPUT:	d2.l=button data (position in map)
;
;IF floor here AND floor is grass THEN
;  remove grass from map
;  put question mark in DTS map
;

.floor_off
		add.l	#map,d2
		add.l	a5,d2
		move.l	d2,a1
.jump_into_floor_off
		move.l	(a1),d0
		and.l	#keep_floor,d0
		beq.s	.no_floor
		cmp.l	#(2<<floor_shift)!keep_floor_here_bit,d0
		beq.s	.no_floor

		and.l	#erase_aux&erase_floor_here_bit,(a1)
		add.l	#map_part_size,a1
		or.l	#keep_question_mark_bit,(a1)

		move.l  a1,-(sp)
		move.l	#miscsfx,a1
		add.l	chip_mem_base,a1
		PLAY_SAMPLE a1,#1,#1,#63,#452
		move.l  (sp)+,a1

.no_floor	rts

****************************************************************************
; INPUT:	d2.l=button data (position in map)
;
; IF floor at target position THEN
;   GOTO floor off
; ELSE
;   GOTO floor on
;

.floor_toggle
		add.l	#map,d2
		add.l	a5,d2
		move.l	d2,a1
		btst.b	#floor_here_bit_num,3(a1)
		bne	.jump_into_floor_off
		bra	.jump_into_floor_on

****************************************************************************
; INPUT:	d2.l=button data (position in map)
;
;  IF ( block at target == wall OR
;       block at target == fitness boost OR
;       block at target == exit OR
;       block at target == tree OR
;       block at target == repulsion field OR
;       block at target == teleport ) THEN
;    put wall in map
;    put question mark in DTS map
;

.block_on
		add.l	#map,d2
		add.l	a5,d2
		move.l	d2,a1
.jump_into_block_on
		move.l	(a1),d2
		and.l	#keep_block,d2
		cmp.l   #(1<<block_shift)!keep_block_here_bit,d2
		beq.s	.no_block_on
		cmp.l   #(6<<block_shift)!keep_block_here_bit,d2
		bgt.s	.no_block_on

		and.l	#erase_block,(a1)
		or.l	#keep_opaque_bit!keep_block_here_bit!(0<<block_shift),(a1)
		add.l	#map_part_size,a1
		or.l	#keep_question_mark_bit,(a1)

		move.l  a1,-(sp)
		move.l	#miscsfx,a1
		add.l	chip_mem_base,a1
		PLAY_SAMPLE a1,#1,#1,#63,#452
		move.l  (sp)+,a1
.no_block_on
		rts

****************************************************************************
; INPUT:	d2.l=button data (position in map)
;
;  IF ( block at target == wall OR
;       block at target == fitness boost OR
;       block at target == exit OR
;       block at target == tree OR
;       block at target == repulsion field OR
;       block at target == teleport ) THEN
;    remove wall from map
;    put question mark in DTS map
;  IF floor above target block THEN
;    IF item on top of target block THEN
;      remove item above target block
;

.block_off
		add.l	#map,d2
		add.l	a5,d2
		move.l	d2,a1
.jump_into_block_off
		move.l	(a1),d2
		and.l	#keep_block,d2
		beq.s	.no_block_off
		cmp.l   #(1<<block_shift)!keep_block_here_bit,d2
		beq.s	.no_block_off
		cmp.l   #(6<<block_shift)!keep_block_here_bit,d2
		bgt.s	.no_block_off

		and.l	#erase_block&erase_opaque_bit&erase_panel,(a1)
		add.l	#map_part_size,a1
		or.l	#keep_question_mark_bit,(a1)

		move.l  a1,-(sp)
		move.l	#miscsfx,a1
		add.l	chip_mem_base,a1
		PLAY_SAMPLE a1,#1,#1,#63,#452
		move.l  (sp)+,a1

		btst.b	#aux_here_bit_num,map_cell_size*MAP_WIDTH*MAP_DEPTH+3(a1)
		beq.s	.no_aux_above_block
		btst.b	#floor_here_bit_num,map_cell_size*MAP_WIDTH*MAP_DEPTH+3(a1)
		bne.s	.no_aux_above_block
		and.l	#erase_aux,map_cell_size*MAP_WIDTH*MAP_DEPTH(a1)
.no_aux_above_block
.no_block_off
		rts

****************************************************************************
; INPUT:	d2.l=button data (position in map)
;
; IF block at target position THEN
;   GOTO block off
; ELSE
;   GOTO block on
;

.block_toggle
		add.l	#map,d2
		add.l	a5,d2
		move.l	d2,a1
		btst.b	#block_here_bit_num,3(a1)
		bne	.jump_into_block_off
		bra	.jump_into_block_on

****************************************************************************
; INPUT:	d2.l=button data (position in map)
;
; IF egg at target position THEN
;   IF monster in egg THEN
;     IF ready to egg THEN
;       IF if room for monster to appear THEN
;         hatch monster
;

.hatch
		move.l	d0,-(sp)

		move.l	d2,d5
		sub.l	#map_data1,d5
		divu	#map_cell_size*MAP_WIDTH*MAP_DEPTH,d5
		move.w	d5,d4
		swap	d5
		ext.l	d5
		divu	#map_cell_size*MAP_WIDTH,d5
		move.w	d5,d6
		swap	d5
		lsr.w	#2,d5

		move.l	a0,-(sp)

		moveq.l	#-1,d0
		add.l	#map,d2
		add.l	a5,d2
		move.l	d2,a0
		move.l	d2,a1

		move.l	(a0),d2
		and.l	#keep_aux,d2
		cmpi.l	#(0<<aux_shift)!keep_aux_here_bit,d2
		bne.s	.hatch_no_monster		;no a closed egg

		add.l	#map_part_size,a1
		move.l	(a1),d2
		and.l	#keep_hatch_time,d2
		cmp.l	#(4093<<hatch_time_shift),d2
		beq.s	.hatch_no_monster		;branch if egg empty
		move.l	(a1),d2
		and.l	#keep_aux_data,d2		;d2=type of monster

		btst.b	#block_here_bit_num,3(a0)
		bne.s	.hatch_no_monster		;branch if no room to hatch

		jsr	add_monster
		tst.l	d0
		bne.s	.hatch_no_monster		;branch if 32 monsters out already
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
.hatch_no_monster
		move.l	(sp)+,a0
		move.l  (sp)+,d0
		rts

****************************************************************************
; INPUT:	d2.l=button data (psi effect)
;
; !!! NOT USED !!!
;

.psi_effect
		clr.b   dofx(a0)
		move.w	d2,d1
		add.w	#82,d1

		lea	psi_table(pc),a3
		lsl.w	#2,d2
		jmp	0(a3,d2.w)

		rts

****************************************************************************
; INPUT:	d2.l=button data (offset into lift table)
;
; flag target lift to go up
;

.lift_up
		add.l	#map,d2
		add.l	a5,d2
		move.l	d2,a1
		move.b	#1,lift_direction(a1)
		rts

****************************************************************************
; INPUT:	d2.l=button data (offset into lift table)
;
; flag target lift to go down
;

.lift_down
		add.l	#map,d2
		add.l	a5,d2
		move.l	d2,a1
		move.b	#2,lift_direction(a1)
		rts

****************************************************************************
; INPUT:	d2.l=button data (offset into lift table)
;
; flag target lift to stop
;

.lift_stop
		add.l	#map,d2
		add.l	a5,d2
		move.l	d2,a1
		move.b	#0,lift_direction(a1)
		rts

****************************************************************************
; INPUT:	d2.l=button data (offset into lift table)
;
; IF target lift stopped THEN
;   IF target lift at minimum height THEN
;     flag target lift to go up
;   ELSE
;     flag target lift to go down
; ELSE
;   IF target lift is currently going up THEN
;     flag target lift to go down
;   ELSE
;     flag target lift to go up
;

.lift_toggle
		add.l	#map,d2
		add.l	a5,d2
		move.l	d2,a1
		cmp.b	#LIFT_STOPPED,lift_direction(a1)
		bne.s	.lift_toggle_not_stopped
		move.b	lift_height(a1),d1
		cmp.b	lift_min_height(a1),d1
		bne.s	.lift_toggle_not_min
		move.b	#LIFT_GOING_UP,lift_direction(a1)
		rts
.lift_toggle_not_min
		move.b	#LIFT_GOING_DOWN,lift_direction(a1)
		rts
.lift_toggle_not_stopped
		cmp.b	#LIFT_GOING_UP,lift_direction(a1)
		bne.s	.lift_toggle_not_going_up
		move.b	#LIFT_GOING_DOWN,lift_direction(a1)
		rts
.lift_toggle_not_going_up
		move.b	#LIFT_GOING_UP,lift_direction(a1)
		rts

****************************************************************************
; INPUT:	d2.l=button data
;

.unused
		rts

****************************************************************************
; INPUT:	d2.l=button data (offset into door table)
;
; flag target door to open
;

.door_open
		add.l	#map,d2
		add.l	a5,d2
		move.l	d2,a1
		move.b	#1,door_trig(a1)
		rts

****************************************************************************
; INPUT:	d2.l=button data (offset into door table)
;
; flag target door to close
;

.door_close
		add.l	#map,d2
		add.l	a5,d2
		move.l	d2,a1
		move.b	#2,door_trig(a1)
		rts

****************************************************************************
; INPUT:	d2.l=button data (offset into door table)
;
; IF target door is currently opending THEN
;   flag target door to close
; ELSE
;   flag target door to open
;

.door_toggle
		add.l	#map,d2
		add.l	a5,d2
		move.l	d2,a1
		cmp.b	#1,door_direction(a1)
		bne.s	.door_toggle_not_opening
		move.b	#2,door_trig(a1)
		rts
.door_toggle_not_opening
		move.b	#1,door_trig(a1)
		rts

****************************************************************************
; INPUT:	d2.l=button data (offset into door table)
;
; IF target door is not locked THEN
;   flag target door to lock
;

.door_lock
		add.l	#map,d2
		add.l	a5,d2
		move.l	d2,a1
		cmp.b	#3,door_direction(a1)
		beq.s	.door_lock_already_locked
		move.b	#3,door_trig(a1)
.door_lock_already_locked
		rts

****************************************************************************
; INPUT:	d2.l=button data (offset into door table)
;
; IF target door is locked THEN
;   flag target door to unlock
;

.door_unlock
		add.l	#map,d2
		add.l	a5,d2
		move.l	d2,a1
		cmp.b	#3,door_direction(a1)
		bne.s	.door_unlock_already_unlocked
		move.b	#4,door_trig(a1)
.door_unlock_already_unlocked
		rts

****************************************************************************
****************************************************************************
****************************************************************************
use_item
		moveq.l	#0,d0
		move.b	inven_using+inven_item_num(a0),d0
		beq	.no_item
		subq.l	#1,d0

		mulu	#item_size,d0
		move.l	#items,a1
		add.l	d0,a1
		add.l	a5,a1

		moveq.l	#0,d0
		move.b	item_category(a1),d0
		lea	.item_table(pc),a3
		lsl.w	#2,d0
		jmp	0(a3,d0.w)
.already_firing
.no_item	rts

.item_table
		bra.w	.use_gun
		rts
		nop
		bra.w	.use_mine
		rts
		nop
		bra.w	.use_ammo
		bra.w	.use_food
		rts
		nop
		rts
		nop
		rts
		nop
		bra.w	.use_dts
		bra.w	.use_dts2
		rts
		nop
		bra.w	.use_psiamp
		rts
		nop
		rts
		nop
		bra.w	.use_flamer
		bra.w	.use_launcher
		rts
		nop
		bra.w	.use_immu
		bra.w	.use_repair
		bra.w	.use_grlauncher
		bra.w	.use_grenade
		rts
		nop
		bra.w	.use_sentry
		rts
		nop
		bra.s	.use_sentrycntrl
		rts
		nop

		include	ItemUsage.s

****************************************************************************
****************************************************************************
****************************************************************************
;This will pull a block.
;INPUT:         d0=map offset between blocks in row (word)
;		a2=memory position of player (word)
;OUTPUT:	none
;CHANGES:	none

pull_block
		andi.l	#erase_person,(a2)		;remove person

		lea	0(a2,d0.w),a1			;position to step into

		neg.w	d0
		lea	0(a2,d0.w),a3			;position to pull from

		move.l	(a3),d1
		btst.l	#pushable_bit_num,d1		;any block to pull?
		beq	.gunreload			;no, abort

		move.l	-map_cell_size*MAP_WIDTH*MAP_DEPTH(a1),d1
		btst.l	#block_here_bit_num,d1
		beq.s	.pull_ok
		and.l	#keep_block,d1
		cmpi.l	#(8<<block_shift),d1	;moving onto player/monsters head?
		blt.s	.pull_ok
		cmpi.l	#(47<<block_shift),d1
		bgt.s   .pull_ok
		cmpi.l	#(16<<block_shift),d1
		blt.s	.pull_blocked2
		cmpi.l	#(21<<block_shift),d1
		blt.s	.pull_ok
.pull_blocked2	move.l	(a1),d1
		btst.l	#floor_here_bit_num,d1
		beq	.pull_blocked
.pull_ok
		btst.b	#block_here_bit_num,3(a1)	;any obstructions?
		bne	.pull_blocked			;yes, abort

		move.l	(a2),d1
		and.l	#keep_aux,d1
		beq	.pullit
		cmp.l	#(1<<aux_shift)!keep_aux_here_bit,d1
		beq.s	.pullit
		cmp.l	#(7<<aux_shift)!keep_aux_here_bit,d1
		bls	.pull_blocked
.pullit
		move.l  a1,-(sp)
		move.l	a2,a1
		bsr	move_pushable
		move.l  (sp)+,a1

		move.l	#miscsfx,a2
		add.l	chip_mem_base,a2
		PLAY_SAMPLE a2,#1,aud_ch(a0),#63,#452

		ext.l	d0
		neg.l	d0

		move.l	mem_position(a0),old_mem_position(a0)
		add.l	d0,mem_position(a0)		;head moves
		jsr	check_pad_pushed
		jsr	test_mine

		move.b	direction(a0),d0
		tst.b	d0
		bne.s	.not_north
		addi.b	#1,ypos(a0)
.not_north	cmpi.b	#1,d0
		bne.s	.not_east
		subi.b	#1,xpos(a0)
.not_east	cmpi.b	#2,d0
		bne.s	.not_south
		subi.b	#1,ypos(a0)
.not_south	cmpi.b	#3,d0
		bne.s	.not_west
		addi.b	#1,xpos(a0)
.not_west
		st.b	variables+redraw_flag(a5)	;set redraw flag

		bsr	put_head_in_map
		rts

.pull_blocked	move.w	#150,blocked2_count(a0)
		st.b	variables+redraw_flag(a5)	;set redraw flag
		bsr	put_head_in_map
		rts

.not_window1	rts

.gunreload	bsr	put_head_in_map
		bra	reload_item

********************************************************************************

reload_item	moveq.l	#0,d0
		move.b	inven_using+inven_item_num(a0),d0
		beq	.nogun
		subq.l	#1,d0
		mulu	#item_size,d0
		move.l	#items,a1
		add.l	d0,a1
		add.l	a5,a1

		move.b	item_category(a1),d0
		cmpi.b	#CAT_GUN,d0
		beq.s	.gun
		cmpi.b	#CAT_LAUNCHER,d0
		beq.s	.gun
		cmpi.b	#CAT_GRLAUNCHER,d0
		beq.s	.gun
		cmpi.b	#CAT_FLAMER,d0
		bne	.nogun

.gun		move.b	inven_using+inven_item_gun_ammo(a0),d0
		cmp.b	itemgun_maxrounds(a1),d0
		beq	.notempty
		bhi	.notempty

		moveq.l	#0,d0

		tst.b	cheat_mode3
		beq.s	.not_cheat
		move.b	itemgun_maxrounds(a1),inven_using+inven_item_gun_ammo(a0)
		bra	.cont
.not_cheat
		move.b	itemgun_clip1(a1),d0
		beq	.no_ammo
		bsr	carrying_item
		cmp.l	#0,a2
		bne.s	.found_ammo

		move.b	itemgun_clip2(a1),d0
		beq	.no_ammo
		bsr	carrying_item
		cmp.l	#0,a2
		bne.s	.found_ammo

		move.b	itemgun_clip3(a1),d0
		beq	.no_ammo
		bsr	carrying_item
		cmp.l	#0,a2
		beq	.no_ammo

.found_ammo	subq.l	#1,d0
		mulu	#item_size,d0
		move.l	#items,a3
		add.l	d0,a3
		add.l	a5,a3

		move.b	itemgun_maxrounds(a1),d0
		sub.b	inven_using+inven_item_gun_ammo(a0),d0

		cmp.b	inven_item_gun_ammo(a2),d0
		beq.s	.all_used
		bhi.s	.all_used

		sub.b	d0,inven_item_gun_ammo(a2)
		add.b	d0,inven_using+inven_item_gun_ammo(a0)
		bra.s	.cont

.all_used	move.b	inven_item_gun_ammo(a2),d0
		add.b	d0,inven_using+inven_item_gun_ammo(a0)
		movem.l	a0-a1,-(sp)
		bsr	remove_item
		movem.l	(sp)+,a0-a1
.cont
		cmp.w	#22,item_exsample(a1)
		bne.s	.not_machine_gun
		PLAY_EX_SAMPLE #32,aud_ch(a0),#50,#128
		bra.s	.cont2
.not_machine_gun
		cmp.b	#49,itemgun_clip1(a1)
		bne.s	.not_beam
		tst.l	exchip_mem_base
		beq.s	.not_beam
		PLAY_EX_SAMPLE #25,aud_ch(a0),#63,#271
		bra.s	.cont2
.not_beam	move.b	#4,variables+fx_sample(a5)
		move.w	#380,variables+fx_period(a5)
		move.w	aud_ch(a0),variables+fx_channel(a5)
.cont2		st.b	variables+redraw_flag(a5)	;set redraw flag
		rts
.no_ammo
		move.w	#150,noammo_count(a0)
		st.b	variables+redraw_flag(a5)	;set redraw flag
.nogun
.notempty	rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		d0=map block code (word)
;OUTPUT:        d2=player number (word, -1 if not found)
;		a3=address of players stats if head found (long)
;		a4=address of players structure if head found (long)
;CHANGES:    	none
find_heads_owner
		btst.l	#block_here_bit_num,d0
		bne.s	.block_here
.not_player	move.w	#-1,d2
		rts

.block_here	move.w	#block_shift,d1
		move.l	d0,d2
		and.l	#keep_block,d2
		ror.l	d1,d2

		cmpi.b	#32,d2
		blt.s	.not_player
		cmpi.b	#47,d2
		bgt.s	.not_player

		and.l	#keep_variant_player,d0
		move.w	#32-variant_shift,d1
		rol.l	d1,d0
		moveq.l	#-1,d2

		tst.w	d0			;player 1?
		bne.s	.not_pl1		;no, then branch
		lea	variables+player1(a5),a4
		lea	global_vars+player1_stats(a5),a3
		moveq.l	#0,d2
		move.w	player_num(a4),d2
		rts
.not_pl1
		cmpi.w	#1,d0			;player 2?
		bne.s	.not_pl2		;no, then branch
		lea	variables+player2(a5),a4
		lea	global_vars+player2_stats(a5),a3
		moveq.l	#0,d2
		move.w	player_num(a4),d2
		rts
.not_pl2
		cmpi.w	#2,d0			;player 3?
		bne.s	.not_pl3		;no, then branch
		lea	variables+player3(a5),a4
		lea	global_vars+player3_stats(a5),a3
		moveq.l	#0,d2
		move.w	player_num(a4),d2
		rts
.not_pl3
		cmpi.w	#3,d0			;player 4?
		bne.s	.not_pl4		;no, then branch
		lea	variables+player4(a5),a4
		lea	global_vars+player4_stats(a5),a3
		moveq.l	#0,d2
		move.w	player_num(a4),d2
		rts
.not_pl4
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		d0=map block code (word)
;OUTPUT:	a4=address of players structure if head found (long)
;CHANGES:    	none
find_heads_owner_quick
		btst.l	#block_here_bit_num,d0
		bne.s	.block_here
.not_player	move.l	#0,a4
		rts

.block_here	move.w	#block_shift,d1
		move.l	d0,d2
		and.l	#keep_block,d2
		ror.l	d1,d2

		cmpi.b	#32,d2
		blt.s	.not_player
		cmpi.b	#47,d2
		bgt.s	.not_player

		and.l	#keep_variant_player,d0
		move.w	#32-variant_shift,d1
		rol.l	d1,d0
		move.l	#0,a4

		tst.w	d0			;player 1?
		bne.s	.not_pl1		;no, then branch
		lea	variables+player1(a5),a4
		rts
.not_pl1
		cmpi.w	#1,d0			;player 2?
		bne.s	.not_pl2		;no, then branch
		lea	variables+player2(a5),a4
		rts
.not_pl2
		cmpi.w	#2,d0			;player 3?
		bne.s	.not_pl3		;no, then branch
		lea	variables+player3(a5),a4
		rts
.not_pl3
		cmpi.w	#3,d0			;player 4?
		bne.s	.not_pl4		;no, then branch
		lea	variables+player4(a5),a4
		rts
.not_pl4
		rts

********************************************************************************
********************************************************************************
;INPUT:		a3=old position (long)
;		a1=new position (long)
;OUTPUT:	d6=actually moved (0=yes, -1=no)
;CHANGES:       none

move_pushable_address
		movem.l	a1-a4/d1-d2,-(sp)

		move.l	(a1),d1			;d1=new block to examine

		btst.l	#block_here_bit_num,d1	;space found?
		beq.s	.space			;yes, then branch
		and.l	#keep_block,d1
		move.w	#block_shift,d2
		ror.l	d2,d1
		cmpi.b	#6,d1
		bne	.blocked

		add.l	#map_part_size*2,a1
		move.l	(a1),a1
		adda.l	a5,a1
		adda.l	#map+map_data1,a1

		btst.b	#block_here_bit_num,3(a1)
		bne	.blocked

		move.l	#miscsfx,a4
		add.l	chip_mem_base,a4
		PLAY_SAMPLE_MEM a4,#3,#1,#683,a1

.space
		move.l	a3,a2
		jsr	check_pad_released_raw
		move.l	a1,a2
		jsr	check_pad_pushed_raw

		lea	map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a4
;		cmp.l	a1,a4
;		beq.s	.dont_crush

;		move.l	(a1),d1
;		btst.l	#aux_here_bit_num,d1
;		beq.s	.dont_crush
;		and.l	#keep_aux,d1
;		cmp.l	#(7<<aux_shift)!keep_aux_here_bit,d1
;		bls.s	.crush
;		cmp.l	#(13<<aux_shift)!keep_aux_here_bit,d1
;		bhi.s	.dont_crush
;.crush		and.l	#erase_aux,(a1)
;.dont_crush
		move.l	(a4),d1
		btst.l	#floor_here_bit_num,d1
		bne.s	.no_aux
		and.l	#erase_aux,(a4)
		and.l	#keep_aux,d1
		beq.s	.no_aux
		lea	-map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a4
		cmp.l	a1,a4
		beq.s	.force_copy_aux
		btst.b	#floor_here_bit_num,map_cell_size*MAP_WIDTH*MAP_DEPTH+3(a1)
		bne.s	.no_aux
		btst.b	#opaque_bit_num,map_cell_size*MAP_WIDTH*MAP_DEPTH+3(a1)
		bne.s	.no_aux
.force_copy_aux	and.l	#erase_aux,map_cell_size*MAP_WIDTH*MAP_DEPTH(a1)
		or.l	d1,map_cell_size*MAP_WIDTH*MAP_DEPTH(a1)

		lea	map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a4
		add.l	#map_part_size,a4
		move.l	(a4),d1
		and.l	#keep_aux_data!keep_hatch_time,d1
		lea	map_cell_size*MAP_WIDTH*MAP_DEPTH(a1),a4
		add.l	#map_part_size,a4
		and.l	#erase_aux_data&erase_hatch_time,(a4)
		or.l	d1,(a4)

		lea	map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a4
		add.l	#map_part_size*2,a4
		move.l	(a4),d1
		and.l	#keep_item_type!keep_item_damage!keep_item_ammo,d1
		lea	map_cell_size*MAP_WIDTH*MAP_DEPTH(a1),a4
		add.l	#map_part_size*2,a4
		and.l	#erase_item_type&erase_item_damage&erase_item_ammo,(a4)
		or.l	d1,(a4)
.no_aux
		lea	(a3),a4
		add.l	#map_part_size*2,a4
		move.l	(a4),d1
		and.l	#keep_no_question,d1
		lea	(a1),a4
		add.l	#map_part_size*2,a4
		and.l	#erase_no_question,(a4)
		or.l	d1,(a4)
.skip_no_aux
		movem.l	a1/a3,-(sp)

		move.l	#map,a4
		add.l   a5,a4
		add.l	#map_data1,a4
		suba.l	a4,a1
		suba.l	a4,a3

		lea	map+pushables(a5),a4

		moveq.l	#0,d2
.next_pushable	move.w	pushable_posn(a4),d2
		beq.s	.not_found_pushable
		cmp.l	d2,a3
		beq.s	.found_pushable
                lea	pushable_size(a4),a4
		bra.s	.next_pushable
.found_pushable
		move.w	a1,pushable_posn(a4)

		movem.l	(sp)+,a1/a3

		move.l	pushable_cell(a4),d2
		and.l	#keep_block,d2
		cmp.l	#(1<<block_shift)!keep_block_here_bit,d2
		beq.s	.pushable_block
		add.l	#map_part_size*2,a3
		add.l	#map_part_size*2,a1
		btst.b	#no_question_bit_num-24,(a3)
		bne.s	.pushable_block
		or.l	#keep_no_question,(a3)
		sub.l	#map_part_size,a3
		or.l	#keep_question_mark_bit,(a3)
.pushable_block
		st.b	variables+redraw_flag(a5)	;set redraw flag

		movem.l	(sp)+,a1-a4/d1-d2
		moveq.l	#0,d6
		rts

.blocked	movem.l	(sp)+,a1-a4/d1-d2
		moveq.l	#-1,d6
		rts

.not_found_pushable
.error		move.w	#id_pushable_failed,color00(a6)
		bra.s	.error

********************************************************************************
********************************************************************************
;INPUT:		a3=old position (long)
;		a1=new position (long)
;OUTPUT:	d7=actually moved (0=yes, -1=no)
;CHANGES:       a4
move_pushable
		movem.l	a1-a4/d1-d2,-(sp)

		move.l	(a1),d1			;d1=new block to examine

		btst.l	#block_here_bit_num,d1	;space found?
		beq.s	.space			;yes, then branch
		and.l	#keep_block,d1
		move.w	#block_shift,d2
		ror.l	d2,d1
		cmpi.b	#6,d1
		bne	.blocked

		add.l	#map_part_size*2,a1
		move.l	(a1),a1
		adda.l	a5,a1
		adda.l	#map+map_data1,a1

		btst.b	#block_here_bit_num,3(a1)
		bne	.blocked

		move.l	#miscsfx,a4
		add.l	chip_mem_base,a4
		PLAY_SAMPLE_MEM a4,#3,#1,#683,a1
.space
		move.l	a3,a2
		jsr	check_pad_released_raw
		move.l	a1,a2
		jsr	check_pad_pushed_raw

		lea	map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a4
		cmp.l	a1,a4
		beq.s	.dont_crush

		move.l	(a1),d1
		and.l	#keep_aux,d1
		beq.s	.dont_crush
		cmp.l	#(7<<aux_shift)!keep_aux_here_bit,d1
		bls.s	.crush
		cmp.l	#(13<<aux_shift)!keep_aux_here_bit,d1
		bls.s	.dont_crush
.crush		and.l	#erase_aux,(a1)
.dont_crush
		and.l	#erase_block&erase_panel&erase_opaque_bit&erase_pushable_bit,(a3)
						;clear vacant block
		and.l	#erase_block&erase_panel&erase_opaque_bit&erase_pushable_bit,(a1)
						;clear space to slide into

		move.l	(a4),d1
		btst.l	#floor_here_bit_num,d1
		bne.s	.no_aux
		and.l	#erase_aux,(a4)
		and.l	#keep_aux,d1
		beq.s	.no_aux
		lea	-map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a4
		cmp.l	a1,a4
		beq.s	.force_copy_aux
		btst.b	#floor_here_bit_num,map_cell_size*MAP_WIDTH*MAP_DEPTH+3(a1)
		bne.s	.no_aux
		btst.b	#opaque_bit_num,map_cell_size*MAP_WIDTH*MAP_DEPTH+3(a1)
		bne.s	.no_aux
.force_copy_aux	and.l	#erase_aux,map_cell_size*MAP_WIDTH*MAP_DEPTH(a1)
		or.l	d1,map_cell_size*MAP_WIDTH*MAP_DEPTH(a1)

		lea	map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a4
		add.l	#map_part_size,a4
		move.l	(a4),d1
		and.l	#keep_aux_data!keep_hatch_time,d1
		lea	map_cell_size*MAP_WIDTH*MAP_DEPTH(a1),a4
		add.l	#map_part_size,a4
		and.l	#erase_aux_data&erase_hatch_time,(a4)
		or.l	d1,(a4)

		lea	map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a4
		add.l	#map_part_size*2,a4
		move.l	(a4),d1
		and.l	#keep_item_type!keep_item_damage!keep_item_ammo,d1
		lea	map_cell_size*MAP_WIDTH*MAP_DEPTH(a1),a4
		add.l	#map_part_size*2,a4
		and.l	#erase_item_type&erase_item_damage&erase_item_ammo,(a4)
		or.l	d1,(a4)
.no_aux
		lea	(a3),a4
		add.l	#map_part_size*2,a4
		move.l	(a4),d1
		and.l	#keep_no_question,d1
		lea	(a1),a4
		add.l	#map_part_size*2,a4
		and.l	#erase_no_question,(a4)
		or.l	d1,(a4)
.skip_no_aux
		movem.l	a1/a3,-(sp)

		move.l	#map,a4
		add.l   a5,a4
		add.l	#map_data1,a4
		suba.l	a4,a1
		suba.l	a4,a3

		lea	map+pushables(a5),a4

		moveq.l	#0,d2
.next_pushable	move.w	pushable_posn(a4),d2
		beq.s	.not_found_pushable
		cmp.l	d2,a3
		beq.s	.found_pushable
                lea	pushable_size(a4),a4
		bra.s	.next_pushable
.found_pushable
		move.w	a1,pushable_posn(a4)

		movem.l	(sp)+,a1/a3

		move.l	pushable_cell(a4),d2
		or.l	d2,(a1)
		and.l	#keep_block,d2
		cmp.l	#(1<<block_shift)!keep_block_here_bit,d2
		beq.s	.pushable_block
		add.l	#map_part_size*2,a3
		add.l	#map_part_size*2,a1
		btst.b	#no_question_bit_num-24,(a1)
		bne.s	.pushable_block
		or.l	#keep_no_question,(a1)
		sub.l	#map_part_size,a3
		or.l	#keep_question_mark_bit,(a3)
.pushable_block
		st.b	variables+redraw_flag(a5)	;set redraw flag

		movem.l	(sp)+,a1-a4/d1-d2
		moveq.l	#0,d7
		rts

.blocked	movem.l	(sp)+,a1-a4/d1-d2
		moveq.l	#-1,d7
		rts

.not_found_pushable
.error		move.w	#id_pushable_failed,color00(a6)
		bra.s	.error

********************************************************************************
********************************************************************************
;INPUT:		a3=old position (long)
;		a1=new position (long)
;		a2=address of pushable structure (long)
;OUTPUT:	d6=actually moved (0=yes, -1=no)
;CHANGES:       a4
move_a_pushable
		movem.l	a1-a4/d1-d2,-(sp)

		move.l	(a1),d1			;d1=new block to examine

		btst.l	#block_here_bit_num,d1	;space found?
		beq.s	.space			;yes, then branch
		and.l	#keep_block,d1
		move.w	#block_shift,d2
		ror.l	d2,d1
		cmpi.b	#6,d1
		bne	.blocked

		move.l	a1,d1
		add.l	#map_part_size*2,a1
		move.l	(a1),a1
		adda.l	a5,a1
		adda.l	#map+map_data1,a1

		btst.b	#block_here_bit_num,3(a1)
		bne	.blocked

		move.l	#miscsfx,a4
		add.l	chip_mem_base,a4
		PLAY_SAMPLE_MEM a4,#3,#1,#683,a1

.space
		move.l	a2,-(sp)
		move.l	a3,a2
		jsr	check_pad_released_raw
		move.l	a1,a2
		jsr	check_pad_pushed_raw
		move.l	(sp)+,a2

		lea	map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a4
		cmp.l	a1,a4
		beq.s	.dont_crush

		move.l	(a1),d1
		btst.l	#aux_here_bit_num,d1
		beq.s	.dont_crush
		and.l	#keep_aux,d1
		cmp.l	#(7<<aux_shift)!keep_aux_here_bit,d1
		bls.s	.crush
		cmp.l	#(13<<aux_shift)!keep_aux_here_bit,d1
		bls.s	.dont_crush
.crush		and.l	#erase_aux,(a1)
.dont_crush
		and.l	#erase_block&erase_panel&erase_opaque_bit&erase_pushable_bit,(a3)
						;clear vacant block
		and.l	#erase_block&erase_panel&erase_opaque_bit&erase_pushable_bit,(a1)
						;clear space to slide into

		move.l	(a4),d1
		btst.l	#floor_here_bit_num,d1
		bne.s	.no_aux
		and.l	#erase_aux,(a4)
		and.l	#keep_aux,d1
		beq.s	.no_aux
		lea	-map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a4
		cmp.l	a1,a4
		beq.s	.force_copy_aux
		btst.b	#floor_here_bit_num,map_cell_size*MAP_WIDTH*MAP_DEPTH+3(a1)
		bne.s	.no_aux
		btst.b	#opaque_bit_num,map_cell_size*MAP_WIDTH*MAP_DEPTH+3(a1)
		bne.s	.no_aux
.force_copy_aux	and.l	#erase_aux,map_cell_size*MAP_WIDTH*MAP_DEPTH(a1)
		or.l	d1,map_cell_size*MAP_WIDTH*MAP_DEPTH(a1)

		lea	map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a4
		add.l	#map_part_size,a4
		move.l	(a4),d1
		and.l	#keep_aux_data!keep_hatch_time,d1
		lea	map_cell_size*MAP_WIDTH*MAP_DEPTH(a1),a4
		add.l	#map_part_size,a4
		and.l	#erase_aux_data&erase_hatch_time,(a4)
		or.l	d1,(a4)

		lea	map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a4
		add.l	#map_part_size*2,a4
		move.l	(a4),d1
		and.l	#keep_item_type!keep_item_damage!keep_item_ammo,d1
		lea	map_cell_size*MAP_WIDTH*MAP_DEPTH(a1),a4
		add.l	#map_part_size*2,a4
		and.l	#erase_item_type&erase_item_damage&erase_item_ammo,(a4)
		or.l	d1,(a4)
.no_aux
		lea	(a3),a4
		add.l	#map_part_size*2,a4
		move.l	(a4),d1
		and.l	#keep_no_question,d1
		lea	(a1),a4
		add.l	#map_part_size*2,a4
		and.l	#erase_no_question,(a4)
		or.l	d1,(a4)
.skip_no_aux

		move.l	a1,a4
		sub.l	#map,a4
		sub.l	a5,a4
		sub.l	#map_data1,a4
		move.w	a4,pushable_posn(a2)

		move.l	pushable_cell(a2),d2
		or.l	d2,(a1)
		and.l	#keep_block,d2
		cmp.l	#(1<<block_shift)!keep_block_here_bit,d2
		beq.s	.pushable_block
		add.l	#map_part_size*2,a3
		add.l	#map_part_size*2,a1
		btst.b	#no_question_bit_num-24,(a1)
		bne.s	.pushable_block
		or.l	#keep_no_question,(a1)
		sub.l	#map_part_size,a3
		or.l	#keep_question_mark_bit,(a3)
.pushable_block

		st.b	variables+redraw_flag(a5)	;set redraw flag

		movem.l	(sp)+,a1-a4/d1-d2
		moveq.l	#0,d6
		rts

.blocked	movem.l	(sp)+,a1-a4/d1-d2
		moveq.l	#-1,d6
		rts

.not_found_pushable
.error		move.w	#id_pushable_failed,color00(a6)
		bra.s	.error

********************************************************************************
********************************************************************************
;INPUT:		a3=address of pushable (long)
;OUTPUT:        d3=map cell (long)
;		a0=address of pushable structure (long)
;CHANGES:       a4
find_pushable
		movem.l	a1-a3,-(sp)

		move.l	#map,a0
		add.l   a5,a0
		add.l	#map_data1,a0
		suba.l	a0,a3

		lea	map+pushables(a5),a0

		moveq.l	#0,d3
.next_pushable	move.w	pushable_posn(a0),d3
		beq.s	.not_found_pushable
		cmp.l	d3,a3
		beq.s	.found_pushable

                lea	pushable_size(a0),a0
		bra.s	.next_pushable
.found_pushable
		move.l	pushable_cell(a0),d3
		movem.l	(sp)+,a1-a3
		rts

.not_found_pushable
.error		move.w	#id_pushable_failed,color00(a6)
		bra.s	.error

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5=base address of fast memory (long)
;		a0=address of player struct
;OUTPUT:	none
;CHANGES:       none
lay_path
		movem.l	d0/a2,-(sp)

		move.l	old_mem_position(a0),d0
		cmp.l   mem_position(a0),d0
		beq.s	.not_changed

		lea	path(a0),a2
		move.w	#PATH_SIZE-2,d0
.loop		move.l	4(a2),(a2)+
		dbf	d0,.loop

		move.l	mem_position(a0),(a2)

.not_changed	movem.l	(sp)+,d0/a2
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5=base address of fast memory (long)
;		a0=address of player structure (long)
;		a3=mem position of field (long)
;OUTPUT:	none
;CHANGES:       d0

boost
		add.l	#map_part_size*2,a3
		move.l	(a3),d0

		lea	global_vars+player1_stats(a5),a1
		move.w  player_num(a0),d1
		mulu	#stats_struct_size,d1
		add.l	d1,a1

		bsr	incr_fitness

		move.l	#miscsfx,a1
		add.l	chip_mem_base,a1
		PLAY_SAMPLE a1,#3,aud_ch(a0),#50,#200

		move.b	#5,fire_flash_dur(a0)
		move.b	#8,fire_flash(a0)

		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5=base address of fast memory (long)
;		a0=address of player structure (long)
;		a3=mem position of field (long)
;OUTPUT:	none
;CHANGES:       d0
teleport
		add.l	#map_part_size*2,a3
		move.l	(a3),a3
		move.l  a3,d1
		adda.l	a5,a3
		adda.l	#map+map_data1,a3

		move.l	(a3),d0
		and.l	#keep_block,d0
		beq.s	.not_blocked
		cmp.l	#(32<<block_shift)!keep_block_here_bit,d0
		blt	.not_blocked1
		cmp.l	#(47<<block_shift)!keep_block_here_bit,d0
		ble	.blocked
.not_blocked1	cmp.l	#(8<<block_shift)!keep_block_here_bit,d0
		blt	.blocked
		cmp.l	#(15<<block_shift)!keep_block_here_bit,d0
		bgt	.not_blocked
		movem.l	d1/a0-a4,-(sp)
		move.l	a3,a2
		jsr	find_monsters_owner
                clr.l	monster_type(a4)
                clr.l	monster_posn(a4)
		movem.l	(sp)+,d1/a0-a4
.not_blocked
		move.l	(a3),d0
		and.l	#keep_block,d0
		cmp.l	#(24<<block_shift)!keep_block_here_bit,d0
		blt.s	.not_sentry
		cmp.l	#(27<<block_shift)!keep_block_here_bit,d0
		bgt.s	.not_sentry
		movem.l	d1/a0,-(sp)
		move.l	(a3),d0
		and.l	#keep_variant_sentry,d0
		move.w	#32-variant_shift,d1
		rol.l	d1,d0
		mulu	#sn_struct_size,d0
		lea	variables+sentries(a5),a0
		add.l	d0,a0
		clr.l	sn_address(a0)
		movem.l	d1/a0,-(sp)
.not_sentry
		move.l	a3,mem_position(a0)

		lsr.l	#2,d1
		divu	#MAP_WIDTH*MAP_DEPTH,d1
		move.b	d1,floor(a0)
		swap	d1

		ext.l	d1
		divu    #MAP_WIDTH,d1
		move.b	d1,ypos(a0)
		swap	d1

		move.b	d1,xpos(a0)

		move.l	#miscsfx,a1
		add.l	chip_mem_base,a1
		PLAY_SAMPLE a1,#3,aud_ch(a0),#63,#683

		move.b	#10,fire_flash_dur(a0)
		move.b	#17,fire_flash(a0)

		jsr	check_pad_released
		jsr	check_pad_pushed
		jsr	test_mine

		st.b	variables+redraw_flag(a5)	;set redraw flag
		rts

.blocked	move.w	#150,blocked_count(a0)
		st.b	variables+redraw_flag(a5)	;set redraw flag

		move.l	#miscsfx,a1
		add.l	chip_mem_base,a1
		PLAY_SAMPLE a1,#9,aud_ch(a0),#63,#569
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5=base address of fast memory (long)
;INPUT:		a3=address of pushable (long)
;		a1=new position (long)
;OUTPUT:        z=blocked flag (set=moved ok, clr=blocked)
;CHANGES:       d0
teleport_block
		movem.l	a1/a3,-(sp)

		add.l	#map_part_size*2,a1
		move.l	(a1),a1
		adda.l	a5,a1
		adda.l	#map+map_data1,a1

		btst.b	#block_here_bit_num,3(a1)
		bne.s	.blocked

		bsr	move_pushable

		move.l	#miscsfx,a3
		add.l	chip_mem_base,a3
		PLAY_SAMPLE_MEM a3,#3,#1,#683,a1

		st.b	variables+redraw_flag(a5)	;set redraw flag

		moveq.l	#0,d0
		movem.l	(sp)+,a1/a3
		rts

.blocked	moveq.l	#-1,d0
		movem.l	(sp)+,a1/a3
		rts

********************************************************************************
*************************** Update player positions ****************************
********************************************************************************
;Calculate current memory position in map that players are at.
;INPUT:		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	a0-a2
update_player_positions
		lea	variables+player1(a5),a0
		bsr	update_player_position
		jsr	lay_path
		move.l	mem_position(a0),old_mem_position(a0)

		lea	variables+player2(a5),a0
		bsr	update_player_position
		jsr	lay_path
		move.l	mem_position(a0),old_mem_position(a0)

		lea	variables+player3(a5),a0
		bsr	update_player_position
		jsr	lay_path
		move.l	mem_position(a0),old_mem_position(a0)

		lea	variables+player4(a5),a0
		bsr	update_player_position
		jsr	lay_path
		move.l	mem_position(a0),old_mem_position(a0)

		rts

********************************************************************************
update_player_position
		tst.b	control_method(a0)
		beq.s	.not_active

		moveq.l	#0,d0
		moveq.l	#0,d1

		move.b	floor(a0),d0
		mulu.w	#MAP_WIDTH*MAP_DEPTH*map_cell_size,d0
		move.b	ypos(a0),d1
		mulu.w	#MAP_WIDTH,d1
		move.b	xpos(a0),d2
		ext.w	d2
		add.w	d2,d1
		lsl.w	#2,d1
		add.l	d1,d0
                move.l	#map,a2
		add.l	a5,a2
		add.l	d0,a2
		add.l	#map_data1,a2

		move.l	a2,mem_position(a0)
		bsr	put_head_in_map

.not_active	rts

********************************************************************************
;INPUT:		a0=address of players structure (long)
;OUTPUT:        none
;CHANGES:       none
put_head_in_map
		tst.b	dead_flag2(a0)		;player active?
		bne.s	.dead			;no, then exit
		cmpi.w	#7,window_type(a0)
		beq.s	.dead

		movem.l	d0-d2/a2,-(sp)
		moveq.l	#0,d0
		move.b	direction(a0),d0
		add.w	head_images(a0),d0
		move.w	d0,block_num(a0)

		move.w	#block_shift,d1
		rol.l	d1,d0

		moveq.l	#0,d2
		move.w	player_num(a0),d2

		tst.b	fire_white(a0)
		beq.s	.no_white
		addq.w	#8,d2
		bra.s	.no_glow
.no_white	tst.w	spell_shield(a0)
		beq.s	.no_glow
		addq.w	#4,d2
.no_glow
		move.w	#variant_shift,d1
		rol.l	d1,d2
		or.l	d2,d0

		or.w	#keep_block_here_bit,d0

		move.l	mem_position(a0),a2
		andi.l	#erase_person,(a2)
		or.l	d0,(a2)			;put head in map
		movem.l	(sp)+,d0-d2/a2
.dead		rts
