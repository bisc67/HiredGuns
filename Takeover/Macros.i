********************************************************************************
*
*	Macros.i
*	Release 2.4
*	Date 3/4/93
*
*	Friendly system takeover
*	Macro definitions
*
*	Copyright © Scott Johnston 1991-93
*	All Rights Reserved Worldwide
*
********************************************************************************

	IFND	MACROS_I

MACROS_I	set	0

	IFND EXEC_TYPES_I
		include "exec/types.i"
	ENDC

	IFND DOS_DOSEXTENS_I
		include	dos/dosextens.i
        ENDC

********************************************************************************
* MISC EQUATES
********************************************************************************

;use these equates as parameters for the front_pen and back_pen field in the
;following macros

PEN_GREY	equ	0
PEN_BLACK	equ     1
PEN_WHITE	equ     2
PEN_BLUE	equ     3

********************************************************************************
* MISC MACROS
********************************************************************************

VERSION		MACRO
		dc.b	"SystemTakeover 2.5 (15.12.93)"
		ENDM

********************************************************************************
* MACRO :	WRITELN <"text">
* FUNCTION :	Outputs a string to the current output console
********************************************************************************

WRITELN		MACRO
		move.l	d2,-(sp)
		move.l	#.text\@,d2
		jsr	_STOutput
		tst.l	d0
		bne	.error
		bra.s	.cont\@
.text\@		dc.b	\1,0
		even
.cont\@		move.l	(sp)+,d2
		ENDM

WRITELN_IF_INFO	MACRO
		tst.b	arg_info(a5)
		beq.s	.cont2\@
		move.l	d2,-(sp)
		move.l	#.text\@,d2
		jsr	_STOutput
		tst.l	d0
		bne	.error
		bra.s	.cont\@
.text\@		dc.b	\1,0
		even
.cont\@		move.l	(sp)+,d2
.cont2\@
		ENDM

********************************************************************************
* MACRO :	WRITELN <"text">,<value>
* FUNCTION :	Outputs a string and a value to the current output console
********************************************************************************

WRITEINFO	MACRO
		movem.l	d2/a0,-(sp)

		move.l	\3,d0
		beq.s	.unknown\@
		lea	.value\@+4(pc),a0
		bsr	long_to_string
.unknown\@
		move.l	#.text\@,d2
		jsr	_STOutput
		movem.l	(sp)+,d2/a0

		tst.l	d0
		beq.s	.cont\@
		moveq.l	#17,d0				;error number 17
		bra	.error

.text\@		dc.b    \1
.value\@	dc.b	" = $",\2,0
		even
.cont\@
		ENDM

WRITEINFO_IF_INFO	MACRO
		tst.b	arg_info(a5)
		beq.s	.cont\@

		movem.l	d2/a0,-(sp)

		move.l	\3,d0
		beq.s	.unknown\@
		lea	.value\@+4(pc),a0
		bsr	long_to_string
.unknown\@
		move.l	#.text\@,d2
		jsr	_STOutput
		movem.l	(sp)+,d2/a0

		tst.l	d0
		beq.s	.cont\@
		moveq.l	#17,d0				;error number 17
		bra	.error

.text\@		dc.b    \1
.value\@	dc.b	" = $",\2,0
		even
.cont\@
		ENDM

WRITEZEROINFO_IF_INFO	MACRO
		tst.b	arg_info(a5)
		beq.s	.cont\@

		movem.l	d2/a0,-(sp)

		move.l	\3,d0
		lea	.value\@+4(pc),a0
		bsr	long_to_string

		move.l	#.text\@,d2
		jsr	_STOutput
		movem.l	(sp)+,d2/a0

		tst.l	d0
		beq.s	.cont\@
		moveq.l	#17,d0				;error number 17
		bra	.error

.text\@		dc.b    \1
.value\@	dc.b	" = $",\2,0
		even
.cont\@
		ENDM

********************************************************************************
* MACRO :	DEF_ITEXT <front_pen>,<back_pen>,<x>,<y>,<"text">,<next_flag>
* FUNCTION :	Defines an ituition text structure
********************************************************************************

DEF_ITEXT	MACRO
		dc.b	\1			;front pen
                dc.b	\2			;back pen
		dc.b	RP_JAM1			;draw mode
		dc.b	0			;pad
		dc.w	\3			;left edge
		dc.w	\4			;top edge
		dc.l	\6			;font
		dc.l    .message\@		;text
		IFEQ	\7
		dc.l	.next\@			;next itext
		ENDC
		IFNE	\7
		dc.l	0			;next itext
		ENDC
.message\@	dc.b	\5,0
		even
.next\@
                ENDM

;put MORE_ITEXT in the next_flag field if you are following this with another
;DEF_ITEXT macro

MORE_ITEXT	equ	0
END_ITEXT	equ	-1

********************************************************************************
* MACRO :	PRINT_ITEXT <window>,<x>,<y>,<itext>
* FUNCTION :	Draws an ituition text structure
********************************************************************************

PRINT_ITEXT	MACRO
		movem.l	a0-a1/a6/d0-d1,-(sp)
		move.l	\1,a0			;window structure
		move.l	wd_RPort(a0),a0
		lea	\4,a1			;itext
		move.l	\2,d0			;x
		move.l	\3,d1			;y
		move.l	intuition_base(a5),a6
		jsr	_LVOPrintIText(a6)
		movem.l	(sp)+,a0-a1/a6/d0-d1
		ENDM

********************************************************************************
* MACRO :	DEF_BORDER <x>,<y>,<front_pen>,<next_flag>
*		  DEF_BORDER_VERT <x>,<y>
*			.
*			.
*			.
*		  DEF_BORDER_VERT <x>,<y>
*		DEF_BORDER_END
* FUNCTION :	Defines an ituition border structure
********************************************************************************

DEF_BORDER	MACRO
border\@	dc.w	0			;x
		dc.w	0			;y
                dc.b	\1			;front pen
		dc.b	PEN_GREY		;back pen
		dc.b	RP_JAM2
		dc.b	(.border_end-.border_start)/4
		dc.l	.border_start
		IFEQ	\2
		dc.l	.border_end		;next itext
		ENDC
		IFNE	\2
		dc.l	0			;next itext
		ENDC
.border_start
		ENDM

DEF_BORDER_VERT	MACRO
		dc.w	\1			;x
		dc.w	\2			;y
		ENDM

DEF_BORDER_END	MACRO
.border_end
		ENDM

;put MORE_BORDER in the next_flag field if you are following this with another
;DEF_BORDER macro

MORE_BORDER	equ	0
END_BORDER	equ	-1

********************************************************************************
* MACRO :	DRAW_BORDER <window>,<x>,<y>,<border>
* FUNCTION :	Draws an ituition border structure
********************************************************************************

DRAW_BORDER	MACRO
		movem.l	a0-a1/a6/d0-d1,-(sp)
		move.l	\1,a0			;window structure
		move.l	wd_RPort(a0),a0
		lea	\4,a1			;border
		move.l	\2,d0			;x
		move.l	\3,d1			;y
		move.l	intuition_base(a5),a6
		jsr	_LVODrawBorder(a6)
		movem.l	(sp)+,a0-a1/a6/d0-d1
		ENDM

********************************************************************************
* MACRO :	DRAW_IMAGE <window>,<x>,<y>,<image>
* FUNCTION :	Draws an ituition image structure
********************************************************************************

DRAW_IMAGE	MACRO
		movem.l	a0-a1/a6/d0-d1,-(sp)
		move.l	\1,a0			;window structure
		move.l	wd_RPort(a0),a0
		lea	\4,a1			;image
		move.l	\2,d0			;x
		move.l	\3,d1			;y
		move.l	intuition_base(a5),a6
		JSRLIB	DrawImage
		movem.l	(sp)+,a0-a1/a6/d0-d1
		ENDM

********************************************************************************
* END OF Macros.i
********************************************************************************

	ENDC

