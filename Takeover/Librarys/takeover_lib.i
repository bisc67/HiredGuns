********************************************************************************
*
*	takeover_lib.i
*	Release 1.0
*	Revision 33.00
*	Date 8/8/92
*
*	takeover.library function offsets
*
*	(C) Copyright 1992 Scott Johnston
*	All Rights Reserved Worldwide
*
********************************************************************************

_TKStartUp		equ	-30
_TKShutDown		equ	-36
_TKWrite		equ	-42
_TKWriteLn		equ	-48

********************************************************************************

CALLTAKEOVER	MACRO
		move.l	_TakeoverBase,a6
		jsr	_TK\1(a6)
		ENDM

TAKEOVERNAME	MACRO
		dc.b	"takeover.library",0
		ENDM
