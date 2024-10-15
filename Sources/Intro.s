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
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:       none
show_intro
		jsr	killaud

		move.w	#MODE_INTRO,variables+mode(a5)

		move.l  #lc_disk_buffer,a2
		add.l	a4,a2
		move.l	#2,d1
	IFND	rolling_demo
		tst.l	exchip_mem_base
		beq	.no_ex2
		move.l	#5,d1
.no_ex2
	ENDC
		PRELOG_DISK #1,a2,d1

		jsr	kill_screen
  IFND	CD32
		move.l	#lc_mesg_buffer,a0
		add.l	a4,a0
		move.l	#front_anim_in,a1
		add.l	a5,a1
		jsr	play_anim

		move.l	#lc_mesg_buffer,a0
		add.l	a4,a0
		jsr	set_up_message_screen

		move.w	#0,variables+file_mode(a5)

	IFND	rolling_demo

		SHOW_MESG diskio_mesg_1

 		move.l	#intro_copper,a1
		add.l	a4,a1
		LOAD_FILE <"Front/Intro.dat">,a1

   ENDC

		move.w	vhposr(a6),variables+random_num(a5)

   IFND	CD32

		SHOW_MESG decrunch_message

		move.l	#intro_copper,a1
		add.l	a4,a1
		PP_DECRUNCH a1

		move.l	#intro_music,a0
		add.l	a4,a0
		movem.l	d0-d7/a0-a6,-(sp)
		jsr	_RelocModule
		movem.l	(sp)+,d0-d7/a0-a6

		move.l	#intro_music,a0
		add.l	a4,a0
		movem.l	d0-d7/a0-a6,-(sp)
		jsr	_PlayModule
		movem.l	(sp)+,d0-d7/a0-a6

		tst.l	os_kill
		beq.s	.os_ok
		bsr	.load_ex_sfx
.os_ok
		jsr	unshow_message
		move.l	#lc_mesg_buffer,a0
		add.l	a4,a0
		move.l	#front_anim_out,a1
		add.l	a5,a1
		jsr	play_anim

		move.l	#intro_screen1,a0
		add.l	a4,a0
		jsr	set_up_intro_screen

		move.w	#1,variables+file_mode(a5)

	ENDC

	IFND	rolling_demo
		tst.l	os_kill
		bne.s	.os_gone
	ENDC

		bsr	.load_ex_sfx

   ENDC
.os_gone
		rts

.load_ex_sfx	tst.l	exchip_mem_base
		beq	.no_ex

	IFND	rolling_demo
		move.l  #lc_disk_buffer,a2
		add.l	a4,a2
		LOG_DISK #5,a2,#1
	ENDC
		SHOW_MESG loadex
		jsr	load_ex_sfx
		jsr	decrunch_ex_sfx
	IFND	rolling_demo
		move.l  #lc_disk_buffer,a2
		add.l	a4,a2
		LOG_DISK #1,a2,#2
	ELSEIF
		SHOW_MESG diskio_mesg_1
	ENDC
		rts
.no_ex
	IFD	rolling_demo
		SHOW_MESG diskio_mesg_1
	ENDC
		rts

loadex		dc.b	ABSPOS,0>>8,0,0>>8,0
		PHRASE	264
		dc.b    ENDTEXT

********************************************************************************
********************************* Responsive keys ******************************
********************************************************************************

		even
;Format : keydown, keycode, release
; Keydown is set while the key is pressed.
; Use keycode as specified in Hardware Reference Manual page 249.
; Set release for keyup messages to be interpreted.


intro_key_list
intro_key_down	dc.b	0
intro_key_up	dc.b	0

		dc.b	0,$ff,0		;eod marker

		even
