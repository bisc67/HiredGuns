;script assemble
;devpac3-2.0:devpac/genam >ram:errors.txt ram:test.s
;script after
;work:c/strip ram:test 32
;3dgame:scripts/compress
;copy ram:test.rnc 3dgame:diskdata/disk3/Game/Misc.sfx
;script end

start		output	ram:test
		opt 	o+,ow-					;genam options

		dc.l	sample1-start
		dc.l	sample2-start
		dc.l	sample3-start
		dc.l	sample4-start
		dc.l	sample5-start
		dc.l	sample6-start
		dc.l	sample7-start
		dc.l	sample8-start
		dc.l	sample9-start

*******************************************************************************

sample1		incbin	"3dgame:audio/blockslide.8svx"		;452
sample2		incbin	"3dgame:audio/blockthud.8svx"		;600
sample3		incbin	"3dgame:audio/teleport.8svx"		;683
sample4		incbin	"3dgame:audio/dooropened&closed.8svx"	;568
sample5		incbin	"3dgame:audio/dooropening.8svx"		;428
sample6		incbin	"3dgame:audio/hit.8svx"			;569
sample7		incbin	"3dgame:audio/button.8svx"		;182
sample8		incbin	"3dgame:audio/footstep.8svx"		;720
sample9		incbin	"3dgame:audio/bump.8svx"		;428

		end
