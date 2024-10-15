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
clist_start
		C_MOVE	dmacon,%1000000000100000	;sprites on
		C_WAIT	10,0,$fffe

clist_sprites
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

		C_MOVE	bplcon0,%0101000000000000	;5 bitplanes
		C_MOVE	bplcon1,$33			;playfield scrolls
		C_MOVE	bplcon2,%0000000000100100       ;playfield priority
		C_MOVE	bpl1mod,0			;no modulo
		C_MOVE	bpl2mod,0			;no modulo
		C_MOVE	ddfstrt,$38
		C_MOVE	ddfstop,$cc
diw_strt
		C_MOVE	diwstrt,$2784
diw_stop
		C_MOVE	diwstop,$2cbf

views_palette
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
views_bplpt
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

col_wait1
		C_WAIT  50,0,$fffe
		C_MOVE	color08,$371
		C_MOVE	color09,$f00
		C_MOVE	color22,$d70
		C_MOVE	color26,$032
		C_MOVE	color27,$444
		C_MOVE	color28,$554
		C_MOVE	color30,$333
		C_MOVE	color31,$222

col_waits1
		C_WAIT  (53+0*4),0,$fffe
		C_MOVE	color06,$55c
		C_MOVE	color29,$654

		C_WAIT	(53+0*4),59,$80fe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+0*4),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+0*4),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+0*4+1),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+0*4+1),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+0*4+1),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+0*4+2),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+0*4+2),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+0*4+2),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+0*4+3),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+0*4+3),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+0*4+3),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet

		C_WAIT  (53+1*4),0,$fffe
		C_MOVE	color06,$75c
		C_MOVE	color22,$f0f

		C_WAIT	(53+1*4),59,$80fe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+1*4),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+1*4),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+1*4+1),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+1*4+1),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+1*4+1),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+1*4+2),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+1*4+2),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+1*4+2),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+1*4+3),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+1*4+3),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+1*4+3),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet

		C_WAIT  (53+2*4),0,$fffe
		C_MOVE	color06,$95c

		C_WAIT	(53+2*4),59,$80fe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+2*4),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+2*4),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+2*4+1),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+2*4+1),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+2*4+1),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+2*4+2),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+2*4+2),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+2*4+2),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+2*4+3),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+2*4+3),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+2*4+3),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet

		C_WAIT  (53+3*4),0,$fffe
		C_MOVE	color06,$b5c

		C_WAIT	(53+3*4),59,$80fe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+3*4),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+3*4),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+3*4+1),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+3*4+1),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+3*4+1),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+3*4+2),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+3*4+2),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+3*4+2),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+3*4+3),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+3*4+3),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+3*4+3),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet

		C_WAIT  (53+4*4),0,$fffe
		C_MOVE	color06,$c5b

		C_WAIT	(53+4*4),59,$80fe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+4*4),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+4*4),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+4*4+1),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+4*4+1),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+4*4+1),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+4*4+2),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+4*4+2),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+4*4+2),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+4*4+3),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+4*4+3),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+4*4+3),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet

		C_WAIT  (53+5*4),0,$fffe
		C_MOVE	color06,$c59

		C_WAIT	(53+5*4),59,$80fe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+5*4),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+5*4),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+5*4+1),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+5*4+1),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+5*4+1),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+5*4+2),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+5*4+2),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+5*4+2),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+5*4+3),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+5*4+3),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+5*4+3),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet

		C_WAIT  (53+6*4),0,$fffe
		C_MOVE	color06,$c57

		C_WAIT	(53+6*4),59,$80fe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+6*4),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+6*4),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+6*4+1),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+6*4+1),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+6*4+1),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+6*4+2),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+6*4+2),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+6*4+2),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+6*4+3),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+6*4+3),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+6*4+3),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet

		C_WAIT  (53+7*4),0,$fffe
		C_MOVE	color06,$c75

		C_WAIT	(53+7*4),59,$80fe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+7*4),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+7*4),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+7*4+1),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+7*4+1),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+7*4+1),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+7*4+2),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+7*4+2),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+7*4+2),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+7*4+3),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+7*4+3),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+7*4+3),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet

		C_WAIT  (53+8*4),0,$fffe
		C_MOVE	color06,$c75

		C_WAIT	(53+8*4),59,$80fe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+8*4),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+8*4),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+8*4+1),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+8*4+1),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+8*4+1),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+8*4+2),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+8*4+2),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+8*4+2),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+8*4+3),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+8*4+3),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+8*4+3),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet

		C_WAIT  (53+9*4),0,$fffe
		C_MOVE	color06,$cb5

		C_WAIT	(53+9*4),59,$80fe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+9*4),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+9*4),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+9*4+1),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+9*4+1),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+9*4+1),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+9*4+2),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+9*4+2),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+9*4+2),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+9*4+3),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+9*4+3),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+9*4+3),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet

		C_WAIT  (53+10*4),0,$fffe
		C_MOVE	color06,$bc5

		C_WAIT	(53+10*4),59,$80fe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+10*4),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+10*4),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+10*4+1),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+10*4+1),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+10*4+1),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+10*4+2),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+10*4+2),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+10*4+2),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+10*4+3),59,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(53+10*4+3),139,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(53+10*4+3),221,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$122			;planet

		C_WAIT  (53+11*4),0,$fffe
		C_MOVE	color06,$9c5

		C_WAIT  (53+12*4),0,$fffe
		C_MOVE	color06,$9c5

		C_WAIT  (53+13*4),0,$fffe
		C_MOVE	color06,$5c5

		C_WAIT  (53+14*4),0,$fffe
		C_MOVE	color06,$8fa

		C_WAIT  (53+15*4),0,$fffe
		C_MOVE	color06,$8fc

		C_WAIT  (53+16*4),0,$fffe
		C_MOVE	color06,$8fe

		C_WAIT  (53+17*4),0,$fffe
		C_MOVE	color06,$8ef

		C_WAIT  (53+18*4),0,$fffe
		C_MOVE	color06,$8cf

		C_WAIT	(53+19*4),0,$fffe
		C_MOVE	color06,$8af

		C_WAIT  (53+20*4),0,$fffe
		C_MOVE	color06,$88f
col_wait2
		C_WAIT  138,0,$fffe
		C_MOVE	color08,$4f4
		C_MOVE	color09,$f44
		C_MOVE	color25,$fff
		C_MOVE	color26,$100
		C_MOVE	color27,$900
		C_MOVE	color28,$700
		C_MOVE	color29,$fff
		C_MOVE	color30,$300
		C_MOVE	color31,$500

scrolly_wait1	C_WAIT	141,208,$fffe
		C_MOVE	diwstrt,$2771
		C_MOVE	ddfstrt,$30
		C_MOVE	bplcon0,%0010000000000000	;2 bitplanes
		C_MOVE	bplcon1,0			;no scroll
		C_MOVE	bplcon2,%0000000000100100       ;playfield priority
		C_MOVE	bpl1mod,4			;modulo
		C_MOVE	bpl2mod,4			;modulo
		C_MOVE	bpl1pth,0
		C_MOVE	bpl1ptl,0
		C_MOVE	bpl2pth,0
		C_MOVE	bpl2ptl,0
		C_MOVE	diwstop,$2cc7
		C_MOVE	ddfstop,$d8

		C_MOVE	color00,$156
		C_MOVE	color01,$aa3
		C_MOVE	color02,$ff0
		C_MOVE	color03,$f44
		C_MOVE	color17,$189
		C_MOVE	color18,$178
		C_MOVE	color19,$167

scrolly_wait4	C_WAIT	143,15,$fffe
		C_MOVE	color00,$145
		C_MOVE	color17,$178
		C_MOVE	color18,$167
		C_MOVE	color19,$156
scrolly_wait5	C_WAIT	144,15,$fffe
		C_MOVE	color00,$134
		C_MOVE	color17,$167
		C_MOVE	color18,$156
		C_MOVE	color19,$145
scrolly_wait6	C_WAIT	145,15,$fffe
		C_MOVE	color00,$124
		C_MOVE	color17,$157
		C_MOVE	color18,$146
		C_MOVE	color19,$135

scrolly_wait2	C_WAIT	150,0,$fffe

		C_MOVE	diwstrt,$2784
		C_MOVE	ddfstrt,$38
		C_MOVE	bplcon0,%0101000000000000	;5 bitplanes again
		C_MOVE	bplcon2,%0000000000100100       ;playfield priority
		C_MOVE	bpl1mod,0			;no modulo
		C_MOVE	bpl2mod,0			;no modulo
		C_MOVE	diwstop,$2cbf
		C_MOVE	ddfstop,$cc
		C_MOVE	color00,$000
		C_MOVE	color01,$edc
		C_MOVE	color02,$a98
		C_MOVE	color03,$654
		C_MOVE	color17,$8ba
		C_MOVE	color18,$487
		C_MOVE	color19,$255
		C_MOVE	bplcon1,$33			;scrolls

scrolly_wait3	C_WAIT	151,0,$fffe

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
col_wait3
		C_WAIT  163,0,$fffe
		C_MOVE	color08,$371
		C_MOVE	color09,$f00
		C_MOVE	color22,$d70
		C_MOVE	color25,$b23
		C_MOVE	color26,$032
		C_MOVE	color27,$444
		C_MOVE	color28,$554
		C_MOVE	color30,$333
		C_MOVE	color31,$222

col_waits2
		C_WAIT  (166+0*4),0,$fffe
		C_MOVE	color06,$55c
		C_MOVE	color29,$654

		C_WAIT	(166+0*4),97,$80fe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+0*4),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+0*4),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+0*4+1),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+0*4+1),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+0*4+1),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+0*4+2),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+0*4+2),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+0*4+2),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+0*4+3),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+0*4+3),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+0*4+3),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet

		C_WAIT  (166+1*4),0,$fffe
		C_MOVE	color06,$75c
		C_MOVE	color22,$f0f

		C_WAIT	(166+1*4),97,$80fe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+1*4),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+1*4),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+1*4+1),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+1*4+1),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+1*4+1),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+1*4+2),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+1*4+2),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+1*4+2),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+1*4+3),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+1*4+3),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+1*4+3),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet

		C_WAIT  (166+2*4),0,$fffe
		C_MOVE	color06,$95c

		C_WAIT	(166+2*4),97,$80fe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+2*4),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+2*4),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+2*4+1),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+2*4+1),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+2*4+1),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+2*4+2),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+2*4+2),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+2*4+2),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+2*4+3),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+2*4+3),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+2*4+3),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet

		C_WAIT  (166+3*4),0,$fffe
		C_MOVE	color06,$b5c

		C_WAIT	(166+3*4),97,$80fe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+3*4),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+3*4),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+3*4+1),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+3*4+1),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+3*4+1),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+3*4+2),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+3*4+2),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+3*4+2),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+3*4+3),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+3*4+3),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+3*4+3),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet

		C_WAIT  (166+4*4),0,$fffe
		C_MOVE	color06,$c5b

		C_WAIT	(166+4*4),97,$80fe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+4*4),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+4*4),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+4*4+1),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+4*4+1),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+4*4+1),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+4*4+2),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+4*4+2),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+4*4+2),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+4*4+3),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+4*4+3),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+4*4+3),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet

		C_WAIT  (166+5*4),0,$fffe
		C_MOVE	color06,$c59

		C_WAIT	(166+5*4),97,$80fe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+5*4),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+5*4),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+5*4+1),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+5*4+1),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+5*4+1),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+5*4+2),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+5*4+2),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+5*4+2),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+5*4+3),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+5*4+3),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+5*4+3),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet

		C_WAIT  (166+6*4),0,$fffe
		C_MOVE	color06,$c57

		C_WAIT	(166+6*4),97,$80fe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+6*4),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+6*4),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+6*4+1),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+6*4+1),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+6*4+1),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+6*4+2),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+6*4+2),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+6*4+2),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+6*4+3),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+6*4+3),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+6*4+3),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet

		C_WAIT  (166+7*4),0,$fffe
		C_MOVE	color06,$c75

		C_WAIT	(166+7*4),97,$80fe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+7*4),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+7*4),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+7*4+1),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+7*4+1),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+7*4+1),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+7*4+2),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+7*4+2),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+7*4+2),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+7*4+3),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+7*4+3),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+7*4+3),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet

		C_WAIT  (166+8*4),0,$fffe
		C_MOVE	color06,$c75

		C_WAIT	(166+8*4),97,$80fe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+8*4),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+8*4),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+8*4+1),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+8*4+1),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+8*4+1),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+8*4+2),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+8*4+2),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+8*4+2),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+8*4+3),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+8*4+3),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+8*4+3),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet

		C_WAIT  (166+9*4),0,$fffe
		C_MOVE	color06,$cb5

		C_WAIT	(166+9*4),97,$80fe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+9*4),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+9*4),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+9*4+1),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+9*4+1),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+9*4+1),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+9*4+2),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+9*4+2),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+9*4+2),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+9*4+3),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+9*4+3),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+9*4+3),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet

		C_WAIT  (166+10*4),0,$fffe
		C_MOVE	color06,$bc5

		C_WAIT	(166+10*4),97,$80fe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+10*4),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+10*4),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+10*4+1),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+10*4+1),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+10*4+1),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+10*4+2),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+10*4+2),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+10*4+2),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+10*4+3),97,$fffe
		C_MOVE	color16,$000			;planet
		C_MOVE	color00,$000
		C_WAIT	(166+10*4+3),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$000			;planet
		C_WAIT	(166+10*4+3),175,$80fe
		C_MOVE	color00,$000
		C_MOVE	color16,$122			;planet

		C_WAIT  (166+11*4),0,$fffe
		C_MOVE	color06,$9c5

		C_WAIT  (166+12*4),0,$fffe
		C_MOVE	color06,$9c5

		C_WAIT  (166+13*4),0,$fffe
		C_MOVE	color06,$5c5

		C_WAIT  (166+14*4),0,$fffe
		C_MOVE	color06,$8fa

		C_WAIT  (166+15*4),0,$fffe
		C_MOVE	color06,$8fc

		C_WAIT  (166+16*4),0,$fffe
		C_MOVE	color06,$8fe

		C_WAIT  (166+17*4),0,$fffe
		C_MOVE	color06,$8ef

		C_WAIT  (166+18*4),0,$fffe
		C_MOVE	color06,$8cf

		C_WAIT	(166+19*4),0,$fffe
		C_MOVE	color06,$8af

		C_WAIT  (166+20*4),0,$fffe
		C_MOVE	color06,$88f

col_wait4

		C_WAIT	251,0,$fffe
		C_MOVE	color08,$4f4
		C_MOVE	color09,$f44
		C_MOVE	color26,$100
		C_MOVE	color27,$900
		C_MOVE	color28,$700
		C_MOVE	color29,$fff
		C_MOVE	color30,$300
		C_MOVE	color31,$500

		C_WAIT  255,0,$fffe
		C_MOVE	bplcon0,%0000000000000000	;no bitplane
		C_MOVE	dmacon,%0000000000100000	;no sprites
		C_MOVE	spr0ctl,$0
		C_MOVE	spr1ctl,$0
		C_MOVE	spr2ctl,$0
		C_MOVE	spr3ctl,$0
		C_MOVE	spr4ctl,$0
		C_MOVE	spr5ctl,$0
		C_MOVE	spr6ctl,$0
		C_MOVE	spr7ctl,$0

		C_MOVE	intreq,%1000000000010000	;copper interrupt

		C_WAIT  255,225,$fffe			;10

		C_WAIT  3+1,15,$fffe			;12
		C_MOVE	color00,$001

		C_WAIT  3+8,15,$fffe			;14
		C_MOVE	color00,$002
		C_WAIT	3+9,15,$fffe			;15
		C_MOVE	color00,$001
		C_WAIT  3+10,15,$fffe			;16
		C_MOVE	color00,$002
		C_MOVE	color01,$667

		C_MOVE	ddfstrt,$30
		C_MOVE	ddfstop,$d8
		C_MOVE	bplcon0,%0001000000000000	;1 bitplane
		C_MOVE	bplcon1,$000f			;no scroll
		C_MOVE	bpl1mod,$fffd			;modulo
		C_MOVE	bpl2mod,$fffd			;modulo
		C_MOVE	bpl1pth,0
		C_MOVE	bpl1ptl,0

		C_WAIT  3+11,15,$fffe			;27
		C_MOVE	color01,$446

		C_WAIT  3+13,15,$fffe			;29
		C_MOVE	color01,$335

		C_WAIT  3+15,15,$fffe			;31
		C_MOVE	color01,$224

		C_WAIT  3+16,15,$fffe			;33
		C_MOVE	color00,$003
		C_WAIT  3+17,15,$fffe			;35
		C_MOVE	color01,$113
		C_MOVE	color00,$002
		C_WAIT  3+18,15,$fffe			;38
		C_MOVE	color00,$003

		C_WAIT  3+19,15,$fffe			;40
		C_MOVE	color01,$223

		C_WAIT  3+21,15,$fffe			;42
		C_MOVE	color01,$444

		C_WAIT  3+23,15,$fffe			;44
		C_MOVE	color00,$004
		C_WAIT  3+24,15,$fffe			;46
		C_MOVE	color00,$003
		C_WAIT  3+25,15,$fffe			;48
		C_MOVE	color00,$004

		C_MOVE	bplcon0,%0000000000000000	;no bitplane

		C_WAIT  3+29,15,$fffe			;51
		C_MOVE	color00,$005
		C_WAIT  3+30,15,$fffe			;53
		C_MOVE	color00,$004
		C_WAIT  3+31,15,$fffe			;55
		C_MOVE	color00,$005

		C_WAIT  3+34,15,$fffe			;57
		C_MOVE	color00,$006
		C_WAIT  3+35,15,$fffe			;59
		C_MOVE	color00,$005
		C_WAIT  3+36,15,$fffe			;61
		C_MOVE	color00,$006

		C_WAIT  3+38,15,$fffe			;63
		C_MOVE	color00,$007
		C_WAIT  3+39,15,$fffe			;65
		C_MOVE	color00,$006
		C_WAIT  3+40,15,$fffe			;67
		C_MOVE	color00,$007

		C_WAIT  3+41,15,$fffe			;69
		C_MOVE	color00,$008
		C_WAIT  3+42,15,$fffe			;71
		C_MOVE	color00,$007
		C_WAIT  3+43,15,$fffe			;73
		C_MOVE	color00,$008

		C_STOP
