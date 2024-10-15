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

COL		MACRO
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

haze_red	equ	40
haze_green	equ	50
haze_blu	equ	55

contrast_red	equ     22
contrast_green	equ     24
contrast_blu	equ     26

COL1		MACRO
red		set	(\2)<<4
green		set	(\3)<<4
blu		set	(\4)<<4

red		set	(red*30)/contrast_red
green		set	(green*30)/contrast_green
blu		set	(blu*30)/contrast_blu

red		set	red+haze_red
green		set	green+haze_green
blu		set	blu+haze_blu

red		set	red>>4
green		set	green>>4
blu		set	blu>>4

	IFGT	red-15
red		set     15
	ENDC
	IFGT	green-15
green		set	15
	ENDC
	IFGT	blu-15
blu		set     15
	ENDC
		C_MOVE	\1,(red<<8)|(green<<4)|blu
        	ENDM

COL2		MACRO
red		set	(\2)<<4
green		set	(\3)<<4
blu		set	(\4)<<4

red		set	(red*30)/contrast_red
green		set	(green*30)/contrast_green
blu		set	(blu*30)/contrast_blu

red		set	red+haze_red
green		set	green+haze_green
blu		set	blu+haze_blu

red		set	red&$f
green		set	green&$f
blu		set	blu&$f

	IFGT	red-15
red		set     15
	ENDC
	IFGT	green-15
green		set	15
	ENDC
	IFGT	blu-15
blu		set     15
	ENDC
		C_MOVE	\1,(red<<8)|(green<<4)|blu
        	ENDM

********************************************************************************
********************************** Copper List *********************************
********************************************************************************

		even
clist_start
		C_MOVE	bplcon0,%0110000000000001	;6 bitplanes + ~ecsena

		C_BANK	32,HI
		COL1	color00,$0,$0,$0
		COL1	color01,$e,$d,$c
		COL1	color02,$a,$9,$8
		COL1	color03,$6,$5,$4
		COL1	color04,$4,$3,$2
		COL1	color05,$0,$0,$0
		COL1	color06,$f,$f,$f
		COL1	color07,$2,$5,$1
		COL1	color08,$3,$7,$1
		C_MOVE	color09,$f95
		COL1	color10,$1,$3,$0
		COL1	color11,$6,$2,$0
		COL1	color12,$8,$4,$1
		COL1	color13,$9,$6,$2
		COL1	color14,$4,$0,$0
		COL1	color15,$3,$0,$0
		COL1	color16,$1,$2,$2
		COL1	color17,$8,$b,$a
		COL1	color18,$4,$8,$7
		COL1	color19,$2,$5,$5
		COL1	color20,$0,$3,$3
		COL1	color21,$1,$2,$2
		COL1	color22,$d,$7,$0
		COL1	color23,$0,$5,$2
		COL1	color24,$0,$7,$2
		COL1	color25,$b,$2,$3
		COL1	color26,$0,$3,$2
		COL1	color27,$4,$4,$4
		COL1	color28,$5,$5,$4
		COL1	color29,$6,$5,$4
		COL1	color30,$3,$3,$3
		COL1	color31,$2,$2,$2
		C_BANK	32,LO
		COL2	color00,$0,$0,$0
		COL2	color01,$e,$d,$c
		COL2	color02,$a,$9,$8
		COL2	color03,$6,$5,$4
		COL2	color04,$4,$3,$2
		COL2	color05,$0,$0,$0
		COL2	color06,$f,$f,$f
		COL2	color07,$2,$5,$1
		COL2	color08,$3,$7,$1
		C_MOVE	color09,$ffa
		COL2	color10,$1,$3,$0
		COL2	color11,$6,$2,$0
		COL2	color12,$8,$4,$1
		COL2	color13,$9,$6,$2
		COL2	color14,$4,$0,$0
		COL2	color15,$3,$0,$0
		COL2	color16,$1,$2,$2
		COL2	color17,$8,$b,$a
		COL2	color18,$4,$8,$7
		COL2	color19,$2,$5,$5
		COL2	color20,$0,$3,$3
		COL2	color21,$1,$2,$2
		COL2	color22,$d,$7,$0
		COL2	color23,$0,$5,$2
		COL2	color24,$0,$7,$2
		COL2	color25,$b,$2,$3
		COL2	color26,$0,$3,$2
		COL2	color27,$4,$4,$4
		COL2	color28,$5,$5,$4
		COL2	color29,$6,$5,$4
		COL2	color30,$3,$3,$3
		COL2	color31,$2,$2,$2

		C_MOVE	dmacon,%1000000000100000	;sprites on
		C_MOVE	fmode,%0000000000000111		;sprites & bpl 32 bit fetch
		C_WAIT	10,0,$fffe

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

		C_MOVE	bplcon3,%0000000000000000
		C_MOVE	bplcon4,%0000000001000100	;sprite colours 64-95
		C_MOVE	bplcon1,$33			;playfield scrolls
		C_MOVE	bplcon2,%0000001000100100       ;playfield priority + killehb
		C_MOVE	bpl1mod,-8			;modulo
		C_MOVE	bpl2mod,-8			;modulo
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

		C_SET24_QUICK	64+0+1,208,229,255		;mice
		C_SET24_QUICK	64+0+2,136,148,190
		C_SET24_QUICK	64+0+3,80,80,128

		C_SET24_QUICK	64+4+1,241,255,243		;muzzle flash
		C_SET24_QUICK	64+4+2,139,246,156
		C_SET24_QUICK	64+4+3,0,171,15

		C_SET24_QUICK	64+8+1,255,255,255		;muzzle hit + digits
		C_SET24_QUICK	64+8+2,0,0,0
		C_SET24_QUICK	64+8+3,255,185,171

		C_SET24_QUICK	64+12+1,255,255,255		;fitness flash
		C_SET24_QUICK	64+12+2,255,255,255
		C_SET24_QUICK	64+12+3,255,225,255

		C_BANK	0,HI

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
		C_MOVE	bpl6pth,0
		C_MOVE	bpl6ptl,0

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

		C_SKY4	53,0

		C_WAIT  (53+1*4),0,$fffe
		C_MOVE	color06,$75c
		C_MOVE	color22,$657

		C_SKY4	53,1

		C_WAIT  (53+2*4),0,$fffe
		C_MOVE	color06,$95c

		C_SKY4	53,2

		C_WAIT  (53+3*4),0,$fffe
		C_MOVE	color06,$b5c

		C_SKY4	53,3

		C_WAIT  (53+4*4),0,$fffe
		C_MOVE	color06,$c5b

		C_SKY4	53,4

		C_WAIT  (53+5*4),0,$fffe
		C_MOVE	color06,$c59

		C_SKY4	53,5

		C_WAIT  (53+6*4),0,$fffe
		C_MOVE	color06,$c57

		C_SKY4	53,6

		C_WAIT  (53+7*4),0,$fffe
		C_MOVE	color06,$c75

		C_SKY4	53,7

		C_WAIT  (53+8*4),0,$fffe
		C_MOVE	color06,$c75

		C_SKY4	53,8

		C_WAIT  (53+9*4),0,$fffe
		C_MOVE	color06,$cb5

		C_SKY4	53,9

		C_WAIT  (53+10*4),0,$fffe
		C_MOVE	color06,$bc5

		C_SKY4	53,10

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
		C_MOVE	fmode,%0000000000000100		;sprites 32 bit fetch
		C_MOVE	bplcon0,%0010000000000001	;2 bitplanes + ~ecsena
		C_MOVE	bplcon3,%0000000000000000	;border blank off
		C_MOVE	bplcon1,0			;no scroll
		C_MOVE	bplcon2,%0000001000100100       ;playfield priority
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
		C_MOVE	fmode,%0000000000000111		;sprites & bpl 32 bit fetch
		C_MOVE	bplcon0,%0110000000000001	;5 bitplanes again + ~ecsena
		C_MOVE	bplcon3,%0000000000000000
		C_MOVE	bplcon2,%0000001000100100       ;playfield priority
		C_MOVE	bpl1mod,-8			;no modulo
		C_MOVE	bpl2mod,-8			;no modulo
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
		C_MOVE	bpl6pth,0
		C_MOVE	bpl6ptl,0
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

		C_SKY4	166,0

		C_WAIT  (166+1*4),0,$fffe
		C_MOVE	color06,$75c
		C_MOVE	color22,$f0f

		C_SKY4	166,1

		C_WAIT  (166+2*4),0,$fffe
		C_MOVE	color06,$95c

		C_SKY4	166,2

		C_WAIT  (166+3*4),0,$fffe
		C_MOVE	color06,$b5c

		C_SKY4	166,3

		C_WAIT  (166+4*4),0,$fffe
		C_MOVE	color06,$c5b

		C_SKY4	166,4

		C_WAIT  (166+5*4),0,$fffe
		C_MOVE	color06,$c59

		C_SKY4	166,5

		C_WAIT  (166+6*4),0,$fffe
		C_MOVE	color06,$c57

		C_SKY4	166,6

		C_WAIT  (166+7*4),0,$fffe
		C_MOVE	color06,$c75

		C_SKY4	166,7

		C_WAIT  (166+8*4),0,$fffe
		C_MOVE	color06,$c75

		C_SKY4	166,8

		C_WAIT  (166+9*4),0,$fffe
		C_MOVE	color06,$cb5

		C_SKY4	166,9

		C_WAIT  (166+10*4),0,$fffe
		C_MOVE	color06,$bc5

		C_SKY4	166,10

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
		C_MOVE	bplcon0,%0000000000000001	;no bitplane + ~ecsena
		C_MOVE	bplcon3,%0000000000000000	;border blank off
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
		C_SET24	0,0,0,3

		C_WAIT  3+3,15,$fffe			;14
		C_SET24	0,0,0,6
		C_WAIT	3+5,15,$fffe			;15
		C_SET24	0,0,0,9
		C_WAIT  3+7,15,$fffe			;16
		C_SET24	0,0,0,12
		C_WAIT  3+9,15,$fffe			;16
		C_SET24	0,0,0,15

		C_WAIT  3+10,15,$fffe			;16
		C_MOVE	color01,$889

		C_MOVE	ddfstrt,$30
		C_MOVE	ddfstop,$d8
		C_MOVE	fmode,%0000000000000000		;16 bit fetch
		C_MOVE	bplcon0,%0001000000000001	;1 bitplane + ~ecsena
		C_MOVE	bplcon1,$000f			;no scroll
		C_MOVE	bpl1mod,-4			;modulo
		C_MOVE	bpl2mod,-4			;modulo
		C_MOVE	bpl1pth,0
		C_MOVE	bpl1ptl,0

		C_WAIT  3+11,15,$fffe			;27
		C_MOVE	color01,$668
		C_SET24	0,0,0,18

		C_WAIT  3+13,15,$fffe			;29
		C_MOVE	color01,$557
		C_SET24	0,0,0,21

		C_WAIT  3+15,15,$fffe			;31
		C_MOVE	color01,$446
		C_SET24	0,0,0,24

		C_WAIT  3+16,15,$fffe			;35
		C_MOVE	color01,$335

		C_WAIT  3+17,15,$fffe			;35
		C_SET24	0,0,0,27

		C_WAIT  3+19,15,$fffe			;38
		C_MOVE	color01,$445
		C_SET24	0,0,0,30

		C_WAIT  3+21,15,$fffe			;42
		C_MOVE	color01,$666
		C_SET24	0,0,0,33

		C_WAIT  3+23,15,$fffe			;42
		C_SET24	0,0,0,36

		C_WAIT  3+25,15,$fffe			;46
		C_SET24	0,0,0,39

		C_MOVE	bplcon0,%0000000000000001	;no bitplane + ~ecsena

		C_WAIT  3+27,15,$fffe			;48
		C_SET24	0,0,0,42

		C_WAIT  3+29,15,$fffe			;57
		C_SET24	0,0,0,45
		C_WAIT  3+31,15,$fffe			;59
		C_SET24	0,0,0,48
		C_WAIT  3+33,15,$fffe			;61
		C_SET24	0,0,0,51

		C_WAIT  3+35,15,$fffe			;63
		C_SET24	0,0,0,54
		C_WAIT  3+37,15,$fffe			;65
		C_SET24	0,0,0,57
		C_WAIT  3+39,15,$fffe			;67
		C_SET24	0,0,0,60

		C_WAIT  3+41,15,$fffe			;69
		C_SET24	0,0,0,63
		C_WAIT  3+43,15,$fffe			;71
		C_SET24	0,0,0,66
		C_WAIT  3+45,15,$fffe			;73
		C_SET24	0,0,0,69

		C_STOP
