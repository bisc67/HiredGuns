		opt 	o+,ow-			;genam options

width		equ     48
height		equ     44
planes		equ     4

start		dc.l    data-start	;address of image data
		dc.w	width		;image width in pixels
		dc.w	height		;image height in pixels
		dc.w	3		;plane for mask 0-6 (6=no mask)
		dc.w	planes		;number of bitplanes in image (not inc mask)
		dc.b	1		;0=fixed 1=proportional
		dc.b	0		;0=clipping disabled 1=clipping enabled
		dc.b	1		;0=no draw 1=copy 2=clear 3=set
		dc.b    1		; plane 2
		dc.b    1		; plane 3
		dc.b    2		; plane 4
		dc.b    0		; plane 5
		dc.b    0		; plane 6

		dc.b	15,06,12,23,24,29,26,05,13,13	; !"#$%&'()	widths
		dc.b	15,24,08,13,07,15,22,11,19,18	;*+,-./0123
		dc.b	22,18,20,19,21,21,07,47,13,48	;456789:;<=
		dc.b	10,12,33,28,20,27,28,16,17,29	;>?@ABCDEFG
		dc.b	26,05,11,23,17,36,25,34,20,34	;HIJKLMNOPQ
		dc.b	23,19,23,25,28,41,24,25,25,10	;RSTUVWXYZ[
		dc.b	15,33,33,33,33,19,21,19,21,21	;\]^_`abcde
		dc.b	13,21,18,06,10,19,05,31,18,22	;fghijklmno
		dc.b	21,21,12,14,12,19,21,32,20,21	;pqrstuvwxy
		dc.b	20,47,03,19,21,19,19,19,19,21	;z{|ueaaace
		dc.b	21,21,21,16,28,16,34,22,22,19	;eiiiAEOoou
		dc.b	19,34,25,19,16,22,19,18,25,19	;uOUaiounNa
		dc.b	12,06,20,00,00,00,00,00,00,00	;?!ß
		dc.b	00,00,00,00,00,00,00,00,00,00	;

data
	REPT	((width/8)*height)*planes
		dc.b	0				;space
	ENDR

		incbin	"ram:fronts.bin"

		end





































