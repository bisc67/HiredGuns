********************************************************************************
*
*	Takeover.s
*	Release 2.5
*	Date 15/12/93
*
*	Friendly system takeover
*	Main source
*
*	Copyright © Scott Johnston 1991-93
*	All Rights Reserved Worldwide
*
********************************************************************************

		opt	o+,ow-,l+

		xref	_CreatePort	;amiga.lib functions
		xref	_CreateExtIO
		xref	_DeletePort
		xref	_DeleteExtIO

		xdef	_SysBase

INTUI_V36_NAMES_ONLY	equ	0

		incdir	include:

		include	graphics/view.i
		include	graphics/videocontrol.i
		include	exec/types.i
		include	exec/macros.i
		include	exec/interrupts.i
		include	exec/execbase.i
		include	exec/memory.i
		include	exec/nodes.i
		include	exec/ports.i
		include	hardware/intbits.i
		include	hardware/custom.i
		include	hardware/cia.i
		include	hardware/dmabits.i
		include	workbench/startup.i
		include	workbench/workbench.i
		include	graphics/gfx.i
		include	graphics/gfxbase.i
		include	graphics/displayinfo.i
		include	intuition/screens.i
		include	intuition/intuition.i
		include	intuition/intuitionbase.i
		include	resources/misc.i
		include	dos/dos.i
		include	dos/dosextens.i
		include	devices/trackdisk.i
		include	devices/audio.i
		include	utility/tagitem.i
		include	libraries/lowlevel.i

		include	3dgame:takeover/takeover.i
		include	3dgame:takeover/macros.i

		section	Takeover,code

********************************************************************************

		jmp	main_program

		include	screens.s
		include	windows.s
		include	interrupts&resources.s
		include	memory.s
		include jumpy.s

********************************************************************************
********************************************************************************
* FUNCTION:	Main program
********************************************************************************
* INPUT:        a0.l=address of CLI command line arguments
* 		d0.w=number of command line argumentsnone
* OUTPUT:	d0.l=error return code (0=no error)
* CHANGES:	assume all

main_program
		lea	parameters,a5
		jsr	_STInitialise

		jsr	_STOpenLibraries
		tst.l	d0
		bne	.error

		jsr	_STOpenStdio
		tst.l	d0
		bne	.error

;		move.l	#console_name,d1	;get con: handle
;		move.l  #MODE_NEWFILE,d2
;		move.l	dos_base(a5),a6
;		JSRLIB	Open
;		move.l	d0,console_handle(a5)
;		move.l	console_handle(a5),stdout_handle(a5)
;		move.l	console_handle(a5),stdin_handle(a5)

		jsr	_STParseArgs
		tst.l	d0
		bne	.error

		jsr	_STExecute
		tst.l	d0
		bne	.error

		jsr	_STOpenResources
		tst.l	d0
		bne	.error

		jsr	_STOpenDevices
		tst.l	d0
		bne	.error

		jsr	_STSystemConfig
		tst.l	d0
		bne	.error

		tst.b	arg_killsys(a5)
		beq.s	.os_friendly1
		jsr	_STWarnKillsys
		tst.l	d0
		bne	.error
.os_friendly1
		jsr	_STGetLanguage
		tst.l	d0
		bne.s	.error

		jsr	_STAllocateResources
		tst.l	d0
		bne.s	.error

		tst.b	arg_info(a5)
		beq.s	.no_info
		jsr	_STInfo
		tst.l	d0
		bne.s	.error
		bra.s	.exit
.no_info
		tst.b	arg_killsys(a5)
		beq.s	.os_friendly2
		jsr	_STHostileExecute	;!!! never returns if successful !!!
		tst.l	d0
		bne.s	.error
		bra.s	.exit
.os_friendly2
		jsr	_STFriendlyExecute
		tst.l	d0
		bne.s	.error
		bra.s	.exit

.error		jsr	_STOutputError
		jsr	_STCloseRetAppWin
		jsr	_STCloseScreen
		jsr	_STCloseConsole
		jsr	_STDeallocateResources
		jsr	_STCloseDevices
		jsr	_STCloseLibraries
		jsr	_STShutDown

		moveq.l	#0,d0
		rts

.exit		jsr	_STCloseRetAppWin
		jsr	_STCloseScreen
		jsr	_STCloseConsole
		jsr	_STDeallocateResources
		jsr	_STCloseDevices
		jsr	_STCloseLibraries
		jsr	_STShutDown

		moveq.l	#0,d0
		rts

****************************************************************************
****************************************************************************
****************************************************************************
;Warning!!!! This routine totally KILLS the operating system, it will never
;return unless there is an error during loading or the user aborts.
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

_STHostileExecute
		tst.l	temp_amount(a5)
		bne.s	.temp_chunk_ok
		move.l	#52,d0				;error number 52
		bra	.error
.temp_chunk_ok
		lea	code_filename(a5),a1
		lea	code_fib(a5),a2
		jsr	_STFileInfo
		tst.l	d0
		bne	.error

		move.l	temp_amount(a5),d0	;will code fit in temp mem?
		cmp.l	fib_Size+code_fib(a5),d0
		bge.s	.file_fits
		move.l	#48,d0				;error number 48
		bra	.error
.file_fits
		lea	code_filename(a5),a0
		move.l	temp_chunk_address(a5),a1
		move.l	fib_Size+code_fib(a5),d3
		jsr	_STLoadFile
		tst.l	d0
		bne	.error

		move.l	temp_chunk_address(a5),a0
		move.l	fib_Size+code_fib(a5),d0
		jsr	_STChecksum

		move.l	fib_Size+code_fib(a5),code_unpacked_size(a5)

		tst.b	arg_unpack(a5)
		beq.s	.no_unpack
		move.l	temp_chunk_address(a5),a0
		move.l	a0,a1
		jsr	_STUnPack
		move.l	d0,code_unpacked_size(a5)
		bne.s	.unpacked
		move.l	#22,d0
		bra.s	.error
.unpacked
		move.l	temp_amount(a5),d0	;overflow ?
		cmp.l	code_unpacked_size(a5),d0
		bge.s	.unpacked_fits
		move.l	#41,d0				;error number 41
		bra	.error
.unpacked_fits
.no_unpack
		jsr	_STKillSystem

;run code with these parameters
; d0.l    = hi word = -1 (flags system dead)
;         = lo word = language chosen
; d1-d3.l = runtime parameters
; d4.l	  = checksum failed flag
; d5.l    = lo word = processors
;         = hi word = config info
; d6.l    = size of ram disk (in bytes)
; a2.l    = base of extra chip memory (0=none available)
; a3.l    = base of extra other memory (0=none available)
; a4.l    = base of chip memory
; a5.l    = base of other memory
; a6.l    = base of ram disk

		move.l	#killsys_code_end-killsys_code_start,d0
		lea	killsys_code_start,a0
		move.l	#jumpy_address,a1
		jsr	_STCopyMem

		move.w	#-1,d0
		swap    d0
		clr.w	d0
		move.b	language(a5),d0
		move.l	param1(a5),d1
		move.l	param2(a5),d2
		move.l	param3(a5),d3
		move.b	checksum_failed(a5),d4
		move.w	config(a5),d5
		swap	d5
		move.w	processors(a5),d5
		move.l	ramdisk_amount(a5),d6
		move.l	ramdisk_mem_address(a5),a6
		move.l	exchip_mem_address(a5),a2
		move.l	exany_mem_address(a5),a3
		move.l	chip_mem_address(a5),a4
		move.l	any_mem_address(a5),a5

		move.l	#jumpy_address,a1
		jmp	(a1)

.no_error	moveq.l	#0,d0
.error		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

_STFriendlyExecute
		lea	code_filename(a5),a1
		lea	code_fib(a5),a2
		jsr	_STFileInfo
		tst.l	d0
		bne	.error

		move.l	any_amount(a5),d0		;will code fit in other mem?
		cmp.l	fib_Size+code_fib(a5),d0
		bge.s	.file_fits
		move.l	#48,d0				;error number 48
		bra	.error
.file_fits
		lea	code_filename(a5),a0
		move.l	any_chunk_address(a5),a1
		move.l	fib_Size+code_fib(a5),d3
		jsr	_STLoadFile
		tst.l	d0
		bne	.error

		move.l	any_chunk_address(a5),a0
		move.l	fib_Size+code_fib(a5),d0
		jsr	_STChecksum

		move.l	fib_Size+code_fib(a5),code_unpacked_size(a5)

		tst.b	arg_unpack(a5)
		beq.s	.no_unpack
		move.l	any_chunk_address(a5),a0
		move.l	a0,a1
		jsr	_STUnPack
		move.l	d0,code_unpacked_size(a5)
		bne.s	.unpacked
		move.l	#22,d0
		bra	.error
.unpacked
		move.l	any_amount(a5),d0		;overflow ?
		cmp.l	code_unpacked_size(a5),d0
		bge.s	.unpacked_fits
		move.l	#50,d0				;error number 50
		bra	.error
.unpacked_fits
.no_unpack
		tst.b	arg_relocate(a5)
		beq.s	.no_relocate
		move.l	any_chunk_address(a5),a0	;relocate code
		move.l	any_chunk_address(a5),a1
		move.l	chip_chunk_address(a5),a2
		jsr	_STRelocate
		tst.l	d0
		bne	.error
		bra.s	.skip_no_relocate
.no_relocate	move.l	any_chunk_address(a5),a0
.skip_no_relocate
		move.l	a0,execution_address(a5)

		moveq.l	#2,d0				;2 colours
		move.l	#640,d1				;640 wide
		move.l	#11,d2				;15 high
		move.l	#V_SPRITES,d3			;hires
		jsr	_STOpenScreen			;open a screen to
		tst.l	d0				; redirect mouse events
		bne	.error

		tst.b	arg_retappwin(a5)
		beq.s	.no_retappwin
		jsr	_STOpenRetAppWin
		tst.l	d0
		bne	.error
.no_retappwin
		move.l	graphics_base(a5),a6		;kill AA chip set
		suba.l	a1,a1
		JSRLIB	LoadView

		JSRLIB	WaitTOF
		JSRLIB	WaitTOF

		move.l	#25,d1
		move.l	dos_base(a5),a6
		JSRLIB	Delay

;run code with these parameters
; d0.l    = hi word = -1 (flags system dead)
;         = lo word = language chosen
; d1-d3.l = runtime parameters
; d4.l	  = checksum failed flag
; d5.l    = lo word = processors
;         = hi word = config info
; d6.l    = size of ram disk (in bytes)
; a0.l    = address of parameters/variables block
; a2.l    = base of extra chip memory (0=none available)
; a3.l    = base of extra other memory (0=none available)
; a4.l    = address of chip memory chunk
; a5.l    = address of chip/any memory block
; a6.l    = address of ram disk chunk
; (sp)    = return address

		movem.l d1-d7/a0-a6,-(sp)

		moveq.l	#0,d0
		move.b	language(a5),d0
		move.l	param1(a5),d1
		move.l	param2(a5),d2
		move.l	param3(a5),d3
		move.b	checksum_failed(a5),d4
		move.w	config(a5),d5
		swap	d5
		move.w	processors(a5),d5
		move.l	ramdisk_amount(a5),d6

		move.l	a5,a0
		move.l	chip_chunk_address(a5),a4
		move.l	ramdisk_chunk_address(a5),a6
		move.l	execution_address(a5),a1
		move.l	exchip_chunk_address(a5),a2
		move.l	exany_chunk_address(a5),a3
		move.l	any_chunk_address(a5),a5

		jsr	(a1)
.return		movem.l (sp)+,d1-d7/a0-a6

		tst.l	d0
		beq.s	.no_prog_error
		move.l	#47,d0			;error number 47
.no_prog_error
		move.l	d0,-(sp)

		jsr	_STRestoreCopper

		move.l	graphics_base(a5),a6
		JSRLIB	WaitTOF
		JSRLIB	WaitTOF

		move.l	intuition_base(a5),a6
		JSRLIB	ViewAddress

		move.l	d0,a1
		move.l	graphics_base(a5),a6
		JSRLIB	LoadView

		move.l	intuition_base(a5),a6
		JSRLIB	RemakeDisplay

		jsr	_STCloseRetAppWin

		move.l	intuition_base(a5),a6
		JSRLIB	WBenchToFront

		move.l	(sp)+,d0

		rts

.no_error	moveq.l	#0,d0
.error		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;		a0.l=address of data to checksum
;		d0.l=length of data to check (must be even)
;OUTPUT:	d0.l=success flag (-1=failed)
;CHANGES:	none

_STChecksum
		movem.l	d1-d7/a0-a6,-(sp)

		moveq.l	#0,d1			;checksum
		moveq.l	#0,d2			;previous
		moveq.l	#0,d3

		subi.l	#2,d0			;length-1

.loop		move.w	(a0),d3			;get data
		eor.w	d2,d3			;data = data EOR previous
		add.l	d3,d1			;checksum += data
		move.w	(a0)+,d2		;previous = data

		subi.l	#2,d0
		bge.s	.loop

		cmp.l	.code,d1
		bne.s	.error

.success	moveq.l	#0,d0
		sf.b	checksum_failed(a5)
		movem.l	(sp)+,d1-d7/a0-a6
		rts

.error		moveq.l	#-1,d0
		st.b	checksum_failed(a5)
		movem.l	(sp)+,d1-d7/a0-a6
		rts

.code		include	checksum.s

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;		a0.l=address of CLI command line arguments
;		d0.w=number of command line arguments
;OUTPUT:	none
;CHANGES:	none

_STInitialise
		movem.l	d0-d7/a0-a6,-(sp)

		move.l	4.w,_SysBase		;store for amiga.lib

		move.l	a5,a1			;clear internal variables
		move.w	#stb_SIZEOF,d1
.loop		clr.b	(a1)+
		dbf	d1,.loop

		move.l	#$dff000,hardware_base(a5)

		move.l	_SysBase,a6

		move.l	a0,arg_address(a5)
		move.w	d0,arg_length(a5)
		bne.s	.cli

		suba.l	a1,a1			;find this task
		JSRLIB	FindTask

		move.l	d0,process(a5)
		move.l	d0,a0

		move.l	pr_WindowPtr(a0),window_ptr(a5)
		move.l	#-1,pr_WindowPtr(a0)	;disable system requesters

		lea	pr_MsgPort(a0),a0

		JSRLIB	WaitPort		;wait for workbench message
		JSRLIB	GetMsg			;get workbench message

		move.l	d0,wbench_message(a5)
.cli
		move.w	AttnFlags(a6),processors(a5)

		movem.l	(sp)+,d0-d7/a0-a6
		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	none
;CHANGES:	none

_STShutDown
		movem.l	d0-d7/a0-a6,-(sp)

		move.l	_SysBase,a6

		cmpi.w	#37,LIB_VERSION(a6)
		blt.s	.too_old
		move.l	old_cacr(a5),d0
		or.l	#CACRF_WriteAllocate!CACRF_ClearI!CACRF_ClearD,d0
		move.l	changed_cacr(a5),d1
		or.l	#CACRF_WriteAllocate!CACRF_ClearI!CACRF_ClearD,d1
		JSRLIB	CacheControl
.too_old
		move.l	process(a5),a0
		move.l	window_ptr(a5),pr_WindowPtr(a0)

		tst.w	arg_length(a5)
		bne.s	.not_wbench

		JSRLIB	Forbid			;disable task switching
		move.l	wbench_message(a5),a1
		JSRLIB	ReplyMsg		;reply to workbench message
.not_wbench
		movem.l	(sp)+,d0-d7/a0-a6
		rts

****************************************************************************
************************** Allocate System Resources ***********************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

_STAllocateResources
		movem.l	d1-d7/a0-a6,-(sp)

		bsr	allocate_resources
		tst.l	d0
		bne	.error

		move.w	requested_flags(a5),d0
		btst.l	#FLAGB_CLOSE_WBENCH,d0
		beq.s	.dont_close_wbench
		move.l	a5,-(sp)
		move.l	intuition_base(a5),a6	;close workbench
		JSRLIB	CloseWorkBench
		move.l	(sp)+,a5
.dont_close_wbench

		bsr	allocate_memory
		tst.l	d0
		bne	.error

		bsr	install_interrupts
		tst.l	d0
		bne	.error

		moveq.l	#0,d0			;no errors
.error		movem.l	(sp)+,d1-d7/a0-a6
		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	none
;CHANGES:	none

_STDeallocateResources
		movem.l	d0-d7/a0-a6,-(sp)

		bsr	remove_interrupts
		bsr	deallocate_memory

		move.w	requested_flags(a5),d0
		btst.l	#FLAGB_CLOSE_WBENCH,d0
		beq.s	.dont_open_wbench
		move.l	a5,-(sp)
		move.l	intuition_base(a5),a6	;open workbench
		JSRLIB	OpenWorkBench
		move.l	(sp)+,a5
.dont_open_wbench

		bsr	deallocate_resources

		movem.l	(sp)+,d0-d7/a0-a6
		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;		a0.l=address of filename
;		a1.l=destination address
;		d3.l=length to read (bytes)
;OUTPUT:	d0.l=error code (0=no error)
;		d1.l=number of bytes read
;CHANGES:	none

_STLoadFile
		movem.l	d2-d7/a0-a6,-(sp)

		movem.l	a1-a5/d3,-(sp)
		move.l	a0,d1			;filename
		move.l	#MODE_OLDFILE,d2        ;mode
		move.l	dos_base(a5),a6
		JSRLIB	Open			;open file
		movem.l	(sp)+,a1-a5/d3
		move.l	d0,d2			;handle

		tst.l	d2
		bne.s	.open_ok
		moveq.l	#33,d0			;error number 33
		bra.s	.error
.open_ok

		movem.l	d2/a5,-(sp)
		move.l	d2,d1			;handle
		move.l	a1,d2			;destination buffer
		move.l	dos_base(a5),a6
		JSRLIB	Read			;read file
		movem.l	(sp)+,d2/a5
		move.l	d0,d1			;amount read

		tst.l	d1
		bpl.s	.read_ok
		move.l	d1,-(sp)
		move.l	d2,d1			;handle
		move.l	dos_base(a5),a6
		JSRLIB	Close			;close file
		move.l	(sp)+,d1
		moveq.l	#33,d0			;error number 33
		bra.s	.error
.read_ok

		move.l	d1,-(sp)
		move.l	d2,d1			;handle
		move.l	dos_base(a5),a6
		JSRLIB	Close			;close file
		move.l	(sp)+,d1

		moveq.l	#0,d0
.error		movem.l	(sp)+,d2-d7/a0-a6
		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;		a1.l=filename to examine
;		a2.l=file info block to fill
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

_STFileInfo
		movem.l	d1-d7/a0-a6,-(sp)

		movem.l	a1-a4/d3,-(sp)
		move.l	a1,d1			;filename
		move.l	#ACCESS_READ,d2		;mode
		move.l	dos_base(a5),a6
		JSRLIB	Lock			;lock file
		movem.l	(sp)+,a1-a4/d3
		move.l	d0,code_lock(a5)	;handle
		tst.l	d0
		bne.s	.lock_ok
		moveq.l	#20,d0			;error number 20
		bra	.error
.lock_ok
		move.l	code_lock(a5),d1	;lock
		move.l	a2,d2			;file info block
		move.l	dos_base(a5),a6
		JSRLIB	Examine			;examine file
		tst.l	d0
		bne.s	.examine_ok
		moveq.l	#32,d0			;error number 32
		bra.s	.error
.examine_ok
		tst.l	fib_DirEntryType+code_fib(a5)
		bmi.s	.file_entry
		moveq.l	#19,d0			;error number 19
		bra.s	.error
.file_entry

		moveq.l	#0,d0
.error
		move.l	d0,-(sp)
		move.l	code_lock(a5),d1	;lock
		move.l	dos_base(a5),a6
		JSRLIB	UnLock			;unlock file
		move.l	(sp)+,d0

		movem.l	(sp)+,d1-d7/a0-a6
		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;		d0.l=error code
;OUTPUT:	none
;CHANGES:	none

_STOutputError
		movem.l	d0-d7/a0-a6,-(sp)

		cmpi.l	#-1,d0			;abort or error?
		beq.s	.end

		move.l	d0,d1			;get handle to error message
		jsr	_STWhy
		tst.l	d0
		bne.s	.alert

		tst.w	arg_length(a5)
		bne.s	.not_wbench

		jsr	_STBeep			;beep & flash screen
		move.l	a0,a1			;display error message
		jsr	_STSimpleAutoRequest	; from requestor if started
		tst.l	d0			; from workbench
		bne.s	.alert
		bra.s	.skip_cli
.not_wbench	move.l	a0,d2			;output error message on
		jsr	_STOutput		; cli if started from cli
		tst.l	d0
		bne.s	.alert
.skip_cli

.end		movem.l	(sp)+,d0-d7/a0-a6
		rts

;Serious error! Message displayed in alert box
;Enter with error code in d0

.alert		jsr	_STAlert		;alert error message

		movem.l	(sp)+,d0-d7/a0-a6
		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	none
;CHANGES:	none
_STForbid
		movem.l	d0-d7/a0-a6,-(sp)

		move.l	graphics_base(a5),a6	;own blitter
		JSRLIB	OwnBlitter

		move.l	_SysBase,a6		;disable task switching
		JSRLIB	Forbid

		movem.l	(sp)+,d0-d7/a0-a6
		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	none
;CHANGES:	none

_STPermit
		movem.l	d0-d7/a0-a6,-(sp)

		move.l	_SysBase,a6		;enable task switching
		JSRLIB	Permit

		move.l	graphics_base(a5),a6	;disown blitter
		JSRLIB	DisownBlitter

		movem.l	(sp)+,d0-d7/a0-a6
		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	none
;CHANGES:	none

_STDisable
		movem.l	d0-d7/a0-a6,-(sp)

		move.l	_SysBase,a6		;disable interrupts
		JSRLIB	Disable

		movem.l	(sp)+,d0-d7/a0-a6
		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	none
;CHANGES:	none

_STEnable
		movem.l	d0-d7/a0-a6,-(sp)

		move.l	_SysBase,a6		;enable interrupts
		JSRLIB	Enable

		movem.l	(sp)+,d0-d7/a0-a6
		rts

****************************************************************************
****************************************************************************
****************************************************************************
;Warning!!!! This routine totally KILLS the operating system. The program
;will be running in supervisor mode when it returns.
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	a6.l=base address of hardware registers
;CHANGES:	a0-a1,a6-a7,d0

_STKillSystem
		move.l	graphics_base(a5),a6	;kill AA chip set
                suba.l	a1,a1
		JSRLIB	LoadView

		move.l	dos_base(a5),a6
		move.l	#25,d1
		JSRLIB	Delay

		move.l	(sp)+,a1		;save return address

		move.l	hardware_base(a5),a6	;hardware regs base

		move.l	#user_start,a7		;set user stack pointer

		move.l	$84,a0			;into supervisor mode
		lea	.super_routine(pc),a0
		move.l	a0,$84
		trap	#1			;go!

.super_routine
		move.l	#super_start,a7		;set supervisor stack pointer

		move.w	#%0111111111111111,intena(a6)	;clear all interupts
		move.b	#%01111111,$bfe001+ciaicr	;ciaa interrupts off
		move.b	#%01111111,$bfd000+ciaicr	;ciab interrupts off
		move.w	#$2000,sr

		move.w	#%0000001111111111,dmacon(a6)	;all dma off

		move.l	#0,4			;corrupt execbase
						; forces a cold boot
						; on reset

		move.w	#0,aud0+ac_vol(a6)	;ch0 off
		move.w	#0,aud1+ac_vol(a6)	;ch1 off
		move.w	#0,aud2+ac_vol(a6)	;ch2 off
		move.w	#0,aud3+ac_vol(a6)	;ch3 off

		lea	color(a6),a0		;initialise palette
		moveq.l	#31,d0			; to black

.pallette_loop	move.w	#0,(a0)+
		dbf	d0,.pallette_loop

                jmp	(a1)			;return

		rsreset				;temporary memory map
lomem		rs.b	1024
user_end	rs.b	200
user_start	rs.b	0			; from top of fast
super_end	rs.b	200
super_start	rs.b	0
jumpy_address	rs.b	killsys_code_end-killsys_code_start

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5.l=address of parameters/variables block (long)
;OUTPUT:	none
;CHANGES:	none

_STBeep
		movem.l	d0-d7/a0-a6,-(sp)

		move.l	intuition_base(a5),a6
                suba.l	a0,a0
		JSRLIB	DisplayBeep

		movem.l	(sp)+,d0-d7/a0-a6
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;		d2.l=address of string
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none


_STOutput
		movem.l	d1-d7/a0-a6,-(sp)

		tst.l	d2
		beq.s	.no_output

		move.l	d2,a0

		moveq.l	#0,d3			;calculate length of string
.loop		tst.b	(a0)+
		beq.s	.end_string
		addq.l	#1,d3
		bra.s	.loop
.end_string
		tst.w	d3
		bne.s	.string_ok
		moveq.l	#0,d0
		bra.s	.error
.string_ok
		tst.l	stdout_handle(a5)
		bne.s   .already_open
		jsr	_STOpenConsole
		tst.l	d0
		bne	.error
.already_open
		move.l	stdout_handle(a5),d1
		beq.s	.no_output
		move.l	dos_base(a5),a6
		JSRLIB	Write

		tst.w	d0
		bpl.s	.write_ok1
		moveq.l	#16,d0			;error number 16
		bra.s	.error
.write_ok1
		move.l	#.cr,d2
		moveq.l	#1,d3
		move.l	stdout_handle(a5),d1
		move.l	dos_base(a5),a6
		JSRLIB	Write

		tst.w	d0
		bpl.s	.write_ok2
		moveq.l	#24,d0			;error number 24
		bra.s	.error

.no_output
.write_ok2	moveq.l	#0,d0			;no errors
.error		movem.l	(sp)+,d1-d7/a0-a6
		rts

.cr		dc.b	$a,0
		even

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;		a1.l=address of string
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

_STSimpleAutoRequest
		movem.l	d1-d7/a0-a6,-(sp)

		lea	code_filename(a5),a0
		move.l	a0,.mesg_head_ptr
		move.l	a1,.mesg_body_ptr

		lea	.itext_header(pc),a1	;body text
		suba.l	a0,a0			;window structure
		suba.l	a2,a2			;positive text
		lea	.itext_button(pc),a3	;negative text
		move.l	#0,d0			;positive flags
		move.l	#0,d1			;negative flags
		move.l	#640,d2			;width
		move.l	#60,d3			;height
		move.l	intuition_base(a5),a6
		JSRLIB	AutoRequest

.write_ok	moveq.l	#0,d0			;no errors
.error		movem.l	(sp)+,d1-d7/a0-a6
		rts

.itext_button	dc.b	AUTOFRONTPEN		;front pen
                dc.b	AUTOBACKPEN		;back pen
		dc.b	AUTODRAWMODE		;draw mode
		dc.b	0			;pad
		dc.w	AUTOLEFTEDGE		;left edge
		dc.w	AUTOTOPEDGE		;top edge
		dc.l	default_font		;font
                dc.l    .button			;text
		dc.l	AUTONEXTTEXT		;next itext

.button		dc.b	"Abort",0
		even

.itext_header	dc.b	AUTOFRONTPEN		;front pen
                dc.b	AUTOBACKPEN		;back pen
		dc.b	AUTODRAWMODE		;draw mode
		dc.b	0			;pad
		dc.w	AUTOLEFTEDGE		;left edge
		dc.w	AUTOTOPEDGE		;top edge
		dc.l	default_font		;font
.mesg_head_ptr	dc.l	0			;text
		dc.l	.itext_body		;next itext
		even

.itext_body	dc.b	AUTOFRONTPEN		;front pen
                dc.b	AUTOBACKPEN		;back pen
		dc.b	AUTODRAWMODE		;draw mode
		dc.b	0			;pad
		dc.w	AUTOLEFTEDGE		;left edge
		dc.w	AUTOTOPEDGE+12		;top edge
		dc.l	default_font		;font
.mesg_body_ptr	dc.l    0			;text
		dc.l	AUTONEXTTEXT		;next itext
		even

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;		a1.l=address of itext structure for body
;		a2.l=address of itext structure for positive gadget
;		a3.l=address of itext structure for negative gadget
;		d0.l=width of requester in pixels
;		d1.l=height of requester in pixels
;OUTPUT:	d0.l=error code (0=no error)
;		d1.l= 1=True 0=False
;CHANGES:	none

_STAutoRequest
		movem.l	d2-d7/a0-a6,-(sp)

		suba.l	a0,a0			;window structure
		move.l	d0,d2			;width
		move.l	d1,d3			;height
		move.l	#0,d0			;positive flags
		move.l	#0,d1			;negative flags
		move.l	intuition_base(a5),a6
		JSRLIB	AutoRequest

		move.l	d0,d1

.write_ok	moveq.l	#0,d0			;no errors
.error		movem.l	(sp)+,d2-d7/a0-a6
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;		d0.l=alert message code
;OUTPUT:	d0.l=response (1=left button,0=right button)
;CHANGES:	none

_STAlert
		movem.l	d1-d7/a0-a6,-(sp)

		tst.l	d0
		beq.s	.no_error
		bpl.s	.code_above_min
		moveq.l	#25,d0			;error number 25
		bra.s	.code_below_max
.code_above_min	cmpi.l	#MAX_ERROR_CODES,d0
		ble.s	.code_below_max
		moveq.l	#25,d0			;error number 25
.code_below_max
		subq.l	#1,d0
		mulu	#100,d0
		lea	err_mesgs,a0
		lea	0(a0,d0.w),a0

		move.l	#RECOVERY_ALERT,d0
		move.l	#30,d1
		move.l	intuition_base(a5),a6
		JSRLIB	DisplayAlert

.no_error	movem.l	(sp)+,d1-d7/a0-a6
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;		d1.l=error message code
;OUTPUT:	a0.l=address of error message string
;		d0.l=error code (0=no error)
;CHANGES:	none

ERROR_DEFN	MACRO
		CNOP	0,100
		IFND	err_mesgs
err_mesgs
		ENDC
		dc.b	0,\2,\3
		dc.b	\1,0
		even
		ENDM

_STWhy
		movem.l	d1-d7/a1-a6,-(sp)

		tst.l	d1
		beq.s	.code0
		bpl.s	.code_above_min
.code0		moveq.l	#21,d0			;error number 21
		bra.s	.error
.code_above_min	cmpi.l	#MAX_ERROR_CODES,d0
		ble.s	.code_below_max
		moveq.l	#21,d0			;error number 21
		bra.s	.error
.code_below_max
		subq.l	#1,d0
		mulu	#100,d0
		lea	err_mesgs+3(pc,d0.w),a0

.no_error	moveq.l	#0,d0			;no errors
.error		movem.l	(sp)+,d1-d7/a1-a6
		rts

		ERROR_DEFN <"ERROR #00001 : Could not open graphics.library">,24,17
		ERROR_DEFN <"ERROR #00002 : Could not open intuition.library">,24,17
		ERROR_DEFN <"ERROR #00003 : Could not open stdout">,24,17
		ERROR_DEFN <"ERROR #00004 : Could not open misc.resource">,24,17
		ERROR_DEFN <"ERROR #00005 : Could not allocate serial port bits">,24,17
		ERROR_DEFN <"ERROR #00006 : Could not allocate serial port">,24,17
		ERROR_DEFN <"ERROR #00007 : Could not open potgo.resource">,24,17
		ERROR_DEFN <"ERROR #00008 : Could not allocate potgo bits">,24,17
		ERROR_DEFN <"ERROR #00009 : Could not allocate required audio channels">,24,17
		ERROR_DEFN <"ERROR #00010 : Could not open custom screen">,24,17
		ERROR_DEFN <"ERROR #00011 : Could not allocate enough chip memory">,24,17
		ERROR_DEFN <"ERROR #00012 : Could not open icon.library">,24,17
		ERROR_DEFN <"ERROR #00013 : Could not allocate enough of any memory">,24,17
		ERROR_DEFN <"ERROR #00014 : Unrecognised parameter">,24,17
		ERROR_DEFN <"ERROR #00015 : Could not allocate enough chip memory for graphics">,24,17
		ERROR_DEFN <"ERROR #80016 : _STOutput write to console failed (body)">,24,17
		ERROR_DEFN <"ERROR #80017 : _STInfo write to console failed (output info)">,24,17
		ERROR_DEFN <"ERROR #90018 : _STOpenScreen buffer address undefined">,24,17
		ERROR_DEFN <"ERROR #00019 : _STFileInfo lock is not a file">,24,17
		ERROR_DEFN <"ERROR #00020 : _STFileInfo could not get lock on file">,24,17
		ERROR_DEFN <"ERROR #90021 : _STWhy error code out of range">,24,17
		ERROR_DEFN <"ERROR #00022 : _STUnPack error in unpacking">,24,17
		ERROR_DEFN <"ERROR #90023 : _STRequest string empty">,24,17
		ERROR_DEFN <"ERROR #80024 : _STOutput write to console failed (cr)">,24,17
		ERROR_DEFN <"ERROR #90025 : _STAlert error code out of range">,24,17
		ERROR_DEFN <"ERROR #90026 : _STCopyString maximum length exceeded">,24,17
		ERROR_DEFN <"ERROR #00027 : Could not allocate parallel port bits">,24,17
		ERROR_DEFN <"ERROR #00028 : Could not allocate parallel port">,24,17
		ERROR_DEFN <"ERROR #00029 : Could not allocate ciaa.resource timer A">,24,17
		ERROR_DEFN <"ERROR #00030 : Could not allocate ciaa.resource timer B">,24,17
		ERROR_DEFN <"ERROR #00031 : Could not open output console">,24,17
		ERROR_DEFN <"ERROR #00032 : _STFileInfo examine failed">,24,17
		ERROR_DEFN <"ERROR #00033 : _STLoadFile amigaDOS IO error">,24,17
		ERROR_DEFN <"ERROR #00034 : _STRelocate bad hunk">,24,17
		ERROR_DEFN <"ERROR #00035 : Not enough chip memory in system">,24,17
		ERROR_DEFN <"ERROR #00036 : Not enough expansion memory in system">,24,17
		ERROR_DEFN <"ERROR #00037 : Not enough memory in system">,24,17
		ERROR_DEFN <"ERROR #90038 : _STOpenConsole console already open">,24,17
		ERROR_DEFN <"ERROR #90039 : _STOpenStdio stdout already open">,24,17
		ERROR_DEFN <"ERROR #00040 : Code file invalid or unspecified">,24,17
		ERROR_DEFN <"ERROR #00041 : Temp chunk overflow! Possible memory corruption!">,24,17
		ERROR_DEFN <"ERROR #00042 : Could not read disk object">,24,17
		ERROR_DEFN <"ERROR #80043 : Chip memory amount invalid or unspecified">,24,17
		ERROR_DEFN <"ERROR #80044 : Any memory amount invalid or unspecified">,24,17
		ERROR_DEFN <"ERROR #00045 : _STWarnKillsys could not open window">,24,17
		ERROR_DEFN <"ERROR #00046 : Could not open expansion.library">,24,17
		ERROR_DEFN <"ERROR #00047 : Error during program execution">,24,17
		ERROR_DEFN <"ERROR #00048 : Chip chunk/memory too small for code file">,24,17
		ERROR_DEFN <"ERROR #00049 : Could not open ciaa.resource">,24,17
		ERROR_DEFN <"ERROR #00050 : Chip chunk overflow! Possible memory corruption!">,24,17
		ERROR_DEFN <"ERROR #00051 : Could not allocate enough temporary chip memory">,24,17
		ERROR_DEFN <"ERROR #00052 : Temporary chip memory amount invalid or unspecified">,24,17
		ERROR_DEFN <"ERROR #00053 : Could not open stdin">,24,17
		ERROR_DEFN <"ERROR #90054 : _STOpenStdio stdin already open">,24,17
		ERROR_DEFN <"ERROR #00055 : Could not allocate ciab.resource timer A">,24,17
		ERROR_DEFN <"ERROR #00056 : Could not allocate ciab.resource timer B">,24,17
		ERROR_DEFN <"ERROR #00057 : Could open audio.device">,24,17
		ERROR_DEFN <"ERROR #00058 : Could not open window on custom screen">,24,17
		ERROR_DEFN <"ERROR #00059 : Could not open ciab.resource">,24,17
		ERROR_DEFN <"ERROR #00060 : _STRelocate too many hunks">,24,17
		ERROR_DEFN <"ERROR #00061 : _STRelocate memory overflow">,24,17
		ERROR_DEFN <"ERROR #00062 : _STRelocate bad hunk number">,24,17
		ERROR_DEFN <"ERROR #00063 : _STRelocate bad load">,24,17
		ERROR_DEFN <"ERROR #00064 : _STOpenRetAppWin could not open window">,24,17
		ERROR_DEFN <"ERROR #00065 : _STOpenScreen videocontrol failed">,24,17
		ERROR_DEFN <"ERROR #00066 : Not enough memory for intro">,24,17
		ERROR_DEFN <"ERROR #00067 : Could not open keyboard device">,24,17
		ERROR_DEFN <"ERROR #00068 : Could not open lowlevel.library">,24,17
		ERROR_DEFN <"ERROR #00069 : Could not open nonvolatile.library">,24,17

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

_STInfo
		movem.l	d1-d7/a0-a6,-(sp)

		WRITELN   <"---MEMORY REQUIRED-------------------------------------">
		WRITEINFO <"               Chunk of chip memory">,<"UNDEF'ND (bytes)">,chip_amount(a5)
		WRITEINFO <"          Chunk of chip/fast memory">,<"UNDEF'ND (bytes)">,any_amount(a5)
		WRITEINFO <"         Chunk of extra chip memory">,<"UNDEF'ND (bytes)">,exchip_amount(a5)
		WRITEINFO <"    Chunk of extra chip/fast memory">,<"UNDEF'ND (bytes)">,exany_amount(a5)
		WRITEINFO <"                           Ram disk">,<"UNDEF'ND (bytes)">,ramdisk_amount(a5)

		WRITELN   <"---MEMORY ALLOCATED------------------------------------">

		tst.b	arg_killsys(a5)
		bne	.not_os_friendly
		WRITEINFO <"                 Chip chunk address">,<"UNKNOWN ">,chip_chunk_address(a5)
		WRITEINFO <"            Chip/fast chunk address">,<"UNKNOWN ">,any_chunk_address(a5)
		WRITEINFO <"           Extra Chip chunk address">,<"UNKNOWN ">,exchip_chunk_address(a5)
		WRITEINFO <"      Extra chip/fast chunk address">,<"UNKNOWN ">,exany_chunk_address(a5)
		WRITEINFO <"                   Ram disk address">,<"UNKNOWN ">,ramdisk_chunk_address(a5)
		WRITELN   <"---GENERAL INFO----------------------------------------">
		WRITEINFO <"       Largest chunk of chip memory">,<"UNKNOWN  (bytes)">,largest_chip(a5)
		WRITEINFO <"  Largest chunk of chip/fast memory">,<"UNKNOWN  (bytes)">,largest_any(a5)
		bra	.skip_not_os_friendly
.not_os_friendly
		WRITEINFO <"                Chip memory address">,<"UNKNOWN ">,chip_mem_address(a5)
		WRITEINFO <"           Chip/fast memory address">,<"UNKNOWN ">,any_mem_address(a5)
		WRITEINFO <"          Extra chip memory address">,<"UNKNOWN ">,exchip_mem_address(a5)
		WRITEINFO <"     Extra chip/fast memory address">,<"UNKNOWN ">,exany_mem_address(a5)
		WRITEINFO <"            Ram disk memory address">,<"UNKNOWN ">,ramdisk_mem_address(a5)
		WRITELN   <"---GENERAL INFO----------------------------------------">
		WRITEINFO <"           Size of code load buffer">,<"UNDEF'ND (bytes)">,temp_amount(a5)
		WRITEINFO <"           Code load buffer address">,<"UNKNOWN ">,temp_chunk_address(a5)
		WRITEINFO <"                 Size of jumpy code">,<"UNKNOWN  (bytes)">,#killsys_code_end-killsys_code_start
		WRITEINFO <"          Jumpy code target address">,<"UNKNOWN ">,#jumpy_address
.skip_not_os_friendly

		moveq.l	#0,d0
		move.w	processors(a5),d0
		WRITEINFO <"                         Processors">,<"00000000">,d0
		moveq.l	#0,d0
		move.b	language(a5),d0
		WRITEINFO <"                    Language chosen">,<"0       ">,d0
		moveq.l	#0,d0
		move.w	config(a5),d0
		WRITEINFO <"                             Config">,<"00000000">,d0
		WRITEINFO <"                           Old CACR">,<"00000000">,old_cacr(a5)
		WRITEINFO <"                           New CACR">,<"00000000">,new_cacr(a5)
		WRITEINFO <"                          CACR mask">,<"00000000">,changed_cacr(a5)
		WRITELN   <"---LIBRARIES-------------------------------------------">
		WRITEINFO <"                   Graphics.library">,<"UNKNOWN ">,graphics_version(a5)
		WRITEINFO <"                  Intuition.library">,<"UNKNOWN ">,intuition_version(a5)
		WRITEINFO <"                        Dos.library">,<"UNKNOWN ">,dos_version(a5)
		WRITEINFO <"                       Icon.library">,<"UNKNOWN ">,icon_version(a5)

		WRITELN   <"---DATA FILE-------------------------------------------">
		lea	data_filename(a5),a0
		move.l	a0,d2
		jsr	_STOutput
		tst.l	d0
		bne	.error

		WRITELN   <"---CODE FILE-------------------------------------------">
		lea	code_filename(a5),a0
		move.l	a0,d2
		jsr	_STOutput
		tst.l	d0
		bne	.error
		WRITEINFO <"          Parameter 1 (register D1)">,<"00000000">,param1(a5)
		WRITEINFO <"          Parameter 2 (register D2)">,<"00000000">,param2(a5)
		WRITEINFO <"          Parameter 3 (register D3)">,<"00000000">,param3(a5)
		WRITEINFO <"          Parameter 4 (register D4)">,<"00000000">,param4(a5)

		moveq.l	#0,d0			;no errors
.error		movem.l	(sp)+,d1-d7/a0-a6
		rts

********************************************************************************
long_to_string	movem.l	d0-d4/a0-a1,-(sp)

		move.b	#"0",(a0)
		move.b	#" ",1(a0)
		move.b	#" ",2(a0)
		move.b	#" ",3(a0)
		move.b	#" ",4(a0)
		move.b	#" ",5(a0)
		move.b	#" ",6(a0)
		move.b	#" ",7(a0)

		move.l	a0,a1
		move.w	#7,d2
		moveq.l	#0,d4

.loop		rol.l	#4,d0
		move.w	d0,d1
		and.w	#$f,d1
		move.b  hex_digits(pc,d1.w),d3
		tst.w	d4
		bne.s	.do_zeros
		cmpi.b	#"0",d3
		beq.s	.skip_zero
		st.b	d4
.do_zeros	move.b	d3,(a0)+
.skip_zero	dbf	d2,.loop

		movem.l	(sp)+,d0-d4/a0-a1
		rts

hex_digits	dc.b	"0123456789ABCDEF"

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	none
;CHANGES:	none

_STRestoreCopper
		movem.l	d0-d7/a0-a6,-(sp)

		jsr	_STForbid

		move.l	hardware_base(a5),a2
		move.w	#DMAF_RASTER!DMAF_COPPER!DMAF_SPRITE,dmacon(a2)
		move.l	graphics_base(a5),a6
		move.l	gb_copinit(a6),cop1lc(a2)
		move.l	gb_copinit(a6),cop2lc(a2)
		move.w	#DMAF_SETCLR!DMAF_RASTER!DMAF_COPPER!DMAF_SPRITE,dmacon(a2)
		move.w	#0,copjmp1(a2)

		jsr	_STPermit

		movem.l	(sp)+,d0-d7/a0-a6
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;		a0.l=address of source
;		a1.l=address of destination
;OUTPUT:	d0.l=length of unpacked data (0=error)
;CHANGES:	none

_STUnPack
		dc.l $48E7FFFE,$4FEFFE80,$244F6100,$016C7200,$B0BC524E,$43016600,$00F86100,$015C2F40
		dc.l $018047E8,$000A2A49,$4DF50800,$6100014A,$49F30800,$4267BBCC,$644C7000,$102BFFFE
		dc.l $41F60800,$B1CC633E,$544F200C,$08000000,$6704524C,$52482008,$08000000,$67025248
		dc.l $7000BDC8,$67081220,$3F015200,$60F43F00,$D1C049EC,$FFE04CD4,$00FF48E0,$FF00B9CB
		dc.l $62F097CC,$D7C87E00,$1C2B0001,$E15E1C13,$70027202,$610000BE,$204A6100,$00E841EA
		dc.l $00806100,$00E041EA,$01006100,$00D870FF,$72106100,$00A03800,$5344601C,$41EA0080
		dc.l $7000615A,$448043F5,$08FF41EA,$0100614E,$1AD91AD9,$51C8FFFC,$204A6142,$53406B1A
		dc.l $1ADB51C8,$FFFC102B,$0001E158,$1013EFA8,$7201EF69,$5341CC81,$8C8051CC,$FFC0BBCE
		dc.l $6596301F,$6708321F,$1AC15300,$66F86004,$2F410180,$4FEF0180,$4CDF7FFF,$4E753018
		dc.l $C0469058,$66F81228,$003C9E01,$6C026130,$E2AE1028,$003DB03C,$00026D16,$53001200
		dc.l $14003028,$003EC046,$9E016C02,$6112E2AE,$05C04E75,$C0469E01,$6C026104,$E2AE4E75
		dc.l $DE01EEAE,$4846584B,$1C23E15E,$1C234846,$92077E10,$9E014E75,$7203E188,$101851C9
		dc.l $FFFA4E75,$701F7205,$61CA5340,$6B7C3400,$36004FEF,$FFF0224F,$700F7204,$61B612C0
		dc.l $51CAFFF6,$7001E298,$72017400,$48E70700,$380343EF,$000CB219,$663A7A01,$E36D5345
		dc.l $30C52A02,$48453E01,$5347E355,$E25651CF,$FFFA7A10,$9A01EA6E,$30C61141,$003C1A03
		dc.l $9A041145,$003D7C01,$5305EB6E,$53463146,$003ED480,$51CCFFC0,$E2885201,$B23C0011
		dc.l $66AE4CDF,$00E04FEF,$00104E75
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

_STOpenStdio
		movem.l	d1-d7/a0-a6,-(sp)

		tst.w	arg_length(a5)
		beq.s	.wbench

		tst.l	stdout_handle(a5)
		beq.s	.stdout_not_already_opened
		move.l	#39,d0			;error number 39
		bra.s	.error
.stdout_not_already_opened

		move.l	a5,-(sp)		;get stdout handle
		move.l	dos_base(a5),a6
		JSRLIB	Output
		move.l	(sp)+,a5
		move.l	d0,stdout_handle(a5)
		bne.s	.opened_stdout
		move.l	#4,d0			;error number 4
                bra.s	.error
.opened_stdout
		tst.l	stdin_handle(a5)
		beq.s	.stdin_not_already_opened
		move.l	#54,d0			;error number 54
		bra.s	.error
.stdin_not_already_opened

		move.l	a5,-(sp)		;get stdout handle
		move.l	dos_base(a5),a6
		JSRLIB	Input
		move.l	(sp)+,a5
		move.l	d0,stdin_handle(a5)
		bne.s	.opened_stdin
		move.l	#53,d0			;error number 53
                bra.s	.error
.opened_stdin
		bsr	output_copyright_message
		tst.l	d0
		bne.s	.error

.wbench		moveq.l	#0,d0			;no error
.error		movem.l	(sp)+,d1-d7/a0-a6
		rts

********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:       none

_STOpenConsole
		movem.l	d1-d7/a0-a6,-(sp)

		tst.l	console_handle(a5)
		beq.s	.not_already_opened
		move.l	#38,d0			;error number 38
		bra.s	.error
.not_already_opened

		move.l	#console_name,d1	;get con: handle
		move.l  #MODE_NEWFILE,d2
		move.l	dos_base(a5),a6
		JSRLIB	Open
		move.l	d0,console_handle(a5)
		bne.s	.opened_con
		moveq.l	#31,d0			;error number 31
		bra	.error
.opened_con

		move.l	console_handle(a5),stdout_handle(a5)
		move.l	console_handle(a5),stdin_handle(a5)
		bsr	output_copyright_message
                tst.l	d0
		bne	.error

.no_error	moveq.l	#0,d0			;no error
.error		movem.l	(sp)+,d1-d7/a0-a6
		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;               a0.l=address of command line
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

_STParseArgs
		movem.l	d1-d7/a0-a6,-(sp)

		tst.w	arg_length(a5)
		bne.s	.not_wbench
.wbench		bsr	wbench_parse_args
		bra.s	.skip_cli
.not_wbench	bsr	cli_parse_args
		tst.b	from_filename(a5)
		bne.s	.wbench
.skip_cli	tst.l	d0
		bne.s	.error

		tst.b	code_filename(a5)
		bne.s	.code_filename_ok
		move.l	#40,d0			;error number 40
		bra.s	.error
.code_filename_ok
		tst.l	chip_amount(a5)
		bne.s	.chip_chunk_ok
		move.l	#43,d0			;error number 43
		bra.s	.error
.chip_chunk_ok
		tst.l	any_amount(a5)
		bne.s	.any_chunk_ok
		move.l	#44,d0			;error number 44
		bra.s	.error
.any_chunk_ok
		moveq.l	#0,d0			;no error
.error		movem.l	(sp)+,d1-d7/a0-a6
		rts

****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:       d0-d3/a0-a1

CLI_KEYWORD_DEF	MACRO
		IFND	cli_keyword_defs
cli_keyword_defs
		ENDC
		dc.b	\1,0
		even
		dc.l    \2
		ENDM

CLI_KEYWORD_END	MACRO
		dc.b	-1
		even
		ENDM

cli_parse_args	moveq.l	#0,d0
		move.l	arg_address(a5),a0

.next_arg	bsr	get_next_arg
		tst.l	d0
		bmi.s	.error
		beq.s	.end_of_args
		move.l	d0,a1
		pea	.ret
		jmp	(a1)
.ret		tst.l	d0
		beq.s	.next_arg
.end_of_args	rts

.error		move.l	#14,d0			;error number 14
		rts

		CLI_KEYWORD_DEF	<"?">,keyword_1_def
		CLI_KEYWORD_DEF	<"CODE">,keyword_2_def
		CLI_KEYWORD_DEF	<"INFO">,keyword_3_def
		CLI_KEYWORD_DEF	<"UNPACK">,keyword_4_def
		CLI_KEYWORD_DEF	<"RELOCATE">,keyword_5_def
		CLI_KEYWORD_DEF	<"CHIP">,keyword_6_def
		CLI_KEYWORD_DEF	<"KILLSYS">,keyword_7_def
		CLI_KEYWORD_DEF	<"SERIAL">,keyword_8_def
		CLI_KEYWORD_DEF	<"PARALLEL">,keyword_9_def
		CLI_KEYWORD_DEF	<"POTGO">,keyword_10_def
		CLI_KEYWORD_DEF	<"CLOSEWB">,keyword_11_def
		CLI_KEYWORD_DEF	<"ANY">,keyword_12_def
		CLI_KEYWORD_DEF	<"TEMP">,keyword_13_def
		CLI_KEYWORD_DEF	<"LANGUAGES">,keyword_14_def
		CLI_KEYWORD_DEF	<"CIAA_TIMERA">,keyword_15_def
		CLI_KEYWORD_DEF	<"CIAA_TIMERB">,keyword_16_def
		CLI_KEYWORD_DEF	<"CIAB_TIMERA">,keyword_17_def
		CLI_KEYWORD_DEF	<"CIAB_TIMERB">,keyword_18_def
		CLI_KEYWORD_DEF	<"AUDIO">,keyword_19_def
		CLI_KEYWORD_DEF	<"INT_PORTS">,keyword_20_def
		CLI_KEYWORD_DEF	<"INT_VBLANK">,keyword_21_def
		CLI_KEYWORD_DEF	<"INT_EXTER">,keyword_22_def
		CLI_KEYWORD_DEF	<"INT_COPPER">,keyword_23_def
		CLI_KEYWORD_DEF	<"INT_BLITTER">,keyword_24_def
		CLI_KEYWORD_DEF	<"PARAM1">,keyword_25_def
		CLI_KEYWORD_DEF	<"PARAM2">,keyword_26_def
		CLI_KEYWORD_DEF	<"PARAM3">,keyword_27_def
		CLI_KEYWORD_DEF	<"PARAM4">,keyword_28_def
		CLI_KEYWORD_DEF	<"FLOPPY">,keyword_29_def
		CLI_KEYWORD_DEF	<"DATA">,keyword_30_def
		CLI_KEYWORD_DEF	<"RETAPPWIN">,keyword_32_def
		CLI_KEYWORD_DEF	<"RAMDISK">,keyword_33_def
		CLI_KEYWORD_DEF	<"EXCHIP">,keyword_34_def
		CLI_KEYWORD_DEF	<"EXANY">,keyword_35_def
		CLI_KEYWORD_DEF	<"CACR_INST">,keyword_36_def
		CLI_KEYWORD_DEF	<"CACR_IBE">,keyword_37_def
		CLI_KEYWORD_DEF	<"CACR_DATA">,keyword_38_def
		CLI_KEYWORD_DEF	<"CACR_DBE">,keyword_39_def
		CLI_KEYWORD_DEF	<"CACR_COPYBACK">,keyword_40_def
		CLI_KEYWORD_DEF	<"EXCHIP_NECCESSARY">,keyword_41_def
		CLI_KEYWORD_DEF	<"EXANY_NECCESSARY">,keyword_42_def
		CLI_KEYWORD_DEF	<"EXECUTE">,keyword_43_def
		CLI_KEYWORD_DEF	<"PARALLEL_NECCESSARY">,keyword_44_def
		CLI_KEYWORD_DEF	<"KEYBOARD_NECCESSARY">,keyword_45_def
		CLI_KEYWORD_DEF	<"KEYBOARD">,keyword_46_def
		CLI_KEYWORD_DEF	<"DEFAULT_CONTROL">,keyword_47_def
		CLI_KEYWORD_DEF	<"FROM">,keyword_48_def
		CLI_KEYWORD_END

keyword_1_def	tst.l	stdout_handle(a5)
		bne.s   .cli
		jsr	_STOpenConsole
		tst.l	d0
		bne	.error
.cli
		WRITELN	<"The following options can be expressed as tooltypes or as CLI">
		WRITELN <"parameters. Normal AmigaDOS 2.x conventions apply.">
		WRITELN <"Note that the code file will appear at the base of expansion memory">
		WRITELN <"and will be run from there.">
		WRITELN <" ">
		WRITELN <"    EXECUTE = string">
		WRITELN <"       Filename of code to load and run before main program. If the">
		WRITELN <"       filename contains spaces then use quotes to enclose it.">
		WRITELN <" ">
		WRITELN <"    CODE = string">
		WRITELN <"       Filename of code to load and run. If the filename contains">
		WRITELN <"       spaces then use quotes to enclose it.">
		WRITELN <" ">
		WRITELN <"    DATA = string">
		WRITELN <"       Filename of Takeover.dat, need only be specified if using the">
		WRITELN <"       KILLSYS or LANGUAGES options.">
		WRITELN <" ">
		WRITELN <"    CHIP = decimal unsigned long">
		WRITELN <"       Amount of public chip memory required (in bytes). Amount will be">
		WRITELN <"       rounded up to nearest multiple of four.">
		WRITELN <" ">
		WRITELN <"    EXCHIP = decimal unsigned long">
		WRITELN <"       Amount of extra public chip memory required (in bytes). Amount">
		WRITELN <"       will be rounded up to nearest multiple of four. No error if this">
		WRITELN <"       allocation fails.">
		WRITELN <" ">
		WRITELN <"    EXCHIP_NECCESSARY = YES | NO">
		WRITELN <"       Indicates that successful allocation of extra public chip memory">
		WRITELN <"       is required.">
		WRITELN <" ">
		WRITELN <"    ANY = decimal unsigned long">
		WRITELN <"       Amount of public chip/expansion memory required (in bytes). Amount">
		WRITELN <"       will be rounded up to nearest multiple of four.">
		WRITELN <" ">
		WRITELN <"    EXANY = decimal unsigned long">
		WRITELN <"       Amount of extra public chip/expansion memory required (in bytes).">
		WRITELN <"       Amount will be rounded up to nearest multiple of four. No error">
		WRITELN <"       if this allocation fails.">
		WRITELN <" ">
		WRITELN <"    EXANY_NECCESSARY = YES | NO">
		WRITELN <"       Indicates that successful allocation of extra public">
		WRITELN <"       chip/expansion memory is required.">
		WRITELN <" ">
		WRITELN <"    TEMP = decimal unsigned long">
		WRITELN <"       Amount of memory to decompress code file into (in bytes). Only">
		WRITELN <"       required when using KILLSYS. Amount will be rounded up to nearest">
		WRITELN <"       multiple of four.">
		WRITELN <" ">
		WRITELN <"    RAMDISK = decimal unsigned long">
		WRITELN <"       Size of RAM disk (in bytes).">
		WRITELN <" ">
		WRITELN <"    KILLSYS = YES | NO">
		WRITELN <"       Flags operating system to be trashed. Enough TEMP memory must be">
		WRITELN <"       declared for the code file to load into (and be decompressed to if">
		WRITELN <"       using UNPACK).">
		WRITELN <" ">
		WRITELN <"    UNPACK = YES | NO">
		WRITELN <"       Code file will be decompressed upon loading. Enough TEMP memory">
		WRITELN <"       must be declared for code file to fit into. Currently only">
		WRITELN <"       supports Rob Northen Computing' compression type 1.">
		WRITELN <" ">
		WRITELN <"    RELOCATE = YES | NO">
		WRITELN <"       Code file will be relocated. The file must be an Amiga executeable.">
		WRITELN <" ">
		WRITELN <"    SERIAL   = YES | NO">
		WRITELN <"    PARALLEL = YES | NO">
		WRITELN <"    AUDIO    = YES | NO">
		WRITELN <"    FLOPPY   = YES | NO (not yet implemented)">
		WRITELN <"    POTGO    = YES | NO (gameport 2 only)">
		WRITELN <"    KEYBOARD = YES | NO">
		WRITELN <"       Exclusive access to the associated hardware registers.">
		WRITELN <" ">
		WRITELN <"    PARALLEL_NECCESSARY = YES | NO">
		WRITELN <"       Indicates that successful allocation of the parallel port">
		WRITELN <"       is required.">
		WRITELN <" ">
		WRITELN <"    KEYBOARD_NECCESSARY = YES | NO">
		WRITELN <"       Indicates that successful allocation of the keyboard">
		WRITELN <"       is required.">
		WRITELN <" ">
		WRITELN <"    CIA[A..B]_TIMER[A..B] = decimal signed byte">
		WRITELN <"       Interrupt handlers. Activates associated handler hook. Priorities">
		WRITELN <"       from -128 to 127, of which 127 is the highest priority.">
		WRITELN <" ">
		WRITELN <"    INT_PORTS  = decimal signed byte">
		WRITELN <"    INT_VBLANK = decimal signed byte">
		WRITELN <"    INT_EXTER  = decimal signed byte">
		WRITELN <"    INT_COPPER = decimal signed byte">
		WRITELN <"       Interrupt servers. Activates associated handler hook.  Priorities">
		WRITELN <"       from -128 to 127, of which 127 is the highest priority.">
		WRITELN <" ">
		WRITELN <"    CACR_INST = 1 | 0 (v37)">
		WRITELN <"       1=Enabled/0=disabled instruction cache.">
		WRITELN <" ">
		WRITELN <"    CACR_IBE = 1 | 0 (v37)">
		WRITELN <"       1=Enabled/0=disabled instruction burst mode.">
		WRITELN <" ">
		WRITELN <"    CACR_DATA = 1 | 0 (v37)">
		WRITELN <"       1=Enabled/0=disabled data cache (valid on 68030 or greater).">
		WRITELN <" ">
		WRITELN <"    CACR_DBE = 1 | 0 (v37)">
		WRITELN <"       1=Enabled/0=disabled data burst mode (valid on 68030 or greater).">
		WRITELN <" ">
		WRITELN <"    CACR_COPYBACK = 1 | 0 (v37)">
		WRITELN <"       1=Enabled/0=disabled copyback cache mode (valid on 68040 or greater).">
		WRITELN <" ">
		WRITELN <"    CLOSEWB = YES | NO">
		WRITELN <"       The workbench will attempt to close (saving some chip memory).">
		WRITELN <" ">
		WRITELN <"    RETAPPWIN = YES | NO">
		WRITELN <"       Leave a 'return to application' window open at runtime.">
		WRITELN <" ">
		WRITELN <"    LANGUAGES = language,,,,">
		WRITELN <"       The specified languages are available to be chosen at startup time.">
		WRITELN <"       ENGLISH,FRENCH,GERMAN,ITALIAN and SPANISH are currently supported.">
		WRITELN <"       The default language will be whichever one you specify first.">
		WRITELN <"       If no languages are specified then the requester will not appear.">
		WRITELN <" ">
		WRITELN <"    PARAM[1..5] = decimal long">
		WRITELN <"       Parameter passed in register d1-d5 to main code.">
		WRITELN <" ">
		WRITELN <"    INFO = YES | NO">
		WRITELN <"       Displays system statistics.">
		WRITELN <" ">
		WRITELN <"    DEFAULT_CONTROL = MOUSE | JOYSTICK">
		WRITELN <" ">
		WRITELN <"    FROM = string">
		WRITELN <"       CLI option only. Uses tooltype options from specified info file.">

		moveq.l	#-1,d0
.error		rts

keyword_2_def	lea	code_filename(a5),a1
		bsr	get_string
		moveq.l	#0,d0
		rts

keyword_3_def	st.b	arg_info(a5)
		moveq.l	#0,d0
		rts

keyword_4_def	st.b	arg_unpack(a5)
		moveq.l	#0,d0
		rts

keyword_5_def	st.b	arg_relocate(a5)
		moveq.l	#0,d0
		rts

keyword_6_def	bsr	get_decimal_long
		move.l	d0,chip_amount(a5)
		moveq.l	#0,d0
		rts

keyword_7_def	st.b	arg_killsys(a5)
		moveq.l	#0,d0
		rts

keyword_8_def	or.w	#FLAGF_SERIAL,requested_flags(a5)
		moveq.l	#0,d0
		rts

keyword_9_def	or.w	#FLAGF_PARALLEL,requested_flags(a5)
		moveq.l	#0,d0
		rts

keyword_10_def	or.w	#FLAGF_POTGO,requested_flags(a5)
		moveq.l	#0,d0
		rts

keyword_11_def	or.w	#FLAGF_CLOSE_WBENCH,requested_flags(a5)
		moveq.l	#0,d0
		rts

keyword_12_def	bsr	get_decimal_long
		move.l	d0,any_amount(a5)
		moveq.l	#0,d0
		rts

keyword_13_def	bsr	get_decimal_long
		move.l	d0,temp_amount(a5)
		moveq.l	#0,d0
		rts

keyword_14_def	lea	languages(a5),a1
		bsr	get_string
		moveq.l	#0,d0
		rts

keyword_15_def	or.w	#FLAGF_CIAA_TA,requested_flags(a5)
		bsr	get_decimal_long
		move.b	d0,ciaa_ta_priority(a5)
		moveq.l	#0,d0
		rts

keyword_16_def	or.w	#FLAGF_CIAA_TB,requested_flags(a5)
		bsr	get_decimal_long
		move.b	d0,ciaa_tb_priority(a5)
		moveq.l	#0,d0
		rts

keyword_17_def	or.w	#FLAGF_CIAB_TA,requested_flags(a5)
		bsr	get_decimal_long
		move.b	d0,ciab_ta_priority(a5)
		moveq.l	#0,d0
		rts

keyword_18_def	or.w	#FLAGF_CIAB_TB,requested_flags(a5)
		bsr	get_decimal_long
		move.b	d0,ciab_tb_priority(a5)
		moveq.l	#0,d0
		rts

keyword_19_def	or.w	#FLAGF_AUDIO,requested_flags(a5)
		moveq.l	#0,d0
		rts

keyword_20_def	or.w	#FLAGF_INT_PORTS,requested_flags(a5)
		bsr	get_decimal_long
		move.b	d0,int_ports_priority(a5)
		moveq.l	#0,d0
		rts

keyword_21_def	or.w	#FLAGF_INT_VBLANK,requested_flags(a5)
		bsr	get_decimal_long
		move.b	d0,int_vblank_priority(a5)
		moveq.l	#0,d0
		rts

keyword_22_def	or.w	#FLAGF_INT_EXTER,requested_flags(a5)
		bsr	get_decimal_long
		move.b	d0,int_exter_priority(a5)
		moveq.l	#0,d0
		rts

keyword_23_def	or.w	#FLAGF_INT_COPPER,requested_flags(a5)
		bsr	get_decimal_long
		move.b	d0,int_copper_priority(a5)
		moveq.l	#0,d0
		rts

keyword_24_def	or.w	#FLAGF_INT_BLITTER,requested_flags(a5)
		bsr	get_decimal_long
		move.b	d0,int_blitter_priority(a5)
		moveq.l	#0,d0
		rts

keyword_25_def	bsr	get_decimal_long
		move.l	d0,param1(a5)
		moveq.l	#0,d0
		rts

keyword_26_def	bsr	get_decimal_long
		move.l	d0,param2(a5)
		moveq.l	#0,d0
		rts

keyword_27_def	bsr	get_decimal_long
		move.l	d0,param3(a5)
		moveq.l	#0,d0
		rts

keyword_28_def	bsr	get_decimal_long
		move.l	d0,param4(a5)
		moveq.l	#0,d0
		rts

keyword_29_def	or.w	#FLAGF_FLOPPY,requested_flags(a5)
		moveq.l	#0,d0
		rts

keyword_30_def	lea	data_filename(a5),a1
		bsr	get_string
		moveq.l	#0,d0
		rts

keyword_32_def	st.b	arg_retappwin(a5)
		moveq.l	#0,d0
		rts

keyword_33_def	bsr	get_decimal_long
		move.l	d0,ramdisk_amount(a5)
		moveq.l	#0,d0
		rts

keyword_34_def	bsr	get_decimal_long
		move.l	d0,exchip_amount(a5)
		moveq.l	#0,d0
		rts

keyword_35_def	bsr	get_decimal_long
		move.l	d0,exany_amount(a5)
		moveq.l	#0,d0
		rts

keyword_36_def	or.l	#CACRF_EnableI,changed_cacr(a5)
		bsr	get_decimal_long
		tst.l	d0
		beq.s	.clear
		or.l	#CACRF_EnableI,new_cacr(a5)
.clear		moveq.l	#0,d0
		rts

keyword_37_def	or.l	#CACRF_IBE,changed_cacr(a5)
		bsr	get_decimal_long
		tst.l	d0
		beq.s	.clear
		or.l	#CACRF_IBE,new_cacr(a5)
.clear		moveq.l	#0,d0
		rts

keyword_38_def	or.l	#CACRF_EnableD,changed_cacr(a5)
		bsr	get_decimal_long
		tst.l	d0
		beq.s	.clear
		or.l	#CACRF_EnableD,new_cacr(a5)
.clear		moveq.l	#0,d0
		rts

keyword_39_def	or.l	#CACRF_DBE,changed_cacr(a5)
		bsr	get_decimal_long
		tst.l	d0
		beq.s	.clear
		or.l	#CACRF_DBE,new_cacr(a5)
.clear		moveq.l	#0,d0
		rts

keyword_40_def	or.l	#CACRF_CopyBack,changed_cacr(a5)
		bsr	get_decimal_long
		tst.l	d0
		beq.s	.clear
		or.l	#CACRF_CopyBack,new_cacr(a5)
.clear		moveq.l	#0,d0
		rts

keyword_41_def	st.b	exchip_neccessary(a5)
		moveq.l	#0,d0
		rts

keyword_42_def	st.b	exany_neccessary(a5)
		moveq.l	#0,d0
		rts

keyword_43_def	lea	execute_filename(a5),a1
		bsr	get_string
		moveq.l	#0,d0
		rts

keyword_44_def	st.b	parallel_neccessary(a5)
		moveq.l	#0,d0
		rts

keyword_45_def	st.b	keyboard_neccessary(a5)
		moveq.l	#0,d0
		rts

keyword_46_def	or.w	#FLAGF_KEYBOARD,requested_flags(a5)
		moveq.l	#0,d0
		rts

keyword_47_def	lea	default_controls(a5),a1
		bsr	get_string

		lea	default_controls(a5),a0
		lea	control0,a1
		jsr	search_string
		cmp.l	#0,a0
		beq.s	.no_mouse
		move.b	#MOUSE,default_control(a5)
.no_mouse
		lea	default_controls(a5),a0
		lea	control1,a1
		jsr	search_string
		cmp.l	#0,a0
		beq.s	.no_joystick
		move.b	#JOYSTICK,default_control(a5)
.no_joystick
		moveq.l	#0,d0
		rts

keyword_48_def	lea	from_filename(a5),a1
		bsr	get_string
		moveq.l	#0,d0
		rts

****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:       d0-d3/a0-a2

wbench_parse_args
		tst.b	from_filename(a5)	;really running from cli?
		beq.s	.not_from_cli		;no, then branch
		lea	from_filename(a5),a0
		bra.s	.from_cli
.not_from_cli

		move.l	wbench_message(a5),a2
		cmpi.l	#2,sm_NumArgs(a2)
		blt	.no_error
		move.l	sm_ArgList(a2),a2
		add.l	#wa_SIZEOF,a2

		move.l	wa_Name(a2),a0
		lea	code_filename(a5),a1
		move.w	#NAME_SIZE,d0
		jsr	_STCopyString
		tst.l	d0
		bne	.error

		move.l	wa_Lock(a2),d1
		move.l	dos_base(a5),a6
		JSRLIB	CurrentDir

		lea	code_filename(a5),a0
.from_cli
		move.l	icon_base(a5),a6
		JSRLIB	GetDiskObject
		move.l  d0,code_dob(a5)
		bne.s	.disk_object_ok
		move.l	#42,d0			;error number 42
		bra.s	.error
.disk_object_ok
		bsr	scan_tool_types

.no_error	moveq.l	#0,d0

.error		tst.l   code_dob(a5)
		beq.s	.no_disk_object
		move.l	d0,-(sp)
		move.l	code_dob(a5),a0
		move.l	icon_base(a5),a6
		JSRLIB	FreeDiskObject
		move.l	(sp)+,d0
.no_disk_object
		rts


hello		dc.b	"hello",0

scan_tool_types	lea	cli_keyword_defs(pc),a3

.next_tool_type	tst.b	(a3)
		bmi	.end_tool_types

		move.l	code_dob(a5),a0
		move.l	do_ToolTypes(a0),a0
		move.l	a3,a1
		move.l	icon_base(a5),a6
		JSRLIB	FindToolType
		move.l	d0,a0

.find_end_keyword
		tst.b	(a3)+
		bne.s	.find_end_keyword
.found		move.l	a3,d1
		btst.l	#0,d1
		beq.s	.even
		add.w	#1,a3
.even		move.b	(a3)+,d1
		rol.l	#8,d1
		move.b	(a3)+,d1
		rol.l	#8,d1
		move.b	(a3)+,d1
		rol.l	#8,d1
		move.b	(a3)+,d1

		cmpa.l	#0,a0
		beq	.next_tool_type

		movem.l	a0/d1,-(sp)
		lea	negative_tooltype,a1
		move.l	icon_base(a5),a6
		JSRLIB	MatchToolValue
		movem.l	(sp)+,a0/d1

		tst.l	d0
		bne.s	.next_tool_type

		move.l	d1,a1
		pea	.next_tool_type
		jmp	(a1)
.error
.end_tool_types	rts

****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;               a0.l=address of source
;		a1.l=address of destination
;		d0.l=maximum number of characters to copy
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:       none

_STCopyString
		movem.l	d1-d7/a0-a6,-(sp)

		subq.w	#1,d0
.loop		move.b	(a0)+,(a1)+
		beq.s	.no_error
		dbf	d0,.loop
		move.l	#26,d0			;error number 26
		bra.s	.error

.no_error	moveq.l	#0,d0
.error		movem.l	(sp)+,d1-d7/a0-a6
		rts

****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;               a0.l=address of command line
;		a1.l=address of output string
;OUTPUT:	a0.l=address of character after next keyword
;CHANGES:	d0-d1,a1

get_string
		move.b	#" ",d1		;default terminator

.find_start
		move.b	(a0)+,d0
		cmpi.b	#EOL,d0
		beq.s	.end
		cmpi.b	#" ",d0
		ble.s	.find_start

		cmpi.b	#34,d0
		bne.s	.not_new_terminator_34
		move.b	d0,d1
		bra.s	.new_terminator
.not_new_terminator_34

.next_letter	move.b	d0,(a1)+
.new_terminator
		move.b	(a0)+,d0
		beq.s	.end
		cmpi.b	#EOL,d0
		beq.s	.end
		cmp.b	d0,d1
		bne.s	.next_letter

.end		move.b	#0,(a1)
		rts

****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;               a0.l=address of input string
;OUTPUT:	d0.l=value
;               a0.l=address of string after value
;CHANGES:	none

get_decimal_long
		movem.l	d1-d2,-(sp)

		moveq.l	#0,d0
		moveq.l	#0,d1

.positive
.find_start	move.b	(a0)+,d1
		cmpi.b	#EOL,d1
		beq.s	.end
		cmpi.b	#"-",d1
		beq.s	.negative
		cmpi.b	#"0",d1
		blt.s	.find_start
		cmpi.b	#"9",d1
		bgt.s	.find_start

.next_digit	subi.b	#"0",d1
		add.l	d1,d0

		move.b	(a0)+,d1
		cmpi.b	#"0",d1
		blt.s	.end
		cmpi.b	#"9",d1
		bgt.s	.end

		move.l	d0,d2			;multiply d0 by 10
		lsl.l	#3,d0
		add.l	d2,d0
		add.l	d2,d0
		bra.s	.next_digit

.end		sub.w	#1,a0
		movem.l	(sp)+,d1-d2
		rts

.negative
.find_neg_start	move.b	(a0)+,d1
		cmpi.b	#EOL,d1
		beq.s	.neg_end
		cmpi.b	#"-",d1
		beq.s	.positive
		cmpi.b	#"0",d1
		blt.s	.find_neg_start
		cmpi.b	#"9",d1
		bgt.s	.find_neg_start

.next_neg_digit	subi.b	#"0",d1
		sub.l	d1,d0

		move.b	(a0)+,d1
		cmpi.b	#"0",d1
		blt.s	.neg_end
		cmpi.b	#"9",d1
		bgt.s	.neg_end

		move.l	d0,d2			;multiply d0 by 10
		lsl.l	#3,d0
		add.l	d2,d0
		add.l	d2,d0
		bra.s	.next_neg_digit

.neg_end	sub.w	#1,a0
		movem.l	(sp)+,d1-d2
		rts

****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;               a0.l=address of input string
;OUTPUT:	d0.l=value
;               a0.l=address of string after value
;CHANGES:	none

get_hex_long
		move.l	d1,-(sp)

		moveq.l	#0,d0
		moveq.l	#0,d1

.find_start	move.b	(a0)+,d1
		cmpi.b	#EOL,d1
		beq.s	.end
		cmpi.b	#"0",d1
		blt.s	.find_start
		cmpi.b	#"F",d1
		bgt.s	.find_start
		cmpi.b	#"9",d1
		ble.s	.next_digit
		cmpi.b	#"A",d1
		bge.s	.next_digit
		bra.s	.find_start

.next_digit	subi.b	#"0",d1
		add.l	d1,d0

		move.b	(a0)+,d1
		cmpi.b	#"0",d1
		blt.s	.end
		cmpi.b	#"9",d1
		bgt.s	.end
		cmpi.b	#"9",d1
		ble.s	.add_digit
		cmpi.b	#"A",d1
		bge.s	.add_digit
		bra.s	.end

.add_digit	lsl.l	#4,d0
		bra.s	.next_digit

.end		sub.w	#1,a0
		move.l	(sp)+,d1
		rts

****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;               a0.l=address of command line
;OUTPUT:	a0.l=address of character after next keyword
;		d3.l=address of keyword function routine (0=no keywords)
;CHANGES:	none

get_next_arg
		movem.l	a1-a2/d1-d2,-(sp)

		moveq.l	#0,d0

.next_argument	cmpi.b	#EOL,(a0)
		beq.s	.not_found
		cmpi.b	#" ",(a0)+
                ble.s	.next_argument
		sub.w	#1,a0
		move.l	a0,a2
		lea	cli_keyword_defs(pc),a1

.next_letter	move.b	(a0)+,d1
		move.b	(a1)+,d2
		beq.s	.found
		cmp.b	d1,d2
		beq.s	.next_letter
		cmp.b	#97,d2
		blt.s	.next_keyword
		sub.b	#32,d2
		cmp.b	d1,d2
		beq.s	.next_letter

.next_keyword	tst.b	(a1)+
		bne.s	.next_keyword
		move.l	a1,d1
		btst.l	#0,d1
		beq.s	.even
		add.w	#1,a1
.even		add.w	#4,a1
		tst.b	(a1)
		bmi.s	.unrecognised
		move.l	a2,a0
		bra.s	.next_letter

.unrecognised	moveq.l	#-1,d0
		bra.s	.not_found

.found		move.l	a1,d1
		btst.l	#0,d1
		beq.s	.even2
		add.w	#1,a1
.even2		move.b	(a1)+,d0
		rol.l	#8,d0
		move.b	(a1)+,d0
		rol.l	#8,d0
		move.b	(a1)+,d0
		rol.l	#8,d0
		move.b	(a1)+,d0
		sub.w	#1,a0

.not_found	movem.l	(sp)+,a1-a2/d1-d2
		rts

****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

output_copyright_message
		lea	.version,a0
		move.l	a0,d2
		jsr	_STOutput
		tst.l	d0
		bne	.error

		WRITELN	<"Copyright © Scott Johnston 1991, 92">
		WRITELN	<"All rights reserved worldwide">

		moveq.l	#0,d0			;no error
.error		rts

.version	VERSION
		dc.b	0
		even

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		none
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

_STExecute
		tst.b	execute_filename(a5)
		beq.s	.no_file

		lea	execute_filename(a5),a0
		move.l	a0,d1
;		lea	.execute_tags(pc),a0
;		move.l	a0,d2
		clr.l	d2

		move.l	dos_base(a5),a6
		JSRLIB	SystemTagList

		tst.l	d0
		beq.s	.no_error
		moveq.l	#66,d0			;error number 66
		rts
.no_error
.no_file	moveq.l	#0,d0
		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

_STCloseConsole
		movem.l	d1-d7/a0-a6,-(sp)

		tst.l	console_handle(a5)
		beq.s	.no_console

		jsr	wait_for_return
		tst.l	d0
		bne.s	.error

		move.l	a5,-(sp)
		move.l	console_handle(a5),d1
		move.l	dos_base(a5),a6
		JSRLIB	Close
		move.l	(sp)+,a5

		clr.l	console_handle(a5)
		clr.l	stdout_handle(a5)
		clr.l	stdin_handle(a5)

.no_console	moveq.l	#0,d0			;no error
.error		movem.l	(sp)+,d1-d7/a0-a6
		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:       d1

wait_for_return
		WRITELN	<"PRESS RETURN TO CONTINUE">

		move.l	a5,-(sp)
		move.l	stdin_handle(a5),d1
		move.l	#key_buffer,d2
		move.l	#1,d3
		move.l	dos_base(a5),a6
		JSRLIB	Read
		move.l	(sp)+,a5

		moveq.l	#0,d0			;no error
.error		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

_STOpenResources
		movem.l	d1-d7/a0-a6,-(sp)

		move.l	_SysBase,a6

;--- open misc.resource --------------------------------------------------------
		lea	serial_name,a1
		bsr	flush_device

		lea	misc_name,a1
		JSRLIB	OpenResource
		move.l	d0,misc_base(a5)
		bne.s	.opened_misc_resource
		moveq.l	#4,d0			;error number 4
                bra	.error
.opened_misc_resource

;--- open ciaa.resource --------------------------------------------------------
		lea	ciaa_name,a1
		JSRLIB	OpenResource
		move.l	d0,ciaa_base(a5)
		bne.s	.opened_ciaa_resource
		move.l	#49,d0			;error number 49
                bra	.error
.opened_ciaa_resource

;--- open ciab.resource --------------------------------------------------------
		lea	ciab_name,a1
		JSRLIB	OpenResource
		move.l	d0,ciab_base(a5)
		bne.s	.opened_ciab_resource
		move.l	#59,d0			;error number 59
                bra	.error
.opened_ciab_resource

		moveq.l	#0,d0			;no error
.error		movem.l	(sp)+,d1-d7/a0-a6
		rts

********************************************************************************
;INPUT:		a1=address of name of device (long)
;OUTPUT:	none
;CHANGES:	none

flush_device
		move.l	_SysBase,a6		;disable task switching
		JSRLIB	Forbid

		move.l	_SysBase,a0		;find serial device
		add.l	#DeviceList,a0
		move.l  (a0),a0
		move.l	_SysBase,a6
		JSRLIB	FindName

		tst.l	d0
		beq.s	.device_not_found	;return of device not found

                move.l	d0,a1			;flush device
		move.l	_SysBase,a6
		JSRLIB	RemDevice

.device_not_found
		move.l	_SysBase,a6		;permit task switching
		JSRLIB	Permit

		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

_STSystemConfig
		movem.l	d1-d7/a0-a6,-(sp)

		move.l	_SysBase,a6

;--- modify CACR ---------------------------------------------------------------
		cmpi.w	#37,LIB_VERSION(a6)
		blt.s	.too_old
		move.l	new_cacr(a5),d0
		or.l	#CACRF_WriteAllocate!CACRF_ClearI!CACRF_ClearD,d0
		move.l	changed_cacr(a5),d1
		or.l	#CACRF_WriteAllocate!CACRF_ClearI!CACRF_ClearD,d1
		JSRLIB	CacheControl
		move.l	d0,old_cacr(a5)
.too_old

		move.l	#0,d2
		bsr	open_drive
		tst.l	d0
		bne.s	.drive_0_failed
		or.w	#CNFGF_DF0,config(a5)
.drive_0_failed

		move.l	#1,d2
		bsr	open_drive
		tst.l	d0
		bne.s	.drive_1_failed
		or.w	#CNFGF_DF1,config(a5)
.drive_1_failed

		move.l	#2,d2
		bsr	open_drive
		tst.l	d0
		bne.s	.drive_2_failed
		or.w	#CNFGF_DF2,config(a5)
.drive_2_failed

		move.l	#3,d2
		bsr	open_drive
		tst.l	d0
		bne.s	.drive_3_failed
		or.w	#CNFGF_DF3,config(a5)
.drive_3_failed
		moveq.l	#0,d0			;no error
.error		movem.l	(sp)+,d1-d7/a0-a6
		rts

********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;		d2.l=unit number (0-3)
;OUTPUT:	d0.l=result (0=ok, -1=failed)
;CHANGES:	none
open_drive
		move.l	#0,-(sp)		;push priority
		move.l	#0,-(sp)                ;push name
		jsr	_CreatePort
		addq.l	#8,sp			;balance stack
		move.l	d0,trackmp(a5)
		beq	.error

		move.l	#IOTD_SIZE,-(sp)	;push structure size
		move.l	d0,-(sp)		;push mesg port pointer
		jsr	_CreateExtIO
		addq.l	#8,sp			;balance stack
		move.l	d0,trackio(a5)
		beq	.error2

		lea	trackdisk_name,a0	;device name
		move.l	d0,a1			;iorequest
		move.l	d2,d0			;unit number
		move.l	#0,d1			;flags (only 3.5 drives)
		move.l	_SysBase,a6
		JSRLIB	OpenDevice
		tst.l	d0
		bne.s	.error1

		WRITEZEROINFO_IF_INFO <"{found drive">,<"00000000}">,d2

		move.l	trackio(a5),a1		;iorequest
		JSRLIB	CloseDevice

		move.l	trackio(a5),-(sp)	;push iorequest pointer
		jsr	_DeleteExtIO
		addq.l	#4,sp			;balance stack

		move.l	trackmp(a5),-(sp)	;push mesg port pointer
		jsr	_DeletePort
		addq.l	#4,sp			;balance stack

		moveq.l	#0,d0
		rts

.error1		move.l	trackio(a5),-(sp)	;push iorequest pointer
		jsr	_DeleteExtIO
		addq.l	#4,sp			;balance stack

.error2		move.l	trackmp(a5),-(sp)	;push mesg port pointer
		jsr	_DeletePort
		addq.l	#4,sp			;balance stack

.error		moveq.l	#-1,d0
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

_STOpenDevices
		movem.l	d1-d7/a0-a6,-(sp)

		move.w	requested_flags(a5),d0
		btst.l	#FLAGB_AUDIO,d0
		beq.s	.audio_ok
		bsr	open_audio_device
		tst.l	d0
		beq.s	.audio_ok
		moveq.l	#9,d0			;error number 9
		bra	.error
.audio_ok
		move.w	requested_flags(a5),d0
		btst.l	#FLAGB_KEYBOARD,d0
		beq.s	.keyboard_ok
		bsr	open_keyboard_device
		tst.l	d0
		beq.s	.keyboard_ok
		tst.b	keyboard_neccessary(a5)
		beq.s	.keyboard_ok
		moveq.l	#67,d0			;error number 67
		bra	.error
.keyboard_ok
		moveq.l	#0,d0			;no error
.error		movem.l	(sp)+,d1-d7/a0-a6
		rts

;-------------------------------------------------------------------------------

open_audio_device
		move.l	#0,-(sp)		;push priority
		move.l	#0,-(sp)                ;push name
		jsr	_CreatePort
		addq.l	#8,sp			;balance stack
		move.l	d0,audio_device_mp(a5)
		beq	.error

		move.l	#ioa_SIZEOF,d0
		move.l	#MEMF_PUBLIC!MEMF_CLEAR,d1
		move.l	_SysBase,a6
		JSRLIB	AllocMem
		move.l	d0,audio_device_io(a5)
		beq	.error

		move.l	d0,a0
		move.l	audio_device_mp(a5),MN_REPLYPORT(a0)
		clr.w	ioa_AllocKey(a0)
		move.b	#127,LN_PRI(a0)
		lea	audio_chans,a1
		move.l	a1,ioa_Data(a0)
		move.l	#audio_chans_size-audio_chans,ioa_Length(a0)

		lea	audio_name,a0		;device name
		move.l	d0,a1			;iorequest
		clr.l	d0			;unused
		clr.l	d1			;unused
		JSRLIB	OpenDevice
		tst.l	d0
		bne.s	.error

		ori.w	#FLAGF_AUDIO,installed_flags(a5)
		WRITELN_IF_INFO <"{opened audio.device}">

		moveq.l	#0,d0
		rts

.error		moveq.l	#-1,d0
		rts

;-------------------------------------------------------------------------------

open_keyboard_device
		move.l	#0,-(sp)		;push priority
		move.l	#0,-(sp)                ;push name
		jsr	_CreatePort
		addq.l	#8,sp			;balance stack
		move.l	d0,keyboard_device_mp(a5)
		beq	.error

		move.l	#IOSTD_SIZE,d0
		move.l	#MEMF_PUBLIC!MEMF_CLEAR,d1
		move.l	_SysBase,a6
		JSRLIB	AllocMem
		move.l	d0,keyboard_device_io(a5)
		beq	.error

		lea	keyboard_name,a0	;device name
		move.l	d0,a1			;iorequest
		clr.l	d0			;unused
		clr.l	d1			;unused
		JSRLIB	OpenDevice
		tst.l	d0
		bne.s	.error

		ori.w	#FLAGF_KEYBOARD,installed_flags(a5)
		WRITELN_IF_INFO <"{opened keyboard.device}">

		moveq.l	#0,d0
		rts

.error		moveq.l	#-1,d0
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	none
;CHANGES:	none

_STCloseDevices
		movem.l	d0-d7/a0-a6,-(sp)

		bsr	close_audio_device
		bsr	close_keyboard_device

		movem.l	(sp)+,d0-d7/a0-a6
		rts

;-------------------------------------------------------------------------------

close_audio_device
		move.l	_SysBase,a6

		move.w	installed_flags(a5),d0
		btst.l	#FLAGB_AUDIO,d0
		beq.s	.device_not_open

		move.l	audio_device_io(a5),a1
		JSRLIB	CloseDevice
		eori.w	#FLAGF_AUDIO,installed_flags(a5)
.device_not_open

		tst.l	audio_device_io(a5)
		beq.s	.no_io_request

		move.l	audio_device_io(a5),a1
		move.l	#ioa_SIZEOF,d0
		JSRLIB	FreeMem
		clr.l	audio_device_io(a5)
.no_io_request

		tst.l	audio_device_mp(a5)
		beq.s	.no_mesg_port

		move.l	audio_device_mp(a5),-(sp)
		jsr	_DeletePort
		addq.l	#4,sp
		clr.l	audio_device_mp(a5)
.no_mesg_port
		rts

;-------------------------------------------------------------------------------

close_keyboard_device
		move.l	_SysBase,a6

		move.w	installed_flags(a5),d0
		btst.l	#FLAGB_KEYBOARD,d0
		beq.s	.device_not_open

		move.l	keyboard_device_io(a5),a1
		JSRLIB	CloseDevice
		eori.w	#FLAGF_KEYBOARD,installed_flags(a5)
.device_not_open

		tst.l	keyboard_device_io(a5)
		beq.s	.no_io_request

		move.l	keyboard_device_io(a5),a1
		move.l	#IOSTD_SIZE,d0
		JSRLIB	FreeMem
		clr.l	keyboard_device_io(a5)
.no_io_request

		tst.l	keyboard_device_mp(a5)
		beq.s	.no_mesg_port

		move.l	keyboard_device_mp(a5),-(sp)
		jsr	_DeletePort
		addq.l	#4,sp
		clr.l	keyboard_device_mp(a5)
.no_mesg_port
		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

_STOpenLibraries
		movem.l	d1-d7/a0-a6,-(sp)

		move.l	a5,-(sp)		;open graphics library
		lea	graphics_name,a1
		moveq.l	#MIN_LIB_VERSION,d0
		move.l	_SysBase,a6
		JSRLIB	OpenLibrary
		move.l	(sp)+,a5
		move.l	d0,graphics_base(a5)
		bne.s	.opened_graphics
		moveq.l	#1,d0			;error number 1
		bra	.error
.opened_graphics
		move.l	graphics_base(a5),a0
		moveq.l	#0,d0
		move.w	LIB_VERSION(a0),d0
		move.l	d0,graphics_version(a5)

		move.l	a5,-(sp)		;open intuition library
		lea	intuition_name,a1
		moveq.l	#MIN_LIB_VERSION,d0
		move.l	_SysBase,a6
		JSRLIB	OpenLibrary
		move.l	(sp)+,a5
		move.l	d0,intuition_base(a5)
		bne.s	.opened_intuition
		moveq.l	#2,d0			;error number 2
		bra	.error
.opened_intuition
		move.l	intuition_base(a5),a0
		moveq.l	#0,d0
		move.w	LIB_VERSION(a0),d0
		move.l	d0,intuition_version(a5)

		move.l	a5,-(sp)		;open dos library
		lea	dos_name,a1
		moveq.l	#MIN_LIB_VERSION,d0
		move.l	_SysBase,a6
		JSRLIB	OpenLibrary
		move.l	(sp)+,a5
		move.l	d0,dos_base(a5)
		bne.s	.opened_dos
		moveq.l	#3,d0			;error number 3
		bra	.error
.opened_dos
		move.l	dos_base(a5),a0
		moveq.l	#0,d0
		move.w	LIB_VERSION(a0),d0
		move.l	d0,dos_version(a5)

		move.l	a5,-(sp)		;open icon library
		lea	icon_name,a1
		moveq.l	#MIN_LIB_VERSION,d0
		move.l	_SysBase,a6
		JSRLIB	OpenLibrary
		move.l	(sp)+,a5
		move.l	d0,icon_base(a5)
		bne.s	.opened_icon
		moveq.l	#12,d0			;error number 12
		bra.s	.error
.opened_icon
		move.l	icon_base(a5),a0
		moveq.l	#0,d0
		move.w	LIB_VERSION(a0),d0
		move.l	d0,icon_version(a5)

		move.l	a5,-(sp)		;open lowlevel library
		lea	lowlevel_name,a1
		moveq.l	#MIN_LIB_VERSION,d0
		move.l	_SysBase,a6
		JSRLIB	OpenLibrary
		move.l	(sp)+,a5
		move.l	d0,lowlevel_base(a5)
		bne.s	.opened_lowlevel
		moveq.l	#68,d0			;error number 68
		bra.s	.error
.opened_lowlevel
		move.l	lowlevel_base(a5),a0
		moveq.l	#0,d0
		move.w	LIB_VERSION(a0),d0
		move.l	d0,lowlevel_version(a5)

		move.l	a5,-(sp)		;open nonvolatile library
		lea	nonvolatile_name,a1
		moveq.l	#MIN_LIB_VERSION,d0
		move.l	_SysBase,a6
		JSRLIB	OpenLibrary
		move.l	(sp)+,a5
		move.l	d0,nonvolatile_base(a5)
		bne.s	.opened_nonvolatile
		moveq.l	#69,d0			;error number 69
		bra.s	.error
.opened_nonvolatile
		move.l	nonvolatile_base(a5),a0
		moveq.l	#0,d0
		move.w	LIB_VERSION(a0),d0
		move.l	d0,nonvolatile_version(a5)

		moveq.l	#0,d0			;no errors
.error		movem.l	(sp)+,d1-d7/a0-a6
		rts

****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	none
;CHANGES:	none

_STCloseLibraries
		movem.l	d0-d7/a0-a6,-(sp)

		tst.l	nonvolatile_base(a5)
		beq.s	.skip_nonvolatile
		move.l	a5,-(sp)		;close nonvolatile library
		move.l	nonvolatile_base(a5),a1
		move.l	_SysBase,a6
		JSRLIB	CloseLibrary
		move.l	(sp)+,a5
		clr.l	nonvolatile_base(a5)
.skip_nonvolatile

		tst.l	lowlevel_base(a5)
		beq.s	.skip_lowlevel
		move.l	a5,-(sp)		;close lowlevel library
		move.l	lowlevel_base(a5),a1
		move.l	_SysBase,a6
		JSRLIB	CloseLibrary
		move.l	(sp)+,a5
		clr.l	lowlevel_base(a5)
.skip_lowlevel

		tst.l	icon_base(a5)
		beq.s	.skip_icon
		move.l	a5,-(sp)		;close icon library
		move.l	icon_base(a5),a1
		move.l	_SysBase,a6
		JSRLIB	CloseLibrary
		move.l	(sp)+,a5
		clr.l	icon_base(a5)
.skip_icon

		tst.l	dos_base(a5)
		beq.s	.skip_dos
		move.l	a5,-(sp)		;close dos library
		move.l	dos_base(a5),a1
		move.l	_SysBase,a6
		JSRLIB	CloseLibrary
		move.l	(sp)+,a5
		clr.l	dos_base(a5)
.skip_dos

		tst.l	intuition_base(a5)
		beq.s	.skip_intuition
		move.l	a5,-(sp)		;close intuition library
		move.l	intuition_base(a5),a1
		move.l	_SysBase,a6
		JSRLIB	CloseLibrary
		move.l	(sp)+,a5
		clr.l	intuition_base(a5)
.skip_intuition

		tst.l	graphics_base(a5)
		beq.s	.skip_graphics
		move.l	a5,-(sp)		;close graphics library
		move.l	graphics_base(a5),a1
		move.l	_SysBase,a6
		JSRLIB	CloseLibrary
		move.l	(sp)+,a5
		clr.l	graphics_base(a5)
.skip_graphics

		movem.l	(sp)+,d0-d7/a0-a6
		rts

****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;		a0.l=address of string to search
;		a1.l=address of string to search for
;OUTPUT:	a0.l=address in string of match (0=no match)
;CHANGES:	none

search_string
		movem.l	a1-a3,-(sp)

		tst.b	(a0) 			;empty string to search
		beq.s	.not_found
		tst.b	(a1) 			;empty string to search for
		beq.s	.not_found

.research	move.l	a0,a2
		move.l	a1,a3

.next_matching_letter
		tst.b	(a3)
		beq.s	.found
		tst.b	(a2)
		beq.s	.not_found
		cmp.b	(a2)+,(a3)+
		beq.s	.next_matching_letter
		move.l	a2,a0
		bra.s	.research

.not_found	suba.l	a0,a0
.found		movem.l	(sp)+,a1-a3
		rts

****************************************************************************
****************************************************************************
****************************************************************************

graphics_name		dc.b	"graphics.library",0
intuition_name		dc.b	"intuition.library",0
dos_name		dc.b	"dos.library",0
icon_name		dc.b	"icon.library",0
lowlevel_name		dc.b	"lowlevel.library",0
nonvolatile_name	dc.b	"nonvolatile.library",0
expansion_name		dc.b	"expansion.library",0
misc_name		dc.b	"misc.resource",0
potgo_name		dc.b	"potgo.resource",0
ciaa_name		dc.b	"ciaa.resource",0
ciab_name		dc.b	"ciab.resource",0
serial_name		dc.b	"serial.device",0
parallel_name		dc.b	"parallel.device",0
audio_name		dc.b	"audio.device",0
trackdisk_name		dc.b	"trackdisk.device",0
keyboard_name		dc.b	"keyboard.device",0
console_name		dc.b	"con:0/0/640/200/System Takeover Output",0

control0	dc.b	"MOUSE",0
control1	dc.b	"JOYSTICK",0

audio_chans	dc.b	15			;try for all channels
audio_chans_size
		even

_SysBase	dc.l	0

		even

********************************************************************************
********************************************************************************
********************************************************************************

default_font
		dc.l	.text		;name
		dc.w	TOPAZ_EIGHTY	;y size
		dc.b	FS_NORMAL	;style
		dc.b	FPF_ROMFONT	;flags

.text		dc.b	"topaz.font",0
		even

program_name	dc.b	"SystemTakeover",0

screen_title	VERSION
		dc.b	" Copyright © Scott Johnston 1991-93",0

negative_tooltype
		dc.b	"NO",0
		even

key_buffer	ds.w	1

		dc.b	"$VER: "	;embedded version id
		VERSION
		dc.b	$a,$d,0

		even

********************************************************************************
* END OF Takeover.s
********************************************************************************

		end
