REM *********************************************************************
REM ***     FRACTAL LANDSCAPE GENERATOR - (C) Scott Johnston 1990     ***
REM *********************************************************************

REM $OPTION k1500
SCREEN 1,640,512,4,4
WINDOW 1,"",(0,0)-(640,512),32+128+256,1
WINDOW OUTPUT 1
RANDOMIZE 84
LOCATE 30,1
rem PRINT "FRACTAL LANDSCAPE GENERATOR"
rem PRINT "(C) Scott Johnston 1990"

REM *********************************************************************

RUGGEDNESS=32
VARIANCE=100
RANGE=250
LAND=125
HSIZE=640
VSIZE=512
SUN_ANGLE=1
DIM HEIGHTS(HSIZE,VSIZE)

REM *********************************************************************

GOSUB READ_PALETTE
GOSUB FIND_HEIGHTS
rem GOSUB READ_PALETTE
GOSUB DO_SHADOWS

rem LOCATE 29,1
rem INPUT "SAVE AS IFF ? (Y/N) ",ANSWER$
rem IF ANSWER$="Y" OR ANSWER$="y" THEN GOSUB SAVEILBM
GOSUB SAVEILBM

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
		col=HEIGHT/17
		PSET(X,Y),col
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
				col=WEST/17
				PSET(X-SKIP,Y),col
			END IF
			IF Y=SKIP THEN
				HEIGHT=NORTH
				GOSUB FIND_HEIGHT_CHANGE
				NORTH=NORTH+CHANGE
				HEIGHTS(X,Y-SKIP)=NORTH
				col=NORTH/17
				PSET(X,Y-SKIP),col
			END IF
			HEIGHT=EAST
			GOSUB FIND_HEIGHT_CHANGE
			EAST=EAST+CHANGE
			HEIGHTS(X+SKIP,Y)=EAST
			col=EAST/17
			PSET(X+SKIP,Y),col
			HEIGHT=SOUTH
			GOSUB FIND_HEIGHT_CHANGE
			SOUTH=SOUTH+CHANGE
			HEIGHTS(X,Y+SKIP)=SOUTH
			col=SOUTH/17
			PSET(X,Y+SKIP),col
			MIDDLE=(NEAST+SEAST+NWEST+SWEST+EAST+WEST+NORTH+SOUTH)/8
			HEIGHT=MIDDLE
			GOSUB FIND_HEIGHT_CHANGE
			MIDDLE=MIDDLE+CHANGE
			HEIGHTS(X,Y)=MIDDLE
			col=MIDDLE/17
			PSET(X,Y),col
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
		IF X=0 THEN LAST_HEIGHT=HEIGHT+1
		ANGLE=HEIGHT-LAST_HEIGHT

		IF HEIGHT>HIGHEST THEN
			SHADOW=0
			HIGHEST=HEIGHT
		ELSE
			SHADOW=HIGHEST-HEIGHT
		END IF
		COLOUR=INT((ANGLE/3)-(SHADOW/10))
		IF COLOUR<0 THEN COLOUR=0
		IF COLOUR>15 THEN COLOUR=15

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
DATA 1,1,1
DATA 2,2,2
DATA 3,3,3

DATA 4,4,4
DATA 5,5,5
DATA 6,6,6
DATA 7,7,7

DATA 8,8,8
DATA 9,9,9
DATA 10,10,10
DATA 11,11,11

DATA 12,12,12
DATA 13,13,13
DATA 14,14,14
DATA 15,15,15

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

saveilbm:
rem LOCATE 29,1
rem PRINT "                            "
rem LOCATE 29,1
rem INPUT "FILENAME : ",ILBMNAME$
ILBMNAME$="work:newland2"
rem LOCATE 29,1
rem PRINT "SAVING...                   "
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


