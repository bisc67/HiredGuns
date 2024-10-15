	IFND	HARDWARE_CUSTOM_I
HARDWARE_CUSTOM_I	SET	1
**
**	$Filename: hardware/custom.i $
**	$Release: 2.02 $
**	$Revision: 36.5 $
**	$Date: 90/11/05 $
**
**	Offsets of Amiga custom chip registers
**
**	(C) Copyright 1985,1986,1987,1988,1989,1990 Commodore-Amiga, Inc.
**	    All Rights Reserved
**

*
* do this to get base of custom registers:
*  XREF _custom;
*

bltddat     EQU   $000
dmaconr     EQU   $002
vposr	    EQU   $004
vhposr	    EQU   $006
dskdatr     EQU   $008
joy0dat     EQU   $00A
joy1dat     EQU   $00C
clxdat	    EQU   $00E

adkconr     EQU   $010
pot0dat     EQU   $012
pot1dat     EQU   $014
potgor	    EQU   $016
serdatr     EQU   $018
dskbytr     EQU   $01A
intenar     EQU   $01C
intreqr     EQU   $01E

dskpt	    EQU   $020
dsklen	    EQU   $024
dskdat	    EQU   $026
refptr	    EQU   $028
vposw	    EQU   $02A
vhposw	    EQU   $02C
copcon	    EQU   $02E
serdat	    EQU   $030
serper	    EQU   $032
potgo	    EQU   $034
joytest     EQU   $036
strequ	    EQU   $038
strvbl	    EQU   $03A
strhor	    EQU   $03C
strlong     EQU   $03E

bltcon0     EQU   $040
bltcon1     EQU   $042
bltafwm     EQU   $044
bltalwm     EQU   $046
bltcpt	    EQU   $048
bltbpt	    EQU   $04C
bltapt	    EQU   $050
bltdpt	    EQU   $054
bltsize     EQU   $058
bltcon0l    EQU   $05B		; note: byte access only
bltsizv     EQU   $05C
bltsizh     EQU   $05E

bltcmod     EQU   $060
bltbmod     EQU   $062
bltamod     EQU   $064
bltdmod     EQU   $066

bltcdat     EQU   $070
bltbdat     EQU   $072
bltadat     EQU   $074

deniseid    EQU   $07C
dsksync     EQU   $07E

cop1lc	    EQU   $080
cop2lc	    EQU   $084
copjmp1     EQU   $088
copjmp2     EQU   $08A
copins	    EQU   $08C
diwstrt     EQU   $08E
diwstop     EQU   $090
ddfstrt     EQU   $092
ddfstop     EQU   $094
dmacon	    EQU   $096
clxcon	    EQU   $098
intena	    EQU   $09A
intreq	    EQU   $09C
adkcon	    EQU   $09E

aud	    EQU   $0A0
aud0	    EQU   $0A0
aud1	    EQU   $0B0
aud2	    EQU   $0C0
aud3	    EQU   $0D0

* AudChannel
ac_ptr	    EQU   $00	; ptr to start of waveform data
ac_len	    EQU   $04	; length of waveform in words
ac_per	    EQU   $06	; sample period
ac_vol	    EQU   $08	; volume
ac_dat	    EQU   $0A	; sample pair
ac_SIZEOF   EQU   $10

bplpt	    EQU   $0E0

bplcon0     EQU   $100
bplcon1     EQU   $102
bplcon2     EQU   $104
bplcon3     EQU   $106
bplcon4     EQU   $10c
bpl1mod     EQU   $108
bpl2mod     EQU   $10A

sprpt	    EQU   $120

spr	    EQU   $140

* SpriteDef
sd_pos	    EQU   $00
sd_ctl	    EQU   $02
sd_dataa    EQU   $04
sd_dataB    EQU   $06
sd_SIZEOF   EQU   $08

color	    EQU   $180

htotal	    EQU   $1c0
hsstop	    EQU   $1c2
hbstrt	    EQU   $1c4
hbstop	    EQU   $1c6
vtotal	    EQU   $1c8
vsstop	    EQU   $1ca
vbstrt	    EQU   $1cc
vbstop	    EQU   $1ce
sprhstrt    EQU   $1d0
sprhstop    EQU   $1d2
bplhstrt    EQU   $1d4
bplhstop    EQU   $1d6
hhposw	    EQU   $1d8
hhposr	    EQU   $1da
beamcom0    EQU   $1dc
hsstrt	    EQU   $1de
vsstrt	    EQU   $1e0
hcenter     EQU   $1e2
diwhigh     EQU   $1e4

   ENDC  !HARDWARE_CUSTOM_I

custom	equ	$dff000

dskpth	equ	dskpt
dskptl	equ	dskpt+$02

bltcpth	equ	bltcpt
bltcptl	equ	bltcpt+$02
bltbpth	equ	bltbpt
bltbptl	equ	bltbpt+$02
bltapth	equ	bltapt
bltaptl	equ	bltapt+$02
bltdpth	equ	bltdpt
bltdptl	equ	bltdpt+$02

cop1lch	equ	cop1lc
cop1lcl	equ	cop1lc+$02
cop2lch	equ	cop2lc
cop2lcl	equ	cop2lc+$02

aud0lc	equ	aud0
aud0lch	equ	aud0
aud0lcl	equ	aud0+$02
aud0len	equ	aud0+$04
aud0per	equ	aud0+$06
aud0vol	equ	aud0+$08
aud0dat	equ	aud0+$0A

aud1lc	equ	aud1
aud1lch	equ	aud1
aud1lcl	equ	aud1+$02
aud1len	equ	aud1+$04
aud1per	equ	aud1+$06
aud1vol	equ	aud1+$08
aud1dat	equ	aud1+$0A

aud2lc	equ	aud2
aud2lch	equ	aud2
aud2lcl	equ	aud2+$02
aud2len	equ	aud2+$04
aud2per	equ	aud2+$06
aud2vol	equ	aud2+$08
aud2dat	equ	aud2+$0A

aud3lc	equ	aud3
aud3lch	equ	aud3
aud3lcl	equ	aud3+$02
aud3len	equ	aud3+$04
aud3per	equ	aud3+$06
aud3vol	equ	aud3+$08
aud3dat	equ	aud3+$0A

bpl1pt	equ	bplpt+$00
bpl1pth	equ	bplpt+$00
bpl1ptl	equ	bplpt+$02
bpl2pt	equ	bplpt+$04
bpl2pth	equ	bplpt+$04
bpl2ptl	equ	bplpt+$06
bpl3pt	equ	bplpt+$08
bpl3pth	equ	bplpt+$08
bpl3ptl	equ	bplpt+$0A
bpl4pt	equ	bplpt+$0C
bpl4pth	equ	bplpt+$0C
bpl4ptl	equ	bplpt+$0E
bpl5pt	equ	bplpt+$10
bpl5pth	equ	bplpt+$10
bpl5ptl	equ	bplpt+$12
bpl6pt	equ	bplpt+$14
bpl6pth	equ	bplpt+$14
bpl6ptl	equ	bplpt+$16
bpl7pt	equ	bplpt+$18
bpl7pth	equ	bplpt+$18
bpl7ptl	equ	bplpt+$1a
bpl8pt	equ	bplpt+$1c
bpl8pth	equ	bplpt+$1c
bpl8ptl	equ	bplpt+$1e

bpldat		equ	$110

dpl1data	equ	bpldat+$00
dpl2data	equ	bpldat+$02
dpl3data	equ	bpldat+$04
dpl4data	equ	bpldat+$06
dpl5data	equ	bpldat+$08
dpl6data	equ	bpldat+$0A

spr0pt		equ	$120
spr0pth		equ	$120
spr0ptl		equ	$122
spr0pos		equ     $140
spr0ctl		equ     $142
spr0data	equ     $144
spr0datb	equ     $146

spr1pt		equ	$124
spr1pth		equ	$124
spr1ptl		equ	$126
spr1pos		equ     $148
spr1ctl		equ     $14a
spr1data	equ     $14c
spr1datb	equ     $14e

spr2pt		equ	$128
spr2pth		equ	$128
spr2ptl		equ	$12a
spr2pos		equ     $150
spr2ctl		equ     $152
spr2data	equ     $154
spr2datb	equ     $156

spr3pt		equ	$12c
spr3pth		equ	$12c
spr3ptl		equ	$12e
spr3pos		equ     $158
spr3ctl		equ     $15a
spr3data	equ     $15c
spr3datb	equ     $15e

spr4pt		equ	$130
spr4pth		equ	$130
spr4ptl		equ	$132
spr4pos		equ     $160
spr4ctl		equ     $162
spr4data	equ     $164
spr4datb	equ     $166

spr5pt		equ	$134
spr5pth		equ	$134
spr5ptl		equ	$136
spr5pos		equ     $168
spr5ctl		equ     $16a
spr5data	equ     $16c
spr5datb	equ     $16e

spr6pt		equ	$138
spr6pth		equ	$138
spr6ptl		equ	$13a
spr6pos		equ     $170
spr6ctl		equ     $172
spr6data	equ     $174
spr6datb	equ     $176

spr7pt		equ	$13c
spr7pth		equ	$13c
spr7ptl		equ	$13e
spr7pos		equ     $178
spr7ctl		equ     $17a
spr7data	equ     $17c
spr7datb	equ     $17e

fmode		equ     $1fc

color00	equ	color+$00
color01	equ	color+$02
color02	equ	color+$04
color03	equ	color+$06
color04	equ	color+$08
color05	equ	color+$0A
color06	equ	color+$0C
color07	equ	color+$0E
color08	equ	color+$10
color09	equ	color+$12
color10	equ	color+$14
color11	equ	color+$16
color12	equ	color+$18
color13	equ	color+$1A
color14	equ	color+$1C
color15	equ	color+$1E
color16	equ	color+$20
color17	equ	color+$22
color18	equ	color+$24
color19	equ	color+$26
color20	equ	color+$28
color21	equ	color+$2A
color22	equ	color+$2C
color23	equ	color+$2E
color24	equ	color+$30
color25	equ	color+$32
color26	equ	color+$34
color27	equ	color+$36
color28	equ	color+$38
color29	equ	color+$3A
color30	equ	color+$3C
color31	equ	color+$3E

ciaapra		equ	$bfe001
ciaaprb		equ	$bfe101
ciaaddra	equ	$bfe201
ciaaddrb	equ	$bfe301
ciaatalo	equ	$bfe401
ciaatahi	equ	$bfe501
ciaatblo	equ	$bfe601
ciaatbhi	equ	$bfe701
ciaasdr		equ	$bfec01
ciaaicr		equ	$bfed01
ciaacra		equ	$bfee01
ciaacrb		equ	$bfef01

ciabpra		equ	$bfd000
ciabprb		equ	$bfd100
ciabddra	equ	$bfd200
ciabddrb	equ	$bfd300
ciabtalo	equ	$bfd400
ciabtahi	equ	$bfd500
ciabtblo	equ	$bfd600
ciabtbhi	equ	$bfd700
ciabicr		equ	$bfdd00
ciabcra		equ	$bfde00
ciabcrb		equ	$bfdf00

intvec1		equ	$64
intvec2		equ	$68
intvec3		equ	$6c
intvec4		equ	$70
intvec5		equ	$74
intvec6		equ	$78
intvec7		equ	$7c
