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

		C_WAIT	0,0,$fffe

		C_MOVE	bplcon0,%1011000000000100	;3 bitplanes & interlace
		C_MOVE	bplcon1,0			;no playfield scrolls
		C_MOVE	bplcon2,%0000000000000000       ;sprites behind playfield
		C_MOVE	bpl1mod,80			;interlace modulo
		C_MOVE	bpl2mod,80			;no modulo
		C_MOVE	ddfstrt,$3c
		C_MOVE	ddfstop,$d4
		C_MOVE	diwstrt,$6e81
		C_MOVE	diwstop,$b6c1

		C_MOVE	bpl1pth,0
		C_MOVE	bpl1ptl,0
		C_MOVE	bpl2pth,0
		C_MOVE	bpl2ptl,0
		C_MOVE	bpl3pth,0
		C_MOVE	bpl3ptl,0

		C_MOVE	color00,0
		C_MOVE	color01,0
		C_MOVE	color02,0
		C_MOVE	color03,0
		C_MOVE	color04,0
		C_MOVE	color05,0
		C_MOVE	color06,0
		C_MOVE	color07,0

posn    set     100
		C_WAIT	posn,15,$fffe
		C_MOVE	color00,0
		C_WAIT	(posn+1),15,$fffe
		C_MOVE	color00,0
		C_WAIT	(posn+2),15,$fffe
		C_MOVE	color00,0

		C_WAIT	(posn+3),15,$fffe
		C_MOVE	color00,0

posn    set     179
		C_WAIT	posn,15,$fffe
		C_MOVE	color00,0
		C_WAIT	(posn+1),15,$fffe
		C_MOVE	color00,0
		C_WAIT	(posn+2),15,$fffe
		C_MOVE	color00,0
		C_WAIT	(posn+3),15,$fffe
		C_MOVE	color00,0

		C_MOVE	cop1lcl,0
		C_MOVE	cop1lch,0	;point to next copper list

		C_STOP

		ENDR

                end
