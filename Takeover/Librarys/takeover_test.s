;script assemble
;devpac3-2.0:devpac/genam >ram:errors.txt ram:test.s
;script after
;copy sys:system/format.info ram:takeover_test.info
;copy ram:test ram:takeover_test
;copy ram:test source:takeover/takeover_test
;script end

********************************************************************************
*
*       takeover_test.s
*	Release 1.0
*	Revision 33.00
*	Date 8/8/92
*
*	Takeover.library test source code
*
*	(C) Copyright 1992 Scott Johnston
*	All Rights Reserved Worldwide
*
********************************************************************************

		opt	o+,ow-,d+,LINE		;development options
;		opt	o+,ow-			;distribution options

		output	ram:test

INTUI_V36_NAMES_ONLY	equ	0

		incdir	include_i:

		include	"source:takeover/takeover.i"
		include	"source:takeover/takeoverbase.i"
		include	"source:takeover/takeover_lib.i"

		include	exec/types.i
		include	exec/exec_lib.i
		include	graphics/gfxbase.i

****************************************************************************

		STRUCTURE Variables,0
			APTR vr_TakeoverLibBase
			APTR vr_TakeoverStruct
			LABEL vr_SIZE

****************************************************************************

		section	takeover_test,code

start		lea	variables_mem,a4
		move.l  d0,d1			;remember d0

		jsr	OpenLibraries
		tst.l	d0
		bne.s	.serious_error

		move.l  d1,d0			;number of CLI args
		lea	wbench_window,a1        ;wbench output window
		LINKLIB	_TKStartUp,vr_TakeoverLibBase(a4)
		tst.l	d0
		bne.s	.serious_error
		move.l	a5,vr_TakeoverStruct(a4)

		move.l	tk_GraphicsLibBase(a5),a0
		move.l	gb_LOFlist(a0),a0
		illegal

		lea	wbench_window,a0
		LINKLIB	_TKWriteLn,vr_TakeoverLibBase(a4)

		LINKLIB	_TKShutDown,vr_TakeoverLibBase(a4)

		jsr	CloseLibraries

		moveq.l	#0,d0			;no error
		rts

.error		move.l	vr_TakeoverStruct(a4),a5
		LINKLIB	_TKShutDown,vr_TakeoverLibBase(a4)

.serious_error	jsr	CloseLibraries
		rts

********************************************************************************
* FUNCTION:	Open libraries.
********************************************************************************
* INPUT:	a4.l=pointer to variables structure
* OUTPUT:	d0.l=error flag (0=no error)
* CHANGES:	none
OpenLibraries
		movem.l	d1/a0-a1,-(sp)

		lea	takeover_name,a1
		moveq.l	#TAKEOVER_VERSION,d0
		LINKLIB _LVOOpenLibrary,4	;open takeover library
		move.l	d0,vr_TakeoverLibBase(a4)
		bne.s	.no_error		;branch if no error
		move.l	#-1,d0
		bra.s	.error
.no_error

		moveq.l	#0,d0			;no error
.error		movem.l	(sp)+,d1/a0-a1
		rts


********************************************************************************
* FUNCTION:	Close libraries.
********************************************************************************
* INPUT:	a4.l=pointer to variables structure
* OUTPUT:	none
* CHANGES:	none
CloseLibraries
		movem.l	d0-d1/a0-a1,-(sp)

		move.l	vr_TakeoverLibBase(a4),a1
		cmpa.l	#0,a1
		beq.s	.takeover_lib_not_opened
		LINKLIB _LVOCloseLibrary,4	;close takeover library
		clr.l	vr_TakeoverLibBase(a4)
.takeover_lib_not_opened

		movem.l	(sp)+,d0-d1/a0-a1
		rts

****************************************************************************

		section	miscdata,data

variables_mem	ds.b	vr_SIZE
takeover_name	TAKEOVERNAME
wbench_window	dc.b	"con:10/10/620/100/Takeover Test Output",0

cli_keywords	dc.b	"?",0
		even
		dc.l	0
		dc.b	"code",0
		even
		dc.l	0
		dc.b	"info",0
		even
		dc.l	0
		dc.b	"unpack",0
		even
		dc.l	0
		dc.b	"relocate",0
		even
		dc.l	0
		dc.b	"quiet",0
		even
		dc.l	0
		dc.b	-1			;end of list

		even

		end
