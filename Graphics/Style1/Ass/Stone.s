;#script before
;#copy 3dgame:graphics/style1/ilbm/stone.ilbm ram:output.ilbm
;#copy 3dgame:graphics/style1/ass/stone.s ram:script
;#work:c/ilbm2raw -b4cm -@ram:script -#start_here ram:output.ilbm ram:output.bin
;#script abort
;:start_here
;-b4cmf80,0,32,25
;-b4cmf112,0,32,25
;-b4cmf144,0,32,25
;-b4cmf176,0,32,25
;-b4cmf208,0,32,25
;-b4cmf64,44,48,31
;-b4cmf112,44,48,31
;-b4cmf160,44,32,31
;-b4cmf192,44,48,31
;-b4cmf240,44,48,31
;-b4cmf48,123,32,26
;-b4cmf80,123,64,26
;-b4cmf144,123,48,26
;-b4cmf192,123,64,26
;-b4cmf256,123,32,26
;-b4cmf80,208,48,18
;-b4cmf128,208,80,18
;-b4cmf208,208,48,18
;-b4cmf80,268,32,2
;-b4cmf128,268,96,2
;-b4cmf224,268,32,2
;-b4cmf48,26,32,11
;-b4cmf80,26,32,11
;-b4cmf112,26,32,11
;-b4cmf144,26,32,11
;-b4cmf176,26,32,11
;-b4cmf208,26,32,11
;-b4cmf240,26,32,11
;-b4cmf32,78,16,14
;-b4cmf64,76,48,16
;-b4cmf112,76,48,16
;-b4cmf160,76,32,16
;-b4cmf192,76,48,16
;-b4cmf240,76,48,16
;-b4cmf288,78,16,14
;-b4cmf48,151,32,23
;-b4cmf80,150,64,24
;-b4cmf144,150,48,24
;-b4cmf192,150,64,24
;-b4cmf256,151,32,23
;-b4cmf80,227,48,40
;-b4cmf128,227,80,40
;-b4cmf208,227,48,40
;-b4cmf80,308,32,42
;-b4cmf208,308,32,42
;
;script assemble
;devpac3-2.0:devpac/genam >ram:errors.txt ram:test.s
;
;script after
;work:c/strip ram:test 32
;copy ram:test 3dgame:graphics/style1/raw/Stone.bin
;script end

	output	ram:test
	include "3dgame:sources/macros.i"
	opt     o+,ow-

size	set	bob_struct_size+67*14
dump	equ     0

DEF_BOB	macro
	dc.w	\1					;width in pixels
	dc.w	\2					;height in lines
	dc.w	\3						;x position
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
	DEF_BOB	32,11,0,31,2				;block 21
	DEF_BOB	32,11,16,31,2				;block 22
	DEF_BOB	32,11,38,31,2				;block 23
	DEF_BOB	32,11,60,31,2				;block 24
	DEF_BOB	32,11,79,31,2				;block 25
	DEF_BOB	32,11,95,31,2				;block 26
	DEF_BOB	32,11,111,31,2				;block 27
	DEF_BOB	16,14,0,28,2				;block 28
	DEF_BOB	48,16,0,26,2				;block 29
	DEF_BOB	48,16,23,26,2				;block 30
	DEF_BOB	32,16,55,26,2				;block 31
	DEF_BOB	48,16,82,26,2				;block 32
	DEF_BOB	48,16,104,26,2				;block 33
	DEF_BOB	16,14,126,28,2				;block 34
	DEF_BOB	32,23,0,19,2				;block 35
	DEF_BOB	64,24,0,18,2				;block 36
	DEF_BOB	48,24,47,18,2				;block 37
	DEF_BOB	64,24,87,18,2				;block 38
	DEF_BOB	32,23,119,19,2				;block 39
	DEF_BOB	48,40,0,2,2				;block 40
	DEF_BOB	80,40,31,2,2				;block 41
	DEF_BOB	48,40,95,2,2				;block 42
	DEF_BOB	32,42,0,0,2				;block 43
	DEF_BOB	0,0,0,0,3				;block 44
	DEF_BOB	32,42,111,0,2				;block 45

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
	incbin	"3dgame:graphics/style1/dump/Block.dump"
        ENDC

	incbin	"ram:output.bin"
	end


