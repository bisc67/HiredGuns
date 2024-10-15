;---- custom boot block code ---------------------------------------------------

custom_boot_code
	move.l	4.w,a6

	jsr	_LVOForbid(a6)			;task switching off

	lea	devname(pc),a3
	bsr	expunge_device

.device_not_found
	jsr	_LVOPermit(a6)			;task switching on

	rts

expunge_device
	lea	DeviceList(a6),a0
        move.l	a3,a1
	jsr	_LVOFindName(a6)		;device in system?
	tst.l	d0				;no, then branch
	beq.s	.device_not_found

	move.l	d0,a1				;pointer to device structure
	jsr	_LVORemDevice(a6)		;expunge it!

	lea	DeviceList(a6),a0
        move.l	a3,a1
	jsr	_LVOFindName(a6)		;device in system?
	tst.l	d0				;no, then branch
	bne.s	.could_not_expunge

	move.w	#$0f0,$dff180

	rts

.could_not_expunge
	move.w	#$f00,$dff180
	rts

.device_not_found
	move.w	#$00f,$dff180
	rts

;---- data ---------------------------------------------------------------------

dosname	dc.b	"dos.library",0
devname	dc.b	"cdtv.device",0

	dc.b	"**** This is a custom boot block for Hired Guns. Please do not "
	dc.b	"remove me. This code expunges the cdtv.device from the system "
	dc.b	"allowing Hired Guns to work on the CDTV from floppy. ****"

	even
