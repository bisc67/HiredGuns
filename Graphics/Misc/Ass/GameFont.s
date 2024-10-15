;script before
;work:c/ilbm2raw -cgb12M16N6r 3dgame:graphics/misc/ilbm/Gamefont.ilbm ram:output.bin
;script assemble
;devpac3-2.0:devpac/genam >ram:errors.txt ram:test.s
;script after
;work:c/strip >nil: ram:test 32 4
;copy ram:test 3dgame:graphics/misc/raw/GameFont.bin
;script end

	output	ram:test
	include	"3dgame:sources/macros.i"
	opt 	o+,ow-				;genam options

width	equ     16
height	equ     6
planes	equ     1

start
	dc.l    data-start	;address of image data
	dc.w	width		;image width in pixels
	dc.w	height		;image height in pixels
	dc.w	0		;plane for mask 0-6 (6=no mask)
	dc.w	planes		;number of bitplanes in image (not inc mask)
	dc.b	1		;0=fixed 1=proportional
	dc.b	0		;0=clipping disabled 1=clipping enabled
	dc.b	3		;0=no draw 1=copy 2=clear 3=set
	dc.b    2		; plane 2
	dc.b    2		; plane 3
	dc.b    2		; plane 4
	dc.b	2		; plane 5
	dc.b    0		; plane 6

	dc.b	05,02,04,06,04,04,07,02,03,03	; !"#$%&'()	widths
	dc.b	06,04,02,04,02,04,05,05,05,05	;*+,-./0123
	dc.b	05,05,05,05,05,05,02,02,04,05	;456789:;<=
	dc.b	04,05,07,05,05,05,05,05,05,05	;>?@ABCDEFG
	dc.b	05,02,05,05,05,06,05,05,05,06	;HIJKLMNOPQ
	dc.b	05,05,05,05,05,06,05,05,05,03	;RSTUVWXYZ[
	dc.b	04,03,04,03,02,04,04,04,04,04	;\]^_'abcde
	dc.b	04,04,04,02,04,04,04,06,04,04	;fghijklmno
	dc.b	04,04,04,04,04,04,04,06,04,04	;pqrstuvwxy
	dc.b	04,04,02,04,00,03,00,00,00,00	;z{|}~
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
	rept    ((width/8)*height)*planes
	dc.b	0				;space
        endr

	incbin	"ram:output.bin"

	rept    ((width/8)*height)*planes
	dc.b	0				;blank
        endr

	rept    ((width/8)*height)*planes
	dc.b	0				;blank
        endr

	ds.b    224

	end
