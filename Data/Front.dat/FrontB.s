		opt 	o+,ow-			;genam options

width		equ	64
height		equ     66
planes		equ     4

start		dc.l    data-start	;address of image d/ata
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

; !"#$%&'()*+,-./0123456789:;<=>?
; ABCDEFGHIJKLMNOPQRSTUVWXYZ1234š

		dc.b	30,47,38,40,45,39,36,45,47,20	; !"#$%&'()	widths
		dc.b	25,47,40,57,47,44,36,44,43,30	;*+,-./0123
		dc.b	38,47,46,61,46,45,39,11,41,40	;456789:;<=
		dc.b	41,47,54,47,38,40,45,39,36,45	;>?@ABCDEFG
		dc.b	47,20,25,47,40,57,47,44,36,44	;HIJKLMNOPQ
		dc.b	43,30,38,47,46,61,46,45,39,44	;RSTUVWXYZ1
		dc.b	43,44,38,33,07,28,32,26,31,27	;234_'abcde
		dc.b	25,30,32,15,20,34,16,50,32,30	;fghijklmno
		dc.b	32,31,23,21,18,32,31,46,32,31	;pqrstuvwxy
		dc.b	28,21,04,21,22,00,00,00,00,00	;z{|}~
		dc.b	00,00,00,00,00,00,00,00,00,00	;
		dc.b	00,00,00,00,00,00,00,00,00,00	;
		dc.b	00,00,00,00,00,00,00,00,00,00	;
		dc.b	00,00,00,00,00,00,00,00,00,00	;

		dc.b	00,00,00,00,00,00,00,00,00,00	; !"#$%&'()     back kerning
		dc.b	00,00,00,00,00,00,00,00,00,00	;*+,-./0123
		dc.b	00,00,00,00,00,00,00,00,00,00	;456789:;<=
		dc.b	00,00,00,00,00,00,00,00,00,00	;>?@ABCDEFG
		dc.b	00,00,00,00,00,00,00,00,00,00	;HIJKLMNOPQ
		dc.b	00,00,00,00,00,00,00,00,00,00	;RSTUVWXYZ[
		dc.b	00,00,00,00,00,00,00,00,00,00	;\]^_'abcde
		dc.b	00,00,00,00,00,00,00,00,00,00	;fghijklmno
		dc.b	00,00,00,00,00,00,00,00,00,00	;pqrstuvwxy
		dc.b	00,00,00,00,00,00,00,00,00,00	;z{|}~
		dc.b	00,00,00,00,00,00,00,00,00,00	;
		dc.b	00,00,00,00,00,00,00,00,00,00	;
		dc.b	00,00,00,00,00,00,00,00,00,00	;
		dc.b	00,00,00,00,00,00,00,00,00,00	;

data
	REPT	((width/8)*height)*planes
		dc.b	0				;space
	ENDR

		incbin	"ram:frontb.bin"
	end
