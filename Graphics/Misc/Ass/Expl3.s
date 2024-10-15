	output	3dgame:graphics/misc/raw/expl2.bin
	opt     o+,ow-

	include	"3dgame:sources/macros.i"

*******************************************************************************

planes  equ     4
size	set	bob_struct_size+67*14

x_org	equ     93
y_org	equ     255

*******************************************************************************

UNFLIPD	equ	0
FLIPPED	equ	1
NRMFLP	equ     2
NONE	equ	3
RAND	equ     -1

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
		dc.b    2
		dc.b    2
		dc.b    1
		dc.b    2
		dc.b    1

	DEFSZE	0,0					;block 1
	DEFSZE	80,80					;block 2
	DEFSZE	48,48					;block 3
	DEFSZE	32,32					;block 4
	DEFSZE	32,22					;block 5
	DEFSZE	144,84					;block 6

	DEFPOS	005,111,244,RAND			;position 0
	DEFPOS	005,132,244,RAND			;position 1
	DEFPOS	005,153,244,RAND			;position 2
	DEFPOS	005,174,244,RAND			;position 3
	DEFPOS	005,195,244,RAND			;position 4
	DEFPOS	004,92,258,RAND			;position 5
	DEFPOS	004,121,258,RAND			;position 6
	DEFPOS	004,148,258,RAND			;position 7
	DEFPOS	004,177,258,RAND			;position 8
	DEFPOS	004,204,258,RAND			;position 9
	DEFPOS	003,57,280,RAND			;position 10
	DEFPOS	003,97,280,RAND			;position 11
	DEFPOS	003,140,280,RAND			;position 12
	DEFPOS	003,183,280,RAND			;position 13
	DEFPOS	003,224,280,RAND			;position 14
	DEFPOS	002,56,321,RAND			;position 15
	DEFPOS	002,124,321,RAND			;position 16
	DEFPOS	002,192,321,RAND			;position 17
	DEFPOS	001,0,0,NONE				;position 18
	DEFPOS	001,0,0,NONE				;position 19
	DEFPOS	001,0,0,NONE				;position 20
	DEFPOS	005,91,224,RAND			;position 21
	DEFPOS	005,111,224,RAND			;position 22
	DEFPOS	005,132,224,RAND			;position 23
	DEFPOS	005,153,224,RAND			;position 24
	DEFPOS	005,175,224,RAND			;position 25
	DEFPOS	005,195,224,RAND			;position 26
	DEFPOS	005,215,224,RAND			;position 27
	DEFPOS	004,64,229,RAND			;position 28
	DEFPOS	004,92,229,RAND			;position 29
	DEFPOS	004,121,229,RAND			;position 30
	DEFPOS	004,148,229,RAND			;position 31
	DEFPOS	004,177,229,RAND			;position 32
	DEFPOS	004,204,229,RAND			;position 33
	DEFPOS	004,231,229,RAND			;position 34
	DEFPOS	003,57,237,RAND			;position 35
	DEFPOS	003,97,237,RAND			;position 36
	DEFPOS	003,140,237,RAND			;position 37
	DEFPOS	003,183,237,RAND			;position 38
	DEFPOS	003,224,237,RAND			;position 39
	DEFPOS	002,56,253,RAND			;position 40
	DEFPOS	002,124,253,RAND			;position 41
	DEFPOS	002,192,253,RAND			;position 42
	DEFPOS	001,0,0,NONE				;position 43
	DEFPOS	006,93,255,RAND			;position 44
	DEFPOS	001,0,0,NONE				;position 45
	DEFPOS	005,111,204,RAND			;position 46
	DEFPOS	005,132,204,RAND			;position 47
	DEFPOS	005,153,204,RAND			;position 48
	DEFPOS	005,174,204,RAND			;position 49
	DEFPOS	005,195,204,RAND			;position 50
	DEFPOS	004,92,200,RAND			;position 51
	DEFPOS	004,121,200,RAND			;position 52
	DEFPOS	004,148,200,RAND			;position 53
	DEFPOS	004,176,200,RAND			;position 54
	DEFPOS	004,204,200,RAND			;position 55
	DEFPOS	003,57,194,RAND			;position 56
	DEFPOS	003,97,194,RAND			;position 57
	DEFPOS	003,140,194,RAND			;position 58
	DEFPOS	003,183,194,RAND			;position 59
	DEFPOS	003,224,194,RAND			;position 60
	DEFPOS	002,56,185,RAND			;position 61
	DEFPOS	002,124,185,RAND			;position 62
	DEFPOS	002,192,185,RAND			;position 63
	DEFPOS	001,0,0,NONE				;position 64
	DEFPOS	001,0,0,NONE				;position 65
	DEFPOS	001,0,0,NONE				;position 66

	incbin	"ram:output.bin"
	end
