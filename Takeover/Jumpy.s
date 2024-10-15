********************************************************************************
*
*	Jumpy.s
*	Release 2.4
*	Date 3/4/93
*
*	Friendly system takeover
*       Jumpy code used during killsys
*
*	Copyright © Scott Johnston 1991-93
*	All Rights Reserved Worldwide
*
********************************************************************************

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		none
;OUTPUT:        NEVER RETURNS !!!
;CHANGES:	none

killsys_code_start
		movem.l	d0-d7/a0/a2-a6,-(sp)

		lea	parameters(pc),a5

		move.l	code_unpacked_size(a5),d0
		move.l	temp_chunk_address(a5),a0
		move.l	any_mem_address(a5),a1
		bsr	_STCopyMem

		move.l	any_mem_address(a5),a0	;relocate code
		move.l	any_mem_address(a5),a1
		move.l	chip_mem_address(a5),a2

		tst.b	arg_relocate(a5)
		beq.s	.no_relocate
		bsr	_STRelocate
		tst.l	d0
		bne.s	.flash
.no_relocate

		move.l	a0,a1

		movem.l	(sp)+,d0-d7/a0/a2-a6

		jmp	(a1)

.flash		bsr	_STWarningFlash
		bra.s	.flash

****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;		a0.l=address of source executable
;		a1.l=base of other memory chunk
;		a2.l=base of chip memory chunk
;OUTPUT:	a0.l=start address
;		d0.l=error code (0=no error)
;CHANGES:	none

HUNK_CODE       equ     $3e9
HUNK_CHIP       equ     $40
HUNK_FAST       equ     $80
HUNK_BSS        equ     $3eb
HUNK_REL32      equ     $3ec
HUNK_SYMBOL     equ     $3f0
HUNK_END        equ     $3f2
HUNK_HEADER     equ     $3f3

_STRelocate
		movem.l	d1-d7/a1-a6,-(sp)

		move.l	a1,reloc_other_base(a5)
		move.l	a2,reloc_chip_base(a5)
		clr.l	BSSCount(a5)

		move.l  (a0)+,d0		;should be HUNK_HEADER
		cmp.l	#HUNK_HEADER,d0
		bne	BadLoad

		moveq   #MAX_HUNKS-1,d0
		lea     HunkSourceBase(a5),a1

.loop   	clr.l   (a1)+			;zero hunk source bases
		dbf     d0,.loop

		bsr     DFInterpretHeader
		move.l  NumberOfHunks(a5),d0
		lea     HunkDestBase(a5),a2
		lea     HunkType(a5),a6
		bra.s   .entry
.reloc
		move.l  (a2)+,a3
		movem.l d0/a2,-(sp)
		bsr     DFRelocateOneHunk	;relocate all the hunks
		movem.l (sp)+,d0/a2
.entry  	dbf     d0,.reloc

		move.w  BSSCount(a5),d0
		lea     BSSBases(a5),a1
		lea     BSSSize(a5),a2
		bra.s   .ent
.clearlp
		move.l  (a1)+,a0
		move.l  (a2)+,d1
.lp    		clr.l   (a0)+
		subq.l  #1,d1
		bne.s   .lp
.ent		dbf     d0,.clearlp

		move.l  HunkDestBase(a5),a0
		moveq	#0,d0
		movem.l	(sp)+,d1-d7/a1-a6
		rts
;
; This routine parses the hunk header, sets the destination address of the
; hunks within the target computer.
;
DFInterpretHeader
		move.l	reloc_chip_base(a5),d4
		add.l	chip_amount(a5),d4
		move.l	reloc_other_base(a5),d5
		addq.l  #4,a0			;get past number of names & end marker
		move.l  (a0)+,d0		;read in size of hunk table
		cmp.l	#MAX_HUNKS*2,d0
		bgt     DFTooManyHunks
		addq	#MAX_HUNKS*2,a0
		move.l  d0,NumberOfHunks(a5)
		lea     HunkType(a5),a1
		lea     HunkSize(a5),a2
		lea     HunkDestBase(a5),a3

		bra.s   .skip

.copy		move.b  (a0),d7
		move.b  d7,(a1)+
		move.l  (a0)+,d1		;get hunk length (in longs)
		lsl.l   #2,d1			;convert to bytes
		move.l  d1,(a2)+
		and.b   #HUNK_CHIP,d7
		beq.s   .itsafasthunk

.itsachiphunk	sub.l	d1,d4
		move.l  d4,(a3)+		;set the base of chip memory
		bra.s   .skip

.itsafasthunk	move.l  d5,(a3)+		;set the base of fast memory
		add.l	d1,d5
.skip		dbf     d0,.copy
		rts

;
; This routine relocates all of the hunk data. Checks are done to ensure
; that the hunk relocation does not exceed the memory area of the Amiga.
;
; On entry A0 = base of hunk data
;          A3 = Destination address of hunk
;          A6 = Pointer to hunk types (to add BSS,CODE,DATA etc)
;
DFRelocateOneHunk
DFrelocloop
		move.l  (a0)+,d0
DFTryNextHunk
		cmp.w   #HUNK_CODE,d0
		bne     DFNotCodeHunk

		move.l  (a0)+,d7		;get length of hunk (for the download)
		lsl.l   #2,d7
		move.l  a0,a1			;A1=base of code section
		add.l   d7,a0			;A0 = base of next hunk

		move.l  (a0)+,d0		;get next hunk header
		cmp.w   #HUNK_REL32,d0
		bne     DFNorelocation

DFrelloop	move.l  (a0)+,d0		;get number of relocation blocks
		beq.s   DFRelocateDone		;if zero, we've done them all
		move.l  (a0)+,d1		;get relocation block number
		cmp.l   #7,d1
		bgt     DFbadhunknumber
		lsl.l   #2,d1
		lea     HunkDestBase(a5),a2	;get base of destination of this
		move.l  0(a2,d1.w),d1		;hunk to be relocated
		beq     DFbadhunknumber

DFrelocentry	move.l  (a0)+,d2		;get offset within this hunk
		add.l   d1,0(a1,d2.l)		;relocate it

DFskip		subq.l  #1,d0
		bne.s   DFrelocentry
		bra.s   DFrelloop

DFRelocateDone	move.l  (a0)+,d0

DFNorelocation	move.l  d0,-(sp)

		move.l  d7,d0			;its length, a3=destination addr
		lsr.l   #2,d0

DFmoveloop	move.l  (a1)+,(a3)+
		subq.l  #1,d0
		bne.s   DFmoveloop

		move.l  (sp)+,d0

DFRelocateSymbols
		cmp.w   #HUNK_SYMBOL,d0
		bne     DFNextHunk

DFSymbolLoop	move.l  (a0)+,d0		;get symbol name length
		beq     DFEndOfSymbols
		lsl.l   #2,d0			;multiply it by 4
		add.l   d0,a0			;and point to symbol value
		addq    #4,a0
		bra     DFSymbolLoop		;and on to the next symbol
DFEndOfSymbols	move.l  (a0)+,d0
DFNextHunk	bra     DFTryNextHunk

DFNotCodeHunk	cmp.w   #HUNK_BSS,d0
		bne.s   DFNotBSSHunk

		move.l  (a0)+,d1		;length of BSS Hunk

		move.l  a1,-(sp)
		move.w  BSSCount(a5),d2
		move.l  d2,d3
		lsl.l   #2,d2
		move.l  d1,BSSSize(a5,d2.w)
		move.l  a3,BSSBases(a5,d2.w)
		addq    #1,d3
		move.w  d3,BSSCount(a5)
		move.l  (sp)+,a1

		move.l  (a0)+,d0		;read next hunk header
		bra     DFRelocateSymbols

DFNotBSSHunk	cmp.l   #HUNK_END,d0
		bne     DFBadHunk
		rts

DFBadHunk	moveq.l	#34,d0			;error number 34
		bra.s	error

DFTooManyHunks	moveq.l	#60,d0			;error number 60
		bra.s	error

DFNoMemory	moveq.l	#61,d0			;error number 61
		bra.s	error

DFbadhunknumber	moveq.l	#62,d0			;error number 62
		bra.s	error

BadLoad		moveq.l	#63,d0			;error number 63

error		movem.l	(sp)+,d1-d7/a1-a6
		rts

****************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;		d0.l=length of source (bytes)
;		a0.l=address of source
;		a1.l=address of destination
;OUTPUT:	none
;CHANGES:	none

;NB source and destination can overlap

_STCopyMem
		movem.l	d0-d7/a0-a6,-(sp)

		cmp.l	a0,a1
		beq.s	.no_error		;no move necessary
		bgt.s	.descending

.loop_ascend	move.b	(a0)+,(a1)+
		subq.l	#1,d0
		bne.s	.loop_ascend
		bra.s	.no_error

.descending	add.l	d0,a0
		add.l	d0,a1
.loop_descend	move.b	-(a0),-(a1)
		subq.l	#1,d0
		bne.s	.loop_descend
		bra.s	.no_error

.no_error	movem.l	(sp)+,d0-d7/a0-a6
		rts

****************************************************************************
;Only use this when th OS is dead
;INPUT:		a5.l=address of parameters/variables block (long)
;OUTPUT:	none
;CHANGES:	none

WARNING_FLASH_COLOUR	equ	$f00

_STWarningFlash
		movem.l	d0-d7/a0-a6,-(sp)

		move.l	hardware_base(a5),a6
		move.w	#DMAF_RASTER!DMAF_SPRITE!DMAF_COPPER,dmacon(a6)

		move.w	#WARNING_FLASH_COLOUR,color(a6)

		movem.l	(sp)+,d0-d7/a0-a6
		rts

****************************************************************************

		CNOP	0,4		;!!! Must be long word aligned !!!

parameters	ds.b	stb_SIZEOF

		even

killsys_code_end
