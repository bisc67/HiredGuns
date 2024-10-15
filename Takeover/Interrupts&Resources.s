********************************************************************************
*
*	Interrupts&Resources.s
*	Release 2.4
*	Date 3/4/93
*
*	Friendly system takeover
*	Interrupt handling routines
*
*	Copyright © Scott Johnston 1991-93
*	All Rights Reserved Worldwide
*
********************************************************************************

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

allocate_resources
		move.w	requested_flags(a5),d0
		btst.l	#FLAGB_SERIAL,d0
		beq.s	.dont_allocate_serial_resource
		bsr	allocate_serial_resource
		tst.l	d0
		bne	.error
.dont_allocate_serial_resource

		move.w	requested_flags(a5),d0
		btst.l	#FLAGB_PARALLEL,d0
		beq.s	.dont_allocate_parallel_resource
		bsr	allocate_parallel_resource
		tst.l	d0
		beq.s	.no_parallel_error
		tst.b   parallel_neccessary(a5)
		bne.s	.error
.no_parallel_error
.dont_allocate_parallel_resource

		move.w	requested_flags(a5),d0
		btst.l	#FLAGB_POTGO,d0
		beq.s	.dont_allocate_potgo_resource
		bsr	allocate_potgo_resource
		tst.l	d0
		bne.s	.error
.dont_allocate_potgo_resource

		moveq.l	#0,d0			;no errors
.error		rts

********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

allocate_serial_resource
		sf.b	serial_bits(a5)		;allocate serial port bits
		move.l	a5,-(sp)
		move.l	#MR_SERIALBITS,d0
		lea	program_name,a1
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
		lea	program_name,a1
		move.l	misc_base(a5),a6
		jsr	MR_ALLOCMISCRESOURCE(a6)
		move.l	(sp)+,a5

		tst.l	d0
		beq.s	.allocated_serial_port
		moveq.l	#6,d0			;error number 6
                bra.s	.error
.allocated_serial_port
		st.b	serial_port(a5)		;flag allocation ok
		ori.w	#FLAGF_SERIAL,installed_flags(a5)

		moveq.l	#0,d0			;no errors
.error		rts

********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

allocate_parallel_resource
		sf.b	parallel_bits(a5)	;allocate parallel port bits
		move.l	a5,-(sp)
		move.l	#MR_PARALLELBITS,d0
		lea	program_name,a1
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
		lea	program_name,a1
		move.l	misc_base(a5),a6
		jsr	MR_ALLOCMISCRESOURCE(a6)
		move.l	(sp)+,a5

		tst.l	d0
		beq.s	.allocated_parallel_port
		moveq.l	#28,d0			;error number 28
                bra.s	.error
.allocated_parallel_port
		st.b	parallel_port(a5)	;flag allocation ok
		ori.w	#FLAGF_PARALLEL,installed_flags(a5)

		moveq.l	#0,d0			;no errors
.error		rts

********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

allocate_potgo_resource
		move.l	a5,-(sp)        	;open potgo resource
		lea	potgo_name,a1
		move.l	4.w,a6
		JSRLIB	OpenResource
		move.l	(sp)+,a5

		move.l	d0,potgo_base(a5)
		bne.s	.opened_potgo_resource
		moveq.l	#7,d0			;error number 7
                bra	.error
.opened_potgo_resource
		move.l	4.w,a6			;disable task switching
		JSRLIB	Forbid

		sf.b	potgo_bits(a5)		;allocate potgo bits
		move.l	a5,-(sp)
		move.l	#POTGO_BITS,d0
		move.l	potgo_base(a5),a6
		JSRLIB	AllocPotBits
		move.l	(sp)+,a5
		move.l	d0,potgo_bits(a5)	;flag allocation ok

		cmp.l	#POTGO_BITS,d0
		beq.s	.allocated_potgo_bits
		moveq.l	#8,d0			;error number 8

		move.l	4.w,a6			;enable task switching
		JSRLIB	Permit

                bra.s	.error

.allocated_potgo_bits
		move.l	4.w,a6			;permit task switching
		JSRLIB	Permit

		ori.w	#FLAGF_POTGO,installed_flags(a5)

		moveq.l	#0,d0			;no errors
.error		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	none
;CHANGES:	none

deallocate_resources
		move.w	installed_flags(a5),d0
		btst.l	#FLAGB_SERIAL,d0
		beq.s	.dont_deallocate_serial_resource
		bsr	deallocate_serial_resource
.dont_deallocate_serial_resource

		move.w	installed_flags(a5),d0
		btst.l	#FLAGB_PARALLEL,d0
		beq.s	.dont_deallocate_parallel_resource
		bsr	deallocate_parallel_resource
.dont_deallocate_parallel_resource

		move.w	installed_flags(a5),d0
		btst.l	#FLAGB_POTGO,d0
		beq.s	.dont_deallocate_potgo_resource
		bsr	deallocate_potgo_resource
.dont_deallocate_potgo_resource

		rts

********************************************************************************
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
		eori.w	#FLAGF_SERIAL,installed_flags(a5)
		rts

********************************************************************************
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
		eori.w	#FLAGF_PARALLEL,installed_flags(a5)
		rts

********************************************************************************
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
		JSRLIB	FreePotBits
		move.l	(sp)+,a5
		sf.b	potgo_bits(a5)
.skip_potgo_bits
		eori.w	#FLAGF_POTGO,installed_flags(a5)
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	none
;CHANGES:	none

install_interrupts

;--- add ports interrupt -------------------------------------------------------
		move.w	requested_flags(a5),d0
		btst.l	#FLAGB_INT_PORTS,d0
		beq	.no_ports_server

		lea	ports_struct,a1
		move.b	#NT_INTERRUPT,LN_TYPE(a1)
		move.b	int_ports_priority(a5),LN_PRI(a1)
		move.l	#program_name,LN_NAME(a1)
		move.l	#ports_code,IS_CODE(a1)
		move.l	#INTB_PORTS,d0
		move.l	4.w,a6
		JSRLIB	AddIntServer

		or.w	#FLAGF_INT_PORTS,installed_flags(a5)
		WRITELN_IF_INFO <"{Ports interrupt server added to server chain}">
.no_ports_server

;--- add vblank interrupt ------------------------------------------------------
		move.w	requested_flags(a5),d0
		btst.l	#FLAGB_INT_VBLANK,d0
		beq	.no_vblank_server

		lea	vblank_struct,a1
		move.b	#NT_INTERRUPT,LN_TYPE(a1)
		move.b	int_vblank_priority(a5),LN_PRI(a1)
		move.l	#program_name,LN_NAME(a1)
		move.l	#vblank_code,IS_CODE(a1)
		move.l	#INTB_VERTB,d0
		move.l	4.w,a6
		JSRLIB	AddIntServer

		or.w	#FLAGF_INT_VBLANK,installed_flags(a5)
		WRITELN_IF_INFO <"{Vblank interrupt server added to server chain}">
.no_vblank_server

;--- add exter interrupt -------------------------------------------------------
		move.w	requested_flags(a5),d0
		btst.l	#FLAGB_INT_EXTER,d0
		beq	.no_exter_server

		lea	exter_struct,a1
		move.b	#NT_INTERRUPT,LN_TYPE(a1)
		move.b	int_exter_priority(a5),LN_PRI(a1)
		move.l	#program_name,LN_NAME(a1)
		move.l	#exter_code,IS_CODE(a1)
		move.l	#INTB_EXTER,d0
		move.l	4.w,a6
		JSRLIB	AddIntServer

		or.w	#FLAGF_INT_EXTER,installed_flags(a5)
		WRITELN_IF_INFO <"{Exter interrupt server added to server chain}">
.no_exter_server

;--- add copper interrupt ------------------------------------------------------
		move.w	requested_flags(a5),d0
		btst.l	#FLAGB_INT_COPPER,d0
		beq	.no_copper_server

		lea	copper_struct,a1
		move.b	#NT_INTERRUPT,LN_TYPE(a1)
		move.b	int_copper_priority(a5),LN_PRI(a1)
		move.l	#program_name,LN_NAME(a1)
		move.l	#copper_code,IS_CODE(a1)
		move.l	#INTB_COPER,d0
		move.l	4.w,a6
		JSRLIB	AddIntServer

		or.w	#FLAGF_INT_COPPER,installed_flags(a5)
		WRITELN_IF_INFO <"{Copper interrupt server added to server chain}">
.no_copper_server

;--- add blitter interrupt -----------------------------------------------------
;		move.w	requested_flags(a5),d0
;		btst.l	#FLAGB_INT_BLITTER,d0
;		beq	.no_blitter_handler
;
;		move.l	hardware_base(a5),a6
;		sf.b	int_blitter_flag(a5)
;		move.w	intenar(a6),d0
;		btst.l	#INTB_BLIT,d0
;		beq.s	.blitter_int_not_on
;		st.b	int_blitter_flag(a5)
;.blitter_int_not_on
;		move.w	#INTF_BLIT,intena(a6)		;disable interrupt
;
;		lea	blitter_struct,a1
;		move.b	#NT_INTERRUPT,LN_TYPE(a1)
;		move.b	int_blitter_priority(a5),LN_PRI(a1)
;		move.l	#program_name,LN_NAME(a1)
;		move.l	#blitter_code,IS_CODE(a1)
;		move.l	#INTB_BLIT,d0
;		move.l	4.w,a6
;		JSRLIB	SetIntVector
;
;		move.l	d0,old_blitter_handler(a5)
;		beq	.installed_blitter
;
;		move.l	hardware_base(a5),a6
;		move.w	#INTF_SETCLR!INTF_BLIT,intena(a6)
;							;enable interrupt
;		tst.b	arg_info(a5)
;		beq.s	.no_info_blitter
;		move.l	d0,a0
;		move.l	LN_NAME(a0),d2
;		WRITELN <"{A task was using the blitter interrupt">
;		jsr	_STOutput
;		tst.l	d0
;		bne	.error
;		WRITELN <"}">
;.no_info_blitter
;.installed_blitter
;		or.w	#FLAGF_INT_BLITTER,installed_flags(a5)
;		WRITELN_IF_INFO <"{Blitter interrupt handler installed}">
;.no_blitter_handler
;
;--- add ciaa timer a interrupt ------------------------------------------------
		move.w	requested_flags(a5),d0
		btst.l	#FLAGB_CIAA_TA,d0
		beq	.no_ciaa_ta_handler

		lea	ciaa_ta_struct,a1
		move.b	#NT_INTERRUPT,LN_TYPE(a1)
		move.b	ciaa_ta_priority(a5),LN_PRI(a1)
		move.l	#program_name,LN_NAME(a1)
		move.l	#ciaa_ta_code,IS_CODE(a1)
		move.l	#CIAICRB_TA,d0
		move.l	ciaa_base(a5),a6
		JSRLIB	AddICRVector
		tst.l	d0
		beq.s	.installed_ciaa_ta

		tst.b	arg_info(a5)
		beq.s	.no_info_ciaa_ta
		move.l	d0,a0
		move.l	LN_NAME(a0),d2
		WRITELN <"{A task is using CIA-A Timer A">
		jsr	_STOutput
		tst.l	d0
		bne	.error
		WRITELN <"}">
.no_info_ciaa_ta
		move.l	#29,d0			;error number 29
                bra	.error
.installed_ciaa_ta
		or.w	#FLAGF_CIAA_TA,installed_flags(a5)
		WRITELN_IF_INFO <"{CIA-A Timer A interrupt handler installed}">
.no_ciaa_ta_handler

;--- add ciaa timer b interrupt ------------------------------------------------
		move.w	requested_flags(a5),d0
		btst.l	#FLAGB_CIAA_TB,d0
		beq	.no_ciaa_tb_handler

		lea	ciaa_tb_struct,a1
		move.b	#NT_INTERRUPT,LN_TYPE(a1)
		move.b	ciaa_tb_priority(a5),LN_PRI(a1)
		move.l	#program_name,LN_NAME(a1)
		move.l	#ciaa_tb_code,IS_CODE(a1)
		move.l	#CIAICRB_TB,d0
		move.l	ciaa_base(a5),a6
		JSRLIB	AddICRVector
		tst.l	d0
		beq.s	.installed_ciaa_tb

		tst.b	arg_info(a5)
		beq.s	.no_info_ciaa_tb
		move.l	d0,a0
		move.l	LN_NAME(a0),d2
		WRITELN <"{A task is using CIA-A Timer B">
		jsr	_STOutput
		tst.l	d0
		bne	.error
		WRITELN <"}">
.no_info_ciaa_tb
		move.l	#30,d0			;error number 30
                bra	.error
.installed_ciaa_tb
		or.w	#FLAGF_CIAA_TB,installed_flags(a5)
		WRITELN_IF_INFO <"{CIA-A Timer B interrupt handler installed}">
.no_ciaa_tb_handler

;--- add ciab timer a interrupt ------------------------------------------------
		move.w	requested_flags(a5),d0
		btst.l	#FLAGB_CIAB_TA,d0
		beq	.no_ciab_ta_handler

		lea	ciab_ta_struct,a1
		move.b	#NT_INTERRUPT,LN_TYPE(a1)
		move.b	ciab_ta_priority(a5),LN_PRI(a1)
		move.l	#program_name,LN_NAME(a1)
		move.l	#ciab_ta_code,IS_CODE(a1)
		move.l	#CIAICRB_TA,d0
		move.l	ciab_base(a5),a6
		JSRLIB	AddICRVector
		tst.l	d0
		beq.s	.installed_ciab_ta

		tst.b	arg_info(a5)
		beq.s	.no_info_ciab_ta
		move.l	d0,a0
		move.l	LN_NAME(a0),d2
		WRITELN <"{A task is using CIA-B Timer A">
		jsr	_STOutput
		tst.l	d0
		bne	.error
		WRITELN <"}">
.no_info_ciab_ta
		move.l	#55,d0			;error number 55
                bra	.error
.installed_ciab_ta
		or.w	#FLAGF_CIAB_TA,installed_flags(a5)
		WRITELN_IF_INFO <"{CIA-B Timer A interrupt handler installed}">
.no_ciab_ta_handler

;--- add ciab timer b interrupt ------------------------------------------------
		move.w	requested_flags(a5),d0
		btst.l	#FLAGB_CIAB_TB,d0
		beq	.no_ciab_tb_handler

		lea	ciab_tb_struct,a1
		move.b	#NT_INTERRUPT,LN_TYPE(a1)
		move.b	ciab_tb_priority(a5),LN_PRI(a1)
		move.l	#program_name,LN_NAME(a1)
		move.l	#ciab_tb_code,IS_CODE(a1)
		move.l	#CIAICRB_TB,d0
		move.l	ciab_base(a5),a6
		JSRLIB	AddICRVector
		tst.l	d0
		beq.s	.installed_ciab_tb

		tst.b	arg_info(a5)
		beq.s	.no_info_ciab_tb
		move.l	d0,a0
		move.l	LN_NAME(a0),d2
		WRITELN <"{A task is using CIA-B Timer B">
		jsr	_STOutput
		tst.l	d0
		bne	.error
		WRITELN <"}">
.no_info_ciab_tb
		move.l	#56,d0			;error number 56
                bra	.error
.installed_ciab_tb
		or.w	#FLAGF_CIAB_TB,installed_flags(a5)
		WRITELN_IF_INFO <"{CIA-B Timer B interrupt handler installed}">
.no_ciab_tb_handler

		moveq.l	#0,d0			;no error
.error		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	none
;CHANGES:	none

remove_interrupts

;--- remove ports interrupt server ---------------------------------------------
		move.w	installed_flags(a5),d0
		btst.l	#FLAGB_INT_PORTS,d0
		beq.s	.no_ports_server
		lea	ports_struct,a1
		move.l	#INTB_PORTS,d0
		move.l	4.w,a6
		JSRLIB	RemIntServer
		eor.w	#FLAGF_INT_PORTS,installed_flags(a5)
.no_ports_server

;--- remove vblank interrupt server --------------------------------------------
		move.w	installed_flags(a5),d0
		btst.l	#FLAGB_INT_VBLANK,d0
		beq.s	.no_vblank_server
		lea	vblank_struct,a1
		move.l	#INTB_VERTB,d0
		move.l	4.w,a6
		JSRLIB	RemIntServer
		eor.w	#FLAGF_INT_VBLANK,installed_flags(a5)
.no_vblank_server

;--- remove exter interrupt server ---------------------------------------------
		move.w	installed_flags(a5),d0
		btst.l	#FLAGB_INT_EXTER,d0
		beq.s	.no_exter_server
		lea	exter_struct,a1
		move.l	#INTB_EXTER,d0
		move.l	4.w,a6
		JSRLIB	RemIntServer
		eor.w	#FLAGF_INT_EXTER,installed_flags(a5)
.no_exter_server

;--- remove copper interrupt server --------------------------------------------
		move.w	installed_flags(a5),d0
		btst.l	#FLAGB_INT_COPPER,d0
		beq.s	.no_copper_server
		lea	copper_struct,a1
		move.l	#INTB_COPER,d0
		move.l	4.w,a6
		JSRLIB	RemIntServer
		eor.w	#FLAGF_INT_COPPER,installed_flags(a5)
.no_copper_server

;--- remove blitter interrupt handler ------------------------------------------
;		move.w	installed_flags(a5),d0
;		btst.l	#FLAGB_INT_BLITTER,d0
;		beq.s	.no_blitter_handler
;
;		move.l	hardware_base(a5),a6
;		move.w	#INTF_BLIT,intena(a6)		;disable interrupt
;
;		move.l	old_blitter_handler(a5),a1
;		move.l	#INTB_BLIT,d0
;		move.l	4.w,a6
;		JSRLIB	SetIntVector
;		eor.w	#FLAGF_INT_BLITTER,installed_flags(a5)
;
;		tst.b	int_blitter_flag(a5)
;		beq.s	.blitter_int_not_on
;		move.l	hardware_base(a5),a6
;		move.w	#INTF_SETCLR!INTF_BLIT,intena(a6)
;.blitter_int_not_on
;.no_blitter_handler

;--- remove ciaa ta handler ----------------------------------------------------
		move.w	installed_flags(a5),d0
		btst.l	#FLAGB_CIAA_TA,d0
		beq.s	.no_ciaa_ta_handler

		lea	ciaa_ta_struct,a1
		move.l	#CIAICRB_TA,d0
		move.l	ciaa_base(a5),a6
		JSRLIB	RemICRVector
		eor.w	#FLAGF_CIAA_TA,installed_flags(a5)
.no_ciaa_ta_handler

;--- remove ciaa tb handler ----------------------------------------------------
		move.w	installed_flags(a5),d0
		btst.l	#FLAGB_CIAA_TB,d0
		beq.s	.no_ciaa_tb_handler

		lea	ciaa_tb_struct,a1
		move.l	#CIAICRB_TB,d0
		move.l	ciaa_base(a5),a6
		JSRLIB	RemICRVector
		eor.w	#FLAGF_CIAA_TB,installed_flags(a5)
.no_ciaa_tb_handler

;--- remove ciab ta handler ----------------------------------------------------
		move.w	installed_flags(a5),d0
		btst.l	#FLAGB_CIAB_TA,d0
		beq.s	.no_ciab_ta_handler

		lea	ciab_ta_struct,a1
		move.l	#CIAICRB_TA,d0
		move.l	ciab_base(a5),a6
		JSRLIB	RemICRVector
		eor.w	#FLAGF_CIAB_TA,installed_flags(a5)
.no_ciab_ta_handler

;--- remove ciab tb handler ----------------------------------------------------
		move.w	installed_flags(a5),d0
		btst.l	#FLAGB_CIAB_TB,d0
		beq.s	.no_ciab_tb_handler

		lea	ciab_tb_struct,a1
		move.l	#CIAICRB_TB,d0
		move.l	ciab_base(a5),a6
		JSRLIB	RemICRVector
		eor.w	#FLAGF_CIAB_TB,installed_flags(a5)
.no_ciab_tb_handler

		rts

********************************************************************************

ports_struct	ds.b	IS_SIZE
vblank_struct	ds.b	IS_SIZE
exter_struct	ds.b	IS_SIZE
copper_struct	ds.b	IS_SIZE
;blitter_struct	ds.b	IS_SIZE
ciaa_ta_struct	ds.b	IS_SIZE
ciaa_tb_struct	ds.b	IS_SIZE
ciab_ta_struct	ds.b	IS_SIZE
ciab_tb_struct	ds.b	IS_SIZE

********************************************************************************

ports_code	movem.l	d2-d7/a2-a6,-(sp)
		move.l	int_ports_server+parameters,a1
		cmpa.l	#0,a1
		beq.s	.not_for_me
		jsr	(a1)			;jump to user routine
		beq.s	.not_for_me
.ret		movem.l	(sp)+,d2-d7/a2-a6
		moveq.l	#1,d0			;flag that this int was for me
		rts
.not_for_me	movem.l	(sp)+,d2-d7/a2-a6
		moveq.l	#0,d0			;flag not for me
		rts

exter_code	movem.l	d2-d7/a2-a6,-(sp)
		move.l	int_exter_server+parameters,a1
		cmpa.l	#0,a1
		beq.s	.not_for_me
		jsr	(a1)			;jump to user routine
		beq.s	.not_for_me
.ret		movem.l	(sp)+,d2-d7/a2-a6
		moveq.l	#1,d0			;flag that this int was for me
		rts
.not_for_me	movem.l	(sp)+,d2-d7/a2-a6
		moveq.l	#0,d0			;flag not for me
		rts

vblank_code	movem.l	d2-d7/a2-a6,-(sp)
		move.l	int_vblank_server+parameters,a1
		cmpa.l	#0,a1
		beq.s	.no_user_routine
		jsr	(a1)			;jump to user routine
.no_user_routine
		movem.l	(sp)+,d2-d7/a2-a6
		move.l	#$dff000,a0		;highest priority vertb
						; server must leave with this
		moveq.l	#0,d0			;z flag must bet set at end
		rts				; of a vblank server

copper_code	movem.l	d2-d7/a2-a6,-(sp)
		move.l	int_copper_server+parameters,a1
		cmpa.l	#0,a1
		beq.s	.no_user_routine
		jsr	(a1)			;jump to user routine
.no_user_routine
		movem.l	(sp)+,d2-d7/a2-a6
		move.l	#$dff000,a0		;highest priority vertb
						; server must leave with this
		moveq.l	#0,d0			;z flag must bet set at end
		rts				; of a copper server

;blitter_code	move.w	#INTF_BLIT,intreq(a0)	;respond to interrupt
;		movem.l	d2-d7/a2-a6,-(sp)
;		move.l	int_blitter_handler+parameters,a1
;		cmpa.l	#0,a1
;		beq.s	.ret
;		jsr     (a1)			;jump to user routine
;.ret		movem.l	(sp)+,d2-d7/a2-a6
;		rts

ciaa_ta_code	movem.l	d2-d7/a2-a6,-(sp)
		move.l	ciaa_ta_handler+parameters,a1
		cmpa.l	#0,a1
		beq.s	.ret
		jsr     (a1)			;jump to user routine
.ret		movem.l	(sp)+,d2-d7/a2-a6
		rts

ciaa_tb_code	movem.l	d2-d7/a2-a6,-(sp)
		move.l	ciaa_tb_handler+parameters,a1
		cmpa.l	#0,a1
		beq.s	.ret
		jsr     (a1)			;jump to user routine
.ret		movem.l	(sp)+,d2-d7/a2-a6
		rts

ciab_ta_code	movem.l	d2-d7/a2-a6,-(sp)
		move.l	ciab_ta_handler+parameters,a1
		cmpa.l	#0,a1
		beq.s	.ret
		jsr     (a1)			;jump to user routine
.ret		movem.l	(sp)+,d2-d7/a2-a6
		rts

ciab_tb_code	movem.l	d2-d7/a2-a6,-(sp)
		move.l	ciab_tb_handler+parameters,a1
		cmpa.l	#0,a1
		beq.s	.ret
		jsr     (a1)			;jump to user routine
.ret		movem.l	(sp)+,d2-d7/a2-a6
		rts
