;script before
;copy 3dgame:graphics/style3/ilbm/Tree.ilbm ram:output.ilbm
;
;work:c/ilbm2raw -mb4cf0,0,64,119 ram:output.ilbm ram:temp1
;work:c/ilbm2raw -mb4cf64,0,48,86 ram:output.ilbm ram:temp2
;work:c/ilbm2raw -mb4cf112,0,32,59 ram:output.ilbm ram:temp3
;work:c/ilbm2raw -mb4cf144,0,32,41 ram:output.ilbm ram:temp4
;join ram:temp1 ram:temp2 ram:temp3 ram:temp4 as ram:output.bin
;
;script assemble
;work:programming/languages/devpac/genam >ram:errors.txt ram:test.s
;
;script after
;work:c/strip ram:test 32
;copy ram:test 3dgame:graphics/style3/raw/Tree.bin
;script end

	output	ram:test
	opt     o+,ow-

	include	"3dgame:sources/macros.i"

*******************************************************************************

planes  equ     5
size	set	bob_struct_size+67*14
dump	equ     1

x_org	equ     93
y_org	equ     255

*******************************************************************************

UNFLIPD	equ	0
FLIPPED	equ	1
NRMFLP	equ     2
NONE	equ	3

DEFPOS	macro
	dc.w	width_\1				;width in pixels
	dc.w	hight_\1				;height in lines
	dc.w	(\2-x_org)				;x position
	dc.w	(y_org-\3)				;y position
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
		dc.w	4	;plane for mask 0-5 (6=no mask)
		dc.b	0	;0=unflipped 1=flipped
		dc.b	1	;0=clipping disabled 1=clipping enabled
		dc.b	1	;0=no draw 1=copy 2=clear 3=set
		dc.b    1
		dc.b    1
		dc.b    1
		dc.b    2
		dc.b    0

	DEFSZE	0,0					;block 1
	DEFSZE	64,119					;block 2
	DEFSZE	48,86					;block 3
	DEFSZE	32,59					;block 4
	DEFSZE	32,41					;block 5

	DEFPOS	005,111,244,UNFLIPD			;position 0
	DEFPOS	005,132,244,UNFLIPD			;position 1
	DEFPOS	005,153,244,UNFLIPD			;position 2
	DEFPOS	005,174,244,UNFLIPD			;position 3
	DEFPOS	005,195,244,UNFLIPD			;position 4
	DEFPOS	004,92,258,UNFLIPD			;position 5
	DEFPOS	004,121,258,UNFLIPD			;position 6
	DEFPOS	004,148,258,UNFLIPD			;position 7
	DEFPOS	004,177,258,UNFLIPD			;position 8
	DEFPOS	004,204,258,UNFLIPD			;position 9
	DEFPOS	003,57,280,UNFLIPD			;position 10
	DEFPOS	003,97,280,UNFLIPD			;position 11
	DEFPOS	003,140,280,UNFLIPD			;position 12
	DEFPOS	003,183,280,UNFLIPD			;position 13
	DEFPOS	003,224,280,UNFLIPD			;position 14
	DEFPOS	002,56,321,UNFLIPD			;position 15
	DEFPOS	002,124,321,UNFLIPD			;position 16
	DEFPOS	002,192,321,UNFLIPD			;position 17
	DEFPOS	002,0,0,NONE				;position 18
	DEFPOS	002,0,0,NONE				;position 19
	DEFPOS	002,0,0,NONE				;position 20
	DEFPOS	005,91,224,UNFLIPD			;position 21
	DEFPOS	005,111,224,UNFLIPD			;position 22
	DEFPOS	005,132,224,UNFLIPD			;position 23
	DEFPOS	005,153,224,UNFLIPD			;position 24
	DEFPOS	005,175,224,UNFLIPD			;position 25
	DEFPOS	005,195,224,UNFLIPD			;position 26
	DEFPOS	005,215,224,UNFLIPD			;position 27
	DEFPOS	004,64,229,UNFLIPD			;position 28
	DEFPOS	004,92,229,UNFLIPD			;position 29
	DEFPOS	004,121,229,UNFLIPD			;position 30
	DEFPOS	004,148,229,UNFLIPD			;position 31
	DEFPOS	004,177,229,UNFLIPD			;position 32
	DEFPOS	004,204,229,UNFLIPD			;position 33
	DEFPOS	004,231,229,UNFLIPD			;position 34
	DEFPOS	003,57,237,UNFLIPD			;position 35
	DEFPOS	003,97,237,UNFLIPD			;position 36
	DEFPOS	003,140,237,UNFLIPD			;position 37
	DEFPOS	003,183,237,UNFLIPD			;position 38
	DEFPOS	003,224,237,UNFLIPD			;position 39
	DEFPOS	002,56,253,UNFLIPD			;position 40
	DEFPOS	002,124,253,UNFLIPD			;position 41
	DEFPOS	002,192,253,UNFLIPD			;position 42
	DEFPOS	002,0,0,NONE				;position 43
	DEFPOS	002,0,0,NONE				;position 44
	DEFPOS	002,0,0,NONE				;position 45
	DEFPOS	005,111,204,UNFLIPD			;position 46
	DEFPOS	005,132,204,UNFLIPD			;position 47
	DEFPOS	005,153,204,UNFLIPD			;position 48
	DEFPOS	005,174,204,UNFLIPD			;position 49
	DEFPOS	005,195,204,UNFLIPD			;position 50
	DEFPOS	004,92,200,UNFLIPD			;position 51
	DEFPOS	004,121,200,UNFLIPD			;position 52
	DEFPOS	004,148,200,UNFLIPD			;position 53
	DEFPOS	004,176,200,UNFLIPD			;position 54
	DEFPOS	004,204,200,UNFLIPD			;position 55
	DEFPOS	003,57,194,UNFLIPD			;position 56
	DEFPOS	003,97,194,UNFLIPD			;position 57
	DEFPOS	003,140,194,UNFLIPD			;position 58
	DEFPOS	003,183,194,UNFLIPD			;position 59
	DEFPOS	003,224,194,UNFLIPD			;position 60
	DEFPOS	002,56,185,UNFLIPD			;position 61
	DEFPOS	002,124,185,UNFLIPD			;position 62
	DEFPOS	002,192,185,UNFLIPD			;position 63
	DEFPOS	002,0,0,NONE				;position 64
	DEFPOS	002,0,0,NONE				;position 65
	DEFPOS	002,0,0,NONE				;position 66

	ENDC

	IFD	dump
	incbin	"3dgame:graphics/style3/dump/Tree.dump"
        ENDC

	incbin	"ram:output.bin"
	end
