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
		even

		REPT	2

		C_MOVE	fmode,%0000000000000101		;32 bit sprite fetch
		C_WAIT	0,0,$fffe

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

		C_MOVE	bplcon0,%1000100000010100	;hired + 8 bitplanes + HAM + lace
		C_MOVE	bplcon1,0			;playfield scrolls
		C_MOVE	bplcon2,%0000000000100100       ;playfield priority
		C_MOVE	bpl1mod,80			;interlace modulo
		C_MOVE	bpl2mod,80			;no modulo
		C_MOVE	ddfstrt,7<<3
		C_MOVE	ddfstop,26<<3
		C_MOVE	diwstrt,$2981
		C_MOVE	diwstop,$f2c1


		C_BANK	0,HI
		C_MOVE	color00,0
		C_MOVE	color01,0
		C_MOVE	color02,0
		C_MOVE	color03,0
		C_MOVE	color04,0
		C_MOVE	color05,0
		C_MOVE	color06,0
		C_MOVE	color07,0
		C_MOVE	color08,0
		C_MOVE	color09,0
		C_MOVE	color10,0
		C_MOVE	color11,0
		C_MOVE	color12,0
		C_MOVE	color13,0
		C_MOVE	color14,0
		C_MOVE	color15,0
		C_MOVE	color16,0
		C_MOVE	color17,0
		C_MOVE	color18,0
		C_MOVE	color19,0
		C_MOVE	color20,0
		C_MOVE	color21,0
		C_MOVE	color22,0
		C_MOVE	color23,0
		C_MOVE	color24,0
		C_MOVE	color25,0
		C_MOVE	color26,0
		C_MOVE	color27,0
		C_MOVE	color28,0
		C_MOVE	color29,0
		C_MOVE	color30,0
		C_MOVE	color31,0
		C_BANK	0,LO
		C_MOVE	color00,0
		C_MOVE	color01,0
		C_MOVE	color02,0
		C_MOVE	color03,0
		C_MOVE	color04,0
		C_MOVE	color05,0
		C_MOVE	color06,0
		C_MOVE	color07,0
		C_MOVE	color08,0
		C_MOVE	color09,0
		C_MOVE	color10,0
		C_MOVE	color11,0
		C_MOVE	color12,0
		C_MOVE	color13,0
		C_MOVE	color14,0
		C_MOVE	color15,0
		C_MOVE	color16,0
		C_MOVE	color17,0
		C_MOVE	color18,0
		C_MOVE	color19,0
		C_MOVE	color20,0
		C_MOVE	color21,0
		C_MOVE	color22,0
		C_MOVE	color23,0
		C_MOVE	color24,0
		C_MOVE	color25,0
		C_MOVE	color26,0
		C_MOVE	color27,0
		C_MOVE	color28,0
		C_MOVE	color29,0
		C_MOVE	color30,0
		C_MOVE	color31,0
		C_BANK	32,HI
		C_MOVE	color00,0
		C_MOVE	color01,0
		C_MOVE	color02,0
		C_MOVE	color03,0
		C_MOVE	color04,0
		C_MOVE	color05,0
		C_MOVE	color06,0
		C_MOVE	color07,0
		C_MOVE	color08,0
		C_MOVE	color09,0
		C_MOVE	color10,0
		C_MOVE	color11,0
		C_MOVE	color12,0
		C_MOVE	color13,0
		C_MOVE	color14,0
		C_MOVE	color15,0
		C_MOVE	color16,0
		C_MOVE	color17,0
		C_MOVE	color18,0
		C_MOVE	color19,0
		C_MOVE	color20,0
		C_MOVE	color21,0
		C_MOVE	color22,0
		C_MOVE	color23,0
		C_MOVE	color24,0
		C_MOVE	color25,0
		C_MOVE	color26,0
		C_MOVE	color27,0
		C_MOVE	color28,0
		C_MOVE	color29,0
		C_MOVE	color30,0
		C_MOVE	color31,0
		C_BANK	32,LO
		C_MOVE	color00,0
		C_MOVE	color01,0
		C_MOVE	color02,0
		C_MOVE	color03,0
		C_MOVE	color04,0
		C_MOVE	color05,0
		C_MOVE	color06,0
		C_MOVE	color07,0
		C_MOVE	color08,0
		C_MOVE	color09,0
		C_MOVE	color10,0
		C_MOVE	color11,0
		C_MOVE	color12,0
		C_MOVE	color13,0
		C_MOVE	color14,0
		C_MOVE	color15,0
		C_MOVE	color16,0
		C_MOVE	color17,0
		C_MOVE	color18,0
		C_MOVE	color19,0
		C_MOVE	color20,0
		C_MOVE	color21,0
		C_MOVE	color22,0
		C_MOVE	color23,0
		C_MOVE	color24,0
		C_MOVE	color25,0
		C_MOVE	color26,0
		C_MOVE	color27,0
		C_MOVE	color28,0
		C_MOVE	color29,0
		C_MOVE	color30,0
		C_MOVE	color31,0

		C_WAIT	15,0,$fffe
		C_MOVE	bpl3pth,0
		C_MOVE	bpl3ptl,0
		C_MOVE	bpl4pth,0
		C_MOVE	bpl4ptl,0
		C_MOVE	bpl5pth,0
		C_MOVE	bpl5ptl,0
		C_MOVE	bpl6pth,0
		C_MOVE	bpl6ptl,0
		C_MOVE	bpl7pth,0
		C_MOVE	bpl7ptl,0
		C_MOVE	bpl8pth,0
		C_MOVE	bpl8ptl,0
		C_MOVE	bpl1pth,0
		C_MOVE	bpl1ptl,0
		C_MOVE	bpl2pth,0
		C_MOVE	bpl2ptl,0

		C_WAIT	210-22,0,$fffe
		C_MOVE	dmacon,%0000000100000000
		C_WAIT	211-22,15,$fffe
		C_MOVE	color00,$dfe
		C_WAIT	212-22,0,$fffe

		C_MOVE  bplcon0,%1101000000000100
		C_MOVE  bplcon1,0
		C_MOVE	bpl1mod,80			;interlace modulo
		C_MOVE	bpl2mod,80			;no modulo
		C_MOVE	ddfstrt,7<<3
		C_MOVE	ddfstop,26<<3
		C_MOVE	diwstrt,$2981
		C_MOVE	diwstop,$f2c1

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

		C_WAIT	214-22,15,$fffe
		C_MOVE	dmacon,%1000000100000000

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

		C_MOVE	intreq,%1000000000010000	;copper interrupt

		C_MOVE	cop1lcl,0
		C_MOVE	cop1lch,0	;point to next copper list

		C_STOP

		ENDR

		end
