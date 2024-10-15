;#script before
;#copy 3dgame:graphics/style4/ilbm/stairs.ilbm ram:output.ilbm
;#copy 3dgame:graphics/style4/ass/stairs2out.s ram:script
;#work:c/ilbm2raw -b4cm -@ram:script -#start_here ram:output.ilbm ram:output.bin
;#script abort
;:start_here
;-b4cmf160,179,16,8
;-b4cmf208,179,16,8
;-b4cmf208,213,16,8
;-b4cmf160,173,32,5
;-b4cmf208,164,32,5
;-b4cmf208,207,32,5
;-b4cmf160,155,16,8
;-b4cmf176,155,32,8
;-b4cmf208,155,16,8
;-b4cmf160,141,32,13
;-b4cmf208,141,32,13
;-b4cmf240,141,32,13
;-b4cmf160,121,32,19
;-b4cmf208,121,48,19
;-b4cmf256,121,32,19
;-b4cmf208,90,80,31
;-b4cmf288,250,32,16
;-b4cmf288,216,32,16
;-b4cmf288,233,32,16
;-b4cmf240,240,32,25
;-b4cmf240,266,32,25
;-b4cmf160,238,32,25
;-b4cmf256,164,48,26
;-b4cmf160,207,64,26
;-b4cmf256,190,48,26
;-b4cmf160,319,32,18
;-b4cmf160,188,80,18
;-b4cmf192,319,32,18
;-b4cmf160,316,96,2
;
;script assemble
;devpac3-2.0:devpac/genam >ram:errors.txt ram:test.s
;
;script after
;work:c/strip ram:test 32
;copy ram:test 3dgame:graphics/style4/raw/Stairs2out.bin
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

	DEF_BOB	0,0,0,0,3				;block 0
	DEF_BOB	16,8,42,11,0				;block 1
	DEF_BOB	16,8,62,11,0				;block 2
	DEF_BOB	16,8,83,11,0				;block 3
	DEF_BOB	0,0,0,0,3				;block 4
	DEF_BOB	0,0,0,0,3				;block 5
	DEF_BOB	32,5,25,3,0				;block 6
	DEF_BOB	32,5,56,4,0				;block 7
	DEF_BOB	32,5,110,8,0				;block 8
	DEF_BOB	0,0,0,0,3				;block 9
	DEF_BOB	0,0,0,0,3				;block 10
	DEF_BOB	0,0,0,0,3				;block 11
	DEF_BOB	0,0,0,0,3				;block 12
	DEF_BOB	0,0,0,0,3				;block 13
	DEF_BOB	0,0,0,0,3				;block 14
	DEF_BOB	0,0,0,0,3				;block 15
	DEF_BOB	0,0,0,0,3				;block 16
	DEF_BOB	0,0,0,0,3				;block 17
	DEF_BOB	0,0,0,0,3				;block 18
	DEF_BOB	0,0,0,0,3				;block 19
	DEF_BOB	0,0,0,0,3				;block 20
	DEF_BOB	0,0,0,0,3				;block 21
	DEF_BOB	0,0,0,0,3				;block 22
	DEF_BOB	16,8,39,34,0				;block 23
	DEF_BOB	32,8,61,34,0				;block 24
	DEF_BOB	16,8,87,34,0				;block 25
	DEF_BOB	0,0,0,0,3				;block 26
	DEF_BOB	0,0,0,0,3				;block 27
	DEF_BOB	0,0,0,0,3				;block 28
	DEF_BOB	0,0,0,0,3				;block 29
	DEF_BOB	32,13,23,29,0				;block 30
	DEF_BOB	32,13,55,29,0				;block 31
	DEF_BOB	32,13,95,30,0				;block 32
	DEF_BOB	0,0,0,0,3				;block 33
	DEF_BOB	0,0,0,0,3				;block 34
	DEF_BOB	0,0,0,0,3				;block 35
	DEF_BOB	32,19,0,23,0				;block 36
	DEF_BOB	48,19,47,23,0				;block 37
	DEF_BOB	32,19,111,23,0				;block 38
	DEF_BOB	0,0,0,0,3				;block 39
	DEF_BOB	0,0,0,0,3				;block 40
	DEF_BOB	80,31,31,11,0				;block 41
	DEF_BOB	0,0,0,0,3				;block 42
	DEF_BOB	0,0,0,0,3				;block 43
	DEF_BOB	0,0,0,0,3				;block 44
	DEF_BOB	0,0,0,0,3				;block 45
	DEF_BOB	0,0,0,0,3				;block 46
	DEF_BOB	32,16,38,50,0				;block 47
	DEF_BOB	32,16,60,50,0				;block 48
	DEF_BOB	32,16,81,50,0				;block 49
	DEF_BOB	0,0,0,0,3				;block 50
	DEF_BOB	0,0,0,0,3				;block 51
	DEF_BOB	32,25,23,54,0				;block 52
	DEF_BOB	32,25,55,54,0				;block 53
	DEF_BOB	32,25,87,54,0				;block 54
	DEF_BOB	0,0,0,0,3				;block 55
	DEF_BOB	0,0,0,0,3				;block 56
	DEF_BOB	48,26,5,58,0				;block 57
	DEF_BOB	64,26,47,58,0				;block 58
	DEF_BOB	48,26,88,58,0				;block 59
	DEF_BOB	0,0,0,0,3				;block 60
	DEF_BOB	32,18,0,66,0				;block 61
	DEF_BOB	80,18,37,66,0				;block 62
	DEF_BOB	32,18,111,66,0				;block 63
	DEF_BOB	0,0,0,0,3				;block 64
	DEF_BOB	96,2,20,82,0				;block 65
	DEF_BOB	0,0,0,0,3				;block 66

	ENDC

	IFD	dump
	incbin	"3dgame:graphics/style4/dump/Stairs2out.dump"
        ENDC

	incbin	"ram:output.bin"
	end
