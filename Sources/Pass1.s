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

		opt	o+,ow-

eor1		equ	%01110101
eor2		equ	%01011010
eor3		equ	%01001101
eor4		equ	%10110010

DEF_CODE	MACRO
code\@
.start		dc.b	.end-.start			;size
		dc.b	(\1>>8)&$ff			;star hi
		dc.b	\1&$ff				;star lo
		dc.b	\2				;column
		IFGE	NARG-3
		  dc.b	\3^eor1
		ENDC
		IFGE	NARG-4
		  dc.b	\4^eor2
		ENDC
		IFGE	NARG-5
		  dc.b	\5^eor3
		ENDC
		IFGE	NARG-6
		  dc.b	\6^eor4
		ENDC
		IFGE	NARG-7
		  dc.b	\7^eor1
		ENDC
		IFGE	NARG-8
		  dc.b	\8^eor2
		ENDC
		IFGE	NARG-9
		  dc.b	\9^eor3
		ENDC
		IFGE	NARG-10
		  dc.b	\a^eor4
		ENDC
		IFGE	NARG-11
		  dc.b	\b^eor1
		ENDC
		IFGE	NARG-12
		  dc.b	\c^eor2
		ENDC
		IFGE	NARG-13
		  dc.b	\d^eor3
		ENDC
		IFGE	NARG-14
		  dc.b	\e^eor4
		ENDC
		IFGE	NARG-15
		  dc.b	\f^eor1
		ENDC
		IFGE	NARG-16
		  dc.b	\g^eor2
		ENDC
		IFGE	NARG-17
		  dc.b	\h^eor3
		ENDC
		IFGE	NARG-18
		  dc.b	\i^eor4
		ENDC
		IFGE	NARG-19
		  dc.b	\j^eor1
		ENDC
		IFGE	NARG-20
		  dc.b	\k^eor2
		ENDC
		IFGE	NARG-21
		  dc.b	\l^eor3
		ENDC
		IFGE	NARG-22
		  dc.b	\m^eor4
		ENDC

		dc.b	0
.end
		ENDM

END_DEFS	MACRO
		dc.b	0
		ENDM

********************************************************************************

CLASS		equ	0
DISTANCE	equ	1
DECLINATION	equ	2
ASCENSION	equ	3
MASS		equ	4
PLANETS		equ	5

		dc.w		50		;num codes

		DEF_CODE	302,MASS,"1","5","4","1"
		DEF_CODE	769,ASCENSION,"1","8","5"
		DEF_CODE	81,DECLINATION,"1","3","2"
		DEF_CODE	365,MASS,"3","2","3","6"
		DEF_CODE	267,DISTANCE,"3","1","2","4"
		DEF_CODE	139,MASS,"3","5","9","9"
		DEF_CODE	3,DECLINATION,"2","2","2"
		DEF_CODE	328,DISTANCE,"3","6","0","1"
		DEF_CODE	193,ASCENSION,"1","6","6"
		DEF_CODE	715,DISTANCE,"1","3","2"
		DEF_CODE	600,PLANETS,"1","0"
		DEF_CODE	52,DECLINATION,"1","5","9"
		DEF_CODE	60,ASCENSION,"2","5","3"
		DEF_CODE	677,DECLINATION,"2","3","7"
		DEF_CODE	241,DECLINATION,"6","0"
		DEF_CODE	593,CLASS,"F","0"
		DEF_CODE	69,ASCENSION,"2","0","2"
		DEF_CODE	492,MASS,"4","0","7","9"
		DEF_CODE	12,PLANETS,"5"
		DEF_CODE	3,DISTANCE,"4","3","6","3"
		DEF_CODE	651,DECLINATION,"2","5","3"
		DEF_CODE	468,DECLINATION,"1","2","0"
		DEF_CODE	515,MASS,"2","0","6"
		DEF_CODE	369,CLASS,"F","2"
		DEF_CODE	245,DISTANCE,"5","7","8","2"
		DEF_CODE	666,DISTANCE,"4","2","5","0"
		DEF_CODE	111,ASCENSION,"3","5","8"
		DEF_CODE	124,DECLINATION,"1","9","1"
		DEF_CODE	347,ASCENSION,"1","7","7"
		DEF_CODE	689,DISTANCE,"3","0","1","9"
		DEF_CODE	234,CLASS,"R","3"
		DEF_CODE	191,MASS,"2","0","8","6"
		DEF_CODE	64,DISTANCE,"4","1","0","0"
		DEF_CODE	100,MASS,"5","8","4","7"
		DEF_CODE	42,MASS,"3","2","8","3"
		DEF_CODE	200,DECLINATION,"8","4"
		DEF_CODE	300,DISTANCE,"1","5","4","6"
		DEF_CODE	652,DECLINATION,"3","4","8"
		DEF_CODE	369,DISTANCE,"4","4","5","8"
		DEF_CODE	732,ASCENSION,"3","1","3"
		DEF_CODE	799,PLANETS,"1","1"
		DEF_CODE	353,DECLINATION,"1","6","4"
		DEF_CODE	268,DISTANCE,"5","8","7","9"
		DEF_CODE	743,ASCENSION,"1","5","3"
		DEF_CODE	611,DECLINATION,"3","1","6"
		DEF_CODE	472,CLASS,"M","3"
		DEF_CODE	388,ASCENSION,"3","2","6"
		DEF_CODE	291,MASS,"7","8","8","0"
		DEF_CODE	199,DISTANCE,"1","7","7","8"
		DEF_CODE	97,DISTANCE,"4","6","8","0"

		END_DEFS

********************************************************************************

		even
		end




