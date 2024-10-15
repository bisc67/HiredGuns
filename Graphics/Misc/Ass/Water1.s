;script before
;copy 3dgame:graphics/misc/ilbm/Water1.ilbm ram:output.ilbm
;copy work:c/ilbm2raw ram:
;
;ram:ilbm2raw -cf80,16,32,9 ram:output.ilbm ram:temp1
;ram:ilbm2raw -cf112,16,32,9 ram:output.ilbm ram:temp2
;ram:ilbm2raw -cf144,16,32,9 ram:output.ilbm ram:temp3
;ram:ilbm2raw -cf176,16,32,9 ram:output.ilbm ram:temp4
;ram:ilbm2raw -cf208,16,32,9 ram:output.ilbm ram:temp5
;ram:ilbm2raw -cf64,64,48,12 ram:output.ilbm ram:temp6
;ram:ilbm2raw -cf112,63,48,12 ram:output.ilbm ram:temp7
;ram:ilbm2raw -cf160,63,32,12 ram:output.ilbm ram:temp8
;join ram:temp1 ram:temp2 ram:temp3 ram:temp4 ram:temp5 ram:temp6 ram:temp7 ram:temp8 as ram:output.bin
;
;ram:ilbm2raw -cf192,63,48,12 ram:output.ilbm ram:temp1
;ram:ilbm2raw -cf240,63,48,12 ram:output.ilbm ram:temp2
;ram:ilbm2raw -cf48,129,32,20 ram:output.ilbm ram:temp3
;ram:ilbm2raw -cf80,129,64,20 ram:output.ilbm ram:temp4
;ram:ilbm2raw -cf144,129,48,20 ram:output.ilbm ram:temp5
;ram:ilbm2raw -cf192,129,64,20 ram:output.ilbm ram:temp6
;ram:ilbm2raw -cf256,129,32,20 ram:output.ilbm ram:temp7
;ram:ilbm2raw -cf80,208,48,18 ram:output.ilbm ram:temp8
;join ram:output.bin ram:temp1 ram:temp2 ram:temp3 ram:temp4 ram:temp5 ram:temp6 ram:temp7 ram:temp8 as ram:temp_output
;delete ram:output.bin
;rename ram:temp_output as ram:output.bin
;
;ram:ilbm2raw -cf128,208,80,18 ram:output.ilbm ram:temp1
;ram:ilbm2raw -cf208,208,48,18 ram:output.ilbm ram:temp2
;ram:ilbm2raw -cf80,268,32,2 ram:output.ilbm ram:temp3
;ram:ilbm2raw -cf128,268,96,2 ram:output.ilbm ram:temp4
;ram:ilbm2raw -cf224,268,32,2 ram:output.ilbm ram:temp5
;ram:ilbm2raw -cf48,30,32,7 ram:output.ilbm ram:temp6
;ram:ilbm2raw -cf80,30,32,7 ram:output.ilbm ram:temp7
;ram:ilbm2raw -cf112,30,32,7 ram:output.ilbm ram:temp8
;join ram:output.bin ram:temp1 ram:temp2 ram:temp3 ram:temp4 ram:temp5 ram:temp6 ram:temp7 ram:temp8 as ram:temp_output
;delete ram:output.bin
;rename ram:temp_output as ram:output.bin
;
;ram:ilbm2raw -cf144,30,32,7 ram:output.ilbm ram:temp1
;ram:ilbm2raw -cf176,30,32,7 ram:output.ilbm ram:temp2
;ram:ilbm2raw -cf208,30,32,7 ram:output.ilbm ram:temp3
;ram:ilbm2raw -cf240,30,32,7 ram:output.ilbm ram:temp4
;ram:ilbm2raw -cf32,81,16,11 ram:output.ilbm ram:temp5
;ram:ilbm2raw -cf64,81,48,11 ram:output.ilbm ram:temp6
;ram:ilbm2raw -cf112,81,48,11 ram:output.ilbm ram:temp7
;ram:ilbm2raw -cf160,81,32,11 ram:output.ilbm ram:temp8
;join ram:output.bin ram:temp1 ram:temp2 ram:temp3 ram:temp4 ram:temp5 ram:temp6 ram:temp7 ram:temp8 as ram:temp_output
;delete ram:output.bin
;rename ram:temp_output as ram:output.bin
;
;ram:ilbm2raw -cf192,81,48,11 ram:output.ilbm ram:temp1
;ram:ilbm2raw -cf240,81,48,11 ram:output.ilbm ram:temp2
;ram:ilbm2raw -cf288,81,16,11 ram:output.ilbm ram:temp3
;ram:ilbm2raw -cf48,158,32,16 ram:output.ilbm ram:temp4
;ram:ilbm2raw -cf80,158,64,16 ram:output.ilbm ram:temp5
;ram:ilbm2raw -cf144,158,48,16 ram:output.ilbm ram:temp6
;ram:ilbm2raw -cf192,158,64,16 ram:output.ilbm ram:temp7
;ram:ilbm2raw -cf256,158,32,16 ram:output.ilbm ram:temp8
;join ram:output.bin ram:temp1 ram:temp2 ram:temp3 ram:temp4 ram:temp5 ram:temp6 ram:temp7 ram:temp8 as ram:temp_output
;delete ram:output.bin
;rename ram:temp_output as ram:output.bin
;
;ram:ilbm2raw -cf80,239,48,28 ram:output.ilbm ram:temp1
;ram:ilbm2raw -cf128,239,80,28 ram:output.ilbm ram:temp2
;ram:ilbm2raw -cf208,239,48,28 ram:output.ilbm ram:temp3
;ram:ilbm2raw -cf80,328,32,22 ram:output.ilbm ram:temp4
;ram:ilbm2raw -cf80,380,144,22 ram:output.ilbm ram:temp5
;ram:ilbm2raw -cf208,328,32,22 ram:output.ilbm ram:temp6
;join ram:output.bin ram:temp1 ram:temp2 ram:temp3 ram:temp4 ram:temp5 ram:temp6 as ram:temp_output
;delete ram:output.bin
;rename ram:temp_output as ram:output.bin
;
;ram:ilbm2raw -cf80,42,32,13 ram:output.ilbm ram:temp1
;ram:ilbm2raw -cf112,42,32,13 ram:output.ilbm ram:temp2
;ram:ilbm2raw -cf144,42,32,13 ram:output.ilbm ram:temp3
;ram:ilbm2raw -cf176,42,32,13 ram:output.ilbm ram:temp4
;ram:ilbm2raw -cf208,42,32,13 ram:output.ilbm ram:temp5
;ram:ilbm2raw -cf64,98,48,16 ram:output.ilbm ram:temp6
;join ram:output.bin ram:temp1 ram:temp2 ram:temp3 ram:temp4 ram:temp5 ram:temp6 as ram:temp_output
;delete ram:output.bin
;rename ram:temp_output as ram:output.bin
;
;ram:ilbm2raw -cf112,98,48,16 ram:output.ilbm ram:temp1
;ram:ilbm2raw -cf160,98,32,16 ram:output.ilbm ram:temp2
;ram:ilbm2raw -cf192,98,48,16 ram:output.ilbm ram:temp3
;ram:ilbm2raw -cf240,98,48,16 ram:output.ilbm ram:temp4
;join ram:output.bin ram:temp1 ram:temp2 ram:temp3 ram:temp4 as ram:temp_output
;delete ram:output.bin
;rename ram:temp_output as ram:output.bin
;
;script assemble
;devpac3-2.0:devpac/genam >ram:errors.txt ram:test.s
;
;script after
;
;work:c/strip ram:test 32
;copy ram:test.bin 3dgame:graphics/misc/raw/Water1.bin
;
;script end

	output	ram:test
	include "3dgame:sources/macros.i"
	opt	l-

size	set	bob_struct_size+67*14
planes  equ	1
dump	equ	1

DEF_BOB	macro
	dc.w	\1					;width in pixels
	dc.w	\2					;height in lines
	dc.w	(\3-151)				;x position
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

	DEF_BOB	32,9,167,450,0				;block 0
	DEF_BOB	32,9,189,450,0				;block 1
	DEF_BOB	32,9,211,450,0				;block 2
	DEF_BOB	32,9,230,450,0				;block 3
	DEF_BOB	32,9,246,450,0				;block 4
	DEF_BOB	48,12,151,460,0				;block 5
	DEF_BOB	48,12,174,460,0				;block 6
	DEF_BOB	32,12,206,460,0				;block 7
	DEF_BOB	48,12,233,460,0				;block 8
	DEF_BOB	48,12,233,460,0				;block 9
	DEF_BOB	32,20,151,470,0				;block 10
	DEF_BOB	64,20,151,470,0				;block 11
	DEF_BOB	48,20,199,470,0				;block 12
	DEF_BOB	64,20,238,470,0				;block 13
	DEF_BOB	32,20,270,470,0				;block 14
	DEF_BOB	48,18,151,470,0				;block 15
	DEF_BOB	80,18,182,470,0				;block 16
	DEF_BOB	48,18,246,470,0				;block 17
	DEF_BOB	32,2,151,470,0				;block 18
	DEF_BOB	96,2,181,470,0				;block 19
	DEF_BOB	32,2,262,470,0				;block 20
	DEF_BOB	32,7,151,428,0				;block 21
	DEF_BOB	32,7,167,428,0				;block 22
	DEF_BOB	32,7,189,428,0				;block 23
	DEF_BOB	32,7,211,428,0				;block 24
	DEF_BOB	32,7,230,428,0				;block 25
	DEF_BOB	32,7,246,428,0				;block 26
	DEF_BOB	32,7,262,428,0				;block 27
	DEF_BOB	16,11,151,429,0				;block 28
	DEF_BOB	48,11,151,428,0				;block 29
	DEF_BOB	48,11,178,428,0				;block 30
	DEF_BOB	32,11,206,428,0				;block 31
	DEF_BOB	48,11,233,428,0				;block 32
	DEF_BOB	48,11,255,428,0				;block 33
	DEF_BOB	16,11,277,429,0				;block 34
	DEF_BOB	32,16,151,428,0				;block 35
	DEF_BOB	64,16,151,428,0				;block 36
	DEF_BOB	48,16,198,428,0				;block 37
	DEF_BOB	64,16,237,428,0				;block 38
	DEF_BOB	32,16,270,428,0				;block 39
	DEF_BOB	48,28,151,428,0				;block 40
	DEF_BOB	80,28,182,428,0				;block 41
	DEF_BOB	48,28,246,428,0				;block 42
	DEF_BOB	32,22,151,428,0				;block 43
	DEF_BOB	144,22,151,418,0			;block 44
	DEF_BOB	32,22,262,428,0				;block 45

	DEF_BOB	32,13,167,412,0				;block 46
	DEF_BOB	32,13,189,412,0				;block 47
	DEF_BOB	32,13,211,412,0				;block 48
	DEF_BOB	32,13,230,412,0				;block 49
	DEF_BOB	32,13,246,412,0				;block 50
	DEF_BOB	48,16,151,407,0				;block 51
	DEF_BOB	48,16,179,407,0				;block 52
	DEF_BOB	32,16,206,407,0				;block 53
	DEF_BOB	48,16,231,407,0				;block 54
	DEF_BOB	48,16,253,407,0				;block 55

	DEF_BOB	0,0,0,0,3				;block 56
	DEF_BOB	0,0,0,0,3				;block 57
	DEF_BOB	0,0,0,0,3				;block 58
	DEF_BOB	0,0,0,0,3				;block 59
	DEF_BOB	0,0,0,0,3				;block 60
	DEF_BOB	0,0,0,0,3				;block 61
	DEF_BOB	0,0,0,0,3				;block 62
	DEF_BOB	0,0,0,0,3				;block 63
	DEF_BOB	0,0,0,0,3				;block 64
	DEF_BOB	0,0,0,0,3				;block 65
	DEF_BOB	0,0,0,0,3				;block 66

        ENDC

	IFD	dump
	incbin	"3dgame:graphics/misc/dump/water1.dump"
	ENDC

	incbin	"ram:output.bin"
	end


