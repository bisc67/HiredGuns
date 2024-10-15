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
;INPUT:		a5=base address of fast memory (long)
;		( a0=picture filename
;		  a1=text
;		  a2=music filename )
;OUTPUT:	none
;CHANGES:       none

show_static_pic
		move.b	#0,num1
		move.b	#0,num2

		move.l	a0,picname
		move.l	a1,text
		move.l	a2,music

		move.w	#MODE_STATIC,variables+mode(a5)

		bra.s	do_static_pic

show_static
		lea	name1,a0
		lea	global_vars+curr_locn+locn_info(a5),a1
		lea	name2,a2

		move.l	a0,picname
		move.l	a1,text
		move.l	a2,music

	IFD	editor
		rts
	ENDC
	IFD     rolling_demo
		rts
	ENDC
		move.w	#MODE_STATIC,variables+mode(a5)

		move.b	#'x',num1
		moveq.l	#0,d0
		move.b	global_vars+curr_locn+locn_picture_num(a5),d0
		beq.s	.no_picture
		lea	num1,a0
 		jsr	itoa_bu
.no_picture
		move.b	#'x',num2
		moveq.l	#0,d0
		move.b	global_vars+curr_locn+locn_music_num(a5),d0
		beq.s	.no_music
		lea	num2,a0
		jsr	itoa_bu
.no_music
do_static_pic

	IFD	demo
		tst.w	global_vars+game_count(a5)
		bne.s	.not_first_time
		tst.w	global_vars+attract_mode(a5)
		bne.s	.not_first_time
		tst.l	os_kill
		bne.s	.skip_wait
		tst.l	os_kill
		bne	.os_dead1
		jsr	temp_restore_system
.os_dead1	jsr	wait_for_input
		tst.l	os_kill
		bne	.os_dead2
		jsr	temp_take_system
.os_dead2	clr.w	frame_count
.skip_wait
.not_first_time
	ENDC

		tst.w	global_vars+action_flag(a5)
		bne.s	.action1

		jsr	kill_screen

		move.l	#lace_anim_buffer,a0
		add.l	a4,a0
		move.l	#front_anim_in,a1
		add.l	a5,a1
		jsr	play_anim

		move.l  #lc_mesg_buffer,a0
		add.l	a4,a0
		jsr	set_up_message_screen
.action1
		move.w	#0,variables+file_mode(a5)

		bsr	load_and_decrunch_static_data

		jsr	unshow_message
		move.l  #lace_anim_buffer,a0
		add.l	a4,a0
		move.l	#front_anim_out,a1
		add.l	a5,a1
		jsr	play_anim

		tst.l	text
		bne.s	.text3
		move.l	#static_panel,a0
		bra.s	.skip_text3
.text3		move.l	#static_picture,a0
.skip_text3	add.l	exchip_mem_base,a0

		move.l	a0,viewing_buffer
		move.l	#static_panel,a0
		add.l	exchip_mem_base,a0
		move.l	a0,drawing_buffer
		BOB_INFO drawing_buffer,#static_p_plane_width/8,#static_p_plane_height,#static_p_num_planes,#0,#0,#static_p_plane_width,#static_p_plane_height,#0

		tst.l	text
		beq.s	.no_text
		move.l	#%0010001111,d6
		move.l	#static_font,a2
		add.l	exchip_mem_base,a2
		move.w	#2,scale
		move.w	#10,yoffset
		BLIT_TEXT (a0),a2,#0,#0
		move.w	#1,scale
		move.w	#0,yoffset
.no_text

		tst.l	music
		beq.s	.no_music2

		movem.l	d0-d7/a0-a6,-(sp)
		jsr	_StopPlayer
		movem.l	(sp)+,d0-d7/a0-a6

		cmpi.b	#'x',num2
		beq.s	.no_music2
		move.l	#static_music,a0
		add.l	exchip_mem_base,a0
		movem.l	d0-d7/a0-a6,-(sp)
		jsr	_RelocModule
		movem.l	(sp)+,d0-d7/a0-a6
		movem.l	d0-d7/a0-a6,-(sp)
		jsr	_PlayModule
		movem.l	(sp)+,d0-d7/a0-a6
.no_music2
		jsr	set_up_static_screen

		move.w	#1,variables+file_mode(a5)	;only show messages
		rts					; on error

picname		dc.l	0
text		dc.l	0
music		dc.l	0

name1		dc.b	"Static/Static"
num1		dc.b	"xx.pic",0
name2		dc.b	"Static/Static"
num2		dc.b	"xx.mod",0

********************************************************************************
**************************** Load and Decrunch Static Data *********************
********************************************************************************

load_and_decrunch_static_data
		move.l  #lc_disk_buffer,a2
		add.l	a4,a2

		moveq.l	#-1,d1
		tst.w	global_vars+action_flag(a5)
		bne.s	.action
		move.b	global_vars+curr_locn+locn_disk(a5),d1
.action
		PRELOG_DISK #2,a2,d1

		tst.w	global_vars+action_flag(a5)
		bne.s	.actionb
		SHOW_MESG diskio_mesg_1
.actionb
		move.l	#static_copperlist,a1
		add.l	exchip_mem_base,a1
		LOAD_FILE <"Static/Static.dat">,a1

		tst.l	music
		beq.s	.no_music
		cmpi.b	#'x',num2
		beq	.no_music
		move.l	#static_music,a1
		add.l	exchip_mem_base,a1
		move.l	music,a0
		LOAD_FILE2 (a0),a1
.no_music
		tst.l   picname
		beq.s	.no_picture
		cmpi.b	#'x',num1
		beq	.no_picture
		move.l	#static_picture,a1
		tst.l	text
		bne.s	.text5
		move.l	#static_panel,a1
.text5		add.l	exchip_mem_base,a1
		move.l	picname,a0
		LOAD_FILE2 (a0),a1
.no_picture
		tst.w	global_vars+action_flag(a5)
		bne.s	.action2
		SHOW_MESG decrunch_message
.action2
		move.l	#static_copperlist,a1
		add.l	exchip_mem_base,a1
		PP_DECRUNCH a1

		tst.l   picname
		beq.s	.no_picture2
		cmpi.b	#'x',num1
		beq	.no_picture2
		move.l	#static_picture,a1
		tst.l	text
		bne.s	.text4
		move.l	#static_panel,a1
.text4		add.l	exchip_mem_base,a1
		PP_DECRUNCH a1
.no_picture2
		tst.l	music
		beq.s	.no_music2
		cmpi.b	#'x',num2
		beq	.no_music2
		move.l	#static_music,a1
		add.l	exchip_mem_base,a1
		PP_DECRUNCH a1
.no_music2

;set up in-line pointers

		move.l	#static_font,a0
		add.l	exchip_mem_base,a0
		move.l	a0,d0
		add.l	d0,text_address(a0)

		rts

********************************************************************************
********************************* Responsive keys ******************************
********************************************************************************
;Format : keydown, keycode, release
; Keydown is set while the key is pressed.
; Use keycode as specified in Hardware Reference Manual page 249.
; Set release for keyup messages to be interpreted.

static_key_list
static_key_down	dc.b	0
static_key_up	dc.b	0
		dc.b	0,$ff,0		;eod marker

                even
