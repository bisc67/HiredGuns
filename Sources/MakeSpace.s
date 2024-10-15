;script assemble
;devpac3-2.0:devpac/genam >ram:errors.txt ram:test.s
;script after
;work:c/strip ram:test 32 4
;script end

	output	ram:test
	opt     o+,ow-

	ds.b    64

	end
