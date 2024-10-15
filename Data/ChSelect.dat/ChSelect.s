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

                REPT 2

		C_WAIT	15,0,$fffe

		C_MOVE	bplcon0,%0101000000000100	;5 bitplanes hires lace
		C_MOVE	bplcon1,0			;no playfield scrolls
		C_MOVE	bplcon2,%0000000000000000       ;sprites behind playfield
		C_MOVE	bpl1mod,258+24
		C_MOVE	bpl2mod,258+24
		C_MOVE	ddfstrt,6<<3
		C_MOVE	ddfstop,26<<3
		C_MOVE	diwstrt,$2185
		C_MOVE	diwstop,$ffb8

		C_MOVE	bpl1pth,0
		C_MOVE	bpl1ptl,0
		C_MOVE	bpl2pth,0
		C_MOVE	bpl2ptl,0
		C_MOVE	bpl3pth,0
		C_MOVE	bpl3ptl,0
		C_MOVE	bpl4pth,0
		C_MOVE	bpl4ptl,0

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

		C_MOVE	cop1lcl,0
		C_MOVE	cop1lch,0

		C_WAIT	0,218,$80fe
		C_MOVE	bpl5pth,0
		C_MOVE	bpl5ptl,0
		C_LOOP	128,0,$fe01

		C_MOVE	cop1lcl,0
		C_MOVE	cop1lch,0

		C_WAIT	128,218,$80fe
		C_MOVE	bpl5pth,0
		C_MOVE	bpl5ptl,0
		C_LOOP	147,0,$fe01

		C_MOVE  dmacon,%0000000100000000	;bitplane dma off
		C_WAIT	149,15,$fffe
		C_MOVE	color00,$dfe
		C_WAIT	150,15,$fffe
		C_MOVE	color00,$000

		C_MOVE	bplcon0,%1100000000000100	;4 bitplanes & interlace
		C_MOVE	bplcon1,0			;no playfield scrolls
		C_MOVE	bplcon2,%0000000000000000	;sprites behind playfield
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

		C_WAIT	149,0,$fffe
		C_MOVE  dmacon,%1000000100000000	;bitplane dma on

		C_MOVE	cop1lcl,0
		C_MOVE	cop1lch,0	;point to next copper list

		C_MOVE	intreq,%1000000000010000	;copper interrupt

		C_STOP

		ENDR

		end
