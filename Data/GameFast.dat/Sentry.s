;#script before
;#copy 3dgame:data/gamefast.dat/sentry.ilbm ram:output.ilbm
;#copy 3dgame:data/gamefast.dat/sentry.s ram:script
;#work:c/ilbm2raw -b4cm -@ram:script -#start_here ram:output.ilbm ram:output.bin
;#script abort
;:start_here
;-f96,37,32,38
;-f96,93,32,24
;-f48,130,16,15
;-f48,155,16,10
;-f0,37,32,38
;-f0,93,32,24
;-f0,130,16,15
;-f0,155,16,10
;-f64,37,32,38
;-f64,93,32,24
;-f32,130,16,15
;-f32,155,16,10
;-f32,37,32,38
;-f32,93,32,24
;-f16,130,16,15
;-f16,155,16,10
;
;script assemble
;devpac3-2.0:devpac/genam >ram:errors.txt ram:test.s
;
;script after
;work:c/strip ram:test 32 4
;copy ram:test 3dgame:data/gamefast.dat/Sentry.bin
;script end

	output	ram:test
	opt     o+,ow-

	include	"3dgame:sources/macros.i"

*******************************************************************************

planes  equ     5

*******************************************************************************

UNFLIPD	equ	0
FLIPPED	equ	1
NRMFLP	equ     2
NONE	equ	3

DEFPOS	macro
	dc.w	width_\1				;width in pixels
	dc.w	hight_\1				;height in lines
	dc.w	\2					;x position
	dc.w	\3					;y position
	dc.w	\4					;control 0=unfliped
	dc.l	size_\1					; 1=flip, 2=norm&flip
	endm						; 3=none

DEFSZE	macro
size\@	set	size
width\@	set	\1
hight\@	set	\2
size	set	size+(((\1/8)*\2)*planes)
        endm

*******************************************************************************

size	set	(bob_struct_size+67*14)*4

	DEFSZE	32,38					;front 1 + 26
	DEFSZE	32,24					;front 2 + 18
	DEFSZE	16,15					;front 3 + 13
	DEFSZE	16,10					;front 4 + 10

front	dc.l    0	;address of image data
	dc.w	0       ;width in pixels
	dc.w	0       ;height in pixels
	dc.w	4	;plane for mask 0-5 (6=no mask)
	dc.b	0	;0=unflipped 1=flipped
	dc.b	1	;0=clipping disabled 1=clipping enabled
	dc.b	1	;0=no draw 1=copy 2=clear 3=set
	dc.b    1
	dc.b    1
	dc.b    1
	dc.b    2
	dc.b    0

	DEFPOS	004,$0018,$000E+10,UNFLIPD		;position 0
	DEFPOS	004,$002D,$000E+10,UNFLIPD		;position 1
	DEFPOS	004,$0042,$000E+10,UNFLIPD		;position 2
	DEFPOS	004,$0056,$000E+10,UNFLIPD		;position 3
	DEFPOS	004,$006A,$000E+10,UNFLIPD		;position 4
	DEFPOS	003,$000B,$0001+13,UNFLIPD		;position 5
	DEFPOS	003,$0026,$0001+13,UNFLIPD		;position 6
	DEFPOS	003,$0040,$0001+13,UNFLIPD		;position 7
	DEFPOS	003,$005A,$0001+13,UNFLIPD		;position 8
	DEFPOS	003,$0075,$0000+13,UNFLIPD		;position 9
	DEFPOS	002,$FFF1,$FFEC+18,UNFLIPD		;position 10
	DEFPOS	002,$0015,$FFEC+18,UNFLIPD		;position 11
	DEFPOS	002,$003C,$FFED+18,UNFLIPD		;position 12
	DEFPOS	002,$0060,$FFEC+18,UNFLIPD		;position 13
	DEFPOS	002,$0086,$FFEC+18,UNFLIPD		;position 14
	DEFPOS	001,$FFF9,$FFCB+26,UNFLIPD		;position 15
	DEFPOS	001,$0037,$FFCB+26,UNFLIPD		;position 16
	DEFPOS	001,$0077,$FFCB+26,UNFLIPD		;position 17
	DEFPOS	001,$FFA3,$00FF,NONE			;position 18
	DEFPOS	001,$FFA3,$00FF,NONE			;position 19
	DEFPOS	001,$FFA3,$00FF,NONE			;position 20
	DEFPOS	004,$0002,$0021+10,UNFLIPD		;position 21
	DEFPOS	004,$0018,$0021+10,UNFLIPD		;position 22
	DEFPOS	004,$002D,$0021+10,UNFLIPD		;position 23
	DEFPOS	004,$0042,$0021+10,UNFLIPD		;position 24
	DEFPOS	004,$0056,$0021+10,UNFLIPD		;position 25
	DEFPOS	004,$006A,$0021+10,UNFLIPD		;position 26
	DEFPOS	004,$007E,$0021+10,UNFLIPD		;position 27
	DEFPOS	003,$FFEF,$001D+13,UNFLIPD		;position 28
	DEFPOS	003,$000B,$001D+13,UNFLIPD		;position 29
	DEFPOS	003,$0026,$001D+13,UNFLIPD		;position 30
	DEFPOS	003,$0040,$001D+13,UNFLIPD		;position 31
	DEFPOS	003,$005A,$001E+13,UNFLIPD		;position 32
	DEFPOS	003,$0075,$001D+13,UNFLIPD		;position 33
	DEFPOS	003,$008F,$001E+13,UNFLIPD		;position 34
	DEFPOS	002,$FFF1,$0015+18,UNFLIPD		;position 35
	DEFPOS	002,$0016,$0015+18,UNFLIPD		;position 36
	DEFPOS	002,$003C,$0015+18,UNFLIPD		;position 37
	DEFPOS	002,$0060,$0015+18,UNFLIPD		;position 38
	DEFPOS	002,$0086,$0015+18,UNFLIPD		;position 39
	DEFPOS	001,$FFFA,$000B+26,UNFLIPD		;position 40
	DEFPOS	001,$0037,$000B+26,UNFLIPD		;position 41
	DEFPOS	001,$0075,$000B+26,UNFLIPD		;position 42
	DEFPOS	001,$FFA3,$00FF,NONE			;position 43
	DEFPOS	001,$FFA3,$00FF,NONE			;position 44
	DEFPOS	001,$FFA3,$00FF,NONE			;position 45
	DEFPOS	004,$0018,$0034+10,UNFLIPD		;position 46
	DEFPOS	004,$002E,$0034+10,UNFLIPD		;position 47
	DEFPOS	004,$0042,$0034+10,UNFLIPD		;position 48
	DEFPOS	004,$0055,$0034+10,UNFLIPD		;position 49
	DEFPOS	004,$006A,$0034+10,UNFLIPD		;position 50
	DEFPOS	003,$000A,$0037+13,UNFLIPD		;position 51
	DEFPOS	003,$0025,$0037+13,UNFLIPD		;position 52
	DEFPOS	003,$0040,$0037+13,UNFLIPD		;position 53
	DEFPOS	003,$005A,$0037+13,UNFLIPD		;position 54
	DEFPOS	003,$0075,$0037+13,UNFLIPD		;position 55
	DEFPOS	002,$FFF4,$003E+18,UNFLIPD		;position 56
	DEFPOS	002,$0016,$003E+18,UNFLIPD		;position 57
	DEFPOS	002,$003C,$003E+18,UNFLIPD		;position 58
	DEFPOS	002,$0060,$003E+18,UNFLIPD		;position 59
	DEFPOS	002,$0083,$003E+18,UNFLIPD		;position 60
	DEFPOS	001,$FFF9,$0049+26,UNFLIPD		;position 61
	DEFPOS	001,$0037,$0049+26,UNFLIPD		;position 62
	DEFPOS	001,$0073,$0049+26,UNFLIPD		;position 63
	DEFPOS	001,$FFA3,$00FF,NONE			;position 64
	DEFPOS	001,$FFA3,$00FF,NONE			;position 65
	DEFPOS	001,$FFA3,$00FF,NONE			;position 66

size	set	size-(bob_struct_size+67*14)

	DEFSZE	32,38					;left 1
	DEFSZE	32,24					;left 2
	DEFSZE	16,15					;left 3
	DEFSZE	16,10					;left 4

left	dc.l    0	;address of image data
	dc.w	0       ;width in pixels
	dc.w	0       ;height in pixels
	dc.w	4	;plane for mask 0-5 (6=no mask)
	dc.b	0	;0=unflipped 1=flipped
	dc.b	1	;0=clipping disabled 1=clipping enabled
	dc.b	1	;0=no draw 1=copy 2=clear 3=set
	dc.b    1
	dc.b    1
	dc.b    1
	dc.b    2
	dc.b    0

	DEFPOS	008,$0018,$000E+10,UNFLIPD		;position 0
	DEFPOS	008,$002D,$000E+10,UNFLIPD		;position 1
	DEFPOS	008,$0042,$000E+10,UNFLIPD		;position 2
	DEFPOS	008,$0056,$000E+10,UNFLIPD		;position 3
	DEFPOS	008,$006A,$000E+10,UNFLIPD		;position 4
	DEFPOS	007,$000B,$0001+13,UNFLIPD		;position 5
	DEFPOS	007,$0026,$0001+13,UNFLIPD		;position 6
	DEFPOS	007,$0040,$0001+13,UNFLIPD		;position 7
	DEFPOS	007,$005A,$0001+13,UNFLIPD		;position 8
	DEFPOS	007,$0075,$0000+13,UNFLIPD		;position 9
	DEFPOS	006,$FFF1,$FFEC+18,UNFLIPD		;position 10
	DEFPOS	006,$0015,$FFEC+18,UNFLIPD		;position 11
	DEFPOS	006,$003C,$FFED+18,UNFLIPD		;position 12
	DEFPOS	006,$0060,$FFEC+18,UNFLIPD		;position 13
	DEFPOS	006,$0086,$FFEC+18,UNFLIPD		;position 14
	DEFPOS	005,$FFF9,$FFCB+26,UNFLIPD		;position 15
	DEFPOS	005,$0037,$FFCB+26,UNFLIPD		;position 16
	DEFPOS	005,$0077,$FFCB+26,UNFLIPD		;position 17
	DEFPOS	005,$FFA3,$00FF,NONE			;position 18
	DEFPOS	005,$FFA3,$00FF,NONE			;position 19
	DEFPOS	005,$FFA3,$00FF,NONE			;position 20
	DEFPOS	008,$0002,$0021+10,UNFLIPD		;position 21
	DEFPOS	008,$0018,$0021+10,UNFLIPD		;position 22
	DEFPOS	008,$002D,$0021+10,UNFLIPD		;position 23
	DEFPOS	008,$0042,$0021+10,UNFLIPD		;position 24
	DEFPOS	008,$0056,$0021+10,UNFLIPD		;position 25
	DEFPOS	008,$006A,$0021+10,UNFLIPD		;position 26
	DEFPOS	008,$007E,$0021+10,UNFLIPD		;position 27
	DEFPOS	007,$FFEF,$001D+13,UNFLIPD		;position 28
	DEFPOS	007,$000B,$001D+13,UNFLIPD		;position 29
	DEFPOS	007,$0026,$001D+13,UNFLIPD		;position 30
	DEFPOS	007,$0040,$001D+13,UNFLIPD		;position 31
	DEFPOS	007,$005A,$001E+13,UNFLIPD		;position 32
	DEFPOS	007,$0075,$001D+13,UNFLIPD		;position 33
	DEFPOS	007,$008F,$001E+13,UNFLIPD		;position 34
	DEFPOS	006,$FFF1,$0015+18,UNFLIPD		;position 35
	DEFPOS	006,$0016,$0015+18,UNFLIPD		;position 36
	DEFPOS	006,$003C,$0015+18,UNFLIPD		;position 37
	DEFPOS	006,$0060,$0015+18,UNFLIPD		;position 38
	DEFPOS	006,$0086,$0015+18,UNFLIPD		;position 39
	DEFPOS	005,$FFFA,$000B+26,UNFLIPD		;position 40
	DEFPOS	005,$0037,$000B+26,UNFLIPD		;position 41
	DEFPOS	005,$0075,$000B+26,UNFLIPD		;position 42
	DEFPOS	005,$FFA3,$00FF,NONE			;position 43
	DEFPOS	005,$FFA3,$00FF,NONE			;position 44
	DEFPOS	005,$FFA3,$00FF,NONE			;position 45
	DEFPOS	008,$0018,$0034+10,UNFLIPD		;position 46
	DEFPOS	008,$002E,$0034+10,UNFLIPD		;position 47
	DEFPOS	008,$0042,$0034+10,UNFLIPD		;position 48
	DEFPOS	008,$0055,$0034+10,UNFLIPD		;position 49
	DEFPOS	008,$006A,$0034+10,UNFLIPD		;position 50
	DEFPOS	007,$000A,$0037+13,UNFLIPD		;position 51
	DEFPOS	007,$0025,$0037+13,UNFLIPD		;position 52
	DEFPOS	007,$0040,$0037+13,UNFLIPD		;position 53
	DEFPOS	007,$005A,$0037+13,UNFLIPD		;position 54
	DEFPOS	007,$0075,$0037+13,UNFLIPD		;position 55
	DEFPOS	006,$FFF4,$003E+18,UNFLIPD		;position 56
	DEFPOS	006,$0016,$003E+18,UNFLIPD		;position 57
	DEFPOS	006,$003C,$003E+18,UNFLIPD		;position 58
	DEFPOS	006,$0060,$003E+18,UNFLIPD		;position 59
	DEFPOS	006,$0083,$003E+18,UNFLIPD		;position 60
	DEFPOS	005,$FFF9,$0049+26,UNFLIPD		;position 61
	DEFPOS	005,$0037,$0049+26,UNFLIPD		;position 62
	DEFPOS	005,$0073,$0049+26,UNFLIPD		;position 63
	DEFPOS	005,$FFA3,$00FF,NONE			;position 64
	DEFPOS	005,$FFA3,$00FF,NONE			;position 65
	DEFPOS	005,$FFA3,$00FF,NONE			;position 66

size	set	size-(bob_struct_size+67*14)

	DEFSZE	32,38					;right 1
	DEFSZE	32,24					;right 2
	DEFSZE	16,15					;right 3
	DEFSZE	16,10					;right 4

right	dc.l    0	;address of image data
	dc.w	0       ;width in pixels
	dc.w	0       ;height in pixels
	dc.w	4	;plane for mask 0-5 (6=no mask)
	dc.b	0	;0=unflipped 1=flipped
	dc.b	1	;0=clipping disabled 1=clipping enabled
	dc.b	1	;0=no draw 1=copy 2=clear 3=set
	dc.b    1
	dc.b    1
	dc.b    1
	dc.b    2
	dc.b    0

	DEFPOS	012,$0018,$000E+10,UNFLIPD		;position 0
	DEFPOS	012,$002D,$000E+10,UNFLIPD		;position 1
	DEFPOS	012,$0042,$000E+10,UNFLIPD		;position 2
	DEFPOS	012,$0056,$000E+10,UNFLIPD		;position 3
	DEFPOS	012,$006A,$000E+10,UNFLIPD		;position 4
	DEFPOS	011,$000B,$0001+13,UNFLIPD		;position 5
	DEFPOS	011,$0026,$0001+13,UNFLIPD		;position 6
	DEFPOS	011,$0040,$0001+13,UNFLIPD		;position 7
	DEFPOS	011,$005A,$0001+13,UNFLIPD		;position 8
	DEFPOS	011,$0075,$0000+13,UNFLIPD		;position 9
	DEFPOS	010,$FFF1,$FFEC+18,UNFLIPD		;position 10
	DEFPOS	010,$0015,$FFEC+18,UNFLIPD		;position 11
	DEFPOS	010,$003C,$FFED+18,UNFLIPD		;position 12
	DEFPOS	010,$0060,$FFEC+18,UNFLIPD		;position 13
	DEFPOS	010,$0086,$FFEC+18,UNFLIPD		;position 14
	DEFPOS	009,$FFF9,$FFCB+26,UNFLIPD		;position 15
	DEFPOS	009,$0037,$FFCB+26,UNFLIPD		;position 16
	DEFPOS	009,$0077,$FFCB+26,UNFLIPD		;position 17
	DEFPOS	009,$FFA3,$00FF,NONE			;position 18
	DEFPOS	009,$FFA3,$00FF,NONE			;position 19
	DEFPOS	009,$FFA3,$00FF,NONE			;position 20
	DEFPOS	012,$0002,$0021+10,UNFLIPD		;position 21
	DEFPOS	012,$0018,$0021+10,UNFLIPD		;position 22
	DEFPOS	012,$002D,$0021+10,UNFLIPD		;position 23
	DEFPOS	012,$0042,$0021+10,UNFLIPD		;position 24
	DEFPOS	012,$0056,$0021+10,UNFLIPD		;position 25
	DEFPOS	012,$006A,$0021+10,UNFLIPD		;position 26
	DEFPOS	012,$007E,$0021+10,UNFLIPD		;position 27
	DEFPOS	011,$FFEF,$001D+13,UNFLIPD		;position 28
	DEFPOS	011,$000B,$001D+13,UNFLIPD		;position 29
	DEFPOS	011,$0026,$001D+13,UNFLIPD		;position 30
	DEFPOS	011,$0040,$001D+13,UNFLIPD		;position 31
	DEFPOS	011,$005A,$001E+13,UNFLIPD		;position 32
	DEFPOS	011,$0075,$001D+13,UNFLIPD		;position 33
	DEFPOS	011,$008F,$001E+13,UNFLIPD		;position 34
	DEFPOS	010,$FFF1,$0015+18,UNFLIPD		;position 35
	DEFPOS	010,$0016,$0015+18,UNFLIPD		;position 36
	DEFPOS	010,$003C,$0015+18,UNFLIPD		;position 37
	DEFPOS	010,$0060,$0015+18,UNFLIPD		;position 38
	DEFPOS	010,$0086,$0015+18,UNFLIPD		;position 39
	DEFPOS	009,$FFFA,$000B+26,UNFLIPD		;position 40
	DEFPOS	009,$0037,$000B+26,UNFLIPD		;position 41
	DEFPOS	009,$0075,$000B+26,UNFLIPD		;position 42
	DEFPOS	009,$FFA3,$00FF,NONE			;position 43
	DEFPOS	009,$FFA3,$00FF,NONE			;position 44
	DEFPOS	009,$FFA3,$00FF,NONE			;position 45
	DEFPOS	012,$0018,$0034+10,UNFLIPD		;position 46
	DEFPOS	012,$002E,$0034+10,UNFLIPD		;position 47
	DEFPOS	012,$0042,$0034+10,UNFLIPD		;position 48
	DEFPOS	012,$0055,$0034+10,UNFLIPD		;position 49
	DEFPOS	012,$006A,$0034+10,UNFLIPD		;position 50
	DEFPOS	011,$000A,$0037+13,UNFLIPD		;position 51
	DEFPOS	011,$0025,$0037+13,UNFLIPD		;position 52
	DEFPOS	011,$0040,$0037+13,UNFLIPD		;position 53
	DEFPOS	011,$005A,$0037+13,UNFLIPD		;position 54
	DEFPOS	011,$0075,$0037+13,UNFLIPD		;position 55
	DEFPOS	010,$FFF4,$003E+18,UNFLIPD		;position 56
	DEFPOS	010,$0016,$003E+18,UNFLIPD		;position 57
	DEFPOS	010,$003C,$003E+18,UNFLIPD		;position 58
	DEFPOS	010,$0060,$003E+18,UNFLIPD		;position 59
	DEFPOS	010,$0083,$003E+18,UNFLIPD		;position 60
	DEFPOS	009,$FFF9,$0049+26,UNFLIPD		;position 61
	DEFPOS	009,$0037,$0049+26,UNFLIPD		;position 62
	DEFPOS	009,$0073,$0049+26,UNFLIPD		;position 63
	DEFPOS	009,$FFA3,$00FF,NONE			;position 64
	DEFPOS	009,$FFA3,$00FF,NONE			;position 65
	DEFPOS	009,$FFA3,$00FF,NONE			;position 66

size	set	size-(bob_struct_size+67*14)

	DEFSZE	32,38					;back 1
	DEFSZE	32,24					;back 2
	DEFSZE	16,15					;back 3
	DEFSZE	16,10					;back 4

back	dc.l    0	;address of image data
	dc.w	0       ;width in pixels
	dc.w	0       ;height in pixels
	dc.w	4	;plane for mask 0-5 (6=no mask)
	dc.b	0	;0=unflipped 1=flipped
	dc.b	1	;0=clipping disabled 1=clipping enabled
	dc.b	1	;0=no draw 1=copy 2=clear 3=set
	dc.b    1
	dc.b    1
	dc.b    1
	dc.b    2
	dc.b    0

	DEFPOS	016,$0018,$000E+10,UNFLIPD		;position 0
	DEFPOS	016,$002D,$000E+10,UNFLIPD		;position 1
	DEFPOS	016,$0042,$000E+10,UNFLIPD		;position 2
	DEFPOS	016,$0056,$000E+10,UNFLIPD		;position 3
	DEFPOS	016,$006A,$000E+10,UNFLIPD		;position 4
	DEFPOS	015,$000B,$0001+13,UNFLIPD		;position 5
	DEFPOS	015,$0026,$0001+13,UNFLIPD		;position 6
	DEFPOS	015,$0040,$0001+13,UNFLIPD		;position 7
	DEFPOS	015,$005A,$0001+13,UNFLIPD		;position 8
	DEFPOS	015,$0075,$0000+13,UNFLIPD		;position 9
	DEFPOS	014,$FFF1,$FFEC+18,UNFLIPD		;position 10
	DEFPOS	014,$0015,$FFEC+18,UNFLIPD		;position 11
	DEFPOS	014,$003C,$FFED+18,UNFLIPD		;position 12
	DEFPOS	014,$0060,$FFEC+18,UNFLIPD		;position 13
	DEFPOS	014,$0086,$FFEC+18,UNFLIPD		;position 14
	DEFPOS	013,$FFF9,$FFCB+26,UNFLIPD		;position 15
	DEFPOS	013,$0037,$FFCB+26,UNFLIPD		;position 16
	DEFPOS	013,$0077,$FFCB+26,UNFLIPD		;position 17
	DEFPOS	013,$FFA3,$00FF,NONE			;position 18
	DEFPOS	013,$FFA3,$00FF,NONE			;position 19
	DEFPOS	013,$FFA3,$00FF,NONE			;position 20
	DEFPOS	016,$0002,$0021+10,UNFLIPD		;position 21
	DEFPOS	016,$0018,$0021+10,UNFLIPD		;position 22
	DEFPOS	016,$002D,$0021+10,UNFLIPD		;position 23
	DEFPOS	016,$0042,$0021+10,UNFLIPD		;position 24
	DEFPOS	016,$0056,$0021+10,UNFLIPD		;position 25
	DEFPOS	016,$006A,$0021+10,UNFLIPD		;position 26
	DEFPOS	016,$007E,$0021+10,UNFLIPD		;position 27
	DEFPOS	015,$FFEF,$001D+13,UNFLIPD		;position 28
	DEFPOS	015,$000B,$001D+13,UNFLIPD		;position 29
	DEFPOS	015,$0026,$001D+13,UNFLIPD		;position 30
	DEFPOS	015,$0040,$001D+13,UNFLIPD		;position 31
	DEFPOS	015,$005A,$001E+13,UNFLIPD		;position 32
	DEFPOS	015,$0075,$001D+13,UNFLIPD		;position 33
	DEFPOS	015,$008F,$001E+13,UNFLIPD		;position 34
	DEFPOS	014,$FFF1,$0015+18,UNFLIPD		;position 35
	DEFPOS	014,$0016,$0015+18,UNFLIPD		;position 36
	DEFPOS	014,$003C,$0015+18,UNFLIPD		;position 37
	DEFPOS	014,$0060,$0015+18,UNFLIPD		;position 38
	DEFPOS	014,$0086,$0015+18,UNFLIPD		;position 39
	DEFPOS	013,$FFFA,$000B+26,UNFLIPD		;position 40
	DEFPOS	013,$0037,$000B+26,UNFLIPD		;position 41
	DEFPOS	013,$0075,$000B+26,UNFLIPD		;position 42
	DEFPOS	013,$FFA3,$00FF,NONE			;position 43
	DEFPOS	013,$FFA3,$00FF,NONE			;position 44
	DEFPOS	013,$FFA3,$00FF,NONE			;position 45
	DEFPOS	016,$0018,$0034+10,UNFLIPD		;position 46
	DEFPOS	016,$002E,$0034+10,UNFLIPD		;position 47
	DEFPOS	016,$0042,$0034+10,UNFLIPD		;position 48
	DEFPOS	016,$0055,$0034+10,UNFLIPD		;position 49
	DEFPOS	016,$006A,$0034+10,UNFLIPD		;position 50
	DEFPOS	015,$000A,$0037+13,UNFLIPD		;position 51
	DEFPOS	015,$0025,$0037+13,UNFLIPD		;position 52
	DEFPOS	015,$0040,$0037+13,UNFLIPD		;position 53
	DEFPOS	015,$005A,$0037+13,UNFLIPD		;position 54
	DEFPOS	015,$0075,$0037+13,UNFLIPD		;position 55
	DEFPOS	014,$FFF4,$003E+18,UNFLIPD		;position 56
	DEFPOS	014,$0016,$003E+18,UNFLIPD		;position 57
	DEFPOS	014,$003C,$003E+18,UNFLIPD		;position 58
	DEFPOS	014,$0060,$003E+18,UNFLIPD		;position 59
	DEFPOS	014,$0083,$003E+18,UNFLIPD		;position 60
	DEFPOS	013,$FFF9,$0049+26,UNFLIPD		;position 61
	DEFPOS	013,$0037,$0049+26,UNFLIPD		;position 62
	DEFPOS	013,$0073,$0049+26,UNFLIPD		;position 63
	DEFPOS	013,$FFA3,$00FF,NONE			;position 64
	DEFPOS	013,$FFA3,$00FF,NONE			;position 65
	DEFPOS	013,$FFA3,$00FF,NONE			;position 66

********************************************************************************

pics	incbin	"ram:output.bin"

	end
