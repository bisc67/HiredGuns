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

		incdir	source:hiredguns/sources

		include	Hardware.i
		include	Macros.i

********************************************************************************
********************************** Copper List *********************************
********************************************************************************

		even

                REPT 2

		C_WAIT	15,0,$fffe

		C_MOVE	bplcon0,%1100000000000100	;4 bitplanes & interlace
		C_MOVE	bplcon1,0			;no playfield scrolls
		C_MOVE	bplcon2,%0000000000000000       ;sprites behind playfield
		C_MOVE	bpl1mod,80			;interlace modulo
		C_MOVE	bpl2mod,80			;no modulo
		C_MOVE	ddfstrt,$3c
		C_MOVE	ddfstop,$d4
		C_MOVE	diwstrt,$2a81
		C_MOVE	diwstop,$fbc1

		C_MOVE	bpl1pth,0
		C_MOVE	bpl1ptl,0
		C_MOVE	bpl2pth,0
		C_MOVE	bpl2ptl,0
		C_MOVE	bpl3pth,0
		C_MOVE	bpl3ptl,0
		C_MOVE	bpl4pth,0
		C_MOVE	bpl4ptl,0

		C_MOVE	color00,$000
		C_MOVE	color08,$000
		C_MOVE	color09,$cdf
		C_MOVE	color10,$79b
		C_MOVE	color11,$236
		C_MOVE	color12,$134
		C_MOVE	color13,$023
		C_MOVE	color14,$012
		C_MOVE	color15,$011
		C_MOVE	color17,$322
		C_MOVE	color18,$655
		C_MOVE	color19,$544
		C_MOVE	color21,$322
		C_MOVE	color22,$655
		C_MOVE	color23,$544
		C_MOVE	color25,$322
		C_MOVE	color26,$655
		C_MOVE	color27,$544
		C_MOVE	color29,$322
		C_MOVE	color30,$655
		C_MOVE	color31,$544

posn    set	60
		C_WAIT	posn,8,$fffe
		C_MOVE	color00,$226
		C_MOVE	color08,$226
		C_MOVE	color09,$cbf
		C_MOVE	color10,$bae
		C_MOVE	color11,$98c
		C_MOVE	color12,$87b
		C_MOVE	color13,$659
		C_MOVE	color14,$548
		C_MOVE	color15,$437
		C_WAIT	(posn+1),8,$fffe
		C_MOVE	color00,$33b
		C_MOVE	color08,$33b
		C_MOVE	color09,$dcf
		C_MOVE	color10,$cbf
		C_MOVE	color11,$a9f
		C_MOVE	color12,$98f
		C_MOVE	color13,$76e
		C_MOVE	color14,$65d
		C_MOVE	color15,$54c
		C_WAIT	(posn+2),8,$fffe
		C_MOVE	color00,$33c
		C_MOVE	color08,$33c
		C_MOVE	color09,$dcf
		C_MOVE	color10,$cbf
		C_MOVE	color11,$a9f
		C_MOVE	color12,$98f
		C_MOVE	color13,$76f
		C_MOVE	color14,$65e
		C_MOVE	color15,$54d
		C_WAIT	(posn+3),8,$fffe
		C_MOVE	color00,$00a
		C_MOVE	color08,$00a
		C_MOVE	color09,$a9f
		C_MOVE	color10,$98f
		C_MOVE	color11,$76f
		C_MOVE	color12,$65f
		C_MOVE	color13,$43d
		C_MOVE	color14,$32c
		C_MOVE	color15,$21b
		C_MOVE	color01,$ddd
		C_MOVE	color02,$ccd
		C_MOVE	color03,$aac
		C_MOVE	color04,$88c
		C_MOVE	color05,$66b
		C_MOVE	color06,$44b
		C_MOVE	color07,$22a
		C_WAIT	(posn+36),8,$fffe
		C_MOVE	color00,$007
		C_MOVE	color08,$007
		C_MOVE	color09,$a9f
		C_MOVE	color10,$98f
		C_MOVE	color11,$76e
		C_MOVE	color12,$65c
		C_MOVE	color13,$43a
		C_MOVE	color14,$329
		C_MOVE	color15,$218
		C_WAIT	(posn+37),8,$fffe
		C_MOVE	color00,$116
		C_MOVE	color08,$116
		C_MOVE	color09,$baf
		C_MOVE	color10,$a9e
		C_MOVE	color11,$87c
		C_MOVE	color12,$76b
		C_MOVE	color13,$549
		C_MOVE	color14,$438
		C_MOVE	color15,$327
		C_WAIT	(posn+38),8,$fffe
		C_MOVE	color00,$115
		C_MOVE	color08,$115
		C_MOVE	color09,$bae
		C_MOVE	color10,$a9d
		C_MOVE	color11,$87b
		C_MOVE	color12,$76a
		C_MOVE	color13,$548
		C_MOVE	color14,$437
		C_MOVE	color15,$326
		C_WAIT	(posn+39),8,$fffe

		C_MOVE	color00,$000
		C_MOVE	color08,$000
		C_MOVE	color09,$cdf
		C_MOVE	color10,$79b
		C_MOVE	color11,$236
		C_MOVE	color12,$134
		C_MOVE	color13,$023
		C_MOVE	color14,$012
		C_MOVE	color15,$011
		C_MOVE	color01,$fff
		C_MOVE	color02,$ccd
		C_MOVE	color03,$aac
		C_MOVE	color04,$88a
		C_MOVE	color05,$669
		C_MOVE	color06,$447
		C_MOVE	color07,$224

		C_WAIT	253,0,$fffe
		C_MOVE	color08,$010
		C_MOVE	color09,$cef
		C_MOVE	color10,$7ab
		C_MOVE	color11,$246
		C_MOVE	color12,$144
		C_MOVE	color13,$033
		C_MOVE	color14,$022
		C_MOVE	color15,$021

		C_WAIT	253,0,$fffe
		C_MOVE	color08,$021
		C_MOVE	color09,$cff
		C_MOVE	color10,$7bc
		C_MOVE	color11,$257
		C_MOVE	color12,$155
		C_MOVE	color13,$044
		C_MOVE	color14,$033
		C_MOVE	color15,$032

		C_WAIT	253,0,$fffe
		C_MOVE	color08,$131
		C_MOVE	color09,$dff
		C_MOVE	color10,$8cc
		C_MOVE	color11,$367
		C_MOVE	color12,$265
		C_MOVE	color13,$154
		C_MOVE	color14,$143
		C_MOVE	color15,$142

		C_WAIT	253,0,$fffe
		C_MOVE	color08,$142
		C_MOVE	color09,$dff
		C_MOVE	color10,$8cd
		C_MOVE	color11,$378
		C_MOVE	color12,$276
		C_MOVE	color13,$165
		C_MOVE	color14,$154
		C_MOVE	color15,$153

		C_WAIT	253,0,$fffe
		C_MOVE	color08,$152
		C_MOVE	color09,$dff
		C_MOVE	color10,$8ed
		C_MOVE	color11,$388
		C_MOVE	color12,$286
		C_MOVE	color13,$175
		C_MOVE	color14,$164
		C_MOVE	color15,$163

		C_WAIT	253,0,$fffe
		C_MOVE	color08,$263
		C_MOVE	color09,$eff
		C_MOVE	color10,$9fe
		C_MOVE	color11,$499
		C_MOVE	color12,$397
		C_MOVE	color13,$286
		C_MOVE	color14,$275
		C_MOVE	color15,$274

		C_WAIT	253,0,$fffe
		C_MOVE	color08,$273
		C_MOVE	color09,$eff
		C_MOVE	color10,$9fe
		C_MOVE	color11,$4a8
		C_MOVE	color12,$3a7
		C_MOVE	color13,$296
		C_MOVE	color14,$285
		C_MOVE	color15,$284

		C_WAIT	253,0,$fffe
		C_MOVE	color08,$284
		C_MOVE	color09,$eff
		C_MOVE	color10,$9ff
		C_MOVE	color11,$4b9
		C_MOVE	color12,$3b8
		C_MOVE	color13,$2a7
		C_MOVE	color14,$296
		C_MOVE	color15,$295

		C_WAIT	253,0,$fffe
		C_MOVE	color08,$394
		C_MOVE	color09,$fff
		C_MOVE	color10,$aff
		C_MOVE	color11,$5c9
		C_MOVE	color12,$4c8
		C_MOVE	color13,$3b7
		C_MOVE	color14,$3a6
		C_MOVE	color15,$3a5

		C_WAIT	253,0,$fffe
		C_MOVE	color08,$3a5
		C_MOVE	color09,$fff
		C_MOVE	color10,$aff
		C_MOVE	color11,$5da
		C_MOVE	color12,$4d9
		C_MOVE	color13,$3c8
		C_MOVE	color14,$3b7
		C_MOVE	color15,$3b6

		C_WAIT	253,0,$fffe
		C_MOVE	color08,$3b5
		C_MOVE	color09,$fff
		C_MOVE	color10,$aff
		C_MOVE	color11,$5ea
		C_MOVE	color12,$4e9
		C_MOVE	color13,$3d8
		C_MOVE	color14,$3c7
		C_MOVE	color15,$3c6

		C_WAIT	253,0,$fffe
		C_MOVE	color08,$4c6
		C_MOVE	color09,$fff
		C_MOVE	color10,$bff
		C_MOVE	color11,$6fb
		C_MOVE	color12,$5fa
		C_MOVE	color13,$4e9
		C_MOVE	color14,$4d8
		C_MOVE	color15,$4d7

		C_WAIT	253,0,$fffe
		C_MOVE	color08,$4d6
		C_MOVE	color09,$fff
		C_MOVE	color10,$bff
		C_MOVE	color11,$6fb
		C_MOVE	color12,$5fa
		C_MOVE	color13,$4f9
		C_MOVE	color14,$4e8
		C_MOVE	color15,$4e7

		C_WAIT	253,0,$fffe
		C_MOVE	color08,$4e7
		C_MOVE	color09,$fff
		C_MOVE	color10,$bff
		C_MOVE	color11,$6fc
		C_MOVE	color12,$5fb
		C_MOVE	color13,$4fa
		C_MOVE	color14,$4f9
		C_MOVE	color15,$4f8

		C_WAIT	253,0,$fffe
		C_MOVE	color08,$dfe
		C_MOVE	color09,$fff
		C_MOVE	color10,$fff
		C_MOVE	color11,$fff
		C_MOVE	color12,$eff
		C_MOVE	color13,$dff
		C_MOVE	color14,$dff
		C_MOVE	color15,$dff

		C_WAIT	253,0,$fffe
		C_MOVE	color08,$000
		C_MOVE	color09,$cdf
		C_MOVE	color10,$79b
		C_MOVE	color11,$236
		C_MOVE	color12,$134
		C_MOVE	color13,$023
		C_MOVE	color14,$012
		C_MOVE	color15,$011

		C_MOVE	cop1lcl,0
		C_MOVE	cop1lch,0	;point to next copper list

		C_STOP

		ENDR

		end
