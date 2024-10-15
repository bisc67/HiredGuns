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

clist_start	C_WAIT	5,0,$fffe
		C_MOVE  dmacon,%1000000000100000	;sprite dma on
		C_MOVE	bplcon3,0
		C_MOVE	bplcon4,$0044
		C_MOVE	fmode,%0000000000000001		;32 bit plane fetch

clist_sprites	C_MOVE	spr0ptl,0			;sprite pointers
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

		C_MOVE	bplcon0,%1000100000010000	;8 bitplanes + HAM + hires
		C_MOVE	bplcon1,0			;playfield scrolls
		C_MOVE	bplcon2,%0000000000100100       ;playfield priority
		C_MOVE	bpl1mod,44			;modulo
		C_MOVE	bpl2mod,44			;modulo
		C_MOVE	ddfstrt,7<<3
		C_MOVE	ddfstop,25<<3
diw_strt	C_MOVE	diwstrt,$2992
diw_stop	C_MOVE	diwstop,$fda2

		C_BANK	64,HI
		C_MOVE	color00,$000
		C_MOVE	color01,$dfe
		C_MOVE	color02,$aec
		C_MOVE	color03,$000
		C_MOVE	color04,$000
		C_MOVE	color05,$dfe
		C_MOVE	color06,$fff
		C_MOVE	color07,$000
		C_MOVE	color08,$000
		C_MOVE	color09,$f22
		C_MOVE	color10,$2f2
		C_MOVE	color11,$000
		C_MOVE	color12,$000
		C_MOVE	color13,$f22
		C_MOVE	color14,$2f2
		C_MOVE	color15,$000

		C_BANK	0,HI
map_palette1	C_MOVE	color00,$000
		C_MOVE	color01,$dee
		C_MOVE	color02,$212
		C_MOVE	color03,$312
		C_MOVE	color04,$323
		C_MOVE	color05,$343
		C_MOVE	color06,$334
		C_MOVE	color07,$443
		C_MOVE	color08,$535
		C_MOVE	color09,$453
		C_MOVE	color10,$246
		C_MOVE	color11,$643
		C_MOVE	color12,$564
		C_MOVE	color13,$573
		C_MOVE	color14,$663
		C_MOVE	color15,$645
		C_MOVE	color16,$547
		C_MOVE	color17,$574
		C_MOVE	color18,$267
		C_MOVE	color19,$765
		C_MOVE	color20,$684
		C_MOVE	color21,$558
		C_MOVE	color22,$657
		C_MOVE	color23,$675
		C_MOVE	color24,$873
		C_MOVE	color25,$694
		C_MOVE	color26,$777
		C_MOVE	color27,$885
		C_MOVE	color28,$668
		C_MOVE	color29,$867
		C_MOVE	color30,$795
		C_MOVE	color31,$9a3

		C_BANK	0,LO
map_palette2	C_MOVE	color00,$000
		C_MOVE	color01,$fb3
		C_MOVE	color02,$8cc
		C_MOVE	color03,$8cc
		C_MOVE	color04,$c0c
		C_MOVE	color05,$410
		C_MOVE	color06,$c0d
		C_MOVE	color07,$518
		C_MOVE	color08,$181
		C_MOVE	color09,$9d4
		C_MOVE	color10,$8d5
		C_MOVE	color11,$51c
		C_MOVE	color12,$11d
		C_MOVE	color13,$154
		C_MOVE	color14,$d10
		C_MOVE	color15,$d9d
		C_MOVE	color16,$195
		C_MOVE	color17,$995
		C_MOVE	color18,$cd9
		C_MOVE	color19,$11d
		C_MOVE	color20,$521
		C_MOVE	color21,$9d2
		C_MOVE	color22,$d95
		C_MOVE	color23,$dd9
		C_MOVE	color24,$e90
		C_MOVE	color25,$da5
		C_MOVE	color26,$191
		C_MOVE	color27,$629
		C_MOVE	color28,$d9e
		C_MOVE	color29,$ad1
		C_MOVE	color30,$ded
		C_MOVE	color31,$660

		C_BANK	32,HI
map_palette3	C_MOVE	color00,$797
		C_MOVE	color01,$779
		C_MOVE	color02,$996
		C_MOVE	color03,$879
		C_MOVE	color04,$b94
		C_MOVE	color05,$979
		C_MOVE	color06,$998
		C_MOVE	color07,$8a8
		C_MOVE	color08,$ba6
		C_MOVE	color09,$b78
		C_MOVE	color10,$a98
		C_MOVE	color11,$89b
		C_MOVE	color12,$bb4
		C_MOVE	color13,$9b8
		C_MOVE	color14,$99b
		C_MOVE	color15,$b99
		C_MOVE	color16,$a9a
		C_MOVE	color17,$cb6
		C_MOVE	color18,$aba
		C_MOVE	color19,$a9b
		C_MOVE	color20,$bc8
		C_MOVE	color21,$bba
		C_MOVE	color22,$caa
		C_MOVE	color23,$abc
		C_MOVE	color24,$dc7
		C_MOVE	color25,$cbb
		C_MOVE	color26,$bcc
		C_MOVE	color27,$cbc
		C_MOVE	color28,$cdc
		C_MOVE	color29,$dcd
		C_MOVE	color30,$ddb
		C_MOVE	color31,$ced

		C_BANK	32,LO
map_palette4	C_MOVE	color00,$d6d
		C_MOVE	color01,$9da
		C_MOVE	color02,$2e1
		C_MOVE	color03,$a9a
		C_MOVE	color04,$2a9
		C_MOVE	color05,$ed2
		C_MOVE	color06,$26a
		C_MOVE	color07,$ea2
		C_MOVE	color08,$221
		C_MOVE	color09,$6d6
		C_MOVE	color10,$aea
		C_MOVE	color11,$666
		C_MOVE	color12,$2ad
		C_MOVE	color13,$2e6
		C_MOVE	color14,$2a6
		C_MOVE	color15,$a62
		C_MOVE	color16,$a66
		C_MOVE	color17,$7a9
		C_MOVE	color18,$266
		C_MOVE	color19,$aea
		C_MOVE	color20,$6b2
		C_MOVE	color21,$22e
		C_MOVE	color22,$7ae
		C_MOVE	color23,$e27
		C_MOVE	color24,$bbd
		C_MOVE	color25,$fa6
		C_MOVE	color26,$2b3
		C_MOVE	color27,$3af
		C_MOVE	color28,$7b3
		C_MOVE	color29,$737
		C_MOVE	color30,$f7a
		C_MOVE	color31,$b37

		C_BANK	0,HI
		C_WAIT	15,0,$fffe
views_bplpt
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

		C_WAIT	195,0,$fffe
		C_MOVE	bplcon0,%0000000000000001	;no bitplanes, no ham
		C_MOVE	color00,$dfe

		C_WAIT	195,160,$fffe

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

		C_MOVE	bplcon0,%1000100000010000	;8 bitplanes + ham + hires
		C_SET24	0,0,0,0

		C_WAIT	201,0,$fffe
		C_MOVE  dmacon,%0000000100100000	;bitplane & sprite dma off
		C_MOVE	spr0ctl,0
		C_MOVE	spr1ctl,0
		C_MOVE	spr2ctl,0
		C_MOVE	spr3ctl,0
		C_MOVE	spr4ctl,0
		C_MOVE	spr5ctl,0
		C_MOVE	spr6ctl,0
		C_MOVE	spr7ctl,0

		C_WAIT	202,15,$fffe
		C_MOVE	color00,$dfe

		C_WAIT	203,0,$fffe
		C_MOVE	bplcon0,%1100000000000000	;4 bitplanes
		C_MOVE	bplcon1,0			;playfield scrolls
		C_MOVE	bpl1mod,0			;no modulo
		C_MOVE	bpl2mod,0			;no modulo
		C_MOVE	diwstrt,$2981
		C_MOVE	diwstop,$ffc1
		C_MOVE	ddfstrt,7<<3
		C_MOVE	ddfstop,26<<3

		C_MOVE	intreq,%1000000000010000	;copper interrupt

map_palette5	C_MOVE	color00,0
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

views2_bplpt	C_MOVE	bpl1pth,0
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

		C_WAIT	202,0,$fffe
		C_MOVE  dmacon,%1000000100000000	;bitplane dma on

		C_STOP
