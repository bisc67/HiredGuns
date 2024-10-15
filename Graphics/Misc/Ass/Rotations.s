;script before
;work:c/ilbm2raw -cmb4f0,306,16,16 3dgame:graphics/misc/ilbm/windows.ilbm ram:rotation1.bin
;work:c/ilbm2raw -cmb4f16,306,16,16 3dgame:graphics/misc/ilbm/windows.ilbm ram:rotation2.bin
;work:c/ilbm2raw -cmb4f32,306,16,16 3dgame:graphics/misc/ilbm/windows.ilbm ram:rotation3.bin
;work:c/ilbm2raw -cmb4f48,306,16,16 3dgame:graphics/misc/ilbm/windows.ilbm ram:rotation4.bin
;script assemble
;devpac3-2.0:devpac/genam >ram:errors.txt ram:test.s
;script after
;work:c/strip ram:test 32 4
;copy ram:test 3dgame:graphics/misc/raw/Rotations.bin
;script end

	output	ram:test
	include	"3dgame:sources/Macros.i"
	opt     o+,ow-

size	set	bob_struct_size+4*14

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
		dc.w	4       ;plane for mask 0-5 (6=no mask)
		dc.b	0	;0=unflipped 1=flipped
		dc.b	1	;0=clipping disabled 1=clipping enabled
		dc.b	1	;0=no draw 1=copy 2=clear 3=set
		dc.b    1
		dc.b    1
		dc.b    1
		dc.b    0
		dc.b    0

	DEF_BOB	16,16,65+12,39+16,0
	DEF_BOB	16,16,65+12,39+16,0
	DEF_BOB	16,16,65+12,39+16,0
	DEF_BOB	16,16,65+12,39+16,0

	incbin	"ram:rotation1.bin"
	incbin	"ram:rotation2.bin"
	incbin	"ram:rotation3.bin"
	incbin	"ram:rotation4.bin"

	end
