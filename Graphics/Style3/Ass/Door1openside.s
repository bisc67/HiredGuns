;#script before
;#copy 3dgame:graphics/style3/ilbm/doors.ilbm ram:output.ilbm
;#copy 3dgame:graphics/style3/ass/door1openside.s ram:script
;#work:c/ilbm2raw -b4cm -@ram:script -#start_here ram:output.ilbm ram:output.bin
;#script abort
;:start_here
;-f64,78,16,4
;-f80,78,16,4
;-f64,62,16,5
;-f80,62,16,5
;-f0,89,32,13
;
;script assemble
;work:programming/languages/devpac/genam >ram:errors.txt ram:test.s
;script after
;work:c/strip ram:test 32
;copy ram:test 3dgame:graphics/style3/raw/Door1openside.bin
;script end

	output	ram:test
	opt	o+,ow-

	include	"3dgame:sources/macros.i"

*******************************************************************************

planes  equ     5
size	set	bob_struct_size+67*14
;dump	equ     1

*******************************************************************************

UNFLIPD	equ	0
FLIPPED	equ	1
NRMFLP	equ     2
NONE	equ	3
MIRROR	equ	4	;distance to mirror

DEFPOS	macro
	dc.w	width_\1				;width in pixels
	dc.w	hight_\1				;height in lines
	dc.w	\2					;x position
	dc.w	\3					;y position
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

	DEFSZE	16,4					;block 1
	DEFSZE	16,4					;block 2
	DEFSZE	16,5					;block 3
	DEFSZE	16,5					;block 4
	DEFSZE	32,13					;block 5

	DEFPOS	001,0,0,NONE				;position 0
	DEFPOS	001,0,0,NONE				;position 1
	DEFPOS	001,0,0,NONE				;position 2
	DEFPOS	001,0,0,NONE				;position 3
	DEFPOS	001,0,0,NONE				;position 4
	DEFPOS	001,0,0,NONE				;position 5
	DEFPOS	001,0,0,NONE				;position 6
	DEFPOS	001,0,0,NONE				;position 7
	DEFPOS	001,0,0,NONE				;position 8
	DEFPOS	001,0,0,NONE				;position 9
	DEFPOS	001,0,0,NONE				;position 10
	DEFPOS	001,0,0,NONE				;position 11
	DEFPOS	001,0,0,NONE				;position 12
	DEFPOS	001,0,0,NONE				;position 13
	DEFPOS	001,0,0,NONE				;position 14
	DEFPOS	001,0,0,NONE				;position 15
	DEFPOS	001,0,0,NONE				;position 16
	DEFPOS	001,0,0,NONE				;position 17
	DEFPOS	001,0,0,NONE				;position 18
	DEFPOS	001,0,0,NONE				;position 19
	DEFPOS	001,0,0,NONE				;position 20
	DEFPOS	001,0,0,NONE				;position 21
	DEFPOS	001,0,0,NONE				;position 22
	DEFPOS	001,0,0,NONE				;position 23
	DEFPOS	001,0,0,NONE				;position 24
	DEFPOS	001,0,0,NONE				;position 25
	DEFPOS	001,0,0,NONE				;position 26
	DEFPOS	001,0,0,NONE				;position 27
	DEFPOS	001,0,0,NONE				;position 28
	DEFPOS	001,$17,$1e,$14				;position 29
	DEFPOS	001,0,0,NONE				;position 30
	DEFPOS	001,0,0,NONE				;position 31
	DEFPOS	001,0,0,NONE				;position 32
	DEFPOS	002,$74,$1e,$14				;position 33
	DEFPOS	001,0,0,NONE				;position 34
	DEFPOS	003,$0,$18,$1f				;position 35
	DEFPOS	001,0,0,NONE				;position 36
	DEFPOS	001,0,0,NONE				;position 37
	DEFPOS	001,0,0,NONE				;position 38
	DEFPOS	004,$87,$18,$1f				;position 39
	DEFPOS	001,0,0,NONE				;position 40
	DEFPOS	001,0,0,NONE				;position 41
	DEFPOS	001,0,0,NONE				;position 42
	DEFPOS	001,0,0,NONE				;position 43
	DEFPOS	005,60,0,71				;position 44
	DEFPOS	001,0,0,NONE				;position 45
	DEFPOS	001,0,0,NONE				;position 46
	DEFPOS	001,0,0,NONE				;position 47
	DEFPOS	001,0,0,NONE				;position 48
	DEFPOS	001,0,0,NONE				;position 49
	DEFPOS	001,0,0,NONE				;position 50
	DEFPOS	001,0,0,NONE				;position 51
	DEFPOS	001,0,0,NONE				;position 52
	DEFPOS	001,0,0,NONE				;position 53
	DEFPOS	001,0,0,NONE				;position 54
	DEFPOS	001,0,0,NONE				;position 55
	DEFPOS	001,0,0,NONE				;position 56
	DEFPOS	001,0,0,NONE				;position 57
	DEFPOS	001,0,0,NONE				;position 58
	DEFPOS	001,0,0,NONE				;position 59
	DEFPOS	001,0,0,NONE				;position 60
	DEFPOS	001,0,0,NONE				;position 61
	DEFPOS	001,0,0,NONE				;position 62
	DEFPOS	001,0,0,NONE				;position 63
	DEFPOS	001,0,0,NONE				;position 64
	DEFPOS	001,0,0,NONE				;position 65
	DEFPOS	001,0,0,NONE				;position 66

	ENDC

	IFD	dump
	incbin	"3dgame:graphics/style3/dump/Door1openside.dump"
        ENDC

	incbin	"ram:output.bin"
	end
