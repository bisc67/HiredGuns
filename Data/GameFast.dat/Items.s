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
		dc.b	CENTREON,116,"DISRUPTOR~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"CANNON~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"X CHARGE(S)~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"thisisoneof~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"themostpower-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"fulman-portable",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"weaponsavail-~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"able.although~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"therateoffire",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"islow,thedam-",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"ageisimmense.~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"requiresdis-~~~",ENDTEXT	;info line 10
		dc.b	CENTREON,33,"ruptorcharge.~~",ENDTEXT	;info line 6
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
		dc.b	CENTREON,116,"RPG F ROCKET~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"LAUNCHER~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"X ROCKET(S)~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"northeuropanf~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"seriesrocket~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"propelled~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"grenade.~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"bestbudget~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"modelthree~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"yearsrunning.~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"requiresrocket.",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"NEUTRON-FLUX~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"LASER CANNON~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX CHARGE(S)",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"foruseinvac-~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"uum,lesseffec-",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"tivethrough~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"atmospherics.~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"princeofwales~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"awardfor~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"innovation~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"anddesign.~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"requires1kjoule",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"chargeormore.~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"MOUNTED~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"MACHINE GUN~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX ROUND(S)~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"suppliedinkit~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"formformount-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"ingon70mm~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"bearing.~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"recommendedfor~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"closesupport~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"andpointdef-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"encevehicles.~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"requires.44~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"calibreammo.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"HYD-FLUORINE~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"HAND LASER~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX CHARGE(S)",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"thefirstgener-",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"ationoflow~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"massoptical~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"weapons.patent-",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"edbynaomi~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"opticsin2711.~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"requires1kjoule",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"chargeormore.~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"PARTICLE BEAM",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"RIFLE~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX CHARGE(S)",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"thebeamrifle~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"isbasedaround~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"theenergy~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"transitionsin~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"theultraviolet",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"range.the~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"resultisvery~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"destructive.~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"requires1kjoule",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"chargeormore.~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"SMALL-ARMS 9~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"IMPERIAL AUTO",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX ROUND(S)~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"sufferingfrom~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"extremenoise~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"andrecoilprob-",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"lems,thismodel",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"onlyappealsto~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"enthusiastsand~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"collectors.~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"requires9mm~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"calibreammo.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"OXY 6 FLAMER~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 100cc~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"featuringa~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"builtinflame-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"backguard.the~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"oxyrangedef-~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"inesthestate~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"oftheartin~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"personal~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"security.~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"requires100cc~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"offuelormore.",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"OXY 6 FLAMER~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"JUNIOR~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 50cc~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"thisisa~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"handheldflame-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"throwerwhichis",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"firedbyafuel~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"packconsisting~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"ofaspecialmix",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"ofchemicals.~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"requires100cc~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"offuelormore.",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"(SILENCED)~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"SUPERCOVERT~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX ROUND(S)~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"favouredamongst",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"anti-terrorist~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"organisations~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"foritsinter-~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"changeable~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"barreland~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"targetingcpu.~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"requires9mm~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"calibreammo.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"SILENT-AUTO~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX ROUND(S)~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"alightweight~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"shortrange~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"handgun.~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"featuring~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"optional~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"silencerand~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"barrel~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"extension.~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"requires9mm~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"calibreammo.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"MOUNTED~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"MINI-GUN~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX ROUND(S)~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"thisweapon~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"isamilitary~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"gradedevice~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"andassuch~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"isnot~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"availablefor~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"civilianuse.~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"requires.44~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"calibreammo.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"M73 AUTO-GUN~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX ROUND(S)~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"thishasa~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"substantial~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"rateoffire.~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"itisagood~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"generalpurpose~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"weapon.~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"requires.44~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"calibreammo.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"SNIPER RIFLE~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX ROUND(S)~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"apoorsubs-~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"tituteforthe~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"smallarms6~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"rangeofperf-~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"ormancetarget~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"rifles.hampered",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"bypoormuzzle~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"velocity.~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"requires9mm~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"calibreammo.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"TUNGSTEN-~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"BORE RIFLE~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX ROUND(S)~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"acelebrated~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"rangeofsport-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"ingriflesand~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"handguns.~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"usuallyprovided",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"asaboxedset~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"withamatching~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"handgun.~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"requires18bore",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"cartridges.~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"X ROUND(S)~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"thehighest~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"qualityhandgun~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"available.the~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"genuineitemis~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"importedonly~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"fromearth.~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"requires9mm~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"calibreammo.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"SHOTGUN~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"X SLUG(S)~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"lowrateof~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"firebut~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"potentially~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"highdamage.~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"accurateaiming~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"notrequired.~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"requires18bore",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"cartridges.~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"UPBI ISSUE 38",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX ROUND(S)~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"standardissue~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"forunited~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"planetsbureau~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"ofinvestigation",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"agents.quirky~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"firingmechanism",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"mayleadto~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"fracturing.~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"requires.38~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"calibreammo.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"BLASTER 52-C~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGE(S)~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"averynastygun",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"thatoperatesat",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"wavelengths~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"designedto~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"vaporisewater~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"moleculesin~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"organicsub-~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"stances.~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"requires1kjoule",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"chargeormore.~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"TUNGSTEN-~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"BORE HANDGUN~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX SLUG(S)~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"acelebrated~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"rangeofsport-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"ingriflesand~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"handguns.~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"usuallyprovided",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"asaboxedset~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"withamatching~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"rifle.~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"requires18bore",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"cartridges.~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"SONIC STUNNER",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGE(S)~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"operatesat~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"ultrasonic~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"frequencies~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"designedto~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"incapacitate~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"byinterfering~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"withhuman~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"balancesystems.",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"requires1kjoule",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"chargeormore.~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"UNIDENTIFI-~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ABLE REMAINS~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"analysis~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"indicates~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"organic~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"traces,~~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"carbon~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"and23%~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"unidentified~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"molecular~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"substances.~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"XXX PIECES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"afruit,grown~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"inspecialcond-",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"itions.grownby",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"severalplant-~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"ationsunder~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"licensefromthe",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"bananacorp.~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"whoholdthe~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"patents.~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"EMF STUNNER~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGE(S)~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"inducesahigh~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"energyelectro~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"magneticfield.~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"destroyingthe~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"targetatthe~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"molecularlevel.",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"requires1kjoule",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"chargeormore.~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"NAOMI IV~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ASSAULT RIFLE",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX ROUND(S)~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"thenaomi~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"institute's~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"rivaltothe~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"legendarym73.~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"thisspecial~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"editionfeatures",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"lasersighting~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"andlowrecoil.~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"requires9mm~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"calibreammo.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"NAOMI GRENADE",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"LAUNCHER~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"X GRENADE(S)~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"thenaomi~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"institutes~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"latestand~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"probablylast~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"creation.~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"modelinscrip-~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"tion'choohonn~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"disssukka'.~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"requires40mm~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"expl. grenades.~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"40mm EXPL.~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"GRENADES~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX GRENADE(S)",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"acommonsize~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"andformatof~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"package.~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"highdensity~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"cellular-ceramic",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"explosivewill~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"generatean~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"impressiveblast",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"forthegrenades",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"size.~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	28		;image
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
		dc.b	66		;max rounds in gun
		dc.b	55/11		;damage per hit
;item 28 :
		dc.b	CENTREON,116,"FUSION POWER~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"CORE RING~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"UNIT 1~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"INACTIVE~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"provides~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"6yearsof~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"electical~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"powerat~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"4megawatts.~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"keephousing~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"awayfrom~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"strongmagnetic~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"fields!~~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"AUTO-SENTRY~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"KIT (UNI-D)~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX GUN(S)~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"uni-directional~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"automated~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"sentry~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"willfireat~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"anymoving~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"targetdirectly~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"infrontofthe~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"gun.~~~~~~~~~~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"BRICK~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"bricksarethe~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"mainconst-~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"ructionitemfor",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"buildingswhere~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"metalsarein~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"shortsupplyor~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"plasticsaretoo",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"expensiveto~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"form.~~~~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"BROKEN BOTTLE",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"thedisadvantage",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"ofbottleglass~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"isthatitis~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"verybrittle~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"comparedto~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"modern~~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"composites.~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"AUTO-SENTRY~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"KIT (MULTI-D)",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX GUN(S)~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"multi-~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"directional~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"automated~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"sentry~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"willfireat~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"anymoving~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"targetasit~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"rotatesonits~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"stand.~~~~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"PROXIMITY~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"MINE~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"generatesa~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"ferociousblast~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"designedto~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"maimrather~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"thankillthe~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"victim.~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"triggeredby~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"applied~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"pressure.~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"PROXIMITY~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"MINE 2ND EDN.",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"generatesa~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"ferciousblast~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"designedto~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"killoutright~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"ratherthan~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"maimthe~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"victim.~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"triggeredby~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"applied~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"pressure.~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"DISRUPTOR~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"CHARGE~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"standard~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"chargemodule~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"todockwith~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"disruptor~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"cannon.~~~~~~~~~",ENDTEXT	;info line 5
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
		dc.b	CENTREON,116,"ANTI-APC~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ROCKET~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"solidfuel~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"projectile~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"withhigh~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"density,micro~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"blastradius.~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"fitsmost~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"rocket~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"lauchers.~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,".44 HIGH AET~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"SABRE MK II~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX ROUND(S)~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"accelerated~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"energytransfer~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"ammunition.~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"aettransfers~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"nearlyallof~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"itskinetic~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"energytothe~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"targetandis~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"particularly~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"effective.~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"XXX ROUND(S)~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"theultimate~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"aetround.good~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"armourpiercing,",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"lowricochet,~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"lowrecoiland~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"excellent~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"stoppingpower.~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"9mm AET~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"HIGH VELOCITY",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX ROUND(S)~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"themostcommon~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"sizeof~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"ammunition.~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"alsoavailable~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"in.44mmformat.",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"veryhigh~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"penetration~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"resultsinpoor~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"softtarget~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"stoppingpower.~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"FLAMER REFILL",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 100cc~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"aninexpensive~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"byproduct~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"fromlowgrade~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"chemicalfuel.~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"particularly~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"strongclean~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"burnwiththe~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"oxy6range~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"ofpersonal~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"flamers.~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"FLAMER REFILL",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"(UX GAS)~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 100cc~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"aninexpensive~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"byproduct~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"fromlowgrade~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"chemicalfuel.~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"particularly~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"strongclean~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"burnwiththe~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"oxy6range~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"ofpersonal~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"flamers.~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"FLAMER JUNIOR",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"REFILL~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 50cc~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"aninexpensive~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"byproduct~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"fromlowgrade~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"chemicalfuel.~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"particularly~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"strongclean~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"burnwiththe~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"oxy6range~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"ofpersonal~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"flamers.~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"FLAMER JUNIOR",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"REFILL UX GAS",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 50cc~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"aninexpensive~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"byproduct~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"fromlowgrade~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"chemicalfuel.~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"particularly~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"strongclean~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"burnwiththe~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"oxy6range~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"ofpersonal~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"flamers.~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"18 BORE HIGH~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"EXPL. SLUG~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX SLUG(S)~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"shotgunammun-~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"tion.this~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"variantcontains",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"asinglewarhead",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"insteadofpell-",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"ets.itcomp-~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"risesashaped~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"highexplosive~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"charge.~~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"18 BORE~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"RIFLED SLUG~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX SLUG(S)~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"depleted~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"uraniumcore~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"providesgood~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"penetration~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"andisrifled~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"forgreater~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"accuracy.~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"9mm THV~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"'MINI' SERIES",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX ROUND(S)~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"acompactaet~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"round.average~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"armourpiercing,",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"lowricochet,~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"lowrecoiland~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"goodstopping~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"power.also~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"availablein~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,".44mmformat.~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,".38 UPBI~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"GLASER~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX ROUND(S)~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"veryexpensivse~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"andexclusive~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"ammunitionthat~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"isonlyusedby~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"theupbiitself.",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"itisdifficult~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"toobtain.~~~~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"1KJOULE~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"UNI-CELL~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGE(S)~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"a1kilojoule~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"chargewith~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"standardaa~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"terminalcon-~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"nectorsfor~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"energyweapons.~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"recommended~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"forpulse~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"lasersandpro-~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"tonemitters.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"3KJOULE~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"TWIN-CELL~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX CHARGE(S)",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"a3kilojoule~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"chargewith~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"standardaa~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"terminalcon-~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"nectorsfor~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"energyweapons.~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"pleaseensure~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"correctpolarity",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"seetings.~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"6KJOULE~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"TRI-CELL~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX CHARGE(S)",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"although6kilo~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"joulecharges~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"canbeusedfor~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"handweapons~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"theyaremore~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"commonly~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"intendedfor~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"vehiclemounted~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"weapons.~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"UNIDENTIFI-~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ABLE REMAINS~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"analysis~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"indicates~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"organic~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"traces,~~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"carbon~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"and23%~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"unidentified~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"molecular~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"substances.~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"BANANA PIECES",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX PIECE(S)~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"sorry.~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"noinformation~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"availableon~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"thisobject.~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"pleaseaskyour~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"localguildvii~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"representative~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"forafree~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"updatepack.~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"CRUSTY~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"BAGUETTE~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"sorry.~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"noinformation~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"availableon~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"thisobject.~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"pleaseaskyour~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"localguildvii~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"representative~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"forafree~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"updatepack.~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"CHEESE~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"cheesesubsitute",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"isahighly~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"nourishingfood~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"substance,~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"enrichedwith~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"vitamins.devel-",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"opedforspace~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"spacemissions~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"wherenutrition~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"isimportant.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"BOTTLE~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"bottlesare~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"createdfrom~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"commonsilicate~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"firedtohigh~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"temperature~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"whichproduces~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"glass.bottle~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"glasshascheap-",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"nessasthemain",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"prerequisite.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"APPLE~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"commonfruit.~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"applesare~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"easilygrownand",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"thusexempt~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"fromthe~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"patentsand~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"licensingact~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"of2609.~~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"CHICKEN~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DRUMSTICK~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"sorry.~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"noinformation~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"availableon~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"thisobject.~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"pleaseaskyour~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"localguildvii~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"representative~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"forafree~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"updatepack.~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"LARGE LOAF~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"sorry.~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"noinformation~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"availableon~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"thisobject.~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"pleaseaskyour~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"localguildvii~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"representative~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"forafree~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"updatepack.~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"FLASK~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"sorry.~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"noinformation~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"availableon~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"thisobject.~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"pleaseaskyour~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"localguildvii~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"representative~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"forafree~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"updatepack.~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"STANDARD~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"RATIONS I~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"rationsconcent-",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"ratedtolvl1.~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"thesearetaste-",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"lessbut~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"adequatefare.~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"theycontain~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"everythingthe~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"bodyrequires~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"(exceptwater)~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"tosustainit.~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"STANDARD~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"RATIONS II~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"rationsconcent-",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"ratedtolvl2.~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"thesearemuch~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"thesameas~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"rations1but~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"forseveral~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"energyenhancing",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"features.~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"STANDARD~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"RATIONS III~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"rationsconcent-",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"ratedtolvl3~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"pluschemical~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"andorganic~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"componentsto~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"boosthealth~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"beyondnormal~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"endurance.safe~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"onlyinnormal~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"doses.~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"MEDICAL PACK~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"provides~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"essential~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"medicalaidand~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"non-perishable~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"food~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"supplements.~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"alsouseful~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"foritsrange~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"ofvenom~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"antidotes.~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"SYRINGE~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ANTI-TOXIN~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"battlefield~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"drugto~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"temporarily~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"immunise~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"against~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"commontoxins.~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"normallylasts~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"aboutfour~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"minutes.~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"DROID REPAIR~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"KIT~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"vitalhomediy~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"droidrepair~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"kitamongst~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"theadvanced~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"civilisations.~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"completewith~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"diagnostic~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"board,filler~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"andtouchup~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"paint.~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"FUSION POWER~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"CORE RING~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"UNIT 2~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"INACTIVE~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"provides~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"6yearsof~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"electical~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"powerat~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"4megawatts.~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"keephousing~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"awayfrom~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"strongmagnetic~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"fields!~~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"FUSION POWER~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"CORE RING~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"UNIT 3~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"INACTIVE~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"provides~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"6yearsof~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"electical~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"powerat~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"4megawatts.~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"keephousing~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"awayfrom~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"strongmagnetic~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"fields!~~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"FUSION POWER~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"CORE RING~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"UNIT 4~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"INACTIVE~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"provides~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"6yearsof~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"electical~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"powerat~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"4megawatts.~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"keephousing~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"awayfrom~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"strongmagnetic~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"fields!~~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"sorry.~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"noinformation~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"availableon~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"thisobject.~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"pleaseaskyour~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"localguildvii~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"representative~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"forafree~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"updatepack.~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"COMMON KEY~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"sorry.~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"noinformation~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"availableon~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"thisobject.~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"pleaseaskyour~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"localguildvii~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"representative~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"forafree~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"updatepack.~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"ORNATE KEY~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"sorry.~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"noinformation~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"availableon~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"thisobject.~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"pleaseaskyour~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"localguildvii~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"representative~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"forafree~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"updatepack.~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"SECURITY~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ACCESS WAFER~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"CIVILIAN~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"ACCESS ONLY~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"lowlevel~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"security~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"accesswafer.~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"commonly~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"usedto~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"enforcezone~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"restrictions.~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"SECURITY~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ACCESS WAFER~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"UNRESTRICTED",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"ACCESS~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"master~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"security~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"accesswafer.~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"commonly~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"usedto~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"enforcezone~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"restrictions.~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"SECURITY~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ACCESS WAFER~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"EMPLOYEE~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"ACCESS ONLY~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"mediumlevel~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"security~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"accesswafer.~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"commonly~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"usedto~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"enforcezone~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"restrictions.~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"SECURITY~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ACCESS WAFER~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"OFFICERS~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"ACCESS ONLY~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"highlevel~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"security~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"accesswafer.~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"commonly~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"usedto~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"enforcezone~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"restrictions.~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,33,"sorry.~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"noinformation~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"availableon~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"thisobject.~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"pleaseaskyour~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"localguildvii~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"representative~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"forafree~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"updatepack.~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,33,"thisisa~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"favouritefor~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"journalistsas~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"itallowsthe~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"recordingof~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"footagewhich~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"canbeprooved~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"tobeunaltered~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"andtamperfree.",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"D.T.S. MODULE",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Digital~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Terrain~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Scanner.~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"thishand-held~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"unitprovidesa~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"visuallogand~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"tacticaldata-~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"basebasedon~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"current~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"surroundings.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"D.T.S. MODULE",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"'ULTRA' PROTO",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"sorry.~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"noinformation~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"availableon~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"thisobject.~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"pleaseaskyour~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"localguildvii~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"representative~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"forafree~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"updatepack.~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"sorry.~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"noinformation~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"availableon~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"thisobject.~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"pleaseaskyour~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"localguildvii~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"representative~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"forafree~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"updatepack.~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"FIREBALL~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"generates~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"amedium~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"strength~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"ballof~~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"flamingplasma~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"directlyin~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"frontofthe~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"user.~~~~~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"INFERNO~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"generates~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"afull~~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"strength~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"ballof~~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"flamingplasma~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"directlyin~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"frontofthe~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"user.~~~~~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"BLAST~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"generates~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"fourmedium~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"strength~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"ballsof~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"flamingplasma~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"aroundthe~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"user.~~~~~~~~~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DEVASTATE~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"generates~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"fourfull~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"strength~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"ballsof~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"nonedecaying~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"flamingplasma~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"aroundthe~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"user.~~~~~~~~~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"FIRESHIELD~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"protects~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"avolumeof~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"2cubicmetres,~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"usuallythe~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"user,from~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"mostofthe~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"effectsof~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"plasmaweapons.~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"SHIELD~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"protects~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"avolumeof~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"2cubicmetres,~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"usuallythe~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"user,from~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"mostofthe~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"effectsof~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"projectiles~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"andhand-to~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"handweapons.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"GRANITE STR.~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"accelerates~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"theusers~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"metabolicrate~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"threefold.~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"effectively~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"boostingthe~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"user'sstrength~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"andstamina.~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"lastsfor~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"fourminutes.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"TITANIUM STR.",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"accelerates~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"theuser's~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"metabolicrate~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"sixfold.~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"effectively~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"boostingthe~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"user'sstrength~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"andstamina.~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"lastsfor~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"fourminutes.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"WALL~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"generates~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"analmost~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"indestructable~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"resonance~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"fieldwhich~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"willrepel~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"solidmatter.~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"BANISH WALL~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"breaksdown~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"anddissipates~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"resonancefields",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"thatwould~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"normallyrepel~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"solidmatter.~~~",ENDTEXT	;info line 5
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
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"BRIDGE~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"createsa~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"stableself-~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"suspending~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"platform~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"directlyin~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"frontofthe~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"user.~~~~~~~~~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,33,"sorry.~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"noinformation~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"availableon~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"thisobject.~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"pleaseaskyour~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"localguildvii~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"representative~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"forafree~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"updatepack.~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"FEATHER~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"effectively~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"decreases~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"theweight~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"oftheuser's~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"belongings~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"butnotthe~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"weightofthe~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"userhimself.~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"SONIC BLAST~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"eminates~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"amoderately~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"destructive~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"compression~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"wave.~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"disruptive~~~~~~",ENDTEXT	;info line 10
		dc.b	CENTREON,33,"tosoftanimal~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"tissueand~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"electrical~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"subsystems.~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"SHOCK BLAST~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"eminates~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"avery~~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"destructive~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"compression~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"wave.~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"disruptive~~~~~~",ENDTEXT	;info line 10
		dc.b	CENTREON,33,"tosoftanimal~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"tissueand~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"electrical~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"subsystems.~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"GILLS~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"envelopes~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"theuserina~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"6cmdeeplayer~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"ofself-~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"replenishing~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"air.effectively",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"allowingthe~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"usertobreath~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"underwater.will",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"lastfor4mins.",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PART WAVES~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"createsa~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"channelthrough~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mostliquids,~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"extending~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"outwardsfrom~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"theuser's~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"position.~~~~~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"QUENCH~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"whenused~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"underwater~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"thiseffect~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"createsa~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"containerof~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"purifiedliquid~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"suitablefor~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"human~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"consumption.~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"WATERTIGHT~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"creates~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"aninvisible~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"non-porous~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"envelopearound~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"theuser's~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"belongings.~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"lastsfor~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"4minutes.~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ELECTRIFY~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"firesa~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"weakelectric~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"chargeat~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"atarget~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"directly~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"infrontof~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"theuser.~~~~~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"LIGHTNING~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"firesa~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"strong~~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"electric~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"chargeat~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"atarget~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"directly~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"infrontof~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"theuser.~~~~~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"FRY~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"firesa~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"verystrong~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"electric~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"chargeat~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"atarget~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"directly~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"infrontof~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"theuser.~~~~~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"FARSIGHT~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"patches~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"directlyinto~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"thesensorarray",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"oftheuser's~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"dts.effectively",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"increasesthe~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"information~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"storedabout~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"local~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"surroundings.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"TELEPORT~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"instantaneously~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"movesthe~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"usertoa~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"random~~~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"location~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"within40m.~~~~~",ENDTEXT	;info line 6
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
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"sorry.~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"noinformation~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"availableon~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"thisobject.~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"pleaseaskyour~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"localguildvii~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"representative~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"forafree~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"updatepack.~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"CURE POISON~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"cleansesthe~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"usersblood-~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"streamof~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"toxicalien~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"material.~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"thisisonly~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"effectiveon~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"humantargets.~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"HEAL~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"accelerates~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"theusers~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"metabolicrate,~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"immunesystem~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"andtissue~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"recovery.~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"hastheend~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"effectofheal-~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"ingwoundsand~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"poisoning.~~~~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"TRANSMUTE~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"sorry.~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"noinformation~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"availableon~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"thisobject.~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"pleaseaskyour~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"localguildvii~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"representative~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"forafree~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"updatepack.~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"MIRACLE~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"sorry.~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"noinformation~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"availableon~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"thisobject.~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"pleaseaskyour~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"localguildvii~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"representative~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"forafree~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"updatepack.~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"UNIDENTIFI-~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ABLE REMAINS~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"analysis~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"indicates~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"organic~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"traces,~~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"carbon~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"and23%~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"unidentified~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"molecular~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"substances.~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"PROXIMITY~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"MINE~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"** ARMED **~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"generatesa~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"ferciousblast~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"designedto~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"maimrather~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"thankillthe~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"victim.~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"triggeredby~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"applied~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"pressure.~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"PROXIMITY~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"MINE 2ND EDN.",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"** ARMED **~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"generatesa~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"ferciousblast~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"designedto~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"killoutright~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"ratherthan~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"maimthe~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"victim.~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"triggeredby~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"applied~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"pressure.~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"NUTS~~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DAMAGED~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"sorry.~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"noinformation~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"availableon~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"thisobject.~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"pleaseaskyour~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"localguildvii~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"representative~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"forafree~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"updatepack.~~~~",ENDTEXT	;info line 10
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
