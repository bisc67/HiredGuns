;script before
;work:c/ilbm2raw -cb1f0,0,320,15 3dgame:graphics/misc/ilbm/logo.ilbm ram:output.bin
;script assemble
;devpac3-2.0:devpac/genam >ram:errors.txt ram:test.s
;script after
;work:c/strip ram:test 32 4
;copy ram:test 3dgame:graphics/misc/raw/Logo.bin
;script end

	output	ram:test
	include	"3dgame:sources/Macros.i"
	opt     o+,ow-

	incbin	"ram:output.bin"
	end
