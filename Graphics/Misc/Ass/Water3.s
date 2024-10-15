;script before
;copy 3dgame:graphics/misc/ilbm/water3.ilbm ram:output.ilbm
;copy work:c/ilbm2raw ram:
;
;ram:ilbm2raw -cf80,0,32,20 ram:output.ilbm ram:temp1
;ram:ilbm2raw -cf112,0,32,20 ram:output.ilbm ram:temp2
;ram:ilbm2raw -cf144,0,32,20 ram:output.ilbm ram:temp3
;ram:ilbm2raw -cf176,0,32,20 ram:output.ilbm ram:temp4
;ram:ilbm2raw -cf208,0,32,20 ram:output.ilbm ram:temp5
;ram:ilbm2raw -cf64,61,48,28 ram:output.ilbm ram:temp6
;ram:ilbm2raw -cf112,61,48,28 ram:output.ilbm ram:temp7
;ram:ilbm2raw -cf160,61,32,28 ram:output.ilbm ram:temp8
;join ram:temp1 ram:temp2 ram:temp3 ram:temp4 ram:temp5 ram:temp6 ram:temp7 ram:temp8 as ram:output.bin
;
;ram:ilbm2raw -cf192,61,48,28 ram:output.ilbm ram:temp1
;ram:ilbm2raw -cf240,61,48,28 ram:output.ilbm ram:temp2
;ram:ilbm2raw -cf48,141,32,26 ram:output.ilbm ram:temp3
;ram:ilbm2raw -cf80,141,64,26 ram:output.ilbm ram:temp4
;ram:ilbm2raw -cf144,141,48,26 ram:output.ilbm ram:temp5
;ram:ilbm2raw -cf192,141,64,26 ram:output.ilbm ram:temp6
;ram:ilbm2raw -cf256,141,32,26 ram:output.ilbm ram:temp7
;ram:ilbm2raw -cf80,224,48,18 ram:output.ilbm ram:temp8
;join ram:output.bin ram:temp1 ram:temp2 ram:temp3 ram:temp4 ram:temp5 ram:temp6 ram:temp7 ram:temp8 as ram:temp_output
;delete ram:output.bin
;rename ram:temp_output as ram:output.bin
;
;ram:ilbm2raw -cf128,224,80,18 ram:output.ilbm ram:temp1
;ram:ilbm2raw -cf208,224,48,18 ram:output.ilbm ram:temp2
;ram:ilbm2raw -cf80,311,32,2 ram:output.ilbm ram:temp3
;ram:ilbm2raw -cf128,311,96,2 ram:output.ilbm ram:temp4
;ram:ilbm2raw -cf224,311,32,2 ram:output.ilbm ram:temp5
;ram:ilbm2raw -cf48,21,32,17 ram:output.ilbm ram:temp6
;ram:ilbm2raw -cf80,21,32,17 ram:output.ilbm ram:temp7
;ram:ilbm2raw -cf112,21,32,17 ram:output.ilbm ram:temp8
;join ram:output.bin ram:temp1 ram:temp2 ram:temp3 ram:temp4 ram:temp5 ram:temp6 ram:temp7 ram:temp8 as ram:temp_output
;delete ram:output.bin
;rename ram:temp_output as ram:output.bin
;
;ram:ilbm2raw -cf144,21,32,17 ram:output.ilbm ram:temp1
;ram:ilbm2raw -cf176,21,32,17 ram:output.ilbm ram:temp2
;ram:ilbm2raw -cf208,21,32,17 ram:output.ilbm ram:temp3
;ram:ilbm2raw -cf240,21,32,17 ram:output.ilbm ram:temp4
;ram:ilbm2raw -cf32,90,16,24 ram:output.ilbm ram:temp5
;ram:ilbm2raw -cf64,90,48,24 ram:output.ilbm ram:temp6
;ram:ilbm2raw -cf112,90,48,24 ram:output.ilbm ram:temp7
;ram:ilbm2raw -cf160,90,32,24 ram:output.ilbm ram:temp8
;join ram:output.bin ram:temp1 ram:temp2 ram:temp3 ram:temp4 ram:temp5 ram:temp6 ram:temp7 ram:temp8 as ram:temp_output
;delete ram:output.bin
;rename ram:temp_output as ram:output.bin
;
;ram:ilbm2raw -cf192,90,48,24 ram:output.ilbm ram:temp1
;ram:ilbm2raw -cf240,90,48,24 ram:output.ilbm ram:temp2
;ram:ilbm2raw -cf288,90,16,24 ram:output.ilbm ram:temp3
;ram:ilbm2raw -cf48,168,32,36 ram:output.ilbm ram:temp4
;ram:ilbm2raw -cf80,168,64,36 ram:output.ilbm ram:temp5
;ram:ilbm2raw -cf144,168,48,36 ram:output.ilbm ram:temp6
;ram:ilbm2raw -cf192,168,64,36 ram:output.ilbm ram:temp7
;ram:ilbm2raw -cf256,168,32,36 ram:output.ilbm ram:temp8
;join ram:output.bin ram:temp1 ram:temp2 ram:temp3 ram:temp4 ram:temp5 ram:temp6 ram:temp7 ram:temp8 as ram:temp_output
;delete ram:output.bin
;rename ram:temp_output as ram:output.bin
;
;ram:ilbm2raw -cf80,243,48,60 ram:output.ilbm ram:temp1
;ram:ilbm2raw -cf128,243,80,60 ram:output.ilbm ram:temp2
;ram:ilbm2raw -cf208,243,48,60 ram:output.ilbm ram:temp3
;ram:ilbm2raw -cf80,314,32,77 ram:output.ilbm ram:temp4
;ram:ilbm2raw -cf80,397,144,79 ram:output.ilbm ram:temp5
;ram:ilbm2raw -cf208,314,32,77 ram:output.ilbm ram:temp6
;ram:ilbm2raw -cf80,39,32,20 ram:output.ilbm ram:temp7
;ram:ilbm2raw -cf112,39,32,20 ram:output.ilbm ram:temp8
;join ram:output.bin ram:temp1 ram:temp2 ram:temp3 ram:temp4 ram:temp5 ram:temp6 ram:temp7 ram:temp8 as ram:temp_output
;delete ram:output.bin
;rename ram:temp_output as ram:output.bin
;
;ram:ilbm2raw -cf144,39,32,20 ram:output.ilbm ram:temp1
;ram:ilbm2raw -cf176,39,32,20 ram:output.ilbm ram:temp2
;ram:ilbm2raw -cf208,39,32,20 ram:output.ilbm ram:temp3
;ram:ilbm2raw -cf64,115,48,28 ram:output.ilbm ram:temp4
;ram:ilbm2raw -cf112,115,48,28 ram:output.ilbm ram:temp5
;ram:ilbm2raw -cf160,115,32,28 ram:output.ilbm ram:temp6
;ram:ilbm2raw -cf192,115,48,28 ram:output.ilbm ram:temp7
;ram:ilbm2raw -cf240,115,48,28 ram:output.ilbm ram:temp8
;join ram:output.bin ram:temp1 ram:temp2 ram:temp3 ram:temp4 ram:temp5 ram:temp6 ram:temp7 ram:temp8 as ram:temp_output
;delete ram:output.bin
;rename ram:temp_output as ram:output.bin
;
;ram:ilbm2raw -cf48,205,32,18 ram:output.ilbm ram:temp1
;ram:ilbm2raw -cf80,205,64,18 ram:output.ilbm ram:temp2
;ram:ilbm2raw -cf144,205,48,18 ram:output.ilbm ram:temp3
;ram:ilbm2raw -cf192,205,64,18 ram:output.ilbm ram:temp4
;ram:ilbm2raw -cf256,205,32,18 ram:output.ilbm ram:temp5
;ram:ilbm2raw -cf80,304,48,6 ram:output.ilbm ram:temp6
;ram:ilbm2raw -cf128,304,80,6 ram:output.ilbm ram:temp7
;ram:ilbm2raw -cf208,304,48,6 ram:output.ilbm ram:temp8
;join ram:output.bin ram:temp1 ram:temp2 ram:temp3 ram:temp4 ram:temp5 ram:temp6 ram:temp7 ram:temp8 as ram:temp_output
;delete ram:output.bin
;rename ram:temp_output as ram:output.bin
;
;script assemble
;devpac3-2.0:devpac/genam >ram:errors.txt ram:test.s
;
;script after
;
;work:c/strip ram:test 32
;copy ram:test 3dgame:graphics/misc/raw/water3.bin
;script end

	output	ram:test
	include "3dgame:sources/macros.i"
	opt	o+,ow-

*******************************************************************************

planes  equ     1
size	set	bob_struct_size+67*14
dump	equ	1

x_org	equ     0
y_org	equ     0

*******************************************************************************

UNFLIPD	equ	0
FLIPPED	equ	1
NORMFLP	equ     2
NONE	equ	3

DEFPOS	macro
	dc.w	width_\1				;width in pixels
	dc.w	hight_\1				;height in lines
	dc.w	(\2)					;x position
	dc.w	(\3)					;y position
	dc.w	\4					;control 0=unfliped
	dc.l	size_\1					; 1=flip, 2=norm&flip
	endm						; 3=none

DEFSZE	macro
size\@	set	size
width\@	set	\1
hight\@	set	\2
size	set	size+(((\1/8)*\2)*planes)
        endm

*******************************************************************************

	IFND	dump

bob_structure	dc.l    0	;address of image data
		dc.w	0       ;width in pixels
		dc.w	0       ;height in pixels
		dc.w	0	;plane for mask 0-5 (6=no mask)
		dc.b	0	;0=unflipped 1=flipped
		dc.b	1	;0=clipping disabled 1=clipping enabled
		dc.b	0	;0=no draw 1=copy 2=clear 3=set
		dc.b    0
		dc.b    0
		dc.b    0
		dc.b    3
		dc.b    0

	DEFSZE	32,20					;block 1
	DEFSZE	32,20					;block 2
	DEFSZE	32,20					;block 3
	DEFSZE	32,20					;block 4
	DEFSZE	32,20					;block 5
	DEFSZE	48,28					;block 6
	DEFSZE	48,28					;block 7
	DEFSZE	32,28					;block 8
	DEFSZE	48,28					;block 9
	DEFSZE	48,28					;block 10
	DEFSZE	32,26					;block 11
	DEFSZE	64,26					;block 12
	DEFSZE	48,26					;block 13
	DEFSZE	64,26					;block 14
	DEFSZE	32,26					;block 15
	DEFSZE	48,18					;block 16
	DEFSZE	80,18					;block 17
	DEFSZE	48,18					;block 18
	DEFSZE	32,2					;block 19
	DEFSZE	96,2					;block 20
	DEFSZE	32,2					;block 21
	DEFSZE	32,17					;block 22
	DEFSZE	32,17					;block 23
	DEFSZE	32,17					;block 24
	DEFSZE	32,17					;block 25
	DEFSZE	32,17					;block 26
	DEFSZE	32,17					;block 27
	DEFSZE	32,17					;block 28
	DEFSZE	16,24					;block 29
	DEFSZE	48,24					;block 30
	DEFSZE	48,24					;block 31
	DEFSZE	32,24					;block 32
	DEFSZE	48,24					;block 33
	DEFSZE	48,24					;block 34
	DEFSZE	16,24					;block 35
	DEFSZE	32,36					;block 36
	DEFSZE	64,36					;block 37
	DEFSZE	48,36					;block 38
	DEFSZE	64,36					;block 39
	DEFSZE	32,36					;block 40
	DEFSZE	48,60					;block 41
	DEFSZE	80,60					;block 42
	DEFSZE	48,60					;block 43
	DEFSZE	32,77					;block 44
	DEFSZE	144,79					;block 45
	DEFSZE	32,77					;block 46
	DEFSZE	32,20					;block 47
	DEFSZE	32,20					;block 48
	DEFSZE	32,20					;block 49
	DEFSZE	32,20					;block 50
	DEFSZE	32,20					;block 51
	DEFSZE	48,28					;block 52
	DEFSZE	48,28					;block 53
	DEFSZE	32,28					;block 54
	DEFSZE	48,28					;block 55
	DEFSZE	48,28					;block 56
	DEFSZE	32,18					;block 57
	DEFSZE	64,18					;block 58
	DEFSZE	48,18					;block 59
	DEFSZE	64,18					;block 60
	DEFSZE	32,18					;block 61
	DEFSZE	48,6					;block 62
	DEFSZE	80,6					;block 63
	DEFSZE	48,6					;block 64

	DEFPOS	1,16,9+5,UNFLIPD			;position 0
	DEFPOS	2,38,9+5,UNFLIPD			;position 1
	DEFPOS	3,60,9+5,UNFLIPD			;position 2
	DEFPOS	4,79,9+5,UNFLIPD			;position 3
	DEFPOS	5,95,9+5,UNFLIPD			;position 4
	DEFPOS	6,0,0+3,UNFLIPD				;position 5
	DEFPOS	7,23,0+3,UNFLIPD			;position 6
	DEFPOS	8,55,0+3,UNFLIPD			;position 7
	DEFPOS	9,82,0+3,UNFLIPD			;position 8
	DEFPOS	10,104,0+3,UNFLIPD			;position 9
	DEFPOS	11,0,0+0,UNFLIPD			;position 10
	DEFPOS	12,0,0+0,UNFLIPD			;position 11
	DEFPOS	13,47,0+0,UNFLIPD			;position 12
	DEFPOS	14,87,0+0,UNFLIPD			;position 13
	DEFPOS	15,119,0+0,UNFLIPD			;position 14
	DEFPOS	16,0,0+0,UNFLIPD			;position 15
	DEFPOS	17,31,0+0,UNFLIPD			;position 16
	DEFPOS	18,95,0+0,UNFLIPD			;position 17
	DEFPOS	19,0,0+0,UNFLIPD			;position 18
	DEFPOS	20,30,0+0,UNFLIPD			;position 19
	DEFPOS	21,111,0+0,UNFLIPD			;position 20
	DEFPOS	22,0,31+5,UNFLIPD			;position 21
	DEFPOS	23,16,31+5,UNFLIPD			;position 22
	DEFPOS	24,38,31+5,UNFLIPD			;position 23
	DEFPOS	25,60,31+5,UNFLIPD			;position 24
	DEFPOS	26,79,31+5,UNFLIPD			;position 25
	DEFPOS	27,95,31+5,UNFLIPD			;position 26
	DEFPOS	28,111,31+5,UNFLIPD			;position 27
	DEFPOS	29,0,28+8,UNFLIPD			;position 28
	DEFPOS	30,0,26+8,UNFLIPD			;position 29
	DEFPOS	31,23,26+8,UNFLIPD			;position 30
	DEFPOS	32,55,26+8,UNFLIPD			;position 31
	DEFPOS	33,82,26+8,UNFLIPD			;position 32
	DEFPOS	34,104,26+8,UNFLIPD			;position 33
	DEFPOS	35,126,28+8,UNFLIPD			;position 34
	DEFPOS	36,0,19+12,UNFLIPD			;position 35
	DEFPOS	37,0,18+12,UNFLIPD			;position 36
	DEFPOS	38,47,18+12,UNFLIPD			;position 37
	DEFPOS	39,87,18+12,UNFLIPD			;position 38
	DEFPOS	40,119,19+12,UNFLIPD			;position 39
	DEFPOS	41,0,2+20,UNFLIPD			;position 40
	DEFPOS	42,31,2+20,UNFLIPD			;position 41
	DEFPOS	43,95,2+20,UNFLIPD			;position 42
	DEFPOS	44,0,0+7,UNFLIPD			;position 43
	DEFPOS	45,0,0+5,UNFLIPD			;position 44
	DEFPOS	46,111,0+7,UNFLIPD			;position 45
	DEFPOS	47,16,51+4,UNFLIPD			;position 46
	DEFPOS	48,38,51+4,UNFLIPD			;position 47
	DEFPOS	49,60,51+4,UNFLIPD			;position 48
	DEFPOS	50,79,51+4,UNFLIPD			;position 49
	DEFPOS	51,95,51+4,UNFLIPD			;position 50
	DEFPOS	52,0,53+6,UNFLIPD			;position 51
	DEFPOS	53,23,53+6,UNFLIPD			;position 52
	DEFPOS	54,55,53+6,UNFLIPD			;position 53
	DEFPOS	55,82,53+6,UNFLIPD			;position 54
	DEFPOS	56,104,53+6,UNFLIPD			;position 55
	DEFPOS	57,0,58+8,UNFLIPD			;position 56
	DEFPOS	58,0,58+8,UNFLIPD			;position 57
	DEFPOS	59,47,58+8,UNFLIPD			;position 58
	DEFPOS	60,87,58+8,UNFLIPD			;position 59
	DEFPOS	61,119,58+8,UNFLIPD			;position 60
	DEFPOS	62,0,66+12,UNFLIPD			;position 61
	DEFPOS	63,31,66+12,UNFLIPD			;position 62
	DEFPOS	64,95,66+12,UNFLIPD			;position 63
	DEFPOS	1,0,0,NONE				;position 64
	DEFPOS	1,0,0,NONE				;position 65
	DEFPOS	1,0,0,NONE				;position 66

        ENDC

	IFD	dump
	incbin	"3dgame:graphics/misc/dump/water3.dump"
	ENDC

	incbin	"ram:output.bin"
	end
