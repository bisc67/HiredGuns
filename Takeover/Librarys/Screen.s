****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block (long)
;		a0.l=address of screen bitmaps (long)
;		d0.l=screen depth
;		d1.l=screen width
;		d2.l=screen height
;		d3.l=screen viewmodes
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

		IFD	INCLUDE_TOOLS

_STOpenScreen
		movem.l	d1-d7/a0-a6,-(sp)

		move.l	a0,screen_bitmaps(a5)
		lea	newscreen1_structure(pc),a0
		move.w	d1,ns_Width(a0)
		move.w	d2,ns_Height(a0)
		move.w	d0,ns_Depth(a0)
		move.w	d3,ns_ViewModes(a0)

		movem.l	d0-d3/a5,-(sp)		;initialise screen 1 bitmap
		lea	screen1_bitmap_structure(pc),a0
		move.l	graphics_base(a5),a6
		jsr	_LVOInitBitMap(a6)
		movem.l	(sp)+,d0-d3/a5

		lea	newscreen2_structure(pc),a0
		move.w	d1,ns_Width(a0)
		move.w	d2,ns_Height(a0)
		move.w	d0,ns_Depth(a0)
		move.w	d3,ns_ViewModes(a0)

		movem.l	d0-d3/a5,-(sp)		;initialise screen 2 bitmap
		lea	screen2_bitmap_structure(pc),a0
		move.l	graphics_base(a5),a6
		jsr	_LVOInitBitMap(a6)
		movem.l	(sp)+,d0-d3/a5

		lsr.w	#3,d1
		mulu.w	d2,d1			;plane size

		move.l	screen_bitmaps(a5),a1
                cmpa.l	#0,a1
		bne.s	.screen_buffer_valid
		moveq.l	#18,d0			;error number 18
                bra.s	.error
.screen_buffer_valid

		lea	screen1_bitmap_structure+bm_Planes(pc),a0
		move.w	d0,d2
		subq.l	#1,d2
.screen1_loop	move.l	a1,(a0)+		;set up screen 1 bitplanes
		add.w	d1,a1
		dbf	d2,.screen1_loop

		lea	screen2_bitmap_structure+bm_Planes(pc),a0
		move.w	d0,d2
		subq.l	#1,d2
.screen2_loop	move.l	a1,(a0)+		;set up screen 2 bitplanes
		add.w	d1,a1
		dbf	d2,.screen2_loop

		move.l	a5,-(sp)		;open custom screen 1
		lea	newscreen1_structure(pc),a0
		move.l	intuition_base(a5),a6
		jsr	_LVOOpenScreen(a6)
		move.l	(sp)+,a5

		move.l	d0,screen1_struct(a5)
		bne.s	.opened_screen1
		moveq.l	#9,d0			;error number 9
                bra.s	.error
.opened_screen1

		move.l	a5,-(sp)		;open custom screen 2
		lea	newscreen2_structure(pc),a0
		move.l	intuition_base(a5),a6
		jsr	_LVOOpenScreen(a6)
		move.l	(sp)+,a5

		move.l	d0,screen2_struct(a5)
		bne.s	.opened_screen2
		moveq.l	#10,d0			;error number 10
                bra.s	.error
.opened_screen2

.no_error	moveq.l	#0,d0			;no errors
.error		movem.l	(sp)+,d1-d7/a0-a6
		rts

		ENDC

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	none
;CHANGES:	none

		IFD	INCLUDE_TOOLS

_STCloseScreen
		movem.l	d0-d7/a0-a6,-(sp)

		tst.l	screen1_struct(a5)
		beq.s	.skip_screen1
		move.l	a5,-(sp)		;close custom screen 1
		move.l	screen1_struct(a5),a0
		move.l	intuition_base(a5),a6
		jsr	_LVOCloseScreen(a6)
		move.l	(sp)+,a5
		clr.l	screen1_struct(a5)
.skip_screen1
		tst.l	screen2_struct(a5)
		beq.s	.skip_screen2
		move.l	a5,-(sp)		;close custom screen 2
		move.l	screen2_struct(a5),a0
		move.l	intuition_base(a5),a6
		jsr	_LVOCloseScreen(a6)
		move.l	(sp)+,a5
		clr.l	screen2_struct(a5)
.skip_screen2
		movem.l	(sp)+,d0-d7/a0-a6
		rts

****************************************************************************
newscreen1_structure
		dc.w	0				;left edge
		dc.w	0				;top edge
		dc.w	0				;width
		dc.w	0				;height
		dc.w	0				;depth
		dc.b	1				;detail pen
		dc.b	0				;block pen
		dc.w	0				;viewmodes
		dc.w	CUSTOMSCREEN!CUSTOMBITMAP!SCREENQUIET	;type
		dc.l	0				;font
		dc.l	0				;default title
		dc.l	0				;gadgets
		dc.l	screen1_bitmap_structure	;bitmap

newscreen2_structure
		dc.w	0				;left edge
		dc.w	0				;top edge
		dc.w	0				;width
		dc.w	0				;height
		dc.w	0				;depth
		dc.b	1				;detail pen
		dc.b	0				;block pen
		dc.w	0				;viewmodes
		dc.w	CUSTOMSCREEN!CUSTOMBITMAP!SCREENQUIET	;type
		dc.l	0				;font
		dc.l	0				;default title
		dc.l	0				;gadgets
		dc.l	screen2_bitmap_structure	;bitmap

screen1_bitmap_structure
		ds.b	bm_SIZEOF
screen2_bitmap_structure
		ds.b	bm_SIZEOF

		ENDC

