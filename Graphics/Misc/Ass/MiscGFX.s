;script assemble
;devpac3-2.0:devpac/genam >ram:errors.txt ram:test.s
;script after
;work:c/strip ram:test 32 4
;;copy ram:test 3dgame:graphics/download/Misc.gfx
;source:propack/compress p d ram:test
;copy ram:test.rnc 3dgame:diskdata/disk1/game/Misc.gfx
;copy ram:test.rnc 3dgame:diskdata/disk2/game/Misc.gfx
;copy ram:test.rnc 3dgame:diskdata/diskdemo/game/Misc.gfx
;copy ram:test.rnc 3dgame:diskdata/diskedit2/game/Misc.gfx
;copy ram:test.rnc 3dgame:test/hiredguns/game/Misc.gfx
;copy ram:test.rnc 3dgame:test/hiredgunsdemo/game/Misc.gfx
;copy ram:test.rnc 3dgame:test/hiredgunseditor/game/Misc.gfx
;script end

;DOWNLOAD	equ	0

start		output	ram:test
		opt 	o+,ow-					;genam options

		dc.l	pl1in-start
		dc.l	pl1left-start
		dc.l	pl1right-start
		dc.l	pl1out-start
		dc.l	pl2in-start
		dc.l	pl2left-start
		dc.l	pl2right-start
		dc.l	pl2out-start
		dc.l	pl3in-start
		dc.l	pl3left-start
		dc.l	pl3right-start
		dc.l	pl3out-start
		dc.l	pl4in-start
		dc.l	pl4left-start
		dc.l	pl4right-start
		dc.l	pl4out-start

		dc.l	water1-start
		dc.l	water2-start
		dc.l	water3-start
		dc.l	water4-start

		dc.l	explosion1-start
		dc.l	explosion2-start
		dc.l	explosion3-start
		dc.l	explosion4-start

		dc.l	foam-start

		dc.l	compass_n-start
		dc.l	compass_e-start
		dc.l	compass_s-start
		dc.l	compass_w-start
		dc.l	vertline-start
		dc.l	horizline-start

		dc.l	gamefont-start

		dc.l	leader-start
		dc.l	leader_off-start

		dc.l	warning-start
		dc.l	locked-start
		dc.l	locked2-start
		dc.l	tooheavy-start
		dc.l	noroom-start
		dc.l	claws-start
		dc.l	bigclaws-start
		dc.l	rip-start
		dc.l	planet-start
		dc.l	icon1-start
		dc.l	icon2-start
		dc.l	icon3-start
		dc.l	icon4-start
		dc.l	icon5-start
		dc.l	noammo-start

		dc.l	rotations-start

		dc.l	face1-start
		dc.l	face2-start
		dc.l	face3-start
		dc.l	face4-start

		dc.l	logo-start
		dc.l	used-start
		dc.l	blocked-start
		dc.l	blocked2-start
		dc.l	invalid-start
		dc.l	skeleton-start
		dc.l	exit-start
		dc.l	digits-start
		dc.l	fill-start

		dc.l	drowning-start
		dc.l	poisoned-start

*******************************************************************************

		IFD	DOWNLOAD
pl1in		incbin	"3dgame:graphics/download/figuregfx/cheule.upk"
pl1left		equ	pl1in+3556
pl1right	equ	pl1left+3556
pl1out		equ	pl1right+3556
pl2in           incbin	"3dgame:graphics/download/figuregfx/cim.upk"
pl2left         equ	pl2in+3556
pl2right        equ	pl2left+3556
pl2out          equ	pl2right+3556
pl3in           incbin	"3dgame:graphics/download/figuregfx/rorian.upk"
pl3left         equ	pl3in+3556
pl3right        equ	pl3left+3556
pl3out          equ	pl3right+3556
pl4in           incbin	"3dgame:graphics/download/figuregfx/jenillee.upk"
pl4left         equ	pl4in+3556
pl4right        equ	pl4left+3556
pl4out          equ	pl4right+3556
		ENDC

		IFND	DOWNLOAD
pl1in		ds.b	3556
pl1left		ds.b	3556
pl1right	ds.b	3556
pl1out		ds.b	3556
pl2in		ds.b    3556
pl2left		ds.b	3556
pl2right	ds.b	3556
pl2out		ds.b	3556
pl3in		ds.b    3556
pl3left		ds.b	3556
pl3right	ds.b	3556
pl3out		ds.b	3556
pl4in		ds.b    3556
pl4left		ds.b	3556
pl4right	ds.b	3556
pl4out		ds.b	3556
		ENDC

vertline	incbin	"3Dgame:graphics/misc/raw/vertline.bin"
horizline	incbin	"3Dgame:graphics/misc/raw/horizline.bin"
tooheavy	incbin	"3Dgame:graphics/misc/raw/tooheavy.bin"
noroom		incbin	"3Dgame:graphics/misc/raw/noroom.bin"

water1		incbin	"3Dgame:graphics/misc/raw/water1.bin"
water2		incbin	"3Dgame:graphics/misc/raw/water2.bin"
water3		incbin	"3Dgame:graphics/misc/raw/water3.bin"
water4		incbin	"3Dgame:graphics/misc/raw/water4.bin"

explosion1	incbin	"3Dgame:graphics/misc/raw/explosion1.bin"
explosion2	incbin	"3Dgame:graphics/misc/raw/explosion2.bin"
explosion3	incbin	"3Dgame:graphics/misc/raw/explosion3.bin"
explosion4	incbin	"3Dgame:graphics/misc/raw/explosion4.bin"

foam		incbin	"3Dgame:graphics/misc/raw/foam.bin"

compass_n	incbin	"3Dgame:graphics/misc/raw/compass_n.bin"
compass_e	incbin	"3Dgame:graphics/misc/raw/compass_e.bin"
compass_s	incbin	"3Dgame:graphics/misc/raw/compass_s.bin"
compass_w	incbin	"3Dgame:graphics/misc/raw/compass_w.bin"

gamefont	incbin	"3Dgame:graphics/misc/raw/gamefont.bin"

leader		incbin	"3Dgame:graphics/misc/raw/leader.bin"
leader_off	incbin	"3Dgame:graphics/misc/raw/leaderoff.bin"

warning		incbin	"3Dgame:graphics/misc/raw/warning.bin"
locked		incbin	"3Dgame:graphics/misc/raw/locked.bin"
locked2		incbin	"3Dgame:graphics/misc/raw/locked2.bin"
claws		incbin	"3Dgame:graphics/misc/raw/claws.bin"
bigclaws	incbin	"3Dgame:graphics/misc/raw/bigclaws.bin"
rip		incbin	"3Dgame:graphics/misc/raw/rip.bin"
planet		incbin	"3Dgame:graphics/misc/raw/planet.bin"
icon1		incbin	"3Dgame:graphics/misc/raw/icon1.bin"
icon2		incbin	"3Dgame:graphics/misc/raw/icon2.bin"
icon3		incbin	"3Dgame:graphics/misc/raw/icon3.bin"
icon4		incbin	"3Dgame:graphics/misc/raw/icon4.bin"
icon5		incbin	"3Dgame:graphics/misc/raw/icon5.bin"
noammo		incbin	"3Dgame:graphics/misc/raw/noammo.bin"

rotations	incbin	"3Dgame:graphics/misc/raw/rotations.bin"

		IFD	DOWNLOAD
face1		incbin	"3dgame:graphics/download/figuregfx/facesgfx/cheule.upk"
face2		incbin	"3dgame:graphics/download/figuregfx/facesgfx/cim.upk"
face3		incbin	"3dgame:graphics/download/figuregfx/facesgfx/rorian.upk"
face4		incbin	"3dgame:graphics/download/figuregfx/facesgfx/jenillee.upk"
		ENDC

		IFND	DOWNLOAD
face1		ds.b	1126
face2		ds.b	1126
face3		ds.b	1126
face4		ds.b	1126
		ENDC

logo		incbin	"3Dgame:graphics/misc/raw/logo.bin"

used		incbin	"3Dgame:graphics/misc/raw/using.bin"
blocked		incbin	"3Dgame:graphics/misc/raw/blocked.bin"
blocked2	incbin	"3Dgame:graphics/misc/raw/blocked2.bin"
invalid		incbin	"3Dgame:graphics/misc/raw/invalid.bin"
skeleton	incbin	"3Dgame:graphics/misc/raw/skeleton.bin"
exit		incbin	"3Dgame:graphics/misc/raw/exit.bin"
digits		incbin	"3Dgame:graphics/misc/raw/digits.bin"
fill		incbin	"3Dgame:graphics/misc/raw/fill.bin"

drowning	incbin	"3Dgame:graphics/misc/raw/drowning.bin"
poisoned	incbin	"3Dgame:graphics/misc/raw/poisoned.bin"

		end
