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
		dc.b	CENTREON,116,"ca§¢n~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DISRUPTOR~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"X CARGA/s~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"unadelasms~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"poderosasarmas~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"humanasport-~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"tiles.aunquela",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"velocidadde~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"repetici¢nes~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"baja,elda§o~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"esinmenso.~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"exigecargade~~~",ENDTEXT	;info line 10
		dc.b	CENTREON,33,"disruptor~~~~~~~",ENDTEXT	;info line 6
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
		dc.b	CENTREON,116,"LANZAdera~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"espacialRPG~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XCohete/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX%F~DA•ADa~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"granadaimpul-~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"sadaporcohe-~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"tesserief~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"delnortede~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"europa.el~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"mejormodelo~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"econ¢mico~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"delostres~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"£ltimosa§os.~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"exigecohete.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"CA•ON LASER~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"FLUJO~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX CARGA/s~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•o~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"usoenelespa-~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"cio,condi-~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"cionesatmosfÇ-~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"ricasmermansu~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"rendimiento.~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"premioala~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"innovaci¢ny~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"dise§o.exige~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"cargade1¢~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"mskjulios.~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"AMETRALLA-~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DORA ARMADA~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX DISPARO/S~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•Os~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"enformatode~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"paquetepara~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"montarlaen~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"soportede70~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"mm.recomendada~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"paraveh°culos~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"deapoyoy~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"defensapuntual.",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"exigemuni-~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"ci¢ndel.44.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"LASER DE MANO",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"HIDRO-FLUOR~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX CARGA/S~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"laprimera~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"generaci¢nde~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"armas¢pticas~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"de~bajamasa.~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"patentenaomi~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"optics,2711.~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"exigeuna~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"cargade1¢~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"mskjulios~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"RIFLE PARTI-~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"CULAS DE LUZ~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX CARGA/S~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"rifledehazde~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"luzbasadoenla",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"transici¢nde~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"energ°ade~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"rayos~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"ultravioleta.~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"resultadomuy~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"destructivo.~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"exigecargade~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"1¢mskj.~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Small Arms im",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"perial auto~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX DISPARO/S~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"producengran~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"ruidoyproble-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"masderetro-~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"ceso,modelo~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"paraentu-~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"siastasy~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"coleccionistas.~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"exigemunici¢n~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"calibre9mm~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Lanzallamas~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"OXY 6~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 100cc~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"protecci¢ntra-~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"seradellama~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"incorporada.la~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"gamaoxyest†a~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"lacabezadela~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"tecnolog°ade~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"seguridad~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"personal.exige~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"100ccomsde~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"combustible.~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Lanzallamas~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"OXY 6 JUNIOR~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 50cc~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"lanzallamas~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"manualqueusa~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"comocombus-~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"tibleunamezcla",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"especialde~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"productos~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"qu°micos.exige~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"100ccomsde~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"SUPERsecreTO~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"(SILENCIADO)~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX DISPARO/S~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"elfavorito~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"delas~~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"organizaciones~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"antiterroristas~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"porsuca§¢n~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"cambiableycpu~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"deelecci¢nde~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"objetivo.exige~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"munici¢ndel~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"calibre9mm.~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"SMALL ARMS~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"SILENT-AUTO~6",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX DISPARO/S",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"pistolaligera~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"decorto~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"alcance.~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"silenciador~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"opcionalcon~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"extensi¢nde~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"ca§¢n.exige~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"munici¢ndel~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"calibre9mm.~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"MINIPISTOLA~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"MONTADA~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX DISPARO/S",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"estearmaesun~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"artilugio~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"militarnodis-~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"poniblepara~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"usocivil.~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"exigemunici¢n~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"calibre9mm.~~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"PISTOLA~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"AUTO M73~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX DISPARO/S",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"poseeuna~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"velocidadde~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"repetici¢n~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"importante.es~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"unbuenarmade~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"usogeneral.~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"exigemunici¢n~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"delcalibre44~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"RIFLE FRAN-~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"COTIRADOR~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX DISPARO/S",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"unmalsusti-~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"tutoparala~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"smallarms6,~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"riflesde~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"objetivolimi-~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"tadosporla~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"bajavelocidad~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"delaboca.~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"exigemunici¢n~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"9mm.~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"RIFLE CALI-~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"BRE TUNGSTEN~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX DISPARO/S",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"cÇlebreva-~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"riedadde~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"riflesdecaza~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"yarmasdemano.",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"normalmente~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"incluyenpistola",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"demanoajuego.",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"exigecartuchos~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"calibre18.~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"XXX DISPARO/S",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"elarmademano~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"demejorcalidad",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"delmercado.el~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"art°culo~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"autÇnticose~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"importas¢lode~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"latierra.exige",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"munici¢ndel~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"calibre9mm.~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"ESCOPETA~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"X BALA/S~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"bajavelocidad~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"derepetici¢n~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"peromuyda§ina.",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"nosenecesita~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"granpunter°a.~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"exige~~~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"cartuchos~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"calibre18.~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"DPU modelo~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"38~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX DISPARO/S",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"revolverestn-~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"dardelosagen-",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"tesdeldeparta-",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"mentodeplane-~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"tasunidos.el~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"extra§omecanis-",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"modefuegopue-",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"deprovocarsu~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"fractura.exige~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"munici¢n38.~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Arma explo-~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"siva 52-C~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"armaterrorifi-~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"caqueoperacon",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"longitudesde~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"ondaqueevapora",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"lasmolÇculasde",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"aguadesustan-~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"ciasorgnicas.~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"exigecarga~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"de1oms~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"kjulios.~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"PISTOLA~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX BALA/S~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"famosavariedad~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"deriflesde~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"cazayarmas~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"demano.~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"normalmentecon~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"rifleajuego.~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"exigecartuchos~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"calibre18.~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Paralizador~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ultras¢nico~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"operaconfre-~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"cuenciasultra-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"s¢nicaspara~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"incapacitar~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"alinterferir~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"conelsistema~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"deequilibrio~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"humano.exige~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"cargade~1~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"¢mskjulios.~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"RESTOS NO~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"IDENTIFICADOS",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"elanlisis~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"indica~~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"restos~~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"orgnicos,~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"carbono~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"y23%de~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"sustancias~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"molecularesno~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"identificadas.~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"Platano~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX TROZO/S~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"frutacultivada~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"encondiciones~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"especiales.pro-",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"ducidaendis-~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"tintasplanta-~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"cionesconper-~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"misodelacor-~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"poraci¢nbana-~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"nerapropietaria",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"delaspatentes~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"Paralizador~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"CEM~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"produceungran~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"campodeener-~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"g°aelectro-~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"magnÇtica.des-~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"truyeelsistema",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"moleculardel~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"objetivo.exige~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"cargade1~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"¢mskjulios.~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"RIFLE DE AS-~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ALTO NAOMI IV",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX DISPARO/S",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"elrivaldel~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"institutonaomi~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"allegendario~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"m73.esta~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"versi¢nespecial",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"incorporamira~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"lserybajo~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"retroceso.~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"exigemunici¢n~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"calibre9mm.~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"LANZAGRA-~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"NADAS NAOMI~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"X GRANADA/S~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"lam†smoderna~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"yreciente~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"creaci¢ndel~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"institutonaomi~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"modelodeins-~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"cripci¢n~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"'trgatelo'.~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"exige~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"granadasde~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"40mm.~~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"GRANADAS DE~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"40mm~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX GRANADA/S~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"paquetedetama-",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"§oyformato~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"normal.lacer†-",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"micacelular~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"explosivade~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"grandensidad~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"generaunagran~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"explosi¢npara~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"eltama§odela~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"granada.~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"JUNTA~NUCLEO~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ENERGIA~FU~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"SI¢N~UNIDAD~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"1~INACTIVA~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"proporciona6~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"a§osdeenerg°a~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"elÇctricade4~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"megavatios.~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"≠mantengala~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"monturaapartada",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"depotentes~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"campos~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"magnÇticos!~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"EQUIPO~UNI-D~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"AUTOGUARDA~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX PISTOLA/S~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"centinela~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"automatizado~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"unidireccional~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"disparaa~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"todoobjetivo~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"enmovimiento~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"situado~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"enfrentesuyo.~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"LADRILLO~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"losladrillos~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"sonelprincipal",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"material~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"deconstrucci¢n~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"deedificios~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"cuandoescasean~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"losmetalesy~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"lospreciosdel~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"plsticoson~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"prohibitivos.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"BOTELLA ROTA~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"ladesventajade",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"labotellade~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"vidrioesquees",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"muyfrgil~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"comparadaconel",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"vidriomoderno.~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"sepuedehacer~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"a§icosydejar~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"bordescortantes",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"ypeligrosos.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"JUEGO MULTI-D",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"AUTOGUARDA~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX PISTOLA/S~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"centinela~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"automtico~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"multidireccional",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"girasobresu~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"ejepara~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"dispararatodo~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"objetoen~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"movimiento.~~~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"MINAS DE~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PROXIMIDAD~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"generauna~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"tremenda~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"explosi¢nideada",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"paramutilara~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"lav°ctimaen~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"lugarde~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"matarla.se~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"activapor~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"presi¢n.~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"MINAS DE~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PROXIMIDAD~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~2¶ EDI.~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"generauna~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"tremenda~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"explosi¢nideada",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"paramatar~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"directamente~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"alav°ctimaen~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"lugarde~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"mutilarla.se~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"activapor~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"presi¢n.~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"CARGA DE~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DISRUPTOR~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"m¢dulodecarga~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"estndar~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"paraacoplaral~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"ca§¢n~~~~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"disruptor.~~~~~~",ENDTEXT	;info line 5
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
		dc.b	CENTREON,116,"COHETE~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ANTI-CPA~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"proyectilde~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"combustible~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"s¢lidoconradio",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"demicro-~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"explosi¢n~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"dealta~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"densidad.~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"apropiadopara~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"lamayor°ade~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"lanzacohetes~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"SABLEMKII~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"GRANTEA.44~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX DISPARO/S",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"munici¢nde~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"transmisi¢nde~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"energ°a~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"acelerada.tea~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"transfierecasi~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"todasuenerg°a~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"cinÇticaal~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"objetivoyes~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"particularmente~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"efectiva.~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"THV .44~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX DISPARO/S",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"el£ltimotea~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"disponible.~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"buena~~~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"perforaci¢nde~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"blindaje~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"bajorebote,~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"bajoretrocesoy",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"excelenteacci¢n",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"de~parada.~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"TEA 9mm gran~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"VELOCIDAD~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX DISPARO/S",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"tipodemunici¢n",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"m†susado.tam-~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"biÇndisponible~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"enformato44mm.",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"sualtonivelde",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"penetraci¢n~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"conllevauna~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"bajaacci¢nde~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"paradaen~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"blancosblandos.",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"RecARGA de~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"lanzallamas~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 100cc~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"derivadobarato~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"decombustible~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"qu°micodebajo~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"grado.produce~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"resultados~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"¢ptimosconla~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"gamade~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"lanzallamas~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"personales~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"oxy~6.~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"RecAR. lanza-",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"llama GAS~UX~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 100cc~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"derivadobarato~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"decombustible~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"qu°micodebajo~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"grado.produce~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"resultados~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"¢ptimosconla~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"gamade~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"lanzallamas~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"personales~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"oxy~6.~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"RecARGAlanza",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"llamasJR~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 50cc~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"derivadobarato~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"de~combustible~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"qu°micodebajo~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"grado.produce~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"resultados~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"¢ptimosconla~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"gamade~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"lanzallamas~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"personales~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"oxy6.~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"RecAR. GAS UX",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"lanzallaMAS~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX x 50cc~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"derivadobarato~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"decombustible~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"qu°micodebajo~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"grado.produce~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"resultados~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"¢ptimosconla~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"gamade~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"lanzallamas~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"personales~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"oxy~6.~~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"BALA MUY EX-~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PLOSIVA~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX BALA/S~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"munici¢nde~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"pistola.esta~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"variantetiene~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"unasolaojiva~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"enlugardeper-",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"digones.con-~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"tieneunacarga~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"altamente~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"explosiva.~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"BALA RAYADA~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"CALIBRE 18~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX BALA/S~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"provistadeun~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"centrodeuranio",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"proporciona~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"buena~~~~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"penetraci¢n~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"y~estrayada~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"paralograr~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"mayor~~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"precisi¢n.~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"THV 9mm~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"SERIE 'MINI'~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX DISPARO/S",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"munici¢ndetea~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"compacta.buena~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"perforaci¢nde~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"blindaje,bajo~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"rebote,bajo~re-",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"trocesoybuena~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"acci¢ndepara-~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"da.disponible~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"tambiÇnen~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"formato44mm.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"GLASER 38 mm~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PARA DPU~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX DISPARO/S",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"munici¢nmuy~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"cara~y~~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"exclusiva~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"s¢loutilizada~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"pordpu.~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"dif°cilde~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"obtener.~~~~~~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"UNICêLULA~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"1 KJULIO~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"cargade1kjul~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"con~conectores~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"determinalaa~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"estndarpara~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"armasdeener-~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"g°a.especial~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"paralseresde~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"pulsaci¢nyemi-",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"sorasde~~~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"protones.~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"CêLULA DOBLE~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"3 KJULIOS~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX CARGA/S~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"cargade3kjul~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"conconectores~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"determinalaa~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"estndarpara~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"armasdeener-~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"g°a.aseg£rese~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"dedefinirla~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"polaridad~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"correcta.~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"CêLULA TRIPLE",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"6 KJULIOS~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX CARGA/S~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"aunquepuede~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"usarcargasde~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"6kjulioscon~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"armasdemano,~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"estndise§adas~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"paraarmas~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"montadasen~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"veh°culos.~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"RESTOS NO~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"IDENTIFICADOS",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"elanlisis~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"indica~~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"rastros~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"orgnicos,~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"carbono~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"y23%de~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"sustancias~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"molecularesno~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"identificadas.~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"TROZOS DE~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PLATANO~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XXX TROZO/S~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"losentimos.~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"nodisponemos~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"deinformaci¢n~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"sobreeste~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"objeto.~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"soliciteasu~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"representante~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"deguildviiun~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"paqueteactua-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"lizadogratis.~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"BARRA DE PAN~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"CRUJIENTE~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"losentimos.~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"nodisponemos~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"deinformaci¢n~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"sobreeste~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"objeto.~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"soliciteasu~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"representante~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"deguildviiun~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"paqueteactua-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"lizadogratis.~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"QUESO~~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"sucedneodel~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"queso,esuna~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"sustanciamuy~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"nutritiva,enri-",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"quecidaconvi-~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"taminas.creada~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"paramisiones~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"espacialesdonde",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"lanutrici¢nes~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"esencial.~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"BOTELLA~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"lasbotellas~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"estnhechasde~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"silicatocom£n~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"calentadoa~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"altastempe-~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"raturaspara~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"crearvidrio.la",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"mejorcualidad~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"delasbotellas~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"essuprecio.~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"MANZANA~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"frutacom£n.~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"lasmanzanasse~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"cultivancon~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"facilidad,lo~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"quelasexcluye~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"depatentesy~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"deldecreto~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"de2609.~~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"MUSLO DE~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"POLLO~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"losentimos.~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"nodisponemos~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"deinformaci¢n~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"sobreeste~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"objeto.~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"soliciteasu~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"representante~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"deguildviiun~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"paqueteactua-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"lizadogratis.~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"PAN DE MOLDE~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"losentimos.~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"nodisponemos~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"deinformaci¢n~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"sobreeste~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"objeto.~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"soliciteasu~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"representante~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"deguildviiun~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"paqueteactua-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"lizadogratis.~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"PETACA~~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"losentimos.~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"nodisponemos~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"deinformaci¢n~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"sobreeste~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"objeto.~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"soliciteasu~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"representante~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"de~guildviiun~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"paqueteactua-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"lizadogratis.~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"RACIONES~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ESTANDAR I~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"racionesconcen-",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"tradasdenivel~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"1.notienen~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"saborpero~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"cubrentodaslas",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"necesidades~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"alimenticias~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"bsicas(excepto",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"agua).~~~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"RACIONES~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ESTANDAR II~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"racionesconcen-",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"tradasdenivel~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"2.sonbastante~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"parecidasalas~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"denivel1pero~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"incorporan~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"caracter°sticas~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"demejora~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"energÇtica~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"RACIONES~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ESTANDAR III~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"racionesconcen-",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"tradasnivel3~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"conelementos~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"orgnicosyqu°-",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"micospara~esti-",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"mularlasalud~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"msalldela~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"resistencianor-",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"mal.inocuasen~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"dosisnormales.~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"BOTIQUIN~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"botiqu°ndepri-",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"merosauxilios~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"as°comosuple-~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"mentosalimen-~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"ticiosnopere-~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"cederos.tambiÇn",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"cuentacondife-",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"rentesant°dotos",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"contravenenos.~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"JERINGA~~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ANTITOXINAS~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"drogadecampo~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"debatallapara~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"inmunizar~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"temporalmente~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"contratoxinas~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"comunes.sus~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"efectossuelen~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"durarcuatro~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"minutos.~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"JUEGO REPARA-",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"CION ANDROID.",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"equipovitalca-",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"serodearreglo~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"deandroidesen~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"lasm†savanza-~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"dascivilizacio-",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"nes.contabla~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"dediagn¢stico,~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"pastaderelleno",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"yjuegodereto-",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"quedepintura.~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"JUNTA NUCLEO~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ENERGIA FU-~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"si¢n UNIDAD~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"2 INACTIVA~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"proporciona6~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"a§osdeenerg°a~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"elÇctricade4~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"megavatios.~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"≠mantengala~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"monturaapartada",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"depotentes~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"campos~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"magnÇticos!~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"JUNTA NUCLEO~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ENERGIA FU-~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"si¢n UNIDAD~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"3 INACTIVA~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"proporciona6~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"a§osdeenerg°a~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"elÇctricade4~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"megavatios.~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"≠mantengala~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"monturaapartada",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"depotentes~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"campos~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"magnÇticos!~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"JUNTA NUCLEO~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ENERGIA FU-~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"si¢n~UNIDAD~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"4~INACTIVA~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"proporciona6~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"a§osdeenerg°a~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"elÇctricade4~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"megavatios.~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"≠mantengala~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"monturaapartada",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"depotentes~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"campos~~~~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"magnÇticos!~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"losentimos.~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"nodisponemos~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"deinformaci¢n~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"sobreeste~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"objeto.~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"soliciteasu~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"representante~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"deguildviiun~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"paqueteactua-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"lizadogratis.~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"LLAVE COMUN~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"losentimos.~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"nodisponemos~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"deinformaci¢n~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"sobreeste~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"objeto.~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"soliciteasu~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"representante~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"de~guildviiun~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"paqueteactua-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"lizadogratis.~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"LLAVE ADORNOS",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"losentimos.~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"nodisponemos~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"deinformaci¢n~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"sobreeste~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"objeto.~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"soliciteasu~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"representante~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"de~guildviiun~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"paqueteactua-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"lizadogratis.~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"PLACA ACCESO~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DE SEGURIDAD~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"SOLO~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"CIVILES~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"placadeacceso~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"deseguridad.~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"debajonivel~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"normalmente~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"utilizadapara~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"establecer~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"restriccionesde",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"PLACA ACCESO~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DE SEGURIDAD~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"ACCESO NO~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"LIMITADO~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"placamaestrade",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"accesode~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"seguridad~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"normalmente~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"utilizadapara~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"establecer~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"restriccionesde",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"PLACA ACCESO~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DE SEGURIDAD~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"SOLO~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"EMPLEADOS~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"placadeacceso~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"denivel~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"intermediode~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"seguridad.~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"normalmente~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"utilizadapara~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"establecer~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"restriccionesde",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"zona.~~~~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"PLACA ACCESO~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DE SEGURIDAD~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"SOLO~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"OFICIALES~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"placadeacceso~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"dealtonivelde",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"seguridad.~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"normalmente~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"utilizadapara~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"establecer~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"restriccionesde",ENDTEXT	;info line 7
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
		dc.b	CENTREON,33,"losentimos.~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"nodisponemos~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"deinformaci¢n~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"sobreeste~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"objeto.~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"soliciteasu~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"representante~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"de~guildviiun~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"paqueteactua-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"lizadogratis.~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,33,"favoritodelos~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"periodistas,ya~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"quepermitela~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"grabaci¢nde~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"metrajecon~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"mecanismo~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"internopara~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"probarqueno~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"hasidoalterado",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"nimanipulado.~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"MODULO E.T.D.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"escnerdigital~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"deterreno.este",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"aparatode~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"manoproporciona",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"unregistro~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"visualybasede",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"datostctica~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"acercadel~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"entornoactual.~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"MODULO E.T.D.",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"'ULTRA' PROTO",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"losentimos.~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"nodisponemos~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"deinformaci¢n~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"sobreeste~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"objeto.~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"soliciteasu~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"representante~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"deguildviiun~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"paqueteactua-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"lizadogratis.~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"losentimos.~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"nodisponemos~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"deinformaci¢n~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"sobreeste~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"objeto.~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"soliciteasu~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"representante~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"de~guildviiun~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"paqueteactua-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"lizadogratis.~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"AMP-PSIONIC~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"BOLA DE FUEGO",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"genera~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"unabola~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"llameantede~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"plasmade~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"potenciamedia~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"justo~~~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"delantedel~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"usuario.~~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"AMP-PSIONIC~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"INFIERNO~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"genera~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"unabola~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"llameantede~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"plasmade~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"granpotencia~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"justo~~~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"delantedel~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"usuario.~~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"AMP-PSIONIC~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"EXPLOSION~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"genera~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"cuatrobolas~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"llameantesde~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"plasmade~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"potenciamediana",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"alrededor~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"delusuario.~~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"AMP-PSIONIC~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DEVASTADOR~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"genera~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"cuatrobolas~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"llameantesde~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"plasmano~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"desintegrantede",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"granpotencia~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"alrededordel~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"usuario.~~~~~~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"AMP-PSIONIC~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"IGNIFUGO~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"protege~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"unvolumende~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"2metros~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"c£bicos,~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"generalmente~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"elusuario,de~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"lamayor°ade~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"losefectosde~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"lasarmasde~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"plasma.~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"AMP-PSIONIC~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ESCUDO~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"protege~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"unvolumende~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"2metros~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"c£bicos,~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"generalmente~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"elusuario,de~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"lamayor°ade~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"losefectosde~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"losproyectiles~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"yarmasblancas.",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"AMP-PSIONIC~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"GRANITO~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"multiplicapor~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"tresel~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"metabolismodel~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"usuario.~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"estimula~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"eficazmentela~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"fuerzayvigor~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"delusuario~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"durantecuatro~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"minutos.~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"AMP-PSIONIC~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"TITANIO~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"multiplicapor~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"seisel~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"metabolismodel~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"usuario.~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"estimula~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"eficazmentela~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"fuerzayvigor~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"delusuario~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"durantecuatro~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"minutos.~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"AMP-PSIONIC~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"MURO~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"genera~~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"uncampode~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"resonanciacasi~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"indestructible~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"querechaza~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"lasmaterias~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"s¢lidas.~~~~~~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"AMP-PSIONIC~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"DEMOLEDOR~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"destruyey~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"disipacampos~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"deresonancia~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"quenormalmente~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"rechazar°an~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"sustancias~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"s¢lidas~~~~~~~~~",ENDTEXT	;info line 6
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
		dc.b	CENTREON,116,"AMP-PSIONIC~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PUENTE~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"creauna~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"plataformaauto-",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"suspendida~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"estable~~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"directamente~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"delantedel~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"usuario.~~~~~~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,33,"losentimos.~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"nodisponemos~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"deinformaci¢n~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"sobreeste~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"objeto.~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"soliciteasu~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"representante~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"de~guildviiun~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"paqueteactua-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"lizadogratis.~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"AMP-PSIONIC~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PLUMA~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"disminuyede~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"formaeficaz~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"elpesodelas~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"pertenencias~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"delusuario~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"peronoel~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"propio.~~~~~~~~~",ENDTEXT	;info line 7
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
		dc.b	8		;flash colour
		dc.b	10		;sample
		dc.w	255		;sample period
		dc.w	0		;ex sample
		dc.w	0		;ex sample period
		dc.b	8		;level
		ds.b    11
;item 94 :
;initial number of charges = 10
		dc.b	CENTREON,116,"AMP-PSIONIC~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"SONICO~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"emiteunaonda~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"decompresi¢n~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"moderadamente~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"destructiva.~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"molestaparael~",ENDTEXT	;info line 10
		dc.b	CENTREON,33,"tejidoanimal~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"blandoylos~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"subsistemas~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"elÇctricos.~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"AMP-PSIONIC~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"CHOQUE~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"emiteunaonda~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"decompresi¢n~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"sumamente~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"destructiva.~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"~~~~~~~~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"molestaparael~",ENDTEXT	;info line 10
		dc.b	CENTREON,33,"tejidoanimal~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"blandoylos~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"subsistemas~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"elÇctricos.~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"AMP-PSIONIC~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"BRANQUIAS~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"envuelveal~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"usuarioenuna~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"capade6cmde~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"espesordeaire~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"restaurador.le~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"permiterespirar",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"bajoelagua~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"durante4~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"minutos.~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"AMP-PSIONIC~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ROMPEOLAS~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"creaun~~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"canalatravÇs~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"delamayor°ade",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"l°quidos,quese",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"extiendehacia~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"fueradesdela~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"ubicaci¢n~del~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"usuario.~~~~~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"AMP-PSIONIC~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"APLACADOR~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"cuandoseusa~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"bajoelagua~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"esteefecto~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"creaun~~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"recipientede~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"l°quido~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"purificado~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"apropiadopara~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"elconsumo~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"humano.~~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"AMP-PSIONIC~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"HERMêTICO~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"creauna~~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"envoltura~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"noporosae~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"invisible~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"alrededordelas",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"pertenencias~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"delusuario~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"durante4~~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"minutos.~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"AMP-PSIONIC~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"ELECTRIFIC.~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"lanzauna~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"carga~~~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"elÇctrica~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"dÇbilcontraun~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"objetivo~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"situadojusto~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"delante~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"delusuario.~~~~",ENDTEXT	;info line 8
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
		dc.b	CENTREON,116,"AMP-PSIONIC~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"RELAMPAGO~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"lanzauna~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"fuentecarga~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"elÇctrica~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"contraun~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"objetivo~~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"situadojusto~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"delante~~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"delusuario.~~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"AMP-PSIONIC~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"FREIDOR~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"lanzauna~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"carga~~~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"elÇctrica~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"muyfuerte~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"contraun~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"objetivo~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"situadojusto~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"delante~~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"delusuario.~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"AMP-PSIONIC~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"CLARIVIDENTE~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"seacopla~~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"directamenteal~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"sensordeledt~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"delusuario.~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"incrementa~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"lainformaci¢n~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"almacenadasobre",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"elentorno~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"locales.~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"AMP-PSIONIC~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"TRANSPORTADOR",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"llevaalusuario",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"deforma~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"instantnea~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"aunalocalidad~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"fortuitadentro~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"deunradio~de~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"40m.~~~~~~~~~~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"losentimos.~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"nodisponemos~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"deinformaci¢n~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"sobreeste~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"objeto.~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"soliciteasu~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"representante~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"de~guildviiun~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"paqueteactua-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"lizadogratis.~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"AMP-PSIONIC~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"CURAVENENO~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"depuralasangre",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"delusuariode~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"toxinas~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"extra§as.~~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"s¢loesefectivo",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"consujetos~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"humanos.~~~~~~~~",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"AMP-PSIONIC~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"CICATRIZADOR~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"acelerael~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"metabolismo,~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"sistemade~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"inmunizaci¢ny~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"larecuperaci¢n~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"detejidos~del~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"usuario.~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"cicatriza~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"heridasysana~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"envenenamientos.",ENDTEXT	;info line 7
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
		dc.b	CENTREON,116,"AMP-PSIONIC~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"TRANSMUTADOR~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"losentimos.~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"nodisponemos~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"deinformaci¢n~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"sobreeste~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"objeto.~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"soliciteasu~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"representante~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"deguildviiun~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"paqueteactua-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"lizadogratis.~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"AMP-PSIONIC~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"MILAGROSO~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"XX CARGA/S~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"losentimos.~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"nodisponemos~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"deinformaci¢n~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"sobreeste~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"objeto.~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"soliciteasu~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"representante~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"deguildviiun~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"paqueteactua-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"lizadogratis.~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"RESTOS~NO~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"IDENTIFICADOS",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"elanlisis~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"indica~~~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"rastros~~~~~~~~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"org†nicos,~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"carbono~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"y23%de~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"sustancias~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"molecularesno~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"identificadas.~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"MINAS DE~~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"PROXIMIDAD~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"** ARMADO **~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"generauna~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"tremenda~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"explosi¢nideada",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"paramutilara~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"lav°ctimaen~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"lugarde~~~~~~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"matarla.se~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"activapor~~~~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"presi¢n.~~~~~~~~",ENDTEXT	;info line 9
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
		dc.b	CENTREON,116,"MINAS PROXI-~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"MIDAD 2¶ EDI.",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"** ARMADO **~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"generauna~~~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"tremenda~~~~~~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"explosi¢nideada",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"paramatar~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"directamente~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"alav°ctimaen~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"lugarde~~~~~~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"mutilarla.se~~~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"activapor~~~~~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"presi¢n.~~~~~~~~",ENDTEXT	;info line 10
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
		dc.b	CENTREON,116,"AVELLANAS~~~~",ENDTEXT	;header line 1
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;header line 2
		dc.b	CENTREON,116,"~~~~~~~~~~~~~",ENDTEXT	;footer line 1
		dc.b	CENTREON,116,"XX% DA•OS~~~~",ENDTEXT	;footer line 2
		dc.b	CENTREON,33,"losentimos.~~~~",ENDTEXT	;info line 1
		dc.b	CENTREON,33,"nodisponemos~~~",ENDTEXT	;info line 2
		dc.b	CENTREON,33,"deinformaci¢n~~",ENDTEXT	;info line 3
		dc.b	CENTREON,33,"sobreeste~~~~~~",ENDTEXT	;info line 4
		dc.b	CENTREON,33,"objeto.~~~~~~~~~",ENDTEXT	;info line 5
		dc.b	CENTREON,33,"soliciteasu~~~",ENDTEXT	;info line 6
		dc.b	CENTREON,33,"representante~~~",ENDTEXT	;info line 7
		dc.b	CENTREON,33,"deguildviiun~",ENDTEXT	;info line 8
		dc.b	CENTREON,33,"paqueteactua-~~",ENDTEXT	;info line 9
		dc.b	CENTREON,33,"lizadogratis.~~",ENDTEXT	;info line 10
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
