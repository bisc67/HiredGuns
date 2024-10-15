;script before
;copy 3dgame:graphics/style1/ilbm/stairs.ilbm ram:output.ilbm
;copy work:c/ilbm2raw ram:
;
;ram:ilbm2raw -b4cmf0,0,80,43 ram:output.ilbm ram:output.bin
;
;script assemble
;work:programming/languages/devpac/genam >ram:errors.txt ram:test.s
;
;script after
;work:c/strip ram:test 32
;copy ram:test 3dgame:graphics/style1/raw/Stairs1right.bin
;script end

	output	ram:test
	include "3dgame:sources/macros.i"
	opt     o+,ow-

size	set	bob_struct_size+67*14
;dump	equ     0

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
	DEF_BOB	0,0,0,0,3				;block 1
	DEF_BOB	0,0,0,0,3				;block 2
	DEF_BOB	0,0,0,0,3				;block 3
	DEF_BOB	0,0,0,0,3				;block 4
	DEF_BOB	0,0,0,0,3				;block 5
	DEF_BOB	0,0,0,0,3				;block 6
	DEF_BOB	0,0,0,0,3				;block 7
	DEF_BOB	0,0,0,0,3				;block 8
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
	DEF_BOB	0,0,0,0,3				;block 23
	DEF_BOB	0,0,0,0,3				;block 24
	DEF_BOB	0,0,0,0,3				;block 25
	DEF_BOB	0,0,0,0,3				;block 26
	DEF_BOB	0,0,0,0,3				;block 27
	DEF_BOB	0,0,0,0,3				;block 28
	DEF_BOB	0,0,0,0,3				;block 29
	DEF_BOB	0,0,0,0,3				;block 30
	DEF_BOB	0,0,0,0,3				;block 31
	DEF_BOB	0,0,0,0,3				;block 32
	DEF_BOB	0,0,0,0,3				;block 33
	DEF_BOB	0,0,0,0,3				;block 34
	DEF_BOB	0,0,0,0,3				;block 35
	DEF_BOB	0,0,0,0,3				;block 36
	DEF_BOB	0,0,0,0,3				;block 37
	DEF_BOB	0,0,0,0,3				;block 38
	DEF_BOB	0,0,0,0,3				;block 39
	DEF_BOB	0,0,0,0,3				;block 40
	DEF_BOB	0,0,0,0,3				;block 41
	DEF_BOB	0,0,0,0,3				;block 42
	DEF_BOB	0,0,0,0,3				;block 43
	DEF_BOB	80,43,71,41,0				;block 44
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
	incbin	"3dgame:graphics/style1/dump/stairs1right.dump"
        ENDC

	incbin	"ram:output.bin"
	end
