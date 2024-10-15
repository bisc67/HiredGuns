********************************************************************************
*
*	Windows.s
*	Release 2.4
*	Date 3/4/93
*
*	Friendly system takeover
*	Window routines
*
*	Copyright © Scott Johnston 1991-93
*	All Rights Reserved Worldwide
*
********************************************************************************

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

_LVOGetLanguageSelection	equ	-36

_STGetLanguage
		movem.l	d1-d7/a0-a6,-(sp)

		bsr	enable_language_gadgets

		tst.b	language(a5)
;		bpl.s	.ok

		move.l	lowlevel_base(a5),a6
		jsr	_LVOGetLanguageSelection(a6)
		move.b	#ENGLISH,language(a5)
		cmp.l	#LANG_FRENCH,d0
		bne.s	.not_french
		move.b	#FRENCH,language(a5)
.not_french
		cmp.l	#LANG_GERMAN,d0
		bne.s	.not_german
		move.b	#GERMAN,language(a5)
.not_german
		cmp.l	#LANG_ITALIAN,d0
		bne.s	.not_italian
		move.b	#ITALIAN,language(a5)
.not_italian
		cmp.l	#LANG_SPANISH,d0
		bne.s	.not_spanish
		move.b	#SPANISH,language(a5)
.not_spanish
		moveq.l	#0,d0
		tst.b	arg_retappwin(a5)
		beq	.end
		jsr	load_graphics_data
		bra	.end
.ok
		jsr	load_graphics_data
		tst.l	d0
		bne	.end

		lea	language_newwindow,a0	;open window
		move.l	intuition_base(a5),a6
		JSRLIB	OpenWindow

		move.l	d0,window_struct(a5)
		bne.s	.opened_window
		move.l	#45,d0			;error number 45
                bra	.end
.opened_window
		move.l	window_struct(a5),a0
		move.l	#-1,a1
		lea	screen_title,a2
		JSRLIB	SetWindowTitles

		DRAW_IMAGE window_struct(a5),#0,#0,languages_image

		bsr	set_language_gadgets

		lea	language_gadget_1,a1	;add gadgets to window
		move.l	window_struct(a5),a0
		moveq.l	#-1,d0
		suba.l	a2,a2
		moveq.l	#-1,d1
		move.l	intuition_base(a5),a6
		JSRLIB	AddGList

		lea	language_gadget_2,a0	;redraw all gadgets
		move.l	window_struct(a5),a1
		suba.l	a2,a2
		moveq.l	#-1,d0
		move.l	intuition_base(a5),a6
		JSRLIB	RefreshGList

.loop		move.l	window_struct(a5),a0	;wait for next message
		bsr	get_message

		tst.w	d0
		beq.s	.loop

		cmpi.w	#1,d0			;abort?
		beq.s	.continue		;yes, then branch

		subq.w	#2,d0
		move.b	d0,language(a5)

		bsr	set_language_gadgets

		lea	language_gadget_2,a0	;redraw all gadgets
		move.l	window_struct(a5),a1
		suba.l	a2,a2
		moveq.l	#-1,d0
		move.l	intuition_base(a5),a6
		JSRLIB	RefreshGList

		bra.s	.loop

.continue	move.l	window_struct(a5),a0	;close window
		move.l	intuition_base(a5),a6
		JSRLIB	CloseWindow
		clr.l	window_struct(a5)
		moveq.l	#0,d0			;no error

.end		movem.l	(sp)+,d1-d7/a0-a6
		rts

********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	none
;CHANGES:	none

enable_language_gadgets
		or.w	#GFLG_DISABLED,language_gadget_2+gg_Flags
		or.w	#GFLG_DISABLED,language_gadget_3+gg_Flags
		or.w	#GFLG_DISABLED,language_gadget_4+gg_Flags
		or.w	#GFLG_DISABLED,language_gadget_5+gg_Flags
		or.w	#GFLG_DISABLED,language_gadget_6+gg_Flags

		move.b	#-1,language(a5)

		lea	languages(a5),a0
		lea	.language1,a1
		jsr	search_string
		cmp.l	#0,a0
		beq.s	.english_disabled
		andi.w	#~GFLG_DISABLED,language_gadget_2+gg_Flags
		tst.b	language(a5)
		bpl.s	.english_disabled
		move.b	#ENGLISH,language(a5)
.english_disabled
		lea	languages(a5),a0
		lea	.language2,a1
		jsr	search_string
		cmp.l	#0,a0
		beq.s	.french_disabled
		andi.w	#~GFLG_DISABLED,language_gadget_3+gg_Flags
		tst.b	language(a5)
		bpl.s	.french_disabled
		move.b	#FRENCH,language(a5)
.french_disabled
		lea	languages(a5),a0
		lea	.language3,a1
		jsr	search_string
		cmp.l	#0,a0
		beq.s	.german_disabled
		andi.w	#~GFLG_DISABLED,language_gadget_4+gg_Flags
		tst.b	language(a5)
		bpl.s	.german_disabled
		move.b	#GERMAN,language(a5)
.german_disabled
		lea	languages(a5),a0
		lea	.language4,a1
		jsr	search_string
		cmp.l	#0,a0
		beq.s	.italian_disabled
		andi.w	#~GFLG_DISABLED,language_gadget_5+gg_Flags
		tst.b	language(a5)
		bpl.s	.italian_disabled
		move.b	#ITALIAN,language(a5)
.italian_disabled
		lea	languages(a5),a0
		lea	.language5,a1
		jsr	search_string
		cmp.l	#0,a0
		beq.s	.spanish_disabled
		andi.w	#~GFLG_DISABLED,language_gadget_6+gg_Flags
		tst.b	language(a5)
		bpl.s	.spanish_disabled
		move.b	#SPANISH,language(a5)
.spanish_disabled
		rts

.request	dc.b	"NOREQ",0
.language1	dc.b	"ENGLISH",0
.language2	dc.b	"FRENCH",0
.language3	dc.b	"GERMAN",0
.language4	dc.b	"ITALIAN",0
.language5	dc.b	"SPANISH",0

********************************************************************************

set_language_gadgets
		andi.w	#~GFLG_SELECTED,language_gadget_2+gg_Flags
		andi.w	#~GFLG_SELECTED,language_gadget_3+gg_Flags
		andi.w	#~GFLG_SELECTED,language_gadget_4+gg_Flags
		andi.w	#~GFLG_SELECTED,language_gadget_5+gg_Flags
		andi.w	#~GFLG_SELECTED,language_gadget_6+gg_Flags

		cmpi.b	#0,language(a5)
		bne.s	.not_english
		or.w	#GFLG_SELECTED,language_gadget_2+gg_Flags
		rts
.not_english
		cmpi.b	#1,language(a5)
		bne.s	.not_french
		or.w	#GFLG_SELECTED,language_gadget_3+gg_Flags
		rts
.not_french
		cmpi.b	#2,language(a5)
		bne.s	.not_german
		or.w	#GFLG_SELECTED,language_gadget_4+gg_Flags
		rts
.not_german
		cmpi.b	#3,language(a5)
		bne.s	.not_italian
		or.w	#GFLG_SELECTED,language_gadget_5+gg_Flags
		rts
.not_italian
		cmpi.b	#4,language(a5)
		bne.s	.not_spanish
		or.w	#GFLG_SELECTED,language_gadget_6+gg_Flags
		rts
.not_spanish
		rts

********************************************************************************

WINDOW_WIDTH	set	328
WINDOW_HEIGHT	set	150
language_newwindow
		dc.w	320-WINDOW_WIDTH/2,100-WINDOW_HEIGHT/2
					;left edge, top edge
		dc.w	WINDOW_WIDTH+5,WINDOW_HEIGHT+11
					;width, height
		dc.b	0		;detail pen
		dc.b	1		;block pen
		dc.l	IDCMP_GADGETUP|IDCMP_GADGETDOWN
					;IDCMP
		dc.l	WFLG_NW_EXTENDED|WFLG_DRAGBAR|WFLG_DEPTHGADGET|WFLG_SMART_REFRESH|WFLG_GIMMEZEROZERO|WFLG_ACTIVATE
					;flags
		dc.l	0		;gadgets
		dc.l	0		;checkmark
		dc.l	parameters+code_filename
					;title
		dc.l	0		;screen
		dc.l	0		;bitmap
		dc.w	0,0		;min width, height
		dc.w	0,0		;max width, height
		dc.w	WBENCHSCREEN	;screen type
		dc.l	language_windowtags
					;pointer to tags

language_windowtags
		dc.l	WA_InnerWidth,WINDOW_WIDTH
		dc.l	WA_InnerHeight,WINDOW_HEIGHT
		dc.l	WA_AutoAdjust,0
		dc.l	WA_NewLookMenus,0
		dc.l	TAG_DONE,0


language_gadget_1
		dc.l	language_gadget_2
					;next gadget
		dc.w	172,116		;left edge, top edge
		dc.w	121,18		;width, height
		dc.w	GFLG_GADGHIMAGE|GFLG_GADGIMAGE	;flags
		dc.w    GACT_RELVERIFY	;activation
		dc.w	GTYP_BOOLGADGET	;type
		dc.l	contsel_image	;render
		dc.l	contunsel_image	;select render
		dc.l	0		;text
		dc.l	0		;mutual exclude (obsolete)
		dc.l	0		;special info
		dc.w	1		;id
		dc.l	0		;user data

language_gadget_2
		dc.l	language_gadget_3
					;next gadget
		dc.w	187,25		;left edge, top edge
		dc.w	17,9		;width, height
		dc.w	GFLG_GADGHIMAGE|GFLG_GADGIMAGE;|GFLG_DISABLED
					;flags
		dc.w    GACT_IMMEDIATE|GACT_TOGGLESELECT
					;activation
		dc.w	GTYP_BOOLGADGET	;type
		dc.l	radunsel_image	;render
		dc.l	radsel_image	;selected render
		dc.l	0		;text
		dc.l	0		;mutual exclude (obsolete)
		dc.l	0		;special info
		dc.w	2		;id
		dc.l	0		;user data

language_gadget_3
		dc.l	language_gadget_4
					;next gadget
		dc.w	187,42		;left edge, top edge
		dc.w	17,9		;width, height
		dc.w	GFLG_GADGHIMAGE|GFLG_GADGIMAGE;|GFLG_DISABLED
					;flags
		dc.w    GACT_IMMEDIATE|GACT_TOGGLESELECT
					;activation
		dc.w	GTYP_BOOLGADGET	;type
		dc.l	radunsel_image	;render
		dc.l	radsel_image	;selected render
		dc.l	0		;text
		dc.l	0		;mutual exclude (obsolete)
		dc.l	0		;special info
		dc.w	3		;id
		dc.l	0		;user data

language_gadget_4
		dc.l	language_gadget_5
					;next gadget
		dc.w	187,59		;left edge, top edge
		dc.w	17,9		;width, height
		dc.w	GFLG_GADGHIMAGE|GFLG_GADGIMAGE;|GFLG_DISABLED
					;flags
		dc.w    GACT_IMMEDIATE|GACT_TOGGLESELECT
					;activation
		dc.w	GTYP_BOOLGADGET	;type
		dc.l	radunsel_image	;render
		dc.l	radsel_image	;selected render
		dc.l	0		;text
		dc.l	0		;mutual exclude (obsolete)
		dc.l	0		;special info
		dc.w	4		;id
		dc.l	0		;user data

language_gadget_5
		dc.l	language_gadget_6
					;next gadget
		dc.w	187,76		;left edge, top edge
		dc.w	17,9		;width, height
		dc.w	GFLG_GADGHIMAGE|GFLG_GADGIMAGE;|GFLG_DISABLED
					;flags
		dc.w    GACT_IMMEDIATE|GACT_TOGGLESELECT
					;activation
		dc.w	GTYP_BOOLGADGET	;type
		dc.l	radunsel_image	;render
		dc.l	radsel_image	;selected render
		dc.l	0		;text
		dc.l	0		;mutual exclude (obsolete)
		dc.l	0		;special info
		dc.w	5		;id
		dc.l	0		;user data

language_gadget_6
		dc.l	0		;next gadget
		dc.w	187,93		;left edge, top edge
		dc.w	17,9		;width, height
		dc.w	GFLG_GADGHIMAGE|GFLG_GADGIMAGE;|GFLG_DISABLED
					;flags
		dc.w    GACT_IMMEDIATE|GACT_TOGGLESELECT
					;activation
		dc.w	GTYP_BOOLGADGET	;type
		dc.l	radunsel_image	;render
		dc.l	radsel_image	;selected render
		dc.l	0		;text
		dc.l	0		;mutual exclude (obsolete)
		dc.l	0		;special info
		dc.w	6		;id
		dc.l	0		;user data

languages_image
		dc.w	0,0		;x,y
		dc.w	336,150		;width, height
		dc.w	2		;depth
		dc.l	gd_languages_image		;RELOCATE MANUALLY !!!
					;image
		dc.b	%11		;plane pick
		dc.b	0		;plane on/off
		dc.l	0		;next image

contsel_image
		dc.w	0,0		;x,y
		dc.w	128,18		;width, height
		dc.w	2		;depth
		dc.l	gd_contsel_image		;RELOCATE MANUALLY !!!
					;image
		dc.b	%11		;plane pick
		dc.b	0		;plane on/off
		dc.l	0		;next image

contunsel_image
		dc.w	0,0		;x,y
		dc.w	128,18		;width, height
		dc.w	2		;depth
		dc.l	gd_contunsel_image		;RELOCATE MANUALLY !!!
					;image
		dc.b	%11		;plane pick
		dc.b	0		;plane on/off
		dc.l	0		;next image

radsel_image
		dc.w	-15,0		;x,y
		dc.w	32,9		;width, height
		dc.w	2		;depth
		dc.l	.image		;image
		dc.b	%11		;plane pick
		dc.b	0		;plane on/off
		dc.l	0		;next image

.image		dc.l	%00000000000000000111111111111000
		dc.l	%00000000000000001100000000000000
		dc.l	%00000000000000011000111111100000
		dc.l	%00000000000000011001111111110000
		dc.l	%00000000000000011001111111110000
		dc.l	%00000000000000011001111111110000
		dc.l	%00000000000000011000111111100000
		dc.l	%00000000000000001100000000000000
		dc.l	%00000000000000000100000000000000
		dc.l	%00000000000000000000000000000100
		dc.l	%00000000000000000000000000000110
		dc.l	%00000000000000000000111111100011
		dc.l	%00000000000000000001111111110011
		dc.l	%00000000000000000001111111110011
		dc.l	%00000000000000000001111111110011
		dc.l	%00000000000000000000111111100011
		dc.l	%00000000000000000000000000000110
		dc.l	%00000000000000000011111111111100

radunsel_image
		dc.w	-15,0		;x,y
		dc.w	32,9		;width, height
		dc.w	2		;depth
		dc.l	.image		;image
		dc.b	%11		;plane pick
		dc.b	0		;plane on/off
		dc.l	0		;next image

.image		dc.l	%00000000000000000000000000000100
		dc.l	%00000000000000000000000000000110
		dc.l	%00000000000000000000000000000011
		dc.l	%00000000000000000000000000000011
		dc.l	%00000000000000000000000000000011
		dc.l	%00000000000000000000000000000011
		dc.l	%00000000000000000000000000000011
		dc.l	%00000000000000000000000000000110
		dc.l	%00000000000000000011111111111100
		dc.l	%00000000000000000111111111111000
		dc.l	%00000000000000001100000000000000
		dc.l	%00000000000000011000000000000000
		dc.l	%00000000000000011000000000000000
		dc.l	%00000000000000011000000000000000
		dc.l	%00000000000000011000000000000000
		dc.l	%00000000000000011000000000000000
		dc.l	%00000000000000001100000000000000
		dc.l	%00000000000000000100000000000000

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

load_graphics_data
		movem.l	d1-d7/a0-a6,-(sp)

		tst.l	graphics_address(a5)
		bne	.end

		move.l	#gd_SIZEOF,d0
		move.l	#MEMF_CHIP!MEMF_PUBLIC,d1
		move.l	_SysBase,a6
		JSRLIB	AllocMem
		move.l	d0,graphics_address(a5)
		bne.s	.skip_mem
		moveq.l	#15,d0			;error number 15
		bra	.error
.skip_mem
		lea	data_filename(a5),a1
		lea	code_fib(a5),a2
		jsr	_STFileInfo
		tst.l	d0
		bne.s	.error

		lea	data_filename(a5),a0
		move.l	graphics_address(a5),a1
		move.l	fib_Size+code_fib(a5),d3
		jsr	_STLoadFile
		tst.l	d0
		bne.s	.error

		move.l	graphics_address(a5),a0
		move.l	a0,a1
		jsr	_STUnPack

		move.l	graphics_address(a5),d0

		add.l	d0,languages_image+ig_ImageData
		add.l	d0,contsel_image+ig_ImageData
		add.l	d0,contunsel_image+ig_ImageData
		add.l	d0,killsys_image+ig_ImageData
		add.l	d0,posunsel_image+ig_ImageData
		add.l	d0,possel_image+ig_ImageData
		add.l	d0,negunsel_image+ig_ImageData
		add.l	d0,negsel_image+ig_ImageData
		add.l	d0,running_image+ig_ImageData

.end		moveq.l	#0,d0
.error
		movem.l	(sp)+,d1-d7/a0-a6
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

_STWarnKillsys
		movem.l	d1-d7/a0-a6,-(sp)

		jsr	load_graphics_data
		tst.l	d0
		bne	.end

		lea	warning_newwindow,a0	;open window
		move.l	intuition_base(a5),a6
		JSRLIB	OpenWindow

		move.l	d0,window_struct(a5)
		bne.s	.opened_window
		move.l	#45,d0			;error number 45
                bra	.end
.opened_window
		move.l	window_struct(a5),a0
		move.l	#-1,a1
		lea	screen_title,a2
		JSRLIB	SetWindowTitles

		DRAW_IMAGE window_struct(a5),#0,#0,killsys_image

.loop		move.l	window_struct(a5),a0	;wait for next message
		bsr	get_message

		cmpi.w	#2,d0			;abort?
		beq.s	.abort			;yes, then branch

		cmpi.w	#1,d0			;continue?
		bne.s	.loop			;no, then branch

.continue	move.l	window_struct(a5),a0	;close window
		move.l	intuition_base(a5),a6
		JSRLIB	CloseWindow
		clr.l	window_struct(a5)
		moveq.l	#0,d0			;no error
		bra.s	.end

.abort		move.l	window_struct(a5),a0	;close window
		move.l	intuition_base(a5),a6
		JSRLIB	CloseWindow
		clr.l	window_struct(a5)
		moveq.l	#-1,d0			;continue

.end		movem.l	(sp)+,d1-d7/a0-a6
		rts

********************************************************************************
;INPUT:		a0.l=address of window structure
;OUTPUT:	d0.w=gadget (0=not a gadget up/down message)
;CHANGES:       a6

get_message
		movem.l	a0-a1/d1,-(sp)

.wait		move.l	wd_UserPort(a0),a0
		moveq.l	#0,d1
		move.b	MP_SIGBIT(a0),d1
		moveq.l	#0,d0
		bset	d1,d0

		move.l	a0,-(sp)		;wait for next message
		move.l	4,a6
		JSRLIB	Wait
		move.l	(sp)+,a0

		move.l	a0,-(sp)		;get the message
		move.l	4,a6
		JSRLIB	GetMsg
		move.l	(sp)+,a0

		tst.l	d0
		beq.s   .wait

		move.l	d0,a0
		moveq.l	#0,d0

		move.l	im_Class(a0),d1
		and.l	#IDCMP_GADGETUP|IDCMP_GADGETDOWN,d1
		beq.s	.not_gadget

		move.l	im_IAddress(a0),a1
		move.w	gg_GadgetID(a1),d0
.not_gadget
		bsr	reply_message

		movem.l	(sp)+,a0-a1/d1
		rts

********************************************************************************
;INPUT:		a0.l=address of message structure
;OUTPUT:	none
;CHANGES:       a6

reply_message
		movem.l	a0-a1/d0-d1,-(sp)

		move.l	a0,a1

		move.l	4,a6			;reply to the message
		JSRLIB	ReplyMsg

		movem.l	(sp)+,a0-a1/d0-d1
		rts

********************************************************************************

WINDOW_WIDTH	set	418
WINDOW_HEIGHT	set	150
warning_newwindow
		dc.w	320-WINDOW_WIDTH/2,100-WINDOW_HEIGHT/2
					;left edge, top edge
		dc.w	WINDOW_WIDTH+5,WINDOW_HEIGHT+11
					;width, height
		dc.b	0		;detail pen
		dc.b	1		;block pen
		dc.l	IDCMP_GADGETUP
					;IDCMP
		dc.l	WFLG_NW_EXTENDED|WFLG_DRAGBAR|WFLG_DEPTHGADGET|WFLG_SMART_REFRESH|WFLG_GIMMEZEROZERO|WFLG_ACTIVATE
					;flags
		dc.l	warning_gadget_1
					;gadgets
		dc.l	0		;checkmark
		dc.l	parameters+code_filename
					;title
		dc.l	0		;screen
		dc.l	0		;bitmap
		dc.w	0,0		;min width, height
		dc.w	0,0		;max width, height
		dc.w	WBENCHSCREEN	;screen type
		dc.l	warning_windowtags
					;pointer to tags

warning_windowtags
		dc.l	WA_InnerWidth,WINDOW_WIDTH
		dc.l	WA_InnerHeight,WINDOW_HEIGHT
		dc.l	WA_AutoAdjust,0
		dc.l	WA_NewLookMenus,0
		dc.l	TAG_DONE,0


warning_gadget_1
		dc.l	warning_gadget_2;next gadget
		dc.w	35,113		;left edge, top edge
		dc.w	121,18		;width, height
		dc.w	GFLG_GADGHIMAGE|GFLG_GADGIMAGE	;flags
		dc.w    GACT_RELVERIFY	;activation
		dc.w	GTYP_BOOLGADGET	;type
		dc.l	posunsel_image	;render
		dc.l	possel_image	;select render
		dc.l	0		;text
		dc.l	0		;mutual exclude (obsolete)
		dc.l	0		;special info
		dc.w	1		;id
		dc.l	0		;user data

warning_gadget_2
		dc.l	0		;next gadget
		dc.w	172,113		;left edge, top edge
		dc.w	121,18		;width, height
		dc.w	GFLG_GADGHIMAGE|GFLG_GADGIMAGE	;flags
		dc.w    GACT_RELVERIFY	;activation
		dc.w	GTYP_BOOLGADGET	;type
		dc.l	negunsel_image	;render
		dc.l	negsel_image	;select render
		dc.l	0		;text
		dc.l	0		;mutual exclude (obsolete)
		dc.l	0		;special info
		dc.w	2		;id
		dc.l	0		;user data

killsys_image
		dc.w	0,0		;x,y
		dc.w	432,150		;width, height
		dc.w	2		;depth
		dc.l	gd_killsys_image		;RELOCATE MANUALLY !!!
					;image
		dc.b	%11		;plane pick
		dc.b	0		;plane on/off
		dc.l	0		;next image

posunsel_image
		dc.w	0,0		;x,y
		dc.w	128,18		;width, height
		dc.w	2		;depth
		dc.l	gd_posunsel_image		;RELOCATE MANUALLY !!!
					;image
		dc.b	%11		;plane pick
		dc.b	0		;plane on/off
		dc.l	0		;next image

possel_image
		dc.w	0,0		;x,y
		dc.w	128,18		;width, height
		dc.w	2		;depth
		dc.l	gd_possel_image			;RELOCATE MANUALLY !!!
					;image
		dc.b	%11		;plane pick
		dc.b	0		;plane on/off
		dc.l	0		;next image

negunsel_image
		dc.w	0,0		;x,y
		dc.w	128,18		;width, height
		dc.w	2		;depth
		dc.l	gd_negunsel_image		;RELOCATE MANUALLY !!!
					;image
		dc.b	%11		;plane pick
		dc.b	0		;plane on/off
		dc.l	0		;next image

negsel_image
		dc.w	0,0		;x,y
		dc.w	128,18		;width, height
		dc.w	2		;depth
		dc.l	gd_negsel_image			;RELOCATE MANUALLY !!!
					;image
		dc.b	%11		;plane pick
		dc.b	0		;plane on/off
		dc.l	0		;next image

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

_STOpenRetAppWin
		movem.l	d1-d7/a0-a6,-(sp)

		jsr	load_graphics_data
		tst.l	d0
		bne	.end

		lea	running_newwindow,a0	;open window
		move.l	intuition_base(a5),a6
		JSRLIB	OpenWindow

		move.l	d0,window_struct(a5)
		bne.s	.opened_window
		move.l	#64,d0			;error number 64
                bra	.end
.opened_window
		move.l	window_struct(a5),a0
		move.l	#-1,a1
		lea	screen_title,a2
		move.l	intuition_base(a5),a6
		JSRLIB	SetWindowTitles

		DRAW_IMAGE window_struct(a5),#0,#0,running_image

		moveq.l	#0,d0			;no error
.end		movem.l	(sp)+,d1-d7/a0-a6
		rts

_STCloseRetAppWin
		movem.l	d1-d7/a0-a6,-(sp)

		move.l	window_struct(a5),a0	;close window
		cmpa.l	#0,a0
		beq.s	.no_window
		move.l	intuition_base(a5),a6
		JSRLIB	CloseWindow
		clr.l	window_struct(a5)

.no_window	moveq.l	#0,d0			;no error
		movem.l	(sp)+,d1-d7/a0-a6
		rts

********************************************************************************

RETAPPWIN_WINDOW_WIDTH	set     180
RETAPPWIN_WINDOW_HEIGHT	set     74
running_newwindow
		dc.w	320-RETAPPWIN_WINDOW_WIDTH/2
		dc.w	100-RETAPPWIN_WINDOW_HEIGHT/2
					;left edge, top edge
		dc.w	RETAPPWIN_WINDOW_WIDTH+5
		dc.w	RETAPPWIN_WINDOW_HEIGHT+11
					;width, height
		dc.b	0		;detail pen
		dc.b	1		;block pen
		dc.l	IDCMP_GADGETUP	;IDCMP
		dc.l	WFLG_NW_EXTENDED|WFLG_DRAGBAR|WFLG_DEPTHGADGET|WFLG_SMART_REFRESH|WFLG_GIMMEZEROZERO|WFLG_ACTIVATE
					;flags
		dc.l	running_gadget_1
					;gadgets
		dc.l	0		;checkmark
		dc.l	parameters+code_filename
					;title
		dc.l	0		;screen
		dc.l	0		;bitmap
		dc.w	0,0		;min width, height
		dc.w	0,0		;max width, height
		dc.w	WBENCHSCREEN	;screen type
		dc.l	running_windowtags
					;pointer to tags

running_windowtags
		dc.l	WA_InnerWidth,RETAPPWIN_WINDOW_WIDTH
		dc.l	WA_InnerHeight,RETAPPWIN_WINDOW_HEIGHT
		dc.l	WA_AutoAdjust,0
		dc.l	WA_NewLookMenus,0
		dc.l	TAG_DONE,0


running_gadget_1
		dc.l	0		;next gadget
		dc.w	31,38		;left edge, top edge
		dc.w	121,18		;width, height
		dc.w	GFLG_GADGHIMAGE|GFLG_GADGIMAGE	;flags
		dc.w    GACT_RELVERIFY	;activation
		dc.w	GTYP_BOOLGADGET	;type
		dc.l	posunsel_image	;render
		dc.l	possel_image	;select render
		dc.l	0		;text
		dc.l	0		;mutual exclude (obsolete)
		dc.l	0		;special info
		dc.w	1		;id
		dc.l	0		;user data

running_image
		dc.w	0,0		;x,y
		dc.w	192,74		;width, height
		dc.w	2		;depth
		dc.l	gd_running_image	;RELOCATE MANUALLY !!!
					;image
		dc.b	%11		;plane pick
		dc.b	0		;plane on/off
		dc.l	0		;next image

		even
