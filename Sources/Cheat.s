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
********************************** Display Info ********************************
********************************************************************************
;A routine to display game info (eg frame rate).
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	a0-a2,d0
display_info
		BOB_INFO viewing_buffer,#views_plane_width/8,#views_plane_height,#views_num_planes,#0,#0,#views_plane_width,#views_plane_height-1,#0

		move.l	#miscgfx+game_font,a2
		add.l	a4,a2
		move.l	(a2),a2
		add.l	#miscgfx,a2
		add.l   a4,a2
		TEXT_ATTR (a2),#2,#2,#2,#2,#1

		move.w	frame_count,d1
		ITOA_WU d1,some_text(pc)
		move.w	#%1010011111,d6		;mask off
		BLIT_TEXT some_text(pc),a2,#136,#110

		rts

		move.w	variables+mouse_move(a5),d1
		beq.s	.no_mouse
		ITOA_WU d1,some_text(pc)
		move.w	#%1010011111,d6		;mask off
		BLIT_TEXT some_text(pc),a2,#136,#120
.no_mouse

		cmp.w	#0,global_vars+attract_mode(a5)
		bne.s	.not_realtime
		move.w	#%1010011111,d6		;mask off
		BLIT_TEXT realtime(pc),a2,#136,#130
.not_realtime

		cmp.w	#1,global_vars+attract_mode(a5)
		bne.s	.not_recording
		move.w	#%1010011111,d6		;mask off
		BLIT_TEXT recording(pc),a2,#136,#130
.not_recording

		cmp.w	#2,global_vars+attract_mode(a5)
		bne.s	.not_playing
		move.w	#%1010011111,d6		;mask off
		BLIT_TEXT playing(pc),a2,#136,#130
.not_playing
		rts

some_text	dc.b	"      ",0
		even

recording	dc.b	"recording",0
		even

playing		dc.b	"playing",0
		even

realtime	dc.b	"realtime",0
		even

********************************************************************************
**************************** Check cheat controls ******************************
********************************************************************************
;A routine to handle the cheat mode keys.
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	a0-a2,d0
check_cheat_controls
	IFD	demo
		tst.b	attract_save
		beq.s	.not_attract_save
		sf.b	attract_save

		move.w	variables+mouse_move(a5),d0
                move.l	#mouse_moves,a0
		add.l	a5,a0
		add.l	d0,a0
		move.w	#65535,(a0)
		add.w	#2,variables+mouse_move(a5)
		move.w	#0,global_vars+attract_mode(a5)

                move.l	#mouse_moves,a1
		add.l	a5,a1
	IFD	download
		illegal
	ENDC
		SAVE_FILE <"Game/Mouse.dat">,a1,#end_mouse_moves-mouse_moves
.not_attract_save
	ENDC

		tst.b	ntsc_mode
		beq.s	.not_ntsc_mode
		WAIT_VBLANK
		move.w	#0,$dff1dc
		sf.b	ntsc_mode
.not_ntsc_mode
		tst.b	pal_mode
		beq.s	.not_pal_mode
		WAIT_VBLANK
		move.w	#$20,$dff1dc
		sf.b	pal_mode
.not_pal_mode
		tst.b   gedit_on
		beq.s	.not_gedit_on
		sf.b	gedit_on
		tst.w	variables+gedit_onoff(a5)
		beq.s	.switch_on
		move.w	#0,variables+gedit_onoff(a5)
		or.w	#%00011111,variables+redraw_flag(a5)	;refesh planes 1-5, no save
                bra.s	.not_gedit_on
.switch_on	move.w	#1,variables+gedit_onoff(a5)
		move.w	#0,variables+gedit_position(a5)
.not_gedit_on
		tst.w   variables+gedit_onoff(a5)
		bne.s	do_graphic_edit

		rts

****************************************************************************
do_graphic_edit
		tst.b   gedit_next
		beq.s	.not_next_position
		sf.b    gedit_next
		addi.w	#1,variables+gedit_position(a5)
		cmpi.w	#67,variables+gedit_position(a5)
		bne.s	.not_next_position
		move.w	#0,variables+gedit_position(a5)
.not_next_position
		tst.b   gedit_last
		beq.s	.not_last_position
		sf.b    gedit_last
		subi.w	#1,variables+gedit_position(a5)
		cmpi.w	#-1,variables+gedit_position(a5)
		bne.s	.not_last_position
		move.w	#66,variables+gedit_position(a5)
.not_last_position
		tst.b	gedit_sl_floor
		beq.s   .not_select_floor
		sf.b	gedit_sl_floor
		move.w	#0,variables+gedit_selected(a5)
.not_select_floor
		tst.b	gedit_sl_block
		beq.s   .not_select_block
		sf.b	gedit_sl_block
		move.w	#1,variables+gedit_selected(a5)
.not_select_block
		tst.b	gedit_sl_water
		beq.s   .not_select_water
		sf.b	gedit_sl_water
		move.w	#2,variables+gedit_selected(a5)
.not_select_water
		tst.b	gedit_sl_panel
		beq.s   .not_select_panel
		sf.b	gedit_sl_panel
		move.w	#3,variables+gedit_selected(a5)
.not_select_panel
		tst.b	gedit_sl_expl
		beq.s   .not_select_expl
		sf.b	gedit_sl_expl
		move.w	#4,variables+gedit_selected(a5)
.not_select_expl
		tst.b	gedit_sl_aux
		beq.s   .not_select_aux
		sf.b	gedit_sl_aux
		move.w	#5,variables+gedit_selected(a5)
.not_select_aux
		bsr	get_type

		tst.b   gedit_up
		beq	.not_up
		sf.b    gedit_up
		sub.w	#1,6(a0)
.not_up
		tst.b   gedit_down
		beq	.not_down
		sf.b    gedit_down
		add.w	#1,6(a0)
.not_down
		tst.b   gedit_left
		beq	.not_left
		sf.b    gedit_left
		sub.w	#1,4(a0)
.not_left
		tst.b   gedit_right
		beq	.not_right
		sf.b    gedit_right
		add.w	#1,4(a0)
.not_right
		tst.b   gedit_mirror_up
		beq	.not_mirror_up
		sf.b    gedit_mirror_up
		subi.w	#1,control(a0)
.not_mirror_up
		tst.b   gedit_mirror_dn
		beq	.not_mirror_dn
		sf.b    gedit_mirror_dn
		addi.w	#1,control(a0)
.not_mirror_dn
		tst.b   gedit_flip
		beq	.not_flip
		sf.b    gedit_flip
		cmpi.w	#4,control(a0)
		bge.s	.at4
		addi.w	#1,control(a0)
		bra.s	.not_flip
.at4            clr.w	control(a0)
.not_flip
		moveq.l	#0,d0
		ITOA_WUZ 4(a0),.some_x(pc)
		ITOA_WUZ 6(a0),.some_y(pc)
		lea     .some_flip(pc),a1
		move.w	control(a0),d0
		cmpi.w	#3,d0
		ble.s	.not_mirror
		subi.w	#4,d0
		ITOA_WUZ d0,.mirror_text(pc)
		move.w	#4,d0
.not_mirror	mulu	#17,d0
		add.w	d0,a1

		move.l	#miscgfx+game_font,a2
		add.l	a4,a2
		move.l	(a2),a2
		add.l	#miscgfx,a2
		add.l	a4,a2
		TEXT_ATTR (a2),#2,#2,#2,#2,#1
		move.w	#%1010011111,d6		;mask off

                move.l	#scrolly,a0
		add.l   a4,a0
		BOB_INFO viewing_buffer,#views_plane_width/8,#views_plane_height,#views_num_planes,#0,#0,#views_plane_width,#views_plane_height-1,#0
		BLIT_TEXT .some_text(pc),a2,#170,#30
		BLIT_TEXT (a1),a2,#170,#40

		lea     .types(pc),a1
		move.w	variables+gedit_selected(a5),d0
		mulu.w	#18,d0
		add.w	d0,a1

		BLIT_TEXT (a1),a2,#170,#50

		tst.b   gedit_save
		beq	.not_save
.wait_release	tst.b   gedit_save
		bne.s	.wait_release
		bsr	get_type
		move.l  variables+gedit_save_posn(a5),a1;save from here
	IFD	download
		illegal
	ENDC
		SAVE_FILE <"Ram:New.dump">,a1,#956
.not_save
		or.w	#%00011111,variables+redraw_flag(a5)	;refesh planes 1-5, no save

		rts

.some_text	dc.b	"X "
.some_x		dc.b	"      Y "
.some_y		dc.b	"     ",0
.some_flip	dc.b	"Mode : Norm~~~~~",0
		dc.b	"Mode : Flipped~~",0
		dc.b	"Mode : Mirrored~",0
		dc.b	"Mode : None~~~~~",0
.mirror_text	dc.b	"         ",0
.types		dc.b	"Field : Floor~~~~",0
		dc.b	"Field : Block~~~~",0
		dc.b	"Field : Water~~~~",0
		dc.b	"Field : Panel~~~~",0
		dc.b	"Field : Explosion",0
		dc.b	"Field : Auxiliary",0
		even

****************************************************************************
get_type	move.l	variables+gedit_block(a5),d0
		move.l	#gamegfx,a1
		add.l	a4,a1

		cmpi.w	#0,variables+gedit_selected(a5)
		bne.s	.not_selected_floor
		and.l	#keep_floor,d0
		move.w	#floor_shift,d1
		ror.l	d1,d0			;d0=floor type
		move.l	#gamegfx+floor_addresses,a0
		add.l	a4,a0
.not_selected_floor
		cmpi.w	#1,variables+gedit_selected(a5)
		bne.s	.not_selected_block
		and.l	#keep_block,d0
		move.w	#block_shift,d1
		ror.l	d1,d0			;d0=block type
		move.l	#gamegfx+block_addresses,a0
		add.l	a4,a0
		cmp.b	#7,d0
		bne.s	.not_exgfx
		cmp.b	#22,d0
		blt.s	.not_exgfx
		cmp.b	#31,d0
		bgt.s	.not_exgfx
		sub.w	#22,d0
		move.l	#exgfx,a0
		add.l	a5,a0
		move.l	a0,a1
.not_exgfx
.not_selected_block
		cmpi.w	#2,variables+gedit_selected(a5)
		bne.s	.not_selected_water
		and.l	#keep_water,d0
		move.w	#water_shift,d1
		ror.l	d1,d0			;d0=water type
		move.l	#gamegfx+water_addresses,a0
		add.l	a4,a0
.not_selected_water
		cmpi.w	#3,variables+gedit_selected(a5)
		bne.s	.not_selected_panel
		and.l	#keep_panel,d0
		move.w	#panel_shift,d1
		ror.l	d1,d0			;d0=panel type
		move.l	#gamegfx+panel_addresses,a0
		add.l	a4,a0
.not_selected_panel
		cmpi.w	#4,variables+gedit_selected(a5)
		bne.s	.not_selected_expl
		and.l	#keep_explosion,d0
		move.w	#explosion_shift,d1
		ror.l	d1,d0			;d0=explosion type
		move.l	#gamegfx+explosion_addresses,a0
		add.l	a4,a0
.not_selected_expl
		cmpi.w	#5,variables+gedit_selected(a5)
		bne.s	.not_selected_aux
		and.l	#keep_aux&(~keep_aux_here_bit),d0
		move.w	#aux_shift,d1
		ror.l	d1,d0			;d0=aux type
		move.l	#gamegfx+aux_addresses,a0
		add.l	a4,a0
.not_selected_aux

		lsl.w	#2,d0
		move.l	0(a0,d0.w),a0
		add.l	a1,a0
		move.l	a0,variables+gedit_save_posn(a5)
		move.w	variables+gedit_position(a5),d1
		lea	view_offsets,a2
		lsl.w	#2,d1
		move.l	0(a2,d1.w),d1
		mulu.w	#14,d1
		lea	bob_struct_size(a0,d1.w),a0
		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		none
;OUTPUT:        none
;CHANGES:	none
flash_block
		cmpi.w	#0,player_num(a0)
		bne.s	.not_player1
		tst.w	variables+gedit_onoff(a5)
		beq.s	.skip_flash_block
		st.b	variables+redraw_flag(a5)
		cmp.w	#3,variables+gedit_timer(a5)
		bge.s	.skip_flash_block
		move.w	variables+gedit_position(a5),d0
		lsl.w	#2,d0
		move.l	view(a0,d0.w),variables+gedit_block(a5)
		clr.l	view(a0,d0.w)		;clear block
.skip_flash_block
		add.w	#1,variables+gedit_timer(a5)
		cmp.w	#6,variables+gedit_timer(a5)
		bne.s	.not_20
		move.w	#0,variables+gedit_timer(a5)
.not_20
.not_player1	rts

