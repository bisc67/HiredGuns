REM *********************************************************************
REM ***    FRACTAL LANDSCAPE GENERATOR - (C) Scott Johnston 1990-92   ***
REM *********************************************************************

LIBRARY "exec.library"
LIBRARY "graphics.library"
LIBRARY "arp.library"
DECLARE FUNCTION FileRequest&(buffer&) LIBRARY
DECLARE FUNCTION BaseName&(pathptr&) LIBRARY
DECLARE SUB TackOn(path&,file&) LIBRARY
DECLARE FUNCTION xOpen&  LIBRARY
DECLARE FUNCTION xRead&  LIBRARY
DECLARE FUNCTION xWrite& LIBRARY
DECLARE FUNCTION AllocMem&() LIBRARY
DECLARE FUNCTION GetFile%(fname$,message$,VAL scrnum%)

rem $OPTION k3500,Y+
DEFLNG a-z,A-Z

file$="ram:test"
hsize=128
vsize=128
ruggedness=32
variance=2^14
sun_angle=1
DIM SHARED heights(hsize,vsize),cols(hsize,vsize)
RANDOMIZE 84

REM *********************************************************************

open_screen hsize,vsize,32
LINE (0,0)-(hsize,vsize),1,b

MENU 1,0,1,"Proj"
MENU 1,1,1,"Clear"
MENU 1,2,1,"Save as..."
MENU 1,3,1,"Quit      "

MENU 2,0,1,"Gen"
MENU 2,1,1,"Start"
MENU 2,2,1,"Abort"

MENU 3,0,1,"Shad"
MENU 3,1,1,"Start"
MENU 3,2,1,"Abort"

MENU 4,0,1,"Size"
MENU 4,1,1,"  640x512"
MENU 4,2,1,"  320x256"
MENU 4,3,1,"  256x256"
MENU 4,4,1,"  192x192"
MENU 4,5,2,"  128x128"
MENU 4,6,1,"  64x64  "

MENU 5,0,1,"Rugd"
MENU 5,1,1,"  128x128"
MENU 5,2,2,"  64x64"
MENU 5,3,1,"  32x32"
MENU 5,4,1,"  16x16"
MENU 5,5,1,"  8x8  "

MENU 6,0,1,"Type"
MENU 6,1,1,"  Alps"
MENU 6,2,2,"  Mounts"
MENU 6,3,1,"  Hills"
MENU 6,4,1,"  Plain"

REM *********************************************************************

MENU ON
ON MENU GOTO menu_handler

RESTORE generate_palette
read_palette

command=0:abort_gen=0:abort_sh=0
DO
	command=0:abort_gen=0:abort_sh=0
	SLEEP
	SELECT CASE command
		CASE 1:
			GOSUB generate
		CASE 2:
			GOSUB shadows
	END SELECT
LOOP

menu_handler:
	menu_type=MENU(0)
	menu_item=MENU(1)

	SELECT CASE menu_type
		CASE 1:
			SELECT CASE menu_item
				CASE 1:
					CLS
				CASE 2:
					IF GetFile%(file$,"Save ILBM as...",0)<>0 THEN GOSUB saveilbm
				CASE 3:
					SYSTEM
			END SELECT
		CASE 2:
			SELECT CASE menu_item
				CASE 1:
					RESTORE generate_palette
					read_palette
					command=1
				CASE 2:
					abort_gen=1
			END SELECT
		CASE 3:
			SELECT CASE menu_item
				CASE 1:
					RESTORE new_shadow_palette
					read_palette
					command=2
				CASE 2:
					abort_sh=1
			END SELECT
		CASE 4:
			MENU 4,1,1
			MENU 4,2,1
			MENU 4,3,1
			MENU 4,4,1
			MENU 4,5,1
			MENU 4,6,1
			SELECT CASE menu_item
				CASE 1:
					MENU 4,1,2
					SCREEN CLOSE 1
					hsize=640:vsize=512
					open_screen hsize,vsize,32
				CASE 2:
					MENU 4,2,2
					SCREEN CLOSE 1
					hsize=320:vsize=256
					open_screen hsize,vsize,32
				CASE 3:
					MENU 4,3,2
					SCREEN CLOSE 1
					hsize=256:vsize=256
					open_screen hsize,vsize,32
				CASE 4:
					MENU 4,4,2
					SCREEN CLOSE 1
					hsize=192:vsize=192
					open_screen hsize,vsize,32
				CASE 5:
					MENU 4,5,2
					SCREEN CLOSE 1
					hsize=128:vsize=128
					open_screen hsize,vsize,32
				CASE 6:
					MENU 4,6,2
					SCREEN CLOSE 1
					hsize=64:vsize=64
					open_screen hsize,vsize,32
			END SELECT
			REDIM heights(hsize,vsize)
			REDIM cols(hsize,vsize)
			LINE (0,0)-(hsize,vsize),1,b
			RESTORE generate_palette
			read_palette
		CASE 5:
			MENU 5,1,1
			MENU 5,2,1
			MENU 5,3,1
			MENU 5,4,1
			SELECT CASE menu_item
				CASE 1:
					MENU 5,1,2
					ruggedness=128
				CASE 2:
					MENU 5,2,2
					ruggedness=64
				CASE 3:
					MENU 5,3,2
					ruggedness=32
				CASE 4:
					MENU 5,4,2
					ruggedness=16
				CASE 5:
					MENU 5,5,2
					ruggedness=8
			END SELECT
		CASE 6:
			MENU 6,1,1
			MENU 6,2,1
			MENU 6,3,1
			MENU 6,4,1
			SELECT CASE menu_item
				CASE 1:
					MENU 6,1,2
					variance=110000
				CASE 2:
					MENU 6,2,2
					variance=80000
				CASE 3:
					MENU 6,3,2
					variance=50000
				CASE 4:
					MENU 6,4,2
					variance=20000
			END SELECT
	END SELECT
RETURN

REM *********************************************************************

generate:
	skip=ruggedness
	FOR y=0 TO vsize STEP ruggedness
		FOR x=0 TO hsize STEP ruggedness
			change 0,variance,x,y,skip
		NEXT x
	NEXT y
	variance=variance/2
	skip=ruggedness/2
	DO
		FOR y=skip TO vsize-skip STEP skip*2
			FOR x=skip TO hsize-skip STEP skip*2
				ne=heights(x+skip,y-skip)
				se=heights(x+skip,y+skip)
				nw=heights(x-skip,y-skip)
				sw=heights(x-skip,y+skip)
				n=(ne+nw)/2
				e=(ne+se)/2
				w=(sw+nw)/2
				s=(sw+se)/2
				IF x=skip THEN change w,variance,x-skip,y,skip
				IF y=skip THEN change n,variance,x,y-skip,skip
				change e,variance,x+skip,y,skip
				change s,variance,x,y+skip,skip
				m=(ne+se+nw+sw+n+e+w+s)/8
				change m,variance,x,y,skip
			NEXT x
			LINE (hsize,y-skip*2)-STEP(ruggedness,ruggedness),0,bf
			IF abort_gen=1 THEN GOTO abort_generate
		NEXT y
		LINE (0,vsize)-STEP(hsize,ruggedness),0,bf
		last_skip=skip
		skip=skip/2
		variance=variance/2
	LOOP UNTIL last_skip<=1
abort_generate:
RETURN

REM *********************************************************************

shadows:
	FOR y=1 TO vsize
		last_cloud_height=0
		last_height=heights(0,y)
		IF last_height<-5000 THEN
			last_height=(last_height+5000)/6-5000
			IF last_height<-5800 THEN last_height=-5800
		ELSE
			last_height=((last_height+5000)^2)/80000-5000
		END IF
		highest=last_height

		FOR x=0 TO hsize
			last_height=height
			last_cloud_height=cloud_height
			height=heights(x,y)/5+2000
			IF height<0 THEN height=0
			IF height>5000 THEN
				height=((height-5000)^2)/4000+2500
rem				height=((height-5000)*2)+2500
			ELSE
				height=height/2
			END IF
			heights(x,y)=height
			angle=height-last_height

			IF height>highest THEN highest=height

			IF height=0 THEN
				colour=31-(highest-height)/500
				IF colour<29 THEN colour=29
				IF colour>31 THEN colour=31
			ELSE
				IF ABS(angle)<350 AND height<20000 THEN
					colour=4+angle/70-(highest-height)/1400
					IF colour<0 THEN colour=0
					IF colour>13 THEN colour=13
				ELSE
					colour=19+angle/150-(highest-height)/1400
					IF colour<14 THEN colour=14
					IF colour>28 THEN colour=28
				END IF
			END IF
			cols(x,y)=colour

			old_height=y-1-heights(x,y-1)/700
			new_height=y-height/700
			IF new_height>old_height THEN
				old_colour=cols(x,y-1)
				IF colour<=13 THEN IF old_colour>13 THEN old_colour=colour
				IF colour>=14 AND colour<=28 THEN IF old_colour<14 OR old_colour>28 THEN old_colour=colour
				IF colour>=29 THEN IF old_colour<29 THEN old_colour=colour
				FOR i=new_height TO old_height STEP -1
					new_colour=(colour+((old_colour-colour)/(old_height-new_height))*(i-new_height))
					PSET (x-1,i-1),new_colour
				NEXT i
			END IF
			highest=highest-200
		NEXT x
		IF abort_sh=1 THEN GOTO abort_shadow
	NEXT y
abort_shadow:
RETURN

REM *********************************************************************

saveilbm:
	filename$=file$
	fHandle&=0
	mybuf&=0
	cColors%=16
	ccrtDir%=1
	ccrtStart%=1
	ccrtEnd%=cColors%-1
	ccrtSecs&=0
	ccrtMics&=2000

	filename$=filename$+CHR$(0)
	fHandle&=xOpen&(SADD(filename$),1006)
	IF fHandle&=0 THEN
	   saveilbm$="Can't open output file"
	   GOTO Scleanup
	END IF
	
	REM - Alloc ram for work buffers
	ClearPublic&=65537&
	mybufsize&=120
	mybuf&=AllocMem&(mybufsize&,ClearPublic&)
	IF mybuf&=0 THEN
		saveilbm$="Can't alloc buffer"
		GOTO Scleanup
	END IF

	cbuf&=mybuf&

	REM - Get addresses of screen structures
	GOSUB GetScrAddrs

	zero&=0
	pad%=0
	aspect%=&HA0B

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
		saveilbm$ = "Error writing FORM header"
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
		saveilbm$ = "Error writing BMHD"
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
		saveilbm$ = "Error writing CMAP"
		GOTO Scleanup
	END IF   

	REM - Write CAMG chunk
	tt$ = "CAMG"
	wLen& = xWrite&(fHandle&,SADD(tt$),4)
	wLen& = xWrite&(fHandle&,VARPTR(CAMGsize&),4)
	vpModes& = PEEKW(sViewPort& + 32)
	wLen& = xWrite&(fHandle&,VARPTR(vpModes&),4)
	
	IF wLen& <= 0 THEN
		saveilbm$ = "Error writing CAMG"
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
		saveilbm$ = "Error writing CCRT"
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
				saveilbm$ = "Error writing BODY"
				GOTO Scleanup
			END IF   
		NEXT
	NEXT

	saveilbm$= ""

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
	scrDepth%  = 5
	nColors%   = 2^scrDepth%

	REM - Get addresses of Bit Planes 
	FOR kk = 0 TO scrDepth% - 1
		bPlane&(kk) = PEEKL(sBitMap&+8+(kk*4))
	NEXT
	RETURN

REM *********************************************************************

SUB change(VAL height,VAL variance,VAL x,VAL y,VAL skip)
	height=height-variance+RND(1)*variance*2
	heights(x,y)=height
	LINE (x,y)-STEP(skip-1,skip-1),2+7+height/(2^16/8),bf
END SUB

REM *********************************************************************

SUB read_palette
	FOR colr%=0 TO 31
		READ red,green,blue
		PALETTE colr%,red*0.066,green*0.066,blue*0.066
	NEXT colr%
END SUB

REM *********************************************************************

SUB open_screen(VAL scr_width,VAL scr_height,VAL scr_depth)
	IF scr_width<320 THEN scr_width=320
	IF scr_height<256 THEN scr_height=256
	mode=1
rem	IF scr_width>320 THEN mode=mode+1
rem	IF scr_height>256 THEN mode=mode+2
	SELECT CASE scr_depth
		CASE 2:
			SCREEN 1,scr_width,scr_height,1,mode
		CASE 4:
			SCREEN 1,scr_width,scr_height,2,mode
		CASE 8:
			SCREEN 1,scr_width,scr_height,3,mode
		CASE 16:
			SCREEN 1,scr_width,scr_height,4,mode
		CASE 32:
			SCREEN 1,scr_width,scr_height,5,mode
	END SELECT
	WINDOW 1,"",(0,0)-(scr_width,scr_height),16+32+128+256,1
END SUB

REM *********************************************************************

generate_palette:

DATA 0,0,0
DATA 12,12,12
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
DATA 15,0,0
DATA 0,0,0
DATA 15,15,15

  DATA 0,0,0
DATA 0,0,0
DATA 0,0,0
DATA 0,0,0

DATA 0,0,0
DATA 0,0,0
DATA 0,0,0
DATA 0,0,0

DATA 0,0,0
DATA 0,0,0
DATA 15,15,15
DATA 0,0,0

REM *********************************************************************

shadow_palette:

DATA 0,0,0

rem veg 1-8
DATA 0,1,0
DATA 0,2,0
DATA 0,3,1
DATA 1,5,1
DATA 2,6,2
DATA 3,8,2
DATA 4,9,3
DATA 5,10,3

rem rock 9-16
DATA 1,1,1
DATA 3,2,2
DATA 5,4,4
DATA 7,6,6
DATA 9,7,7
DATA 11,9,9
DATA 13,11,11
DATA 15,13,13

rem water 17-21
DATA 0,1,1
DATA 1,2,2
DATA 2,3,4
DATA 3,5,6
DATA 4,6,8

rem cloud 22-27
rem cloud over veg 22-24
DATA 2,4,2
DATA 4,8,4
DATA 6,11,5

rem cloud over rock 25-27
DATA 5,4,4
DATA 11,9,9
DATA 15,13,13

rem cloud over water 28-29
DATA 3,5,5
DATA 5,7,8

rem misc 30-31
DATA 15,15,15
DATA 8,8,8

REM *********************************************************************

new_shadow_palette:

rem veg 0-13
DATA 0,0,0
DATA 0,1,0
DATA 1,3,0
DATA 2,4,1
DATA 3,6,1
DATA 3,7,1
DATA 4,9,1
DATA 5,10,2
DATA 6,11,2
DATA 7,12,3
DATA 8,13,3
DATA 9,14,4
DATA 10,15,4
DATA 11,15,5

rem rock 14-29
DATA 1,0,0
DATA 2,1,1
DATA 3,2,2
DATA 5,3,2
DATA 6,4,3
DATA 7,5,4
DATA 8,6,4
DATA 9,7,5
DATA 10,8,6
DATA 11,10,7
DATA 12,11,8
DATA 13,12,9
DATA 14,13,10
DATA 15,14,12
DATA 15,15,13

rem water 29-31
DATA 4,5,5
DATA 6,7,7
DATA 8,9,9

REM *********************************************************************


' passed a complete pathname, breaks it up into path/filename
' then calls the ARP selector
' returns -1 if OK, 0 means Cancelled
' changes the parameter if OK selected
' if scrnum%<>0 then it is used as the screen number

FUNCTION GetFile%(fname$,message$,VAL scrnum%)
	LOCAL path$,file$,buffer&(100),result&,term%,scr&,buf&

	' split up the pathname as required
	path$=SPACE$(80)
	LSET path$=fname$+CHR$(0)
	file$=SPACE$(40)
	result&=BaseName(SADD(path$))
	POKEB result&,0				'into path$
	term%=result&-SADD(path$)
	LSET file$=RIGHT$(fname$,LEN(fname$)-term%)+CHR$(0)

	' get the FR_buffer set up and call ARP
	buf&=VARPTR(buffer&(0))
	POKEL buf&,SADD(message$+CHR$(0))
	POKEL buf&+4,SADD(file$)
	POKEL buf&+8,SADD(path$)
	POKEL buf&+12,0
	POKEW buf&+16,0			'flag
	POKEL buf&+18,0			'function
	POKEL buf&+22,0			'reserved

	' handle custom screens (this is a bit messy, but it works...)
	IF scrnum% THEN
		scr&=PEEKL(SYSTAB+8+4*scrnum%)
		IF (scr&=0) OR (scrnum%<1) OR (scrnum%>4) THEN PRINT "Error":STOP
		POKEW buf&+26,&h217C
		POKEL buf&+28,scr&
		POKEL buf&+32,&h001E317C
		POKEL buf&+36,&h000F002E
		POKEW buf&+40,&h4E75
		POKEL buf&+18,buf&+26
		POKEB buf&+16,8
	END IF

	result&=FileRequest(buf&)
	IF result&=0 THEN
		GetFile%=0
	ELSE
		TackOn SADD(path$),SADD(file$)
		fname$=LEFT$(path$,INSTR(path$,CHR$(0))-1)
		GetFile%=-1
	END IF
END FUNCTION

