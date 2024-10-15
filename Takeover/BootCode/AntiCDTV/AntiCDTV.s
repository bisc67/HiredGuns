********************************************************************************
*
*	AntiCDTV.s
*	Release 1.0
*	Date 30/8/93
*
*	CDTV.device units (CD0: etc) generate level 2 interrupts.
*	Without the operating system intact it is not easy to reply to
*	them, resulting in a continuous stream of interrupt requests.
*	Dismounting the CD0: volume from the expansion.library during
*	bootup prevents this interrupt problem.
*
*	Hired Guns WILL run OS friendly with the HD version when enough RAM
*	is available! Hardware hacks are only necessary to get the best out of
*	1MB floppy machines.
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
		include	exec/nodes.i
		include	exec/resident.i
		include	hardware/custom.i
		include	hardware/cia.i
		include libraries/expansion_lib.i
		include libraries/expansionbase.i
		include dos/dosextens.i
		include dos/filehandler.i

;Manufacturer
CBM		equ	$202

;Prouduct
A590		equ	$3

********************************************************************************

;---- boot block header --------------------------------------------------------

start		dc.b	"DOS",0				;ASCII identification
		dc.l	0				;checksum goes here
		dc.l	$370				;pointer to root block

;---- standard boot block code -------------------------------------------------

standard_boot_code
		lea	dos_name(pc),a1
		jsr	_LVOFindResident(a6)		;dos.library available?
		tst.l	d0
		beq.s	.error				;no, then error
		move.l	d0,a0
		move.l	22(a0),a0

		bsr	custom_boot_code		;call custom code

		moveq.l	#0,d0				;flag no errors
		rts					;return to ROM

.error		moveq.l	#-1,d0				;flag error
		rts					;return to ROM

;---- custom code --------------------------------------------------------------

custom_boot_code
		movem.l	d0-d7/a0-a6,-(sp)		;save everything
							; (just in case)

		move.l	4.w,a6				;ye olde execbase
		jsr	_LVOForbid(a6)

		lea	DeviceList(a6),a0		;calling cdtv.device
		lea	cdtv_name(pc),a1		; are you out there?
		jsr	_LVOFindName(a6)		;
		tst.l	d0				; no, then exit
		beq.s	.device_not_found

.again		bsr	remove_cd_volume		;remove all volumes with
		tst.l	d0				; names starting with "CD"
		beq.s	.again

.device_not_found
		jsr	_LVOPermit(a6)

		movem.l	(sp)+,d0-d7/a0-a6
		rts

;-------------------------------------------------------------------------------
;IN:		a6.l = execbase
;OUT:		d0.l =	0 = no CD volume found
;		       -1 = found a CD volume
;CHANGES:	none

remove_cd_volume
		movem.l	d1/a0-a2/a6,-(sp)

		lea	expansion_name(pc),a1
		moveq.l	#0,d0
		jsr	_LVOOpenLibrary(a6)

;		move.l	d0,a6
;		suba.l	a0,a0
;		move.l	#CBM,d0
;		move.l	#A590,d1
;		jsr	_LVOFindConfigDev(a6)

;		tst.l	d0
;		beq.s	.cant_find

;		move.l	d0,a0
;		jsr	_LVORemConfigDev(a6)

		move.l	d0,a1
		lea	eb_MountList(a1),a1

		move.l	LH_TAILPRED(a1),d1
.loop		move.l	d1,a1
		move.l	LN_PRED(a1),d1
		beq.w	.cant_find

;		move.l	bn_DeviceNode(a1),a2
;		cmp.l	#DLT_DEVICE,dl_Type(a2)
;		bne.s	.loop
;		move.l	dn_Name(a2),a2

		cmpi.b	#2,LN_PRI(a1)
		bne.s	.loop

;		move.l	LN_NAME(a1),a2

;		cmp.b	#"D",(a2)			;examine volume name
;		bne.s	.loop				; (arrgghhh! I cant
;		cmp.b	#"F",1(a2)			; get this bit to work)
;		bne.s	.loop

		jsr	_LVORemove(a6)			;remove volume

.ok		moveq.l	#-1,d0
		bra.s	.exit

.cant_find	moveq.l	#0,d0

.exit		movem.l (sp)+,d1/a0-a2/a6
		rts

;---- data ---------------------------------------------------------------------

dos_name	dc.b	"dos.library",0
cdtv_name	dc.b	"cdtv.device",0
expansion_name	dc.b	"expansion.library",0
		even

		dc.b	"****>>> This is a custom boot block for Hired Guns."
		dc.b	"Please do not remove me. <<<***"
		even
