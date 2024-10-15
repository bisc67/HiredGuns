********************************************************************************
*
*	Library.s
*	Release 2.4
*	Date 3/4/93
*
*	Friendly system takeover
*	Library routines available from main code
*
*	Copyright © Scott Johnston 1991-93
*	All Rights Reserved Worldwide
*
********************************************************************************

		include	hardware/intbits.i
		include	hardware/dmabits.i
		include	intuition/intuition.i
FUNC_CNT	SET	LIB_USERDEF
		include	intuition/intuition_lib.i

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		none
;OUTPUT:	none
;CHANGES:	none

wbench_to_front
		movem.l	d0-d7/a0-a6,-(sp)

		move.w	#0,aud0lch+vol(a6)
		move.w	#0,aud1lch+vol(a6)
		move.w	#0,aud2lch+vol(a6)
		move.w	#0,aud3lch+vol(a6)
		clr.w	variables+old_back_sample(a5)

		move.l	vars_block,a5

		jsr	temp_restore_system
		clr.l	int_ports_server(a5)

		jsr	restore_copper

		move.l	intuition_base(a5),a6
		jsr	_LVOViewAddress(a6)

		move.l	d0,a1
		move.l	graphics_base(a5),a6
		jsr	_LVOLoadView(a6)

		move.l	intuition_base(a5),a6
		jsr	_LVORemakeDisplay(a6)

		move.l	screen_struct(a5),a0
		move.w	sc_LeftEdge(a0),d0
		move.w	sc_TopEdge(a0),d1
		neg.w	d0
		neg.w	d1
		jsr	_LVOMoveScreen(a6)

		jsr	_LVOWBenchToFront(a6)

		move.l	screen_struct(a5),a0
		moveq.l	#TRUE,d0
		jsr	_LVOShowTitle(a6)

.loop		move.l	window_struct(a5),a0	;wait for next message
		bsr	get_message
		tst.w	d0			;continue?
		beq.s	.loop			;no, then branch

;		move.l	backwindow_struct(a5),a0
;		move.l	#IDCMP_ACTIVEWINDOW,d0;wait for activate message
;		move.l	intuition_base(a5),a6
;		jsr	_LVOModifyIDCMP(a6)

;.loop2		move.l	backwindow_struct(a5),a0	;wait for activate message
;		bsr	get_message
;		tst.w	d0				;continue?
;		beq.s	.loop2				;no, then branch

;		move.l	backwindow_struct(a5),a0
;		move.l	#0,d0			;no IDCMP
;		move.l	intuition_base(a5),a6
;		jsr	_LVOModifyIDCMP(a6)

		move.l	screen_struct(a5),a0
		moveq.l	#FALSE,d0
		move.l	intuition_base(a5),a6
		jsr	_LVOShowTitle(a6)

		move.l	screen_struct(a5),a0
		move.l	intuition_base(a5),a6
		jsr	_LVOScreenToFront(a6)

		move.l	backwindow_struct(a5),a0
		move.l	intuition_base(a5),a6
		jsr	_LVOActivateWindow(a6)

		move.l	graphics_base(a5),a6
		jsr	_LVOWaitTOF(a6)
		jsr	_LVOWaitTOF(a6)

		suba.l	a1,a1
		move.l	graphics_base(a5),a6		;kill AA chip set
		jsr	_LVOLoadView(a6)

		moveq.l	#25,d1
		move.l	dos_base(a5),a6
		jsr	_LVODelay(a6)

		move.l	#level2_key_interrupt,int_ports_server(a5)
		jsr	temp_take_system

		movem.l	(sp)+,d0-d7/a0-a6

		rts

********************************************************************************
;INPUT:		a0.l=address of window structure
;OUTPUT:	d0.w=gadget (0=not a gadget up/down message)
;CHANGES:       a6

get_message
		movem.l	a0-a6/d1-d7,-(sp)

.wait		move.l	wd_UserPort(a0),a0
		moveq.l	#0,d1
		move.b	MP_SIGBIT(a0),d1
		moveq.l	#0,d0
		bset	d1,d0

		move.l	a0,-(sp)		;wait for next message
		move.l	4,a6
		jsr	_LVOWait(a6)
		move.l	(sp)+,a0

		move.l	a0,-(sp)		;get the message
		move.l	4,a6
		jsr	_LVOGetMsg(a6)
		move.l	(sp)+,a0

		tst.l	d0
		beq.s   .wait

		move.l	d0,a0
		moveq.l	#0,d0

		move.l	im_Class(a0),d1
		and.l	#IDCMP_GADGETUP,d1
		beq.s	.not_gadget

		move.l	im_IAddress(a0),a1
		move.w	gg_GadgetID(a1),d0
.not_gadget
		bsr	reply_message

		movem.l	(sp)+,a0-a6/d1-d7
		rts

********************************************************************************
;INPUT:		a0.l=address of message structure
;OUTPUT:	none
;CHANGES:       a6

reply_message
		movem.l	a0-a6/d0-d7,-(sp)

		move.l	a0,a1

		move.l	4,a6			;reply to the message
		jsr	_LVOReplyMsg(a6)

		movem.l	(sp)+,a0-a6/d0-d7
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	none
;CHANGES:	none

restore_copper
		movem.l	d0-d7/a0-a6,-(sp)

		move.l	4.w,a6
		jsr	_LVOForbid(a6)		;disable task switching

		move.l	hardware_base(a5),a2
		move.w	#DMAF_RASTER!DMAF_COPPER!DMAF_SPRITE,dmacon(a2)
		move.l	graphics_base(a5),a6
		move.l	gb_copinit(a6),cop1lc(a2)
		move.l	gb_copinit(a6),cop2lc(a2)
		move.w	#DMAF_SETCLR!DMAF_RASTER!DMAF_COPPER!DMAF_SPRITE,dmacon(a2)
		move.w	#0,copjmp1(a2)

		move.l	4.w,a6
		jsr	_LVOPermit(a6)		;enable task switching

		move.l	graphics_base(a5),a6
		jsr	_LVOWaitTOF(a6)
		jsr	_LVOWaitTOF(a6)

		movem.l	(sp)+,d0-d7/a0-a6
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;Fully restore OS. Use just before finishing your program.
;!!!!! Only call this if you have been running OS friendly !!!!!
;INPUT:		none
;OUTPUT:	none
;CHANGES:	none

restore_system
		movem.l	d0-d7/a0-a6,-(sp)

		move.l	vars_block,a5

		move.l	#$dff000,a6
		move.w	#0,aud0lch+vol(a6)
		move.w	#0,aud1lch+vol(a6)
		move.w	#0,aud2lch+vol(a6)
		move.w	#0,aud3lch+vol(a6)
		move.w	#%0000010001111111,dmacon(a6)	;all dma off except
							; copper & bit plane
		move.w	#%1000011001110000,dmacon(a6)	;all dma except audio
		move.w	#%0000000000000000,copcon(a6)	;copper CANNOT access
                                                        ; blitter registers
		clr.l	int_ports_server(a5)
		clr.l	int_vblank_server(a5)
		clr.l	int_exter_server(a5)
		clr.l	int_copper_server(a5)
		clr.l	int_blitter_handler(a5)
		clr.l	ciaa_ta_handler(a5)
		clr.l	ciaa_tb_handler(a5)
		clr.l	ciab_ta_handler(a5)
		clr.l	ciab_tb_handler(a5)

		move.l	4.w,a6
		jsr	_LVOPermit(a6)		;enable task switching

		bsr	release_blitter

;		move.l	lowlevel_base(a5),a6
;		move.l	#0,d0
;		lea	.setjoyattrs_tags,a1
;		jsr	_LVOSetJoyPortAttrsA(a6)

		movem.l	(sp)+,d0-d7/a0-a6
		rts

;.setjoyattrs_tags
;		dc.l	SJA_Reinitialize,0
;		dc.l	TAG_END

****************************************************************************
****************************************************************************
****************************************************************************
;Restore OS temporarily. Use this before some IO then call temp_take_sytem
;just after.
;!!!!! Only call this if you are been running OS friendly !!!!!
;INPUT:		none
;OUTPUT:	none
;CHANGES:	none

temp_restore_system
		movem.l	d0-d7/a0-a6,-(sp)

		move.l	#$dff000,a6
		move.w	#%1000011001010000,dmacon(a6)	;all dma except audio
		move.w	#%0000000000000000,copcon(a6)	;copper CANNOT access

		move.l	4.w,a6
		jsr	_LVOPermit(a6)		;enable task switching

		move.l	vars_block,a5
		bsr	release_blitter

		movem.l	(sp)+,d0-d7/a0-a6
		rts

****************************************************************************
****************************************************************************
****************************************************************************
;Restore OS temporarily. Use this after some IO, call temp_restore_sytem
;just before.
;!!!!! Only call this if you are been running OS friendly !!!!!
;INPUT:		none
;OUTPUT:	none
;CHANGES:	none

temp_take_system
		movem.l	d0-d7/a0-a6,-(sp)

		move.l	vars_block,a5
		bsr	grab_blitter

		move.l	4.w,a6			;disable task switching
		jsr	_LVOForbid(a6)

		move.l	#$dff000,a6
		move.w	#%1000011001011111,dmacon(a6)	;all dma except audio
		move.w	#%0000000000000000,copcon(a6)	;copper CANNOT access
                                                        ; blitter registers
		movem.l	(sp)+,d0-d7/a0-a6

		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		none
;OUTPUT:	none
;CHANGES:	none

take_system	movem.l	d0-d7/a0-a6,-(sp)

		tst.l	os_kill
		bne	.os_dead

		move.l	vars_block,a5
		bsr	grab_blitter

		move.l	4.w,a6			;disable task switching
		jsr	_LVOForbid(a6)

		move.l	#$dff000,a6
		move.w	#0,aud0lch+vol(a6)
		move.w	#0,aud1lch+vol(a6)
		move.w	#0,aud2lch+vol(a6)
		move.w	#0,aud3lch+vol(a6)
		move.w	#%0000011111111111,dmacon(a6)
		move.w	#%1000011001110000,dmacon(a6)	;all dma except audio
		move.w	#%0000000000000000,copcon(a6)	;copper CANNOT access
                                                        ; blitter registers
		move.l	#level2_key_interrupt,int_ports_server(a5)
		move.l	#vblank_interrupt,int_vblank_server(a5)
		move.l	#copper_interrupt,int_copper_server(a5)
	IFD	BLITQ
		move.l	#blitter_interrupt,int_blitter_handler(a5)
	ENDC
		move.l	#_IntHandler,ciab_ta_handler(a5)

		movem.l	(sp)+,d0-d7/a0-a6

		rts

.os_dead	move.l	#$dff000,a6
		WAIT_BLIT
		move.l	#chipzero,a0
		add.l	fast_mem_base,a0
		move.l	a0,aud0lch(a6)
		move.l	a0,aud1lch(a6)
		move.l	a0,aud2lch(a6)
		move.l	a0,aud3lch(a6)
		move.w	#0,aud0lch+vol(a6)
		move.w	#0,aud1lch+vol(a6)
		move.w	#0,aud2lch+vol(a6)
		move.w	#0,aud3lch+vol(a6)
		move.w	#%0000011111111111,dmacon(a6)
		move.w	#%1000011001110000,dmacon(a6)	;all dma except audio
		move.w	#%0000000000000000,copcon(a6)	;copper CANNOT access
                                                        ; blitter registers
		move.w	#%0111111111111111,intreq(a6)	;clear all interupts
		move.w	#%0111111111111111,intena(a6)

		move.l	#level1,intvec1
		move.l	#level2,intvec2
		move.l	#level3,intvec3
		move.l	#level4,intvec4
		move.l	#level5,intvec5
		move.l	#level6,intvec6
		move.l	#level7,intvec7

		move.b	#%01111111,ciaaicr
		move.b	#%10001000,ciaaicr		;ciaa keyboard on
		move.b	#%01111100,ciabicr
		move.b	#%10000111,ciabicr		;ciab timer A & B, tod on

		move.b	#$ff,ciabtblo			;ciab timer B delay
		move.b	#$ff,ciabtbhi
		move.b	#%00000001,ciabcrb		;ciab timer B one-shot start

	IFD	BLITQ
		move.w	#%1110000001111000,intena(a6)	;interrupts on
	ELSEIF
		move.w	#%1110000000111000,intena(a6)	;interrupts on
	ENDC

		move.w	#$2000,sr

		movem.l	(sp)+,d0-d7/a0-a6

		rts

********************************************************************************
********************************************************************************
********************************************************************************
grab_blitter
		move.l	graphics_base(a5),a6	;own blitter
		jsr	_LVOOwnBlitter(a6)
		jsr	_LVOWaitBlit(a6)

	IFD	BLITQ

;--- add blitter interrupt -----------------------------------------------------
		move.w	requested_flags(a5),d0
		btst.l	#FLAGB_INT_BLITTER,d0
		beq	.no_blitter_handler

		move.l	hardware_base(a5),a6
		sf.b	int_blitter_flag(a5)
		move.w	intenar(a6),d0
		btst.l	#INTB_BLIT,d0
		beq.s	.blitter_int_not_on
		st.b	int_blitter_flag(a5)
.blitter_int_not_on
		move.w	#INTF_BLIT,intena(a6)		;disable interrupt

		lea	blitter_struct,a1
		move.b	#NT_INTERRUPT,LN_TYPE(a1)
		move.b	int_blitter_priority(a5),LN_PRI(a1)
		move.l	#program_name,LN_NAME(a1)
		move.l	#blitter_code,IS_CODE(a1)
		move.l	#INTB_BLIT,d0
		move.l	4.w,a6
		jsr	_LVOSetIntVector(a6)
		move.l	d0,old_blitter_handler(a5)

		move.l	hardware_base(a5),a6
		move.w	#INTF_SETCLR!INTF_BLIT,intena(a6)
							;enable interrupt
		or.w	#FLAGF_INT_BLITTER,installed_flags(a5)
.no_blitter_handler

	ENDC
		rts

release_blitter
	IFD	BLITQ

;--- remove blitter interrupt handler ------------------------------------------
		move.w	installed_flags(a5),d0
		btst.l	#FLAGB_INT_BLITTER,d0
		beq.s	.no_blitter_handler

		move.l	hardware_base(a5),a6
		move.w	#INTF_BLIT,intena(a6)		;disable interrupt

		move.l	old_blitter_handler(a5),a1
		move.l	#INTB_BLIT,d0
		move.l	4.w,a6
		jsr	_LVOSetIntVector(a6)
		eor.w	#FLAGF_INT_BLITTER,installed_flags(a5)

		tst.b	int_blitter_flag(a5)
		beq.s	.blitter_int_not_on
		move.l	hardware_base(a5),a6
		move.w	#INTF_SETCLR!INTF_BLIT,intena(a6)
.blitter_int_not_on
.no_blitter_handler

	ENDC

		move.l	graphics_base(a5),a6	;disown blitter
		jsr	_LVODisownBlitter(a6)

		rts

program_name	dc.b	"Hired Guns",0

********************************************************************************

blitter_struct	ds.b	IS_SIZE

blitter_code	move.w	#INTF_BLIT,intreq(a0)	;respond to interrupt
		movem.l	d2-d7/a2-a4,-(sp)
		move.l	vars_block,a1
		move.l	int_blitter_handler(a1),a1
		cmpa.l	#0,a1
		beq.s	.ret
		jsr     (a1)			;jump to user routine
.ret		movem.l	(sp)+,d2-d7/a2-a4
		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a2.l=address of filename
;		a3.l=destination address
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

dos_load_file
		movem.l	d1-d7/a0-a6,-(sp)

		move.l	vars_block,a5
		move.l	dos_base(a5),a6

		move.l	a2,d1			;d1=filename
		move.l	#ACCESS_READ,d2		;d2=mode
		jsr	_LVOLock(a6)		;lock file
		move.l	d0,file_lock
		tst.l	d0
		beq.s	.error

		move.l	file_lock,d1		;d1=lock
		lea	file_fib,a1
		move.l	a1,d2			;d2=file info block
		jsr	_LVOExamine(a6)		;examine file
		tst.l	d0
		beq.s	.error

		tst.l	file_fib+fib_DirEntryType
		bpl.s	.error			;branch if not a file

		move.l	a2,d1			;d1=filename
		move.l	#MODE_OLDFILE,d2        ;d2=mode
		jsr	_LVOOpen(a6)		;open file
		move.l	d0,file_handle		;handle
		beq.s	.error

		move.l	file_handle,d1		;d1=handle
		move.l	a3,d2			;d2=destination buffer
		move.l	file_fib+fib_Size,d3	;d3=length to read
		jsr	_LVORead(a6)		;read file
		move.l	d0,d1			;amount read
		bmi.s	.error

		move.l	file_handle,d1		;d1=handle
		jsr	_LVOClose(a6)		;close file
		clr.l	file_handle

		move.l	file_lock,d1		;lock
		jsr	_LVOUnLock(a6)		;unlock file
		clr.l	file_lock

.no_error	movem.l	(sp)+,d1-d7/a0-a6
		moveq.l	#0,d0			;return no error
		rts

.error		move.l	file_handle,d1		;d1=handle
		beq.s	.not_opened
		jsr	_LVOClose(a6)		;close file
		clr.l	file_handle
.not_opened
		move.l	file_lock,d1		;lock
		beq.s	.not_locked
		jsr	_LVOUnLock(a6)		;unlock file
		clr.l	file_lock
.not_locked
		movem.l	(sp)+,d1-d7/a0-a6
		moveq.l	#-1,d0			;return error
		rts


file_lock	dc.l	0
file_handle	dc.l	0
		CNOP	0,4		;!!! Must be long word aligned !!!
file_fib	ds.b	fib_SIZEOF

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a2.l=address of filename
;		a3.l=source address
;		d3.l=length
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

dos_save_file
		movem.l	d1-d7/a0-a6,-(sp)

		move.l	vars_block,a5
		move.l	dos_base(a5),a6

		move.l	a2,d1			;d1=filename
		move.l	#MODE_NEWFILE,d2	;d2=mode
		jsr	_LVOOpen(a6)		;open file
		move.l	d0,file_handle		;handle
		beq.s	.error

		move.l	file_handle,d1		;d1=handle
		move.l	a3,d2			;d2=source buffer,d3=length
		jsr	_LVOWrite(a6)		;write file
		move.l	d0,d1			;amount read
		bmi.s	.error

		move.l	file_handle,d1		;d1=handle
		jsr	_LVOClose(a6)		;close file
		clr.l	file_handle

.no_error	movem.l	(sp)+,d1-d7/a0-a6
		moveq.l	#0,d0			;return no error
		rts

.error		move.l	file_handle,d1		;d1=handle
		beq.s	.not_opened
		jsr	_LVOClose(a6)		;close file
		clr.l	file_handle
.not_opened
		movem.l	(sp)+,d1-d7/a0-a6
		moveq.l	#-1,d0			;return error
		rts
