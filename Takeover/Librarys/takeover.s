;script assemble
;devpac3-2.0:devpac/genam >ram:errors.txt ram:test.s
;script after
;;copy ram:test "3dgame:diskdata/disk1/utilities/System Takeover"
;;copy ram:test "hired guns disk 1:utilities/System Takeover"
;script end

********************************************************************************
*
*	System Takeover
*	Last update 8th August 1992
*
*	(C) Copyright 1992 by Scott Johnston
*	All rights reserved worldwide
*
********************************************************************************

;Fully Amiga DOS & Intuition compliant
;CLI and tooltype switches ("unpack", "relocate", "info")
;Technical information output facility
;Allocates the following resources....
;	Misc.resource (serial and parallel port)
;	Potgo.resource (joystick ports)
;Allocates chunks of chip and public memory or
; alternatively allocates physical memory areas (killing system).
;High priority level 2,3 & 6 interrupt servers.
;Extensive error handling and message output (to requestor, cli or alert)

****************************************************************************
****************************************************************************
****************************************************************************

;		opt	o+,ow-,d+,LINE		;development options
		opt	o+,ow-			;distribution options

		output	ram:test

INTUI_V36_NAMES_ONLY	equ	0

		incdir	include_i:

		include	"source:takeover/takeoverbase.i"
		include	"source:takeover/takeover_lib.i"

		include	exec/types.i
		include	hardware/intbits.i
		include	hardware/custom.i
		include	hardware/cia.i
		include	exec/interrupts.i
		include	exec/exec_lib.i
		include	exec/execbase.i
		include	exec/memory.i
		include	exec/nodes.i
		include	workbench/startup.i
		include	graphics/graphics_lib.i
		include	graphics/gfx.i
		include	graphics/gfxbase.i
		include	intuition/screens.i
		include	intuition/intuition_lib.i
		include	intuition/intuition.i
		include	resources/misc.i
		include	resources/potgo_lib.i
		include	resources/cia_lib.i
		include	resources/disk_lib.i
		include	dos/dos_lib.i
		include	dos/dos.i
		include	dos/dosextens.i

****************************************************************************
****************************************************************************
****************************************************************************

		section	Takeover,code_c

main_program
		lea	parameters,a5
		jsr	_STInitialise

		jsr	_STOpenLibraries
		tst.l	d0
		bne.s	.error

		jsr	_STOpenStdout
		tst.l	d0
		bne.s	.error

		jsr	_STParseArgs
		tst.l	d0
		bne.s	.error

		st.b	arg_info(a5)
		st.b	arg_relocate(a5)
		st.b	arg_unpack(a5)

		jsr	_STAllocateResources
		tst.l	d0
		bne.s	.error

		jsr	_STFileInfo
		tst.l	d0
		bne.s	.error

		tst.b	arg_info(a5)
		beq.s	.no_info
		jsr	_STInfo
		tst.l	d0
		bne.s	.error
		bra.s	.exit
.no_info
		tst.b	mem_alloc_failed(a5)
		beq.s	.mem_alloc_ok
		jsr	_STHostileExecute	;!!! never returns !!!
		bra.s	.cont
.mem_alloc_ok	jsr	_STFriendlyExecute
.cont		tst.l	d0
		bne.s	.error

		tst.l	d0
		beq.s	.exit
.error		jsr	_STOutputError
.exit		jsr	_STDeallocateResources
		jsr	_STCloseConsole
		jsr	_STCloseLibraries
		moveq.l	#0,d0
		rts

****************************************************************************
****************************************************************************
****************************************************************************

		dc.b	"$VER: System Takeover V1.1",$a,$d,0
		even

MAX_ERROR_CODES	equ     41
NAME_SIZE	equ	160
TITLE_SIZE	equ	16
EOL		equ	10

ITEXT           MACRO
		dc.b	AUTOFRONTPEN		;front pen
                dc.b	AUTOBACKPEN		;back pen
		dc.b	AUTODRAWMODE		;draw mode
		dc.b	0			;pad
		dc.w	AUTOLEFTEDGE+\1		;left edge
		dc.w	AUTOTOPEDGE+\2		;top edge
		dc.l	AUTOITEXTFONT		;font
		dc.l    .message\@		;text
		dc.l	\4			;next itext
.message\@	dc.b	\3,0
		even
                ENDM

;initialised by user !!! Must be longword aligned !!!

 STRUCTURE	SystemTakeoverBase,0
	STRUCT	code_title,TITLE_SIZE	;title of program

	ULONG	chip_chunk_min_amount	;required minimum chip mem (bytes)
	ULONG	public_chunk_min_amount	;required minimum public mem (bytes)
	ULONG	chip_chunk_max_amount	;required maximum chip mem (bytes)
	ULONG	public_chunk_max_amount	;required maximum public mem (bytes)
	ULONG	temp_chunk_amount	;required temp chip mem (bytes)
	APTR	lvl2_server		;vector to user lvl2 routine
	APTR	lvl3_server		;vector to user lvl3 routine
	APTR	lvl6_server		;vector to user lvl6 routine

	UBYTE	code_load_dest		;chunk to load code to
	UBYTE	code_unpack_dest	;chunk to unpack code to
	UBYTE	code_reloc_dest		;chunk to relocate code to

DEST_CHIP		equ     0
DEST_PUBLIC		equ     1

	UBYTE	resources_to_allocate	;resource flags

FLAGF_SERIAL		equ	1<<0
FLAGF_PARALLEL		equ	1<<1
FLAGF_POTGO		equ	1<<2
FLAGF_CLOSE_WBENCH	equ	1<<3

FLAGB_SERIAL		equ     0
FLAGB_PARALLEL		equ     1
FLAGB_POTGO		equ     2
FLAGB_CLOSE_WBENCH	equ	3

	APTR	graphics_base		;graphics.library base
	APTR	intuition_base		;intuition.library base
	APTR	dos_base		;dos.library base
	APTR	takeover_base		;takeover.library base
	APTR	misc_base		;misc.resource base
	APTR	potgo_base		;potgo.resource base
	APTR	hardware_base		;address of hardware registers

HARDWARE_BASE		equ	$dff000

	ULONG	chip_amount_allocated	;size of chip chunk allocated
	ULONG	public_amount_allocated	;size of public chunk allocated
	ULONG	largest_chip		;largest free chip chunk
	ULONG	largest_public		;largest free public chunk
	APTR	chip_chunk_address	;address of chip chunk
	APTR	public_chunk_address	;address of public chunk
	APTR	temp_chunk_address	;address of temp chunk
	APTR	chip_mem_address	;address of chip memory
	APTR	public_mem_address	;address of public memory
	APTR	screen_bitmaps		;address of screen bitmaps
	APTR	screen1_struct		;address of screen 1 struct
	APTR	screen2_struct		;address of screen 2 struct
	ULONG	stdout_handle		;handle for stdout
	ULONG	console_handle		;handle for console
	APTR	wbench_message		;address of wbench message
	APTR	arg_address		;address of cli arguments
	UWORD	arg_length		;length of cli arguments
	UBYTE	arg_info		;flag info required
	UBYTE	arg_relocate		;flag relocate code file
	STRUCT	code_filename,NAME_SIZE	;code filename
	APTR	code_load_address	;address to load code to
	APTR	code_unpack_address	;address to unpack code to
	APTR	code_reloc_address	;address to relocate code to
	APTR	code_address		;current address of code
	ULONG	code_size		;size of unpacked code file
	ULONG	code_lock		;lock on code file
	STRUCT	code_fib,fib_SIZEOF	;code file info block
	UBYTE	mem_alloc_failed	;flag memory allocation failed
	UBYTE	arg_unpack		;size of unpack buffer
	UBYTE	serial_port		;flag serial port opened
	UBYTE	serial_bits		;flag serial port allocated
	UBYTE	parallel_port		;flag parallel port opened
	UBYTE	parallel_bits		;flag parallel port allocated
	ULONG	potgo_bits		;parallel port bits allocated

POTGO_BITS	equ	%1111000000000001

	UBYTE	lvl2_flag		;flag lvl2 server in list
	UBYTE	lvl3_flag		;flag lvl3 server in list
	UBYTE	lvl6_flag		;flag lvl6 server in list
	UBYTE	arg_quiet		;flag quiet required
 LABEL	stb_SIZEOF

****************************************************************************
****************************************************************************
****************************************************************************
;Warning!!!! This routine totally KILLS the operating system, it will never
;return unless there is an error during loading or the user aborts.
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

_STHostileExecute
		tst.b	arg_quiet(a5)
		bne.s	.no_warning
		lea	warning_mesg,a1		;warn user of kill system
		lea	warning_but1,a2
		lea	warning_but2,a3
		move.l	#456,d0
		move.l	#92,d1
		jsr	_STAutoRequest
		tst.l	d0
		bne	.error
		tst.l	d1
		beq	.no_error
.no_warning
		lea	code_filename(a5),a0
		move.l	code_load_address(a5),a1
		move.l	fib_Size+code_fib(a5),d3
		jsr	_STLoadFile
		tst.l	d0
		bne.s	.error
		move.l	code_load_address(a5),code_address(a5)

		tst.b	arg_unpack(a5)
		beq.s	.no_unpack
		move.l	code_address(a5),a0
		move.l	code_unpack_address(a5),a1
		jsr	_STUnPack
		move.l	d0,code_size(a5)
		move.l	code_unpack_address(a5),code_address(a5)
		tst.l	d0
		bne.s	.no_unpack
		move.l	#22,d0
		bra.s	.error
.no_unpack

		jsr	_STKillSystem

		tst.b	arg_relocate(a5)
		beq.s	.no_relocate
		move.l	code_size(a5),d0		;relocate code
		move.l	code_address(a5),a0
		move.l	code_reloc_address(a5),a1
		jsr	_STRelocate
		move.l	code_reloc_address(a5),code_address(a5)
.no_relocate

;run code with these parameters
; d0.l=-1 (flags system dead)
; a4.l=address of chip mem
; a5.l=address of public mem

		move.l	code_address(a5),a0

		moveq.l	#-1,d0
		move.l	chip_mem_address(a5),a4
		move.l	public_mem_address(a5),a5

		jmp	(a0)

.no_error	moveq.l	#0,d0
.error		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

_STFriendlyExecute
		lea	code_filename(a5),a0
		move.l	code_load_address(a5),a1
		move.l	fib_Size+code_fib(a5),d3
		jsr	_STLoadFile
		tst.l	d0
		bne.s	.error
		move.l	code_load_address(a5),code_address(a5)

		tst.b	arg_unpack(a5)
		beq.s	.no_unpack
		move.l	code_address(a5),a0
		move.l	code_unpack_address(a5),a1
		jsr	_STUnPack
		move.l	d0,code_size(a5)
		move.l	code_unpack_address(a5),code_address(a5)
		tst.l	d0
		bne.s	.no_unpack
		move.l	#22,d0
		bra.s	.error
.no_unpack

		tst.b	arg_relocate(a5)
		beq.s	.no_relocate
		move.l	code_size(a5),d0		;relocate code
		move.l	code_address(a5),a0
		move.l	code_reloc_address(a5),a1
		jsr	_STRelocate
		move.l	code_reloc_address(a5),code_address(a5)
.no_relocate

;run code with these parameters
; d0.l=0 (flags system intact)
; a5.l=address of parameters/variables block
; (sp)=return address

		jsr	_STKillSystem
		move.l	code_address(a5),a0
		move.l	chip_chunk_address(a5),a4
		move.l	public_chunk_address(a5),a5
		moveq.l	#0,d0
		pea	.no_error(pc)
		jmp	(a0)
.return		tst.l	d0
		bne.s	.error

.no_error	moveq.l	#0,d0
.error		rts

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

                lea	graphics_base(a5),a1	;clear internal variables
		move.w	#stb_SIZEOF-graphics_base-1,d1
.loop		clr.b	(a1)+
		dbf	d1,.loop

		move.l	#HARDWARE_BASE,hardware_base(a5)

		move.l	a0,arg_address(a5)
		move.w	d0,arg_length(a5)
		bne.s	.cli

		suba.l	a1,a1			;find this task
		move.l	4.w,a6
		jsr	_LVOFindTask(a6)
		move.l	d0,a0
		lea	pr_MsgPort(a0),a0
		LINKLIB	_LVOWaitPort,4		;wait for workbench message
		LINKLIB _LVOGetMsg,4		;get message from workbench

		move.l	d0,wbench_message(a5)

.cli		movem.l	(sp)+,d0-d7/a0-a6
		rts

****************************************************************************
************************** Allocate System Resources ***********************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

_STAllocateResources
		movem.l	d1-d7/a0-a6,-(sp)

		btst.b	#FLAGB_CLOSE_WBENCH,resources_to_allocate(a5)
		beq.s	.dont_close_wbench
		move.l	a5,-(sp)
		move.l	intuition_base(a5),a6	;close workbench
		jsr	_LVOCloseWorkBench(a6)
		move.l	(sp)+,a5
.dont_close_wbench

		bsr	allocate_resources
		tst.l	d0
		bne	.error

		bsr	allocate_memory
		tst.l	d0
		bne	.error

		bsr	install_interrupts

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
		bsr	deallocate_resources

		btst.b	#FLAGB_CLOSE_WBENCH,resources_to_allocate(a5)
		beq.s	.dont_open_wbench
		move.l	a5,-(sp)
		move.l	intuition_base(a5),a6	;open workbench
		jsr	_LVOOpenWorkBench(a6)
		move.l	(sp)+,a5
.dont_open_wbench

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
		jsr	_LVOOpen(a6)		;open file
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
		jsr	_LVORead(a6)		;read file
		movem.l	(sp)+,d2/a5
		move.l	d0,d1			;amount read

		tst.l	d1
		bpl.s	.read_ok
		move.l	d1,-(sp)
		move.l	d2,d1			;handle
		move.l	dos_base(a5),a6
		jsr	_LVOClose(a6)		;close file
		move.l	(sp)+,d1
		moveq.l	#33,d0			;error number 33
		bra.s	.error
.read_ok

		move.l	d1,-(sp)
		move.l	d2,d1			;handle
		move.l	dos_base(a5),a6
		jsr	_LVOClose(a6)		;close file
		move.l	(sp)+,d1

		moveq.l	#0,d0
.error		movem.l	(sp)+,d2-d7/a0-a6
		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

_STFileInfo
		movem.l	d1-d7/a0-a6,-(sp)

		movem.l	a1-a5/d3,-(sp)
		lea	code_filename(a5),a1
		move.l	a1,d1			;filename
		move.l	#ACCESS_READ,d2		;mode
		move.l	dos_base(a5),a6
		jsr	_LVOLock(a6)		;lock file
		movem.l	(sp)+,a1-a5/d3
		move.l	d0,code_lock(a5)	;handle
		tst.l	d0
		bne.s	.lock_ok
		moveq.l	#20,d0			;error number 20
		bra.s	.error
.lock_ok

		movem.l	a5,-(sp)
		move.l	code_lock(a5),d1	;lock
		lea	code_fib(a5),a1
		move.l	a1,d2			;file info block
		move.l	dos_base(a5),a6
		jsr	_LVOExamine(a6)		;examine file
		movem.l	(sp)+,a5
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
		jsr	_LVOUnLock(a6)		;unlock file
		move.l	(sp)+,d0

		movem.l	(sp)+,d1-d7/a0-a6
		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;		d0.l=length of source object code
;		a0.l=address of source object code
;		a1.l=address of destination
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

HUNK_CODE	equ	$3e9
HUNK_REL32	equ	$3ec
HUNK_SYMBOL	equ	$3f0
HUNK_END	equ	$3f2
HUNK_HEADER	equ	$3f3

_STRelocate
		movem.l	d0-d7/a0-a6,-(sp)

		move.l	(a0)+,d0
		cmp.l	#HUNK_HEADER,d0
		beq.s	.relocate_type_ok
		add.l	d1,a0
		bra.s	.error
.relocate_type_ok
		bsr	.interpret_header

.interpret_loop	move.l	(a0)+,d0
		cmp.l	#HUNK_CODE,d0		;Is it a code hunk?
		beq.s	.interpret_code		;Yes, interpret it
		cmp.l	#HUNK_REL32,d0		;Is it a relocation hunk?
		beq.s	.interpret_rel32	;Yes, Interpret it
		cmp.l	#HUNK_END,d0		;Is it the end of the file?
		beq.s	.no_error
		bra.s	.error

.interpret_header
		addq.l	#4,a0			;Hunk name
		addq.l	#4,a0			;Size of hunk table
		addq.l	#4,a0			;first hunk
		addq.l	#4,a0			;last hunk
		addq.l	#4,a0			;Size of hunk 0?
		rts

.interpret_code	bsr	.relocate		;Relocate first
		move.l	(a0)+,d7		;Read number of longs
.IC_loop	move.l	(a0)+,(a1)+		;Move it into memory
		subq.l	#1,d7
		bne.s	.IC_loop
		bra.s	.no_error

.interpret_rel32
		move.l	(a0)+,d7		;Read in amount of relocation
		addq	#8,a0			;Skip hunk number
		lsl.l	#2,d7
		add.l	d7,a0
		bra	.interpret_loop

.relocate	move.l	a0,a3			;Copy base of relocation data
.relocate_loop	move.l	(a0)+,d7		;Get base of code section
		lsl.l	#2,d7
		add.l	d7,a0
		move.l	(a0)+,d0
		cmp.l	#HUNK_REL32,d0
		bne	.relocate_done		;Should be .RelocLoop

		move.l	(a0)+,d7		;Get number of reloc longs
		addq	#4,a0			;Pass something
		move.l	a1,d3			;d3 = offset to add
		lea	4(a3),a2		;Base of code in memory
.interpret_loop2
		move.l	(a0)+,d0		;Get 1 longword offset
		add.l	d3,0(a2,d0.l)		;Add new offset to it
		subq.l	#1,d7
		bne	.interpret_loop2

.relocate_done	move.l	a3,a0			;Finished relocating
		rts

.no_error	moveq	#0,d0
		movem.l	(sp)+,d0-d7/a0-a6
		rts

.error		moveq.l	#34,d0                  ;error number 34
		movem.l	(sp)+,d0-d7/a0-a6
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
_STRestoreCopper
		movem.l	d0-d7/a0-a6,-(sp)

		jsr	_STForbid

		move.l  a5,-(sp)
		move.l	graphics_base(a5),a6	;wait for top of frame
		jsr	_LVOWaitTOF(a6)
		move.l  (sp)+,a5

		move.l	hardware_base(a5),a1

		move.l	graphics_base(a5),a0
		move.l	gb_copinit(a0),cop1lc(a1)
		move.w	#0,copjmp1(a1)

		jsr	_STPermit

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

		move.l  a5,-(sp)
		move.l	graphics_base(a5),a6	;own blitter
		jsr	_LVOOwnBlitter(a6)
		move.l  (sp)+,a5

		move.l	4.w,a6			;disable task switching
		jsr	_LVOForbid(a6)

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

		move.l  a5,-(sp)
		move.l	4.w,a6			;enable task switching
		jsr	_LVOPermit(a6)
		move.l  (sp)+,a5

		move.l	graphics_base(a5),a6	;disown blitter
		jsr	_LVODisownBlitter(a6)

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

		move.l	4.w,a6			;disable interrupts
		jsr	_LVODisable(a6)

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

		move.l  a5,-(sp)
		move.l	4.w,a6			;enable interrupts
		jsr	_LVOEnable(a6)
		move.l  (sp)+,a5

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
		jsr	_STForbid
		jsr	_STDisable

		move.l	(sp)+,a1		;save return address

		move.l	hardware_base(a5),a6	;hardware regs base

		move.l	#user_stack_end,a7	;set user stack pointer

		move.l	$84,a0			;into supervisor mode
		lea	.super_routine(pc),a0
		move.l	a0,$84
		trap	#1			;go!

.super_routine	move.l	#super_stack_end,a7	;set supervisor stack pointer

		move.l	#$e80000,a0		;base of config space
		moveq.l	#7,d0			;up to 8 cards
.kill_cards	move.l	#0,$4c(a0)		;write to "shut-up register"
		adda.l	#$10000,a0		; (only if board supports it)
		dbf	d0,.kill_cards

		move.w	#%0111111111111111,intena(a6)	;clear all interupts
		move.b	#%01111111,$bfe001+ciaicr	;ciaa interrupts off
		move.b	#%01111111,$bfd000+ciaicr	;ciab interrupts off
		move.w	#$2100,SR

		move.w	#%0000001111111111,dmacon(a6)	;all dma off

		move.l	#0,4				;corrupt execbase
							; forces a cold boot
							; on reset

		move.w	#0,aud0+ac_vol(a6)		;ch0 off
		move.w	#0,aud1+ac_vol(a6)		;ch1 off
		move.w	#0,aud2+ac_vol(a6)		;ch2 off
		move.w	#0,aud3+ac_vol(a6)		;ch3 off

		lea	color(a6),a0			;initialise palette
		moveq.l	#31,d0				; to black

.pallette_loop	move.w	#0,(a0)+
		dbf	d0,.pallette_loop

                jmp	(a1)			;return

			rsreset
lo_mem			rs.b    1024		;temporary memory map
user_stack_start	rs.b	500
user_stack_end		rs.b	0
super_stack_start	rs.b    500
super_stack_end		rs.b	0

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block (long)
;OUTPUT:	none
;CHANGES:	none

_STBeep
		movem.l	d0-d7/a0-a6,-(sp)

		move.l	intuition_base(a5),a6
                suba.l	a0,a0
		jsr	_LVODisplayBeep(a6)

		movem.l	(sp)+,d0-d7/a0-a6
		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;		d2.l=address of string
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

WRITELN		MACRO
		move.l	#.text\@,d2
		jsr	_STOutput
		tst.l	d0
		bne	.error
		bra.s	.cont\@
.text\@		dc.b	\1,0
		even
.cont\@
		ENDM

_STOutput
		movem.l	d1-d7/a0-a6,-(sp)

		tst.b	arg_quiet(a5)
		bne.s	.no_output

		move.l	d2,a0
		moveq.l	#0,d3			;calculate length of string
.loop		tst.b	(a0)+
		beq.s	.end_string
		addq.l	#1,d3
		bra.s	.loop
.end_string
		tst.w	d3
		bne.s	.string_ok
		moveq.l	#15,d0			;error number 15
		bra.s	.error
.string_ok
		move.l	stdout_handle(a5),d1
		beq.s	.no_output
		move.l	dos_base(a5),a6
		move.l	a5,-(sp)
		jsr	_LVOWrite(a6)
		move.l	(sp)+,a5

		tst.w	d0
		bpl.s	.write_ok1
		moveq.l	#16,d0			;error number 16
		bra.s	.error
.write_ok1
		move.l	#.cr,d2
		moveq.l	#1,d3
		move.l	stdout_handle(a5),d1
		move.l	dos_base(a5),a6
		jsr	_LVOWrite(a6)

		tst.w	d0
		bpl.s	.write_ok2
		moveq.l	#24,d0			;error number 24
		bra.s	.error

.no_output
.write_ok2	moveq.l	#0,d0			;no errors
.error		movem.l	(sp)+,d1-d7/a0-a6
		rts

.cr		dc.b	$a
		even

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;		a1.l=address of string
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

_STSimpleAutoRequest
		movem.l	d1-d7/a0-a6,-(sp)

		lea	code_title(a5),a0
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
		jsr	_LVOAutoRequest(a6)

.write_ok	moveq.l	#0,d0			;no errors
.error		movem.l	(sp)+,d1-d7/a0-a6
		rts

.itext_button	dc.b	AUTOFRONTPEN		;front pen
                dc.b	AUTOBACKPEN		;back pen
		dc.b	AUTODRAWMODE		;draw mode
		dc.b	0			;pad
		dc.w	AUTOLEFTEDGE		;left edge
		dc.w	AUTOTOPEDGE		;top edge
		dc.l	AUTOITEXTFONT		;font
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
		dc.l	AUTOITEXTFONT		;font
.mesg_head_ptr	dc.l	0			;text
		dc.l	.itext_body		;next itext
		even

.itext_body	dc.b	AUTOFRONTPEN		;front pen
                dc.b	AUTOBACKPEN		;back pen
		dc.b	AUTODRAWMODE		;draw mode
		dc.b	0			;pad
		dc.w	AUTOLEFTEDGE		;left edge
		dc.w	AUTOTOPEDGE+10		;top edge
		dc.l	AUTOITEXTFONT		;font
.mesg_body_ptr	dc.l    0			;text
		dc.l	AUTONEXTTEXT		;next itext
		even

****************************************************************************
****************************************************************************
****************************************************************************
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
		jsr	_LVOAutoRequest(a6)

		move.l	d0,d1

.write_ok	moveq.l	#0,d0			;no errors
.error		movem.l	(sp)+,d2-d7/a0-a6
		rts

****************************************************************************
****************************************************************************
****************************************************************************
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
		jsr	_LVODisplayAlert(a6)

.no_error	movem.l	(sp)+,d1-d7/a0-a6
		rts

****************************************************************************
****************************************************************************
****************************************************************************
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
		ERROR_DEFN <"ERROR #00009 : Could not open screen buffer 1">,24,17
		ERROR_DEFN <"ERROR #00010 : Could not open screen buffer 1">,24,17
		ERROR_DEFN <"ERROR #00011 : Could not allocate enough chip memory">,24,17
		ERROR_DEFN <"ERROR #00012 : Could not open takeover.library">,24,17
		ERROR_DEFN <"ERROR #00013 : Could not allocate enough public memory">,24,17
		ERROR_DEFN <"ERROR #00014 : Undefined">,24,17
		ERROR_DEFN <"ERROR #90015 : _STOutput string empty">,24,17
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
		ERROR_DEFN <"ERROR #00029 : Could not allocate CIAB timer A ICR bit">,24,17
		ERROR_DEFN <"ERROR #00030 : Could not allocate CIAB timer B ICR bit">,24,17
		ERROR_DEFN <"ERROR #00031 : Could not open output console">,24,17
		ERROR_DEFN <"ERROR #00032 : _STFileInfo examine failed">,24,17
		ERROR_DEFN <"ERROR #00033 : _STLoadFile AmigasDOS IO error">,24,17
		ERROR_DEFN <"ERROR #90034 : (_STRelocate) Missing or illegal relocation hunk">,24,17
		ERROR_DEFN <"ERROR #00035 : Not enough chip memory">,24,17
		ERROR_DEFN <"ERROR #00036 : Not enough expansion memory">,24,17
		ERROR_DEFN <"ERROR #00037 : Not enough memory">,24,17
		ERROR_DEFN <"ERROR #90038 : _STOpenConsole console already open">,24,17
		ERROR_DEFN <"ERROR #90039 : _STOpenStdout stdout already open">,24,17
		ERROR_DEFN <"ERROR #00040 : required parameter missing">,24,17
		ERROR_DEFN <"ERROR #00041 : Not enough temporarymemory">,24,17

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

WRITEINFO	MACRO

		move.l	\3,d0
		beq.s	.unknown\@
		lea	.value\@+4(pc),a0
		bsr	long_to_string
.unknown\@
		move.l	#.text\@,d2
		jsr	_STOutput
		tst.l	d0
		beq.s	.cont\@
		moveq.l	#17,d0				;error number 17
		bra	.error

.text\@		dc.b    \1
.value\@	dc.b	" = $",\2,0
		even
.cont\@
		ENDM

_STInfo
		movem.l	d1-d7/a0-a6,-(sp)

		tst.l	stdout_handle(a5)
		bne.s   .cli
		jsr	_STOpenConsole
		tst.l	d0
		bne	.error
.cli

		WRITELN <"---MEMORY REQUIRED----------------------------------">
		WRITEINFO <"    Maximum chunk of chip memory">,<"UNKNOWN  (bytes)">,chip_chunk_max_amount(a5)
		WRITEINFO <"  Maximum chunk of public memory">,<"UNKNOWN  (bytes)">,public_chunk_max_amount(a5)
		WRITEINFO <"    Minimum chunk of chip memory">,<"UNKNOWN  (bytes)">,chip_chunk_min_amount(a5)
		WRITEINFO <"  Minimum chunk of public memory">,<"UNKNOWN  (bytes)">,public_chunk_min_amount(a5)
		WRITEINFO <"   Required chunk of temp memory">,<"UNKNOWN  (bytes)">,temp_chunk_amount(a5)

		WRITELN <"---MEMORY ALLOCATED---------------------------------">
		WRITEINFO <"   Chip chunk / memory allocated">,<"UNKNOWN  (bytes)">,chip_amount_allocated(a5)
		WRITEINFO <" Public chunk / memory allocated">,<"UNKNOWN  (bytes)">,public_amount_allocated(a5)
		WRITEINFO <"              Chip chunk address">,<"UNKNOWN ">,chip_chunk_address(a5)
		WRITEINFO <"            Public chunk address">,<"UNKNOWN ">,public_chunk_address(a5)
		WRITEINFO <"             Chip memory address">,<"UNKNOWN ">,chip_mem_address(a5)
		WRITEINFO <"           Public memory address">,<"UNKNOWN ">,public_mem_address(a5)

		WRITELN <"---MEMORY GENERAL INFO------------------------------">
		WRITEINFO <"    Largest chunk of chip memory">,<"UNKNOWN  (bytes)">,largest_chip(a5)
		WRITEINFO <"  Largest chunk of public memory">,<"UNKNOWN  (bytes)">,largest_public(a5)

		WRITELN <"---CODE FILE----------------------------------------">
		WRITEINFO <"                       File size">,<"UNKNOWN  (bytes)">,fib_Size+code_fib(a5)
		WRITEINFO <"                    Load address">,<"UNKNOWN  (bytes)">,code_load_address(a5)
		WRITEINFO <"                  Unpack address">,<"UNKNOWN  (bytes)">,code_unpack_address(a5)
		WRITEINFO <"                Relocate address">,<"UNKNOWN  (bytes)">,code_reloc_address(a5)

		moveq.l	#0,d0			;no errors
.error		movem.l	(sp)+,d1-d7/a0-a6
		rts

****************************************************************************
long_to_string	movem.l	d0-d4/a0-a1,-(sp)

		move.b	#" ",(a0)
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

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;		a0.l=address of source
;		a1.l=address of destination
;OUTPUT:	d0.l=length of unpacked file (0=error)
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

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

_STOpenStdout
		movem.l	d1-d7/a0-a6,-(sp)

		tst.w	arg_length(a5)
		beq.s	.wbench

		tst.l	stdout_handle(a5)
		beq.s	.not_already_opened
		move.l	#39,d0			;error number 39
		bra.s	.error
.not_already_opened

		move.l	a5,-(sp)		;get stdout handle
		move.l	dos_base(a5),a6
		jsr	_LVOOutput(a6)
		move.l	(sp)+,a5
		move.l	d0,stdout_handle(a5)
		bne.s	.opened_stdout
		moveq.l	#4,d0			;error number 4
                bra.s	.error
.opened_stdout

		bsr	output_copyright_message
		tst.l	d0
		bne.s	.error

.wbench		moveq.l	#0,d0			;no error
.error		movem.l	(sp)+,d1-d7/a0-a6
		rts

****************************************************************************
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

		move.l	a5,-(sp)		;get con: handle
		move.l	#console_name,d1
		move.l  #MODE_NEWFILE,d2
		move.l	dos_base(a5),a6
		jsr	_LVOOpen(a6)
		move.l	(sp)+,a5
		move.l	d0,console_handle(a5)
		bne.s	.opened_con
		moveq.l	#31,d0			;error number 31
		bra	.error
.opened_con

		move.l	console_handle(a5),stdout_handle(a5)
		bsr	output_copyright_message
                tst.l d0
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
		bsr	wbench_parse_args
		bra.s	.skip_cli
.not_wbench	bsr	cli_parse_args
.skip_cli	tst.l	d0
		bne.s	.error

		tst.b	code_filename(a5)
		bne.s	.code_filename_ok
		move.l	#40,d0			;error number 40
		bra.s	.error
.code_filename_ok

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

next_keyword	tst.l	d0
		bne.s	.error
.next_arg	bsr	get_next_arg
		tst.l	d0
		beq.s	.end_of_args
		move.l	d0,a1
		jmp	(a1)

.end_of_args	moveq.l	#0,d0			;no error
.error		rts

		CLI_KEYWORD_DEF	<"?">,keyword_1_def
		CLI_KEYWORD_DEF	<"code">,keyword_2_def
		CLI_KEYWORD_DEF	<"info">,keyword_3_def
		CLI_KEYWORD_DEF	<"unpack">,keyword_4_def
		CLI_KEYWORD_DEF	<"relocate">,keyword_5_def
		CLI_KEYWORD_DEF	<"quiet">,keyword_6_def
		CLI_KEYWORD_END

keyword_1_def	WRITELN	<"TAKEOVER,CODE/A/K,INFO/S,UNPACK/S,RELOCATE/S,QUIET/S">
		moveq.l	#-1,d0
.error		bra     next_keyword

keyword_2_def	lea	code_filename(a5),a1
		bsr	get_string
		moveq.l	#0,d0
.error		bra	next_keyword

keyword_3_def	st.b	arg_info(a5)
		moveq.l	#0,d0
		bra	next_keyword

keyword_4_def	st.b	arg_unpack(a5)
		moveq.l	#0,d0
		bra	next_keyword

keyword_5_def	st.b	arg_relocate(a5)
		moveq.l	#0,d0
		bra	next_keyword

keyword_6_def	st.b	arg_quiet(a5)
		moveq.l	#0,d0
		bra	next_keyword

****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:       d0-d3/a0-a2

wbench_parse_args
		move.l	wbench_message(a5),a2
		cmpi.l	#2,sm_NumArgs(a2)
		blt.s	.no_error
		move.l	sm_ArgList(a2),a2
		add.l	#wa_SIZEOF,a2

		move.l	wa_Name(a2),a0
		lea	code_filename(a5),a1
		move.w	#NAME_SIZE,d0
		jsr	_STCopyString
		tst.l	d0
		bne.s	.error

		movem.l	a5,-(sp)
		move.l	wa_Lock(a2),d1
		move.l	dos_base(a5),a6
		jsr	_LVOCurrentDir(a6)
		movem.l	(sp)+,a5

.no_error	moveq.l	#0,d0
.error		rts

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

		move.b	d0,(a1)+
.new_terminator
.next_letter	move.b	(a0)+,(a1)+
		cmpi.b	#EOL,-1(a0)
		beq.s	.end
		cmp.b	-1(a0),d1
		bne.s	.next_letter

.end		move.b	#0,-1(a1)
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
		bmi.s	.find_next_argument
		move.l	a2,a0
		bra.s	.next_letter

.find_next_argument
		tst.b	(a1)+
		bne.s	.find_next_argument
		bra.s	.next_argument

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
		WRITELN	<"System Takeover V1.1">
		WRITELN	<"Copyright 1992 by Scott Johnston">
		WRITELN	<"All rights reserved worldwide">

		moveq.l	#0,d0			;no error
.error		rts

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
		jsr	_LVOClose(a6)
		move.l	(sp)+,a5
		move.l	#0,console_handle(a5)

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
		WRITELN	<"PRESS RETURN TO EXIT">

		move.l	a5,-(sp)
		move.l	stdout_handle(a5),d1
		move.l	dos_base(a5),a6
		jsr	_LVOFGetC(a6)
		move.l	(sp)+,a5

		moveq.l	#0,d0			;no error
.error		rts

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
		moveq.l	#LIBRARY_MINIMUM,d0
		move.l	4.w,a6
		jsr	_LVOOpenLibrary(a6)
		move.l	(sp)+,a5
		move.l	d0,graphics_base(a5)
		bne.s	.opened_graphics
		moveq.l	#1,d0			;error number 1
		bra.s	.error
.opened_graphics

		move.l	a5,-(sp)		;open intuition library
		lea	intuition_name,a1
		moveq.l	#LIBRARY_MINIMUM,d0
		move.l	4.w,a6
		jsr	_LVOOpenLibrary(a6)
		move.l	(sp)+,a5
		move.l	d0,intuition_base(a5)
		bne.s	.opened_intuition
		moveq.l	#2,d0			;error number 2
		bra.s	.error
.opened_intuition

		move.l	a5,-(sp)		;open dos library
		lea	dos_name,a1
		moveq.l	#LIBRARY_MINIMUM,d0
		move.l	4.w,a6
		jsr	_LVOOpenLibrary(a6)
		move.l	(sp)+,a5
		move.l	d0,dos_base(a5)
		bne.s	.opened_dos
		moveq.l	#3,d0			;error number 3
		bra.s	.error
.opened_dos

		move.l	a5,-(sp)		;open takeover library
		lea	takeover_name,a1
		moveq.l	#LIBRARY_MINIMUM,d0
		move.l	4.w,a6
		jsr	_LVOOpenLibrary(a6)
		move.l	(sp)+,a5
		move.l	d0,takeover_base(a5)
		bne.s	.opened_takeover
		moveq.l	#3,d0			;error number 12
		bra.s	.error
.opened_takeover
		moveq.l	#0,d0			;no errors
.error		movem.l	(sp)+,d1-d7/a0-a6
		rts

****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	none
;CHANGES:	none

_STCloseLibraries
		movem.l	d0-d7/a0-a6,-(sp)

		tst.l	takeover_base(a5)
		beq.s	.skip_takeover
		move.l	a5,-(sp)		;close takeover library
		move.l	takeover_base(a5),a1
		move.l	4.w,a6
		jsr	_LVOCloseLibrary(a6)
		move.l	(sp)+,a5
		clr.l	takeover_base(a5)
.skip_takeover

		tst.l	dos_base(a5)
		beq.s	.skip_dos
		move.l	a5,-(sp)		;close dos library
		move.l	dos_base(a5),a1
		move.l	4.w,a6
		jsr	_LVOCloseLibrary(a6)
		move.l	(sp)+,a5
		clr.l	dos_base(a5)
.skip_dos

		tst.l	intuition_base(a5)
		beq.s	.skip_intuition
		move.l	a5,-(sp)		;close intuition library
		move.l	intuition_base(a5),a1
		move.l	4.w,a6
		jsr	_LVOCloseLibrary(a6)
		move.l	(sp)+,a5
		clr.l	intuition_base(a5)
.skip_intuition

		tst.l	graphics_base(a5)
		beq.s	.skip_graphics
		move.l	a5,-(sp)		;close graphics library
		move.l	graphics_base(a5),a1
		move.l	4.w,a6
		jsr	_LVOCloseLibrary(a6)
		move.l	(sp)+,a5
		clr.l	graphics_base(a5)
.skip_graphics

		movem.l	(sp)+,d0-d7/a0-a6
		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

allocate_resources
		lea	serial_name,a1
		bsr	flush_device

		move.l	a5,-(sp)        	;open misc resource
		lea	misc_name,a1
		move.l	4.w,a6
		jsr	_LVOOpenResource(a6)
		move.l	(sp)+,a5
		move.l	d0,misc_base(a5)
		bne.s	.opened_misc_resource
		moveq.l	#4,d0			;error number 4
                bra	.error
.opened_misc_resource

		btst.b	#FLAGB_SERIAL,resources_to_allocate(a5)
		beq.s	.dont_allocate_serial_resource
		bsr	allocate_serial_resource
		tst.l	d0
		bne	.error
.dont_allocate_serial_resource

		btst.b	#FLAGB_PARALLEL,resources_to_allocate(a5)
		beq.s	.dont_allocate_parallel_resource
		bsr	allocate_parallel_resource
		tst.l	d0
		bne	.error
.dont_allocate_parallel_resource

		btst.b	#FLAGB_POTGO,resources_to_allocate(a5)
		beq.s	.dont_allocate_potgo_resource
		bsr	allocate_potgo_resource
		tst.l	d0
		bne.s	.error
.dont_allocate_potgo_resource

		moveq.l	#0,d0			;no errors
.error		rts

****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

allocate_serial_resource
		sf.b	serial_bits(a5)		;allocate serial port bits
		move.l	a5,-(sp)
		move.l	#MR_SERIALBITS,d0
		lea	code_title(a5),a1
		move.l	misc_base(a5),a6
		jsr	MR_ALLOCMISCRESOURCE(a6)
		move.l	(sp)+,a5

		tst.l	d0
		beq.s	.allocated_serial_bits
		moveq.l	#5,d0			;error number 5
                bra	.error
.allocated_serial_bits
		st.b	serial_bits(a5)		;flag allocation ok

		sf.b	serial_port(a5)		;allocate serial port
		move.l	a5,-(sp)
		move.l	#MR_SERIALPORT,d0
		lea	code_title(a5),a1
		move.l	misc_base(a5),a6
		jsr	MR_ALLOCMISCRESOURCE(a6)
		move.l	(sp)+,a5

		tst.l	d0
		beq.s	.allocated_serial_port
		moveq.l	#6,d0			;error number 6
                bra.s	.error
.allocated_serial_port
		st.b	serial_port(a5)		;flag allocation ok

		moveq.l	#0,d0			;no errors
.error		rts

****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

allocate_parallel_resource
		sf.b	parallel_bits(a5)	;allocate parallel port bits
		move.l	a5,-(sp)
		move.l	#MR_PARALLELBITS,d0
		lea	code_title(a5),a1
		move.l	misc_base(a5),a6
		jsr	MR_ALLOCMISCRESOURCE(a6)
		move.l	(sp)+,a5

		tst.l	d0
		beq.s	.allocated_parallel_bits
		moveq.l	#27,d0			;error number 27
                bra	.error
.allocated_parallel_bits
		st.b	parallel_bits(a5)	;flag allocation ok

		sf.b	parallel_port(a5)	;allocate parallel port
		move.l	a5,-(sp)
		move.l	#MR_PARALLELPORT,d0
		lea	code_title(a5),a1
		move.l	misc_base(a5),a6
		jsr	MR_ALLOCMISCRESOURCE(a6)
		move.l	(sp)+,a5

		tst.l	d0
		beq.s	.allocated_parallel_port
		moveq.l	#28,d0			;error number 28
                bra.s	.error
.allocated_parallel_port
		st.b	parallel_port(a5)	;flag allocation ok

		moveq.l	#0,d0			;no errors
.error		rts

****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

allocate_potgo_resource
		move.l	a5,-(sp)        	;open potgo resource
		lea	potgo_name,a1
		move.l	4.w,a6
		jsr	_LVOOpenResource(a6)
		move.l	(sp)+,a5

		move.l	d0,potgo_base(a5)
		bne.s	.opened_potgo_resource
		moveq.l	#7,d0			;error number 7
                bra	.error
.opened_potgo_resource
		move.l	a5,-(sp)
		move.l	4.w,a6			;disable task switching
		jsr	_LVOForbid(a6)
		move.l	(sp)+,a5

		sf.b	potgo_bits(a5)		;allocate potgo bits
		move.l	a5,-(sp)
		move.l	#POTGO_BITS,d0
		move.l	potgo_base(a5),a6
		jsr	_LVOAllocPotBits(a6)
		move.l	(sp)+,a5
		move.l	d0,potgo_bits(a5)	;flag allocation ok

		cmp.l	#POTGO_BITS,d0
		beq.s	.allocated_potgo_bits
		moveq.l	#8,d0			;error number 8

		move.l	a5,-(sp)
		move.l	4.w,a6			;enable task switching
		jsr	_LVOPermit(a6)
		move.l	(sp)+,a5

                bra.s	.error

.allocated_potgo_bits
		move.l	a5,-(sp)
		move.l	4.w,a6			;disable task switching
		jsr	_LVOPermit(a6)
		move.l	(sp)+,a5

		moveq.l	#0,d0			;no errors
.error		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	none
;CHANGES:	none

deallocate_resources
		btst.b	#FLAGB_SERIAL,resources_to_allocate(a5)
		beq.s	.dont_deallocate_serial_resource
		bsr	deallocate_serial_resource
.dont_deallocate_serial_resource

		btst.b	#FLAGB_PARALLEL,resources_to_allocate(a5)
		beq.s	.dont_deallocate_parallel_resource
		bsr	deallocate_parallel_resource
.dont_deallocate_parallel_resource

		btst.b	#FLAGB_POTGO,resources_to_allocate(a5)
		beq.s	.dont_deallocate_potgo_resource
		bsr	deallocate_potgo_resource
.dont_deallocate_potgo_resource

		rts

****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	none
;CHANGES:	none

deallocate_serial_resource
		tst.b	serial_port(a5)
		beq.s	.skip_serial_port
		move.l	a5,-(sp)		;free serial port resource
		move.l	#MR_SERIALPORT,d0
		move.l	misc_base(a5),a6
		jsr	MR_FREEMISCRESOURCE(a6)
		move.l	(sp)+,a5
		sf.b	serial_port(a5)
.skip_serial_port

		tst.b   serial_bits(a5)
		beq.s	.skip_serial_bits
		move.l	a5,-(sp)		;free serial bits resource
		move.l	#MR_SERIALBITS,d0
		move.l	misc_base(a5),a6
		jsr	MR_FREEMISCRESOURCE(a6)
		move.l	(sp)+,a5
		sf.b	serial_bits(a5)
.skip_serial_bits
		rts

****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	none
;CHANGES:	none

deallocate_parallel_resource
		tst.b	parallel_port(a5)
		beq.s	.skip_parallel_port
		move.l	a5,-(sp)		;free parallel port resource
		move.l	#MR_PARALLELPORT,d0
		move.l	misc_base(a5),a6
		jsr	MR_FREEMISCRESOURCE(a6)
		move.l	(sp)+,a5
		sf.b	parallel_port(a5)
.skip_parallel_port

		tst.b   parallel_bits(a5)
		beq.s	.skip_parallel_bits
		move.l	a5,-(sp)		;free parallel bits resource
		move.l	#MR_PARALLELBITS,d0
		move.l	misc_base(a5),a6
		jsr	MR_FREEMISCRESOURCE(a6)
		move.l	(sp)+,a5
		sf.b	parallel_bits(a5)
.skip_parallel_bits
		rts

****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	none
;CHANGES:	none

deallocate_potgo_resource
		tst.l	potgo_bits(a5)
		beq.s	.skip_potgo_bits
		sf.b	potgo_bits(a5)		;deallocate potgo bits
		move.l	a5,-(sp)
		move.l	potgo_bits(a5),d0
		move.l	potgo_base(a5),a6
		jsr	_LVOFreePotBits(a6)
		move.l	(sp)+,a5
		sf.b	potgo_bits(a5)
.skip_potgo_bits
		rts

****************************************************************************
;INPUT:		a1=address of name of device (long)
;OUTPUT:	none
;CHANGES:	none

flush_device
		movem.l	a1-a5,-(sp)		;disable task switching
		move.l	4.w,a6
		jsr	_LVOForbid(a6)
		movem.l	(sp)+,a1-a5

		move.l	a5,-(sp)		;find serial device
		move.l	4.w,a0
		add.l	#DeviceList,a0
		move.l  (a0),a0
		move.l	4.w,a6
		jsr	_LVOFindName(a6)
		move.l	(sp)+,a5

		tst.l	d0
		beq.s	.device_not_found	;return of device not found

		move.l	a5,-(sp)		;flush device
                move.l	d0,a1
		move.l	4.w,a6
		jsr	_LVORemDevice(a6)
		move.l	(sp)+,a5

.device_not_found
		move.l	a5,-(sp)		;permit task switching
		move.l	4.w,a6
		jsr	_LVOPermit(a6)
		move.l	(sp)+,a5

		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	none
;CHANGES:	none

install_interrupts
		lea	code_title(a5),a1	;level 2 server
		move.l	a1,struct_lvl2_name
		move.l	#lvl2_code,struct_lvl2_code
		beq.s	.no_lvl2_server
		move.l	a5,-(sp)
		move.l	#INTB_PORTS,d0
		lea	struct_lvl2,a1
		move.l	4.w,a6
		jsr	_LVOAddIntServer(a6)
		move.l	(sp)+,a5
		st.b	lvl2_flag(a5)
.no_lvl2_server

		lea	code_title(a5),a1	;level 3 server
		move.l	a1,struct_lvl3_name
		move.l	#lvl3_code,struct_lvl3_code
		beq.s	.no_lvl3_server
		move.l	a5,-(sp)
		move.l	#INTB_VERTB,d0
		lea	struct_lvl3,a1
		move.l	4.w,a6
		jsr	_LVOAddIntServer(a6)
		move.l	(sp)+,a5
		st.b	lvl3_flag(a5)
.no_lvl3_server

		lea	code_title(a5),a1	;level 6 server
		move.l	a1,struct_lvl6_name
		move.l	#lvl6_code,struct_lvl6_code
		beq.s	.no_lvl6_server
		move.l	a5,-(sp)
		move.l	#INTB_EXTER,d0
		lea	struct_lvl6,a1
		move.l	4.w,a6
		jsr	_LVOAddIntServer(a6)
		move.l	(sp)+,a5
		st.b	lvl6_flag(a5)
.no_lvl6_server

		rts

****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	none
;CHANGES:	none

remove_interrupts
		tst.b	lvl2_flag(a5)		;level 2 server
		beq.s	.no_lvl2_server
		move.l	a5,-(sp)
		move.l	#INTB_PORTS,d0
		lea	struct_lvl2(pc),a1
		move.l	4.w,a6
		jsr	_LVORemIntServer(a6)
		move.l	(sp)+,a5
		sf.b	lvl2_flag(a5)
.no_lvl2_server

		tst.b	lvl3_flag(a5)		;level 3 server
		beq.s	.no_lvl3_server
		move.l	a5,-(sp)
		move.l	#INTB_VERTB,d0
		lea	struct_lvl3(pc),a1
		move.l	4.w,a6
		jsr	_LVORemIntServer(a6)
		move.l	(sp)+,a5
		sf.b	lvl3_flag(a5)
.no_lvl3_server

		tst.b	lvl6_flag(a5)		;level 6 server
		beq.s	.no_lvl6_server
		move.l	a5,-(sp)
		move.l	#INTB_EXTER,d0
		lea	struct_lvl6,a1
		move.l	4.w,a6
		jsr	_LVORemIntServer(a6)
		move.l	(sp)+,a5
		sf.b	lvl6_flag(a5)
.no_lvl6_server

		rts

****************************************************************************

struct_lvl2	dc.l	0			;succeeding node
		dc.l	0			;preceeding node
		dc.b	NT_INTERRUPT		;type
		dc.b	-10			;interrupt priority
struct_lvl2_name
		dc.l	0			;interrupt name
		dc.l	0			;pointer to interrupt data
struct_lvl2_code
		dc.l	0			;pointer to interrupt code
		even

struct_lvl3	dc.l	0			;succeeding node
		dc.l	0			;preceeding node
		dc.b	NT_INTERRUPT		;type
		dc.b	-10			;interrupt priority
struct_lvl3_name
		dc.l	0			;interrupt name
		dc.l	0			;pointer to interrupt data
struct_lvl3_code
		dc.l	0			;pointer to interrupt code
		even

struct_lvl6	dc.l	0			;succeeding node
		dc.l	0			;preceeding node
		dc.b	NT_INTERRUPT		;type
		dc.b	-10			;interrupt priority
struct_lvl6_name
		dc.l	0			;interrupt name
		dc.l	0			;pointer to interrupt data
struct_lvl6_code
		dc.l	0			;pointer to interrupt code
		even

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

allocate_memory
		bsr	do_allocation
		tst.l	d0
		bne.s	.allocate_physical_memory

		bsr	define_code_load_addresses
		bsr	define_code_unpack_addresses
		bsr	define_code_relocate_addresses

		moveq.l	#0,d0			;no errors
		rts

.allocate_physical_memory
;Do this code if requested amount of memory could not be allocated.
		st.b	mem_alloc_failed(a5)

		bsr	deallocate_memory

		move.l	temp_chunk_amount(a5),d0
		beq.s	.skip_temp_mem
		move.l	a5,-(sp)		;allocate chip memory
		move.l	#MEMF_CHIP,d1
		move.l	4.w,a6
		jsr	_LVOAllocMem(a6)
		move.l	(sp)+,a5
		move.l	d0,temp_chunk_address(a5)
		bne.s	.skip_temp_mem
		moveq.l	#41,d0			;error number 41
		bra	.error
.skip_temp_mem

		bsr	grab_memory
		tst.l	d0
		bne.s	.error

		move.l	temp_chunk_address(a5),code_load_address(a5)
		move.l	temp_chunk_address(a5),code_unpack_address(a5)
		bsr	define_code_relocate_addresses

		moveq.l	#0,d0			;no errors
.error		rts

****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

define_code_load_addresses

		cmpi.b	#DEST_CHIP,code_load_dest(a5)
		bne.s	.not_load_into_chip
		move.l	chip_chunk_address(a5),code_load_address(a5)
		bne.s	.not_load_into_chip
		move.l	chip_mem_address(a5),code_load_address(a5)
.not_load_into_chip

		cmpi.b	#DEST_PUBLIC,code_load_dest(a5)
		bne.s	.not_load_into_public
		move.l	public_chunk_address(a5),code_load_address(a5)
		bne.s	.not_load_into_public
		move.l	public_mem_address(a5),code_load_address(a5)
.not_load_into_public

		rts

define_code_unpack_addresses

		cmpi.b	#DEST_CHIP,code_unpack_dest(a5)
		bne.s	.not_unpack_into_chip
		move.l	chip_chunk_address(a5),code_unpack_address(a5)
		bne.s	.not_unpack_into_chip
		move.l	chip_mem_address(a5),code_unpack_address(a5)
.not_unpack_into_chip

		cmpi.b	#DEST_PUBLIC,code_unpack_dest(a5)
		bne.s	.not_unpack_into_public
		move.l	public_chunk_address(a5),code_unpack_address(a5)
		bne.s	.not_unpack_into_public
		move.l	public_mem_address(a5),code_unpack_address(a5)
.not_unpack_into_public

		rts

define_code_relocate_addresses

		cmpi.b	#DEST_CHIP,code_reloc_dest(a5)
		bne.s	.not_reloc_into_chip
		move.l	chip_chunk_address(a5),code_reloc_address(a5)
		bne.s	.not_reloc_into_chip
		move.l	chip_mem_address(a5),code_reloc_address(a5)
.not_reloc_into_chip

		cmpi.b	#DEST_PUBLIC,code_reloc_dest(a5)
		bne.s	.not_reloc_into_public
		move.l	public_chunk_address(a5),code_reloc_address(a5)
		bne.s	.not_reloc_into_public
		move.l	public_mem_address(a5),code_reloc_address(a5)
.not_reloc_into_public

		rts

****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

grab_memory
		movem.l	d1-d6/a0-a6,-(sp)

		move.l	chip_chunk_max_amount(a5),d2
		beq.s	.no_chip_required
		move.w	#MEMF_CHIP,d1		;search for maximum chip
		bsr     search_memlist
		tst.l	d0
		beq.s	.chip_found
		move.l	chip_chunk_min_amount(a5),d2
		beq.s	.chip_error
		move.w	#MEMF_CHIP,d1		;search for minimum chip
		bsr     search_memlist
		tst.l	d0
		beq.s	.chip_found
.chip_error	moveq.l	#35,d0			;error number 35
		bra.s	.error
.chip_found	move.l	a0,chip_mem_address(a5)
		move.l	d1,chip_amount_allocated(a5)
.no_chip_required

		move.l	public_chunk_max_amount(a5),d2
		beq.s	.no_public_required
		move.w	#MEMF_PUBLIC,d1		;search for maximum public
		bsr     search_memlist
		tst.l	d0
		beq.s	.public_found
		move.l	public_chunk_min_amount(a5),d2
		beq.s	.public_error
		move.w	#MEMF_PUBLIC,d1		;search for minimum public
		bsr     search_memlist
		tst.l	d0
		beq.s	.public_found
.public_error	moveq.l	#37,d0			;error number 37
		bra.s	split_chip_mem
.public_found	move.l	a0,public_mem_address(a5)
		move.l	d1,public_amount_allocated(a5)
		cmp.l	chip_mem_address(a5),a0
		beq.s	split_chip_mem
.no_public_required

.no_error	moveq.l	#0,d0
.error		movem.l	(sp)+,d1-d6/a0-a6
		rts

;Do this code if public chunk needs to use chip memory
split_chip_mem
		move.l	chip_chunk_max_amount(a5),d3
		add.l	public_chunk_max_amount(a5),d4
		bsr	split
		tst.l	d0
		beq.s	.no_error

		move.l	chip_chunk_max_amount(a5),d3
		add.l	public_chunk_min_amount(a5),d4
		bsr	split
		tst.l	d0
		beq.s	.no_error

		move.l	chip_chunk_min_amount(a5),d3
		add.l	public_chunk_max_amount(a5),d4
		bsr	split
		tst.l	d0
		beq.s	.no_error

		move.l	chip_chunk_min_amount(a5),d3
		add.l	public_chunk_min_amount(a5),d4
		bsr	split
		tst.l	d0
		beq.s	.no_error

.no_error	moveq.l	#0,d0
.error		movem.l	(sp)+,d1-d6/a0-a6
		rts

split		move.l	d3,d2
		add.l	d4,d2
		move.w	#MEMF_CHIP,d1		;search for chip
		bsr     search_memlist
		tst.l	d0
		beq.s	.mem_found
		moveq.l	#37,d0			;error number 37
		bra.s	.error
.mem_found	move.l	a0,chip_mem_address(a5)
		move.l	a0,public_mem_address(a5)
		add.l	d3,public_mem_address(a5)

		move.l	d3,chip_amount_allocated(a5)
		move.l	d4,public_amount_allocated(a5)

		moveq.l	#0,d0
.error		rts

****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;		d1.w=memory type
;		d2.l=size required
;OUTPUT:	d0.l=error code (0=found, -1=not found)
;		d1.l=size of memory
;		a0.l=address of memory
;CHANGES:	none

search_memlist
		movem.l	d2-d6/a6,-(sp)

		move.l  $4,a6
		move.l	MemList(a6),a6		;get address of first
						; memory region structure

.next_node	move.w	MH_ATTRIBUTES(a6),d0	;get memory type
		and.w	d1,d0
		beq.s	.not_found		;branch if found
                move.l	MH_UPPER(a6),d3
		sub.l	MH_LOWER(a6),d3		;d3=size of memory chunk

		cmp.l	d3,d2			;chunk big enough?
		ble.s	.found			;yes, then branch
.not_found
		move.l	LN_SUCC(a6),a6
		cmp.l	#0,a6
		bne.s	.next_node		;branch if not end of list

		moveq.l	#-1,d0
		movem.l	(sp)+,d2-d6/a6
		rts

.found		move.l	MH_LOWER(a6),a0
		move.l	d3,d1
		moveq.l	#0,d0

		movem.l	(sp)+,d2-d6/a6
		rts

****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

do_allocation
		move.l	a5,-(sp)		;find largest free chip
		move.l	#MEMF_CHIP!MEMF_LARGEST,d1
		move.l	4.w,a6
		jsr	_LVOAvailMem(a6)
		move.l	(sp)+,a5
		move.l	d0,largest_chip(a5)

		move.l	a5,-(sp)		;find largest free public
		move.l	#MEMF_PUBLIC!MEMF_LARGEST,d1
		move.l	4.w,a6
		jsr	_LVOAvailMem(a6)
		move.l	(sp)+,a5
		move.l	d0,largest_public(a5)

		move.l	chip_chunk_max_amount(a5),d0
		beq.s	.skip_chip_mem
		move.l	a5,-(sp)		;allocate maximum chip memory
		move.l	#MEMF_CHIP,d1
		move.l	4.w,a6
		jsr	_LVOAllocMem(a6)
		move.l	(sp)+,a5
		move.l	chip_chunk_max_amount(a5),chip_amount_allocated(a5)
		move.l	d0,chip_chunk_address(a5)
		bne.s	.skip_chip_mem
		move.l	chip_chunk_min_amount(a5),d0
		beq.s	.chip_error
		move.l	a5,-(sp)		;allocate minimum chip memory
		move.l	#MEMF_CHIP,d1
		move.l	4.w,a6
		jsr	_LVOAllocMem(a6)
		move.l	(sp)+,a5
		move.l	chip_chunk_min_amount(a5),chip_amount_allocated(a5)
		move.l	d0,chip_chunk_address(a5)
		bne.s	.skip_chip_mem
.chip_error	clr.l	chip_amount_allocated(a5)
		moveq.l	#11,d0			;error number 11
		bra	.error
.skip_chip_mem

		move.l	public_chunk_max_amount(a5),d0
		beq.s	.skip_public_mem
		move.l	a5,-(sp)		;allocate maximum public memory
		move.l	#MEMF_PUBLIC,d1
		move.l	4.w,a6
		jsr	_LVOAllocMem(a6)
		move.l	(sp)+,a5
		move.l	public_chunk_min_amount(a5),public_amount_allocated(a5)
		move.l	d0,public_chunk_address(a5)
		bne.s	.skip_public_mem
		move.l	public_chunk_min_amount(a5),d0
		beq.s	.public_error
		move.l	a5,-(sp)		;allocate minimum public memory
		move.l	#MEMF_PUBLIC,d1
		move.l	4.w,a6
		jsr	_LVOAllocMem(a6)
		move.l	(sp)+,a5
		move.l	public_chunk_min_amount(a5),public_amount_allocated(a5)
		move.l	d0,public_chunk_address(a5)
		bne.s	.skip_public_mem
.public_error	clr.l	public_amount_allocated(a5)
		moveq.l	#13,d0			;error number 13
                bra.s	.error
.skip_public_mem

		moveq.l	#0,d0			;no errors
.error		rts

****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	none
;CHANGES:	none

deallocate_memory
		tst.l	chip_chunk_address(a5)
		beq.s	.skip_free_chip
		move.l	a5,-(sp)		;free chip memory
		move.l	chip_chunk_address(a5),a1
		move.l	chip_amount_allocated(a5),d0
		move.l	4.w,a6
		jsr	_LVOFreeMem(a6)
		move.l	(sp)+,a5
		clr.l	chip_chunk_address(a5)
.skip_free_chip

		tst.l	public_chunk_address(a5)
		beq.s	.skip_free_public
		move.l	a5,-(sp)		;free public memory
		move.l	public_chunk_address(a5),a1
		move.l	public_amount_allocated(a5),d0
		move.l	4.w,a6
		jsr	_LVOFreeMem(a6)
		move.l	(sp)+,a5
		clr.l	public_chunk_address(a5)
.skip_free_public

		tst.l	temp_chunk_address(a5)
		beq.s	.skip_free_temp
		move.l	a5,-(sp)		;free temp memory
		move.l	temp_chunk_address(a5),a1
		move.l	temp_chunk_amount(a5),d0
		move.l	4.w,a6
		jsr	_LVOFreeMem(a6)
		move.l	(sp)+,a5
		clr.l	temp_chunk_address(a5)
.skip_free_temp

		rts

****************************************************************************
****************************************************************************
****************************************************************************

graphics_name	dc.b	"graphics.library",0
intuition_name	dc.b	"intuition.library",0
dos_name	dc.b	"dos.library",0
takeover_name	dc.b	"takeover.library",0
misc_name	dc.b	"misc.resource",0
potgo_name	dc.b	"potgo.resource",0
serial_name	dc.b	"serial.device",0
parallel_name	dc.b	"parallel.device",0
console_name	dc.b	"con:0/11/640/150/System Takeover Output",0

		even

****************************************************************************
****************************************************************************
****************************************************************************

lvl3_code
		movem.l	d0-d7/a0-a6,-(sp)
		move.l	lvl3_server+parameters(pc),a1
		cmpa.l	#0,a1
		beq.s	.no_user_routine
		move.l	a1,-(sp)
		jmp	(a1)			;jump to user routine
.no_user_routine
		movem.l	(sp)+,d0-d7/a0-a6
		move.l	d0,a5
		moveq.l	#0,d0
		rts

lvl2_code
		movem.l	d0-d7/a0-a6,-(sp)
		move.l	lvl2_server+parameters(pc),a1
		cmpa.l	#0,a1
		beq.s	.no_user_routine
		move.l	a1,-(sp)
		jmp	(a1)			;jump to user routine
.no_user_routine
		movem.l	(sp)+,d0-d7/a0-a6
		move.l	d0,a5
		moveq.l	#0,d0
		rts

lvl6_code
		movem.l	d0-d7/a0-a6,-(sp)
		move.l	lvl6_server+parameters(pc),a1
		cmpa.l	#0,a1
		beq.s	.no_user_routine
		move.l	a1,-(sp)
		jmp	(a1)			;jump to user routine
.no_user_routine
		movem.l	(sp)+,d0-d7/a0-a6
		move.l	d0,a5
		moveq.l	#0,d0
		rts

warning_mesg	ITEXT	1*8,5,<"Hired Guns needs ALL of your Amiga's memory to run.">,.message1
.message1	ITEXT	8*8+3,25,<"All running programs will be stopped">,.message2
.message2	ITEXT	9*8+4,35,<"and any unsaved data will be lost.">,AUTONEXTTEXT
warning_but1	ITEXT	0,0,<"Run Hired Guns">,AUTONEXTTEXT
warning_but2	ITEXT	0,0,<"Quit">,AUTONEXTTEXT

		CNOP	0,4		;!!! Must be long word aligned !!!

parameters	dc.b	"Hired Guns",0,0,0,0,0,0
		dc.l	0		;chip memory min amount
		dc.l	0		;public memory min amount
		dc.l	500*1024	;chip memory maximum amount
		dc.l	500*1024	;public memory maximum amount

		dc.l	150*1024	;temp memory amount
		dc.l	0		;level 2 user interrupt routine
		dc.l	0		;level 3 user interrupt routine
		dc.l	0		;level 6 user interrupt routine

		dc.b	DEST_CHIP	;chunk to load code to
		dc.b	DEST_CHIP	;chunk to unpack code to
		dc.b	DEST_PUBLIC	;chunk to relocate code to

		dc.b	FLAGF_POTGO!FLAGF_PARALLEL
					;resource allocation flags

		dc.l	0		;graphics_base
		dc.l	0		;intuition_base
		dc.l	0		;dos_base
		dc.l	0		;takeover_base
		dc.l	0		;misc_base
		dc.l	0		;potgo_base
		dc.l	0		;hardware base
		dc.l	0		;size of chip chunk allocated
		dc.l	0		;size of public chunk allocated
		dc.l	0		;largest free chip chunk
		dc.l	0		;largest free public chunk
		dc.l	0		;chip chunk start address
		dc.l	0		;public chunk start address
		dc.l	0		;temp chunk start address
		dc.l	0		;chip mem start address
		dc.l	0		;public mem start address
		dc.l    0		;screen bitmaps
		dc.l	0		;screen1_struct
		dc.l	0		;screen2_struct
		dc.l	0		;stdout_handle
		dc.l	0		;console_handle
		dc.l	0		;wbench_message
		dc.l	0		;address of cli arguments
		dc.w	0		;number of characters in cli args
		dc.b	0		;flag for info output
		dc.b	0		;flag relocate required
		ds.b	NAME_SIZE	;code filename
		dc.l	0		;address to load code to
		dc.l	0		;address to unpack code to
		dc.l	0		;address to relocate code to
		dc.l    0               ;current address of code
		dc.l	0		;size of unpacked code file
		dc.l    0		;lock on code file
		ds.b	fib_SIZEOF	;code file info block
		dc.b	0		;flag memory allocation failed
		dc.b	0		;flag code unpack
		dc.b	0		;serial_port
		dc.b	0		;serial_bits
		dc.b	0		;parallel_port
		dc.b	0		;parallel_bits
		dc.l	0		;potgo_bits
		dc.b	0		;int_ciaa_a
		dc.b	0		;int_vertb
		dc.b	0		;int_ciab_A
		dc.b	0		;flag quiet required

		even

		end
