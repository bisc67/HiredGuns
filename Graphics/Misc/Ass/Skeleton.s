;script before
;copy 3dgame:graphics/misc/ilbm/Skeleton.ilbm ram:output.ilbm
;copy work:c/ilbm2raw ram:
;
;ram:ilbm2raw -mb4cf0,0,48,25 ram:output.ilbm ram:temp1
;ram:ilbm2raw -mb4cf0,25,48,16 ram:output.ilbm ram:temp2
;ram:ilbm2raw -mb4cf0,41,32,11 ram:output.ilbm ram:temp3
;ram:ilbm2raw -mb4cf0,52,16,8 ram:output.ilbm ram:temp4
;join ram:temp1 ram:temp2 ram:temp3 ram:temp4 as ram:output.bin
;
;script assemble
;devpac3-2.0:devpac/genam >ram:errors.txt ram:test.s
;script after
;work:c/strip ram:test 32 4
;copy ram:test 3dgame:graphics/misc/raw/Skeleton.bin
;script end

	output	ram:test
	opt	o+,ow-

	include	"3dgame:sources/macros.i"

	incbin	"3dgame:graphics/misc/dump/dead.dump"
	incbin	"ram:output.bin"

	end
