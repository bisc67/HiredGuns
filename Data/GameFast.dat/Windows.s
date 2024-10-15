		include	"3dgame:sources/Macros.i"

		opt     o+,ow-

start		dc.l	window1-start
		dc.l	window2-start
		dc.l	window3-start
		dc.l	window4-start
		dc.l	window5-start
		dc.l	window6-start

window1		dc.l    18	;address of image data
		dc.w	160	;width in pixels
		dc.w	103	;height in pixels
		dc.w	6       ;plane for mask 0-5 (6=no mask)
		dc.b	0	;0=unflipped 1=flipped
		dc.b	0	;0=clipping disabled 1=clipping enabled
		dc.b	1       ;0=no draw 1=copy 2=clear 3=set
		dc.b    1
		dc.b    1
		dc.b    1
		dc.b    1
		dc.b    0

		incbin	"ram:window1.bin"

window2		dc.l    18	;address of image data
		dc.w	160	;width in pixels
		dc.w	103	;height in pixels
		dc.w	6       ;plane for mask 0-5 (6=no mask)
		dc.b	0	;0=unflipped 1=flipped
		dc.b	0	;0=clipping disabled 1=clipping enabled
		dc.b	1       ;0=no draw 1=copy 2=clear 3=set
		dc.b    1
		dc.b    1
		dc.b    1
		dc.b    1
		dc.b    0

		incbin	"ram:window2.bin"

window3		dc.l    18	;address of image data
		dc.w	160	;width in pixels
		dc.w	103	;height in pixels
		dc.w	6       ;plane for mask 0-5 (6=no mask)
		dc.b	0	;0=unflipped 1=flipped
		dc.b	0	;0=clipping disabled 1=clipping enabled
		dc.b	1       ;0=no draw 1=copy 2=clear 3=set
		dc.b    1
		dc.b    1
		dc.b    1
		dc.b    1
		dc.b    0

		incbin	"ram:window3.bin"

window4		dc.l    18	;address of image data
		dc.w	160	;width in pixels
		dc.w	103	;height in pixels
		dc.w	6       ;plane for mask 0-5 (6=no mask)
		dc.b	0	;0=unflipped 1=flipped
		dc.b	0	;0=clipping disabled 1=clipping enabled
		dc.b	1       ;0=no draw 1=copy 2=clear 3=set
		dc.b    1
		dc.b    1
		dc.b    1
		dc.b    1
		dc.b    0

		incbin	"ram:window4.bin"

window5		dc.l    18	;address of image data
		dc.w	160	;width in pixels
		dc.w	103	;height in pixels
		dc.w	6       ;plane for mask 0-5 (6=no mask)
		dc.b	0	;0=unflipped 1=flipped
		dc.b	0	;0=clipping disabled 1=clipping enabled
		dc.b	2	;0=no draw 1=copy 2=clear 3=set
		dc.b    2
		dc.b    2
		dc.b    2
		dc.b    2
		dc.b    0

window6		dc.l	18	;address of image data
		dc.w	80	;width in pixels
		dc.w	79	;height in pixels
		dc.w	6       ;plane for mask 0-5 (6=no mask)
		dc.b	0	;0=unflipped 1=flipped
		dc.b	0	;0=clipping disabled 1=clipping enabled
		dc.b	1	;0=no draw 1=copy 2=clear 3=set
		dc.b    1
		dc.b    1
		dc.b    1
		dc.b    1
		dc.b    0

		incbin	"ram:window5.bin"
