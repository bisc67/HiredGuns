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
		dc.b	CENTREON,116,"CANON~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DESTRUCTEUR~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"X CHARGE(S)~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Une~desarmes~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"portablesles~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"pluspuissantes.",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"EndÇpitdesa~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"faiblepuissance",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"defeu,elle~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"caused'immenses",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"dÇgÉts.NÇces-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"siteunecharge~",ENDTEXT	;info line 10
		dc.b	CENTREON,33,"destructrice.~~~",ENDTEXT	;info line 6
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
		dc.b	CENTREON,116,"RPG F LANCE-~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ROQUETTES~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"X ROQUETTE(S)",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Roquettepropul-",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"sÇenord-~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"europanesÇrie~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"f.BonmarchÇ,~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"troisans.~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"NÇcessite~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"roquette.~~~~~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"CANON LASER~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"A NEUTRONS~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX CHARGE(S)",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Plusefficace~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"danslevide~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"qu'enatmos-~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"phäre.PrimÇ~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"poursoninno-~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"vationetsa~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"conception.~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"NÇcessiteune~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"charged'au~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"moins1kjoule~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"MITRAILLEUSE~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"MONTêE~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX MUNITIONS",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Fournieenkit~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"pouràtremontÇe",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"surroulements~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"70mmpourvÇhi-",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"culesdeprotec-",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"tionetde~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"dÇfenserap-~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"prochÇe.NÇces-~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"sitedesmuni-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"tionscalibre44",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"PIST. LASER~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"HYDRO-FLUOR~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX CHARGE(S)",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"PremiäregÇnÇ-~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"rationd'armes~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"optiquesde~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"faiblemasse.~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"BrevetdÇposÇ~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"parNaomiOptics",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"en2711.~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"NÇcessiteune~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"charged'au~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"moins1Kjoule.~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"FUSIL A~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PARTICULES~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX CHARGE(S)",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Utiliseles~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"transitions~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"d'Çnergiedans~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"lazonedes~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"ultra-violets.~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Armeextràmement",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"destructrice.~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"NÇcessiteune~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"charged'au~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"moins1Kjoule.~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"XX MUNITIONS~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Extràmement~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"bruyantetdif-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"ficileÖmanier,",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"cemodälen'in-~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"tÇressequeles~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"passionnÇset~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"lescollection-~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"neurs.NÇcessite",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"desmunitions~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"calibre9mm.~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"LANCE-FLAMMES",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"OXY 6~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 100cc~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Pare-flammes~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"intÇgrÇ.C'est~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"lenecplus~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"ultradela~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"dÇfense~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"personnelle.~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"NÇcessiteau~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"moins100ccde~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"combustible.~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"LANCE-FLAMMES",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"OXY 6 JUNIOR~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 50cc~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Lance-flammes~Ö~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"mainalimentÇ~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"parunmÇlange~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"spÇcialde~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"produits~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"chimiques.~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"NÇcessiteau~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"moins50ccde~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"combustible.~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"SUPERCOVERT~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"(SILENCIEUX)~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX MUNITIONS~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"ApprÇciÇdes~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"organisations~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"anti-terroristes",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"poursoncanon~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"interchangeable~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"etsonUCde~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"visÇe.NÇcessite",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"desmunitions~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"calibre9mm.~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"XX MUNITIONS~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"FusillÇger~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"courteportÇe~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"avecsilencieux~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"etextensionde~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"canonenoption.",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"NÇcessitedes~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"munitions~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"calibre9mm.~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"MINI FUSIL~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"MONTê~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX MUNITIONS",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Armemilitaire.~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"N'estdoncpas~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"disponiblepour~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"lescivils.~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"NÇcessitedes~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"munitions44.~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"AUTOMATIQUE~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX MUNITIONS",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Disposed'une~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"puissancedefeu",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"considÇrable.~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Armed'usage~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"gÇnÇral.~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"NÇcessitedes~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"munitions~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"calibre44.~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"FUSIL SNIPER~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX MUNITIONS~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"N'Çquivautpas~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"lesSmallArms~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"6.Bouche~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"insuffisamment~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"mobile.~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"NÇcessitedes~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"munitions~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"calibre9mm.~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"FUSIL AU~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"TUNGSTENE~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX MUNITIONS~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"GÇnÇralement~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"livrÇdansun~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Çtuiavecle~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"pistolet~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"correspondant.~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"NÇcessitedes~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"cartouches~18.~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"X MUNITIONS~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Lemeilleur~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"pistoletqui~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"soit.Lemodäle~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"vÇritableest~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"importÇdela~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Terre.NÇcessite",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"desmunitions~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"calibre9mm.~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"FUSIL DE~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"CHASSE~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"X BALLE(S)~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Faiblepuissance",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"detirmais~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"dÇgÉts~~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"potentiels~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"importants.~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Inutiled'àtre~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"unefine~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"gachette.~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"NÇcessitedes~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"cartouches18.~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"UPBI ISSUE~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"38~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX MUNITIONS~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Armestandard~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"desagentsde~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"l'UPBI(police~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"desplanätes~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"unies).MÇca-~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"nismecapricieux",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"dangereux.~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"NÇcessite~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"munitions~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"calibre~38.~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"BLASTER~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"52-C~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGE(S)~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Fusilredoutable",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Ölongueur~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"d'ondequi~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"vaporiseles~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"molÇculesd'eau~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"dessubstances~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"organiques.~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"NÇcessiteune~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"charged'au~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"moins1~Kjoule.~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"PISTOLET AU~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"TUNGSTENE~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CART.~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"SÇriedefusils~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"etdepistolets~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"desportträs~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"apprÇciÇs.GÇnÇ-~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"ralementlivrÇ~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"dansunÇtui~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"aveclefusil~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"correspondant.~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Cartouches~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"DêSTABILISEUR",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"SONIQUE~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGE(S)~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Utiliseles~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"frÇquencesÖ~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"ultra-sonsqui~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"interfärentavec",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"lesystäme~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"d'Çquilibre~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"humain.~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"NÇcessiteune~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"charged'au~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"moins1Kjoule.~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"RêSIDUS NON~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"IDENTIFIABLES",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"L'analyse~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"indique~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"destraces~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"decarbone,~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"et~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"23%~~~~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"desubstances~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"molÇculaires~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"non~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"identifiables.~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"BANANE~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX UNITêS~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"FruitcultivÇ~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"dansdescondi-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"tionsspÇci-~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"fiques.CultivÇ~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"dansquelques~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"plantationssous",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"licencedÇlivrÇe",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"parlaBanana~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Corp.,dÇposi-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"tairedubrevet.",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"DêSTABILISEUR",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"CEM~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGE(S)~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Produitunchamp",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Çlectro-~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"magnÇtique~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"ÇlevÇ.DÇtruit~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"sacibleÖun~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"niveaumolÇcu-~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"laire.NÇcessite",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"unecharge~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"minimalede1~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Kjoule.~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"FUSIL D'AS-~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"SAUT NAOMI IV",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX MUNITIONS~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Lenaomiconcur-",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"rencelelÇgen-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"daireM73.Cette",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"sÇriespÇciale~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"comprendun~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"viseurlaseret~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"aunfaible~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"recul.NÇcessite",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"desmunitions~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"calibre9mm.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"LANCE-GRE-~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"NADES NAOMI~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"X GRENADE(S)~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Derniäreet~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"ultimecrÇation~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"duNaomi~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Institute.~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"NÇcessitedes~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"grenades~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"explosives40~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"mm.~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"GRENADES~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"EXPL. 40mm~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX GRENADE(S)",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Modälecourant.~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Explosif~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"cÇramique~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"cellulairehaute",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"densitÇ.~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Explosion~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"impressionnante~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"vulataillede~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"lagrenade.~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"ANNEAU DE~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"FUSION~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"UNITê 1~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"INACTIF~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Fournit6ansde",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"courant~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"ÇlectriqueÖ4~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"mÇgawatts.~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Eloignerle~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"boåtierdes~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"champs~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"magnÇtiques~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"puissants.~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"AUTO-SENTI-~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"NELLE UNI-D~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CANON(S)~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Sentinelle~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"automatiqueuni-",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"directionnelle.~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Tiresurtoute~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"ciblemobile~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"situÇeenface~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"ducanon.~~~~~~~",ENDTEXT	;info line 6
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
		dc.b	CENTREON,116,"BRIQUES~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"MatÇriaude~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"construction.~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Principal~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"substitutdu~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"mÇtal(encasde",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"pÇnurie)et~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"moinscherque~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"leplastique.~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"BOUTEILLE~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"CASSêE~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Bouteillesde~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"verreträs~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"fragiles~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"comparÇesau~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"verreplusmo-~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"derne.Risquent~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"desebriseret~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"delaisserdes~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"tessons~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"coupants.~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"AUTO-SENTI-~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"NELLE MULTI-D",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CANON(S)~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Sentinelle~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"automatique~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"multi-~~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"directionnelle.~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"Tiresurtoute~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"ciblemobile~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"situÇeenface~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"ducanon.~~~~~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"MINE DE~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PROXIMITê~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Provoqueune~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Çnormeexplosion",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"destinÇeÖ~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"mutilerplutìt~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"qu'Ötuer.~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"DÇtonation~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"dÇclenchÇepar~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"pression~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"directe.~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"MINE DE~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PROXIMITê~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"2E ED.~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Provoqueune~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Çnormeexplosion",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"destinÇeÖtuer~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"surlecoup~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"plutìtqu'Ö~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"mutiler.~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"DÇtonation~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"dÇclenchÇepar~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"pression~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"directe.~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"CHARGE~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DESTRUCTRICE~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Moduledecharge",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"standardÖfixer",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"surlecanon~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"destructeur.~~~~",ENDTEXT	;info line 4
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
		dc.b	CENTREON,116,"ROQUETTE~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ANTI-VPB~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"ProjectileÖ~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"microexplosion~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"hautedensitÇ.~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"PorpulsionÖ~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"combustible~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"solide.~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Compatibleavec~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"laplupartdes~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"lance-roquettes.",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"SABRE MK II~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"TEA .44~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX MUNITIONS",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Munitionde~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"transfert~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"d'Çnergie~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"accÇlÇrÇ.~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Transfärela~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"quasitotalitÇ~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"de~sonÇnergie~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"cinÇtiqueÖla~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"cible.Träs~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"efficace.~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,".44 TEA~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX MUNITIONS",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Lesparfaites~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"munitionsTEA.~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Peráagede~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"blindage,faible",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"ricochet,faible",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"reculet~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"excellent~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"pouvoirde~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"stoppage.~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"TEA 9 mm~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"HT VêLOCITê~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX MUNITIONS",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Munitionsles~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"pluscourantes,~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"disponibles~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"aussien44mm.~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Hautepuissance~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"depÇnÇtration~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"limitela~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"rÇsistancepare-",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"balledela~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"cible.~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"RECHARGE~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"LANCE-FLAMMES",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 100cc~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"PrixcompÇtitif.",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Combustible~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"chimiquebasde~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"gamme.~~~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Particuliärement",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"efficaceavec~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"leslance-~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"flammes~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"personnelsoxy~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"6.~~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"RECHARGE L-F~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"(GAZ UX)~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 100cc~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Combustible~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"chimiquebasde~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"gamme.~~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Particuliärement",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"efficaceavec~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"leslance-~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"flammes~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"personnelsoxy~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"6.~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"RECHARGE L-F~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"JUNIOR~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 50cc~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Combustible~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"chimiquebasde~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"gamme.~~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Particuliärement",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"efficaceavec~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"leslance-~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"flammes~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"personnelsoxy~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"6.~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"RECHARGE L-F~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"JR (GAZ UX)~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 50cc~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Combustible~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"chimiquebasde~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"gamme.~~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Particuliärement",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"efficaceavec~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"leslance-~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"flammes~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"personnelsoxy~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"6.~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"CARTOUCHE 18~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"HAUTE EXPL.~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CART.(S)~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Munitionfusil.~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Cemodäle~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"contientune~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"tàteuniqueau~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"lieudeplombs.~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Comprendune~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"chargeformÇe~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"hautement~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"explosive.~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"CARTOUCHE 18~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"RAYêE~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CART.~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"CIurd'uranium~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"rÇduitpourune~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"meilleure~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"pÇnÇtration.~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"RayÇepourune~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"plusgrande~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"prÇcision.~~~~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"TEA 9 mm~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"SêRIE 'MINI'~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX MUNITIONS",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"TEAcompact.~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Perceblindage~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"moyen,faible~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"ricochet,faible",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"reculetbonne~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"forced'arràt.~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Modäle44mm~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"aussi~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"disponible.~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"RECHARGE~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,".38 UPBI~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX MUNITIONS~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Munitionträs~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"chäre,difficile",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Öseprocurer.~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Disponible~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"uniquementau~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"UPBI.~~~~~~~~~~~",ENDTEXT	;info line 6
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
		dc.b	CENTREON,116,"UNI-CELLULE~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"1 KJOULE~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGE(S)~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Charged'1Kj~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"avecconnecteurs",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"terminauxAA~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"standardpour~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"armesÇnergÇ-~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"tiques.Recom-~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"mandÇepour~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"laserÖvibra-~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"tionetÇmetteur",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"Ö~proton.~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"DOUBLE CEL-~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"LULE 3 KJ~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX CHARGE(S)",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Chargede3Kj~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"avecconnecteurs",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"terminauxAA~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"standardpour~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"armesÇnergÇ-~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"tiques.VÇrifier~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"lerÇglage~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"polaire.~~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"TRIPLE CEL-~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"LULE 6 KJ~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX CHARGE(S)",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Utilisablesur~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"armesÖmain~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"maisplus~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"appropriÇeaux~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"armessur~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"vÇhicules.~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"RêSIDUS NON~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"IDENTIFIABLES",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"L'analyse~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"indique~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"destraces~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"decarbone,~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"et~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"23%~~~~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"desubstances~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"molÇculaires~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"non~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"identifiables.~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"MORCEAUX DE~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"BANANE~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX UNITê(S)~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Aucune~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"information~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"disponiblesur~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"cetobjet.~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"DemandezÖvotre",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"reprÇsentant~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"GuildVIIune~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"miseÖjour~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuite.~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"BAGUETTE~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"CROUSTILLANTE",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Aucune~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"information~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"disponiblesur~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"cetobjet.~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"DemandezÖvotre",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"reprÇsentant~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"GuildVIIune~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"miseÖjour~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuite.~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"FROMAGE~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Cesubstitutde~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"fromageestune~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"substancenutri-",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"tiveträsÇner-~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"gÇtiqueenrichie",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"envitamines.~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Conáupourdes~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"missions~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"spatiales.~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"BOUTEILLE~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"FabriquÇeen~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"verre(silicate~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"fonduÖhaute~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"tempÇrature).~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Principal~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"avantage :prix~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"derevient~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"avantageux.~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"POMME~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Fruitcourant~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"facilement~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"cultivÇ.Par~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"consÇquent,~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"n'estpassoumis",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Ölaloi2609~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"relativeaux~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"licences.~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"PILON DE~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"POULET~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Aucune~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"information~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"disponiblesur~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"cetobjet.~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"DemandezÖvotre",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"reprÇsentant~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"GuildVIIune~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"miseÖjour~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuite.~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"PAIN~~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Aucune~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"information~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"disponiblesur~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"cetobjet.~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"DemandezÖvotre",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"reprÇsentant~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"GuildVIIune~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"miseÖjour~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuite.~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"FLASQUE~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Aucune~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"information~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"disponiblesur~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"cetobjet.~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"DemandezÖvotre",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"reprÇsentant~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"GuildVIIune~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"miseÖjour~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuite.~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"RATIONS I~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"STANDARD~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Rationsconcen-~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"trÇesauniveau~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"1.Insipides~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"maispratiques.~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Contiennenttous",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"lesÇlÇments~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"nutritifs(sauf~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"l'eau)indispen-",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"sablesau~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"mÇtabolisme.~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"RATIONS II~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"STANDARD~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Rations~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"concentrÇesau~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"niveau2.~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Similairesaux~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"rationsImais~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"enrichiesen~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"certains~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"ÇlÇments.~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"RATIONS III~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"STANDARD~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Rationsconcen-~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"trÇesauniveau~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"3enrichiesen~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"oligo-ÇlÇments~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"pouraccroåtre~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"larÇsistancedu",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"mÇtabolisme.Ne~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"pasdÇpasserla~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"doseprescrite.~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"TROUSSE DE~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"SECOURS~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Fournit~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"l'essentieldes~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"premierssoins~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"etdes~~~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"supplÇments~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"alimentaires~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"impÇrissables.~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"Utilepourses~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"antidotes.~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"SERINGUE~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ANTI-TOXINES~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"SÇrumpour~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"s'immuniser~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"momentanÇment~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"contreles~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"toxines~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"courantes.Agit~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"pendantenviron~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"quatre~~~~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"KIT POUR~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ANDROIDES~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"PourlarÇpara-~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"tiondes~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"androãdes.Dis-~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"poniblesdans~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"lescivilisa-~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"tionsavancÇes.~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Comprendtableau",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"dediagnostic,~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"masticetpein-~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"turederaccord.",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"ANNEAU~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DE FUSION~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"UNITê 2~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"INACTIF~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Fournit6ansde",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"courant~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"ÇlectriqueÖ4~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"mÇgawatts.~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Eloignerle~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"boåtierdes~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"champs~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"magnÇtiques~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"puissants.~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"ANNEAU~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DE FUSION~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"UNITê 3~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"INACTIF~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Fournit6ansde",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"courant~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"ÇlectriqueÖ4~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"mÇgawatts.~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Eloignerle~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"boåtierdes~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"champs~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"magnÇtiques~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"puissants.~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"ANNEAU~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DE FUSION~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"UNITê 4~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"INACTIF~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Fournit6ansde",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"courant~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"ÇlectriqueÖ4~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"mÇgawatts.~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Eloignerle~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"boåtierdes~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"champs~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"magnÇtiques~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"puissants.~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Aucune~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"information~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"disponiblesur~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"cetobjet.~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"DemandezÖvotre",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"reprÇsentant~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"GuildVIIune~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"miseÖjour~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuite.~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"CLê CLASSIQUE",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Aucune~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"information~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"disponiblesur~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"cetobjet.~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"DemandezÖvotre",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"reprÇsentant~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"GuildVIIune~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"miseÖjour~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuite.~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"CLê ORNêE~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Aucune~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"information~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"disponiblesur~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"cetobjet.~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"DemandezÖvotre",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"reprÇsentant~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"GuildVIIune~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"miseÖjour~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuite.~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"PASSE DE~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"SêCURITê~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"ACCES DES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"CIVILS~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Passepour~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"faibleniveaude",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"sÇcuritÇ.~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Couramment~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"utilisÇpour~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"protÇgerles~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"zonesde~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"restriction.~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"PASSE DE~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"SêCURITê~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"ACCES NON~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"RESTRICTIF~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Passede~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"sÇcuritÇ~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"principal.~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Couramment~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"utilisÇpour~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"protÇgerles~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"zonesde~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"restriction.~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"PASSE DE~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"SêCURITê~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"ACCêS DES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"EMPLOYêS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Passed'un~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"niveaude~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"sÇcuritÇmoyen.~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Couramment~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"utilisÇpour~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"protÇgerles~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"zonesde~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"restriction.~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"PASSE DE~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"SêCURITê~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"ACCES DES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"OFFICIERS~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Passehaute~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"sÇcuritÇ.~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Couramment~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"utilisÇpour~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"protÇgerles~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"zonesde~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"restriction.~~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,33,"Aucune~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"information~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"disponible sur~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"cet objet.~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Demandez Ö votre",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"reprÇsentant~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Guild VII une~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"mise Ö jour~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuite.~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,33,"Appareil träs~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"apprÇciÇ des~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"journalistes car",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"il permet~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"d'enregistrer~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"des sÇquences~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"sans altÇration~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"ni truquage~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"possible.~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"MODULE S.D.T.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Scannerdigital~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"deterrain.~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"UnitÇportable~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"ÇquipÇed'un~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"indicateur~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"visueletd'une~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"basetactilede~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"donnÇessurle~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"terrain~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"environnant.~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"MODULE S.D.T.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"'ULTRA' PROTO",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Aucune~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"information~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"disponiblesur~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"cetobjet.~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"DemandezÖvotre",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"reprÇsentant~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"GuildVIIune~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"miseÖjour~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuite.~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Aucune~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"information~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"disponiblesur~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"cetobjet.~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"DemandezÖvotre",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"reprÇsentant~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"GuildVIIune~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"miseÖjour~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuite.~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"BOULE DE FEU~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Produitune~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"bouledeplasma~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"enflammÇd'une~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"puissance~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"moyenne,~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"directement~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"projetÇeenface",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"de~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"l'utilisateur.~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"ENFER~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Produitune~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"bouledeplasma~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"enflammÇed'une~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"pleine~~~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"puissance,~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"directement~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"projetÇeenface",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"de~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"l'utilisateur.~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"EXPLOSION~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Produitquatre~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"boules~~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"enflammÇesde~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"plasmad'une~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"puissance~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"moyenne,~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"projetÇesautour",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"de~~~~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"l'utilisateur.~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"DêVASTATEUR~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Produitquatre~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"boules~~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"enflammÇesde~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"plasmanon~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"consumable,~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"projetÇesautour",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"de~~~~~~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"l'utilisateur.~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"BOUCLIER FEU~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Protägeun~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"volumede2~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mätrescube,~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"gÇnÇralement~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"l'utilisateur,~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"deseffetsdes~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"armesÖplasma.~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"BOUCLIER~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Protägeun~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"volumede2~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mätrescube,~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"gÇnÇralement~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"l'utilisateur,~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"deseffetsdes~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"armesÖ~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"projectileset~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"decombat~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"rapprochÇ.~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"FORCE GRANITE",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Triplelerythme",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"mÇtaboliquede~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"l'utilisateur.~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Augmente~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"considÇrablement",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"laforceet~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"l'endurance~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"pendantquatre~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"minutes.~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"FORCE TITANE~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Multipliepar~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"sixlerythme~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"mÇtaboliquede~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"l'utilisateur.~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"Augmente~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"considÇrablement",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"laforceet~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"l'endurance~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"pendantquatre~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"minutes.~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"MUR~~~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXCHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX%DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"GÇnäreunchamp~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"derÇsonance~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"quasi~~~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"indestructible~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"quirenvoiela~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"matiäresolide.~",ENDTEXT	;info line 6
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
		dc.b	CENTREON,116,"ANTI-MUR~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Briseetdissipe",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"leschampsde~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"rÇsonancequi~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"normalement~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"renvoientla~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"matiäresolide.~",ENDTEXT	;info line 5
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
		dc.b	CENTREON,116,"PONT~~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Projäteune~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"plateforme~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"stableauto-~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"suspendueen~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"facede~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"l'utilisateur.~~",ENDTEXT	;info line 6
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
		dc.b	CENTREON,33,"Aucune~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"information~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"disponiblesur~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"cetobjet.~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"DemandezÖvotre",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"reprÇsentant~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"GuildVIIune~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"miseÖjour~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuite.~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"PLUME~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Diminue~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"considÇrablement",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"lepoidsdes~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"objets~~~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"personnelsde~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"l'utilisateur,~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"maispascelui~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"del'utilisateur",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"màme.~~~~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"EXPL. SONIQUE",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Emetunevague~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"decompression~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"modÇrÇment~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"destructrice.~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"DÇtruitles~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"tissusanimaux~~",ENDTEXT	;info line 10
		dc.b	CENTREON,33,"souplesetles~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"sous-systämes~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"Çlectriques.~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"EXPLOSION~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Emetunevague~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"decompression~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"extràmement~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"destructrice.~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"DÇtruitles~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"tissusanimaux~~",ENDTEXT	;info line 10
		dc.b	CENTREON,33,"souplesetles~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"sous-systämes~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"Çlectriques.~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"BRANCHIES~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Enveloppe~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"l'utilisateur~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"d'unecouche~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"d'airs'auto-~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"rÇgÇnÇrant,de6",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"cm.Permetde~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"respirersous~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"l'eaupendant~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"quatreminutes.~",ENDTEXT	;info line 9
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
		dc.b	5		;level
		ds.b    11
;item 97 :
;initial number of charges = 2
		dc.b	CENTREON,116,"TUNNEL~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"CrÇeuntunnelÖ",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"traversla~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"plupartdes~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"liquides.~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"S'Çtend~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"directementen~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"facede~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"l'utilisateur.~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"GOURDE~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"UtilisÇsous~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"l'eau,crÇeun~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"rÇcipientde~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"liquidepur~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"potable.~~~~~~~~",ENDTEXT	;info line 5
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
		dc.b	17		;flash colour
		dc.b	10		;sample
		dc.w	128		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	4		;level
		ds.b    11
;item 99 :
;initial number of charges = 5
		dc.b	CENTREON,116,"COMBI êTANCHE",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"CrÇeune~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"enveloppe~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"invisiblenon~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"poreuseautour~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"desobjets~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"personnelsde~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"l'utilisateur~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"pendantquatre~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"minutes.~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"DêCHARGE~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Lanceunefaible",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"charge~~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Çlectriquesur~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"unecible~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"directement~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"situÇeenface~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"de~~~~~~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"l'utilisateur.~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"êCLAIR~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Lanceuneforte~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"charge~~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Çlectriquesur~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"unecible~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"directement~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"situÇeenface~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"de~~~~~~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"l'utilisateur.~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"FOUDRE~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Lanceuneträs~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"fortecharge~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"Çlectriquesur~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"unecible~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"directement~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"situÇeenface~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"de~~~~~~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"l'utilisateur.~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"LONGUE VUE~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"S'adaptesurle~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"SDTde~~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"l'utilisateur.~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Augmente~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"sensiblementles",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"informations~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"enregistrÇessur",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"leterrain~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"environnant.~~~~",ENDTEXT	;info line 9
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
		dc.b	5		;level
		ds.b    11
;item 104 :
;initial number of charges = 5
		dc.b	CENTREON,116,"TELEPORT~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Transporte~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"instantanÇment~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"l'utilisateur~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"dansunrayonde",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"40m.~~~~~~~~~~~",ENDTEXT	;info line 5
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
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Aucune~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"information~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"disponiblesur~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"cetobjet.~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"DemandezÖvotre",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"reprÇsentant~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"GuildVIIune~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"miseÖjour~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuite.~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"ANTIDOTE~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Purifielesang~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"del'utilisateur",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"dessubstances~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"Çtrangäres~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"toxiques.~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"Efficacesurles",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"humains~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"uniquement.~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"BAUME~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"AccÇlärele~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"rythmemÇtabo-~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"liqueetla~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"reconstitution~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"destissusde~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"l'utilisateur.~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"Favorisela~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"guÇrisondes~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"blessureset~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"intoxications.~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"TRANSMUTATION",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Aucune~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"information~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"disponiblesur~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"cet~objet.~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"DemandezÖvotre",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"reprÇsentant~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"GuildVIIune~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"miseÖjour~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuite.~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"MIRACLE~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PSIONIC-AMP~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CHARGES~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Aucune~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"information~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"disponiblesur~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"cetobjet.~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"DemandezÖvotre",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"reprÇsentant~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"GuildVIIune~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"miseÖjour~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuite.~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"RêSIDUS NON~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"IDENTIFIABLES",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"L'analyse~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"indique~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"destraces~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"decarbone,~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"et~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"23%~~~~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"desubstances~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"molÇculaires~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"non~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"identifiables.~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"MINE DE~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PROXIMITê~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"** ARMêE **~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Provoqueune~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Çnormeexplosion",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"destinÇeÖ~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"mutilerplutìt~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"qu'Ötuer.~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"DÇtonation~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"dÇclenchÇepar~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"pression~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"directe.~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"MINE DE PRO-~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"XIMITê 2E ED~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"** ARMêE **~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Provoqueune~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"Çnormeexplosion",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"destinÇeÖtuer~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"plutìtqu'Ö~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"mutiler.~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"DÇtonation~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"dÇclenchÇepar~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"pression~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"directe.~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"NOISETTES~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DOMMAGES~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"Aucune~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"information~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"disponiblesur~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"cetobjet.~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"DemandezÖvotre",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"reprÇsentant~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"GuildVIIune~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"miseÖjour~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"gratuite.~~~~~~~",ENDTEXT	;info line 9
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
