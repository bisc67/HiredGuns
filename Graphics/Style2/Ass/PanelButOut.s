;script before
;copy 3dgame:graphics/style2/ilbm/panelbutout.ilbm ram:output.ilbm
;copy work:c/ilbm2raw ram:
;
;ram:ilbm2raw -b4cmf0,0,32,15 ram:output.ilbm ram:temp1
;ram:ilbm2raw -b4cmf32,0,32,15 ram:output.ilbm ram:temp2
;ram:ilbm2raw -b4cmf64,0,16,12 ram:output.ilbm ram:temp3
;ram:ilbm2raw -b4cmf80,0,32,15 ram:output.ilbm ram:temp4
;ram:ilbm2raw -b4cmf112,0,32,15 ram:output.ilbm ram:temp5
;ram:ilbm2raw -b4cmf0,15,48,22 ram:output.ilbm ram:temp6
;ram:ilbm2raw -b4cmf48,15,32,21 ram:output.ilbm ram:temp7
;ram:ilbm2raw -b4cmf80,15,16,16 ram:output.ilbm ram:temp8
;join ram:temp1 ram:temp2 ram:temp3 ram:temp4 ram:temp5 ram:temp6 ram:temp7 ram:temp8 as ram:output.bin
;
;ram:ilbm2raw -b4cmf96,15,32,21 ram:output.ilbm ram:temp1
;ram:ilbm2raw -b4cmf128,15,48,22 ram:output.ilbm ram:temp2
;ram:ilbm2raw -b4cmf0,37,16,14 ram:output.ilbm ram:temp3
;ram:ilbm2raw -b4cmf16,37,48,11 ram:output.ilbm ram:temp4
;ram:ilbm2raw -b4cmf64,37,32,7 ram:output.ilbm ram:temp5
;ram:ilbm2raw -b4cmf96,37,48,11 ram:output.ilbm ram:temp6
;ram:ilbm2raw -b4cmf144,37,16,14 ram:output.ilbm ram:temp7
;ram:ilbm2raw -b4cmf0,51,32,6 ram:output.ilbm ram:temp8
;join ram:output.bin ram:temp1 ram:temp2 ram:temp3 ram:temp4 ram:temp5 ram:temp6 ram:temp7 ram:temp8 as ram:temp_output
;delete ram:output.bin
;rename ram:temp_output as ram:output.bin
;
;ram:ilbm2raw -b4cmf32,51,32,6 ram:output.ilbm ram:temp1
;ram:ilbm2raw -b4cmf64,51,32,6 ram:output.ilbm ram:temp2
;ram:ilbm2raw -b4cmf96,51,16,6 ram:output.ilbm ram:temp3
;ram:ilbm2raw -b4cmf112,51,32,6 ram:output.ilbm ram:temp4
;ram:ilbm2raw -b4cmf144,51,32,6 ram:output.ilbm ram:temp5
;ram:ilbm2raw -b4cmf176,51,32,6 ram:output.ilbm ram:temp6
;ram:ilbm2raw -b4cmf0,57,16,5 ram:output.ilbm ram:temp7
;ram:ilbm2raw -b4cmf16,57,48,8 ram:output.ilbm ram:temp8
;join ram:output.bin ram:temp1 ram:temp2 ram:temp3 ram:temp4 ram:temp5 ram:temp6 ram:temp7 ram:temp8 as ram:temp_output
;delete ram:output.bin
;rename ram:temp_output as ram:output.bin
;
;ram:ilbm2raw -b4cmf64,57,32,8 ram:output.ilbm ram:temp1
;ram:ilbm2raw -b4cmf96,57,16,8 ram:output.ilbm ram:temp2
;ram:ilbm2raw -b4cmf112,57,32,8 ram:output.ilbm ram:temp3
;ram:ilbm2raw -b4cmf144,57,48,8 ram:output.ilbm ram:temp4
;ram:ilbm2raw -b4cmf192,57,16,5 ram:output.ilbm ram:temp5
;ram:ilbm2raw -b4cmf0,65,16,11 ram:output.ilbm ram:temp6
;ram:ilbm2raw -b4cmf16,65,48,11 ram:output.ilbm ram:temp7
;ram:ilbm2raw -b4cmf64,65,32,11 ram:output.ilbm ram:temp8
;join ram:output.bin ram:temp1 ram:temp2 ram:temp3 ram:temp4 ram:temp5 ram:temp6 ram:temp7 ram:temp8 as ram:temp_output
;delete ram:output.bin
;rename ram:temp_output as ram:output.bin
;
;ram:ilbm2raw -b4cmf96,65,48,11 ram:output.ilbm ram:temp1
;ram:ilbm2raw -b4cmf144,65,16,11 ram:output.ilbm ram:temp2
;ram:ilbm2raw -b4cmf0,76,48,20 ram:output.ilbm ram:temp3
;ram:ilbm2raw -b4cmf48,76,48,20 ram:output.ilbm ram:temp4
;ram:ilbm2raw -b4cmf96,76,48,20 ram:output.ilbm ram:temp5
;ram:ilbm2raw -b4cmf0,96,32,35 ram:output.ilbm ram:temp6
;ram:ilbm2raw -b4cmf32,96,32,35 ram:output.ilbm ram:temp7
;join ram:output.bin ram:temp1 ram:temp2 ram:temp3 ram:temp4 ram:temp5 ram:temp6 ram:temp7 as ram:temp_output
;delete ram:output.bin
;rename ram:temp_output as ram:output.bin
;
;script assemble
;work:programming/languages/devpac/genam >ram:errors.txt ram:test.s
;
;script after
;work:c/strip ram:test 32
;copy ram:test 3dgame:graphics/style2/raw/PanelButOut.bin
;script end

	output	ram:test
	include "3dgame:sources/macros.i"
	opt     o+,ow-

size	set	bob_struct_size+67*14
dump	equ     0

DEF_BOB	macro
	dc.w	\1					;width in pixels
	dc.w	\2					;height in lines
	dc.w	\3					;x position
	dc.w	\4					;y position
	dc.w	\5					;control
	dc.l	size
size	set	size+(((\1/8)*\2)*5)
	endm

	IFND	dump

bob_structure	dc.l    0	;address of image data
		dc.w	0       ;width in pixels
		dc.w	0       ;height in pixels
		dc.w	4       ;plane for mask 0-5 (6=no mask)
		dc.b	0	;0=unflipped 1=flipped
		dc.b	0	;0=clipping disabled 1=clipping enabled
		dc.b	1       ;0=no draw 1=copy 2=clear 3=set
		dc.b    1
		dc.b    1
		dc.b    1
		dc.b    2
		dc.b    0

	DEF_BOB	32,15,16+6,9+4,0			;block 0
	DEF_BOB	32,15,38+6,9+4,0			;block 1
	DEF_BOB	16,12,60+7,9+4,0			;block 2
	DEF_BOB	32,15,79+2,9+4,0			;block 3
	DEF_BOB	32,15,95+3,9+4,0			;block 4
	DEF_BOB	48,22,0+0,0+1,0				;block 5
	DEF_BOB	32,21,23+9,0+1,0			;block 6
	DEF_BOB	16,16,55+9,0+1,0			;block 7
	DEF_BOB	32,21,82+2,0+1,0			;block 8
	DEF_BOB	48,22,104+4,0+1,0			;block 9
	DEF_BOB	16,14,0+11,0,0				;block 10
	DEF_BOB	48,11,0+10,0,0				;block 11
	DEF_BOB	32,7,47+13,0,0				;block 12
	DEF_BOB	48,11,87+2,0,0				;block 13
	DEF_BOB	16,14,119+6,0,0				;block 14
	DEF_BOB	0,0,0,0,3				;block 15
	DEF_BOB	0,0,0,0,3				;block 16
	DEF_BOB	0,0,0,0,3				;block 17
	DEF_BOB	0,0,0,0,3				;block 18
	DEF_BOB	0,0,0,0,3				;block 19
	DEF_BOB	0,0,0,0,3				;block 20
	DEF_BOB	32,6,0+0,31+5,2				;block 21
	DEF_BOB	32,6,16+6,31+4,2			;block 22
	DEF_BOB	32,6,38+6,31+5,2			;block 23
	DEF_BOB	16,6,60+7,31+5,2			;block 24
	DEF_BOB	32,6,79+2,31+5,2			;block 25
	DEF_BOB	32,6,95+3,31+5,2			;block 26
	DEF_BOB	32,6,111+5,31+5,2			;block 27
	DEF_BOB	16,5,0+5,28+8,2				;block 28
	DEF_BOB	48,8,0+0,26+8,2				;block 29
	DEF_BOB	32,8,23+8,26+8,2			;block 30
	DEF_BOB	16,8,55+9,26+8,2			;block 31
	DEF_BOB	32,8,82+2,26+8,2			;block 32
	DEF_BOB	48,8,104+4,26+8,2			;block 33
	DEF_BOB	16,5,126+4,28+8,2			;block 34
	DEF_BOB	16,11,0+10,19+12,2			;block 35
	DEF_BOB	48,11,0+10,18+13,2			;block 36
	DEF_BOB	32,11,47+13,18+13,2			;block 37
	DEF_BOB	48,11,87+3,18+13,2			;block 38
	DEF_BOB	16,11,119+0,19+12,2			;block 39
	DEF_BOB	48,20,0+0,2+20,2			;block 40
	DEF_BOB	48,20,31+21,2+20,2			;block 41
	DEF_BOB	48,20,95+4,2+20,2			;block 42
	DEF_BOB	32,35,0+0,0+7,2				;block 43
	DEF_BOB	0,0,0,0,3				;block 44
	DEF_BOB	32,35,0+12,0+7,2			;block 45

size	set	bob_struct_size+67*14

	DEF_BOB	32,15,16+6,50+4,1			;block 46
	DEF_BOB	32,15,38+6,50+4,1			;block 47
	DEF_BOB	16,12,60+7,50+4,1			;block 48
	DEF_BOB	32,15,79+2,50+4,1			;block 49
	DEF_BOB	32,15,95+3,50+4,1			;block 50
	DEF_BOB	48,22,0+0,53+1,1			;block 51
	DEF_BOB	32,21,23+9,53+1,1			;block 52
	DEF_BOB	16,16,55+9,53+1,1			;block 53
	DEF_BOB	32,21,82+2,53+1,1			;block 54
	DEF_BOB	48,22,104+4,53+1,1			;block 55
	DEF_BOB	16,14,0+11,58,1				;block 56
	DEF_BOB	48,11,0+10,58,1				;block 57
	DEF_BOB	32,7,47+13,58,1				;block 58
	DEF_BOB	48,11,87+2,58,1				;block 59
	DEF_BOB	16,14,119+6,58,1			;block 60
	DEF_BOB	0,0,0,0,3				;block 61
	DEF_BOB	0,0,0,0,3				;block 62
	DEF_BOB	0,0,0,0,3				;block 63
	DEF_BOB	0,0,0,0,3				;block 64
	DEF_BOB	0,0,0,0,3				;block 65
	DEF_BOB	0,0,0,0,3				;block 66

	ENDC

	IFD	dump
	incbin	"3dgame:graphics/style2/dump/Panel.dump"
        ENDC

	incbin	"ram:output.bin"
	end


