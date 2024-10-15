;script before
;copy 3dgame:graphics/style2/ilbm/Doors.ilbm ram:output.ilbm
;work:c/ilbm2raw -mb4cf64,0,64,9 ram:output.ilbm ram:temp1
;work:c/ilbm2raw -mb4cf64,26,48,7 ram:output.ilbm ram:temp2
;work:c/ilbm2raw -mb4cf64,42,32,4 ram:output.ilbm ram:temp3
;work:c/ilbm2raw -mb4cf64,54,32,3 ram:output.ilbm ram:temp4
;work:c/ilbm2raw -mb4cf0,103,144,4 ram:output.ilbm ram:temp5
;join ram:temp1 ram:temp2 ram:temp3 ram:temp4 ram:temp5 as ram:output.bin
;script assemble
;work:programming/languages/devpac/genam >ram:errors.txt ram:test.s
;script after
;work:c/strip ram:test 32
;copy ram:test 3dgame:graphics/style2/raw/Door1openfront.bin
;script end

	output	ram:test
	opt	o+,ow-

	include	"3dgame:sources/macros.i"
	include	"3dgame:sources/equates.i"

*******************************************************************************

planes  equ     5
size	set	bob_struct_size+67*14
;dump	equ     1

*******************************************************************************

UNFLIPD	equ	0
FLIPPED	equ	1
NRMFLP	equ     2
NONE	equ	3
MIRROR	equ	4	;distance to mirror

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

	IFND	dump

bob_structure	dc.l    0	;address of image data
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

	DEFSZE	64,9					;block 1
	DEFSZE	48,7					;block 2
	DEFSZE	32,4					;block 3
	DEFSZE	32,3					;block 4
	DEFSZE	144,4					;block 5

	dc.w	$0020,$0003,$0015,$000F,$000F,$0000,$0646
	dc.w	$0020,$0003,$0029,$000F,$000F,$0000,$0646
	dc.w	$0020,$0003,$003D,$000F,$000F,$0000,$0646
	dc.w	$0020,$0003,$0051,$000F,$000F,$0000,$0646
	dc.w	$0020,$0003,$0065,$000F,$000F,$0000,$0646
	dc.w	$0020,$0004,$FFFE,$0000,$0018,$0000,$05F6
	dc.w	$0020,$0004,$001B,$0000,$0018,$0000,$05F6
	dc.w	$0020,$0004,$0038,$0000,$0018,$0000,$05F6
	dc.w	$0020,$0004,$0055,$0000,$0018,$0000,$05F6
	dc.w	$0020,$0004,$0072,$0000,$0018,$0000,$05F6

	dc.w	$0030,$0007,$FFE3,$FFF9,$0016,$0000,$0524
	dc.w	$0030,$0007,$000B,$FFF9,$0016,$0000,$0524
	dc.w	$0030,$0007,$0033,$FFF9,$0016,$0000,$0524
	dc.w	$0030,$0007,$005B,$FFF9,$0016,$0000,$0524
	dc.w	$0030,$0007,$0083,$FFF9,$0016,$0000,$0524
	dc.w	$0040,$0009,$FFE7,$FFF7,$000A,$0000,$03BC
	dc.w	$0040,$0009,$0027,$FFF7,$000A,$0000,$03BC
	dc.w	$0040,$0009,$0067,$FFF7,$000A,$0000,$03BC
	dc.w	$0040,$0009,$FFA3,$00FF,$0003,$0000,$03BC
	dc.w	$0040,$0009,$FFA3,$00FF,$0003,$0000,$03BC

	dc.w	$0040,$0009,$FFA3,$00FF,$0003,$0000,$03BC
	dc.w	$0020,$0003,$0001,$0021,$000F,$0000,$0646
	dc.w	$0020,$0003,$0015,$0021,$000F,$0000,$0646
	dc.w	$0020,$0003,$0029,$0021,$000F,$0000,$0646
	dc.w	$0020,$0003,$003D,$0021,$000F,$0000,$0646
	dc.w	$0020,$0003,$0051,$0021,$000F,$0000,$0646
	dc.w	$0020,$0003,$0065,$0021,$000F,$0000,$0646
	dc.w	$0020,$0003,$0079,$0021,$000F,$0000,$0646
	dc.w	$0020,$0004,$FFE3,$001A,$0004,$0000,$05F6
	dc.w	$0020,$0004,$FFFE,$001C,$0018,$0000,$05F6

	dc.w	$0020,$0004,$001B,$001C,$0018,$0000,$05F6
	dc.w	$0020,$0004,$0038,$001C,$0018,$0000,$05F6
	dc.w	$0020,$0004,$0055,$001C,$0018,$0000,$05F6
	dc.w	$0020,$0004,$0072,$001C,$0018,$0000,$05F6
	dc.w	$0020,$0004,$008A,$001A,$0004,$0000,$05F6

	dc.w	$0030,$0007,$FFE3,$0016,$0021,$0000,$0524
	dc.w	$0030,$0007,$000B,$0016,$0021,$0000,$0524
	dc.w	$0030,$0007,$0033,$0016,$0021,$0000,$0524
	dc.w	$0030,$0007,$005B,$0016,$0021,$0000,$0524
	dc.w	$0030,$0007,$0083,$0016,$0021,$0000,$0524

	dc.w	$0040,$0009,$FFE7,$000A,$0037,$0000,$03BC
	dc.w	$0040,$0009,$0027,$000A,$0037,$0000,$03BC
	dc.w	$0040,$0009,$0067,$000A,$0037,$0000,$03BC
	dc.w	$0040,$0009,$FFA3,$00FF,$0003,$0000,$03BC
	dc.w	144,4,0,0,80,$0000,$0682
	dc.w	$0040,$0009,$FFA3,$00FF,$0003,$0000,$03BC
	dc.w	$0020,$0003,$0015,$0033,$000F,$0000,$0646
	dc.w	$0020,$0003,$0029,$0033,$000F,$0000,$0646
	dc.w	$0020,$0003,$003D,$0033,$000F,$0000,$0646
	dc.w	$0020,$0003,$0051,$0033,$000F,$0000,$0646
	dc.w	$0020,$0003,$0065,$0033,$000F,$0000,$0646
	dc.w	$0020,$0004,$FFFE,$0038,$0018,$0000,$05F6
	dc.w	$0020,$0004,$001B,$0038,$0018,$0000,$05F6
	dc.w	$0020,$0004,$0038,$0038,$0018,$0000,$05F6
	dc.w	$0020,$0004,$0055,$0038,$0018,$0000,$05F6
	dc.w	$0020,$0004,$0072,$0038,$0018,$0000,$05F6
	dc.w	$0030,$0007,$FFE3,$003E,$0016,$0000,$0524
	dc.w	$0030,$0007,$000B,$003E,$0016,$0000,$0524
	dc.w	$0030,$0007,$0033,$003E,$0016,$0000,$0524
	dc.w	$0030,$0007,$005B,$003E,$0016,$0000,$0524
	dc.w	$0030,$0007,$0083,$003E,$0016,$0000,$0524
	dc.w	$0040,$0009,$FFE7,$004A,$000A,$0000,$03BC
	dc.w	$0040,$0009,$0027,$004A,$000A,$0000,$03BC
	dc.w	$0040,$0009,$0067,$004A,$000A,$0000,$03BC
	dc.w	$0040,$0009,$FFA3,$00FF,$0003,$0000,$03BC
	dc.w	$0040,$0009,$FFA3,$00FF,$0003,$0000,$03BC
	dc.w	$0040,$0009,$FFA3,$00FF,$0003,$0000,$03BC


	ENDC

	IFD	dump
	incbin	"3dgame:graphics/style1/dump/Door1OpenFront.dump"
        ENDC

	incbin	"ram:output.bin"
	end
