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

do_death_sequence
	IFD	demo
		rts
	ELSE
		move.w	#MODE_DEATH,variables+mode(a5)

		jsr	kill_screen

		move.l	#lace_anim_buffer,a0
		add.l	a4,a0
		move.l	#front_anim_in,a1
		add.l	a5,a1
		jsr	play_anim

		move.l  #lc_mesg_buffer,a0
		add.l	a4,a0
		jsr	set_up_message_screen

		move.w	#0,variables+file_mode(a5)

		bsr	load_and_decrunch_death_data

		jsr	unshow_message
		move.l  #lace_anim_buffer,a0
		add.l	a4,a0
		move.l	#front_anim_out,a1
		add.l	a5,a1
		jsr	play_anim

		move.l	#death_screen,a0
		add.l	a4,a0
		move.l	a0,viewing_buffer
		move.l	a0,drawing_buffer
		BOB_INFO drawing_buffer,#death1_plane_width/8,#death1_plane_height,#death1_num_planes,#0,#0,#death1_plane_width,#death1_plane_height,#0

		move.l	#death_music,a0
		add.l	a4,a0
		movem.l	d0-d7/a0-a6,-(sp)
		jsr	_RelocModule
		movem.l	(sp)+,d0-d7/a0-a6
		movem.l	d0-d7/a0-a6,-(sp)
		jsr	_PlayModule
		movem.l	(sp)+,d0-d7/a0-a6

		jsr	set_up_death1_screen

		tst.l	os_kill
		bne.s	.dead2
		jsr	temp_restore_system
.dead2
		jsr	wait_for_input

		tst.l	os_kill
		bne.s	.dead3
		jsr	temp_take_system
.dead3
		movem.l	d0-d7/a0-a6,-(sp)
		jsr	_StopPlayer
		movem.l	(sp)+,d0-d7/a0-a6

		jsr	killaud

		rts

********************************************************************************
*************************** Load and Decrunch Death Data ***********************
********************************************************************************

load_and_decrunch_death_data
		move.l	#lc_disk_buffer,a2
		add.l	a4,a2				;disk buffer
;		moveq.l	#0,d0
;		move.b	global_vars+curr_locn+locn_disk(a5),d0
		LOG_DISK #1,a2,#2

		SHOW_MESG diskio_mesg_1

		move.l	#death_copperlist,a1
		add.l	a4,a1
		LOAD_FILE <"Front/Death.dat">,a1

		SHOW_MESG decrunch_message

		move.l	#death_copperlist,a1
		add.l	a4,a1
		PP_DECRUNCH a1

		rts

********************************************************************************
************************ Set up hardware for death1 screen *********************
********************************************************************************
;INPUT:         a6=base address of hardware registers (long)
;OUTPUT:	none
;CHANGES:	none
set_up_death1_screen
		WAIT_VBLANK
		jsr	disable_sprites

		move.w	#%1000000001000000,dmacon(a6)	;enable blitter dma

		WAIT_BLIT
		WAIT_VBLANK
		move.w	#%0000000110000000,dmacon(a6)	;copper & plane dma off
		BLACK_COLOURS

		move.w	#%0101000000000000,bplcon0(a6)	;5 bitplanes
		move.w	#50,d0				;re-sync
.wait
		WAIT_VBLANK
		dbf	d0,.wait

		move.l	#death_copperlist,a0
		add.l	a4,a0

		move.l	viewing_buffer,a1
		SET_UP_BITPLANE_POINTERS death1_bplpt(a0),a1,#death1_plane_size,#death1_num_planes
		WAIT_VBLANK
		START_COPPER a0

		move.w	#%1000000100000000,dmacon(a6)	;enable bitplane dma

		move.l	a0,a2

		move.l	#death_plt,a0
		add.l	a4,a0
		DISPLAY_PALETTE (a0),death1_palette(a2)

		INITIALISE_KEYS	#death_key_list

		rts

********************************************************************************
********************************* Responsive keys ******************************
********************************************************************************
;Format : keydown, keycode, release
; Keydown is set while the key is pressed.
; Use keycode as specified in Hardware Reference Manual page 249.
; Set release for keyup messages to be interpreted.

death_key_list
death_key_down	dc.b	0
death_key_up	dc.b	0
		dc.b	0,$ff,0		;eod marker

	ENDC

                even
