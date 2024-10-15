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

********************************************************************************
;monster 01 : leadhile
		dc.w	50		;physique
		dc.w	75		;weapon modifier
		dc.b	1		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+0		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	2500		;bravery
		dc.w	13		;sample number
		dc.w	380		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	100		;physique
		dc.w	125		;weapon modifier
		dc.b	1		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+0		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	2000		;bravery
		dc.w	13		;sample number
		dc.w	380		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	200		;physique
		dc.w	400		;weapon modifier
		dc.b	2		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	1		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	4		;max distance to fire at player
		dc.b	1+0		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	1850		;bravery
		dc.w	13		;sample number
		dc.w	380		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	400		;physique
		dc.w	570		;weapon modifier
		dc.b	2		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	3		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	4		;max distance to fire at player
		dc.b	1+0		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	1500		;bravery
		dc.w	13		;sample number
		dc.w	380		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	1		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

********************************************************************************
;monster 02 : Sentry Gun
		dc.w	600		;physique
		dc.w	0		;weapon modifier
		dc.b	-1		;speed (0=vfast,1=fast,2=norm,3=slow,-1=dont move)
		dc.b	1		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	2		;max distance to fire at player
		dc.b	1+1		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	8		;sample number
		dc.w	95		;sample period
		dc.b	1		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

		dc.w	800		;physique
		dc.w	0		;weapon modifier
		dc.b	-1		;speed (0=vfast,1=fast,2=norm,3=slow,-1=dont move)
		dc.b	2		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	4		;max distance to fire at player
		dc.b	1+1		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	8		;sample number
		dc.w	95		;sample period
		dc.b	1		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

		dc.w	1000		;physique
		dc.w	0		;weapon modifier
		dc.b	-1		;speed (0=vfast,1=fast,2=norm,3=slow,-1=dont move)
		dc.b	3		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	6		;max distance to fire at player
		dc.b	1+1		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	8		;sample number
		dc.w	95		;sample period
		dc.b	1		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

		dc.w	1200		;physique
		dc.w	0		;weapon modifier
		dc.b	-1		;speed (0=vfast,1=fast,2=norm,3=slow,-1=dont move)
		dc.b	4		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	8		;max distance to fire at player
		dc.b	1+1		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	8		;sample number
		dc.w	95		;sample period
		dc.b	1		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

********************************************************************************
;monster 03 : Rahl
		dc.w	1400		;physique
		dc.w	1200		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+2		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	1000		;bravery
		dc.w	3		;sample number
		dc.w	257		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	1600		;physique
		dc.w	1550		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	1		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+2		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	1000		;bravery
		dc.w	3		;sample number
		dc.w	257		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	1800		;physique
		dc.w	1800		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	3		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+2		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	1000		;bravery
		dc.w	3		;sample number
		dc.w	257		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	2000		;physique
		dc.w	2250		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	3		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+2		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	1000		;bravery
		dc.w	3		;sample number
		dc.w	257		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	1		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

********************************************************************************
;monster 04 : Skeleton
		dc.w	50		;physique
		dc.w	60		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+3		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	40000		;bravery
		dc.w	14		;sample number
		dc.w	198		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	75		;physique
		dc.w	100		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+3		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	38000		;bravery
		dc.w	14		;sample number
		dc.w	198		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	125		;physique
		dc.w	140		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+3		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	36000		;bravery
		dc.w	14		;sample number
		dc.w	198		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	1		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

		dc.w	150		;physique
		dc.w	180		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+3		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	34000		;bravery
		dc.w	14		;sample number
		dc.w	198		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	1		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

********************************************************************************
;monster 05 : AHL-CIM
		dc.w	400		;physique
		dc.w	460		;weapon modifier
		dc.b	4		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+4		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	14		;sample number
		dc.w	198		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

		dc.w	600		;physique
		dc.w	660		;weapon modifier
		dc.b	4		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+4		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	14		;sample number
		dc.w	198		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

		dc.w	800		;physique
		dc.w	860		;weapon modifier
		dc.b	4		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+4		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	14		;sample number
		dc.w	198		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

		dc.w	1000		;physique
		dc.w	1060		;weapon modifier
		dc.b	4		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+4		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	14		;sample number
		dc.w	198		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	1		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

********************************************************************************
;monster 06 : Morg
		dc.w	800		;physique
		dc.w	700		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	2		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	8		;max distance to fire at player
		dc.b	1+5		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	5000		;bravery
		dc.w	15		;sample number
		dc.w	360		;sample period
		dc.b	1		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	1200		;physique
		dc.w	800		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	4		;fireball density (1-4, 0=none)
		dc.b	2		;poison strength (0=none)
		dc.b	8		;max distance to fire at player
		dc.b	1+5		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	5000		;bravery
		dc.w	15		;sample number
		dc.w	360		;sample period
		dc.b	1		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	1600		;physique
		dc.w	900		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	4		;fireball density (1-4, 0=none)
		dc.b	2		;poison strength (0=none)
		dc.b	8		;max distance to fire at player
		dc.b	1+5		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	5000		;bravery
		dc.w	15		;sample number
		dc.w	360		;sample period
		dc.b	1		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	2000		;physique
		dc.w	1000		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	4		;fireball density (1-4, 0=none)
		dc.b	2		;poison strength (0=none)
		dc.b	8		;max distance to fire at player
		dc.b	1+5		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	5000		;bravery
		dc.w	15		;sample number
		dc.w	360		;sample period
		dc.b	1		;fireball speed
		dc.b	0		;fireball decay (1=on,0=off)
		dc.b	1		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

********************************************************************************
;monster 07 : Druid
		dc.w	750		;physique
		dc.w	400		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	2		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+6		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	10000		;bravery
		dc.w	15		;sample number
		dc.w	360		;sample period
		dc.b	0		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	1000		;physique
		dc.w	500		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	2		;fireball density (1-4, 0=none)
		dc.b	4		;poison strength (0=none)
		dc.b	6		;max distance to fire at player
		dc.b	1+6		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	10000		;bravery
		dc.w	15		;sample number
		dc.w	360		;sample period
		dc.b	0		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	1250		;physique
		dc.w	600		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	2		;fireball density (1-4, 0=none)
		dc.b	4		;poison strength (0=none)
		dc.b	7		;max distance to fire at player
		dc.b	1+6		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	10000		;bravery
		dc.w	15		;sample number
		dc.w	360		;sample period
		dc.b	0		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	1500		;physique
		dc.w	700		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	2		;fireball density (1-4, 0=none)
		dc.b	4		;poison strength (0=none)
		dc.b	8		;max distance to fire at player
		dc.b	1+6		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	10000		;bravery
		dc.w	15		;sample number
		dc.w	360		;sample period
		dc.b	0		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	1		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

********************************************************************************
;monster 08 : Lemming
		dc.w	150		;physique
		dc.w	115		;weapon modifier
		dc.b	4		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+7		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	10		;sample number
		dc.w	128		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	200		;physique
		dc.w	165		;weapon modifier
		dc.b	4		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+7		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	10		;sample number
		dc.w	128		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	250		;physique
		dc.w	215		;weapon modifier
		dc.b	4		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+7		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	10		;sample number
		dc.w	128		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	300		;physique
		dc.w	265		;weapon modifier
		dc.b	4		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	1		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	4		;max distance to fire at player
		dc.b	1+7		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	10		;sample number
		dc.w	128		;sample period
		dc.b	3		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	1		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

********************************************************************************
;monster 09 : Hadrahl
		dc.w	150		;physique
		dc.w	225		;weapon modifier
		dc.b	2		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+8		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	5000		;bravery
		dc.w	14		;sample number
		dc.w	198		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	250		;physique
		dc.w	325		;weapon modifier
		dc.b	2		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+8		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	5000		;bravery
		dc.w	14		;sample number
		dc.w	198		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	350		;physique
		dc.w	425		;weapon modifier
		dc.b	2		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+8		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	5000		;bravery
		dc.w	14		;sample number
		dc.w	198		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	450		;physique
		dc.w	525		;weapon modifier
		dc.b	2		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+8		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	5000		;bravery
		dc.w	14		;sample number
		dc.w	198		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	1		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

********************************************************************************
;monster 10 : Bat
		dc.w	50		;physique
		dc.w	35		;weapon modifier
		dc.b	2		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+9		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	2		;sample number
		dc.w	124		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	75		;physique
		dc.w	65		;weapon modifier
		dc.b	2		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+9		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	2		;sample number
		dc.w	124		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	100		;physique
		dc.w	85		;weapon modifier
		dc.b	1		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+9		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	2		;sample number
		dc.w	124		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	150		;physique
		dc.w	135		;weapon modifier
		dc.b	1		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+9		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	2		;sample number
		dc.w	124		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

********************************************************************************
;monster 11 : Hoverbot
		dc.w	100		;physique
		dc.w	100		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	1		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	8		;max distance to fire at player
		dc.b	1+10		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	8		;sample number
		dc.w	95		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

		dc.w	150		;physique
		dc.w	150		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	2		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	8		;max distance to fire at player
		dc.b	1+10		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	8		;sample number
		dc.w	95		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

		dc.w	200		;physique
		dc.w	200		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	2		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	8		;max distance to fire at player
		dc.b	1+10		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	8		;sample number
		dc.w	95		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

		dc.w	250		;physique
		dc.w	250		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	2		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	8		;max distance to fire at player
		dc.b	1+10		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	8		;sample number
		dc.w	95		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	1		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

********************************************************************************
;monster 12 : Lizard
		dc.w	20		;physique
		dc.w	27		;weapon modifier
		dc.b	2		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	1		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+11		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	40000		;bravery
		dc.w	12		;sample number
		dc.w	160		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	40		;physique
		dc.w	47		;weapon modifier
		dc.b	2		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	1		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+11		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	40000		;bravery
		dc.w	12		;sample number
		dc.w	160		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	60		;physique
		dc.w	67		;weapon modifier
		dc.b	2		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	1		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+11		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	40000		;bravery
		dc.w	12		;sample number
		dc.w	160		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	80		;physique
		dc.w	87		;weapon modifier
		dc.b	2		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	1		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+11		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	40000		;bravery
		dc.w	12		;sample number
		dc.w	160		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

********************************************************************************
;monster 13 : Squirrel
		dc.w	400		;physique
		dc.w	450		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+12		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	13		;sample number
		dc.w	90		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	600		;physique
		dc.w	550		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+12		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	13		;sample number
		dc.w	90		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	800		;physique
		dc.w	650		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+12		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	13		;sample number
		dc.w	90		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	1		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

		dc.w	1000		;physique
		dc.w	750		;weapon modifier
		dc.b	0		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+12		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	13		;sample number
		dc.w	90		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	1		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

********************************************************************************
;monster 14 : Elyste
		dc.w	1500		;physique
		dc.w	450		;weapon modifier
		dc.b	2		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	2		;fireball density (1-4, 0=none)
		dc.b	2		;poison strength (0=none)
		dc.b	8		;max distance to fire at player
		dc.b	1+13		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	3000		;bravery
		dc.w	13		;sample number
		dc.w	180		;sample period
		dc.b	1		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	1800		;physique
		dc.w	550		;weapon modifier
		dc.b	2		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	3		;fireball density (1-4, 0=none)
		dc.b	3		;poison strength (0=none)
		dc.b	8		;max distance to fire at player
		dc.b	1+13		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	3000		;bravery
		dc.w	13		;sample number
		dc.w	180		;sample period
		dc.b	1		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	2100		;physique
		dc.w	650		;weapon modifier
		dc.b	2		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	4		;fireball density (1-4, 0=none)
		dc.b	4		;poison strength (0=none)
		dc.b	8		;max distance to fire at player
		dc.b	1+13		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	3000		;bravery
		dc.w	13		;sample number
		dc.w	180		;sample period
		dc.b	1		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	2400		;physique
		dc.w	750		;weapon modifier
		dc.b	2		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	4		;fireball density (1-4, 0=none)
		dc.b	4		;poison strength (0=none)
		dc.b	8		;max distance to fire at player
		dc.b	1+13		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	3000		;bravery
		dc.w	13		;sample number
		dc.w	180		;sample period
		dc.b	1		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	1		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

********************************************************************************
;monster 15 : ED-209
		dc.w	500		;physique
		dc.w	700		;weapon modifier
		dc.b	2		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+14		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	8		;sample number
		dc.w	180		;sample period
		dc.b	1		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

		dc.w	800		;physique
		dc.w	1050		;weapon modifier
		dc.b	2		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	1		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	5		;max distance to fire at player
		dc.b	1+14		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	8		;sample number
		dc.w	180		;sample period
		dc.b	1		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

		dc.w	1100		;physique
		dc.w	1400		;weapon modifier
		dc.b	2		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	1		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	5		;max distance to fire at player
		dc.b	1+14		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	8		;sample number
		dc.w	180		;sample period
		dc.b	0		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	1		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

		dc.w	1400		;physique
		dc.w	1750		;weapon modifier
		dc.b	2		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	1		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	5		;max distance to fire at player
		dc.b	1+14		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	8		;sample number
		dc.w	180		;sample period
		dc.b	0		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	1		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

********************************************************************************
;monster 16 : Puppy
		dc.w	15		;physique
		dc.w	15		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+15		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	1		;sample number
		dc.w	107		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	25		;physique
		dc.w	25		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+15		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	1		;sample number
		dc.w	107		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	35		;physique
		dc.w	35		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+15		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	1		;sample number
		dc.w	107		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	500		;physique
		dc.w	45		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+15		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	1		;sample number
		dc.w	107		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

********************************************************************************
;monster 17 : Shark
		dc.w	200		;physique
		dc.w	500		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+16		;monster number
		dc.b	0		;1=monster is two high
		dc.b	1		;1=monster will stay in water
		dc.w	1000		;bravery
		dc.w	0		;sample number
		dc.w	0		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	400		;physique
		dc.w	600		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+16		;monster number
		dc.b	0		;1=monster is two high
		dc.b	1		;1=monster will stay in water
		dc.w	1000		;bravery
		dc.w	0		;sample number
		dc.w	0		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	600		;physique
		dc.w	700		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+16		;monster number
		dc.b	0		;1=monster is two high
		dc.b	1		;1=monster will stay in water
		dc.w	1000		;bravery
		dc.w	0		;sample number
		dc.w	0		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	800		;physique
		dc.w	800		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+16		;monster number
		dc.b	0		;1=monster is two high
		dc.b	1		;1=monster will stay in water
		dc.w	1000		;bravery
		dc.w	0		;sample number
		dc.w	0		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

********************************************************************************
;monster 18 : Rats
		dc.w	100		;physique
		dc.w	180		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	2		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+17		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	2		;sample number
		dc.w	124		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

		dc.w	150		;physique
		dc.w	230		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	2		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+17		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	2		;sample number
		dc.w	124		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

		dc.w	200		;physique
		dc.w	280		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	2		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+17		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	2		;sample number
		dc.w	124		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

		dc.w	250		;physique
		dc.w	330		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	2		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+17		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	2		;sample number
		dc.w	124		;sample period
		dc.b	2		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

********************************************************************************
;monster 19 : Baby Gargoyle
		dc.w	500		;physique
		dc.w	360		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+18		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	10000		;bravery
		dc.w	1		;sample number
		dc.w	428		;sample period
		dc.b	1		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	700		;physique
		dc.w	430		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+18		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	10000		;bravery
		dc.w	1		;sample number
		dc.w	428		;sample period
		dc.b	1		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	900		;physique
		dc.w	480		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	0		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	0		;max distance to fire at player
		dc.b	1+18		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	10000		;bravery
		dc.w	1		;sample number
		dc.w	428		;sample period
		dc.b	1		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	1100		;physique
		dc.w	530		;weapon modifier
		dc.b	3		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	1		;fireball density (1-4, 0=none)
		dc.b	0		;poison strength (0=none)
		dc.b	5		;max distance to fire at player
		dc.b	1+18		;monster number
		dc.b	0		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	10000		;bravery
		dc.w	1		;sample number
		dc.w	428		;sample period
		dc.b	1		;fireball speed
		dc.b	0		;fireball decay (1=on,0=off)
		dc.b	1		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

********************************************************************************
;monster 20 : Gargoyle
		dc.w	8000		;physique
		dc.w	2000		;weapon modifier
		dc.b	5		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	3		;fireball density (1-4, 0=none)
		dc.b	1		;poison strength (0=none)
		dc.b	4		;max distance to fire at player
		dc.b	1+19		;monster number
		dc.b	1		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	3		;sample number
		dc.w	575		;sample period
		dc.b	1		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	10000		;physique
		dc.w	2500		;weapon modifier
		dc.b	5		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	3		;fireball density (1-4, 0=none)
		dc.b	2		;poison strength (0=none)
		dc.b	4		;max distance to fire at player
		dc.b	1+19		;monster number
		dc.b	1		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	3		;sample number
		dc.w	575		;sample period
		dc.b	1		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	12000		;physique
		dc.w	3000		;weapon modifier
		dc.b	5		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	3		;fireball density (1-4, 0=none)
		dc.b	3		;poison strength (0=none)
		dc.b	4		;max distance to fire at player
		dc.b	1+19		;monster number
		dc.b	1		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	3		;sample number
		dc.w	575		;sample period
		dc.b	1		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	0		;outline
		dc.b	1		;stun possible (1=yes, 0=no)

		dc.w	14000		;physique
		dc.w	3500		;weapon modifier
		dc.b	5		;speed (0=vfast,1=fast,2=norm,3=slow)
		dc.b	4		;fireball density (1-4, 0=none)
		dc.b	4		;poison strength (0=none)
		dc.b	4		;max distance to fire at player
		dc.b	1+19		;monster number
		dc.b	1		;1=monster is two high
		dc.b	0		;1=monster will stay in water
		dc.w	0		;bravery
		dc.w	3		;sample number
		dc.w	575		;sample period
		dc.b	1		;fireball speed
		dc.b	1		;fireball decay (1=on,0=off)
		dc.b	1		;outline
		dc.b	0		;stun possible (1=yes, 0=no)

		end
