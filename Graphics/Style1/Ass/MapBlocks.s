;script before
;work:c/ilbm2raw -crgb4 3dgame:graphics/style1/ilbm/mapblocks.ilbm ram:output.bin
;script assemble
;devpac3-2.0:devpac/genam >ram:errors.txt ram:test.s
;script after
;work:c/strip ram:test 32
;copy ram:test 3dgame:graphics/style1/raw/MapBlocks.bin
;script end

	output	ram:test
	opt     o+,ow-

	include	"3dgame:sources/macros.i"

*******************************************************************************

bob_structure	dc.l    0	;address of image data
		dc.w	0	;width in pixels
		dc.w	0	;height in pixels
		dc.w	6	;plane for mask 0-5 (6=no mask)
		dc.b	0	;0=unflipped 1=flipped
		dc.b	1	;0=clipping disabled 1=clipping enabled
		dc.b	1	;0=no draw 1=copy 2=clear 3=set
		dc.b    1
		dc.b    1
		dc.b    1
		dc.b    2
		dc.b    0

	incbin	"ram:output.bin"

	end
