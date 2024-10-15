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
		include libraries/expansionbase.i
		include dos/dosextens.i
		include dos/filehandler.i

********************************************************************************

;---- boot block header --------------------------------------------------------

start		dc.b	"DOS",0			;ASCII identification
		dc.l	0			;checksum goes here
		dc.l	$370			;pointer to root block

;---- standard boot block code -------------------------------------------------

standard_boot_code
		lea	dosname(pc),a1
		jsr	_LVOFindResident(a6)		;dos.library available?
		tst.l	d0
		beq.s	.error				;no, then error
		move.l	d0,a0
		move.l	22(a0),a0

		movem.l	d0-d7/a0-a6,-(sp)
		bsr	init_romtag			;call custom code
		movem.l	(sp)+,d0-d7/a0-a6

		moveq.l	#0,d0				;flag no errors
		rts					;return to ROM

.error		moveq.l	#-1,d0				;flag error
		rts					;return to ROM

;---- init romtag ---------------------------------------------------------------

init_romtag
		lea	DeviceList(a6),a0
		lea	devname(pc),a1
		jsr	_LVOFindName(a6)		;device in system?
		tst.l	d0				;no, then branch
		beq.s	.device_not_found

		bsr	romtag_init

;		move.l	4.w,a6
;
;		bsr	romtag_init
;		tst.l	d0
;		bne.s	.no_volume
;
;		lea	romtag(pc),a0
;
;		lea	restable(pc),a1			;set up resident table
;		move.l	a0,(a1)
;
;		lea	mementry(pc),a1			;set up memlist
;		move.l	a0,ME_ADDR(a1)
;
;		move.l	a0,RT_MATCHTAG(a0)		;set up romtag
;		lea	end_romtag(pc),a1
;		move.l	a1,RT_ENDSKIP(a0)
;		lea	romtag_init(pc),a1
;		move.l	a1,RT_INIT(a0)
;
;		lea	memlist(pc),a1
;		move.l	a1,KickMemPtr(a6)		;add memlist to KickMemPtr
;
;		lea	restable(pc),a1
;		move.l	a1,KickTagPtr(a6)		;add romtag to KicktagPtr
;
;		jsr	_LVOSumKickData(a6)
;		move.l	d0,KickCheckSum(a6)		;new checksum
;
;		jsr	_LVOColdReboot(a6)
;
.device_not_found
		rts

;---- romtag -------------------------------------------------------------------

;restable	dc.l	0			;pointer to my romtag
;		dc.l	0			;eod
;
;memlist		dc.l	0			;LN_SUCC	Pointer to next (successor)
;		dc.l	0			;LN_PRED	Pointer to previous (predecessor)
;		dc.b	NT_MEMORY		;LN_TYPE
;		dc.b	0			;LN_PRI		Priority, for sorting
;		dc.l	0			;LN_NAME	ID string, null terminated
;
;		dc.w	1			;ML_NUMENTRIES	The number of ME structures that follow
;mementry	dc.l	0			;ME_ADDR	the address of this block (an alias
;						;		for the same location as ME_REQS)
;		dc.l	end_romtag-romtag	;ME_LENGTH	the length of this region
;
;
;romtag		dc.w	$4afc			;rt_Matchword
;		dc.l	0			;rt_MatchTag
;		dc.l	0			;rt_EndSkip
;		dc.b	RTW_COLDSTART		;rt_Flags
;		dc.b	0			;rt_Version
;		dc.b	0			;rt_Type
;		dc.b	-49			;rt_Pri
;		dc.l	0			;rt_Name
;		dc.l	0			;rt_IdString
;		dc.l    0			;rt_Init

romtag_init
		movem.l	d1-d7/a0-a6,-(sp)

		move.l	4.w,a6

		jsr	_LVOForbid(a6)

;		clr.l	KickMemPtr(a6)				;reset kick vectors
;		clr.l	KickTagPtr(a6)
;		jsr	_LVOSumKickData(a6)
;		move.l	d0,KickCheckSum(a6)			;new checksum

		lea	expansion_name(pc),a1
		moveq.l	#0,d0
		jsr	_LVOOpenLibrary(a6)

		move.l	d0,a1
		lea	eb_MountList(a1),a1

		move.l	LH_TAILPRED(a1),d1
.loop		move.l	d1,a1
		move.l	LN_PRED(a1),d1
		beq.w	.cant_find

		move.l	bn_DeviceNode(a1),a2
		cmp.l	#DLT_DEVICE,dl_Type(a2)
		bne.s	.loop
		move.l	dn_Name(a2),a2

;		cmp.b	#"D",1(a2)			;examine volume name
;		bne.s	.loop
;		cmp.b	#"F",2(a2)
;		bne.s	.loop
;		cmp.b	#"0",3(a2)
;		bne.s	.loop

		jsr	_LVORemove(a6)				;remove volume

.cant_find
		jsr	_LVOPermit(a6)
		movem.l	(sp)+,d1-d7/a0-a6
		moveq.l	#0,d0
		rts

expansion_name	dc.b	"expansion.library",0

end_romtag

;---- data ---------------------------------------------------------------------

dosname		dc.b	"dos.library",0
devname		dc.b	"cdtv.device",0
		even

		dc.b	"**** This is a custom boot block for Hired Guns. Please do not "
		dc.b	"remove me. ***"

		even
