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
clist_start	C_WAIT	0,0,$fffe

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

		C_MOVE	bplcon0,%0110100000000000	;6 bitplanes + HAM
		C_MOVE	bplcon1,0			;playfield scrolls
		C_MOVE	bplcon2,%0000000000100100       ;playfield priority
		C_MOVE	bpl1mod,$0			;modulo
		C_MOVE	bpl2mod,$0			;modulo
		C_MOVE	ddfstrt,$38
		C_MOVE	ddfstop,$d0
diw_strt	C_MOVE	diwstrt,$2881
diw_stop	C_MOVE	diwstop,$04c1

palette1	C_MOVE	color00,0
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
views_bplpt	C_MOVE	bpl1pth,0
		C_MOVE	bpl1ptl,0
		C_MOVE	bpl2pth,0
		C_MOVE	bpl2ptl,0
		C_MOVE	bpl3pth,0
		C_MOVE	bpl3ptl,0
		C_MOVE	bpl4pth,0
		C_MOVE	bpl4ptl,0
		C_MOVE	bpl5pth,0
		C_MOVE	bpl5ptl,0
		C_MOVE	bpl6pth,0
		C_MOVE	bpl6ptl,0

		C_WAIT	210,0,$fffe
		C_MOVE	dmacon,%0000000100000000
		C_WAIT	211,15,$fffe
		C_MOVE	color00,$dfe
		C_WAIT	212,0,$fffe

		C_MOVE  bplcon0,%1100000000000000
		C_MOVE  bplcon1,0
		C_MOVE  bpl1mod,0
		C_MOVE  bpl2mod,0
		C_MOVE  diwstrt,$2881
		C_MOVE  diwstop,$04c1
		C_MOVE  ddfstrt,$003c
		C_MOVE  ddfstop,$00d4

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
		C_MOVE	bpl6pth,0
		C_MOVE	bpl6ptl,0

		C_WAIT	14,0,$fffe
		C_MOVE	dmacon,%1000000100000000

		C_STOP
