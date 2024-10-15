********************************************************************************
********************************************************************************
********************************************************************************
*                                                                              *
*          ##\ ##\##\#####\ ##### #####     #### /## /##/#####  /####          *
*          ## \## ## ##\ ## ##\   ##  ##   ##  ## ##  ## ## /##/##  ##         *
*          ##  ## ## ##  ## ##    ##  ##   ##     ##  ## ##  ## ##             *
*          ###### ## #####  ####  ##  ##   ##     ##  ## ##  ##  ####          *
*          ##  ## ## ##  ## ##    ##  ##   ##  ## ##  ## ##  ##     ##         *
*          ## /## ## ##  ## ##/   ##  ##   ##  ##\##  ## ##  ##\## \##         *
*          ##/ ##/##/##/ ##/##### #####     ##### \#### \## \## \####          *
*                                                                              *
********************************************************************************
************************** (C) Scott Johnston 1990/91/92 ***********************
********************************************************************************

		opt 	o+,ow-

		incdir	3dgame:sources

		include	Hardware.i
		include	Macros.i

********************************************************************************
********************************** Copper List *********************************
********************************************************************************

SCAN		MACRO
red		set	\2+\5
green		set	\3+\6
blu		set	\4+\7

	IFGT	red-15
red		set     15
	ENDC
	IFGT	green-15
green		set	15
	ENDC
	IFGT	blu-15
blu		set     15
	ENDC
		C_MOVE	\1,((red&$f)<<8)|((green&$f)<<4)|(blu&$f)
        	ENDM

		even

                REPT 2

		C_MOVE	fmode,%0000000000000101		;32 bit sprite fetch
		C_WAIT	5,0,$fffe

		C_MOVE	spr0ptl,0			;sprite pointers
		C_MOVE	spr0pth,0
		C_MOVE	spr1ptl,0
		C_MOVE	spr1pth,0
		C_MOVE	spr2ptl,0
		C_MOVE	spr2pth,0
		C_MOVE	spr3ptl,0
		C_MOVE	spr3pth,0
		C_MOVE	spr4ptl,0
		C_MOVE	spr4pth,0
		C_MOVE	spr5ptl,0
		C_MOVE	spr5pth,0
		C_MOVE	spr6ptl,0
		C_MOVE	spr6pth,0
		C_MOVE	spr7ptl,0
		C_MOVE	spr7pth,0

		C_MOVE	bplcon0,%1101000000000100	;5 bitplanes & interlace
		C_MOVE	bplcon1,0			;no playfield scrolls
		C_MOVE	bplcon2,%0000001000100100       ;playfield priority + killehb
		C_MOVE	bplcon4,%0000000000100010	;sprite colours 64-95
		C_MOVE	bpl1mod,80			;interlace modulo
		C_MOVE	bpl2mod,80			;no modulo
		C_MOVE	ddfstrt,7<<3
		C_MOVE	ddfstop,26<<3
		C_MOVE	diwstrt,$2881
		C_MOVE	diwstop,$f0c1

		C_MOVE	bpl1pth,0
		C_MOVE	bpl1ptl,0
		C_MOVE	bpl2pth,0
		C_MOVE	bpl2ptl,0
		C_MOVE	bpl3pth,0
		C_MOVE	bpl3ptl,0
		C_MOVE	bpl4pth,0
		C_MOVE	bpl4ptl,0
		C_MOVE	bpl5pth,0
		C_MOVE	bpl5ptl,0

		C_BANK	0,HI
		C_MOVE	color00,$000
		C_MOVE	color01,$fff
		C_MOVE	color02,$ccd
		C_MOVE	color03,$aac
		C_MOVE	color04,$88a
		C_MOVE	color05,$669
		C_MOVE	color06,$447
		C_MOVE	color07,$224
		C_MOVE	color08,$000
		C_MOVE	color09,$cfe
		C_MOVE	color10,$adc
		C_MOVE	color11,$8ba
		C_MOVE	color12,$697
		C_MOVE	color13,$565
		C_MOVE	color14,$343
		C_MOVE	color15,$121
		C_MOVE	color16,$000
		C_MOVE	color17,$fff
		C_MOVE	color18,$cdf
		C_MOVE	color19,$9ac
		C_MOVE	color20,$68a
		C_MOVE	color21,$458
		C_MOVE	color22,$236
		C_MOVE	color23,$135
		C_MOVE	color24,$134
		C_MOVE	color25,$023
		C_MOVE	color26,$012
		C_MOVE	color27,$023
		C_MOVE	color28,$012
		C_MOVE	color29,$011
		C_MOVE	color30,$011
		C_MOVE	color31,$000
		C_BANK	0,LO
		C_MOVE	color00,$000
		C_MOVE	color01,$fff
		C_MOVE	color02,$ccd
		C_MOVE	color03,$aac
		C_MOVE	color04,$88a
		C_MOVE	color05,$669
		C_MOVE	color06,$447
		C_MOVE	color07,$224
		C_MOVE	color08,$000
		C_MOVE	color09,$dfa
		C_MOVE	color10,$b94
		C_MOVE	color11,$c51
		C_MOVE	color12,$e0f
		C_MOVE	color13,$1de
		C_MOVE	color14,$48d
		C_MOVE	color15,$a4e
		C_MOVE	color16,$000
		C_MOVE	color17,$fff
		C_MOVE	color18,$000
		C_MOVE	color19,$3ce
		C_MOVE	color20,$ffe
		C_MOVE	color21,$2e7
		C_MOVE	color22,$000
		C_MOVE	color23,$710
		C_MOVE	color24,$000
		C_MOVE	color25,$000
		C_MOVE	color26,$088
		C_MOVE	color27,$788
		C_MOVE	color28,$000
		C_MOVE	color29,$018
		C_MOVE	color30,$000
		C_MOVE	color31,$088

		C_BANK	32,HI
		C_MOVE	color00,$000
		C_MOVE	color01,$fff
		C_MOVE	color02,$bbb
		C_MOVE	color03,$666
		C_MOVE	color04,$000
		C_MOVE	color05,$fff
		C_MOVE	color06,$bbb
		C_MOVE	color07,$666
		C_MOVE	color08,$000
		C_MOVE	color09,$fff
		C_MOVE	color10,$bbb
		C_MOVE	color11,$666
		C_MOVE	color12,$000
		C_MOVE	color13,$fff
		C_MOVE	color14,$bbb
		C_MOVE	color15,$666

		C_WAIT	250,0,$fffe
		C_BANK	0,HI
		SCAN	color16,$0,$0,$0,0,1,0
		SCAN	color17,$f,$f,$f,0,1,0
		SCAN	color18,$c,$d,$f,0,1,0
		SCAN	color19,$9,$a,$c,0,1,0
		SCAN	color20,$6,$8,$a,0,1,0
		SCAN	color21,$4,$5,$8,0,1,0
		SCAN	color22,$2,$3,$6,0,1,0
		SCAN	color23,$1,$3,$5,0,1,0
		SCAN	color24,$1,$3,$4,0,1,0
		SCAN	color25,$0,$2,$3,0,1,0
		SCAN	color26,$0,$1,$2,0,1,0
		SCAN	color27,$0,$2,$3,0,1,0
		SCAN	color28,$0,$1,$2,0,1,0
		SCAN	color29,$0,$1,$1,0,1,0
		SCAN	color30,$0,$1,$1,0,1,0
		SCAN	color31,$0,$0,$0,0,1,0

		C_WAIT	250,0,$fffe
		C_BANK	0,HI
		SCAN	color16,$0,$0,$0,0,2,1
		SCAN	color17,$f,$f,$f,0,2,1
		SCAN	color18,$c,$d,$f,0,2,1
		SCAN	color19,$9,$a,$c,0,2,1
		SCAN	color20,$6,$8,$a,0,2,1
		SCAN	color21,$4,$5,$8,0,2,1
		SCAN	color22,$2,$3,$6,0,2,1
		SCAN	color23,$1,$3,$5,0,2,1
		SCAN	color24,$1,$3,$4,0,2,1
		SCAN	color25,$0,$2,$3,0,2,1
		SCAN	color26,$0,$1,$2,0,2,1
		SCAN	color27,$0,$2,$3,0,2,1
		SCAN	color28,$0,$1,$2,0,2,1
		SCAN	color29,$0,$1,$1,0,2,1
		SCAN	color30,$0,$1,$1,0,2,1
		SCAN	color31,$0,$0,$0,0,2,1

		C_WAIT	250,0,$fffe
		C_BANK	0,HI
		SCAN	color16,$0,$0,$0,1,3,1
		SCAN	color17,$f,$f,$f,1,3,1
		SCAN	color18,$c,$d,$f,1,3,1
		SCAN	color19,$9,$a,$c,1,3,1
		SCAN	color20,$6,$8,$a,1,3,1
		SCAN	color21,$4,$5,$8,1,3,1
		SCAN	color22,$2,$3,$6,1,3,1
		SCAN	color23,$1,$3,$5,1,3,1
		SCAN	color24,$1,$3,$4,1,3,1
		SCAN	color25,$0,$2,$3,1,3,1
		SCAN	color26,$0,$1,$2,1,3,1
		SCAN	color27,$0,$2,$3,1,3,1
		SCAN	color28,$0,$1,$2,1,3,1
		SCAN	color29,$0,$1,$1,1,3,1
		SCAN	color30,$0,$1,$1,1,3,1
		SCAN	color31,$0,$0,$0,1,3,1

		C_WAIT	250,0,$fffe
		C_BANK	0,HI
		SCAN	color16,$0,$0,$0,1,4,2
		SCAN	color17,$f,$f,$f,1,4,2
		SCAN	color18,$c,$d,$f,1,4,2
		SCAN	color19,$9,$a,$c,1,4,2
		SCAN	color20,$6,$8,$a,1,4,2
		SCAN	color21,$4,$5,$8,1,4,2
		SCAN	color22,$2,$3,$6,1,4,2
		SCAN	color23,$1,$3,$5,1,4,2
		SCAN	color24,$1,$3,$4,1,4,2
		SCAN	color25,$0,$2,$3,1,4,2
		SCAN	color26,$0,$1,$2,1,4,2
		SCAN	color27,$0,$2,$3,1,4,2
		SCAN	color28,$0,$1,$2,1,4,2
		SCAN	color29,$0,$1,$1,1,4,2
		SCAN	color30,$0,$1,$1,1,4,2
		SCAN	color31,$0,$0,$0,1,4,2

		C_WAIT	250,0,$fffe
		C_BANK	0,HI
		SCAN	color16,$0,$0,$0,1,5,2
		SCAN	color17,$f,$f,$f,1,5,2
		SCAN	color18,$c,$d,$f,1,5,2
		SCAN	color19,$9,$a,$c,1,5,2
		SCAN	color20,$6,$8,$a,1,5,2
		SCAN	color21,$4,$5,$8,1,5,2
		SCAN	color22,$2,$3,$6,1,5,2
		SCAN	color23,$1,$3,$5,1,5,2
		SCAN	color24,$1,$3,$4,1,5,2
		SCAN	color25,$0,$2,$3,1,5,2
		SCAN	color26,$0,$1,$2,1,5,2
		SCAN	color27,$0,$2,$3,1,5,2
		SCAN	color28,$0,$1,$2,1,5,2
		SCAN	color29,$0,$1,$1,1,5,2
		SCAN	color30,$0,$1,$1,1,5,2
		SCAN	color31,$0,$0,$0,1,5,2

		C_WAIT	250,0,$fffe
		C_BANK	0,HI
		SCAN	color16,$0,$0,$0,2,6,3
		SCAN	color17,$f,$f,$f,2,6,3
		SCAN	color18,$c,$d,$f,2,6,3
		SCAN	color19,$9,$a,$c,2,6,3
		SCAN	color20,$6,$8,$a,2,6,3
		SCAN	color21,$4,$5,$8,2,6,3
		SCAN	color22,$2,$3,$6,2,6,3
		SCAN	color23,$1,$3,$5,2,6,3
		SCAN	color24,$1,$3,$4,2,6,3
		SCAN	color25,$0,$2,$3,2,6,3
		SCAN	color26,$0,$1,$2,2,6,3
		SCAN	color27,$0,$2,$3,2,6,3
		SCAN	color28,$0,$1,$2,2,6,3
		SCAN	color29,$0,$1,$1,2,6,3
		SCAN	color30,$0,$1,$1,2,6,3
		SCAN	color31,$0,$0,$0,2,6,3

		C_WAIT	250,0,$fffe
		C_BANK	0,HI
		SCAN	color16,$0,$0,$0,2,7,3
		SCAN	color17,$f,$f,$f,2,7,3
		SCAN	color18,$c,$d,$f,2,7,3
		SCAN	color19,$9,$a,$c,2,7,3
		SCAN	color20,$6,$8,$a,2,7,3
		SCAN	color21,$4,$5,$8,2,7,3
		SCAN	color22,$2,$3,$6,2,7,3
		SCAN	color23,$1,$3,$5,2,7,3
		SCAN	color24,$1,$3,$4,2,7,3
		SCAN	color25,$0,$2,$3,2,7,3
		SCAN	color26,$0,$1,$2,2,7,3
		SCAN	color27,$0,$2,$3,2,7,3
		SCAN	color28,$0,$1,$2,2,7,3
		SCAN	color29,$0,$1,$1,2,7,3
		SCAN	color30,$0,$1,$1,2,7,3
		SCAN	color31,$0,$0,$0,2,7,3

		C_WAIT	250,0,$fffe
		C_BANK	0,HI
		SCAN	color16,$0,$0,$0,2,8,4
		SCAN	color17,$f,$f,$f,2,8,4
		SCAN	color18,$c,$d,$f,2,8,4
		SCAN	color19,$9,$a,$c,2,8,4
		SCAN	color20,$6,$8,$a,2,8,4
		SCAN	color21,$4,$5,$8,2,8,4
		SCAN	color22,$2,$3,$6,2,8,4
		SCAN	color23,$1,$3,$5,2,8,4
		SCAN	color24,$1,$3,$4,2,8,4
		SCAN	color25,$0,$2,$3,2,8,4
		SCAN	color26,$0,$1,$2,2,8,4
		SCAN	color27,$0,$2,$3,2,8,4
		SCAN	color28,$0,$1,$2,2,8,4
		SCAN	color29,$0,$1,$1,2,8,4
		SCAN	color30,$0,$1,$1,2,8,4
		SCAN	color31,$0,$0,$0,2,8,4

		C_WAIT	250,0,$fffe
		C_BANK	0,HI
		SCAN	color16,$0,$0,$0,3,9,4
		SCAN	color17,$f,$f,$f,3,9,4
		SCAN	color18,$c,$d,$f,3,9,4
		SCAN	color19,$9,$a,$c,3,9,4
		SCAN	color20,$6,$8,$a,3,9,4
		SCAN	color21,$4,$5,$8,3,9,4
		SCAN	color22,$2,$3,$6,3,9,4
		SCAN	color23,$1,$3,$5,3,9,4
		SCAN	color24,$1,$3,$4,3,9,4
		SCAN	color25,$0,$2,$3,3,9,4
		SCAN	color26,$0,$1,$2,3,9,4
		SCAN	color27,$0,$2,$3,3,9,4
		SCAN	color28,$0,$1,$2,3,9,4
		SCAN	color29,$0,$1,$1,3,9,4
		SCAN	color30,$0,$1,$1,3,9,4
		SCAN	color31,$0,$0,$0,3,9,4

		C_WAIT	250,0,$fffe
		C_BANK	0,HI
		SCAN	color16,$0,$0,$0,3,10,5
		SCAN	color17,$f,$f,$f,3,10,5
		SCAN	color18,$c,$d,$f,3,10,5
		SCAN	color19,$9,$a,$c,3,10,5
		SCAN	color20,$6,$8,$a,3,10,5
		SCAN	color21,$4,$5,$8,3,10,5
		SCAN	color22,$2,$3,$6,3,10,5
		SCAN	color23,$1,$3,$5,3,10,5
		SCAN	color24,$1,$3,$4,3,10,5
		SCAN	color25,$0,$2,$3,3,10,5
		SCAN	color26,$0,$1,$2,3,10,5
		SCAN	color27,$0,$2,$3,3,10,5
		SCAN	color28,$0,$1,$2,3,10,5
		SCAN	color29,$0,$1,$1,3,10,5
		SCAN	color30,$0,$1,$1,3,10,5
		SCAN	color31,$0,$0,$0,3,10,5

		C_WAIT	250,0,$fffe
		C_BANK	0,HI
		SCAN	color16,$0,$0,$0,3,11,5
		SCAN	color17,$f,$f,$f,3,11,5
		SCAN	color18,$c,$d,$f,3,11,5
		SCAN	color19,$9,$a,$c,3,11,5
		SCAN	color20,$6,$8,$a,3,11,5
		SCAN	color21,$4,$5,$8,3,11,5
		SCAN	color22,$2,$3,$6,3,11,5
		SCAN	color23,$1,$3,$5,3,11,5
		SCAN	color24,$1,$3,$4,3,11,5
		SCAN	color25,$0,$2,$3,3,11,5
		SCAN	color26,$0,$1,$2,3,11,5
		SCAN	color27,$0,$2,$3,3,11,5
		SCAN	color28,$0,$1,$2,3,11,5
		SCAN	color29,$0,$1,$1,3,11,5
		SCAN	color30,$0,$1,$1,3,11,5
		SCAN	color31,$0,$0,$0,3,11,5

		C_WAIT	250,0,$fffe
		C_BANK	0,HI
		SCAN	color16,$0,$0,$0,4,12,6
		SCAN	color17,$f,$f,$f,4,12,6
		SCAN	color18,$c,$d,$f,4,12,6
		SCAN	color19,$9,$a,$c,4,12,6
		SCAN	color20,$6,$8,$a,4,12,6
		SCAN	color21,$4,$5,$8,4,12,6
		SCAN	color22,$2,$3,$6,4,12,6
		SCAN	color23,$1,$3,$5,4,12,6
		SCAN	color24,$1,$3,$4,4,12,6
		SCAN	color25,$0,$2,$3,4,12,6
		SCAN	color26,$0,$1,$2,4,12,6
		SCAN	color27,$0,$2,$3,4,12,6
		SCAN	color28,$0,$1,$2,4,12,6
		SCAN	color29,$0,$1,$1,4,12,6
		SCAN	color30,$0,$1,$1,4,12,6
		SCAN	color31,$0,$0,$0,4,12,6

		C_WAIT	250,0,$fffe
		C_BANK	0,HI
		SCAN	color16,$0,$0,$0,4,13,6
		SCAN	color17,$f,$f,$f,4,13,6
		SCAN	color18,$c,$d,$f,4,13,6
		SCAN	color19,$9,$a,$c,4,13,6
		SCAN	color20,$6,$8,$a,4,13,6
		SCAN	color21,$4,$5,$8,4,13,6
		SCAN	color22,$2,$3,$6,4,13,6
		SCAN	color23,$1,$3,$5,4,13,6
		SCAN	color24,$1,$3,$4,4,13,6
		SCAN	color25,$0,$2,$3,4,13,6
		SCAN	color26,$0,$1,$2,4,13,6
		SCAN	color27,$0,$2,$3,4,13,6
		SCAN	color28,$0,$1,$2,4,13,6
		SCAN	color29,$0,$1,$1,4,13,6
		SCAN	color30,$0,$1,$1,4,13,6
		SCAN	color31,$0,$0,$0,4,13,6

		C_WAIT	250,0,$fffe
		C_BANK	0,HI
		SCAN	color16,$0,$0,$0,4,14,7
		SCAN	color17,$f,$f,$f,4,14,7
		SCAN	color18,$c,$d,$f,4,14,7
		SCAN	color19,$9,$a,$c,4,14,7
		SCAN	color20,$6,$8,$a,4,14,7
		SCAN	color21,$4,$5,$8,4,14,7
		SCAN	color22,$2,$3,$6,4,14,7
		SCAN	color23,$1,$3,$5,4,14,7
		SCAN	color24,$1,$3,$4,4,14,7
		SCAN	color25,$0,$2,$3,4,14,7
		SCAN	color26,$0,$1,$2,4,14,7
		SCAN	color27,$0,$2,$3,4,14,7
		SCAN	color28,$0,$1,$2,4,14,7
		SCAN	color29,$0,$1,$1,4,14,7
		SCAN	color30,$0,$1,$1,4,14,7
		SCAN	color31,$0,$0,$0,4,14,7

		C_WAIT	250,0,$fffe
		C_BANK	0,HI
		SCAN	color16,$0,$0,$0,13,15,14
		SCAN	color17,$f,$f,$f,13,15,14
		SCAN	color18,$c,$d,$f,13,15,14
		SCAN	color19,$9,$a,$c,13,15,14
		SCAN	color20,$6,$8,$a,13,15,14
		SCAN	color21,$4,$5,$8,13,15,14
		SCAN	color22,$2,$3,$6,13,15,14
		SCAN	color23,$1,$3,$5,13,15,14
		SCAN	color24,$1,$3,$4,13,15,14
		SCAN	color25,$0,$2,$3,13,15,14
		SCAN	color26,$0,$1,$2,13,15,14
		SCAN	color27,$0,$2,$3,13,15,14
		SCAN	color28,$0,$1,$2,13,15,14
		SCAN	color29,$0,$1,$1,13,15,14
		SCAN	color30,$0,$1,$1,13,15,14
		SCAN	color31,$0,$0,$0,13,15,14

		C_WAIT	250,0,$fffe
		C_BANK	0,HI
		C_MOVE	color16,$000
		C_MOVE	color17,$fff
		C_MOVE	color18,$cdf
		C_MOVE	color19,$9ac
		C_MOVE	color20,$68a
		C_MOVE	color21,$458
		C_MOVE	color22,$236
		C_MOVE	color23,$135
		C_MOVE	color24,$134
		C_MOVE	color25,$023
		C_MOVE	color26,$012
		C_MOVE	color27,$023
		C_MOVE	color28,$012
		C_MOVE	color29,$011
		C_MOVE	color30,$011
		C_MOVE	color31,$000

		C_BANK	0,LO
		C_MOVE	color16,$000
		C_MOVE	color17,$fff
		C_MOVE	color18,$000
		C_MOVE	color19,$3ce
		C_MOVE	color20,$ffe
		C_MOVE	color21,$2e7
		C_MOVE	color22,$000
		C_MOVE	color23,$710
		C_MOVE	color24,$000
		C_MOVE	color25,$000
		C_MOVE	color26,$088
		C_MOVE	color27,$788
		C_MOVE	color28,$000
		C_MOVE	color29,$018
		C_MOVE	color30,$000
		C_MOVE	color31,$088

		C_MOVE	intreq,%1000000000010000	;copper interrupt

		C_MOVE	cop1lcl,0
		C_MOVE	cop1lch,0	;point to next copper list

		C_STOP

		ENDR

		end
