;script before
;work:c/ilbm2raw -mb4cf208,329,48,16 3dgame:graphics/misc/ilbm/misc.ilbm ram:output.bin
;script assemble
;devpac3-2.0:devpac/genam >ram:errors.txt ram:test.s
;script after
;work:c/strip ram:test 32 4
;copy ram:test 3dgame:graphics/misc/raw/Locked2.bin
;script end

	output	ram:test
	include	"3dgame:sources/Macros.i"
	opt     o+,ow-

size	set	bob_struct_size+1*14

DEF_BOB	macro
	dc.w	\1					;width in pixels
	dc.w	\2					;height in lines
	dc.w	\3					;x position
	dc.w	\4					;y position
	dc.w	\5					;control
	dc.l	size
size	set	size+(((\1/8)*\2)*4)
	endm

bob_structure	dc.l    0	;address of image data
		dc.w	0       ;width in pixels
		dc.w	0       ;height in pixels
		dc.w	4	;plane for mask 0-5 (6=no mask)
		dc.b	0	;0=unflipped 1=flipped
		dc.b	0	;0=clipping disabled 1=clipping enabled
		dc.b	1	;0=no draw 1=copy 2=clear 3=set
		dc.b    1
		dc.b    1
		dc.b    1
		dc.b    2
		dc.b    0

	DEF_BOB	48,16,49,49,0

	incbin	"ram:output.bin"
	end




