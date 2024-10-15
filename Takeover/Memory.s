********************************************************************************
*
*	Memory.s
*	Release 2.4
*	Date 3/4/93
*
*	Friendly system takeover
*	Memory handling routines
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

allocate_memory
		move.l	#MEMF_CHIP!MEMF_LARGEST!MEMF_PUBLIC,d1
		move.l	_SysBase,a6
		JSRLIB	AvailMem		;find largest free chip
		move.l	d0,largest_chip(a5)

		move.l	#MEMF_LARGEST!MEMF_PUBLIC,d1
		move.l	_SysBase,a6
		JSRLIB	AvailMem		;find largest free any
		move.l	d0,largest_any(a5)

		tst.b	arg_killsys(a5)
		bne.s	allocate_physical_memory

		bsr	do_allocation
		tst.l	d0
		bne.s	.error

		moveq.l	#0,d0			;no errors
.error		rts

allocate_physical_memory
		move.l	temp_amount(a5),d0
		beq.s	.skip_temp_mem		;allocate temp memory
		move.l	#MEMF_ANY!MEMF_PUBLIC!MEMF_REVERSE,d1
		move.l	4,a6
		JSRLIB	AllocMem
		move.l	d0,temp_chunk_address(a5)
		bne.s	.skip_temp_mem
		moveq.l	#51,d0			;error number 51
		bra	.error
.skip_temp_mem

		bsr	grab_memory
		tst.l	d0
		bne.s	.error

		move.l	temp_chunk_address(a5),a0
		add.l	temp_amount(a5),a0

		moveq.l	#0,d0			;no errors
.error		rts

********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

grab_memory
		movem.l	d1-d6/a0-a6,-(sp)

.retry_grab	clr.l	bot_chip(a5)
		clr.l	top_chip(a5)
		clr.l	bot_any(a5)
		clr.l	top_any(a5)

		clr.l	chip_mem_address(a5)
		clr.l	any_mem_address(a5)
		clr.l	exchip_mem_address(a5)
		clr.l	exany_mem_address(a5)
		clr.l	ramdisk_mem_address(a5)

		move.l	chip_amount(a5),d2
		beq.s	.no_chip_required
		move.w	#MEMF_CHIP!MEMF_PUBLIC,d1	;search for chip
		bsr     search_memlist
		tst.l	d0
		beq.s	.chip_found
		moveq.l	#35,d0				;error number 35
		bra	.error
.chip_found	move.l	a0,chip_mem_address(a5)
		WRITELN_IF_INFO <"  { found enough chip memory }">
.no_chip_required

		move.l	any_amount(a5),d2
		beq.s	.no_any_required
		move.w	#MEMF_ANY!MEMF_PUBLIC,d1	;search for any
		bsr     search_memlist
		tst.l	d0
		beq.s	.any_found
		moveq.l	#36,d0				;error number 36
		bra	.error
.any_found	move.l	a0,any_mem_address(a5)
		WRITELN_IF_INFO <"  { found enough chip/fast memory }">
.no_any_required

		move.l	exchip_amount(a5),d2
		beq.s	.no_exchip_required
		move.w	#MEMF_CHIP!MEMF_PUBLIC,d1	;search for exchip
		bsr     search_memlist
		tst.l	d0
		bne.s	.exchip_not_found
		move.l	a0,exchip_mem_address(a5)
		WRITELN_IF_INFO <"  { found enough extra chip memory }">
		bra.s	.exchip_found
.exchip_not_found
		tst.b	exchip_neccessary(a5)
		beq.s	.no_exchip
		moveq.l	#35,d0				;error number 35
		bra	.error
.no_exchip	clr.l	exchip_amount(a5)
.exchip_found
.no_exchip_required

		move.l	exany_amount(a5),d2
		beq.s	.no_exany_required
		move.w	#MEMF_PUBLIC,d1			;search for exany
		bsr     search_memlist
		tst.l	d0
		bne.s	.exany_not_found
		move.l	a0,exany_mem_address(a5)
		WRITELN_IF_INFO <"  { found enough extra any memory }">
		bra.s	.exany_found
.exany_not_found
		tst.b	exany_neccessary(a5)
		beq.s	.no_exany
		moveq.l	#36,d0				;error number 36
		bra	.error
.no_exany	clr.l	exany_amount(a5)
.exany_found
.no_exany_required

		move.l	ramdisk_amount(a5),d2
		beq.s	.no_ramdisk_required
		move.w	#MEMF_PUBLIC,d1			;search for ramdisk
		bsr     search_memlist
		tst.l	d0
		bne.s	.ramdisk_not_found
		move.l	a0,ramdisk_mem_address(a5)
		WRITELN_IF_INFO <"  { found enough memory for ram disk }">
		bra.s	.ramdisk_found
.ramdisk_not_found
		clr.l	ramdisk_amount(a5)
.ramdisk_found
.no_ramdisk_required

		moveq.l	#0,d0				;no error
.error		movem.l	(sp)+,d1-d6/a0-a6
		rts

********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;		d1.w=memory type
;		d2.l=size required
;OUTPUT:	d0.l=error code (0=found, -1=not found)
;		a0.l=address of memory
;CHANGES:	none

search_memlist
		movem.l	d1-d7/a1-a6,-(sp)

		move.l	4,a6
		move.l	MemList(a6),a6		;get address of first
						; memory region structure
.next_node
		move.w	MH_ATTRIBUTES(a6),d0	;get memory type
		and.w	d1,d0
		cmp.w	d0,d1			;chip/fast?
		bne	.wrong_attr		;branch if wrong type

		move.l	MH_LOWER(a6),d4
		and.l	#$fff80000,d4		;round base address down to
		bne.s	.not_at_0
		move.l	#$100,d4		;allow room at start of mem
.not_at_0	move.l	d4,a0			; nearest 512k

		move.l	MH_UPPER(a6),d3
		add.l	#$7ffff,d3		;round top address up to
		and.l	#$fff80000,d3		; nearest 512k
		move.l	d3,a1

		bsr	check_chunk
		tst.l	d0
		beq.s	.found

.wrong_attr	move.l	LN_SUCC(a6),a6
		cmp.l	#0,a6
		bne	.next_node		;branch if not end of list

		moveq.l	#-1,d0
		movem.l	(sp)+,d1-d7/a1-a6
		rts

.found
		WRITEZEROINFO_IF_INFO <"  {      base of alloc'd chip set at">,<"00000000 }">,bot_chip(a5)
		WRITEZEROINFO_IF_INFO <"  {       top of alloc'd chip set at">,<"00000000 }">,top_chip(a5)
		WRITEZEROINFO_IF_INFO <"  { base of alloc'd chip/fast set at">,<"00000000 }">,bot_any(a5)
		WRITEZEROINFO_IF_INFO <"  {  top of alloc'd chip/fast set at">,<"00000000 }">,top_any(a5)
.error		movem.l	(sp)+,d1-d7/a1-a6
		rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
check_chunk
		move.w	MH_ATTRIBUTES(a6),d0	;check memory type
		and.w	#MEMF_CHIP,d0
		beq	check_fast_chunk

check_chip_chunk
		cmp.l	bot_chip(a5),a1		;this chunk below allocated?
		ble.s	.below			;yes, then branch

		cmp.l	top_chip(a5),a1		;this chunk all used?
		ble	.all_used		;yes, then end

		cmp.l	top_chip(a5),a0		;bottom of chunk used?
		bgt.s	.not_bottom_used	;no, then branch
		move.l	top_chip(a5),a0
.not_bottom_used

		move.l	a1,d3
		sub.l	a0,d3
		addq.l	#1,d3			;d3=size of chunk?

		cmp.l	d2,d3			;chunk big enough?
		blt	.too_small		;yes, then branch

		move.l	a0,a1
		add.l	d2,a1

		move.l	a1,top_chip(a5)
		tst.l	bot_chip(a5)
		bne.s	.not_first_chunk
		move.l	a0,bot_chip(a5)
.not_first_chunk
		moveq.l	#0,d0
		rts

.below		move.l	a1,d3
		sub.l	d0,d3
		addq.l	#1,d3			;d3=size of chunk?

		cmp.l	d2,d3			;chunk big enough?
		ble	.too_small		;yes, then branch

		move.l	a0,bot_chip(a5)
		WRITEZEROINFO_IF_INFO <"  { Chip chunk allocated from">,<"00000000">,a0
		WRITEZEROINFO_IF_INFO <"                           to">,<"00000000 }">,a1
		moveq.l	#0,d0
		rts

.too_small	WRITEZEROINFO_IF_INFO <"  { Chip chunk too small at">,<"00000000">,a0
		WRITEZEROINFO_IF_INFO <"               its size was">,<"UNKNOWN  (bytes) }">,d3
.all_used
.error		moveq.l	#-1,d0			;flag failed
		rts

check_fast_chunk
		cmp.l	bot_any(a5),a1		;this chunk below allocated?
		ble.s	.below			;yes, then branch

		cmp.l	top_any(a5),a1		;this chunk all used?
		ble	.all_used		;yes, then end

		cmp.l	top_any(a5),a0		;bottom of chunk used?
		bgt.s	.not_bottom_used	;no, then branch
		move.l	top_any(a5),a0
.not_bottom_used

		move.l	a1,d3
		sub.l	d0,d3
		addq.l	#1,d3			;d3=size of chunk?

		cmp.l	d2,d3			;chunk big enough?
		blt	.too_small		;yes, then branch

		move.l	a0,a1
		add.l	d2,a1

		move.l	a1,top_any(a5)
		tst.l	bot_any(a5)
		bne.s	.not_first_chunk
		move.l	a0,bot_any(a5)
.not_first_chunk
		moveq.l	#0,d0
		rts

.below		move.l	a1,d3
		sub.l	a0,d3
		addq.l	#1,d3			;d3=size of chunk?

		cmp.l	d2,d3			;chunk big enough?
		ble	.too_small		;yes, then branch

		move.l	a0,bot_any(a5)
		WRITEZEROINFO_IF_INFO <"  { Chip/fast chunk allocated from">,<"00000000">,a0
		WRITEZEROINFO_IF_INFO <"                                to">,<"00000000 }">,a1
		moveq.l	#0,d0
		rts
.too_small	WRITEZEROINFO_IF_INFO <"  { Chip/fast chunk too small at">,<"00000000">,a0
		WRITEZEROINFO_IF_INFO <"                    its size was">,<"UNKNOWN  (bytes) }">,d3
.all_used
.error		moveq.l	#-1,d0			;flag failed
		rts

********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

do_allocation
		move.l	chip_amount(a5),d0
		beq.s	.skip_chip_mem
		move.l	#MEMF_CHIP!MEMF_PUBLIC!MEMF_REVERSE,d1	;allocate chip memory
		move.l	_SysBase,a6
		JSRLIB	AllocMem
		move.l	d0,chip_chunk_address(a5)
		bne.s	.skip_chip_mem
		moveq.l	#11,d0				;error number 11
		bra	.error
.skip_chip_mem
		move.l	any_amount(a5),d0
		beq.s	.skip_any_mem
		move.l	#MEMF_ANY!MEMF_PUBLIC!MEMF_REVERSE,d1	;allocate any memory
		move.l	_SysBase,a6
		JSRLIB	AllocMem
		move.l	d0,any_chunk_address(a5)
		bne.s	.skip_any_mem
		moveq.l	#13,d0				;error number 13
                bra.s	.error
.skip_any_mem
		move.l	exchip_amount(a5),d0
		beq.s	.skip_exchip_mem
		move.l	#MEMF_CHIP!MEMF_PUBLIC!MEMF_REVERSE,d1	;allocate exchip memory
		move.l	_SysBase,a6
		JSRLIB	AllocMem
		move.l	d0,exchip_chunk_address(a5)
		bne.s	.skip_exchip_mem
		tst.b	exchip_neccessary(a5)
		beq.s	.skip_exchip_mem
		moveq.l	#11,d0				;error number 11
		bra	.error
.skip_exchip_mem
		move.l	exany_amount(a5),d0
		beq.s	.skip_exany_mem
		move.l	#MEMF_ANY!MEMF_PUBLIC!MEMF_REVERSE,d1		;allocate exany memory
		move.l	_SysBase,a6
		JSRLIB	AllocMem
		move.l	d0,exany_chunk_address(a5)
		bne.s	.skip_exany_mem
		tst.b	exany_neccessary(a5)
		beq.s	.skip_exany_mem
		moveq.l	#13,d0				;error number 13
		bra	.error
.skip_exany_mem
		move.l	ramdisk_amount(a5),d0
		beq.s	.skip_ramdisk
		move.l	#MEMF_ANY!MEMF_PUBLIC!MEMF_REVERSE,d1
		move.l	_SysBase,a6
		JSRLIB	AllocMem
		move.l	d0,ramdisk_chunk_address(a5)
.skip_ramdisk
		moveq.l	#0,d0				;no errors
.error		rts

********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	none
;CHANGES:	none

deallocate_memory
		tst.l	graphics_address(a5)
		beq.s	.skip_free_graphics
		move.l	graphics_address(a5),a1		;free graphics memory
		move.l	#gd_SIZEOF,d0
		move.l	4,a6
		JSRLIB	FreeMem
		clr.l	graphics_address(a5)
.skip_free_graphics

		bsr	dealloc_exchip

		tst.l	exany_chunk_address(a5)
		beq.s	.skip_free_exany
		move.l	exany_chunk_address(a5),a1	;free exany memory
		move.l	exany_amount(a5),d0
		move.l	4,a6
		JSRLIB	FreeMem
		clr.l	exany_chunk_address(a5)
.skip_free_exany

		tst.l	chip_chunk_address(a5)
		beq.s	.skip_free_chip
		move.l	chip_chunk_address(a5),a1	;free chip memory
		move.l	chip_amount(a5),d0
		move.l	4,a6
		JSRLIB	FreeMem
		clr.l	chip_chunk_address(a5)
.skip_free_chip

		tst.l	any_chunk_address(a5)
		beq.s	.skip_free_any
		move.l	any_chunk_address(a5),a1	;free any memory
		move.l	any_amount(a5),d0
		move.l	4,a6
		JSRLIB	FreeMem
		clr.l	any_chunk_address(a5)
.skip_free_any

		tst.l	temp_chunk_address(a5)
		beq.s	.skip_free_temp
		move.l	temp_chunk_address(a5),a1	;free temp memory
		move.l	temp_amount(a5),d0
		move.l	4,a6
		JSRLIB	FreeMem
		clr.l	temp_chunk_address(a5)
.skip_free_temp
		tst.l	ramdisk_chunk_address(a5)
		beq.s	.skip_free_ramdisk
		move.l	ramdisk_chunk_address(a5),a1	;free ram disk
		move.l	ramdisk_amount(a5),d0
		move.l	4,a6
		JSRLIB	FreeMem
		clr.l	ramdisk_chunk_address(a5)
.skip_free_ramdisk
		rts

dealloc_exchip
		tst.l	exchip_chunk_address(a5)
		beq.s	.skip_free_exchip
		move.l	exchip_chunk_address(a5),a1	;free exchip memory
		move.l	exchip_amount(a5),d0
		move.l	4,a6
		JSRLIB	FreeMem
		clr.l	exchip_chunk_address(a5)
.skip_free_exchip
              	rts
