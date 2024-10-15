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
**************************** © Scott Johnston 1990-93 **************************
********************************************************************************

		opt 	o+,ow-

		incdir	source:hiredguns/sources

		include	macros.i

********************************************************************************
*** English ********************************************************************
********************************************************************************

		dc.b	"003E origin unknown",ENDTEXT,"         "	;char 1
		dc.b	"Clavius",ENDTEXT,"                     "
		dc.b	"Humanoid, 176 years",ENDTEXT,"         "
		dc.b	"Pilot",ENDTEXT,"                       "
		dc.b	"Clavius",ENDTEXT,"         "
		dc.b	"CharactersGfx/Clavius.gfx",ENDTEXT,"  "
		dc.b	2		;gender (0=male, 1=female, 2=n/a)
		dc.b	3		;race
		dc.b	13		;class
		dc.w	65535		;fitness
		dc.w	152		;physique
		dc.w	150		;agility
		dc.w	0		;experience
		dc.w	360		;footstep sample period
		dc.w	609		;grunt sample period
		dc.b	19,0,50,0	; blaster (item num,damage,ammo,potency)
		dc.b	35,0,0,0	; explosive
		dc.b	35,0,0,0	; explosive
		dc.b	62,0,0,0	; rations 2
		dc.b	60,0,0,0	; flask
		dc.b	49,0,50,0	; 1 kv
		dc.b	49,0,50,0	; 1 kv
		dc.b	51,0,200,0	; 6 kv
		dc.b	79,0,0,0	; dts module
		dc.b	27,0,6,0	; grenades

		dc.b	79,0,0,0	; dts module
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;

********************************************************************************

		dc.b	"00-98CC Earth",ENDTEXT,"               "	;char 2
		dc.b	"Siygess, Cheule",ENDTEXT,"             "
		dc.b	"Female Human, 27 years",ENDTEXT,"      "
		dc.b	"Earth citizen",ENDTEXT,"               "
		dc.b	"Cheule",ENDTEXT,"          "
		dc.b	"CharactersGfx/Cheule.gfx",ENDTEXT,"   "
		dc.b	1		;gender (0=male, 1=female, 2=n/a)
		dc.b	0		;race
		dc.b	4		;class
		dc.w	65535		;fitness
		dc.w	129		;physique
		dc.w	160		;agility
		dc.w	0		;experience
		dc.w	330		;footstep sample period
		dc.w	509		;grunt sample period
		dc.b	25,0,64,0	; assault rifle (item num,damage,ammo,potency)
		dc.b	64,0,0,0	; medical pack
		dc.b	57,0,0,0	; apple
		dc.b	40,0,150,0	; 9mm thv
		dc.b	47,0,250,0	; 9mm aet
		dc.b	79,0,0,0	; dts module
		dc.b	107,0,5,0	; psi cure poison
		dc.b	27,0,6,0	; grenades
		dc.b	27,0,6,0	; grenades
		dc.b	26,0,3,0	; grenade launcher
;		dc.b	0,0,0,0		;

		dc.b	79,0,0,0	; dts module
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;

********************************************************************************

		dc.b	"04-56FE Tesseract",ENDTEXT,"           "	;char 3
		dc.b	"MC 128-7 CIM",ENDTEXT,"                "
		dc.b	"Mech, 6 years",ENDTEXT,"               "
		dc.b	"Combat-infantry series",ENDTEXT,"      "
		dc.b	"CIM",ENDTEXT,"             "
		dc.b	"CharactersGfx/CIM.gfx",ENDTEXT,"      "
		dc.b	2		;gender (0=male, 1=female, 2=n/a)
		dc.b	1		;race
		dc.b	2		;class
		dc.w	65535		;fitness
		dc.w	321		;physique
		dc.w	28		;agility
		dc.w	0		;experience
		dc.w	460		;footstep sample period
		dc.w	669		;grunt sample period
		dc.b	12,0,200,0	; minigun (item num,damage,ammo,potency)
		dc.b	15,0,16,0	; tungsten rifle
		dc.b	38,0,250,0	; .44 aet
		dc.b	38,0,250,0	; .44 aet
		dc.b	46,0,50,0	; rifled slug
		dc.b	9,0,40,0	; flamer junior
		dc.b	66,0,0,0	; repair
		dc.b	66,0,0,0	; repair
		dc.b	30,0,3,0	; sentry kit
		dc.b	0,0,0,0		;

		dc.b	79,0,0,0	; dts module
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;

********************************************************************************

		dc.b	"01-A45D New Europe",ENDTEXT,"          "	;char 4
		dc.b	"Desverger",ENDTEXT,"                   "
		dc.b	"Male Human, 42 years",ENDTEXT,"        "
		dc.b	"Freelance assassin",ENDTEXT,"          "
		dc.b	"Desverger",ENDTEXT,"       "
		dc.b	"CharactersGfx/Desverger.gfx",ENDTEXT,""
		dc.b	0		;gender (0=male, 1=female, 2=n/a)
		dc.b	0		;race
		dc.b	1		;class
		dc.w	65535		;fitness
		dc.w	187		;physique
		dc.w	85		;agility
		dc.w	0		;experience
		dc.w	360		;footstep sample period
		dc.w	579		;grunt sample period
		dc.b	14,0,54,0	; sniper rifle (item num,damage,ammo,potency)
		dc.b	47,0,250,0	; 9mm aet
		dc.b	21,0,50,0	; stunner
		dc.b	49,0,50,0	; 1 kv
		dc.b	34,0,0,0	; mine
		dc.b	34,0,0,0	; mine
		dc.b	27,0,6,0	; grenades
		dc.b	79,0,0,0	; dts module
		dc.b	101,0,20,0	; psi electrify
		dc.b	64,0,0,0	; rations 3

		dc.b	79,0,0,0	; dts module
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;

********************************************************************************

		dc.b	"07-0453 Cassandra",ENDTEXT,"           "	;char 5
		dc.b	"Reannon, Adele",ENDTEXT,"              "
		dc.b	"Female Human, 31 years",ENDTEXT,"      "
		dc.b	"Security systems expert",ENDTEXT,"     "
		dc.b	"Adele",ENDTEXT,"           "
		dc.b	"CharactersGfx/Adele.gfx",ENDTEXT,"    "
		dc.b	1		;gender (0=male, 1=female, 2=n/a)
		dc.b	0		;race
		dc.b	7		;class
		dc.w	65535		;fitness
		dc.w	94		;physique
		dc.w	196		;agility
		dc.w	0		;experience
		dc.w	310		;footstep sample period
		dc.w	489		;grunt sample period
		dc.b	13,0,128,0	; auto-gun (item num,damage,ammo,potency)
		dc.b	21,0,50,0	; stunner
		dc.b	49,0,50,0	; 1 kv
		dc.b	39,0,150,0	; .44 thv
		dc.b	64,0,0,0	; medical pack
		dc.b	57,0,0,0	; apple
		dc.b	64,0,0,0	; medical pack
		dc.b	61,0,0,0	; rations 1
		dc.b	79,0,0,0	; dts module
		dc.b	27,0,6,0	; grenades

		dc.b	79,0,0,0	; dts module
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;

********************************************************************************

		dc.b	"00-0027 New Europe",ENDTEXT,"          "	;char 6
		dc.b	"Torre, Miyriel",ENDTEXT,"              "
		dc.b	"Cyborg, 100 years",ENDTEXT,"           "
		dc.b	"Interfacing IV series",ENDTEXT,"       "
		dc.b	"Miyriel",ENDTEXT,"         "
		dc.b	"CharactersGfx/Miyriel.gfx",ENDTEXT,"  "
		dc.b	2		;gender (0=male, 1=female, 2=n/a)
		dc.b	4		;race
		dc.b	12		;class
		dc.w	65535		;fitness
		dc.w	100		;physique
		dc.w	132		;agility
		dc.w	0		;experience
		dc.w	360		;footstep sample period
		dc.w	519		;grunt sample period
		dc.b	79,0,0,0	; dts module (item num,damage,ammo,potency)
		dc.b	19,0,50,0	; blaster
		dc.b	66,0,0,0	; droid kit
		dc.b	66,0,0,0	; droid kit
		dc.b	66,0,0,0	; droid kit
		dc.b	24,0,20,0	; emf stunner
		dc.b	27,0,6,0	; grenades
		dc.b	27,0,6,0	; grenades
		dc.b	33,0,1,0	; sentry kit
		dc.b	0,0,0,0		;

		dc.b	79,0,0,0	; dts module
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;

********************************************************************************

		dc.b	"01-56FE New Europe",ENDTEXT,"          "	;char 7
		dc.b	"Deevergh, Rorian",ENDTEXT,"            "
		dc.b	"Male Human, 42 years",ENDTEXT,"        "
		dc.b	"Skilled Combatant",ENDTEXT,"           "
		dc.b	"Rorian",ENDTEXT,"          "
		dc.b	"CharactersGfx/Rorian.gfx",ENDTEXT,"   "
		dc.b	0		;gender (0=male, 1=female, 2=n/a)
		dc.b	0		;race
		dc.b	0		;class
		dc.w	65535		;fitness
		dc.w	156		;physique
		dc.w	105		;agility
		dc.w	0		;experience
		dc.w	360		;footstep sample period
		dc.w	579		;grunt sample period
		dc.b	11,0,54,0	; silent-auto (item num,damage,ammo,potency)
		dc.b	16,0,6,0	; s&w 29
		dc.b	47,0,150,0	; 9mm thv
		dc.b	47,0,150,0	; 9mm thv
		dc.b	27,0,6,0	; grenades
		dc.b	79,0,0,0	; dts module
		dc.b	86,0,5,0	; psi fireshield
		dc.b	83,0,20,0	; psi inferno
		dc.b	57,0,0,0	; apple
		dc.b	57,0,0,0	; apple

		dc.b	79,0,0,0	; dts module
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;

********************************************************************************

		dc.b	"A037 origin unknown",ENDTEXT,"         "	;char 8
		dc.b	"Freymon, Jenillee",ENDTEXT,"           "
		dc.b	"Female Human, 27 years",ENDTEXT,"      "
		dc.b	"Battlefield medic",ENDTEXT,"           "
		dc.b	"Jenillee",ENDTEXT,"        "
		dc.b	"CharactersGfx/Jenillee.gfx",ENDTEXT," "
		dc.b	1		;gender (0=male, 1=female, 2=n/a)
		dc.b	0		;race
		dc.b	3		;class
		dc.w	65535		;fitness
		dc.w	95		;physique
		dc.w	211		;agility
		dc.w	0		;experience
		dc.w	320		;footstep sample period
		dc.w	479		;grunt sample period
		dc.b	21,0,50,0	; stunner (item num,damage,ammo,potency)
		dc.b	49,0,50,0	; 1 kv
		dc.b	64,0,0,0	; medical pack
		dc.b	64,0,0,0	; medical pack
		dc.b	64,0,0,0	; medical pack
		dc.b	108,0,3,0	; psi heal
		dc.b	87,0,5,0	; psi shield
		dc.b	107,0,5,0	; psi cure poison
		dc.b	96,0,6,0        ; psi shock
		dc.b	27,0,6,0	; grenades

		dc.b	79,0,0,0	; dts module
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;

********************************************************************************

		dc.b	"04-154E Tesseract",ENDTEXT,"           "	;char 12
		dc.b	"Kiurcher",ENDTEXT,"                    "
		dc.b	"Male Human, 49 years",ENDTEXT,"        "
		dc.b	"Marksman",ENDTEXT,"                    "
		dc.b	"Kiurcher",ENDTEXT,"        "
		dc.b	"CharactersGfx/Kiurcher.gfx",ENDTEXT," "
		dc.b	0		;gender (0=male, 1=female, 2=n/a)
		dc.b	0		;race
		dc.b	9		;class
		dc.w	65535		;fitness
		dc.w	190		;physique
		dc.w	75		;agility
		dc.w	0		;experience
		dc.w	400		;footstep sample period
		dc.w	589		;grunt sample period
		dc.b	10,0,54,0	; supercovert (item num,damage,ammo,potency)
		dc.b	9,0,40,0	; flamer junior
		dc.b	47,0,150,0	; 9mm thv
		dc.b	47,0,150,0	; 9mm thv
		dc.b	44,0,20,0	; junior refill
		dc.b	79,0,0,0	; dts module
		dc.b	107,0,5,0	; psi cure poison
		dc.b	55,0,0,0	; cheese
		dc.b	59,0,0,0	; loaf
		dc.b	27,0,6,0	; grenades

		dc.b	79,0,0,0	; dts module
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;

********************************************************************************

		dc.b	"08-32EE Starscape",ENDTEXT,"           "	;char 10
		dc.b	"Spey, Bonden",ENDTEXT,"                "
		dc.b	"Male Human, 22 years",ENDTEXT,"        "
		dc.b	"Citizen",ENDTEXT,"                     "
		dc.b	"Bonden",ENDTEXT,"          "
		dc.b	"CharactersGfx/Bonden.gfx",ENDTEXT,"   "
		dc.b	0		;gender (0=male, 1=female, 2=n/a)
		dc.b	0		;race
		dc.b	4		;class
		dc.w	65535		;fitness
		dc.w	207		;physique
		dc.w	106		;agility
		dc.w	0		;experience
		dc.w	380		;footstep sample period
		dc.w	569		;grunt sample period
		dc.b	17,0,2,0	; shotgun (item num,damage,ammo,potency)
		dc.b	26,0,3,0	; grenade launcher
		dc.b	46,0,50,0	; rifled slug
		dc.b	27,0,6,0	; grenades
		dc.b	60,0,0,0	; flask
		dc.b	79,0,0,0	; dts module
		dc.b	64,0,0,0	; medical
		dc.b	27,0,6,0	; grenades
		dc.b	27,0,6,0	; grenades
		dc.b	0,0,0,0		;

		dc.b	79,0,0,0	; dts module
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;

********************************************************************************

		dc.b	"04-F140 Tesseract",ENDTEXT,"           "	;char 7
		dc.b	"Homez, Katrina",ENDTEXT,"              "
		dc.b	"Female Human, 27 years",ENDTEXT,"      "
		dc.b	"Former UPBI agent",ENDTEXT,"           "
		dc.b	"Katrina",ENDTEXT,"         "
		dc.b	"CharactersGfx/Katrina.gfx",ENDTEXT,"  "
		dc.b	1		;gender (0=male, 1=female, 2=n/a)
		dc.b	0		;race
		dc.b	6		;class
		dc.w	65535		;fitness
		dc.w	131		;physique
		dc.w	144		;agility
		dc.w	0		;experience
		dc.w	320		;footstep sample period
		dc.w	519		;grunt sample period
		dc.b	18,0,64,0	; issue 38 (item num,damage,ammo,potency)
		dc.b	48,0,64,0	; .38
		dc.b	48,0,64,0	; .38
		dc.b	48,0,64,0	; .38
		dc.b	35,0,0,0	; mine2
		dc.b	79,0,0,0	; dts module
		dc.b	27,0,6,0	; grenades
		dc.b	27,0,6,0	; grenades
		dc.b	63,0,0,0	; rations 3
		dc.b	0,0,0,0		;

		dc.b	79,0,0,0	; dts module
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;

********************************************************************************

		dc.b	"56-AA56 Freewill",ENDTEXT,"            "	;char 12
		dc.b	"CIM-Lite",ENDTEXT,"                    "
		dc.b	"Mech, 2 years",ENDTEXT,"               "
		dc.b	"Combat-infantry series",ENDTEXT,"      "
		dc.b	"CIM-Lite",ENDTEXT,"        "
		dc.b	"CharactersGfx/CIM-Lite.gfx",ENDTEXT," "
		dc.b	2		;gender (0=male, 1=female, 2=n/a)
		dc.b	1		;race
		dc.b	2		;class
		dc.w	65535		;fitness
		dc.w	250		;physique
		dc.w	44		;agility
		dc.w	0		;experience
		dc.w	400		;footstep sample period
		dc.w	519		;grunt sample period
		dc.b	79,0,0,0	; (item num,damage,ammo,potency)
		dc.b	5,0,50,0	; hand laser
		dc.b	17,0,2,0	; shotgun
		dc.b	45,0,90,0	; he slugs
		dc.b	66,0,0,0	; repair
		dc.b	66,0,0,0	; repair
		dc.b	27,0,6,0	; grenades
		dc.b	27,0,6,0	; grenades
		dc.b	33,0,3,0	; sentry kit
		dc.b	0,0,0,0		;

		dc.b	79,0,0,0	; dts module
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;
		dc.b	0,0,0,0		;

