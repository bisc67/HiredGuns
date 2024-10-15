;script before
;copy 3dgame:graphics/misc/ilbm/Foam.ilbm ram:output.ilbm
;copy work:c/ilbm2raw ram:
;
;ram:ilbm2raw -cf0,43,144,12 ram:output.ilbm ram:output.bin
;
;script assemble
;devpac3-2.0:devpac/genam >ram:errors.txt ram:test.s
;
;script after
;work:c/strip ram:test 32 4
;copy ram:test 3dgame:graphics/misc/raw/Foam.bin
;script end

	output	ram:test
	include "3dgame:sources/macros.i"
	opt     o+,ow-

*******************************************************************************

planes  equ     1
size	set	bob_struct_size+4*14

x_org	equ     0
y_org	equ     0

*******************************************************************************

UNFLIPD	equ	0
FLIPPED	equ	1
NORMFLP	equ     2
NONE	equ	3

DEFPOS	macro
	dc.w	width_\1				;width in pixels
	dc.w	hight_\1				;height in lines
	dc.w	(\2)					;x position
	dc.w	(\3)					;y position
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
		dc.w	0	;plane for mask 0-5 (6=no mask)
		dc.b	0	;0=unflipped 1=flipped
		dc.b	1	;0=clipping disabled 1=clipping enabled
		dc.b	3	;0=no draw 1=copy 2=clear 3=set
		dc.b    2
		dc.b    2
		dc.b    2
		dc.b    0
		dc.b    0

	DEFSZE	0,0					;block 1
	DEFSZE	144,12					;block 2

	DEFPOS	002,0,77,UNFLIPD			;position 1
	DEFPOS	002,0,38,UNFLIPD			;position 2
	DEFPOS	002,0,0,UNFLIPD				;position 3
	DEFPOS	001,0,0,NONE				;position 4

	incbin	"ram:output.bin"
	end
