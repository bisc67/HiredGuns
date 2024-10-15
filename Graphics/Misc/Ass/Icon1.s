;script before
;work:c/ilbm2raw -cmf0,338,16,16 3dgame:graphics/misc/ilbm/windows.ilbm ram:output.bin
;script assemble
;devpac3-2.0:devpac/genam >ram:errors.txt ram:test.s
;script after
;work:c/strip ram:test 32
;copy ram:test 3dgame:graphics/misc/raw/Icon1.bin
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
size	set	size+(((\1/8)*\2)*5)
	endm

bob_structure	dc.l    0	;address of image data
		dc.w	0       ;width in pixels
		dc.w	0       ;height in pixels
		dc.w	5       ;plane for mask 0-5 (6=no mask)
		dc.b	0	;0=unflipped 1=flipped
		dc.b	0	;0=clipping disabled 1=clipping enabled
		dc.b	1	;0=no draw 1=copy 2=clear 3=set
		dc.b    1
		dc.b    1
		dc.b    1
		dc.b    1
		dc.b    0

	DEF_BOB	16,16,127,81,0

	incbin	"ram:output.bin"
	end
