;script before
;work:c/ilbm2raw -cSb234f144,175,16,154 3dgame:graphics/misc/ilbm/misc.ilbm ram:output.bin
;script assemble
;devpac3-2.0:devpac/genam >ram:errors.txt ram:test.s
;script after
;work:c/strip ram:test 32 4
;copy ram:test 3dgame:graphics/misc/raw/Digits.bin
;script end

	output	ram:test
	opt     o+,ow-

	dc.w	0,0

	dc.w	0,0
	dc.w	0,0
	dc.w	0,0
	dc.w	0,0
	dc.w	0,0
	dc.w	0,0
	dc.w	0,0
	dc.w	0,0
	dc.w	0,0
	dc.w	0,0
	dc.w	0,0
	dc.w	0,0
	dc.w	0,0
	dc.w	0,0

	dc.w	0,0

	incbin	"ram:output.bin"

	end
