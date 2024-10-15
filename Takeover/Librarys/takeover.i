	IFND	TAKEOVER_I
TAKEOVER_I	SET	1

********************************************************************************
*
*       takeover.i
*	Release 1.0
*	Revision 33.00
*	Date 8/8/92
*
*	Interface definitions for takeover applications
*
*	(C) Copyright 1992 Scott Johnston
*	All Rights Reserved Worldwide
*
********************************************************************************

	IFND EXEC_TYPES_I
		include "exec/types.i"
	ENDC

TAKEOVER_VERSION	equ	1

********************************************************************************
* Takeover
********************************************************************************

	STRUCTURE takeover,0
		APTR tk_GraphicsLibBase		;pointers to library bases
		APTR tk_IntuitionLibBase
		APTR tk_DosLibBase
		APTR tk_CommandLineString	;valid if started from CLI
		UWORD tk_CommandLineArgs	;0=started from workbench
		APTR tk_WorkbenchMessage	;valid if started from workbench
		APTR tk_WBenchWindow		;workbench output window
		APTR tk_Stdout			;handle to output console
		LABEL tk_SIZE

********************************************************************************
* Error codes
********************************************************************************

;Code	Meaning
;-----	------------------------------------------------------------------------
; <0	 User error
; 0	 "No error"
; 1	 "_TKStartup takeover structure memory allocation failed"
; 2	 "_TKStartup graphics.library open failed"
; 3	 "_TKStartup intuition.library open failed"
; 4	 "_TKStartup dos.library open failed"
; 5	 "_TKStartup Output() failed"
; 6	 "_TKStartup AppWindow Open() failed"
; 7	 "_TKWrite failed"

********************************************************************************

	ENDC
