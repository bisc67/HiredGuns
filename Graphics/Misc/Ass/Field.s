;#script before
;#copy 3dgame:graphics/misc/ilbm/field.ilbm ram:output.ilbm
;#copy 3dgame:graphics/misc/ass/field.s ram:script
;#work:c/ilbm2raw -c -@ram:script -#start_here ram:output.ilbm ram:output.bin
;#script abort
;:start_here
;-cf80,0,32,25
;-cf112,0,32,25
;-cf144,0,32,25
;-cf176,0,32,25
;-cf208,0,32,25
;-cf64,44,48,31
;-cf112,44,48,31
;-cf160,44,32,31
;-cf192,44,48,31
;-cf240,44,48,31
;-cf48,123,32,26
;-cf80,123,64,26
;-cf144,123,48,26
;-cf192,123,64,26
;-cf256,123,32,26
;-cf80,208,48,18
;-cf128,208,80,18
;-cf208,208,48,18
;-cf80,268,32,2
;-cf128,268,96,2
;-cf224,268,32,2
;-cf48,26,32,11
;-cf80,26,32,11
;-cf112,26,32,11
;-cf144,26,32,11
;-cf176,26,32,11
;-cf208,26,32,11
;-cf240,26,32,11
;-cf32,78,16,14
;-cf64,76,48,16
;-cf112,76,48,16
;-cf160,76,32,16
;-cf192,76,48,16
;-cf240,76,48,16
;-cf288,78,16,14
;-cf48,151,32,23
;-cf80,150,64,24
;-cf144,150,48,24
;-cf192,150,64,24
;-cf256,151,32,23
;-cf80,227,48,40
;-cf128,227,80,40
;-cf208,227,48,40
;-cf80,308,32,42
;-cf208,308,32,42
;
;script assemble
;devpac3-2.0:devpac/genam >ram:errors.txt ram:test.s
;
;script after
;work:c/strip ram:test 32
;copy ram:test 3dgame:graphics/misc/raw/Field.bin
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
	dc.w	\3					;x position
	dc.w	\4					;y position
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
		dc.b	2	;0=no draw 1=copy 2=clear 3=set
    		dc.b    3
		dc.b    3
		dc.b    2
		dc.b    2
		dc.b    0

	DEF_BOB	32,25,16,9,0				;block 0
	DEF_BOB	32,25,38,9,0				;block 1
	DEF_BOB	32,25,60,9,0				;block 2
	DEF_BOB	32,25,79,9,0				;block 3
	DEF_BOB	32,25,95,9,0				;block 4
	DEF_BOB	48,31,0,0,0				;block 5
	DEF_BOB	48,31,23,0,0				;block 6
	DEF_BOB	32,31,55,0,0				;block 7
	DEF_BOB	48,31,82,0,0				;block 8
	DEF_BOB	48,31,104,0,0				;block 9
	DEF_BOB	32,26,0,0,0				;block 10
	DEF_BOB	64,26,0,0,0				;block 11
	DEF_BOB	48,26,47,0,0				;block 12
	DEF_BOB	64,26,87,0,0				;block 13
	DEF_BOB	32,26,119,0,0				;block 14
	DEF_BOB	48,18,0,0,0				;block 15
	DEF_BOB	80,18,31,0,0				;block 16
	DEF_BOB	48,18,95,0,0				;block 17
	DEF_BOB	32,2,0,0,0				;block 18
	DEF_BOB	96,2,30,0,0				;block 19
	DEF_BOB	32,2,111,0,0				;block 20
	DEF_BOB	32,11,0,31,10				;block 21
	DEF_BOB	32,11,16,31,10				;block 22
	DEF_BOB	32,11,38,31,10				;block 23
	DEF_BOB	32,11,60,31,10				;block 24
	DEF_BOB	32,11,80,31,10				;block 25
	DEF_BOB	32,11,96,31,10				;block 26
	DEF_BOB	32,11,111,31,10				;block 27
	DEF_BOB	16,14,0,28,15				;block 28
	DEF_BOB	48,16,0,26,15				;block 29
	DEF_BOB	48,16,23,26,15				;block 30
	DEF_BOB	32,16,55,26,15				;block 31
	DEF_BOB	48,16,83,26,15				;block 32
	DEF_BOB	48,16,105,26,15				;block 33
	DEF_BOB	16,14,126,28,15				;block 34
	DEF_BOB	32,23,0,19,23				;block 35
	DEF_BOB	64,24,-1,18,23				;block 36
	DEF_BOB	48,24,47,18,23				;block 37
	DEF_BOB	64,24,87,18,23				;block 38
	DEF_BOB	32,23,119,19,23				;block 39
	DEF_BOB	48,40,-1,2,39				;block 40
	DEF_BOB	80,40,31,2,39				;block 41
	DEF_BOB	48,40,95,2,39				;block 42
	DEF_BOB	32,42,0,0,41				;block 43
	DEF_BOB	0,0,0,0,3				;block 44
	DEF_BOB	32,42,111,1,41				;block 45

size	set	bob_struct_size+67*14

	DEF_BOB	32,25,16,50,1				;block 46
	DEF_BOB	32,25,38,50,1				;block 47
	DEF_BOB	32,25,60,50,1				;block 48
	DEF_BOB	32,25,79,50,1				;block 49
	DEF_BOB	32,25,95,50,1				;block 50
	DEF_BOB	48,31,0,53,1				;block 51
	DEF_BOB	48,31,23,53,1				;block 52
	DEF_BOB	32,31,55,53,1				;block 53
	DEF_BOB	48,31,82,53,1				;block 54
	DEF_BOB	48,31,104,53,1				;block 55
	DEF_BOB	32,26,0,58,1				;block 56
	DEF_BOB	64,26,0,58,1				;block 57
	DEF_BOB	48,26,47,58,1				;block 58
	DEF_BOB	64,26,87,58,1				;block 59
	DEF_BOB	32,26,119,58,1				;block 60
	DEF_BOB	48,18,0,66,1				;block 61
	DEF_BOB	80,18,31,66,1				;block 62
	DEF_BOB	48,18,95,66,1				;block 63
	DEF_BOB	32,2,0,82,1				;block 64
	DEF_BOB	96,2,30,82,1				;block 65
	DEF_BOB	32,2,111,82,1				;block 66

        ENDC

	IFD	dump
	incbin	"3dgame:graphics/misc/dump/field.dump"
	ENDC

	incbin	"ram:output.bin"
	end


