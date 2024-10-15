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

do_end_sequence
	IFD	demo
		rts
	ELSE
		move.w	#MODE_END,variables+mode(a5)

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

		bsr	load_and_decrunch_end_data

		jsr	unshow_message
		move.l  #lace_anim_buffer,a0
		add.l	a4,a0
		move.l	#front_anim_out,a1
		add.l	a5,a1
		jsr	play_anim

		move.l	#outro_music,a0
		add.l	a4,a0
		movem.l	d0-d7/a0-a6,-(sp)
		jsr	_RelocModule
		movem.l	(sp)+,d0-d7/a0-a6
		movem.l	d0-d7/a0-a6,-(sp)
		jsr	_PlayModule
		movem.l	(sp)+,d0-d7/a0-a6

		move.l	#outro_backdrop,a0
		add.l	a4,a0
		BOB_INFO a0,#backdrop_plane_width/8,#backdrop_plane_height,#backdrop_num_planes,#0,#0,#backdrop_plane_width,#backdrop_plane_height,#0

		move.l	#outro_screen,drawing_buffer
		move.l	#outro_backdrop,viewing_buffer

		jsr	set_up_end_screen

		clr.w	variables+outro_char(a5)

		tst.l	os_kill
		bne.s	.dead2
		jsr	temp_restore_system
.dead2
		clr.w	frame_count
.wait1		move.w	frame_count,d0
		cmpi.w	#50*5,d0
		blt.s	.wait1

		clr.w	last_key

.go_again	move.l	viewing_buffer,d0
		move.l	drawing_buffer,viewing_buffer
		move.l	d0,drawing_buffer

		tst.l	os_kill
		bne.s	.dead4
		jsr	temp_take_system
.dead4
		jsr	set_up_end_screen
		addi.w	#1,variables+outro_char(a5)
		cmpi.w	#24,variables+outro_char(a5)
		bne.s	.not_24
		clr.w	variables+outro_char(a5)
.not_24
		tst.l	os_kill
		bne.s	.dead5
		jsr	temp_restore_system
.dead5
		clr.w	frame_count
.wait2		jsr	test_input
		tst.w	d0
		bne.s	.cont
		move.w	frame_count,d0
		move.l	drawing_buffer,d1
		cmp.l	#outro_screen,d1
		beq.s	.short
		cmpi.w	#50*20,d0
		blt.s	.wait2
		bra.s	.go_again
.short		cmpi.w	#50*5,d0
		blt.s	.wait2
		bra.s	.go_again

.cont		tst.l	os_kill
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

load_and_decrunch_end_data
		move.l	#lc_disk_buffer,a2
		add.l	a4,a2				;disk buffer
		LOG_DISK #5,a2,#1

		SHOW_MESG diskio_mesg_1

		move.l	#outro_copperlist,a1
		add.l	a4,a1
		LOAD_FILE <"Front/Outro.dat">,a1

		SHOW_MESG decrunch_message

		move.l	#outro_copperlist,a1
		add.l	a4,a1
		PP_DECRUNCH a1

		move.l	#outro_text,a1
		add.l	a4,a1
		move.b	lang,d0
		beq	.eng

		cmpi.b	#FRENCH,d0
		bne.s	.not_fre
		LOAD_FILE <"Front/Outro.fre">,a1
		bra	.not_spa
.not_fre
		cmpi.b	#GERMAN,d0
		bne.s	.not_ger
		LOAD_FILE <"Front/Outro.ger">,a1
		bra	.not_spa
.not_ger
		cmpi.b	#ITALIAN,d0
		bne.s	.not_ita
		LOAD_FILE <"Front/Outro.ita">,a1
		bra.s	.not_spa
.not_ita
		cmpi.b	#SPANISH,d0
		bne.s	.not_spa
		LOAD_FILE <"Front/Outro.spa">,a1
		bra.s	.not_spa
.not_spa
		move.l	#outro_text,a1
		add.l	a4,a1
		PP_DECRUNCH a1
.eng
		move.l	#outro_font,a2
		add.l   a4,a2
		move.l	a2,d0
		add.l	d0,text_address(a2)

		move.l	#outro_foreignfont,a2
		add.l   a4,a2
		move.l	a2,d0
		add.l	d0,text_address(a2)

		rts

********************************************************************************
************************ Set up hardware for end screen ************************
********************************************************************************
;INPUT:         a6.l=base address of hardware registers
;OUTPUT:	none
;CHANGES:	none

set_up_end_screen
		WAIT_VBLANK
		jsr	disable_sprites

		move.w	#%1000000001000000,dmacon(a6)	;enable blitter dma

		WAIT_BLIT
		WAIT_VBLANK
		move.w	#%0000000110000000,dmacon(a6)	;copper & plane dma off
		BLACK_COLOURS

		move.w	#%0110100000000000,bplcon0(a6)	;6 bitplanes + HAM
		move.w	#50,d0				;re-sync
.wait
		WAIT_VBLANK
		dbf	d0,.wait

		move.l	#outro_copperlist,a0
		add.l	a4,a0

		move.l	drawing_buffer,a1

		cmp.l	#outro_backdrop,a1
		beq.s	.32colour
		bsr	.ham_palette
		move.w	#%0110100000000000,outro_bplcon0+2(a0)
		moveq.l	#6,d1
		bra.s	.ham
.32colour	bsr	.32_palette
		move.w	#%0101000000000000,outro_bplcon0+2(a0)
		moveq.l	#5,d1
.ham
		add.l	a4,a1
		SET_UP_BITPLANE_POINTERS outro_bplpt(a0),a1,#outro_plane_size,d1
		WAIT_VBLANK
		START_COPPER a0

		move.w	#%1000000100000000,dmacon(a6)	;enable bitplane dma

		INITIALISE_KEYS	#outro_key_list

		rts

.ham_palette	movem.l	a0-a1,-(sp)
		move.l	a0,a2
		move.l	#outro_plt,a0
		add.l	a4,a0
		DISPLAY_PALETTE (a0),outro_palette(a2)
		movem.l	(sp)+,a0-a1
		rts

.32_palette	movem.l	a0-a1,-(sp)
		move.l	a0,a2
		move.l	#outro_plt2,a0
		add.l	a4,a0
		DISPLAY_PALETTE (a0),outro_palette(a2)
		movem.l	(sp)+,a0-a1

		move.w	#(200/2)-1,d0
		moveq.l	#0,d5
		moveq.l	#0,d7
.loop		bsr	.blit_fill_line
		addq.w	#2,d7
		dbf	d0,.loop

		movem.l	d0-d7/a0-a6,-(sp)
		move.l	#outro_text,a0
		add.l	a4,a0
		move.w	variables+outro_char(a5),d0
		andi.w	#$fffe,d0
		lsl.w	#1,d0
		move.l	0(a0,d0.w),a1
		add.l	a0,a1
		move.l	#outro_font,a2
		tst.b	lang
		beq.s	.eng
		move.l	#outro_foreignfont,a2
.eng		add.l	a4,a2
		move.w	#%0000011111,d6
		BLIT_TEXT (a1),a2,#0,#0
		movem.l	(sp)+,d0-d7/a0-a6

		rts

.blit_fill_line	movem.l	d0/d5/d7/a0-a2,-(sp)
		move.l	#outro_fill,a2
		add.l	a4,a2
		lea	bob_struct_size(a2),a0	;a0=address of block structure
		move.w	#%11111,variables+redraw_temp(a5)
		jsr	blit_block		;draw warning now
		movem.l	(sp)+,d0/d5/d7/a0-a2
		rts

********************************************************************************
********************************* Responsive keys ******************************
********************************************************************************
;Format : keydown, keycode, release
; Keydown is set while the key is pressed.
; Use keycode as specified in Hardware Reference Manual page 249.
; Set release for keyup messages to be interpreted.

outro_key_list
outro_key_down	dc.b	0
outro_key_up	dc.b	0
		dc.b	0,$ff,0		;eod marker

	ENDC

                even
