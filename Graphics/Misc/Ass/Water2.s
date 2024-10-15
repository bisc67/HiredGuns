;script before
;copy 3dgame:graphics/misc/ilbm/Water2.ilbm ram:output.ilbm
;copy work:c/ilbm2raw ram:
;
;ram:ilbm2raw -cf80,11,32,14 ram:output.ilbm ram:temp1
;ram:ilbm2raw -cf112,11,32,14 ram:output.ilbm ram:temp2
;ram:ilbm2raw -cf144,11,32,14 ram:output.ilbm ram:temp3
;ram:ilbm2raw -cf176,11,32,14 ram:output.ilbm ram:temp4
;ram:ilbm2raw -cf208,11,32,14 ram:output.ilbm ram:temp5
;ram:ilbm2raw -cf64,55,48,20 ram:output.ilbm ram:temp6
;ram:ilbm2raw -cf112,55,48,20 ram:output.ilbm ram:temp7
;ram:ilbm2raw -cf160,55,32,20 ram:output.ilbm ram:temp8
;join ram:temp1 ram:temp2 ram:temp3 ram:temp4 ram:temp5 ram:temp6 ram:temp7 ram:temp8 as ram:output.bin
;
;ram:ilbm2raw -cf192,55,48,20 ram:output.ilbm ram:temp1
;ram:ilbm2raw -cf240,55,48,20 ram:output.ilbm ram:temp2
;ram:ilbm2raw -cf48,123,32,26 ram:output.ilbm ram:temp3
;ram:ilbm2raw -cf80,123,64,26 ram:output.ilbm ram:temp4
;ram:ilbm2raw -cf144,123,48,26 ram:output.ilbm ram:temp5
;ram:ilbm2raw -cf192,123,64,26 ram:output.ilbm ram:temp6
;ram:ilbm2raw -cf256,123,32,26 ram:output.ilbm ram:temp7
;ram:ilbm2raw -cf80,203,48,18 ram:output.ilbm ram:temp8
;join ram:output.bin ram:temp1 ram:temp2 ram:temp3 ram:temp4 ram:temp5 ram:temp6 ram:temp7 ram:temp8 as ram:temp_output
;delete ram:output.bin
;rename ram:temp_output as ram:output.bin
;
;ram:ilbm2raw -cf128,203,80,18 ram:output.ilbm ram:temp1
;ram:ilbm2raw -cf208,203,48,18 ram:output.ilbm ram:temp2
;ram:ilbm2raw -cf80,268,32,2 ram:output.ilbm ram:temp3
;ram:ilbm2raw -cf128,268,96,2 ram:output.ilbm ram:temp4
;ram:ilbm2raw -cf224,268,32,2 ram:output.ilbm ram:temp5
;ram:ilbm2raw -cf48,26,32,11 ram:output.ilbm ram:temp6
;ram:ilbm2raw -cf80,26,32,11 ram:output.ilbm ram:temp7
;ram:ilbm2raw -cf112,26,32,11 ram:output.ilbm ram:temp8
;join ram:output.bin ram:temp1 ram:temp2 ram:temp3 ram:temp4 ram:temp5 ram:temp6 ram:temp7 ram:temp8 as ram:temp_output
;delete ram:output.bin
;rename ram:temp_output as ram:output.bin
;
;ram:ilbm2raw -cf144,26,32,11 ram:output.ilbm ram:temp1
;ram:ilbm2raw -cf176,26,32,11 ram:output.ilbm ram:temp2
;ram:ilbm2raw -cf208,26,32,11 ram:output.ilbm ram:temp3
;ram:ilbm2raw -cf240,26,32,11 ram:output.ilbm ram:temp4
;ram:ilbm2raw -cf32,76,16,11 ram:output.ilbm ram:temp5
;ram:ilbm2raw -cf64,76,48,11 ram:output.ilbm ram:temp6
;ram:ilbm2raw -cf112,76,48,15 ram:output.ilbm ram:temp7
;ram:ilbm2raw -cf160,76,32,16 ram:output.ilbm ram:temp8
;join ram:output.bin ram:temp1 ram:temp2 ram:temp3 ram:temp4 ram:temp5 ram:temp6 ram:temp7 ram:temp8 as ram:temp_output
;delete ram:output.bin
;rename ram:temp_output as ram:output.bin
;
;ram:ilbm2raw -cf192,76,48,16 ram:output.ilbm ram:temp1
;ram:ilbm2raw -cf240,76,48,16 ram:output.ilbm ram:temp2
;ram:ilbm2raw -cf288,76,16,16 ram:output.ilbm ram:temp3
;ram:ilbm2raw -cf48,153,32,16 ram:output.ilbm ram:temp4
;ram:ilbm2raw -cf80,153,64,16 ram:output.ilbm ram:temp5
;ram:ilbm2raw -cf144,153,48,16 ram:output.ilbm ram:temp6
;ram:ilbm2raw -cf192,153,64,16 ram:output.ilbm ram:temp7
;ram:ilbm2raw -cf256,153,32,16 ram:output.ilbm ram:temp8
;join ram:output.bin ram:temp1 ram:temp2 ram:temp3 ram:temp4 ram:temp5 ram:temp6 ram:temp7 ram:temp8 as ram:temp_output
;delete ram:output.bin
;rename ram:temp_output as ram:output.bin
;
;ram:ilbm2raw -cf80,234,48,28 ram:output.ilbm ram:temp1
;ram:ilbm2raw -cf128,234,80,28 ram:output.ilbm ram:temp2
;ram:ilbm2raw -cf208,234,48,28 ram:output.ilbm ram:temp3
;ram:ilbm2raw -cf80,308,32,22 ram:output.ilbm ram:temp4
;ram:ilbm2raw -cf80,360,144,22 ram:output.ilbm ram:temp5
;ram:ilbm2raw -cf208,308,32,22 ram:output.ilbm ram:temp6
;join ram:output.bin ram:temp1 ram:temp2 ram:temp3 ram:temp4 ram:temp5 ram:temp6 as ram:temp_output
;delete ram:output.bin
;rename ram:temp_output as ram:output.bin
;
;ram:ilbm2raw -cf80,38,32,13 ram:output.ilbm ram:temp1
;ram:ilbm2raw -cf112,38,32,13 ram:output.ilbm ram:temp2
;ram:ilbm2raw -cf144,38,32,13 ram:output.ilbm ram:temp3
;ram:ilbm2raw -cf176,38,32,13 ram:output.ilbm ram:temp4
;ram:ilbm2raw -cf208,38,32,13 ram:output.ilbm ram:temp5
;ram:ilbm2raw -cf64,94,48,16 ram:output.ilbm ram:temp6
;join ram:output.bin ram:temp1 ram:temp2 ram:temp3 ram:temp4 ram:temp5 ram:temp6 as ram:temp_output
;delete ram:output.bin
;rename ram:temp_output as ram:output.bin
;
;ram:ilbm2raw -cf112,94,48,16 ram:output.ilbm ram:temp1
;ram:ilbm2raw -cf160,94,32,16 ram:output.ilbm ram:temp2
;ram:ilbm2raw -cf192,94,48,16 ram:output.ilbm ram:temp3
;ram:ilbm2raw -cf240,94,48,16 ram:output.ilbm ram:temp4
;join ram:output.bin ram:temp1 ram:temp2 ram:temp3 ram:temp4 as ram:temp_output
;delete ram:output.bin
;rename ram:temp_output as ram:output.bin
;
;script assemble
;devpac3-2.0:devpac/genam >ram:errors.txt ram:test.s
;
;script after
;work:c/strip ram:test 32
;copy ram:test 3dgame:graphics/misc/raw/Water2.bin
;script end

	output	ram:test
	include "3dgame:sources/macros.i"
	opt     o+,ow-

size	set	bob_struct_size+67*14
planes  equ	1
dump	equ	1

DEF_BOB	macro
	dc.w	\1					;width in pixels
	dc.w	\2					;height in lines
	dc.w	(\3-151)					;x position
	dc.w	(470-\4)				;y position
	dc.w	\5					;control
	dc.l	size
size	set	size+(((\1/8)*\2)*planes)
	endm

	IFND	dump

bob_structure	dc.l    0	;address of image data
		dc.w	0       ;width in pixels
		dc.w	0       ;height in pixels
		dc.w	0	;plane for mask 0-5 (6=no mask)
		dc.b	0	;0=unflipped 1=flipped
		dc.b	1	;0=clipping disabled 1=clipping enabled
		dc.b	0       ;0=no draw 1=copy 2=clear 3=set
    		dc.b    0
		dc.b    0
		dc.b    0
		dc.b    3
		dc.b    0

	DEF_BOB	32,14,167,450,0				;block 0
	DEF_BOB	32,14,189,450,0				;block 1
	DEF_BOB	32,14,211,450,0				;block 2
	DEF_BOB	32,14,230,450,0				;block 3
	DEF_BOB	32,14,246,450,0				;block 4
	DEF_BOB	48,20,151,460,0				;block 5
	DEF_BOB	48,20,174,460,0				;block 6
	DEF_BOB	32,20,206,460,0				;block 7
	DEF_BOB	48,20,233,460,0				;block 8
	DEF_BOB	48,20,250,460,0				;block 9
	DEF_BOB	32,26,151,470,0				;block 10
	DEF_BOB	64,26,151,470,0				;block 11
	DEF_BOB	48,26,199,470,0				;block 12
	DEF_BOB	64,26,238,470,0				;block 13
	DEF_BOB	32,26,270,470,0				;block 14
	DEF_BOB	48,18,151,470,0				;block 15
	DEF_BOB	80,18,182,470,0				;block 16
	DEF_BOB	48,18,246,470,0				;block 17
	DEF_BOB	32,2,151,470,0				;block 18
	DEF_BOB	80,2,181,470,0				;block 19
	DEF_BOB	32,2,262,470,0				;block 20
	DEF_BOB	32,11,151,428,0				;block 21
	DEF_BOB	32,11,167,428,0				;block 22
	DEF_BOB	32,11,189,428,0				;block 23
	DEF_BOB	32,11,211,428,0				;block 24
	DEF_BOB	32,11,230,428,0				;block 25
	DEF_BOB	32,11,246,428,0				;block 26
	DEF_BOB	32,11,262,428,0				;block 27
	DEF_BOB	16,15,151,428,0				;block 28
	DEF_BOB	48,16,151,428,0				;block 29
	DEF_BOB	48,16,178,428,0				;block 30
	DEF_BOB	32,16,206,428,0				;block 31
	DEF_BOB	48,16,233,428,0				;block 32
	DEF_BOB	48,16,255,428,0				;block 33
	DEF_BOB	16,15,277,428,0				;block 34
	DEF_BOB	32,24,151,428,0				;block 35
	DEF_BOB	64,24,151,428,0				;block 36
	DEF_BOB	48,24,198,428,0				;block 37
	DEF_BOB	64,24,237,428,0				;block 38
	DEF_BOB	32,24,270,428,0				;block 39
	DEF_BOB	48,40,151,428,0				;block 40
	DEF_BOB	80,40,182,428,0				;block 41
	DEF_BOB	48,40,246,428,0				;block 42
	DEF_BOB	32,42,151,428,0				;block 43
	DEF_BOB	144,42,151,428,0			;block 44
	DEF_BOB	32,42,262,428,0				;block 45

	DEF_BOB	32,17,167,412,0				;block 46
	DEF_BOB	32,17,189,412,0				;block 47
	DEF_BOB	32,17,211,412,0				;block 48
	DEF_BOB	32,17,230,412,0				;block 49
	DEF_BOB	32,17,246,412,0				;block 50
	DEF_BOB	48,21,151,407,0				;block 51
	DEF_BOB	48,21,174,407,0				;block 52
	DEF_BOB	32,21,206,407,0				;block 53
	DEF_BOB	48,21,231,407,0				;block 54
	DEF_BOB	48,21,253,407,0				;block 55
	DEF_BOB	32,10,151,397,0				;block 56
	DEF_BOB	64,10,151,397,0				;block 57
	DEF_BOB	48,10,199,397,0				;block 58
	DEF_BOB	64,10,238,397,0				;block 59
	DEF_BOB	32,10,270,397,0				;block 60
	DEF_BOB	0,0,0,0,3				;block 61
	DEF_BOB	0,0,0,0,3				;block 62
	DEF_BOB	0,0,0,0,3				;block 63
	DEF_BOB	0,0,0,0,3				;block 64
	DEF_BOB	0,0,0,0,3				;block 65
	DEF_BOB	0,0,0,0,3				;block 66

        ENDC

	IFD	dump
	incbin	"3dgame:graphics/misc/dump/water2.dump"
	ENDC

	incbin	"ram:output.bin"
	end


