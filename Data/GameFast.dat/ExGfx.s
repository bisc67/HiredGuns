start		output	ram:test
		opt 	o+,ow-					;genam options

		dc.l	grenade-start
		dc.l	stungrenade-start
		dc.l	(sentry-start)+956*0
		dc.l	(sentry-start)+956*1
		dc.l	(sentry-start)+956*2
		dc.l	(sentry-start)+956*3
		dc.l	active-start

*******************************************************************************

grenade		incbin	"grenade.bin"
stungrenade
sentry		incbin	"sentry.bin"
active		incbin	"3dgame:graphics/misc/raw/active.bin"

		end
