	output	ram:test
	include	"3dgame:sources/Macros.i"
	opt     o+,ow-

	dc.l	18	;address of image data
	dc.w	640	;width in pixels
	dc.w	42	;height in pixels
	dc.w	6	;plane for mask 0-5 (6=no mask)
	dc.b	0	;0=unflipped 1=flipped
	dc.b	1	;0=clipping disabled 1=clipping enabled
	dc.b	1	;0=no draw 1=copy 2=clear 3=set
	dc.b    1
	dc.b    1
	dc.b    3
	dc.b	0
	dc.b	0

	incbin	"ram:fill.bin"
	end
