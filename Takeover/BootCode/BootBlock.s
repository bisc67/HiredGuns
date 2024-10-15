********************************************************************************
*
*	BootBLock.s
*	Release 1.0
*	Date 8/4/93
*
*       The cdtv.device generates level 2 interrupts. Without the operating
*	system intact it is not possible to reply to them. Starting the main
*	code directly from the boot block circumnavigates the normal boot
*	procedure, thus the cdtv.device is never opened (and the interrupt
*	never enabled).
*
*	Copyright © Scott Johnston 1993
*	All Rights Reserved Worldwide
*
********************************************************************************

		opt	o+,ow-,p+

		incdir	include:

		include	exec/exec_lib.i
		include	exec/execbase.i
		include	exec/io.i
		include	exec/memory.i
		include	devices/trackdisk.i
		include	resources/disk.i
		include	hardware/custom.i
		include	hardware/cia.i

CODE_SECTOR	equ	917
CODE_LENGTH	equ     9

********************************************************************************

;---- boot block header --------------------------------------------------------

		dc.b	"DOS",0			;ASCII identification
		dc.l	0			;checksum goes here
		dc.l	$370			;pointer to root block

;---- standard boot block code -------------------------------------------------

standard_boot_code
		move.l	a5,-(sp)
		lea	variables(pc),a5
		move.l	a1,iorequest(a5)		;remember pointer to
		move.l	(sp)+,a5
							; iorequest
		lea	dos_name(pc),a1
		jsr	_LVOFindResident(a6)		;dos.library available?
		tst.l	d0
		beq.s	.error				;no, then error
		move.l	d0,a0
		move.l	22(a0),a0

		movem.l	d1-d7/a0-a6,-(sp)
		bsr	custom_boot_code		;call custom code
		movem.l	(sp)+,d1-d7/a0-a6

		tst.l	d0
		bne.s	.error

		moveq.l	#0,d0				;flag no errors
		rts					;return to ROM

.error		moveq.l	#-1,d0				;flag error
		rts					;return to ROM

;---- custom boot block code ---------------------------------------------------

custom_boot_code
		lea	variables(pc),a5

		move.l	4.w,a6
		jsr	_LVOForbid(a6)			;task switching off

		lea	DeviceList(a6),a0
		lea	cdtv_name(pc),a1
		jsr	_LVOFindName(a6)		;cdtv device in system?
		move.l	d0,-(sp)
		jsr	_LVOPermit(a6)			;task switching on
		move.l	(sp)+,d0
;		tst.l	d0				;no, then branch
;		beq.s	.no_error

		moveq.l	#1,d0
		bsr	switch_motor			;motor on
		bne.s	.error

		move.l	#TD_SECTOR*CODE_LENGTH,d0	;enough for boot code
		move.l	#MEMF_CHIP,d1
		move.l	4.w,a6
		jsr	_LVOAllocMem(a6)
		move.l	d0,memory(a5)			;remember address
		beq.s	.error

		move.l	memory(a5),a0			;destination
		move.l	#TD_SECTOR*CODE_LENGTH,d0	;length
		move.l	#TD_SECTOR*CODE_SECTOR,d1		;offset in disk
		bsr	read_blocks			;read 2 extra blocks
		bne.s	.error

		move.l	memory(a5),a0			;data
		move.l	#TD_SECTOR*CODE_LENGTH,d0	;length
		bsr	make_raw			;sectored to raw

		moveq.l	#0,d0
		bsr	switch_motor			;motor off
		bne.s	.error

		move.l	memory(a5),a0
		jmp	(a0)

.no_error	moveq.l	#0,d0				;flag no error
		rts

.error		moveq.l	#-1,d0				;flag error
		move.w	#$f00,$dff180
		rts

;---- motor on/off -------------------------------------------------------------
;INPUT :	d0.w = motor state (0 = off, 1 = on)
;		a2.l = pointer to iorequest structure
;OUTPUT :	z = error (0 = no error, 1 = error)

switch_motor
		move.l	iorequest(a5),a1

		move.w	#TD_MOTOR,IO_COMMAND(a1)
		move.w	#0,IO_FLAGS(a1)
		move.w	d0,IO_LENGTH(a1)
		move.l	4.w,a6
		jsr	_LVODoIO(a6)

		tst.b	IO_ERROR(a1)
		bne.s	.error

		moveq.l	#0,d0				;flag no error
		rts

.error		moveq.l	#-1,d0				;flag error
		rts

;---- read block(s) ------------------------------------------------------------
;INPUT :	d0.l = length (multiple of sector size)
;		a0.l = destination address (word aligned)
;		d1.l = offset on disk (multiple of sector size)
;		a2.l = pointer to iorequest structure
;OUTPUT :	z = error (0 = no error, 1 = error)

read_blocks
		move.l	iorequest(a5),a1

		move.w	#CMD_READ,IO_COMMAND(a1)
		move.w	#0,IO_FLAGS(a1)
		move.l	d0,IO_LENGTH(a1)
		move.l	a0,IO_DATA(a1)
		move.l	d1,IO_OFFSET(a1)
		move.l	4.w,a6
		jsr	_LVODoIO(a6)

		tst.b	IO_ERROR(a1)
		bne.s	.error

		moveq.l	#0,d0				;flag no error
		rts

.error		moveq.l	#-1,d0				;flag error
		rts

;---- make raw -----------------------------------------------------------------
;INPUT :	a0.l = pointer to data
;		d0.l = length in bytes (multiple of sector size)

SECTOR_HEADER	equ	24

make_raw
		divu	#TD_SECTOR,d0
		subq.w	#1,d0

		move.l	a0,a1

.sector_loop	lea	SECTOR_HEADER(a1),a1
		move.w	#((TD_SECTOR-SECTOR_HEADER)/4)-1,d1

.copy_loop	move.l	(a1)+,(a0)+
		dbf	d1,.copy_loop

		dbf	d0,.sector_loop
		rts

;---- data ---------------------------------------------------------------------

dos_name	dc.b	"dos.library",0
cdtv_name	dc.b	"cdtv.device",0
		even

		rsreset
memory		rs.l	1
iorequest	rs.l	1
vars_size	rs.b	0

variables	ds.b	vars_size

		dc.b	"**** This is a custom boot block for Hired Guns. Please do not "
		dc.b	"remove me. ****"

		even
