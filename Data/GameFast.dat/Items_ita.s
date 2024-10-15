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

;item types
CAT_GUN		equ     0
CAT_HAND2HAND	equ     1
CAT_MINE	equ     2
CAT_AMMO	equ     4
CAT_FOOD	equ     5
CAT_KEY		equ     6
CAT_UPLINK	equ     7
CAT_CAMCORDER	equ     8
CAT_DTS		equ     9
CAT_DATABANK	equ     11
CAT_PSIAMP	equ     12
CAT_ARMED_MINE	equ     13
CAT_FLAMER	equ     15
CAT_LAUNCHER	equ     16
CAT_TRASH	equ	17
CAT_IMMU	equ	18
CAT_REPAIR	equ     19
CAT_GRLAUNCHER	equ     20
CAT_GRENADE	equ     21
CAT_NUKE	equ     22
CAT_SENTRY	equ     23
CAT_CELLAMMO	equ     24
CAT_SENTRYCNTRL	equ     25
CAT_CORPSE	equ     26

;containers
CONT_SPECIAL	equ	2
CONT_CONSUMABLE	equ     3
CONT_PSIONIC	equ     4
CONT_SMALLCRATE	equ     5
CONT_BIGCRATE	equ     6
CONT_CORPSE	equ     7

;anim
ANIM_MUZZLE	equ     1
ANIM_ZAP	equ     2
ANIM_ELECTRIC	equ     3

;icons
ICON_GLOW	equ	1
ICON_WEIGHTS	equ     2
ICON_WINGS	equ     3
ICON_WATER	equ     4
ICON_IQ		equ	5

ENDTEXT		equ     0
CENTRE		equ     252
CENTREON	equ     247

********************************************************************************
;item 0 :
		dc.b	CENTREON,116,"CANNONE~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DISRUTTIVO~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"X CARICA/CHE~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Una~dellearmi~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"portatilipi—~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"potenti.Bench‚~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"dotatadiuna~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"scarsarapidit…~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"ditiro,procura",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"danniingenti.~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Richiedecarica~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"disruttiva.~~~~~",ENDTEXT	;info line 10
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CAT_LAUNCHER	;item category
		dc.b	0		;image
                dc.b	CONT_BIGCRATE	;container type
		dc.b	1		;water damage * 256 (per second)
		dc.w	20000		;maximum damage
		dc.w	7500		;weight
		dc.w	$f84		;anim colour
		dc.b	ANIM_ELECTRIC	;anim
		dc.b	1		;anim duration (and rounds per trigger)
		dc.b	9		;flash colour
		dc.b	1		;sample
		dc.w	400		;sample period
		dc.w	19		;ex sample
		dc.w	380		;ex sample period
		dc.b	8		;accuracy (0,2,4,8,16,32, 0=very accurate)
		dc.b	4		;fireball density front (1-4, 0=none)
		dc.b	4		;fireball density rear (1-4, 0=none)
		dc.b	4		;fireball density right (1-4, 0=none)
		dc.b	4		;fireball density left (1-4, 0=none)
		dc.b	4		;fireball density down (1-4, 0=none)
		dc.b	4		;fireball density up (1-4, 0=none)
		dc.b	36		;compatible clip type
		dc.b	0		;compatible clip type
		dc.b	0		;compatible clip type
		dc.b	1		;max rounds in gun
		dc.b	254/1		;damage per hit
;item 1 :
		dc.b	CENTREON,116,"LANCIARAZZI~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"RPG F~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"X RAZZO/I~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Armanord-~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"europanatipof~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"apropulsionea~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"razzo.Modello~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"pi—vendutoda~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"treanni.~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Richiederazzo.~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_LAUNCHER	;item category
		dc.b	1		;image
                dc.b	CONT_BIGCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0              ;water damage * 256 (per second)
		dc.w    30000		;maximum damage
		dc.w	4200		;weight
		dc.w	$ff8		;anim colour
		dc.b	ANIM_MUZZLE	;anim
		dc.b	1		;anim duration (and rounds per trigger)
		dc.b	0		;flash colour
		dc.b	2		;sample
		dc.w	400		;sample period
		dc.w	24		;ex sample
		dc.w	286		;ex sample period
		dc.b	16		;accuracy (0,2,4,8,16,32, 0=very accurate)
		dc.b	4		;fireball density front (1-4, 0=none)
		dc.b	0		;fireball density rear (1-4, 0=none)
		dc.b	0		;fireball density right (1-4, 0=none)
		dc.b	0		;fireball density left (1-4, 0=none)
		dc.b	0		;fireball density down (1-4, 0=none)
		dc.b	0		;fireball density up (1-4, 0=none)
		dc.b    37		;clip type 1
		dc.b    0		;clip type 2
		dc.b    0		;clip type 3
		dc.b    1		;max rounds in gun
		dc.b	225/1		;damage per hit
;item 2 :
		dc.b	CENTREON,116,"CANNONE LASER",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"AL NEUTRONE~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX CARICA/E~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Dausarenel~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"vuoto,meno~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"efficace~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"nell'atmosfera.~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"PremioNobelius~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"perl'inno-~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"vazioneeil~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"design.Richiede",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"caricadi1o~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"pi—kJ.~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_GUN		;item category
		dc.b	2		;image
                dc.b	CONT_BIGCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	8               ;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	3200		;weight
		dc.w	$8f8		;anim colour
		dc.b	ANIM_ZAP	;anim
		dc.b	1		;anim duration (and rounds per trigger)
		dc.b	1		;flash colour
		dc.b	8		;sample
		dc.w	179		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	4		;accuracy (0,2,4,8,16,32, 0=very accurate)
		dc.b	0		;fireball density front (1-4, 0=none)
		dc.b	0		;fireball density rear (1-4, 0=none)
		dc.b	0		;fireball density right (1-4, 0=none)
		dc.b	0		;fireball density left (1-4, 0=none)
		dc.b	0		;fireball density down (1-4, 0=none)
		dc.b	0		;fireball density up (1-4, 0=none)
		dc.b	49		;clip type 1
		dc.b    50		;clip type 2
		dc.b    51		;clip type 3
		dc.b	200		;max rounds in gun
		dc.b	195/1		;damage per hit
;item 3 :
		dc.b	CENTREON,116,"MITRAGLIATRI-",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"CE DA POSTAZ.",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX COLPO/I~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Fornitainkit~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"damontaresu~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"cuscinettodi70",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"mm.Consigliata~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"perprotezione~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"davicinoeper~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"veicolida~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"difesa.Richiede",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"munizioni~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"calibro0,44.~~~",ENDTEXT	;info line 10
		dc.b	CAT_GUN		;item category
		dc.b	3		;image
                dc.b	CONT_BIGCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    55000		;maximum damage
		dc.w	5600		;weight
		dc.w	$ccf		;anim colour
		dc.b	ANIM_MUZZLE	;anim
		dc.b	15		;anim duration (and rounds per trigger)
		dc.b	0		;flash colour
		dc.b	2		;sample
		dc.w	350		;sample period
		dc.w	22		;ex sample
		dc.w	128		;ex sample period
		dc.b	32		;accuracy (0,2,4,8,16,32, 0=very accurate)
		dc.b	0		;fireball density front (1-4, 0=none)
		dc.b	0		;fireball density rear (1-4, 0=none)
		dc.b	0		;fireball density right (1-4, 0=none)
		dc.b	0		;fireball density left (1-4, 0=none)
		dc.b	0		;fireball density down (1-4, 0=none)
		dc.b	0		;fireball density up (1-4, 0=none)
		dc.b    38		;clip type 1
		dc.b    39		;clip type 2
		dc.b    0		;clip type 3
		dc.b	250		;max rounds in gun
		dc.b	165/15		;damage per hit
;item 4 :
		dc.b	CENTREON,116,"LASER MANUALE",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"FLUORO-IDRO~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX CARICA/E~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Laprimagene-~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"razionediarmi~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"otticheamassa~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"ridotta,~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"brevettata~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"dall'Ottica~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Noeminel2711.~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Richiedecarica~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"di1opi—kJ.~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_GUN		;item category
		dc.b	4		;image
                dc.b	CONT_BIGCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	10		;water damage * 256 (per second)
		dc.w    12000		;maximum damage
		dc.w	1600		;weight
		dc.w	$8ff		;anim colour
		dc.b	ANIM_ZAP	;anim
		dc.b	1		;anim duration (and rounds per trigger)
		dc.b	0		;flash colour
		dc.b	8		;sample
		dc.w	134		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	4		;accuracy (0,2,4,8,16,32, 0=very accurate)
		dc.b	0		;fireball density front (1-4, 0=none)
		dc.b	0		;fireball density rear (1-4, 0=none)
		dc.b	0		;fireball density right (1-4, 0=none)
		dc.b	0		;fireball density left (1-4, 0=none)
		dc.b	0		;fireball density down (1-4, 0=none)
		dc.b	0		;fireball density up (1-4, 0=none)
		dc.b    49		;clip type 1
		dc.b    50		;clip type 2
		dc.b    51		;clip type 3
		dc.b    100		;max rounds in gun
		dc.b	150/1		;damage per hit
;item 5 :
		dc.b	CENTREON,116,"FUCILE~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PARTICELLARE~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX CARICA/E~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Sfrutta~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"transizioni~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"energetiche~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"nellagammadei~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"raggiultra-~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"violetti,con~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"effettomolto~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"distruttivo.~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Richiedecarica~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"di1opi—~kJ.~~",ENDTEXT	;info line 10
		dc.b	CAT_GUN		;item category
		dc.b	5		;image
                dc.b	CONT_BIGCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	10               ;water damage * 256 (per second)
		dc.w    18000		;maximum damage
		dc.w	2100		;weight
		dc.w	$ff0		;anim colour
		dc.b	ANIM_ZAP	;anim
		dc.b	1		;anim duration (and rounds per trigger)
		dc.b	1		;flash colour
		dc.b	8		;sample
		dc.w	201		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	4		;accuracy (0,2,4,8,16,32, 0=very accurate)
		dc.b	0		;fireball density front (1-4, 0=none)
		dc.b	0		;fireball density rear (1-4, 0=none)
		dc.b	0		;fireball density right (1-4, 0=none)
		dc.b	0		;fireball density left (1-4, 0=none)
		dc.b	0		;fireball density down (1-4, 0=none)
		dc.b	0		;fireball density up (1-4, 0=none)
		dc.b    49		;clip type 1
		dc.b    50		;clip type 2
		dc.b    51		;clip type 3
		dc.b    100		;max rounds in gun
		dc.b	135/1		;damage per hit
;item 6 :
		dc.b	CENTREON,116,"SMALL ARMS 9~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"AUTO IMPERIAL",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX COLPO/I~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Modellomolto~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"rumoroso,con~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"problemidi~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"rinculo,adatto~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"soloagli~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"appassionatie~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"aicollezion-~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"isti.Richiede~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"munizioni~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"calibro9.~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_GUN		;item category
		dc.b	6		;image
                dc.b	CONT_BIGCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    22000		;maximum damage
		dc.w	2300		;weight
		dc.w	$ccf		;anim colour
		dc.b	ANIM_MUZZLE	;anim
		dc.b	3		;anim duration (and rounds per trigger)
		dc.b	0		;flash colour
		dc.b	2		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	8		;accuracy (0,2,4,8,16,32, 0=very accurate)
		dc.b	0		;fireball density front (1-4, 0=none)
		dc.b	0		;fireball density rear (1-4, 0=none)
		dc.b	0		;fireball density right (1-4, 0=none)
		dc.b	0		;fireball density left (1-4, 0=none)
		dc.b	0		;fireball density down (1-4, 0=none)
		dc.b	0		;fireball density up (1-4, 0=none)
		dc.b    40		;clip type 1
		dc.b    47		;clip type 2
		dc.b    0		;clip type 3
		dc.b    54		;max rounds in gun
		dc.b	120/3		;damage per hit
;item 7 :
		dc.b	CENTREON,116,"LANCIAFIAMME~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"OXY 6~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 100cc~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Presenta~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"protezione~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"incorporata~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"dallefiamme.La",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"gammaOxyŠla~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"miglioreperla~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"difesaperson-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"ale.Richiede~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"100opi—ccdi~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"carburante.~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_FLAMER	;item category
		dc.b	7		;image
                dc.b	CONT_BIGCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	4               ;water damage * 256 (per second)
		dc.w    11000		;maximum damage
		dc.w	1700		;weight
		dc.w	$fa8		;anim colour
		dc.b	ANIM_MUZZLE	;anim
		dc.b	0		;anim duration (and rounds per trigger)
		dc.b	9		;flash colour
		dc.b	1		;sample
		dc.w	256		;sample period
		dc.w	26		;ex sample
		dc.w	256		;ex sample period
		dc.b	32		;accuracy (0,2,4,8,16,32, 0=very accurate)
		dc.b	4		;fireball density front (1-4, 0=none)
		dc.b	0		;fireball density rear (1-4, 0=none)
		dc.b	0		;fireball density right (1-4, 0=none)
		dc.b	0		;fireball density left (1-4, 0=none)
		dc.b	0		;fireball density down (1-4, 0=none)
		dc.b	0		;fireball density up (1-4, 0=none)
		dc.b    41		;clip type 1
		dc.b    42		;clip type 2
		dc.b    0		;clip type 3
		dc.b    40		;max rounds in gun
		dc.b	0/1		;damage per hit
;item 8 :
		dc.b	CENTREON,116,"LANCIAFIAMME~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"OXY 6 MINI~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 50cc~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Lanciafiamme~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"portatile~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"innescatoda~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"miscuglio~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"specialedi~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"componenti~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"chimici.~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"Richiede100o~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"pi—ccdi~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"carburante.~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_FLAMER	;item category
		dc.b	8		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	1               ;water damage * 256 (per second)
		dc.w    10000		;maximum damage
		dc.w	1100		;weight
		dc.w	$fa8		;anim colour
		dc.b	ANIM_MUZZLE	;anim
		dc.b	0		;anim duration (and rounds per trigger)
		dc.b	9		;flash colour
		dc.b	1		;sample
		dc.w	256		;sample period
		dc.w	26		;ex sample
		dc.w	256		;ex sample period
		dc.b	32		;accuracy (0,2,4,8,16,32, 0=very accurate)
		dc.b	2		;fireball density front (1-4, 0=none)
		dc.b	0		;fireball density rear (1-4, 0=none)
		dc.b	0		;fireball density right (1-4, 0=none)
		dc.b	0		;fireball density left (1-4, 0=none)
		dc.b	0		;fireball density down (1-4, 0=none)
		dc.b	0		;fireball density up (1-4, 0=none)
		dc.b    43		;clip type 1
		dc.b    44		;clip type 2
		dc.b    0		;clip type 3
		dc.b    40		;max rounds in gun
		dc.b	0/1		;damage per hit
;item 9 :
		dc.b	CENTREON,116,"SEGRETISSIMO~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"(SILENZIATO)~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX COLPO/I~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Diffusotra~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"organizzazioni~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"antiterroristich",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"eperlacanna~e",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"l'unit…di~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"puntamento~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"intercambiabili.",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"Richiede~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"munizioni~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"calibro9.~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_GUN		;item category
		dc.b	9		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    25000		;maximum damage
		dc.w	780		;weight
		dc.w	$ccf		;anim colour
		dc.b	ANIM_MUZZLE	;anim
		dc.b	1		;anim duration (and rounds per trigger)
		dc.b	0		;flash colour
		dc.b	1		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	2		;accuracy (0,2,4,8,16,32, 0=very accurate)
		dc.b	0		;fireball density front (1-4, 0=none)
		dc.b	0		;fireball density rear (1-4, 0=none)
		dc.b	0		;fireball density right (1-4, 0=none)
		dc.b	0		;fireball density left (1-4, 0=none)
		dc.b	0		;fireball density down (1-4, 0=none)
		dc.b	0		;fireball density up (1-4, 0=none)
		dc.b    40		;clip type 1
		dc.b    47		;clip type 2
		dc.b    0		;clip type 3
		dc.b    54		;max rounds in gun
		dc.b	90/1		;damage per hit
;item 10 :
		dc.b	CENTREON,116,"SMALL ARMS 6~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"SILENZIATO~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX COLPO/I~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Armaleggeradi~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"portataridotta.",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Silenziatoreed~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"estensionedella",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"canna.opzionali.",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Richiede~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"munizioni~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"calibro9.~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_GUN		;item category
		dc.b	10		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    26000		;maximum damage
		dc.w	850		;weight
		dc.w	$ff0		;anim colour
		dc.b	ANIM_MUZZLE	;anim
		dc.b	2		;anim duration (and rounds per trigger)
		dc.b	0		;flash colour
		dc.b	2		;sample
		dc.w	229		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	8		;accuracy (0,2,4,8,16,32, 0=very accurate)
		dc.b	0		;fireball density front (1-4, 0=none)
		dc.b	0		;fireball density rear (1-4, 0=none)
		dc.b	0		;fireball density right (1-4, 0=none)
		dc.b	0		;fireball density left (1-4, 0=none)
		dc.b	0		;fireball density down (1-4, 0=none)
		dc.b	0		;fireball density up (1-4, 0=none)
		dc.b    40		;clip type 1
		dc.b    47		;clip type 2
		dc.b    0		;clip type 3
		dc.b    54		;max rounds in gun
		dc.b	80/2		;damage per hit
;item 11 :
		dc.b	CENTREON,116,"MINIFUCILE~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DA POSTAZIONE",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX COLPO/I~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Dispositivo~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"militare,non~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"disponibileper~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"uso~civile.~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Richiede~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"munizioni~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"calibro0,44.~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_GUN		;item category
		dc.b	11		;image
                dc.b	CONT_BIGCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0 		;water damage * 256 (per second)
		dc.w    50000		;maximum damage
		dc.w	3000		;weight
		dc.w	$faa		;anim colour
		dc.b	ANIM_MUZZLE	;anim
		dc.b	15		;anim duration (and rounds per trigger)
		dc.b	0		;flash colour
		dc.b	2		;sample
		dc.w	350		;sample period
		dc.w	22		;ex sample
		dc.w	128		;ex sample period
		dc.b	16		;accuracy (0,2,4,8,16,32, 0=very accurate)
		dc.b	0		;fireball density front (1-4, 0=none)
		dc.b	0		;fireball density rear (1-4, 0=none)
		dc.b	0		;fireball density right (1-4, 0=none)
		dc.b	0		;fireball density left (1-4, 0=none)
		dc.b	0		;fireball density down (1-4, 0=none)
		dc.b	0		;fireball density up (1-4, 0=none)
		dc.b    38		;clip type 1
		dc.b    39		;clip type 2
		dc.b    0		;clip type 3
		dc.b    200		;max rounds in gun
		dc.b	110/15		;damage per hit
;item 12 :
		dc.b	CENTREON,116,"M73~~~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"AUTOMATICO~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX COLPO/I~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Dotatadimolti~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"colpiincanna,~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"unabuonaarma~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"multiuso.Richied",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"e~munizioni~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"calibro0,44.~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_GUN		;item category
		dc.b	12		;image
                dc.b	CONT_BIGCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	1               ;water damage * 256 (per second)
		dc.w    40000		;maximum damage
		dc.w	1700		;weight
		dc.w	$fff		;anim colour
		dc.b	ANIM_MUZZLE	;anim
		dc.b	12		;anim duration (and rounds per trigger)
		dc.b	0		;flash colour
		dc.b	2		;sample
		dc.w	246		;sample period
		dc.w	21		;ex sample
		dc.w	128		;ex sample period
		dc.b	12		;accuracy (0,2,4,8,16,32, 0=very accurate)
		dc.b	0		;fireball density front (1-4, 0=none)
		dc.b	0		;fireball density rear (1-4, 0=none)
		dc.b	0		;fireball density right (1-4, 0=none)
		dc.b	0		;fireball density left (1-4, 0=none)
		dc.b	0		;fireball density down (1-4, 0=none)
		dc.b	0		;fireball density up (1-4, 0=none)
		dc.b    38		;clip type 1
		dc.b    39		;clip type 2
		dc.b    0		;clip type 3
		dc.b	160		;max rounds in gun
		dc.b	60/12		;damage per hit
;item 13 :
		dc.b	CENTREON,116,"FUCILE 007~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX COLPO/I~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Surrogato~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"scadentedella~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"gammaSmallArms",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"6difuciliad~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"altepresta-~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"zioni;discarsa",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"velocit…ini-~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"ziale.Richiede~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"munizioni~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"calibro9.~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_GUN		;item category
		dc.b	13		;image
                dc.b	CONT_BIGCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    35000		;maximum damage
		dc.w	1400		;weight
		dc.w	$ff0		;anim colour
		dc.b	ANIM_MUZZLE	;anim
		dc.b	1		;anim duration (and rounds per trigger)
		dc.b	0		;flash colour
		dc.b	1		;sample
		dc.w	229		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	0		;accuracy (0,2,4,8,16,32, 0=very accurate)
		dc.b	0		;fireball density front (1-4, 0=none)
		dc.b	0		;fireball density rear (1-4, 0=none)
		dc.b	0		;fireball density right (1-4, 0=none)
		dc.b	0		;fireball density left (1-4, 0=none)
		dc.b	0		;fireball density down (1-4, 0=none)
		dc.b	0		;fireball density up (1-4, 0=none)
		dc.b    40		;clip type 1
		dc.b    47		;clip type 2
		dc.b    0		;clip type 3
		dc.b    54		;max rounds in gun
		dc.b	50/1		;damage per hit
;item 14 :
		dc.b	CENTREON,116,"FUCILE~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"AL TUNGSTENO~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX COLPO/I~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Celebregammadi",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"fucilie~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"revolver~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"sportivi.Di~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"solitofornito~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"direvolver~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"corrispondente.~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"Richiede~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"cartuccecalibro",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"18.~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_GUN		;item category
		dc.b	14		;image
                dc.b	CONT_BIGCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    45000		;maximum damage
		dc.w	1800		;weight
		dc.w	$fc5		;anim colour
		dc.b	ANIM_MUZZLE	;anim
		dc.b	1		;anim duration (and rounds per trigger)
		dc.b	0		;flash colour
		dc.b	1		;sample
		dc.w	290		;sample period
		dc.w	19		;ex sample
		dc.w	380		;ex sample period
		dc.b	8		;accuracy (0,2,4,8,16,32, 0=very accurate)
		dc.b	0		;fireball density front (1-4, 0=none)
		dc.b	0		;fireball density rear (1-4, 0=none)
		dc.b	0		;fireball density right (1-4, 0=none)
		dc.b	0		;fireball density left (1-4, 0=none)
		dc.b	0		;fireball density down (1-4, 0=none)
		dc.b	0		;fireball density up (1-4, 0=none)
		dc.b    45		;clip type 1
		dc.b    46		;clip type 2
		dc.b    0		;clip type 3
		dc.b    16		;max rounds in gun
		dc.b	40/1		;damage per hit
;item 15 :
		dc.b	CENTREON,116,"SMITH &~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"WESSON 29~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"X COLPO/I~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Revolverdella~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"migliore~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"qualit….~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"L'articolo~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"originaleŠ~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"fabbricatosolo~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"sullaterra.~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"Richiede~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"munizioni~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"calibro9.~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_GUN		;item category
		dc.b	15		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    60000		;maximum damage
		dc.w	690		;weight
		dc.w	$f80		;anim colour
		dc.b	ANIM_MUZZLE	;anim
		dc.b	1		;anim duration (and rounds per trigger)
		dc.b	0		;flash colour
		dc.b	1		;sample
		dc.w	236		;sample period
		dc.w	20		;ex sample
		dc.w	404		;ex sample period
		dc.b	4		;accuracy (0,2,4,8,16,32, 0=very accurate)
		dc.b	0		;fireball density front (1-4, 0=none)
		dc.b	0		;fireball density rear (1-4, 0=none)
		dc.b	0		;fireball density right (1-4, 0=none)
		dc.b	0		;fireball density left (1-4, 0=none)
		dc.b	0		;fireball density down (1-4, 0=none)
		dc.b	0		;fireball density up (1-4, 0=none)
		dc.b    40		;clip type 1
		dc.b    47		;clip type 2
		dc.b    0		;clip type 3
		dc.b    6		;max rounds in gun
		dc.b	30/1		;damage per hit
;item 16 :
		dc.b	CENTREON,116,"SCHIOPPO~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"X~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"PALLOTTOLA/E~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Ancheconpochi~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"colpiincanna~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"provocagravi~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"danni.Unamira~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"eccezionalenon~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"necessaria.~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Richiede~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"cartuccecalibro",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"18.~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_GUN		;item category
		dc.b	16		;image
                dc.b	CONT_BIGCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    58000		;maximum damage
		dc.w	1000		;weight
		dc.w	$ff0		;anim colour
		dc.b	ANIM_MUZZLE	;anim
		dc.b	1		;anim duration (and rounds per trigger)
		dc.b	0		;flash colour
		dc.b	1		;sample
		dc.w	340		;sample period
		dc.w	23		;ex sample
		dc.w	180		;ex sample period
		dc.b	16		;accuracy (0,2,4,8,16,32, 0=very accurate)
		dc.b	0		;fireball density front (1-4, 0=none)
		dc.b	0		;fireball density rear (1-4, 0=none)
		dc.b	0		;fireball density right (1-4, 0=none)
		dc.b	0		;fireball density left (1-4, 0=none)
		dc.b	0		;fireball density down (1-4, 0=none)
		dc.b	0		;fireball density up (1-4, 0=none)
		dc.b    45		;clip type 1
		dc.b    46		;clip type 2
		dc.b    0		;clip type 3
		dc.b    2		;max rounds in gun
		dc.b	60/1		;damage per hit
;item 17 :
		dc.b	CENTREON,116,"PISTOLA UIPU~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"CAL.38~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX COLPO/I~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Armadiagenti~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"dell'Ufficio~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Investigativo~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"PianetiUniti.~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Strano~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"meccanismodi~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"tiropu•causare",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"fratture.Ri-~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"chiedemunizioni",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"calibro38.~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_GUN		;item category
		dc.b	17		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    50000		;maximum damage
		dc.w	600		;weight
		dc.w	$ff0		;anim colour
		dc.b	ANIM_MUZZLE	;anim
		dc.b	1		;anim duration (and rounds per trigger)
		dc.b	0		;flash colour
		dc.b	1		;sample
		dc.w	226		;sample period
		dc.w	20		;ex sample
		dc.w	404		;ex sample period
		dc.b	4		;accuracy (0,2,4,8,16,32, 0=very accurate)
		dc.b	0		;fireball density front (1-4, 0=none)
		dc.b	0		;fireball density rear (1-4, 0=none)
		dc.b	0		;fireball density right (1-4, 0=none)
		dc.b	0		;fireball density left (1-4, 0=none)
		dc.b	0		;fireball density down (1-4, 0=none)
		dc.b	0		;fireball density up (1-4, 0=none)
		dc.b    48		;clip type 1
		dc.b    0		;clip type 2
		dc.b    0		;clip type 3
		dc.b	64		;max rounds in gun
		dc.b	30/1		;damage per hit
;item 18 :
		dc.b	CENTREON,116,"VAPORIZZATORE",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"52-C~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICA/E~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Armapotenteche",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"operanelle~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"lunghezze~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"d'onda,~~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"vaporizzando~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"molecoled'acqua",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"insostanze~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"organiche.~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Richiedecarica~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"di1opi—kJ.~~",ENDTEXT	;info line 10
		dc.b	CAT_GUN		;item category
		dc.b	18		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	8               ;water damage * 256 (per second)
		dc.w    30000		;maximum damage
		dc.w	550		;weight
		dc.w	$8ff		;anim colour
		dc.b	ANIM_ZAP	;anim
		dc.b	1		;anim duration (and rounds per trigger)
		dc.b	0		;flash colour
		dc.b	8		;sample
		dc.w	134		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	4		;accuracy (0,2,4,8,16,32, 0=very accurate)
		dc.b	0		;fireball density front (1-4, 0=none)
		dc.b	0		;fireball density rear (1-4, 0=none)
		dc.b	0		;fireball density right (1-4, 0=none)
		dc.b	0		;fireball density left (1-4, 0=none)
		dc.b	0		;fireball density down (1-4, 0=none)
		dc.b	0		;fireball density up (1-4, 0=none)
		dc.b    49		;clip type 1
		dc.b    50		;clip type 2
		dc.b    51		;clip type 3
		dc.b    50		;max rounds in gun
		dc.b	25/1		;damage per hit
;item 19 :
		dc.b	CENTREON,116,"REVOLVER~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"AL TUNGSTENO~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX PROIETTO/I",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Celebregammadi",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"fucilie~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"revolver~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"sportivi.Di~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"solitofornito~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"difucile~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"corrispondente.~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"Richiede~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"cartuccecalibro",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"18.~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_GUN		;item category
		dc.b	19		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    35000		;maximum damage
		dc.w	750		;weight
		dc.w	$faa		;anim colour
		dc.b	ANIM_MUZZLE	;anim
		dc.b	1		;anim duration (and rounds per trigger)
		dc.b	0		;flash colour
		dc.b	1		;sample
		dc.w	226		;sample period
		dc.w	19		;ex sample
		dc.w	320		;ex sample period
		dc.b	8		;accuracy (0,2,4,8,16,32, 0=very accurate)
		dc.b	0		;fireball density front (1-4, 0=none)
		dc.b	0		;fireball density rear (1-4, 0=none)
		dc.b	0		;fireball density right (1-4, 0=none)
		dc.b	0		;fireball density left (1-4, 0=none)
		dc.b	0		;fireball density down (1-4, 0=none)
		dc.b	0		;fireball density up (1-4, 0=none)
		dc.b    45		;clip type 1
		dc.b    46		;clip type 2
		dc.b    0		;clip type 3
		dc.b    32		;max rounds in gun
		dc.b	20/1		;damage per hit
;item 20 :
		dc.b	CENTREON,116,"PARALIZZATORE",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"SONICO~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICA/E~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Operanelle~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"frequenzedegli~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"ultrasuoni,e~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"inabilita~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"interferendocon",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"isistemiumani~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"dibilancia-~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"mento.Richiede~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"caricadi1o~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"pi—kJ.~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_GUN		;item category
		dc.b	20		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	4               ;water damage * 256 (per second)
		dc.w    12000		;maximum damage
		dc.w	600		;weight
		dc.w	$4f4		;anim colour
		dc.b	ANIM_ELECTRIC	;anim
		dc.b	1		;anim duration (and rounds per trigger)
		dc.b	0		;flash colour
		dc.b	9		;sample
		dc.w	334		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	32		;accuracy (0,2,4,8,16,32, 0=very accurate)
		dc.b	0		;fireball density front (1-4, 0=none)
		dc.b	0		;fireball density rear (1-4, 0=none)
		dc.b	0		;fireball density right (1-4, 0=none)
		dc.b	0		;fireball density left (1-4, 0=none)
		dc.b	0		;fireball density down (1-4, 0=none)
		dc.b	0		;fireball density up (1-4, 0=none)
		dc.b    49		;clip type 1
		dc.b    50		;clip type 2
		dc.b    51		;clip type 3
		dc.b    50		;max rounds in gun
		dc.b	15/1		;damage per hit
;item 21 :
		dc.b	CENTREON,116,"RESTI NON~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"IDENTIFI-~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"CABILI~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"L'analisi~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"riportatracce~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"organiche,~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"carboneeun23%",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"disostanze~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"molecolarinon~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"identificate.~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_TRASH	;item category
		dc.b	21		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    0		;maximum damage
		dc.w	33		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	0		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		ds.b	12
;item 22 :
		dc.b	CENTREON,116,"BANANA~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX PEZZI~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Fruttoche~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"crescein~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"condizioni~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"specialiin~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"diverse~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"piantagioni,su~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"licenzadella~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"BananaSPA~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"depositariadel~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"brevetto.~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_GUN		;item category
		dc.b	22		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    0		;maximum damage
		dc.w	100		;weight
		dc.w	$ff0		;anim colour
		dc.b	ANIM_ELECTRIC	;anim
		dc.b	1		;anim duration (and rounds per trigger)
		dc.b	0		;flash colour
		dc.b	9		;sample
		dc.w	334		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	0		;accuracy (0,2,4,8,16,32, 0=very accurate)
		dc.b	4		;fireball density front (1-4, 0=none)
		dc.b	0		;fireball density rear (1-4, 0=none)
		dc.b	0		;fireball density right (1-4, 0=none)
		dc.b	0		;fireball density left (1-4, 0=none)
		dc.b	0		;fireball density down (1-4, 0=none)
		dc.b	0		;fireball density up (1-4, 0=none)
		dc.b    54		;clip type 1
		dc.b    0		;clip type 2
		dc.b    0		;clip type 3
		dc.b	255		;max rounds in gun
		dc.b	255/1		;damage per hit
;item 23 :
		dc.b	CENTREON,116,"PARALIZZATORE",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"CEM~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICA/E~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Generacampo~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"elettromagnetico",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"adaltapotenza~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"chedistruggeil",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"bersaglioa~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"livello~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"molecolare.~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"Richiedecarica~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"di1opi—~kJ.~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_GUN		;item category
		dc.b	24		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	4               ;water damage * 256 (per second)
		dc.w    12000		;maximum damage
		dc.w	1500		;weight
		dc.w	$4f4		;anim colour
		dc.b	ANIM_ELECTRIC	;anim
		dc.b	3		;anim duration (and rounds per trigger)
		dc.b	0		;flash colour
		dc.b	9		;sample
		dc.w	400		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	32		;accuracy (0,2,4,8,16,32, 0=very accurate)
		dc.b	0		;fireball density front (1-4, 0=none)
		dc.b	0		;fireball density rear (1-4, 0=none)
		dc.b	0		;fireball density right (1-4, 0=none)
		dc.b	0		;fireball density left (1-4, 0=none)
		dc.b	0		;fireball density down (1-4, 0=none)
		dc.b	0		;fireball density up (1-4, 0=none)
		dc.b    49		;clip type 1
		dc.b    50		;clip type 2
		dc.b    51		;clip type 3
		dc.b	20		;max rounds in gun
		dc.b	100/3		;damage per hit
;item 24 :
		dc.b	CENTREON,116,"FUCILE D'ASS.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"NOEMI IV~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX COLPO/I~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"L'istitutoNoemi",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"propone~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"quest'armadi~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"puntamentoal~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"laserabasso~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"rinculo,rivale~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"delleggendario~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"m73.Richiede~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"munizioni~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"calibro9.~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_GUN		;item category
		dc.b	23		;image
                dc.b	CONT_BIGCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	1               ;water damage * 256 (per second)
		dc.w    40000		;maximum damage
		dc.w	1850		;weight
		dc.w	$eef		;anim colour
		dc.b	ANIM_MUZZLE	;anim
		dc.b	5		;anim duration (and rounds per trigger)
		dc.b	0		;flash colour
		dc.b	2		;sample
		dc.w	246		;sample period
		dc.w	27		;ex sample
		dc.w	128		;ex sample period
		dc.b	16		;accuracy (0,2,4,8,16,32, 0=very accurate)
		dc.b	0		;fireball density front (1-4, 0=none)
		dc.b	0		;fireball density rear (1-4, 0=none)
		dc.b	0		;fireball density right (1-4, 0=none)
		dc.b	0		;fireball density left (1-4, 0=none)
		dc.b	0		;fireball density down (1-4, 0=none)
		dc.b	0		;fireball density up (1-4, 0=none)
		dc.b    40		;clip type 1
		dc.b    47		;clip type 2
		dc.b    0		;clip type 3
		dc.b	65		;max rounds in gun
		dc.b	100/5		;damage per hit
;item 25 :
		dc.b	CENTREON,116,"LANCIAGRANATE",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"NOEMI~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"X GRANATA/E~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"L'ultima(di~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"nomeeforse~e~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"difatto)~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"creazione~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"dell'Istituto~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Noemi.Codice~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"prodotto'spak~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"atutto'.~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Richiedegranate",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"di40mm.~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_GRLAUNCHER	;item category
		dc.b	25		;image
                dc.b	CONT_BIGCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    58000		;maximum damage
		dc.w	1500		;weight
		dc.w	$ff0		;anim colour
		dc.b	ANIM_MUZZLE	;anim
		dc.b	-1		;anim duration (and rounds per trigger)
					; (-1=muzzle flash once without red splat)
		dc.b	0		;flash colour
		dc.b	1		;sample
		dc.w	340		;sample period
		dc.w	24		;ex sample
		dc.w	286		;ex sample period
		dc.b	8		;accuracy (0,2,4,8,16,32, 0=very accurate)
		dc.b	0		;fireball density front (1-4, 0=none)
		dc.b	0		;fireball density rear (1-4, 0=none)
		dc.b	0		;fireball density right (1-4, 0=none)
		dc.b	0		;fireball density left (1-4, 0=none)
		dc.b	0		;fireball density down (1-4, 0=none)
		dc.b	0		;fireball density up (1-4, 0=none)
		dc.b    27		;clip type 1
		dc.b    0		;clip type 2
		dc.b    0		;clip type 3
		dc.b	3		;max rounds in gun
		ds.b    1
;item 26 :
		dc.b	CENTREON,116,"GRANATE~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DI 40 mm~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX GRANATA/E~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Dimensioni~e~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"formatocomuni.~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"L'esplosivodi~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"ceramicacellu-~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"lareadalta~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"densit…genera~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"scoppiospropor-",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"zionatorispetto",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"alledimensioni~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"dellegranate.~~",ENDTEXT	;info line 10
		dc.b	CAT_GRENADE	;item category
		dc.b	32		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w	50000		;maximum damage
		dc.w	75		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	4		;fireball density north (1-4, 0=none)
		dc.b	4		;fireball density south (1-4, 0=none)
		dc.b	4		;fireball density east (1-4, 0=none)
		dc.b	4		;fireball density west (1-4, 0=none)
		dc.b	4		;fireball density down (1-4, 0=none)
		dc.b	4		;fireball density up (1-4, 0=none)
		dc.w	0		;radius (for stun grenades)
		dc.b	0		;type (0=expl,1=stun)
		ds.b    3
;item 27 :
		dc.b	CENTREON,116,"SUB-MACHINE~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"GUN~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX ROUND(S)~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"acheaphome~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"madeweapon.~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"verylight~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"weightbut~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"exceedingly~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"unreliable.~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"requires9mm~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"calibreammo.~~~",ENDTEXT	;info line 10
		dc.b	CAT_GUN		;item category
		dc.b	12		;image
                dc.b	CONT_BIGCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    60000		;maximum damage
		dc.w	900		;weight
		dc.w	$ff8		;anim colour
		dc.b	ANIM_MUZZLE	;anim
		dc.b	11		;anim duration (and rounds per trigger)
		dc.b	0		;flash colour
		dc.b	2		;sample
		dc.w	246		;sample period
		dc.w	31		;ex sample
		dc.w	104		;ex sample period
		dc.b	4		;accuracy (0,2,4,8,16,32, 0=very accurate)
		dc.b	0		;fireball density front (1-4, 0=none)
		dc.b	0		;fireball density rear (1-4, 0=none)
		dc.b	0		;fireball density right (1-4, 0=none)
		dc.b	0		;fireball density left (1-4, 0=none)
		dc.b	0		;fireball density down (1-4, 0=none)
		dc.b	0		;fireball density up (1-4, 0=none)
		dc.b    40		;clip type 1
		dc.b    47		;clip type 2
		dc.b    0		;clip type 3
		dc.b	66		;max rounds in gun
		dc.b	55/11		;damage per hit
;item 28 :
		dc.b	CENTREON,116,"BATTERIA~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"A FUSIONE~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"UNITA 1~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"INATTIVA~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Fornisce6anni~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"dienergia~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"elettricaa4~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"megawatt.Tieni~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"glialloggi~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"lontanidai~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"forticampi~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"magnetici!~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_NUKE	;item category
		dc.b	26		;image
                dc.b	CONT_BIGCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    0		;maximum damage
		dc.w	3000		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration (and rounds per trigger)
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	0		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	1		;unit number
		ds.b    11
;item 29 :
		dc.b	CENTREON,116,"AUTO GUARDIA~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"MONO~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX ARMA/I~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Sentinella~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"monodirezionale~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"automatizzata;~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"colpisceci•che",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"simuovedavanti",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"all'arma.~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_SENTRY	;item category
		dc.b	27		;image
                dc.b	CONT_BIGCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    55000		;maximum damage
		dc.w	3000		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.w	500		;delay before active
		dc.w    99		;rounds
		dc.w    500		;physique
		dc.b    0		;turn flag
		dc.b	1		;shoot players flag
		dc.b	8		;range
		dc.b	2		;density
		ds.b    2
;item 30 :
		dc.b	CENTREON,116,"MATTONE~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Oggettoda~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"costruzionepi—~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"usatoneicasi~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"in~cuiimetalli",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"mancanoola~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"lavorazione~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"dellaplastica~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"costatroppo.~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_HAND2HAND	;item category
		dc.b	30		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w	20000		;maximum damage
		dc.w	650		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	100		;hand 2 hand modifier
		ds.b    11
;item 31 :
		dc.b	CENTREON,116,"BOTTIGLIA~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ROTTA~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Losvantaggio~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"delvetrodi~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"bottigliaŠche~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Šfragile~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"rispettoal~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"vetropi—~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"moderno;pu•~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"frantumarsiin~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"frammenti~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"taglienti.~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_HAND2HAND	;item category
		dc.b	31		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    5000		;maximum damage
		dc.w	210		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	100		;hand 2 hand modifier
		ds.b    11
;item 32 :
		dc.b	CENTREON,116,"AUTO GUARDIA~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"POLI-D~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX ARMA/I~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Sentinella~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"polidirezionale~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"automatizzata;~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"ruotandosuun~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"perno,colpisce~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"tuttoci•chesi",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"muove.~~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_SENTRY	;item category
		dc.b	27		;image
                dc.b	CONT_BIGCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    55000		;maximum damage
		dc.w	3000		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.w	500		;delay before active
		dc.w    99		;rounds
		dc.w    500		;physique
		dc.b    1		;turn flag
		dc.b	1		;shoot players flag
		dc.b	8		;range
		dc.b	2		;density
		ds.b    2
;item 33 :
		dc.b	CENTREON,116,"MINA DI~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PROSSIMITA~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Provocauno~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"scoppiotremendo",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"chemutilaenon",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"uccide;funziona",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"apressione.~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_MINE		;item category
		dc.b	33		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    20000		;maximum damage
		dc.w	450		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	0		;fireball density north (1-4, 0=none)
		dc.b	0		;fireball density south (1-4, 0=none)
		dc.b	0		;fireball density east (1-4, 0=none)
		dc.b	0		;fireball density west (1-4, 0=none)
		dc.b	0		;fireball density down (1-4, 0=none)
		dc.b	0		;fireball density up (1-4, 0=none)
		dc.w	0		;damage
		dc.b	112		;armed item
		ds.b    3
;item 34 :
		dc.b	CENTREON,116,"MINA DI~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PROSSIMITA II",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Provocauno~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"scoppiotremendo",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"chenonmutila,~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"mauccide;~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"funzionaa~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"pressione.~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_MINE	;item category
		dc.b	35		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    20000		;maximum damage
		dc.w	450		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	0		;fireball density north (1-4, 0=none)
		dc.b	0		;fireball density south (1-4, 0=none)
		dc.b	0		;fireball density east (1-4, 0=none)
		dc.b	0		;fireball density west (1-4, 0=none)
		dc.b	0		;fireball density down (1-4, 0=none)
		dc.b	0		;fireball density up (1-4, 0=none)
		dc.w	0		;damage
		dc.b	113		;armed item
		ds.b    3
;item 35 :
		dc.b	CENTREON,116,"CARICA~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DISRUTTIVA~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Caricastandard~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"daapplicareal~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"cannone~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"disruttivo.~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_AMMO	;item category
		dc.b	36		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	4               ;water damage * 256 (per second)
		dc.w    35000		;maximum damage
		dc.w	1500		;weight (each)
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	0		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
;1		;rounds in magazine
		ds.b    12
;item 36 :
		dc.b	CENTREON,116,"RAZZO~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ANTI-VPC~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Proiettilea~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"carburante~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"solidoadalta~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"densit…eraggio",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"microfusore.~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Adattoaquasi~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"tuttii~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"lanciarazzi.~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_AMMO		;item category
		dc.b	37		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	4               ;water damage * 256 (per second)
		dc.w    30000		;maximum damage
		dc.w	800		;weight (each)
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	0		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
;1		;rounds in magazine
		ds.b    12
;item 37 :
		dc.b	CENTREON,116,"MUNIZIONE TEA",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"0,44 MK II~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX COLPO/I~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Munizioneper~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Trasferimentodi",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"EnergiaAccele-~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"rato.Trasferisce",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"quasitutta~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"l'energia~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"cineticasul~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"bersagliocon~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"effetti~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"micidiali.~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_AMMO		;item category
		dc.b	38		;image
                dc.b	CONT_BIGCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    55000		;maximum damage
		dc.w	20		;weight (each)
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	0		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
;250		;rounds in magazine
		ds.b    12
;item 38 :
		dc.b	CENTREON,116,"THV CALIBRO~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"0,44~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX COLPO/I~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Lamigliore~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"munizionetipo~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"TEA,cheforale",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"armature.~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Rimbalzo~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"limitato,basso~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"rinculoed~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"eccellente~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"potere~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"bloccante.~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_AMMO		;item category
		dc.b	39		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    55000		;maximum damage
		dc.w	20		;weight (each)
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	0		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
;150		;rounds in magazine
		ds.b    12
;item 39 :
		dc.b	CENTREON,116,"TEA CAL.9 mm~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ALTA VELOCITA",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX COLPO/I~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Iltipopi—~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"comunedi~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"munizione,~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"disponibile~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"ancheincalibro",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"0,44mm;grande~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"capacit…di~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"penetrarema~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"incapacedi~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"fermarebersagli",ENDTEXT	;info line 10
		dc.b	CAT_AMMO		;item category
		dc.b	40		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    50000           ;maximum damage
		dc.w	5		;weight (each)
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	0		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
;250		;rounds in magazine
		ds.b    12
;item 40 :
		dc.b	CENTREON,116,"RICARICA PER~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"LANCIAFIAMME~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 100cc~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Sottoprodottodi",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"carburante~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"chimico~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"scadente,molto~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"potentee~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"pulito,usato~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"conillancia-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"fiammeOXY6per",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"difesa~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"personale.~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_AMMO		;item category
		dc.b	41		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    25000           ;maximum damage
		dc.w	10		;weight (each 100cc)
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	0		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
;40		;rounds in magazine
		ds.b    12
;item 41 :
		dc.b	CENTREON,116,"GAS UX PER~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"LANCIAFIAMME~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 100cc~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Sottoprodottodi",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"carburante~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"chimico~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"scadente,molto~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"potentee~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"pulito,usato~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"conillancia-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"fiammeOXY6per",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"difesa~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"personale.~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_AMMO		;item category
		dc.b	42		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    25000           ;maximum damage
		dc.w	10		;weight (each 100cc)
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	0		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
;20		;rounds in magazine
		ds.b    12
;item 42 :
		dc.b	CENTREON,116,"RICARICA MINI",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"LANCIAFIAMME~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 50cc~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Sottoprodottodi",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"carburante~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"chimico~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"scadente,molto~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"potentee~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"pulito,usato~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"conillancia-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"fiammeOXY6per",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"difesa~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"personale.~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_AMMO		;item category
		dc.b	43		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    25000           ;maximum damage
		dc.w	5		;weight (each 50cc)
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	0		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
;40		;rounds in magazine
		ds.b    12
;item 43 :
		dc.b	CENTREON,116,"GAS UX MINI~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"LANCIAFIAMME~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 50cc~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Sottoprodottodi",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"carburante~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"chimico~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"scadente,molto~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"potentee~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"pulito,usato~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"conillancia-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"fiammeOXY6per",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"difesa~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"personale.~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_AMMO		;item category
		dc.b	44		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    25000           ;maximum damage
		dc.w	5		;weight (each 50cc)
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	0		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
;20		;rounds in magazine
		ds.b    12
;item 44 :
		dc.b	CENTREON,116,"ESPLOSIVO~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"CAL.18~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX PROIETTO/I",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Munizioneper~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"schioppo.Tale~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"variante~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"contieneuna~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"solatesta~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"esplosivainvece",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"dipallini;~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"includeun'alta~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"carica~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"esplosiva.~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_AMMO		;item category
		dc.b	45		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	1               ;water damage * 256 (per second)
		dc.w    35000           ;maximum damage
		dc.w	13		;weight (each)
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	0		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
;90		;rounds in magazine
		ds.b    12
;item 45 :
		dc.b	CENTREON,116,"PROIETTO RIG.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"CALIBRO 18~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX PROIETTO/I",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Ilnucleovuoto~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"diuraniofa~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"penetrareil~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"colponel~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"bersaglio;la~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"rigatura~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"permettedi~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"centraremeglio~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"ilbersaglio.~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_AMMO		;item category
		dc.b	46		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	1               ;water damage * 256 (per second)
		dc.w    35000           ;maximum damage
		dc.w	13		;weight (each)
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	0		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
;50		;rounds in magazine
		ds.b    12
;item 46 :
		dc.b	CENTREON,116,"SERIE MINI~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"THV CAL.9 mm~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX COLPO/I~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Munizione~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"compattatipo~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"TEA.Media~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"perforazione,~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"rimbalzolimi-~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"tato,basso~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"rinculoebuon~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"poterebloc-~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"cante,anchein~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"calibro0,44mm.",ENDTEXT	;info line 10
		dc.b	CAT_AMMO		;item category
		dc.b	47		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    50000           ;maximum damage
		dc.w	5		;weight (each)
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	0		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
;150		;rounds in magazine
		ds.b    12
;item 47 :
		dc.b	CENTREON,116,"MUNIZIONE~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"UIPU CAL.0,38",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX COLPO/I~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Munizionemolto~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"costosaed~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"esclusiva,usata",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"solodall'UIPU;~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Šdifficile~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"procurarsela.~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_AMMO		;item category
		dc.b	48		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    52000           ;maximum damage
		dc.w	10		;weight (each)
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	0		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
;64		;rounds in magazine
		ds.b    12
;item 48 :
		dc.b	CENTREON,116,"PILA SINGOLA~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DI 1 kJ~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICA/E~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Caricadi1kJ~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"conconnettori~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"terminali~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"standard+/-per",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"armiadenergia.",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Consigliataper~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"laseraimpulsi~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"edemettitorial",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"protone.~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_CELLAMMO	;item category
		dc.b	49		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    35000           ;maximum damage
		dc.w	100		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	0		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
;50		;rounds in magazine
		ds.b    12
;item 49 :
		dc.b	CENTREON,116,"PILA DOPPIA~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DI 3 kJ~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX CARICA/E~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Caricadi3kJ~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"conconnettori~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"terminali~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"standard+/-per",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"armiadenergia.",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Controllabene~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"chelapolarit…~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"siacorretta.~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_CELLAMMO	;item category
		dc.b	50		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    36000           ;maximum damage
		dc.w	200		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	0		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
;100		;rounds in magazine
		ds.b    12
;item 50 :
		dc.b	CENTREON,116,"PILA TRIPLA~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DI 6 kJ~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX CARICA/E~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Anchesele~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"carichedi6kJ~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"possonoessere~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"usateperle~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"armiportatili,~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"sonopi—adatte~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"allearmisu~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"veicoli.~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_CELLAMMO	;item category
		dc.b	51		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    37000           ;maximum damage
		dc.w	300		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	0		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
;200		;rounds in magazine
		ds.b    12
;item 51 :
		dc.b	CENTREON,116,"RESTI NON~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"IDENTIFI-~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"CABILI~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"L'analisi~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"riportatracce~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"organiche,~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"carboneeun23%",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"disostanze~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"molecolarinon~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"identificate.~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_TRASH	;item category
		dc.b	52		;image
                dc.b	CONT_BIGCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    0               ;maximum damage
		dc.w	100		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	0		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		ds.b    12
;item 52 :
		dc.b	CENTREON,116,"PEZZI DI~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"BANANA~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX PEZZO/I~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Purtroppo~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"mancanoinfor-~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mazionisu~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"questooggetto.~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Richiedialla~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"CorporazioneVII",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"unpacchettodi~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"aggiornamento~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuito.~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_AMMO	;item category
		dc.b	53		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    0		;maximum damage
		dc.w	2		;weight (each)
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	0		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
;255		;rounds in magazine
		ds.b    12
;item 53 :
		dc.b	CENTREON,116,"SFILATINO~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"CROCCANTE~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Purtroppo~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"mancanoinfor-~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mazionisu~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"questooggetto.~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Richiedialla~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"CorporazioneVII",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"unpacchettodi~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"aggiornamento~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuito.~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_FOOD	;item category
		dc.b	54		;image
                dc.b	CONT_CONSUMABLE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	4               ;water damage * 256 (per second)
		dc.w	2000		;maximum damage
		dc.w	350		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	8		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.w	10000		;fitness boost
		dc.w	0		;physique boost
		dc.w	0		;agility boost
		dc.w	0		;duration of ph & ws boost
		ds.b	4
;item 54 :
		dc.b	CENTREON,116,"FORMAGGIO~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Surrogatodel~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"formaggio~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"altamente~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"nutriente,~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"arricchitodi~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"vitamine,creato",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"perlemissioni~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"spaziali,incui",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"lanutrizioneŠ~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"diimportanza.~~",ENDTEXT	;info line 10
		dc.b	CAT_FOOD		;item category
		dc.b	55		;image
                dc.b	CONT_CONSUMABLE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	1               ;water damage * 256 (per second)
		dc.w    3000           ;maximum damage
		dc.w	200		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	8		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.w	15000		;fitness boost
		dc.w	0		;physique boost
		dc.w	0		;agility boost
		dc.w	0		;duration of ph & ws boost
		ds.b	4
;item 55 :
		dc.b	CENTREON,116,"BOTTIGLIA~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Ilvetroper~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"bottiglieŠ.~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"fattodi~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"silicatosotto-~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"postoadalte~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"temperature.~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Doteprincipale~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"dellebottiglie~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"divetro:il~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"bassocosto.~~~~",ENDTEXT	;info line 10
		dc.b	CAT_FOOD		;item category
		dc.b	56		;image
                dc.b	CONT_CONSUMABLE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    5000           ;maximum damage
		dc.w	500		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	8		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.w	20000		;fitness boost
		dc.w	0		;physique boost
		dc.w	0		;agility boost
		dc.w	0		;duration of ph & ws boost
		ds.b	4
;item 56 :
		dc.b	CENTREON,116,"MELA~~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Fruttocomune,~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"checresce~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"facilmente,edŠ",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"esentedai~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"brevettie~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"dall'autorizza-~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"zionedel2609.~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_FOOD		;item category
		dc.b	57		;image
                dc.b	CONT_CONSUMABLE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    3500 		;maximum damage
		dc.w	100		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	8		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.w	10000		;fitness boost
		dc.w	0		;physique boost
		dc.w	0		;agility boost
		dc.w	0		;duration of ph & ws boost
		ds.b	4
;item 57 :
		dc.b	CENTREON,116,"GAMBA~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DI POLLO~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Purtroppo~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"mancanoinfor-~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mazionisu~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"questooggetto.~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Richiedialla~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"CorporazioneVII",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"unpacchettodi~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"aggiornamento~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuito.~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_FOOD		;item category
		dc.b	58		;image
                dc.b	CONT_CONSUMABLE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	1               ;water damage * 256 (per second)
		dc.w    3500           ;maximum damage
		dc.w	150		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	8		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.w	12000		;fitness boost
		dc.w	0		;physique boost
		dc.w	0		;agility boost
		dc.w	0		;duration of ph & ws boost
		ds.b	4
;item 58 :
		dc.b	CENTREON,116,"PAGNOTTA~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Purtroppo~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"mancanoinfor-~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mazionisu~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"questooggetto.~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Richiedialla~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"CorporazioneVII",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"unpacchettodi~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"aggiornamento~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuito.~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_FOOD		;item category
		dc.b	59		;image
                dc.b	CONT_CONSUMABLE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	4               ;water damage * 256 (per second)
		dc.w    2000           ;maximum damage
		dc.w	500		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	8		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.w	30000		;fitness boost
		dc.w	0		;physique boost
		dc.w	0		;agility boost
		dc.w	0		;duration of ph & ws boost
		ds.b	4
;item 59 :
		dc.b	CENTREON,116,"BORRACCIA~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Purtroppo~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"mancanoinfor-~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mazionisu~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"questooggetto.~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Richiedialla~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"CorporazioneVII",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"unpacchettodi~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"aggiornamento~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuito.~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_FOOD		;item category
		dc.b	60		;image
                dc.b	CONT_CONSUMABLE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    5500           ;maximum damage
		dc.w	300		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	8		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.w	17000		;fitness boost
		dc.w	0		;physique boost
		dc.w	0		;agility boost
		dc.w	0		;duration of ph & ws boost
		ds.b	4
;item 60 :
		dc.b	CENTREON,116,"RAZIONI~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"STANDARD I~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Razioni~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"concentrateal~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"livello1;senza",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"saporema~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"sufficienti.~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Contengonole~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"sostanze~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"necessarieal~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"corpo(tranne~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"l'acqua).~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_FOOD		;item category
		dc.b	61		;image
                dc.b	CONT_CONSUMABLE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	2               ;water damage * 256 (per second)
		dc.w    7000           ;maximum damage
		dc.w	700		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	8		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.w	20000		;fitness boost
		dc.w	0		;physique boost
		dc.w	0		;agility boost
		dc.w	0		;duration of ph & ws boost
		ds.b	4
;item 61 :
		dc.b	CENTREON,116,"RAZIONI~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"STANDARD II~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Razioni~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"concentrateal~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"livello2;sono~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"similialle~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"razioni1tranne",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"perilfattoche",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"sonopi—~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"energetiche.~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_FOOD		;item category
		dc.b	62		;image
                dc.b	CONT_CONSUMABLE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	2               ;water damage * 256 (per second)
		dc.w    8000           ;maximum damage
		dc.w	900		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	8		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.w	30000		;fitness boost
		dc.w	0		;physique boost
		dc.w	0		;agility boost
		dc.w	0		;duration of ph & ws boost
		ds.b	4
;item 62 :
		dc.b	CENTREON,116,"RAZIONI~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"STANDARD III~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Razioni~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"concentrateal~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"livello3ecom-",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"ponentichimiche",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"e~organicheche~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"miglioranolo~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"statodisalute;",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"nonusareadosi",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"elevate!~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_FOOD		;item category
		dc.b	63		;image
                dc.b	CONT_CONSUMABLE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	2               ;water damage * 256 (per second)
		dc.w    9000           ;maximum damage
		dc.w	1100		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	8		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.w	40000		;fitness boost
		dc.w	0		;physique boost
		dc.w	0		;agility boost
		dc.w	0		;duration of ph & ws boost
		ds.b	4
;item 63 :
		dc.b	CENTREON,116,"KIT PRONTO~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"SOCCORSO~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Contieneoggetti",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"dipronto~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"soccorso,scorte",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"dicibonon~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"deperibili,e~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"antidotiper~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"veleni.~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_FOOD		;item category
		dc.b	64		;image
		dc.b	CONT_CONSUMABLE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    10000           ;maximum damage
		dc.w	600		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	8		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.w	60000		;fitness boost
		dc.w	0		;physique boost
		dc.w	0		;agility boost
		dc.w	0		;duration of ph & ws boost
		ds.b	4
;item 64 :
		dc.b	CENTREON,116,"ANTITOSSINA~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"IN SIRINGA~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Farmacodausare",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"inbattagliaper",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"immunizzarsi~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"temporaneamente~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"controlecomuni",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"tossine;dura~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"circa4minuti.~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_IMMU	;item category
		dc.b	65		;image
                dc.b	CONT_CONSUMABLE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    1500		;maximum damage
		dc.w	20		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	8		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.w	12000		;duration immunisation
		ds.b	10
;item 65 :
		dc.b	CENTREON,116,"KIT~~~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"RIPARADROIDI~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Utilekit~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"ripara-droidi~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"diffusonelle~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"civilt…avan-~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"zate,completo~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"diquadro~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"diagnostico,~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"riempitoree~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"verniceper~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"ritocchi.~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_REPAIR	;item category
		dc.b	66		;image
		dc.b	CONT_CONSUMABLE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    10000           ;maximum damage
		dc.w	600		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	8		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.w	60000		;fitness boost
		dc.w	0		;physique boost
		dc.w	0		;agility boost
		dc.w	0		;duration of ph & ws boost
		ds.b	4
;item 66 :
		dc.b	CENTREON,116,"BATTERIA~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"A FUSIONE~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"UNITA 2~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"INATTIVA~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Fornisce6anni~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"dienergia~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"elettricaa4~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"megawatt.Tieni~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"glialloggi~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"lontanidai~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"forticampi~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"magnetici!~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_NUKE	;item category
		dc.b	26		;image
                dc.b	CONT_BIGCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    0		;maximum damage
		dc.w	3000		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration (and rounds per trigger)
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	0		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	2		;unit number
		ds.b    11
;item 67 :
		dc.b	CENTREON,116,"BATTERIA~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"A FUSIONE~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"UNITA 3~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"INATTIVA~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Fornisce6anni~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"dienergia~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"elettricaa4~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"megawatt.Tieni~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"glialloggi~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"lontanidai~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"forticampi~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"magnetici!~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_NUKE	;item category
		dc.b	26		;image
                dc.b	CONT_BIGCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    0		;maximum damage
		dc.w	3000		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration (and rounds per trigger)
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	0		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	3		;unit number
		ds.b    11
;item 68 :
		dc.b	CENTREON,116,"BATTERIA~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"A FUSIONE~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"UNITA 4~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"INATTIVA~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Fornisce6anni~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"dienergia~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"elettricaa4~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"megawatt.Tieni~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"glialloggi~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"lontanidai~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"forticampi~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"magnetici!~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_NUKE	;item category
		dc.b	26		;image
                dc.b	CONT_BIGCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    0		;maximum damage
		dc.w	3000		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration (and rounds per trigger)
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	0		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	4		;unit number
		ds.b    11
;item 69 :
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Purtroppo~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"mancanoinfor-~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mazionisu~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"questooggetto.~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Richiedialla~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"CorporazioneVII",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"unpacchettodi~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"aggiornamento~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuito.~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_FOOD		;item category
		dc.b	70		;image
                dc.b	CONT_CONSUMABLE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    5500           ;maximum damage
		dc.w	300		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	8		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.w	0		;fitness boost
		dc.w	200		;physique boost
		dc.w	200		;agility boost
		dc.w	6000		;duration of ph & ws boost
		ds.b	4
;item 70 :
		dc.b	CENTREON,116,"CHIAVE~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Purtroppo~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"mancanoinfor-~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mazionisu~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"questooggetto.~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Richiedialla~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"CorporazioneVII",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"unpacchettodi~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"aggiornamento~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuito.~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_KEY		;item category
		dc.b	71		;image
                dc.b	CONT_SPECIAL	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    0               ;maximum damage
		dc.w	20		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		ds.b    12
;item 71 :
		dc.b	CENTREON,116,"CHIAVE~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ORNATA~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Purtroppo~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mancanoinfor-~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"mazionisu~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"questooggetto.~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Richiedialla~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"CorporazioneVII",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"unpacchettodi~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"aggiornamento~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"gratuito.~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_KEY		;item category
		dc.b	72		;image
                dc.b	CONT_SPECIAL		;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    0           ;maximum damage
		dc.w	35		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		ds.b    12
;item 72 :
		dc.b	CENTREON,116,"PASS ACCESSO~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DI SICUREZZA~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"LIMITATO~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"AI CIVILI~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Schedadi~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"accessodi~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"sicurezzadi~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"bassolivello,~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"usataper~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"imporre~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"restrizionidi~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"zona.~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_KEY		;item category
		dc.b	73		;image
                dc.b	CONT_SPECIAL		;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    0               ;maximum damage
		dc.w	10		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		ds.b    12
;item 73 :
		dc.b	CENTREON,116,"PASS ACCESSO~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DI SICUREZZA~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"NON~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"LIMITATO~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Schedadi~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"accessodi~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"sicurezza~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"principale,~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"usataper~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"imporre~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"restrizionidi~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"zona.~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_KEY		;item category
		dc.b	74		;image
                dc.b	CONT_SPECIAL		;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    0           ;maximum damage
		dc.w	10		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		ds.b    12
;item 74 :
		dc.b	CENTREON,116,"PASS ACCESSO~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DI SICUREZZA~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"LIMITATO AI~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"DIPENDENTI~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Schedadi~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"accessodi~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"sicurezzadi~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"livellomedio,~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"usataper~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"imporre~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"restrizionidi~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"zona.~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_KEY		;item category
		dc.b	75		;image
                dc.b	CONT_SPECIAL		;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    0           ;maximum damage
		dc.w	10		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		ds.b    12
;item 75 :
		dc.b	CENTREON,116,"PASS ACCESSO~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DI SICUREZZA~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"LIMITATO AI~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"DIRIGENTI~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Schedadi~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"accessodi~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"sicurezzadi~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"altolivello,~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"usataper~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"imporre~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"restrizionidi~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"zona.~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_KEY		;item category
		dc.b	76		;image
                dc.b	CONT_SPECIAL		;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    0           ;maximum damage
		dc.w	10		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		ds.b    12
;item 76 :
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Purtroppo~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"mancanoinfor-~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mazionisu~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"questooggetto.~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Richiedialla~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"CorporazioneVII",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"unpacchettodi~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"aggiornamento~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuito.~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_UPLINK		;item category
		dc.b	81		;image
                dc.b	CONT_SPECIAL		;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    0           ;maximum damage
		dc.w	0		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		ds.b    12
;item 77 :
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Oggetto~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"predilettodai~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"giornalisti,che",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"permettedi~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"registrare~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"metraggidicui~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"sipu•~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"dimostrarela~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"purezzaenon~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"manomissione.~~~",ENDTEXT	;info line 10
		dc.b	CAT_CAMCORDER	;item category
		dc.b	82		;image
                dc.b	CONT_SPECIAL		;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    0           ;maximum damage
		dc.w	0		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		ds.b    12
;item 78 :
		dc.b	CENTREON,116,"MODULO S.D.S.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"ScannerDigitale",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"delSuolo.Unit…",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"portatile;~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"forniscedati~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"visivieduna~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"basedidati~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"tatticisulla~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"zona.~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_DTS		;item category
		dc.b	83		;image
                dc.b	CONT_SPECIAL	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    50500           ;maximum damage
		dc.w	750		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		ds.b    12
;item 79 :
		dc.b	CENTREON,116,"MODULO S.D.S.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"'ULTRA'~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Purtroppo~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"mancanoinfor-~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mazionisu~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"questooggetto.~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Richiedialla~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"CorporazioneVII",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"unpacchettodi~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"aggiornamento~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuito.~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_DTS		;item category
		dc.b	84		;image
                dc.b	CONT_SPECIAL	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    51000           ;maximum damage
		dc.w	700		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		ds.b    12
;item 80 :
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Purtroppo~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"mancanoinfor-~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mazionisu~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"questooggetto.~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Richiedialla~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"CorporazioneVII",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"unpacchettodi~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"aggiornamento~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuito.~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_DATABANK	;item category
		dc.b	85		;image
                dc.b	CONT_SPECIAL	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    35000          	;maximum damage
		dc.w	0		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		ds.b    12
;item 81 :
;initial number of charges = 20
		dc.b	CENTREON,116,"BOLIDE~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONICO~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICHE~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Scagliadavanti~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"achilousauna",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"sferadiplasma~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"infiammatodi~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"mediapotenza.~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_PSIAMP	;item category
		dc.b	78		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	9		;flash colour
		dc.b	10		;sample
		dc.w	509		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	5		;level
		ds.b    11
;item 82 :
;initial number of charges = 15
		dc.b	CENTREON,116,"INFERNO~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONICO~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICHE~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Scagliadavanti~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"achilousauna",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"sferadiplasma~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"infiammatodi~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"altapotenza.~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_PSIAMP	;item category
		dc.b	78		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	9		;flash colour
		dc.b	10		;sample
		dc.w	509		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	6		;level
		ds.b    11
;item 83 :
;initial number of charges = 10
		dc.b	CENTREON,116,"ESPLOSIONE~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONICA~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICHE~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Scagliaattorno~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"achilousa~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"quattrosferedi",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"plasma~~~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"infiammatodi~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"mediapotenza.~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_PSIAMP	;item category
		dc.b	78		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	9		;flash colour
		dc.b	10		;sample
		dc.w	509		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	7		;level
		ds.b    11
;item 84 :
;initial number of charges = 5
		dc.b	CENTREON,116,"DEVASTAZIONE~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONICA~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICHE~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Scagliaattorno~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"achilousa~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"quattrosferedi",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"plasma~~~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"perennemente~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"infiammatodi~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"massimapotenza.",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_PSIAMP	;item category
		dc.b	78		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	9		;flash colour
		dc.b	10		;sample
		dc.w	509		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	8		;level
		ds.b    11
;item 85 :
;initial number of charges = 5
		dc.b	CENTREON,116,"PARAFUOCO~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONICO~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICHE~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Proteggeun~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"volumedi2~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"metricubi(di~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"solito~~~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"l'utilizzatore)~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"daiproiettilie",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"dallearmial~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"plasma.~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_PSIAMP	;item category
		dc.b	79		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	6		;flash colour
		dc.b	10		;sample
		dc.w	255		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	6		;level
		ds.b    11
;item 86 :
;initial number of charges = 5
		dc.b	CENTREON,116,"SCUDO~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONICO~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICHE~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Proteggeun~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"volumedi2~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"metricubi(di~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"solito~~~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"l'utilizzatore)~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"daiproiettilie",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"dallearmi~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"impiegatenei~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"combattimenti~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"corpoacorpo.~~",ENDTEXT	;info line 10
		dc.b	CAT_PSIAMP	;item category
		dc.b	79		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	6		;flash colour
		dc.b	10		;sample
		dc.w	255		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	7		;level
		ds.b    11
;item 87 :
;initial number of charges = 5
		dc.b	CENTREON,116,"RAFFORZATORE~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONICO~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICHE~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Per4minuti,~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"acceleradi3~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"livelliil~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"metabolismo~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"dell'utilizza-~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"tore,aumen-~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"tandonela~forza",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"eilvigore.~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_PSIAMP	;item category
		dc.b	77		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	8		;flash colour
		dc.b	10		;sample
		dc.w	128		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	5		;level
		ds.b    11
;item 88 :
;initial number of charges = 3
		dc.b	CENTREON,116,"TITANIZZATORE",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONICO~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICHE~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Per4minuti,~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"acceleradi6~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"livelliil~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"metabolismo~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"dell'utilizza-~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"tore,aumen-~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"tandonelaforza",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"eilvigore.~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_PSIAMP	;item category
		dc.b	77		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	8		;flash colour
		dc.b	10		;sample
		dc.w	128		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	7		;level
		ds.b    11
;item 89 :
;initial number of charges = 3
		dc.b	CENTREON,116,"MURO~~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONICO~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICHE~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Generauncampo~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"dirisonanza~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"quasi~~~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"indistruttibile~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"cherespingela~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"materiasolida.~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_PSIAMP	;item category
		dc.b	80		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	13		;flash colour
		dc.b	10		;sample
		dc.w	128		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	6		;level
		ds.b    11
;item 90 :
;initial number of charges = 3
		dc.b	CENTREON,116,"ANTIMURO~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONICO~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICHE~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Infrangee~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"dissipaicampi~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"dirisonanzache",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"respingonola~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"materiasolida.~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_PSIAMP	;item category
		dc.b	80		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	13		;flash colour
		dc.b	10		;sample
		dc.w	128		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	6		;level
		ds.b    11
;item 91 :
;initial number of charges = 4
		dc.b	CENTREON,116,"PONTE~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONICO~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICHE~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Creauna~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"piattaforma~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"stabilesospesa~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"davantiachilo",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"usa.~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_PSIAMP	;item category
		dc.b	80		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	13		;flash colour
		dc.b	10		;sample
		dc.w	128		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	7		;level
		ds.b    11
;item 92 :
;initial number of charges = 3
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Purtroppo~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"mancanoinfor-~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mazionisu~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"questooggetto.~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Richiedialla~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"CorporazioneVII",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"unpacchettodi~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"aggiornamento~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuito.~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_PSIAMP	;item category
		dc.b	80		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	8		;flash colour
		dc.b	10		;sample
		dc.w	255		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	4		;level
		ds.b    11
;item 93 :
;initial number of charges = 5
		dc.b	CENTREON,116,"PIUMA~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONICA~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICHE~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Alleggerisceil~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"pesodegli~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"oggettiportati~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"dall'utilizza-~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"tore,manonil~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"peso~~~~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"dell'utilizza-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"tore.~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_PSIAMP	;item category
		dc.b	79		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	8		;flash colour
		dc.b	10		;sample
		dc.w	255		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	8		;level
		ds.b    11
;item 94 :
;initial number of charges = 10
		dc.b	CENTREON,116,"COMPRESSIONE~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONICA~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICHE~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Generaun'onda~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"dicompressione~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"dimediapotenza",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"edŠdannosaper",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"ilsoffice~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"tessutoanimale~",ENDTEXT	;info line 10
		dc.b	CENTREON,33,"eperi~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"sottosistemi~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"elettrici.~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CAT_PSIAMP	;item category
		dc.b	82		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	1		;flash colour
		dc.b	10		;sample
		dc.w	509		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	6		;level
		ds.b    11
;item 95 :
;initial number of charges = 6
		dc.b	CENTREON,116,"SHOCK~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONICO~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICHE~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Generaun'onda~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"dicompressione~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"dielevata~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"potenzaedŠ~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"dannosoperil~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"molletessuto~~~",ENDTEXT	;info line 10
		dc.b	CENTREON,33,"animaleeper~i~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"sottosistemi~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"elettrici.~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CAT_PSIAMP	;item category
		dc.b	82		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	1		;flash colour
		dc.b	10		;sample
		dc.w	509		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	7		;level
		ds.b    11
;item 96 :
;initial number of charges = 3
		dc.b	CENTREON,116,"RESPIRATORE~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONICO~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"XX CARICHE~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Per4minuti~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"circonda~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"l'utilizzatore~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"conunostrato~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"di6cmdiaria~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"chenonsi~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"esaurisce,~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"permettendogli~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"direspirare~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"sott'acqua.~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_PSIAMP	;item category
		dc.b	79		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	8		;flash colour
		dc.b	10		;sample
		dc.w	255		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	5		;level
		ds.b    11
;item 97 :
;initial number of charges = 2
		dc.b	CENTREON,116,"CANALIZZATORE",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONICO~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICHE~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Creauncanale~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"attraversoi~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"liquidi,chesi~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"estendedalla~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"posizione~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"dell'utilizza-~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"toreverso~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"l'esterno.~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_PSIAMP	;item category
		dc.b	80		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	17		;flash colour
		dc.b	10		;sample
		dc.w	128		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	7		;level
		ds.b    11
;item 98 :
;initial number of charges = 5
		dc.b	CENTREON,116,"DISSETATORE~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONICO~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICHE~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Sevieneusato~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"sott'acqua,crea",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"uncontenitore~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"conliquido~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"purificato~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"adattoal~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"consumoumano.~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_PSIAMP	;item category
		dc.b	80		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	17		;flash colour
		dc.b	10		;sample
		dc.w	128		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	4		;level
		ds.b    11
;item 99 :
;initial number of charges = 5
		dc.b	CENTREON,116,"ISOLANTE~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONICO~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICHE~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Per4minuti~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"avvolgegli~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"effetti~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"personalidichi",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"lousainun~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"involucro~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"invisibilenon~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"poroso.~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_PSIAMP	;item category
		dc.b	79		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	17		;flash colour
		dc.b	10		;sample
		dc.w	255		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	5		;level
		ds.b    11
;item 100 :
;initial number of charges = 20
		dc.b	CENTREON,116,"ELETTRIFICA-~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"TORE PSIONICO",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICHE~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Inviaunadebole",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"scarica~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"elettricaadun~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"bersaglioche~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"stadavantia~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"chilousa.~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_PSIAMP	;item category
		dc.b	82		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	1		;flash colour
		dc.b	10		;sample
		dc.w	509		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	5		;level
		ds.b    11
;item 101 :
;initial number of charges = 15
		dc.b	CENTREON,116,"SAETTA~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONICA~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICHE~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Inviaunaforte~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"scarica~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"elettricaadun~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"bersaglioche~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"stadavantia~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"chilausa.~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_PSIAMP	;item category
		dc.b	82		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	1		;flash colour
		dc.b	10		;sample
		dc.w	509		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	6		;level
		ds.b    11
;item 102 :
;initial number of charges = 10
		dc.b	CENTREON,116,"FULMINATORE~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONICO~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICHE~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Inviauna~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"fortissima~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"scarica~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"elettricaadun~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"bersaglioche~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"stadavantia~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"chilousa.~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_PSIAMP	;item category
		dc.b	82		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	1		;flash colour
		dc.b	10		;sample
		dc.w	509		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	7		;level
		ds.b    11
;item 103 :
;initial number of charges = 3
		dc.b	CENTREON,116,"ESAMINATORE~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONICO~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICHE~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Siintroduce~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"nellagamma~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"sensoriale~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"(S.D.S.)dichi~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"lousa,~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"aumentandole~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"informazioni~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"acquisite~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"sull'ambiente~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"locale.~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_PSIAMP	;item category
		dc.b	80		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	8		;flash colour
		dc.b	10		;sample
		dc.w	255		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	5		;level
		ds.b    11
;item 104 :
;initial number of charges = 5
		dc.b	CENTREON,116,"TELESTRASPOR-",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"TO PSIONICO~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICHE~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Trasporta~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"immediatamente~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"chilousaadun",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"puntoqualunque~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"a40mdi~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"distanza~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"massima.~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_PSIAMP	;item category
		dc.b	80		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	1		;flash colour
		dc.b	10		;sample
		dc.w	255		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	8		;level
		ds.b    11
;item 105 :
;initial number of charges = 5
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICHE~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Purtroppo~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"mancanoinfor-~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mazionisu~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"questooggetto.~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Richiedialla~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"CorporazioneVII",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"unpacchettodi~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"aggiornamento~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuito.~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_PSIAMP	;item category
		dc.b	80		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	1		;flash colour
		dc.b	10		;sample
		dc.w	255		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	6		;level
		ds.b    11
;item 106 :
;initial number of charges = 3
		dc.b	CENTREON,116,"ANTIDOTO~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONICO~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICHE~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Ripulisceil~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"sanguedichilo",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"usadalle~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"tossinealiene;~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Šefficacesolo~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"sugliessere~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"umani.~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_PSIAMP	;item category
		dc.b	77		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	8		;flash colour
		dc.b	10		;sample
		dc.w	128		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	6		;level
		ds.b    11
;item 107 :
;initial number of charges = 3
		dc.b	CENTREON,116,"MEDICINA~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONICA~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICHE~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Accelerail~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"metabolismo,il~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"sistema~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"immunitarioela",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"ricostruzione~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"deitessuti;~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"quindi,guarisce",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"dalleferitee~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"dall'avvelena-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"mento.~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CAT_PSIAMP	;item category
		dc.b	77		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	8		;flash colour
		dc.b	10		;sample
		dc.w	128		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	8		;level
		ds.b    11
;item 108 :
;initial number of charges = 10
		dc.b	CENTREON,116,"TRASMUTATORE~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONICO~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICHE~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Purtroppo~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"mancanoinfor-~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mazionisu~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"questooggetto.~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Richiedialla~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"CorporazioneVII",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"unpacchettodi~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"aggiornamento~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuito.~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_PSIAMP	;item category
		dc.b	80		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	13		;flash colour
		dc.b	10		;sample
		dc.w	128		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	4		;level
		ds.b    11
;item 109 :
;initial number of charges = 3
		dc.b	CENTREON,116,"MIRACOLO~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONICO~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARICHE~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Purtroppo~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"mancanoinfor-~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mazionisu~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"questooggetto.~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Richiedialla~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"CorporazioneVII",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"unpacchettodi~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"aggiornamento~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuito.~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_PSIAMP	;item category
		dc.b	81		;image
                dc.b	CONT_PSIONIC	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0		;water damage * 256 (per second)
		dc.w    15000		;maximum damage
		dc.w	800		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	1		;flash colour
		dc.b	10		;sample
		dc.w	255		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	7		;level
		ds.b    11
;item 110 :
		dc.b	CENTREON,116,"RESTI NON~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"IDENTIFI-~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"CABILI~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"L'analisi~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"riportatracce~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"organiche,~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"carboneeun23%",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"disostanze~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"molecolarinon~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"identificate.~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_TRASH	;item category
		dc.b	86		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    0		;maximum damage
		dc.w	66		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	0		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		ds.b	12
;item 111 :
		dc.b	CENTREON,116,"MINA DI~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PROSSIMITA~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"*INNESCATA*~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Provocauno~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"scoppiotremendo",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"che~mutilaenon",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"uccide;funziona",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"apressione.~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_ARMED_MINE	;item category
		dc.b	87		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    20000           ;maximum damage
		dc.w	450		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	2		;fireball density north (1-4, 0=none)
		dc.b	2		;fireball density south (1-4, 0=none)
		dc.b	2		;fireball density east (1-4, 0=none)
		dc.b	2		;fireball density west (1-4, 0=none)
		dc.b	2		;fireball density down (1-4, 0=none)
		dc.b	2		;fireball density up (1-4, 0=none)
		dc.w	125		;damage * 512
		dc.b	0		;armed item
		ds.b    3
;item 112 :
		dc.b	CENTREON,116,"MINA DI~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PROSSIMITA II",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"*INNESCATA*~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Generauno~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"scoppiotremendo",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"chenonmutila~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"mauccide;~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"funzionaa~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"pressione.~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_ARMED_MINE	;item category
		dc.b	88		;image
                dc.b	CONT_SMALLCRATE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	0               ;water damage * 256 (per second)
		dc.w    20000           ;maximum damage
		dc.w	450		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	4		;fireball density north (1-4, 0=none)
		dc.b	4		;fireball density south (1-4, 0=none)
		dc.b	4		;fireball density east (1-4, 0=none)
		dc.b	4		;fireball density west (1-4, 0=none)
		dc.b	4		;fireball density down (1-4, 0=none)
		dc.b	4		;fireball density up (1-4, 0=none)
		dc.w	250		;damage * 512
		dc.b	0		;armed item
		ds.b    3
;item 113 :
		dc.b	CENTREON,116,"NOCCIOLE~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DANNI~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Purtroppo~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"mancanoinfor-~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mazionisu~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"questooggetto.~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Richiedialla~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"CorporazioneVII",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"unpacchettodi~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"aggiornamento~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuito.~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CAT_FOOD	;item category
		dc.b	89		;image
                dc.b	CONT_CONSUMABLE	;container type (2=treasure,3=green,4=red,5=BIGCRATE)
		dc.b	2               ;water damage * 256 (per second)
		dc.w    10000		;maximum damage
		dc.w	100		;weight
		dc.w	0		;anim colour
		dc.b	0		;anim
		dc.b	0		;anim duration
		dc.b	0		;flash colour
		dc.b	0		;sample
		dc.w	256		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.w	10000		;fitness boost
		dc.w	0		;physique boost
		dc.w	0		;agility boost
		dc.w	0		;duration of ph & ws boost
		ds.b	4
