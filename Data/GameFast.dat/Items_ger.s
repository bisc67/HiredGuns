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
		dc.b	CENTREON,116,"Zerstîrungs-~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"kanone~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"X Schuss~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"EinederstÑrk-~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"stentragbaren~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Waffen,diees~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"gibt.Geringe~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Feuergeschw.,~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Schadenswirkung~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"immens.Spez.~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Zerstîrungs-.~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"munition~~~~~~~~",ENDTEXT	;info line 10
		dc.b	CENTREON,33,"erforderlich.~~~",ENDTEXT	;info line 6
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
		dc.b	CENTREON,116,"Raketenwerfer",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"RPG F~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"X Schuss~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Raketengranate~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"dernordeuro-~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"pÑischen~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"F-Serie.~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"PreisgÅnstigstes",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Modellseitdrei",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Jahren.~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"Raketenstufe~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"erforderlich.~~~",ENDTEXT	;info line 6
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
		dc.b	CENTREON,116,"Neutronen-~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"laserkanone~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX Schuss~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"FÅrEinsatzin~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Vakuum,weniger~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"effektivin~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"AtmosphÑre.~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"PreisdesPrince",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"ofWalesfÅr~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Innovationund~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Design.Mindest-",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Ladung1kJoule.",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Mg auf platt-",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"form~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX Schuss~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Lieferungals~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"SatzfÅrMontage",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"auf70-mm-~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Plattform.~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"fÅrNahunter-~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"stÅtzungs-und~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Punktverteidi-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"gungsfahrzeuge.~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Munitions-~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"kaliber44~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Fluorhydro-~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"gen-handlaser",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX Schuss~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"ErsteGeneration",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"optischerWaffen",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"geringerMasse.~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"2711von~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"NaomiOptics~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"patentiert.~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Mindestladung~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"1kJoule.~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Partikel-~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"strahlgewehr~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX Schuss~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"DasStrahlgewehr",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"basiertauf~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"EnergieÅber-~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"gÑngenimUV-~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Bereich.~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"DasErgebnisist",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"einehoheZer-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"stîrungswirkung.",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Mindestladung~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"1kJoule.~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Handwaffe 9~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"imperial auto",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX Schuss~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"DiesesModell~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"hatgro·e~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"GerÑusch-und~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"RÅcksto·probleme",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"-nuretwasfÅr~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Enthusiastenund",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Sammler.~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Munitionskaliber",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"9mm.~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Flammenwerfer",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"OXY 6~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 100 ccm~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Feuerreichweite~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"undeingebauter~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Flammenschutz~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"bildenden~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"neuestenStand~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"derPersonen-~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"sicherheit.~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"min.100ccm~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Brennstoff.~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Flammenwerfer",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"OXY 6 junior~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 50 ccm~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"EinHandflammen-",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"werfer,dessen~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Brennstoffaus~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"einemspeziellen",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"chemischen~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Gemischbesteht.",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"min.100ccm~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Brennstoff.~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Supercovert~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"(DÑmpfer)~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Schuss~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"VonAntiterror-~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"einheitenwegen~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"desaustausch-~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"barenLaufsund~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"derZiel-CPU-~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Einheitbevor-~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"zugt.~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Munitionskaliber",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"9mm.~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Handwaffe 6~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DÑmpfer-auto~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX Schuss~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Eineleichte~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"HandwaffefÅr~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"kurzeEntfernun-",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"gen,aufWunsch~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"mitSchall-~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"dÑmpferundver-",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"lÑngertemLauf.~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Munitionskaliber",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"9mm.~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Mini-MG auf~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"plattform~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX Schuss~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"DieseWaffeist~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"fÅrmilitÑ-~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"rischeZwecke~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"gedachtund~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"stehtfÅrden~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"zivilenBereich~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"nichtzurVer-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"fÅgung.~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Munitionskaliber",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"44.~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Autom. waffe~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"M73~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX Schuss~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"VerfÅgtÅber~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"einehoheFeuer-",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"geschwindigkeit.",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"EineguteAll-~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"zweckwaffe.~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Munitionskaliber",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"44.~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"ScharfschÅt-~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"zengewehr~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX Schuss~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"einschwacher~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"ErsatzfÅrdie~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Paletteder~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"treffsicheren~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Gewehremitder~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Handwaffe6.~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"ZugeringeAn-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"fangsgeschwind.~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Munitionskaliber",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"9mm.~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Gewehr mit~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"wolframseele~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Schuss~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Eineanerkannte~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Palettevon~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Sportgewehrenu.",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Handfeuerwaffen.",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Normalerw.als~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Boxsetmitpas-~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"senderHand-~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"waffegeliefert.",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Patronenmunition",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"Smith &~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Wesson 29~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"X Schuss~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"DiebesteHand-~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"waffe,diees~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"gibt.Dieechte~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"kannnurvonder",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Erdeimportiert~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"werden.~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Munitionskaliber",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"9mm.~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Jagdgewehr~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"X Schuss~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"NiedrigeFeuer-~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"geschwindigkeit,",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"aberpotentiell~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"hoheSchadens-~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"wirkung.~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"GenauesZielen~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"nichtnotwendig.",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Patronenmunition",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"18.~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"NDVP~~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"version 38~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Schuss~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Standardversion~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"fÅrAgentendes~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"NDderVereinig-",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"tenPlaneten.~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Raffiniertes~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"FeuergerÑt,mit~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"demBrÅchebe-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"wirktwerden.~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Munitionskaliber",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"38.~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Blaster 52-C~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Schuss~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"SehrgefÑhrliche",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Waffe,diedurch",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"WellenWassermo-",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"lekÅleorgani-~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"scherSubstanzen",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"verdampfenlÑ·t.",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Mindestladung~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"1kJoule.~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Handwaffe M.~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"wolframseele~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Schuss~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Eineanerkannte~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Palettevon~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Sportgewehrenu.",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Handfeuerwaffen.",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Normalerw.als~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Boxsetmitpas-~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"senderHand-~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"waffegeliefert.",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Patronenmunition",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"Schall-~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"schocker~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX Schuss~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Stîrtden~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"meschlichen~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Gleichgewichts-~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"sinndurchEin-~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"wirkungvon~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Ultraschall.~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Mindestladung~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"1kJoule.~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Nicht identi-",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"fizierbare~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"reste~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Analyse~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"ergibt~~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"organische~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Spuren,~~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Kohlenstoff~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"und23%nicht~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"identifizierte~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"molekulare~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Substanzen.~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"Banane~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX Stöck~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Unterspez.Be-~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"dingungenange-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"bauteFrucht.~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"MitLizenzdes~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Patentbesitzers~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"BananaCorp~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"aufverschiede-~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"nenPlantagen~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"angebaut.~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"EMF-Schocker~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Schuss~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Induziertein~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"starkeselektro-",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"magnetisches~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Feld,dasden~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Feindaufmole-~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"kularerEbene~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"vernichtet.~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Mindestladung~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"1kJoule.~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Sturmgewehr~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Naomi IV~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX Schuss~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"DasGegenstÅck~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"zurlegendÑren~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"M73,entwickelt~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"vomNaomi-~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Institut,mit~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Laservisierund~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"geringemRÅck-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"sto·.~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Munitionskaliber",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"9mm.~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Granat-~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"werfer Naomi~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"X Schuss~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Neuesteu.wahr-",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"scheinlich~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"letzteEntwick-~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"lungdesNaomi-~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Instituts.~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Modellbeschrif-~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"tung'Bohnen-~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"knaller'.~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Munition:40-mm-",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Sprenggranaten.~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"40-mm-spreng-",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"granaten~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Schuss~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"öblicheGrî·e~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"undFormatdes~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Pakets.~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Derzellkerami-~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"sche,hochver-~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"dichteteSpreng-",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"stofferzeugtf.",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"ihreGrî·eeine~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"beeindruckende~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Detonation.~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Fusions-~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Ringbatterie~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"Einheit 1~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"Inaktiv~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Liefert6Jahre~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"lang4Megawatt~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Strom.~~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"GehÑusenicht~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"indieNÑhe~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"starkerMagnet-~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"felderbringen!~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"Autom. wach-~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"anlage (1 RI)",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Kanone(n)~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Automatische~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Ein-Richtungs-~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Wachanlage,~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"feuertaufjedes",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Ziel,dassich~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"direktvorder~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Kanonebewegt.~~",ENDTEXT	;info line 6
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
		dc.b	CENTREON,116,"Ziegel~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Ziegelsinddas~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"wichtigsteMate-",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"rialfÅrdenBau",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"vonGebÑuden,~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"wennMetall~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"knappoder~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Kunststoffzu~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"teuerist.~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"Zerbrochene~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"flasche~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"DerNachteilvon",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Flaschenglasist",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"seineSprîdheit~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"imVergleichmit",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"modernerenGlas-",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"stoffen.Eskann",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"zerbrechenund~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"hatdannscharfe",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"undgefÑhrliche",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Kanten.~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Autom. Wach-~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"anlage (MEHR)",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Kanone(n)~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Automatische~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Mehrrichtungs-~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"wachanlage,~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"feuertaufjedes",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Ziel,wobeisie~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"sichaufihrem~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Untersatzdreht.",ENDTEXT	;info line 6
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
		dc.b	CENTREON,116,"Néherungsmine",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Lîststarken~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Schlagaus,~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Opfersoll~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"betÑubt,nicht~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"unbedingt~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"getîtetwerden.~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Auslîsung~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"durch~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Druck.~~~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"NÑherungsmine",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"version 2.~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Lîststarken~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Schlagaus,~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Opfersoll~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"sofortgetîtet,~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"nichterst~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"betÑubtwerden.~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Auslîsung~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"durch~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Druck.~~~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"Zerstôrungs-~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ladung~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Standardladungs-",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"modul,wirdan~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Zerstîrungs-~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"kanoneange-~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"schlossen.~~~~~~",ENDTEXT	;info line 5
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
		dc.b	CENTREON,116,"Antischötzen-",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"panzer-rakete",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Feststoffrakete~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"hoherDichte.~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Mikrodetona-~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"tionsradius.~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Vonfastallen~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Raketenwerfern~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"einsetzbar.~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,".44 Hoch-AET~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"sébel MK II~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX Schuss~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Munitionmit~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"schnellerEner-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"gieumsetzung~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"(AET).Fastdie~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"gesamtekineti-~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"scheEnergie~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"wirdimZielum-",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"gesetztundist~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"besonders~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"effektiv.~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,".44 THV~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX Schuss~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"DieneustesAET.",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"GutePanzerungs-",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"durchschlagkraft",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"kaumAbprallen,~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"kaumRÅckschlag,",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"hervorragende~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Stoppwirkung.~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"9-mm-Super-~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"schnell-AET~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX Schuss~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"GebrÑuchlichstes",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Munitionskali-~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"ber,auchals~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,".44mmlieferbar.",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"HoheEindring-~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"tiefebedingt~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"schwacheStopp-~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"wirkungaufle-~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"bendeZiele.~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Flammenwer-~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"feraufföllung",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 100 ccm~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"BilligesNeben-~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"produktminder-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"wertigerchem.~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Brennstoffe.~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Besondersstarke",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"saubereFlamme~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"mitdentragba-~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"renFlammenwer-~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"fernder~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Oxy-6-Palette.~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"FW-Aufföllung",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"(UX Gas)~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 100 ccm~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"BilligesNeben-~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"produktminder-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"wertigerchem.~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Brennstoffe.~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Besondersstarke",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"saubereFlamme~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"mitdentragba-~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"renFlammenwer-~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"fernder~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Oxy-6-Palette.~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"FW-Aufföllung",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"junior~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 50 ccm~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"BilligesNeben-~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"produktminder-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"wertigerchem.~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Brennstoffe.~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Besondersstarke",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"saubereFlamme~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"mitdentragba-~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"renFlammenwer-~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"fernder~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Oxy-6-Palette.~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"FW-Aufföllung",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"junior UX gas",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 100 ccm~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"BilligesNeben-~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"produktminder-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"wertigerchem.~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Brennstoffe.~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Besondersstarke",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"saubereFlamme~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"mitdentragba-~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"renFlammenwer-~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"fernder~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Oxy-6-Palette.~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"HochexpL.~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"laufmuni 18~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Schuss~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Jagdmunition.~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"DieseVersion~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"enthÑltstatt~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Pelletseinen~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Sprengkopfmit~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"einerhochexplo-",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"siven,geformten",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"Ladung.~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Geriffelte~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"laufmuni 18~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Schuss~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Einabgerei-~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"cherterUran-~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"kernsichert~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"eineguteEin-~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"dringleistung.~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"DieRiffelung~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"erhîhtdie~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"Genauigkeit.~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"9-mm-THV~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"'mini'-serie~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX Schuss~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"AET-Kompakt-~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Munition.Durch-",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"schnittl.Panze-",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"rungsdurch-~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"schlag,kaum~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Abprallen,gute~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Stoppwirkung.~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"AuchimFormat~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,".44mm.~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Glaser-munit.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"för .38 NDVP~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Schuss~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Sehrteureund~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"exklusiveMuni-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"tion,dienur~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"vomNDVPverwen-",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"detwird.~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Istschwerzu~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"beschaffen.~~~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"1-kjoule-~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"monozelle~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Ladung(EN)",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Eine1-kJ-Ladung",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"mitStandard-AA-",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"AnschlÅssenfÅr~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Energiewaffen.~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"FÅrImpulslaser~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"undProtonen-~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"emitter~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"empfohlen.~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"3-kjoule-~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"doppelzelle~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Ladung(EN)",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Eine3-kJ-Ladung",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"mitStandard-AA-",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"AnschlÅssenfÅr~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Energiewaffen.~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Bitterichtige~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"PolaritÑt~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"gewÑhrleisten.~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"6-kjoule-~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"dreifachzelle",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Ladung(EN)",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Eine6-kJ-Ladung",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"mitStandard-AA-",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"AnschlÅssenfÅr~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Energiewaffen.~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"FÅrHandwaffen~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"anwendbar.Meist",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"fÅrfahrzeugmon-",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"tierteWaffen~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"eingesetzt.~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"Nicht Identi-",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"fizierbare~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"reste~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Analyse~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"ergibt~~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"organische~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Spuren,~~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Kohlenstoff~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"und23%nicht~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"identifizierte~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"molekulare~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Substanzen.~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"Bananenstöcke",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX Stöck(E)~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Leiderkeine~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"weiterenInfor-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mationenzu~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"diesemObjekt.~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Bitteîrtlichen~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Guild-VII-Ver-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"treternach~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Gratis-Update-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Paketfragen.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Knuspriges~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"baguette~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Leiderkeine~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"weiterenInfor~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mationenzu~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"diesemObjekt.~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Bitteîrtlichen~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Guild-VII-Ver-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"treternach~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Gratis-Update-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Paketfragen.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Kése~~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"KÑseersatzist~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"ein~sehrgehalt-",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"vollesNahrungs-",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"mittel.Erist~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"mitVitaminen~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"angereichertund",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"wurdefÅrRaum-~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"missionenent-~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"wickelt.~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Flasche~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX%~Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Flaschenwerden~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"ausSilikather-",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"gestellt,d.auf",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"hoheTemperatu-~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"renerhitztwird",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"undsoGlaser-~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"gibt.Dernied-~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"rigePreisist~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"derHauptvorteil",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"beidiesemGlas.",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Apfel~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Weitverbreitete~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Frucht.LÑ·t~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"sichleichtan-~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"bauenundist~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"dahervom~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Patent-undLi-~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"zenzgesetzvon~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"2609ausge-~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"nommen.~~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"Héhnchenkeule",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Leiderkeine~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"weiterenInfor-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mationenzu~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"diesemObjekt.~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Bitteîrtlichen~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Guild-VII-Ver-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"treternach~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Gratis-Update-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Paketfragen.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Grosser brot-",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"laib~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Leiderkeine~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"weiterenInfor-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mationenzu~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"diesemObjekt.~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Bitteîrtlichen~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Guild-VII-Ver-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"treternach~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Gratis-Update-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Paketfragen.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Feldflasche~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Leiderkeine~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"weiterenInfor-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mationenzu~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"diesemObjekt.~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Bitteîrtlichen~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Guild-VII-Ver-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"treternach~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Gratis-Update-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Paketfragen.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Standard-~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"rationen I~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"AufStufe1~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"konzentrierte~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Rationen.Sind~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"geschmacklos,~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"enthaltenaber~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"alles,wasder~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Kîrperbraucht~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"(au·erWasser).~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Standard-~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"rationen II~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"AufStufe2~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"konzentrierte~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Rationen.Sind~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"denenderStufe~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"1Ñhnlich,haben",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"aberEnergiever-",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"stÑrkungseigen-~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"schaften.~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"Standard-~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"rationen III~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"AufStufe3~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"konzentrierte~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Rationen.Ent-~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"haltenzusÑtzl.~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"chem.u.organ.~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Bestandteilezur",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Ausdauererhî-~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"hung.Nursicher",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"innormaler~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Dosis.~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Feldapotheke~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Zurmedizischen~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Grundhilfe,mit~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"nichtverderbli-~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"chenLebensmit-~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"telnundeiner~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"PalettevonGe-~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"gengiften.~~~~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"Antigift-~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"spritze~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Gefechtsfeld-~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"drogezurzeit-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"weiligenImmuni-",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"sierunggegen~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"ÅblicheGift-~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"stoffe.Normale~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Wirkungszeit:~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"ungefÑhrvier~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Minuten.~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"Droiden-~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"reparatursatz",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"WichtigerSatz~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"zurSelbstrepa-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"raturvonDroi-~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"denunterden~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"fortgeschritte-~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"nenZivilisatio-",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"nen,kompl.mit~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"Diagnosetafel,~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"AuffÅllerund~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Farbe.~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Fusions-~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ringbatterie~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"Einheit 2~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"Inaktiv~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Liefert6Jahre~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"lang4Megawatt~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Strom.~~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"GehÑusenicht~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"indieNÑhe~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"starkerMagnet-~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"felderbringen!~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"Fusions-~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ringbatterie~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"Einheit~3~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"Inaktiv~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Liefert6Jahre~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"lang4Megawatt~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Strom.~~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"GehÑusenicht~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"indieNÑhe~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"starkerMagnet-~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"felderbringen!~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"Fusions-~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Ringbatterie~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"Einheit 4~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"Inaktiv~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Liefert6Jahre~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"lang4Megawatt~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Strom.~~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"GehÑusenichtin",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"indieNÑhe~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"starkerMagnet-~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"felderbringen!~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Leiderkeine~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"weiterenInfor-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mationenzu~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"diesemObjekt.~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Bitteîrtlichen~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Guild-VII-Ver-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"treternach~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Gratis-Update-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Paketfragen.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Normaler~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"schlössel~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Leiderkeine~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"weiterenInfor-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mationenzu~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"diesemObjekt.~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Bitteîrtlichen~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Guild-VII-Ver-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"treternach~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Gratis-Update-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Paketfragen.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Ornamenten-~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"schlössel~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Leiderkeine~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"weiterenInfor-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mationenzu~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"diesemObjekt.~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Bitteîrtlichen~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Guild-VII-Ver-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"treternach~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Gratis-Update-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Paketfragen.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Zutrittsbe-~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"rechtigungs-~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"karte~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"nur zivil.~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Sicherheitskarte",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"derniedrigen~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Stufe.~~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"DientdemSchutz",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"festgelegter~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Sicherheits-~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"zonen.~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"Zutrittsbe-~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"rechtigungs-~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"karte fÅr~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"alle zonen.~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Sicherheitskarte",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"derhîchsten~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Stufe.~~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"DientdemSchutz",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"festgelegter~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Sicherheits-~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"zonen.~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"Zutrittsbe-~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"rechtigungs-~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"karte~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"nur beschÑf.",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Sicherheitskarte",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"dermittleren~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Stufe.~~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"DientdemSchutz",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"festgelegter~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Sicherheits-~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"zonen.~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"Zutrittsbe-~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"rechtigungs-~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"karte~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"nur offiz.~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Sicherheitskarte",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"derhohen~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Stufe.~~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"DientdemSchutz",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"festgelegter~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Sicherheits-~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"zonen.~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,33,"Leiderkeine~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"weiterenInfor-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mationenzu~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"diesemObjekt.~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Bitteîrtlichen~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Guild-VII-Ver-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"treternach~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Gratis-Update-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Paketfragen.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,33,"Istbesonders~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"beiJournalisten",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"beliebt,da~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"nachweisbarist,",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"da·dieAuf-~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"zeichnungen~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"wedergeÑndert~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"nochgefÑlscht~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"sind.~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"DTS-Einheit~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Digitaler~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Terrain-~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Scanner.~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Diesestragbare~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"GerÑtbietet~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"visuelleAnzeige",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"undtaktische~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"Datenbankder~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"aktuellen~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Umgebung.~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"DTS-Einheit~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"'ultra' proto",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Leiderkeine~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"weiterenInfor-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mationenzu~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"diesemObjekt.~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Bitteîrtlichen~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Guild-VII-Ver-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"treternach~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Gratis-Update-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Paketfragen.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Leiderkeine~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"weiterenInfor-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mationenzu~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"diesemObjekt.~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Bitteîrtlichen~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Guild-VII-Ver-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"treternach~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Gratis-Update-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Paketfragen.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Psionenverst.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Feuerball~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Munition~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Erzeugteinen~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"mittelstarken~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Plasmafeuer-~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"balldirekt~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"vordem~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Anwender.~~~~~~~",ENDTEXT	;info line 6
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
		dc.b	CENTREON,116,"Psionenverst.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Inferno~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Munition~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Erzeugteinen~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Plasmafeuerball~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"vollerStÑrke~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"direktvordem~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Anwender.~~~~~~~",ENDTEXT	;info line 5
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
		dc.b	CENTREON,116,"Psionenverst.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Feuersturm~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Munition~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Erzeugtvier~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"mittelstarke~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Plasmafeuer-~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"bÑlleumden~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Anwenderherum.~",ENDTEXT	;info line 5
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
		dc.b	7		;level
		ds.b    11
;item 84 :
;initial number of charges = 5
		dc.b	CENTREON,116,"Psionenverst.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Vernichtung~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Munition~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Erzeugtvier~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Plasmafeuer-~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"bÑllevoller~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"StÑrkeumden~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Anwenderherum,~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"dienichtzer-~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"fallen.~~~~~~~~~",ENDTEXT	;info line 6
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
		dc.b	CENTREON,116,"Psionenverst.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Feuerschild~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Munition~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"SchÅtztein~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Volumenvon~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"2Kubikmetern,~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"normalerweise~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"denAnwender,~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"vordenmeisten~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Effektenvon~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"Plasmawaffen.~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"Psionenverst.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Schild~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Munition~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"SchÅtztein~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Volumenvon~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"2Kubikmetern,~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"normalerweise~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"denAnwender,~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"vordenmeisten~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Effektenvon~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"Geschossenund~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Handwaffen.~~~~~",ENDTEXT	;info line 9
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
		dc.b	7		;level
		ds.b    11
;item 87 :
;initial number of charges = 5
		dc.b	CENTREON,116,"Psionenverst.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Granitkraft~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX MUNITON~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Erhîhtden~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Stoffwechseldes",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Anwendersumdas",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Dreifache.Be-~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"wirkteineef-~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"fektiveErhî-~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"hungderKraft~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"undAusdauer~des",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Anwenders.Wirkt",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"vierMin.lang.~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Psionenverst.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Titankraft~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Munition~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Erhîhtden~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Stoffwechseldes",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Anwendersumdas",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Sechsfache.Be-~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"wirkteineef-~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"fektiveErhî-~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"hungderKraft~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"undAusdauer~des",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Anwenders.Wirkt",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"vierMin.lang.~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Psionenverst.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Wand~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Munition~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Erzeugtein~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"fastunzerstîr-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"baresResonanz-~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"feld,dasfeste~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Materieabstî·t.",ENDTEXT	;info line 5
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
		dc.b	6		;level
		ds.b    11
;item 90 :
;initial number of charges = 3
		dc.b	CENTREON,116,"Psionenverst.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Bannwand~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Munition~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Durchbrichtund~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"zerstreut~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Resonanzfelder,~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"dienormaler-~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"weisefeste~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"Materie~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"absto·en.~~~~~~~",ENDTEXT	;info line 6
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
		dc.b	CENTREON,116,"Psionenverst.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Bröcke~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Munition~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Erzeugteine~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"stabile,selbst-",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"tragendePlatt-~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"formdirektvor~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"demAnwender.~~~",ENDTEXT	;info line 5
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
		dc.b	CENTREON,33,"Leiderkeine~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"weiterenInfor-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mationenzu~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"diesemObjekt.~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Bitteîrtlichen~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Guild-VII-Ver-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"treternach~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Gratis-Update-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Paketfragen.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Psionenverst.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Feder~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Munition~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Bewirkteine~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"effektiveVer-~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"ringerungdes~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Gewichtsd.Aus-",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"rÅstungsgegen-~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"stÑnded.Anwen-",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"ders,abernicht",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"desAnwenders~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"selbst.~~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"Psionenverst.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Schallwelle~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Munition~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Erzeugteine~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Druckwellemit~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"gemÑ·igterZer-~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"stîrungswirkung.",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Zerrei·tweiches",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"tierischesGewe-",ENDTEXT	;info line 10
		dc.b	CENTREON,33,"webesowieelek-",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"trischeUnter-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"systeme.~~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"Psionenverst.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Schockwelle~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Munition~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Erzeugteine~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Druckwellemit~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"starkerZerstî-~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"rungswirkung.~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Zerrei·tweiches",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"tierischesGewe-",ENDTEXT	;info line 10
		dc.b	CENTREON,33,"webesowieelek-",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"trischeUnter-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"systeme.~~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"Psionenverst.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Lamellen~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"XX Munition~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"UmgibtdenAn-~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"wendermiteiner",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"6cmdicken~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Luftschicht,die",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"sichselbstauf-",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"fÅllt.Ermîg-~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"lichteffektive~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"Unterwasserat-~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"mung.Wirkung~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"hÑlt4Minan.~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Psionenverst.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Partikelwelle",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Munition~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Erzeugteinen~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Kanaldurchdie~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"meistenFlÅssig-",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"keiten,dervon~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"derPositiondes",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Anwendersaus-~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"geht.~~~~~~~~~~~",ENDTEXT	;info line 7
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
		dc.b	7		;level
		ds.b    11
;item 98 :
;initial number of charges = 5
		dc.b	CENTREON,116,"Psionenverst.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Quench~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Munition~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"BeiAnwendung~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"unterWasserer-",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"zeugtdieser~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"EffekteinBe-~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"hÑltnismitge-~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"reinigterFlÅs-~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"sigkeit,dievon",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"Menschengetrun-",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"kenwerdenkann.",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"Psionenverst.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Wasserdicht~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Munition~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Erzeugtunsicht-",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"bare,undurch-~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"lÑssigeSchicht~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"umd.AusrÅ-~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"stungsgegenstÑn-",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"ded.Anwenders.",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Wirkt4Minuten~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"lang.~~~~~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"Psionenverst.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Elektrisierer",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Munition~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Feuerteine~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"schwacheelek-~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"trischeLadung~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"aufeindirekt~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"vordemAnwender",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"befindliches~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Ziel.~~~~~~~~~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"Psionenverst.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Blitz~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Munition~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Feuerteine~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"starkeelektri-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"scheLadungauf~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"eindirektvor~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"demAnwender~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"befindliches~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Ziel.~~~~~~~~~~~",ENDTEXT	;info line 6
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
		dc.b	CENTREON,116,"Psionenverst.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Rôster~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Munition~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Feuerteinesehr",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"starkeelektri-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"scheLadungauf~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"eindirektvor~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"demAnwender~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"befindliches~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Ziel.~~~~~~~~~~~",ENDTEXT	;info line 6
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
		dc.b	CENTREON,116,"Psionenverst.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Fernsicht~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Munition~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Wirddirektim~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"DTS-Sensorbe-~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"reichdesAnwen-",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"derswirksam.~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"FÅhrtzueinem~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"effektivenZu-~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"wachsderÅber~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"dieîrtlicheUm-",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gebunggespei-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"chertenInfos.~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Psionenverst.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Teleport~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Munition~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Teleportiert~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"denAnwender~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"sofortzu~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"irgendeinem~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Punkt40m~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"weiter.~~~~~~~~~",ENDTEXT	;info line 6
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
		dc.b	CENTREON,116,"XX Munition~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Leiderkeine~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"weiterenInfor-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mationenzu~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"diesemObjekt.~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Bitteîrtlichen~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Guild-VII-Ver-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"treternach~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Gratis-Update-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Paketfragen.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Psionenverst.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Heilgift~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Munition~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"ReinigtBlut-~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"kreislaufdes~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Anwendersvon~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"giftigenFremd-~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"stoffen.~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Istnurbei~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"menschlichen~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"Zieleneffektiv.",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"Psionenverst.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Heiler~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Munition~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"ErhîhtStoff-~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"wechseldes~An-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"wenders,Erho-~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"lungdesImmun-~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"systemsund~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Gewebes.~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Endeffekt:~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"Heilenvon~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"Wundenund~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"Vergiftungen.~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"Psionenverst.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Transmutator~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Munition~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Leiderkeine~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"weiterenInfor-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mationenzu~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"diesemObjekt.~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Bitteîrtlichen~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Guild-VII-Ver-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"treternach~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Gratis-Update-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Paketfragen.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Psionenverst.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"Wunder~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX Munition~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Leiderkeine~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"weiterenInfor-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mationenzu~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"diesemObjekt.~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Bitteîrtlichen~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Guild-VII-Ver-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"treternach~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Gratis-Update-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Paketfragen.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Nicht Identi-",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"fizierbare~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"reste~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Analyse~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"ergibt~~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"organische~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Spuren,~~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Kohlenstoff~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"und23%nicht~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"identifizierte~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"molekulare~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Substanzen.~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"Néherungsmine",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"** Scharf **~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Lîststarken~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Schlagaus,~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Opfersoll~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"betÑubt,nicht~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"unbedingt~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"getîtetwerden.~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Auslîsung~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"durch~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Druck.~~~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"NÑherungsmine",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"version 2.~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"** Scharf **~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Lîststarken~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Schlagaus,~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Opfersoll~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"sofortgetîtet,~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"nichterst~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"betÑubtwerden.~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Auslîsung~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"durch~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Druck.~~~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"Nösse~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% Schaden~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Leiderkeine~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"weiterenInfor-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mationenzu~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"diesemObjekt.~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Bitteîrtlichen~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Guild-VII-Ver-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"treternach~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Gratis-Update-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Paketfragen.~~~",ENDTEXT	;info line 10
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
