;script before
;work:c/ilbm2raw -f0,0,336,36cgb12M16N6rZ 3dgame:graphics/misc/ilbm/GamefontForeign.ilbm ram:output.bin
;script assemble
;devpac3-2.0:devpac/genam >ram:errors.txt ram:test.s
;script after
;work:c/strip >nil: ram:test 32 4
;copy ram:test 3dgame:diskdata/disk2/game/Foreign.font
;copy ram:test work:games/hiredguns/game/Foreign.font
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

	dc.b	05,02,04,06,04,04,07,02,03,03	; !"#$%&'()	32	widths
	dc.b	06,04,02,04,02,04,05,05,05,05	;*+,-./0123     42
	dc.b	05,05,05,05,05,05,02,02,04,05	;456789:;<=     52
	dc.b	04,05,07,05,05,05,05,05,05,05	;>?@ABCDEFG     62
	dc.b	05,02,05,05,05,06,05,05,05,06	;HIJKLMNOPQ     72
	dc.b	05,05,05,05,05,06,05,05,05,03	;RSTUVWXYZ[     82
	dc.b	04,03,04,03,02,04,04,04,04,04	;\]^_'abcde     92
	dc.b	04,04,04,02,04,04,03,06,04,04	;fghijklmno     102
	dc.b	04,04,04,04,04,04,04,06,04,04	;pqrstuvwxy     112
	dc.b	04,04,02,04,00,03,00,04,04,04	;z{|}~  uea     122
	dc.b	04,04,04,04,04,04,04,04,05,05	;aaceeiiiAE     132
	dc.b	05,04,04,04,04,05,05,04,03,04	;OoouuOUaio     142
	dc.b	04,04,05,04,05,02,05,00,00,00	;unna?!B        152
data
	rept    ((width/8)*height)*planes
	dc.b	0				;space
        endr

	incbin	"ram:output.bin"

	end
