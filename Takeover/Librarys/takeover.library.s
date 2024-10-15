;script assemble
;devpac3-2.0:devpac/genam >ram:errors.txt ram:test.s
;script after
;copy ram:test "libs:takeover.library"
;copy ram:test "source:takeover/takeover.library"
;script end

********************************************************************************
*
*	takeover.library.s
*	Release 1.0
*	Revision 33.00
*	Date 8/8/92
*
*	Romtag takeover.library source code
*
*	(C) Copyright 1992 by Scott Johnston
*	All Rights Reserved Worldwide
*
********************************************************************************

;		opt	o+,ow-,d+,LINE		;development options
		opt	o+,ow-			;distribution options

		output	ram:test

INTUI_V36_NAMES_ONLY	equ	0

		incdir	include_i:

		include	"source:takeover/takeover.i"
		include	"source:takeover/takeoverbase.i"

		include	exec/types.i
		include	exec/libraries.i
		include	exec/resident.i
		include	exec/memory.i
		include	exec/exec_lib.i

		include	workbench/startup.i

		include	graphics/graphics_lib.i
		include	intuition/intuition_lib.i

		include	dos/dos_lib.i
		include	dos/dosextens.i

********************************************************************************
;safely return if user tries to execute this file

start		moveq.l	#-1,d0
		rts

********************************************************************************
;romtag structure

romtag		dc.w	$4afc			;romtag identifier
		dc.l	romtag			;pointer to this structure
		dc.l	lib_end			;pointer to end of code
		dc.b    RTF_AUTOINIT		;flags
		dc.b	TAKEOVER_VERSION	;version number
		dc.b	NT_LIBRARY		;type of module
		dc.b	0                       ;initialisation priority
		dc.l	lib_name		;pointer to node name
		dc.l	lib_id			;pointer to id string
		dc.l	lib_autoinit		;pointer to autoinit tables

lib_name	dc.b	"takeover.library",0
		even

lib_id		dc.b	"takeover.library 33.00 (8.8.92)",$d,$a
		even

lib_autoinit	dc.l	TAKEOVERBASE_SIZE	;data size
		dc.l	lib_vectors		;pointer to jump table
		dc.l	0			;pointer to initStruct()
		dc.l	0			;pointer to initFunction()

lib_vectors	dc.l	open			;called by OpenLibrary()
		dc.l	close			;called by CloseLibrary()
		dc.l	expunge			;removal from system
		dc.l	reserved		;for future use

		dc.l	startup			;user accessable functions
		dc.l	shutdown
		dc.l	write
		dc.l	writeln
;		dc.l	parseargs
;		dc.l	allocatememory
;		dc.l	freememory
;		dc.l	allocateresources
;		dc.l	freeresources
;		dc.l	installinterrupts
;		dc.l	freeinterrupts
;		dc.l	restorecopper
;		dc.l	requestfile
;		dc.l	request
;		dc.l	alert
;		dc.l	loadfile
;		dc.l	savefile
;		dc.l	killsystem
		dc.l	-1			;end of table

********************************************************************************
* FUNCTION:	Called when OpenLibrary() used.
********************************************************************************
* INPUT:	a6.l=pointer to takeoverbase
* OUTPUT:	d0.l=pointer to takeoverbase (0=error)
* CHANGES:	(assume d0-d1,a0-a1)
open
		addi.w	#1,LIB_OPENCNT(a6)	;increment open count

		move.l	a6,d0			;return takeoverbase
		rts

********************************************************************************
* FUNCTION:	Called when CloseLibrary() used.
********************************************************************************
* INPUT:	a6.l=pointer to takeoverbase
* OUTPUT:	d0.l=error flag (-1=error)
* CHANGES:	(assume d0-d1,a0-a1)
close
		subi.w	#1,LIB_OPENCNT(a6)	;decrement open count

		moveq.l	#0,d0			;no error
		rts

********************************************************************************
* FUNCTION:	Called to prepare for removal from system.
********************************************************************************
* INPUT:	a6.l=pointer to takeoverbase
* OUTPUT:	d0.l=error flag (-1=error)
* CHANGES:	(assume d0-d1,a0-a1)
expunge
		moveq.l	#0,d0			;no error
		rts

********************************************************************************
* FUNCTION:	Reserved for future use.
********************************************************************************
* INPUT:	a6.l=pointer to takeoverbase
* OUTPUT:	d0.l=error flag (-1=error)
* CHANGES:	(assume d0-d1,a0-a1)
reserved
		moveq.l	#0,d0			;no error
		rts

********************************************************************************
* FUNCTION:	Allocate memory for takeover structure and initialise it.
*		CLI & Workbench startup code.
*		Open libraries.
*		Open stdout (nil: if started from workbench).
********************************************************************************
* INPUT:	a6.l=pointer to takeoverbase
*		a0.l=pointer to command line string
*		d0.w=number of command line arguments
*		a1.l=pointer to workbench output window definition (0=no window)
* OUTPUT:	a5.l=pointer to takeover structure
*		d0.l=error code (see takeover.i)
* CHANGES:	(assume d0-d1,a0-a1)

startup
		movem.l	d0/a0-a1,-(sp)
		move.l	#tk_SIZE,d0
		move.l	#MEMF_PUBLIC|MEMF_CLEAR,d1
		LINKLIB _LVOAllocMem,4		;allocate space for takeover
		move.l	d0,a5			; structure
		movem.l	(sp)+,d0/a0-a1
		cmpa.l	#0,a5			;allocated ok?
		bne.s	.allocated_ok		;yes, then branch
		move.l	#1,d0
		bra	.error
.allocated_ok

		move.l	a0,tk_CommandLineString(a5)
		move.w	d0,tk_CommandLineArgs(a5)
		move.l	a1,tk_WBenchWindow(a5)

		suba.l	a1,a1
		LINKLIB	_LVOFindTask,4		;find this tasks structure
		move.l	d0,a0
		tst.l	pr_CLI(a0)
		bne.s	.skip_wbench_startup

		clr.w	tk_CommandLineArgs(a5)	;this field will be used to
						; test if the task was started
						; from the CLI or Workbench

.wbench_startup	lea	pr_MsgPort(a0),a0	;pointer to message port
		LINKLIB	_LVOWaitPort,4		;wait for message from workbench
		LINKLIB	_LVOGetMsg,4		;get message from workbench
		move.l	d0,tk_WorkbenchMessage(a5)
.skip_wbench_startup

		lea	graphics_name,a1
		moveq.l	#LIBRARY_MINIMUM,d0
		LINKLIB _LVOOpenLibrary,4	;open graphics library
		move.l	d0,tk_GraphicsLibBase(a5)
		bne.s	.graphics_lib_opened	;branch if no error
		move.l	#2,d0
		bra	.error
.graphics_lib_opened

		lea	intuition_name,a1
		moveq.l	#LIBRARY_MINIMUM,d0
		LINKLIB _LVOOpenLibrary,4	;open intuition library
		move.l	d0,tk_IntuitionLibBase(a5)
		bne.s	.intuition_lib_opened	;branch if no error
		move.l	#3,d0
		bra.s	.error
.intuition_lib_opened

		lea	dos_name,a1
		moveq.l	#LIBRARY_MINIMUM,d0
		LINKLIB _LVOOpenLibrary,4	;open dos library
		move.l	d0,tk_DosLibBase(a5)
		bne.s	.dos_lib_opened		;branch if no error
		move.l	#4,d0
		bra.s	.error
.dos_lib_opened

		tst.w	tk_CommandLineArgs(a5)
		bne.s	.cli_stdout		;branch if started from CLI
.wbench_stdout	move.l	tk_WBenchWindow(a5),d1	;ouput window specified?
		bne.s	.not_nil		;yes, then branch
		move.l	#nil_name,d1		;redirect ouput to nil:
.not_nil	move.l	#MODE_NEWFILE,d2
		LINKLIB	_LVOOpen,tk_DosLibBase(a5)
		move.l	d0,tk_Stdout(a5)
		bne.s	.opened_stdout
		move.l	#6,d0
		bra.s	.error
.cli_stdout	LINKLIB	_LVOOutput,tk_DosLibBase(a5)
		move.l	d0,tk_Stdout(a5)
		bne.s	.opened_stdout
		move.l	#5,d0
		bra.s	.error
.opened_stdout

		moveq.l	#0,d0			;no error
.error		rts

********************************************************************************
* FUNCTION:	Close workbench output window.
*		Close libraries.
*		Workbench shutdown code (uses Forbid)
*		Free takeover structure.
* !!! Call this function just before ending your program !!!
********************************************************************************
* INPUT:	a6.l=pointer to takeoverbase
*		a5.l=pointer to takeover structure
* OUTPUT:	none
* CHANGES:	(assume d0-d1,a0-a1)
shutdown
		tst.w	tk_CommandLineArgs(a5)
		bne.s	.no_window		;branch if started from CLI
		move.l	tk_Stdout(a5),d1
		beq.s	.no_window
		LINKLIB	_LVOClose,tk_DosLibBase(a5)
		clr.l	tk_Stdout(a5)
.no_window

		move.l	tk_GraphicsLibBase(a5),a1
		cmpa.l	#0,a1
		beq.s	.graphics_lib_not_opened
		LINKLIB _LVOCloseLibrary,4	;close graphics library
		clr.l	tk_GraphicsLibBase(a5)
.graphics_lib_not_opened

		move.l	tk_IntuitionLibBase(a5),a1
		cmpa.l	#0,a1
		beq.s	.intuition_lib_not_opened
		LINKLIB _LVOCloseLibrary,4	;close intuition library
		clr.l	tk_IntuitionLibBase(a5)
.intuition_lib_not_opened

		move.l	tk_DosLibBase(a5),a1
		cmpa.l	#0,a1
		beq.s	.dos_lib_not_opened
		LINKLIB _LVOCloseLibrary,4	;close dos library
		clr.l	tk_DosLibBase(a5)
.dos_lib_not_opened

		tst.w	tk_CommandLineArgs(a5)
		bne.s	.skip_wbench_shutdown	;branch if started from CLI

		LINKLIB	_LVOForbid,4
		move.l	tk_WorkbenchMessage(a5),a1
		LINKLIB	_LVOReplyMsg,4
.skip_wbench_shutdown

		move.l	a6,-(sp)
		move.l	a5,a1
		move.l	#tk_SIZE,d0
		move.l	4.w,a6
		jsr	_LVOFreeMem(a6)		;deallocate space for takeover
		move.l	(sp)+,a6		; structure

		rts

********************************************************************************
* FUNCTION:	Writes string to stdout.
********************************************************************************
* INPUT:	a6.l=pointer to takeoverbase
*		a5.l=pointer to takeover structure
*		a0.l=pointer to zero terminated string
*		a1.l=pointer to arguments
* OUTPUT:       error code (see takeover.i)
* CHANGES:	(assume d0-d1,a0-a1)
write
		movem.l	d2-d3,-(sp)

		move.l	a0,d2

		moveq.l	#0,d3			;calculate length of string
.loop		tst.b	(a0)+
		beq.s	.end_string
		addq.l	#1,d3
		bra.s	.loop
.end_string
		move.l	tk_Stdout(a5),d1
		beq.s	.no_stdout
		LINKLIB	_LVOWrite,tk_DosLibBase(a5)
		tst.w	d0
		bpl.s	.write_ok
		moveq.l	#7,d0
		bra.s	.error
.write_ok
.no_stdout
		moveq.l	#0,d0			;no error
.error		movem.l	(sp)+,d2-d3
		rts

********************************************************************************
* FUNCTION:	Writes string to stdout (with CR).
********************************************************************************
* INPUT:	a6.l=pointer to takeoverbase
*		a5.l=pointer to takeover structure
*		a0.l=pointer to zero terminated string
*		a1.l=pointer to arguments
* OUTPUT:       error code (see takeover.i)
* CHANGES:	(assume d0-d1,a0-a1)
writeln
		move.l	a0,-(sp)
		bsr	write
		move.l	(sp)+,a0
		tst.l	d0
		bne.s	.error

		lea	cr,a0
		bsr	write
		tst.l	d0
		bne.s	.error

		moveq.l	#0,d0			;no error
.error		rts

********************************************************************************

graphics_name	GRAFNAME
intuition_name	INTNAME
dos_name	dc.b	"dos.library",0
nil_name	dc.b	"nil:",0
cr		dc.b	10,0
		even

lib_end		end
