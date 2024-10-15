		opt 	o+,ow-				;genam options

width		equ     16
height		equ     8
planes		equ     3

start		dc.l    data-start	;address of image data
		dc.w	width		;image width in pixels
		dc.w	height		;image height in pixels
		dc.w	2		;plane for mask 0-6 (6=no mask)
		dc.w	planes		;number of bitplanes in image (not inc mask)
		dc.b	1		;0=fixed 1=proportional
		dc.b	0		;0=clipping disabled 1=clipping enabled
		dc.b	1		;0=no draw 1=copy 2=clear 3=set
		dc.b    1		; plane 2
		dc.b    2		; plane 3
		dc.b    2		; plane 4
		dc.b	2		; plane 5
		dc.b    0		; plane 6

		dc.b	10,05,09,12,09,12,15,05,06,06	; !"#$%&'()	widths
		dc.b	12,09,05,09,05,10,13,06,12,12	;*+,-./0123
		dc.b	12,12,13,11,12,12,05,05,07,09	;456789:;<=
		dc.b	07,12,16,15,12,12,12,12,12,12	;>?@ABCDEFG
		dc.b	12,05,11,11,10,15,12,12,12,14	;HIJKLMNOPQ
		dc.b	12,12,13,12,13,15,12,11,11,10	;RSTUVWXYZ[
		dc.b	10,08,07,10,05,11,11,11,11,11	;\]^_'abcde
		dc.b	08,11,11,06,06,10,06,15,11,11	;fghijklmno
		dc.b	11,12,08,11,07,11,11,15,12,11	;pqrstuvwxy
		dc.b	11,08,04,08,00,00,00,11,11,11	;z{|}~  uea
		dc.b	11,11,11,11,11,10,10,10,15,12	;aaceeiiiAE
		dc.b	12,11,11,11,11,12,12,11,10,11	;OoouuOUaio
		dc.b	11,11,12,11,12,05,12,00,00,00	;unNa?!B

data
	REPT	((width/8)*height)*planes
		dc.b	0				;space
	ENDR

		incbin	"ram:worldfont.bin"

		end
