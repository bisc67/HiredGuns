;#script before
;#copy 3dgame:graphics/style4/ilbm/stairs.ilbm ram:output.ilbm
;#copy 3dgame:graphics/style4/ass/stairs1out.s ram:script
;#work:c/ilbm2raw -b4cm -@ram:script -#start_here ram:output.ilbm ram:output.bin
;#script abort
;:start_here
;-b4cmf0,172,16,5
;-b4cmf32,172,16,5
;-b4cmf48,172,16,5
;-b4cmf96,161,32,10
;-b4cmf0,161,32,10
;-b4cmf48,161,32,10
;-b4cmf0,145,48,15
;-b4cmf48,145,48,15
;-b4cmf96,145,48,15
;-b4cmf0,134,64,11
;-b4cmf0,111,16,8
;-b4cmf16,111,32,8
;-b4cmf48,111,32,8
;-b4cmf80,111,32,8
;-b4cmf112,111,16,8
;-b4cmf0,97,32,13
;-b4cmf32,97,32,13
;-b4cmf64,97,32,13
;-b4cmf96,97,32,13
;-b4cmf128,97,32,13
;-b4cmf0,77,48,19
;-b4cmf48,77,48,19
;-b4cmf96,77,48,19
;-b4cmf0,45,32,31
;-b4cmf32,45,64,31
;-b4cmf96,45,32,31
;-b4cmf80,0,128,44
;
;script assemble
;devpac3-2.0:devpac/genam >ram:errors.txt ram:test.s
;
;script after
;work:c/strip ram:test 32
;copy ram:test 3dgame:graphics/style4/raw/Stairs1out.bin
;script end

	output	ram:test
	include "3dgame:sources/macros.i"
	opt	o+,ow-

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
	DEF_BOB	16,5,$3,$1d,0				;block 1
	DEF_BOB	16,5,$40,$1d,0				;block 2
	DEF_BOB	16,5,$5,$1d,0				;block 3
	DEF_BOB	0,0,0,0,3				;block 4
	DEF_BOB	0,0,0,0,3				;block 5
	DEF_BOB	32,10,33,20,0				;block 6
	DEF_BOB	32,10,$39,$13,0				;block 7
	DEF_BOB	32,10,81,20,0				;block 8
	DEF_BOB	0,0,0,0,3				;block 9
	DEF_BOB	0,0,0,0,3				;block 10
	DEF_BOB	48,15,$b,$8,0				;block 11
	DEF_BOB	48,15,$34,$8,0				;block 12
	DEF_BOB	48,15,$62,$c,0				;block 13
	DEF_BOB	0,0,0,0,3				;block 14
	DEF_BOB	0,0,0,0,3				;block 15
	DEF_BOB	64,11,$29,$0,0				;block 16
	DEF_BOB	0,0,0,0,3				;block 17
	DEF_BOB	0,0,0,0,3				;block 18
	DEF_BOB	0,0,0,0,3				;block 19
	DEF_BOB	0,0,0,0,3				;block 20
	DEF_BOB	0,0,0,0,3				;block 21
	DEF_BOB	16,8,$16,$2c,0				;block 22
	DEF_BOB	32,8,$2c,$2b,0				;block 23
	DEF_BOB	32,8,$3e,$2a,0				;block 24
	DEF_BOB	32,8,$4f,$2b,0				;block 25
	DEF_BOB	16,8,$67,$2a,0				;block 26
	DEF_BOB	0,0,0,0,3				;block 27
	DEF_BOB	0,0,0,0,3				;block 28
	DEF_BOB	32,13,$0,$2a,0				;block 29
	DEF_BOB	32,13,$1b,$2a,0				;block 30
	DEF_BOB	32,13,$39,$2a,0				;block 31
	DEF_BOB	32,13,$57,$2a,0				;block 32
	DEF_BOB	32,13,$77,$2a,0				;block 33
	DEF_BOB	0,0,0,0,3				;block 34
	DEF_BOB	0,0,0,0,3				;block 35
	DEF_BOB	48,19,$8,$2a,0				;block 36
	DEF_BOB	48,19,$32,$2a,0				;block 37
	DEF_BOB	48,19,$5f,$2b,0				;block 38
	DEF_BOB	0,0,0,0,3				;block 39
	DEF_BOB	32,31,0,42,0				;block 40
	DEF_BOB	64,31,$27,$2a,0				;block 41
	DEF_BOB	32,31,$6f,$2a,0				;block 42
	DEF_BOB	0,0,0,0,3				;block 43
	DEF_BOB	128,44,$b,$2a,0				;block 44
	DEF_BOB	0,0,0,0,3				;block 45
	DEF_BOB	0,0,0,0,3				;block 46
	DEF_BOB	0,0,0,0,3				;block 47
	DEF_BOB	0,0,0,0,3				;block 48
	DEF_BOB	0,0,0,0,3				;block 49
	DEF_BOB	0,0,0,0,3				;block 50
	DEF_BOB	0,0,0,0,3				;block 51
	DEF_BOB	0,0,0,0,3				;block 52
	DEF_BOB	0,0,0,0,3				;block 53
	DEF_BOB	0,0,0,0,3				;block 54
	DEF_BOB	0,0,0,0,3				;block 55
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
	incbin	"3dgame:graphics/style4/dump/stairs1out.dump"
        ENDC

	incbin	"ram:output.bin"
	end
