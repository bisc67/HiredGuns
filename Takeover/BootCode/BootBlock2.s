********************************************************************************
*
*	BootBLock2.s
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

		include	exec/libraries.i

FUNC_CNT	SET	LIB_USERDEF
		include	exec/exec_lib.i

		include	exec/macros.i
		include	exec/execbase.i
		include	exec/io.i
		include	exec/nodes.i
		include	exec/memory.i
		include	devices/trackdisk.i
		include	resources/disk.i
		include	hardware/custom.i

		include "source:takeover/takeover.i"

ciaapra		equ	$bfe001
ciaaprb		equ	$bfe101
ciaaddra	equ	$bfe201
ciaaddrb	equ	$bfe301
ciaatalo	equ	$bfe401
ciaatahi	equ	$bfe501
ciaatblo	equ	$bfe601
ciaatbhi	equ	$bfe701
ciaasdr		equ	$bfec01
ciaaicr		equ	$bfed01
ciaacra		equ	$bfee01
ciaacrb		equ	$bfef01

ciabpra		equ	$bfd000
ciabprb		equ	$bfd100
ciabddra	equ	$bfd200
ciabddrb	equ	$bfd300
ciabtalo	equ	$bfd400
ciabtahi	equ	$bfd500
ciabtblo	equ	$bfd600
ciabtbhi	equ	$bfd700
ciabicr		equ	$bfdd00
ciabcra		equ	$bfde00
ciabcrb		equ	$bfdf00

********************************************************************************

bootblock2
		move.l	#vars_size,d0
		move.l	#MEMF_CHIP!MEMF_CLEAR,d1
		move.l	4.w,a6
		jsr	_LVOAllocMem(a6)
		tst.l	d0
		beq	.error
		move.l	d0,a5				;variables

		move.l	#524032,chip_amount(a5)
		move.l	#524288,any_amount(a5)
		move.l	#512000,exchip_amount(a5)
		move.l	#0,exany_amount(a5)
		move.l	#170000,ramdisk_amount(a5)
		move.l	#$0,new_cacr(a5)
		move.l	#$80001111,changed_cacr(a5)
		move.w	#%111,config(a5)
		move.l	#3,param1(a5)
		move.l	#0,param2(a5)
		move.l	#0,param3(a5)
		move.l	#0,param4(a5)

		bsr     system_config

		bsr	grab_memory
		tst.l	d0
		bne.s	.error

		bsr	killsys
		bsr	setup_sys

.retry		moveq.l	#0,d0				;function = load file
		lea	file_name(pc),a0		;file name
		move.l	any_mem_address(a5),a1		;destination
		lea	work_buffer(a5),a2		;$3300 bytes workspace
		bsr	dosior
		tst.l	d0
		bne.s	.error

		move.l	any_mem_address(a5),a0		;source
		move.l	d1,d0				;length
		bsr	checksum
		tst.l	d0
		beq.s	.passed
		st.b	checksum_failed(a5)
.passed
		move.l	any_mem_address(a5),a0		;source
		move.l	a0,a1				;destination
		bsr	unpack

		move.l	any_mem_address(a5),a0		;executable
		move.l	a0,a1				;any memory base
		move.l	chip_mem_address(a5),a2		;chip memory base
		bsr	relocate

;run code with these parameters
; d0.l    = -1 (flags system dead)
; d1-d4.l = runtime parameters
; d5.l    = lo word = processors
;         = hi word = config info
; d6.l    = size of ram disk (in bytes)
; a2.l    = base of extra chip memory (0=none available)
; a3.l    = base of extra other memory (0=none available)
; a4.l    = base of chip memory
; a5.l    = base of other memory
; a6.l    = base of ram disk

		moveq.l	#-1,d0
		move.l	param1(a5),d1
		move.l	param2(a5),d2
		move.l	param3(a5),d3
		move.l	param4(a5),d4
		move.w	config(a5),d5
		swap	d5
		move.w	processors(a5),d5
		move.l	ramdisk_amount(a5),d6
		move.l	ramdisk_mem_address(a5),a6
		move.l	exchip_mem_address(a5),a2
		move.l	exany_mem_address(a5),a3
		move.l	chip_mem_address(a5),a4
		move.l	any_mem_address(a5),a5

		jmp	(a5)

.error		move.w	#$f00,$dff180
		bra.s	.retry

********************************************************************************
*-------------------------------------------------------------------------------
* AmigaDOS Read File Function for AmigaDos disks
*
* Copyright (c) 1988-92 Rob Northen Computing, U.K. All Rights Reserved.
*
* File: DOSioR.s
*
* Date: 07.09.92
*-------------------------------------------------------------------------------
* AmigaDOS Read File Function
* on entry,
*	d0.l = function
*		0=load file
*	a0.l = full pathname of file, terminated with 0
*	a1.l = file buffer (even word boundary)
*	a2.l = workspace buffer ($3300 bytes of CHIPmem required)
* on exit,
*	d0.l = result
*		  0 = no error
*		204 = directory not found
*		205 = file not found
*		225 = not a DOS disk
*		405 = bad block checksum
*		see diskio.s for error codes
*	d1.l = length of file in bytes
*	all others registers are preserved
*
* IMPORTANT :
*
* File loading time can be greatly reduced by writing the file onto the
* disk using the source file DOSIO.S. This has the advantage over using
* AmigaDos to copy the file onto the disk by writing out the file's data
* block lists, as well as the actual data blocks, on contiguous sectors.
*-------------------------------------------------------------------------------

dosior
		dc.l $48E7FFFE,$2C002E01,$28482A49,$2C4A6100,$01684A86,$6606611A,$2F410004,$2E807200
		dc.l $7400363C,$80006100,$026C4CDF,$7FFF4A80,$4E756100,$00A06670,$2E280144,$2F0745E8
		dc.l $01386166,$665E2401,$2801264D,$2C07E08E,$E28E6602,$264E6152,$664A5282,$2A016708
		dc.l $B4816604,$538666EE,$22049484,$204B6100,$02226630,$610001CA,$662A2028,$000C9E80
		dc.l $41E80018,$E4986002,$2AD851C8,$FFFC4240,$E5986002,$1AD851C8,$FFFC5382,$66D62205
		dc.l $200766A2,$221F4A80,$4E752F02,$204E2028,$00086610,$222801F8,$67146100,$0180660E
		dc.l $45E80138,$22227001,$91A80008,$7000241F,$4A804E75,$2F0C204E,$6100013A,$66000094
		dc.l $43FA0182,$32812E8C,$610000D6,$67000084,$E54843FA,$017432C1,$32C02230,$0000674A
		dc.l $6100013A,$666C203C,$000000E1,$7402B490,$66607402,$BC3C0003,$67064A14,$660274FD
		dc.l $B4A801FC,$661E43E8,$01B045FA,$01447400,$14195302,$10196174,$B01A56CA,$FFF86604
		dc.l $4A12671E,$303C01F0,$60A8203C,$000000CC,$BC3C0003,$671C4A14,$6618203C,$000000CD
		dc.l $60104A14,$6600FF7A,$43FA0102,$32A801F2,$7000285F,$4A804E75,$204C612E,$B03C0044
		dc.l $66266126,$B03C0046,$661E1018,$04000030,$6D16B03C,$00336E10,$0C18003A,$660A41FA
		dc.l $00CE1140,$0001584C,$4E751018,$B03C0061,$6D0AB03C,$007A6E04,$020000DF,$4A004E75
		dc.l $48E740C0,$700072FF,$204C43FA,$00A44211,$52814A14,$67080C1C,$002F66F4,$534C4A81
		dc.l $672AC2FC,$000D1018,$61C212C0,$D2400281,$000007FF,$B9C866EA,$0C14002F,$6602524C
		dc.l $421982FC,$00484241,$48415C41,$20014CDF,$03024E75,$323C0370,$6122661E,$203C0000
		dc.l $00E17402,$B4906612,$7401B4A8,$01FC660A,$43FA0034,$32A8013E,$70004E75,$6152660A
		dc.l $610A6706,$203C0000,$01954E75,$48E74080,$7000323C,$007FD098,$51C9FFFC,$44804CDF
		dc.l $01024E75,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
		dc.l $00000000,$00000000,$00000000,$00000000,$74017600,$224E303A
		dc.w $FFD6
		dc.l $48E77FFC,$4E56FFDC,$38000244,$00033D44,$FFDC3D41,$FFDE3D42,$FFE03D43,$FFE22D48
		dc.l $FFE42D49,$FFE8E458,$02400001,$52403D40,$FFEC7000,$36026770,$701ED641,$B67C06E0
		dc.l $6E000090,$02810000,$FFFF82FC,$000B0C6E,$0001FFEC,$6702D241,$3D41FFEE,$48413D41
		dc.l $FFF06100,$03CE302E,$FFF0720B,$9240B26E,$FFE06F04,$322EFFE0,$3D41FFF2,$615E6628
		dc.l $302EFFE0,$906EFFF2,$671E3D40,$FFE0302E,$FFF2E188,$D080D1AE,$FFE4426E,$FFF0302E
		dc.l $FFECD16E,$FFEE60BE,$2F006100,$0358201F,$67207200,$322EFFEE,$0C6E0001,$FFEC6702
		dc.l $E249C2FC,$000BD26E,$FFF0D26E,$FFFA2F41,$00284E5E,$4A804CDF,$3FFE4E75,$7802426E
		dc.l $FFFC426E,$FFFA426E,$FFF8342E,$FFEE6100,$035A6600,$00A4701D,$08390002,$00BFE001
		dc.l $67000096,$2A6EFFE8,$4BED0400,$2ABCAAAA,$AAAA3B7C,$44890004,$610001D6,$6100009A
		dc.l $6676302E,$FFF46746,$C0FC0440,$41ED0006,$6100025C,$49F900DF,$F01E6100,$00D46670
		dc.l $302EFFFA,$906EFFF2,$676A2A6E,$FFE84BED,$0400302E,$FFF4C0FC,$0440DBC0,$2ABCAAAA
		dc.l $AAAA3B7C,$44890004,$204D6100,$0222302E,$FFF66718,$C0FC0440,$41ED0006,$61000210
		dc.l $49EEFFFE,$42546100,$00886624,$302EFFFA,$906EFFF2,$671E701A,$2F007402,$610002AC
		dc.l $610002F6,$201F0839,$000200BF,$E0016704,$51CCFF2C,$6000023A,$740A41ED,$0006303C
		dc.l $00406100,$01CA6100,$02046636,$6100016A,$670651CA,$FFE6602C,$61000128,$662AB26E
		dc.l $FFEE6624,$B43C000B,$6C1EB63C,$000B6E18,$53033D43,$FFF43D7C,$000BFFF6,$976EFFF6
		dc.l $70004E75,$70184E75,$701B4E75,$70194E75,$2A6EFFE8,$4BED0400,$302EFFF8,$C0FC0440
		dc.l $DBC0203C,$00001770,$61000320,$082C0001,$00016600,$00946100,$03046700,$00904AAD
		dc.l $044067E8,$610000F2,$66BA6100,$00B666B8,$B26EFFEE,$66B23602,$B66EFFF0,$6D5C302E
		dc.l $FFF2D06E,$FFF0B640,$6C50082C,$00010001,$6656302E,$FFFC0700,$664041ED,$0040323C
		dc.l $04006100,$00C82F00,$41ED0038,$61000094,$B09F6600,$FF78082C,$00010001,$662A6130
		dc.l $41ED0040,$226EFFE4,$D3C16100,$00BA6130,$302EFFFA,$B06EFFF2,$670E526E,$FFF80C6E
		dc.l $000BFFF8,$6600FF4A,$70004E75,$70FF4E75,$2203926E,$FFF0203C,$00000200,$C2C04E75
		dc.l $302EFFFC,$07C03D40,$FFFC526E,$FFFA4E75,$204D720A,$700041E8,$04402080,$51C9FFF8
		dc.l $4E7541ED,$0008611A,$36000243,$00FF3400,$E04A4840,$32000241,$00FFE048,$B03C00FF
		dc.l $4E752018,$22180280,$55555555,$02815555,$5555D080,$80814E75,$610C2F00,$41ED0030
		dc.l $61E0B09F,$4E7541ED,$00087228,$2F02E449,$53417000,$2418B580,$51C9FFFA,$241F0280
		dc.l $55555555,$4E7548E7,$F0E0707F,$45E80200,$263C5555,$55552218,$241AC283,$C483D281
		dc.l $828222C1,$51C8FFF0,$4CDF070F,$4E7543F9,$00DFF000,$337C4000,$0024337C,$80100096
		dc.l $337C6600,$009E337C,$9500009E,$337C4489,$007E2348,$0020337C,$0002009C,$E2480040
		dc.l $80003340,$00243340,$00244E75,$43F900DF,$F000203C,$000009C4,$61000170,$08290001
		dc.l $001F660A,$61000156,$66F270FF,$60027000,$33FC0002,$00DFF09C,$33FC4000,$00DFF024
		dc.l $4A804E75,$33FC0400,$00DFF09E,$4A6EFFE2,$6A1E72FF,$13C100BF,$D100302E,$FFDC5680
		dc.l $018113C1,$00BFD100,$01C113C1,$00BFD100,$4E7572FF,$13C100BF,$D1000881,$000761D4
		dc.l $203C0000,$00C86000,$00E248E7,$30002602,$6100009E,$302EFFDC,$D04041FA,$01083030
		dc.l $00006A04,$6132662A,$E248E24A,$72019440,$670E6A04,$72FF4442,$70036150,$534266F8
		dc.l $302EFFDC,$D04041FA,$00DC3183,$00006160,$70004CDF,$000C4E75,$48E72000,$74550839
		dc.l $000400BF,$E001670E,$700372FF,$611E51CA,$FFEE701E,$6010302E,$FFDCD040,$41FA00A6
		dc.l $42700000,$70004CDF,$00044E75,$2F00612A,$4A016B04,$08800001,$08800000,$13C000BF
		dc.l $D10008C0,$000013C0,$00BFD100,$201F603A,$610813C0,$00BFD100,$4E7548A7,$6000302E
		dc.l $FFDC1439,$00BFD100,$0002007F,$56000182,$5700D040,$323B004E,$08010000,$67040882
		dc.l $00021002,$4C9F0006,$4E75611E,$08390000,$00BFDE00,$66F65380,$66F04E75,$08390000
		dc.l $00BFDE00,$661C5380,$671813FC,$000800BF,$DE0013FC,$008A00BF,$D40013FC,$000200BF
		dc.l $D5004E75,$FFFFFFFF,$FFFFFFFF

********************************************************************************
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

relocate	movem.l	d1-d7/a1-a6,-(sp)

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

********************************************************************************
;INPUT:		a0.l=address of source
;		a1.l=address of destination
;OUTPUT:	d0.l=length of unpacked data (0=error)
;CHANGES:	none

unpack		dc.l $48E7FFFE,$4FEFFE80,$244F6100,$016C7200,$B0BC524E,$43016600,$00F86100,$015C2F40
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
.no_any_required

		move.l	exchip_amount(a5),d2
		beq.s	.no_exchip_required
		move.w	#MEMF_CHIP!MEMF_PUBLIC,d1	;search for exchip
		bsr     search_memlist
		tst.l	d0
		bne.s	.exchip_not_found
		move.l	a0,exchip_mem_address(a5)
		bra.s	.exchip_found
.exchip_not_found
		clr.l	exchip_amount(a5)
.exchip_found
.no_exchip_required

		move.l	exany_amount(a5),d2
		beq.s	.no_exany_required
		move.w	#MEMF_PUBLIC,d1			;search for exany
		bsr     search_memlist
		tst.l	d0
		bne.s	.exany_not_found
		move.l	a0,exany_mem_address(a5)
		bra.s	.exany_found
.exany_not_found
		clr.l	exany_amount(a5)
.exany_found
.no_exany_required

		move.l	ramdisk_amount(a5),d2
		beq.s	.no_ramdisk_required
		move.w	#MEMF_PUBLIC,d1			;search for ramdisk
		bsr     search_memlist
		tst.l	d0
		bne.s	.ramdisk_not_found
		move.l	a0,ramdisk_mem_address(a5)
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
		move.l	MemList(a6),a6			;get address of first
							; memory region structure
.next_node
		move.w	MH_ATTRIBUTES(a6),d0		;get memory type
		and.w	d1,d0
		cmp.w	d0,d1				;chip/fast?
		bne	.wrong_attr			;branch if wrong type

		move.l	MH_LOWER(a6),d4
		and.l	#$fff80000,d4			;round base address down to
		bne.s	.not_at_0
		move.l	#$100,d4			;allow room at start of mem
.not_at_0	move.l	d4,a0				; nearest 512k

		move.l	MH_UPPER(a6),d3
		add.l	#$7ffff,d3			;round top address up to
		and.l	#$fff80000,d3			; nearest 512k
		move.l	d3,a1

		bsr	check_chunk
		tst.l	d0
		beq.s	.found

.wrong_attr	move.l	LN_SUCC(a6),a6
		cmp.l	#0,a6
		bne	.next_node			;branch if not end of list

		moveq.l	#-1,d0
		movem.l	(sp)+,d1-d7/a1-a6
		rts

.found		moveq.l	#0,d0
		movem.l	(sp)+,d1-d7/a1-a6
		rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
check_chunk
		move.w	MH_ATTRIBUTES(a6),d0		;check memory type
		and.w	#MEMF_CHIP,d0
		beq	check_fast_chunk

check_chip_chunk
		cmp.l	bot_chip(a5),a1			;this chunk below allocated?
		ble.s	.below				;yes, then branch

		cmp.l	top_chip(a5),a1			;this chunk all used?
		ble	.all_used			;yes, then end

		cmp.l	top_chip(a5),a0			;bottom of chunk used?
		bgt.s	.not_bottom_used		;no, then branch
		move.l	top_chip(a5),a0
.not_bottom_used

		move.l	a1,d3
		sub.l	a0,d3
		addq.l	#1,d3				;d3=size of chunk?

		cmp.l	d2,d3				;chunk big enough?
		blt	.too_small			;yes, then branch

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
		addq.l	#1,d3				;d3=size of chunk?

		cmp.l	d2,d3				;chunk big enough?
		ble	.too_small			;yes, then branch

		move.l	a0,bot_chip(a5)
		moveq.l	#0,d0
		rts

.too_small
.all_used
.error		moveq.l	#-1,d0				;flag failed
		rts

check_fast_chunk
		cmp.l	bot_any(a5),a1			;this chunk below allocated?
		ble.s	.below				;yes, then branch

		cmp.l	top_any(a5),a1			;this chunk all used?
		ble	.all_used			;yes, then end

		cmp.l	top_any(a5),a0			;bottom of chunk used?
		bgt.s	.not_bottom_used		;no, then branch
		move.l	top_any(a5),a0
.not_bottom_used

		move.l	a1,d3
		sub.l	d0,d3
		addq.l	#1,d3				;d3=size of chunk?

		cmp.l	d2,d3				;chunk big enough?
		blt	.too_small			;yes, then branch

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
		addq.l	#1,d3				;d3=size of chunk?

		cmp.l	d2,d3				;chunk big enough?
		ble	.too_small			;yes, then branch

		move.l	a0,bot_any(a5)
		moveq.l	#0,d0
		rts
.too_small
.all_used
.error		moveq.l	#-1,d0				;flag failed
		rts

********************************************************************************
;INPUT:		a5.l=address of parameters/variables block
;OUTPUT:	d0.l=error code (0=no error)
;CHANGES:	none

system_config
		movem.l	d1-d7/a0-a6,-(sp)

		move.l	4.w,a6

;--- modify CACR ---------------------------------------------------------------
		cmpi.w	#37,LIB_VERSION(a6)
		blt.s	.too_old
		move.l	new_cacr(a5),d0
		or.l	#CACRF_WriteAllocate!CACRF_ClearI!CACRF_ClearD,d0
		move.l	changed_cacr(a5),d1
		or.l	#CACRF_WriteAllocate!CACRF_ClearI!CACRF_ClearD,d1
		move.l	4.w,a6
		jsr	_LVOCacheControl(a6)
		move.l	d0,old_cacr(a5)
.too_old
		moveq.l	#0,d0			;no error
.error		movem.l	(sp)+,d1-d7/a0-a6
		rts

********************************************************************************
killsys
		move.l	4.w,a6
		jsr	_LVODisable(a6)			;interrupts off

		move.l	(sp)+,a1			;remember return addr

		lea	.super_routine(pc),a0		;into supervisor mode
		move.l	a0,$84
		trap	#1
.super_routine
		move.l	#$dff000,a6			;hardware regs base

		move.w	#%0111111111111111,intena(a6)	;clear all interupts
		move.b	#%01111111,ciaaicr		;ciaa interrupts off
		move.b	#%01111111,ciabicr		;ciab interrupts off
		move.w	#$2000,sr

		move.w	#%0000001111111111,dmacon(a6)	;all dma off

		move.l  any_mem_address(a5),d0
		add.l	any_amount(a5),d0
		move.l	d0,sp

		move.l	#0,4				;corrupt execbase
							; forces a cold boot
							; on reset

		move.w	#0,aud0+ac_vol(a6)		;ch0 off
		move.w	#0,aud1+ac_vol(a6)		;ch1 off
		move.w	#0,aud2+ac_vol(a6)		;ch2 off
		move.w	#0,aud3+ac_vol(a6)		;ch3 off

		lea	color(a6),a0			;initialise palette
		moveq.l	#31,d0				; to black
.loop		clr.w	(a0)+
		dbf	d0,.loop

		jmp	(a1)				;return

********************************************************************************
setup_sys
		move.b	#%01111111,ciaaicr
		move.b	#%10001000,ciaaicr		;ciaa keyboard on
		move.b	#%01111100,ciabicr
		move.b	#%10000111,ciabicr		;ciab timer A & B, tod on
		move.b	#$ff,ciabtblo			;ciab timer B delay
		move.b	#$ff,ciabtbhi
		move.b	#%00000001,ciabcrb		;ciab timer B one-shot start
		move.w	#$2000,sr
		move.w	#%1000011001110000,dmacon(a6)	;all dma except audio

		rts

****************************************************************************
;INPUT:		a0.l=address of data to checksum
;		d0.l=length of data to check (must be even)
;OUTPUT:	d0.l=success flag (-1=failed)
;CHANGES:	none

checksum	movem.l	d1-d4/a0,-(sp)

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

		cmp.l	.code(pc),d1
		bne.s	.error

.success	moveq.l	#0,d0
		sf.b	checksum_failed(a5)
		movem.l	(sp)+,d1-d4/a0
		rts

.error		moveq.l	#-1,d0
		st.b	checksum_failed(a5)
		movem.l	(sp)+,d1-d4/a0
		rts

.code		include	/checksum.s

********************************************************************************

file_name	dc.b	"DF0:Hired Guns",0
trackdisk_name	dc.b	"trackdisk.device",0
port_name	dc.b	"Boot Port",0
		even

		rsreset
parameters	rs.b	stb_SIZEOF
work_buffer	rs.b	$3300
stack		rs.b	200
stack_end	rs.b	0
vars_size	rs.b	0

		even
