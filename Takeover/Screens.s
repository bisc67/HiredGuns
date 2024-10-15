********************************************************************************
*
*	Screen.s
*	Release 2.4
*	Date 16/2/93
*
*	Friendly system takeover
*	Screen handling routines
*
*	Copyright © Scott Johnston 1991-93
*	All Rights Reserved Worldwide
*
********************************************************************************

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5.l=address of parameters/variables block (long)
;		d0.l=screen depth
;		d1.l=screen width
;		d2.l=screen height
;		d3.l=screen viewmodes
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

_STOpenScreen
		movem.l	d1-d7/a0-a6,-(sp)

		lea	newscreen_structure(pc),a0
		lea	newwindow_structure(pc),a1

		move.w	d1,ns_Width(a0)
		move.w	d1,nw_Width(a1)
		move.w	d2,ns_Height(a0)
		move.w	d2,nw_Height(a1)
		move.w	d0,ns_Depth(a0)
		move.w	d3,ns_ViewModes(a0)

		move.l	intuition_base(a5),a6   ;open custom screen
		JSRLIB	OpenScreen

		move.l	d0,screen_struct(a5)
		bne.s	.opened_screen
		moveq.l	#10,d0			;error number 10
                bra.s	.error
.opened_screen

		move.l	screen_struct(a5),a0
		lea	sc_ViewPort(a0),a0
		lea	newscreen_palette(pc),a1
		moveq.l	#4,d0
		move.l	graphics_base(a5),a6   ;set palette
		JSRLIB	LoadRGB4

		lea	newwindow_structure(pc),a0
		move.l	screen_struct(a5),nw_Screen(a0)
		move.l	intuition_base(a5),a6	;open window
		JSRLIB	OpenWindow

		move.l	d0,backwindow_struct(a5)
		bne.s	.opened_window
		move.l	#58,d0			;error number 58
		bra.s	.error
.opened_window
		move.l	screen_struct(a5),a0
		moveq.l	#FALSE,d0
		JSRLIB	ShowTitle		;title bar to front

		cmpi.l	#39,graphics_version(a5)
		blt.s	.no_videocontrol

		move.l	screen_struct(a5),a0	;lores sprites please
		move.l	sc_ViewPort+vp_ColorMap(a0),a0
		lea	newscreen_videocontrol,a1
		move.l	graphics_base(a5),a6
		JSRLIB	VideoControl
		tst.l	d0
		beq.s	.videocontrol_ok
		moveq.l	#65,d0			;error number 65
		bra.s	.error
.videocontrol_ok

		move.l	screen_struct(a5),a0
		move.l	intuition_base(a5),a6
		JSRLIB	MakeScreen
		JSRLIB	RethinkDisplay
.no_videocontrol

.no_error	moveq.l	#0,d0			;no errors
.error		movem.l	(sp)+,d1-d7/a0-a6
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	none
;CHANGES:	none

_STCloseScreen
		movem.l	d0-d7/a0-a6,-(sp)

 		move.l	intuition_base(a5),a6

		move.l	backwindow_struct(a5),a0	;close window
		cmpa.l	#0,a0
		beq.s	.no_window
		JSRLIB	CloseWindow
		clr.l	backwindow_struct(a5)
.no_window
		move.l	screen_struct(a5),a0
		cmpa.l	#0,a0
		beq.s	.skip_screen
		JSRLIB	CloseScreen			;close custom screen
		clr.l	screen_struct(a5)
.skip_screen
		movem.l	(sp)+,d0-d7/a0-a6
		rts

********************************************************************************

newscreen_palette
		dc.w	$000
		dc.w	$000
		dc.w	$000
		dc.w	$000

newscreen_structure
		dc.w	0				;left edge
		dc.w	0				;top edge
		dc.w	0				;width
		dc.w	0				;height
		dc.w	0				;depth
		dc.b	0				;detail pen
		dc.b	1				;block pen
		dc.w	V_HIRES				;viewmodes
		dc.w	CUSTOMSCREEN!NS_EXTENDED!SCREENHIRES	;type
		dc.l	default_font			;font
		dc.l	parameters+code_filename	;default title
		dc.l	0				;gadgets
		dc.l	0				;bitmap
		dc.l	newscreen_tags

newscreen_tags	dc.l	SA_Pens,newscreen_pens
		dc.l	SA_ShowTitle,1
		dc.l	SA_DisplayID,HIRES_KEY
		dc.l	TAG_DONE,0

newscreen_pens	dc.w	0		;DETAILPEN, compatible Intuition rendering pens
		dc.w	1		;BLOCKPEN, compatible Intuition rendering pens
		dc.w	1		;TEXTPEN, text on background
		dc.w	2		;SHINEPEN,bright edge on 3D objects
		dc.w	1		;SHADOWPEN, dark edge on 3D objects
		dc.w	3		;FILLPEN, active-window/selected-gadget fill
		dc.w	1		;FILLTEXTPEN, text over FILLPEN
		dc.w	0		;BACKGROUNDPEN, always color 0
		dc.w	2		;HIGHLIGHTTEXTPEN, special color text, on background
		dc.w	1		;BARDETAILPEN, text/detail in screen-bar/menus
		dc.w	2		;BARBLOCKPEN, screen-bar/menus fill
		dc.w	1		;BARTRIMPEN, trim under menu-bar

;WA_NewLookMenus	equ	TAG_USER+99+$22

newscreen_videocontrol
		dc.l	VTAG_BORDERSPRITE_CLR,0
		dc.l	VTAG_SPRITERESN_SET,SPRITERESN_ECS
		dc.l	VTAG_END_CM,0

newwindow_structure
		dc.w	0,0		;left edge, top edge
		dc.w	0,0		;width, height
		dc.b	1		;detail pen
		dc.b	0		;block pen
		dc.l	0		;IDCMP
		dc.l	WFLG_NW_EXTENDED!WFLG_SIMPLE_REFRESH!WFLG_ACTIVATE!WFLG_BORDERLESS!WFLG_RMBTRAP!WFLG_BACKDROP
					;flags
		dc.l	0		;gadgets
		dc.l	0		;checkmark
		dc.l	0		;title
		dc.l	0		;screen
		dc.l	0		;bitmap
		dc.w	0,0		;min width, height
		dc.w	0,0		;max width, height
		dc.w	CUSTOMSCREEN	;screen type
		dc.l	newwindow_tags
					;pointer to tags

newwindow_tags	dc.l	WA_NewLookMenus,0
		dc.l	TAG_DONE,0
