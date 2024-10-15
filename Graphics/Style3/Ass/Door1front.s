;#script before
;#copy 3dgame:graphics/style3/ilbm/doors.ilbm ram:output.ilbm
;#copy 3dgame:graphics/style3/ass/door1front.s ram:script
;#work:c/ilbm2raw -b4cm -@ram:script -#start_here ram:output.ilbm ram:output.bin
;#script abort
;:start_here
;-f0,0,64,26
;-f0,26,48,15
;-f0,42,32,11
;-f0,54,32,7
;
;script assemble
;work:programming/languages/devpac/genam >ram:errors.txt ram:test.s
;script after
;work:c/strip ram:test 32
;copy ram:test 3dgame:graphics/style3/raw/Door1front.bin
;script end

	output	ram:test
	opt	o+,ow-

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
		dc.b    1
		dc.b    0

	DEFSZE	64,26					;block 1
	DEFSZE	48,15					;block 2
	DEFSZE	32,11					;block 3
	DEFSZE	32,7					;block 4

	DEFPOS	004,111,244,NRMFLP			;position 0
	DEFPOS	004,132,244,NRMFLP			;position 1
	DEFPOS	004,153,244,NRMFLP			;position 2
	DEFPOS	004,174,244,NRMFLP			;position 3
	DEFPOS	004,195,244,NRMFLP			;position 4
	DEFPOS	003,92,258,NRMFLP				;position 5
	DEFPOS	003,121,258,NRMFLP			;position 6
	DEFPOS	003,148,258,NRMFLP			;position 7
	DEFPOS	003,177,258,NRMFLP			;position 8
	DEFPOS	003,204,258,NRMFLP			;position 9
	DEFPOS	002,57,280,NRMFLP				;position 10
	DEFPOS	002,97,280,NRMFLP				;position 11
	DEFPOS	002,140,280,NRMFLP			;position 12
	DEFPOS	002,183,280,NRMFLP			;position 13
	DEFPOS	002,224,280,NRMFLP			;position 14
	DEFPOS	001,56,321,NRMFLP				;position 15
	DEFPOS	001,124,321,NRMFLP			;position 16
	DEFPOS	001,192,321,NRMFLP			;position 17
	DEFPOS	001,0,0,NONE				;position 18
	DEFPOS	001,0,0,NONE				;position 19
	DEFPOS	001,0,0,NONE				;position 20
	DEFPOS	004,91,224,NRMFLP				;position 21
	DEFPOS	004,111,224,NRMFLP			;position 22
	DEFPOS	004,132,224,NRMFLP			;position 23
	DEFPOS	004,153,224,NRMFLP			;position 24
	DEFPOS	004,175,224,NRMFLP			;position 25
	DEFPOS	004,195,224,NRMFLP			;position 26
	DEFPOS	004,215,224,NRMFLP			;position 27
	DEFPOS	003,64,229,NRMFLP				;position 28
	DEFPOS	003,92,229,NRMFLP				;position 29
	DEFPOS	003,121,229,NRMFLP			;position 30
	DEFPOS	003,148,229,NRMFLP			;position 31
	DEFPOS	003,177,229,NRMFLP			;position 32
	DEFPOS	003,204,229,NRMFLP			;position 33
	DEFPOS	003,231,229,NRMFLP			;position 34
	DEFPOS	002,57,237,NRMFLP				;position 35
	DEFPOS	002,97,237,NRMFLP				;position 36
	DEFPOS	002,140,237,NRMFLP			;position 37
	DEFPOS	002,183,237,NRMFLP			;position 38
	DEFPOS	002,224,237,NRMFLP			;position 39
	DEFPOS	001,56,253,NRMFLP				;position 40
	DEFPOS	001,124,253,NRMFLP			;position 41
	DEFPOS	001,192,253,NRMFLP			;position 42
	DEFPOS	001,0,0,NONE				;position 43
	DEFPOS	001,0,0,NONE				;position 44
	DEFPOS	001,0,0,NONE				;position 45
	DEFPOS	004,111,204,NRMFLP			;position 46
	DEFPOS	004,132,204,NRMFLP			;position 47
	DEFPOS	004,153,204,NRMFLP			;position 48
	DEFPOS	004,174,204,NRMFLP			;position 49
	DEFPOS	004,195,204,NRMFLP			;position 50
	DEFPOS	003,92,200,NRMFLP				;position 51
	DEFPOS	003,121,200,NRMFLP			;position 52
	DEFPOS	003,148,200,NRMFLP			;position 53
	DEFPOS	003,176,200,NRMFLP			;position 54
	DEFPOS	003,204,200,NRMFLP			;position 55
	DEFPOS	002,57,194,NRMFLP				;position 56
	DEFPOS	002,97,194,NRMFLP				;position 57
	DEFPOS	002,140,194,NRMFLP			;position 58
	DEFPOS	002,183,194,NRMFLP			;position 59
	DEFPOS	002,224,194,NRMFLP			;position 60
	DEFPOS	001,56,185,NRMFLP				;position 61
	DEFPOS	001,124,185,NRMFLP			;position 62
	DEFPOS	001,192,185,NRMFLP			;position 63
	DEFPOS	001,0,0,NONE				;position 64
	DEFPOS	001,0,0,NONE				;position 65
	DEFPOS	001,0,0,NONE				;position 66

	ENDC

	IFD	dump
	incbin	"3dgame:graphics/style3/dump/Door1front.dump"
        ENDC

	incbin	"ram:output.bin"
	end
