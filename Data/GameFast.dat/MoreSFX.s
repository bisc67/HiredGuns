start		opt 	o+,ow-					;genam options

		dc.l	sample1-start
		dc.l	sample2-start
		dc.l	sample3-start
		dc.l	sample4-start
		dc.l	sample5-start
		dc.l	sample6-start
		dc.l	sample7-start
		dc.l	sample8-start
		dc.l	sample9-start
		dc.l	sample10-start

*******************************************************************************

sample1		incbin	"3dgame:audio/effects/newgun1.8svx"		;256
sample2		incbin	"3dgame:audio/effects/newgun2.8svx"		;256
sample3		incbin	"3dgame:audio/effects/gunempty.8svx"		;360
sample4		incbin	"3dgame:audio/effects/gunreload.8svx"		;380
sample5		incbin	"3dgame:audio/effects/egghatch.8svx"		;360
sample6
sample7		incbin	"3dgame:audio/effects/explosion.8svx"		;539
sample8		incbin	"3dgame:audio/effects/lasercrack.8svx"		;179
sample9		incbin	"3dgame:audio/effects/arc.8svx"			;334
sample10	incbin	"3dgame:audio/effects/cast.8svx"		;1020,509,255,128

		end
