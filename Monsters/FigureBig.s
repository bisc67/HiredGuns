;script assemble
;devpac3-2.0:devpac/genam >ram:errors.txt ram:test.s
;script after
;work:c/strip ram:test 32 4
;copy ram:test 3dgame:monsters/makefigure/FigureBig.dump
;script end

	output	ram:test
	opt     o+,ow-

	include	"3dgame:sources/macros.i"

*******************************************************************************

planes  equ     5
size	set	bob_struct_size+67*14

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

	DEFSZE	64,128					;block 1
	DEFSZE	48,92					;block 2
	DEFSZE	32,64					;block 3
	DEFSZE	32,44					;block 4

	DEFPOS	004,111,244,UNFLIPD			;position 0
	DEFPOS	004,132,244,UNFLIPD			;position 1
	DEFPOS	004,153,244,UNFLIPD			;position 2
	DEFPOS	004,174,244,UNFLIPD			;position 3
	DEFPOS	004,195,244,UNFLIPD			;position 4
	DEFPOS	003,92,258,UNFLIPD			;position 5
	DEFPOS	003,121,258,UNFLIPD			;position 6
	DEFPOS	003,148,258,UNFLIPD			;position 7
	DEFPOS	003,177,258,UNFLIPD			;position 8
	DEFPOS	003,204,258,UNFLIPD			;position 9
	DEFPOS	002,57,280,UNFLIPD			;position 10
	DEFPOS	002,97,280,UNFLIPD			;position 11
	DEFPOS	002,140,280,UNFLIPD			;position 12
	DEFPOS	002,183,280,UNFLIPD			;position 13
	DEFPOS	002,224,280,UNFLIPD			;position 14
	DEFPOS	001,56,321,UNFLIPD			;position 15
	DEFPOS	001,124,321,UNFLIPD			;position 16
	DEFPOS	001,192,321,UNFLIPD			;position 17
	DEFPOS	001,0,0,NONE				;position 18
	DEFPOS	001,0,0,NONE				;position 19
	DEFPOS	001,0,0,NONE				;position 20
	DEFPOS	004,91,224,UNFLIPD			;position 21
	DEFPOS	004,111,224,UNFLIPD			;position 22
	DEFPOS	004,132,224,UNFLIPD			;position 23
	DEFPOS	004,153,224,UNFLIPD			;position 24
	DEFPOS	004,175,224,UNFLIPD			;position 25
	DEFPOS	004,195,224,UNFLIPD			;position 26
	DEFPOS	004,215,224,UNFLIPD			;position 27
	DEFPOS	003,64,229,UNFLIPD			;position 28
	DEFPOS	003,92,229,UNFLIPD			;position 29
	DEFPOS	003,121,229,UNFLIPD			;position 30
	DEFPOS	003,148,229,UNFLIPD			;position 31
	DEFPOS	003,177,229,UNFLIPD			;position 32
	DEFPOS	003,204,229,UNFLIPD			;position 33
	DEFPOS	003,231,229,UNFLIPD			;position 34
	DEFPOS	002,57,237,UNFLIPD			;position 35
	DEFPOS	002,97,237,UNFLIPD			;position 36
	DEFPOS	002,140,237,UNFLIPD			;position 37
	DEFPOS	002,183,237,UNFLIPD			;position 38
	DEFPOS	002,224,237,UNFLIPD			;position 39
	DEFPOS	001,56,253,UNFLIPD			;position 40
	DEFPOS	001,124,253,UNFLIPD			;position 41
	DEFPOS	001,192,253,UNFLIPD			;position 42
	DEFPOS	001,0,0,NONE				;position 43
	DEFPOS	001,0,0,NONE				;position 44
	DEFPOS	001,0,0,NONE				;position 45
	DEFPOS	004,111,204,UNFLIPD			;position 46
	DEFPOS	004,132,204,UNFLIPD			;position 47
	DEFPOS	004,153,204,UNFLIPD			;position 48
	DEFPOS	004,174,204,UNFLIPD			;position 49
	DEFPOS	004,195,204,UNFLIPD			;position 50
	DEFPOS	003,92,200,UNFLIPD			;position 51
	DEFPOS	003,121,200,UNFLIPD			;position 52
	DEFPOS	003,148,200,UNFLIPD			;position 53
	DEFPOS	003,176,200,UNFLIPD			;position 54
	DEFPOS	003,204,200,UNFLIPD			;position 55
	DEFPOS	002,57,194,UNFLIPD			;position 56
	DEFPOS	002,97,194,UNFLIPD			;position 57
	DEFPOS	002,140,194,UNFLIPD			;position 58
	DEFPOS	002,183,194,UNFLIPD			;position 59
	DEFPOS	002,224,194,UNFLIPD			;position 60
	DEFPOS	001,56,185,UNFLIPD			;position 61
	DEFPOS	001,124,185,UNFLIPD			;position 62
	DEFPOS	001,192,185,UNFLIPD			;position 63
	DEFPOS	001,0,0,NONE				;position 64
	DEFPOS	001,0,0,NONE				;position 65
	DEFPOS	001,0,0,NONE				;position 66

	end
