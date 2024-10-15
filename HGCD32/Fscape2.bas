REM *********************************************************************
REM ***     FRACTAL LANDSCAPE GENERATOR - (C) Scott Johnston 1990     ***
REM *********************************************************************

REM $OPTION k200
SCREEN 1,320,256,5,1
WINDOW 1,"",(0,0)-(320,256),32+128+256,1
WINDOW OUTPUT 1
DEFINT A-Z
RANDOMIZE 84
LOCATE 30,1
PRINT "FRACTAL LANDSCAPE GENERATOR"
PRINT "(C) Scott Johnston 1990"

REM *********************************************************************

RUGGEDNESS=32
VARIANCE=100
RANGE=250
LAND=125
VSIZE=256
HSIZE=256
SUN_ANGLE=1
DIM HEIGHTS(256,256)

REM *********************************************************************

GOSUB READ_PALETTE
GOSUB FIND_HEIGHTS
GOSUB READ_PALETTE
GOSUB DO_SHADOWS

LOCATE 29,1
INPUT "SAVE AS IFF ? (Y/N) ",ANSWER$
IF ANSWER$="Y" OR ANSWER$="y" THEN GOSUB SAVEILBM

DO
LOOP UNTIL INKEY$<>""
SYSTEM

REM *********************************************************************

FIND_HEIGHTS:
FOR Y=0 TO VSIZE STEP RUGGEDNESS
	FOR X=0 TO HSIZE STEP RUGGEDNESS
		HEIGHT=LAND-RANGE+INT(RND(1)*RANGE*2)
		IF HEIGHT<0 THEN
			HEIGHT=0
		ELSE
			IF HEIGHT>255 THEN HEIGHT=255
		END IF
		HEIGHTS(X,Y)=HEIGHT
		PSET(X,Y),3+HEIGHT/9
	NEXT X
NEXT Y
SKIP=RUGGEDNESS/2
DO
	FOR Y=SKIP TO VSIZE-SKIP STEP SKIP*2
		FOR X=SKIP TO HSIZE-SKIP STEP SKIP*2
			NEAST=HEIGHTS(X+SKIP,Y-SKIP)
			SEAST=HEIGHTS(X+SKIP,Y+SKIP)
			NWEST=HEIGHTS(X-SKIP,Y-SKIP)
			SWEST=HEIGHTS(X-SKIP,Y+SKIP)
			NORTH=(NEAST+NWEST)/2
			EAST=(NEAST+SEAST)/2
			WEST=(SWEST+NWEST)/2
			SOUTH=(SWEST+SEAST)/2
			MIDDLE=HEIGHTS(X,Y)
			IF X=SKIP THEN
				HEIGHT=WEST
				GOSUB FIND_HEIGHT_CHANGE
				WEST=WEST+CHANGE
				HEIGHTS(X-SKIP,Y)=WEST
				PSET(X-SKIP,Y),3+WEST/9
			END IF
			IF Y=SKIP THEN
				HEIGHT=NORTH
				GOSUB FIND_HEIGHT_CHANGE
				NORTH=NORTH+CHANGE
				HEIGHTS(X,Y-SKIP)=NORTH
				PSET(X,Y-SKIP),3+NORTH/9
			END IF
			HEIGHT=EAST
			GOSUB FIND_HEIGHT_CHANGE
			EAST=EAST+CHANGE
			HEIGHTS(X+SKIP,Y)=EAST
			PSET(X+SKIP,Y),3+EAST/9
			HEIGHT=SOUTH
			GOSUB FIND_HEIGHT_CHANGE
			SOUTH=SOUTH+CHANGE
			HEIGHTS(X,Y+SKIP)=SOUTH
			PSET(X,Y+SKIP),3+SOUTH/9
			MIDDLE=(NEAST+SEAST+NWEST+SWEST+EAST+WEST+NORTH+SOUTH)/8
			HEIGHT=MIDDLE
			GOSUB FIND_HEIGHT_CHANGE
			MIDDLE=MIDDLE+CHANGE
			HEIGHTS(X,Y)=MIDDLE
			PSET(X,Y),3+MIDDLE/9
		NEXT X
	NEXT Y
	WHAT_WAS_SKIP=SKIP
	SKIP=SKIP/2
	IF VARIANCE>1 THEN VARIANCE=VARIANCE/2
LOOP UNTIL WHAT_WAS_SKIP<=1
RETURN

REM *********************************************************************

DO_SHADOWS:
FOR Y=0 TO VSIZE
	HIGHEST=0
	SUN_COUNT=0
	FOR X=0 TO HSIZE
		LAST_HEIGHT=HEIGHT
		HEIGHT=HEIGHTS(X,Y)
		TYPE=0
		IF HEIGHT>=0 AND HEIGHT<=50 THEN TYPE=1
		IF HEIGHT>=51 AND HEIGHT<=150 THEN TYPE=2
		IF HEIGHT>=231 AND HEIGHT<=255 THEN TYPE=3
		IF X=0 THEN LAST_HEIGHT=HEIGHT+1
		ANGLE=(HEIGHT-LAST_HEIGHT)/6
		IF TYPE=2 AND ABS(ANGLE)>10 THEN TYPE=0
		IF TYPE=3	AND ABS(ANGLE)>10 THEN TYPE=0
		IF TYPE=0 AND ABS(ANGLE)<=2 AND HEIGHT<200 THEN TYPE=2
		IF HEIGHT>HIGHEST THEN
			SHADOW=0
			IF TYPE<>1 THEN HIGHEST=HEIGHT
		ELSE
			SHADOW=(HIGHEST-HEIGHT)
			IF TYPE=1 THEN SHADOW=(HIGHEST-50)
		END IF
		SHADOW=SHADOW/256
		IF TYPE=0 THEN
			COLOUR=INT(18+ANGLE-SHADOW)
			IF HEIGHT<=170 THEN COLOUR=COLOUR-1
			IF COLOUR<9 THEN COLOUR=9
			IF COLOUR>23 THEN COLOUR=23
		END IF
		IF TYPE=1 THEN
			COLOUR=INT((HEIGHT/9)+3-SHADOW)
			IF COLOUR<3 THEN COLOUR=3
			IF COLOUR>8 THEN COLOUR=8
		END IF
		IF TYPE=2 THEN
			COLOUR=INT(29+ANGLE-SHADOW)
			IF COLOUR<27 THEN COLOUR=27
			IF COLOUR>31 THEN COLOUR=31
		END IF
		IF TYPE=3 THEN
			COLOUR=INT(25+ANGLE-SHADOW)
			IF COLOUR<24 THEN COLOUR=24
			IF COLOUR>26 THEN COLOUR=26
		END IF
		INCR SUN_COUNT
		IF SUN_COUNT=SUN_ANGLE THEN
			HIGHEST=HIGHEST-5
			SUN_COUNT=0
		END IF
		PSET (X,Y),COLOUR
	NEXT X
NEXT Y
RETURN

REM *********************************************************************

READ_PALETTE:
FOR A=0 TO 31
	READ RED!,GREEN!,BLUE!
	RED!=RED!*0.066
	GREEN!=GREEN!*0.066
	BLUE!=BLUE!*0.066
	PALETTE A,RED!,GREEN!,BLUE!
NEXT A

REM *********************************************************************

FIND_HEIGHT_CHANGE:
CHANGE=-VARIANCE+RND(1)*(VARIANCE*2)
IF HEIGHT+CHANGE>255 THEN CHANGE=-CHANGE/2
IF HEIGHT+CHANGE<0 THEN CHANGE=-CHANGE/2
RETURN

REM *********************************************************************

DATA 0,0,0
DATA 15,15,15
DATA 15,15,15
DATA 0,0,5
DATA 0,0,6
DATA 1,1,7
DATA 2,2,8
DATA 3,3,9
DATA 4,4,10
DATA 0,0,0
DATA 0,1,0
DATA 0,2,0
DATA 0,3,0
DATA 0,4,0
DATA 1,5,0
DATA 2,6,0
DATA 3,7,0
DATA 4,8,1
DATA 5,9,2
DATA 6,9,3
DATA 7,10,4
DATA 8,10,5
DATA 9,13,6
DATA 10,14,7
DATA 11,15,8
DATA 12,15,9
DATA 13,15,10
DATA 14,15,11
DATA 15,15,12
DATA 15,15,13
DATA 15,15,14
DATA 15,15,15

REM *********************************************************************

DATA 0,0,0
DATA 15,15,15
DATA 15,15,15
DATA 0,0,5
DATA 0,0,6
DATA 1,1,7
DATA 2,2,8
DATA 3,3,9
DATA 4,4,10
DATA 0,0,0
DATA 0,0,1
DATA 0,0,3
DATA 0,0,4
DATA 1,0,3
DATA 2,0,2
DATA 3,0,1
DATA 4,1,0
DATA 6,2,0
DATA 8,4,0
DATA 10,6,0
DATA 11,8,0
DATA 12,10,0
DATA 13,12,0
DATA 14,13,0
DATA 4,2,1
DATA 7,6,5
DATA 11,10,9
DATA 0,1,1
DATA 0,3,0
DATA 1,4,0
DATA 2,5,0
DATA 3,6,0

REM *********************************************************************

saveilbm:
LOCATE 29,1
PRINT "                            "
LOCATE 29,1
INPUT "FILENAME : ",ILBMNAME$
LOCATE 29,1
PRINT "SAVING...                   "
LIBRARY "dos.library"
LIBRARY "exec.library"
LIBRARY "graphics.library"
DECLARE FUNCTION xOpen&  LIBRARY
DECLARE FUNCTION xRead&  LIBRARY
DECLARE FUNCTION xWrite& LIBRARY
REM - xClose returns no value

REM - Functions from exec.library
DECLARE FUNCTION AllocMem&() LIBRARY
REM - FreeMem returns no value
COLOR 1,0
FILENAME$=ilbmname$

fHandle& = 0
mybuf& = 0
cColors%=16
ccrtDir%   = 1
ccrtStart% = 1
ccrtEnd%   = nColors% - 1
ccrtSecs&  = 0
ccrtMics&  = 2000

FILENAME$ = FILENAME$ + CHR$(0)
fHandle& = xOpen&(SADD(FILENAME$),1006)
IF fHandle& = 0 THEN
   saveError$ = "Can't open output file"
   GOTO Scleanup
END IF

REM - Alloc ram for work buffers
ClearPublic& = 65537&
mybufsize& = 120
mybuf& = AllocMem&(mybufsize&,ClearPublic&)
IF mybuf& = 0 THEN
   saveError$ = "Can't alloc buffer"
   GOTO Scleanup
END IF

cbuf& = mybuf&

REM - Get addresses of screen structures
GOSUB GetScrAddrs

zero& = 0
pad%  = 0
aspect% = &HA0B

REM - Compute chunk sizes
BMHDsize& = 20
CMAPsize& = (2^scrDepth%) * 3
CAMGsize& = 4
CCRTsize& = 14
BODYsize& = (scrWidth%/8) * scrHeight% * scrDepth%
REM - FORMsize& = Chunk sizes + 8 bytes per Chunk header + "ILBM"
FORMsize& = BMHDsize&+CMAPsize&+CAMGsize&+CCRTsize&+BODYsize&+44

REM - Write FORM header
tt$ = "FORM"
wLen& = xWrite&(fHandle&,SADD(tt$),4)
wLen& = xWrite&(fHandle&,VARPTR(FORMsize&),4)
tt$ = "ILBM"
wLen& = xWrite&(fHandle&,SADD(tt$),4)

IF wLen& <= 0 THEN
   saveError$ = "Error writing FORM header"
   GOTO Scleanup
END IF

REM - Write out BMHD chunk
tt$ = "BMHD"
wLen& = xWrite&(fHandle&,SADD(tt$),4)
wLen& = xWrite&(fHandle&,VARPTR(BMHDsize&),4)
wLen& = xWrite&(fHandle&,VARPTR(scrWidth%),2)
wLen& = xWrite&(fHandle&,VARPTR(scrHeight%),2)
wLen& = xWrite&(fHandle&,VARPTR(zero&),4)
temp% = (256 * scrDepth%)
wLen& = xWrite&(fHandle&,VARPTR(temp%),2)
wLen& = xWrite&(fHandle&,VARPTR(zero&),4)
wLen& = xWrite&(fHandle&,VARPTR(aspect%),2)
wLen& = xWrite&(fHandle&,VARPTR(scrWidth%),2)
wLen& = xWrite&(fHandle&,VARPTR(scrHeight%),2)

IF wLen& <= 0 THEN
   saveError$ = "Error writing BMHD"
   GOTO Scleanup
END IF

REM - Write CMAP chunk
tt$ = "CMAP"
wLen& = xWrite&(fHandle&,SADD(tt$),4)
wLen& = xWrite&(fHandle&,VARPTR(CMAPsize&),4)

REM - Build IFF ColorMap
FOR kk = 0 TO nColors% - 1
   regTemp% = PEEKW(colorTab& + (2*kk))
   POKE(cbuf&+(kk*3)),(regTemp% AND &HF00) / 16
   POKE(cbuf&+(kk*3)+1),(regTemp% AND &HF0)
   POKE(cbuf&+(kk*3)+2),(regTemp% AND &HF) * 16
NEXT

wLen& = xWrite&(fHandle&,cbuf&,CMAPsize&)

IF wLen& <= 0 THEN
   saveError$ = "Error writing CMAP"
   GOTO Scleanup
END IF

REM - Write CAMG chunk
tt$ = "CAMG"
wLen& = xWrite&(fHandle&,SADD(tt$),4)
wLen& = xWrite&(fHandle&,VARPTR(CAMGsize&),4)
vpModes& = PEEKW(sViewPort& + 32)
wLen& = xWrite&(fHandle&,VARPTR(vpModes&),4)

IF wLen& <= 0 THEN
   saveError$ = "Error writing CAMG"
   GOTO Scleanup
END IF


REM - Write CCRT chunk
tt$ = "CCRT"
wLen& = xWrite&(fHandle&,SADD(tt$),4)
wLen& = xWrite&(fHandle&,VARPTR(CCRTsize&),4)
wLen& = xWrite&(fHandle&,VARPTR(ccrtDir%),2)
temp% = (256*ccrtStart%) + ccrtEnd%
wLen& = xWrite&(fHandle&,VARPTR(temp%),2)
wLen& = xWrite&(fHandle&,VARPTR(ccrtSecs&),4)
wLen& = xWrite&(fHandle&,VARPTR(ccrtMics&),4)
wLen& = xWrite&(fHandle&,VARPTR(pad%),2)

IF wLen& <= 0 THEN
   saveError$ = "Error writing CCRT"
   GOTO Scleanup
END IF


REM - Write BODY chunk
tt$ = "BODY"
wLen& = xWrite&(fHandle&,SADD(tt$),4)
wLen& = xWrite&(fHandle&,VARPTR(BODYsize&),4)

scrRowBytes% = scrWidth% / 8
FOR rr = 0 TO scrHeight% -1
   FOR pp = 0 TO scrDepth% -1
      scrRow& = bPlane&(pp)+(rr*scrRowBytes%)
      wLen& = xWrite&(fHandle&,scrRow&,scrRowBytes%)
      IF wLen& <= 0 THEN
         saveError$ = "Error writing BODY"
         GOTO Scleanup
      END IF
   NEXT
NEXT


saveError$ = ""

Scleanup:
IF fHandle& <> 0 THEN CALL xClose&(fHandle&)
IF mybuf& <> 0 THEN CALL FreeMem&(mybuf&,mybufsize&)
RETURN



GetScrAddrs:
REM - Get addresses of screen structures
   sWindow&   = WINDOW(7)
   sScreen&   = PEEKL(sWindow& + 46)
   sViewPort& = sScreen& + 44
   sRastPort& = sScreen& + 84
   sColorMap& = PEEKL(sViewPort& + 4)
   colorTab&  = PEEKL(sColorMap& + 4)
   sBitMap&   = PEEKL(sRastPort& + 4)

   REM - Get screen parameters
   scrWidth%  = PEEKW(sScreen& + 12)
   scrHeight% = PEEKW(sScreen& + 14)
   scrDepth%  = PEEK(sBitMap& + 5)
   nColors%   = 2^scrDepth%

   REM - Get addresses of Bit Planes
   FOR kk = 0 TO scrDepth% - 1
      bPlane&(kk) = PEEKL(sBitMap&+8+(kk*4))
   NEXT
RETURN


