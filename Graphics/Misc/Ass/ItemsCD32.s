	output	3dgame:test/hiredgunscd32/game/Items.gfx
	opt 	o+,ow-					;genam options

	include	"3dgame:sources/macros.i"

*******************************************************************************

planes  equ     7
size	set	bob_struct_size+90*14

*******************************************************************************

UNFLIPD	equ	0
FLIPPED	equ	1
NRMFLP	equ     2
NONE	equ	3

DEFPOS	macro
	dc.w	width_\1				;width in pixels
	dc.w	hight_\1				;height in lines
	dc.w	-(width_\1)/2				;x position
	dc.w	-(hight_\1)/2				;y position
	dc.w	\2					;control 0=unfliped
	dc.l	size_\1					; 1=flip, 2=norm&flip
	endm						; 3=none

DEFSZE	macro
size\@	set	size
width\@	set	\1
hight\@	set	\2
size	set	size+(((\1/8)*\2)*planes)
        endm

*******************************************************************************

bob_structure	dc.l    0	;address of image data
		dc.w	0       ;width in pixels
		dc.w	0       ;height in pixels
		dc.w	7	;plane for mask 0-5 (6=no mask)
		dc.b	0	;0=unflipped 1=flipped
		dc.b	1	;0=clipping disabled 1=clipping enabled
		dc.b	1	;0=no draw 1=copy 2=clear 3=set
		dc.b    1
		dc.b    1
		dc.b    1
		dc.b    1
		dc.b    1

	DEFSZE	64,22					;block 1
	DEFSZE	64,19					;block 2
	DEFSZE	48,20					;block 3
	DEFSZE	64,17					;block 4
	DEFSZE	48,19					;block 5
	DEFSZE	64,13					;block 6
	DEFSZE	64,21					;block 7
	DEFSZE	64,21					;block 8
	DEFSZE	48,23					;block 9
	DEFSZE	48,15					;block 10
	DEFSZE	48,20					;block 11
	DEFSZE	64,9					;block 12
	DEFSZE	64,19					;block 13
	DEFSZE	64,13					;block 14
	DEFSZE	64,15					;block 15
	DEFSZE	32,20					;block 16
	DEFSZE	48,16					;block 17
	DEFSZE	32,17					;block 18

	DEFSZE	32,16					;block 19
	DEFSZE	32,14					;block 20
	DEFSZE	48,20					;block 21
	DEFSZE	32,8					;block 22
	DEFSZE	32,13					;block 23
	DEFSZE	64,20					;block 24
	DEFSZE	32,18					;block 25
	DEFSZE	48,15					;block 26
	DEFSZE	48,18					;block 27
	DEFSZE	48,22					;block 28
	DEFSZE	64,22					;block 29
	DEFSZE	16,1					;block 20
	DEFSZE	32,17					;block 31
	DEFSZE	16,19					;block 32
	DEFSZE	32,19					;block 33
	DEFSZE	32,19					;block 34
	DEFSZE	16,1					;block 35
	DEFSZE	32,12					;block 36

	DEFSZE	16,19					;block 37
	DEFSZE	32,13					;block 38
	DEFSZE	32,23					;block 39
	DEFSZE	32,20					;block 40
	DEFSZE	32,15					;block 41
	DEFSZE	16,19					;block 42
	DEFSZE	16,19					;block 43
	DEFSZE	16,14					;block 44
	DEFSZE	16,14					;block 45
	DEFSZE	32,25					;block 46
	DEFSZE	32,25					;block 47
	DEFSZE	32,15					;block 48
	DEFSZE	32,16					;block 49
	DEFSZE	16,14					;block 50
	DEFSZE	16,14					;block 51
	DEFSZE	32,14					;block 52
	DEFSZE	48,18					;block 53
	DEFSZE	32,6					;block 54

	DEFSZE	48,25					;block 55
	DEFSZE	32,17					;block 56
	DEFSZE	16,21					;block 57
	DEFSZE	16,16					;block 58
	DEFSZE	32,10					;block 59
	DEFSZE	32,24					;block 60
	DEFSZE	16,21					;block 61
	DEFSZE	32,21					;block 62
	DEFSZE	32,21					;block 63
	DEFSZE	32,21					;block 64
	DEFSZE	32,21					;block 65
	DEFSZE	64,17					;block 66
	DEFSZE	32,21					;block 67
	DEFSZE	16,1					;block 68
	DEFSZE	16,1					;block 69
	DEFSZE	16,1					;block 70
	DEFSZE	16,1					;block 71
	DEFSZE	32,14					;block 72

	DEFSZE	48,19					;block 73
	DEFSZE	32,16					;block 74
	DEFSZE	32,16					;block 75
	DEFSZE	32,16					;block 76
	DEFSZE	32,16					;block 77
	DEFSZE	32,14					;block 78
	DEFSZE	32,14					;block 79
	DEFSZE	32,14					;block 80
	DEFSZE	32,14					;block 81
	DEFSZE	32,14					;block 82
	DEFSZE	32,14					;block 83
	DEFSZE	64,21					;block 84
	DEFSZE	16,1					;block 85
	DEFSZE	32,21					;block 86
	DEFSZE	32,16					;block 87
	DEFSZE	32,19					;block 88
	DEFSZE	32,12					;block 89
	DEFSZE	32,10					;block 90

	DEFPOS	001,UNFLIPD				;block 1
	DEFPOS	002,UNFLIPD				;block 2
	DEFPOS	003,UNFLIPD				;block 3
	DEFPOS	004,UNFLIPD				;block 4
	DEFPOS	005,UNFLIPD				;block 5
	DEFPOS	006,UNFLIPD				;block 6
	DEFPOS	007,UNFLIPD				;block 7
	DEFPOS	008,UNFLIPD				;block 8
	DEFPOS	009,UNFLIPD				;block 9
	DEFPOS	010,UNFLIPD				;block 10
	DEFPOS	011,UNFLIPD				;block 11
	DEFPOS	012,UNFLIPD				;block 12
	DEFPOS	013,UNFLIPD				;block 13
	DEFPOS	014,UNFLIPD				;block 14
	DEFPOS	015,UNFLIPD				;block 15
	DEFPOS	016,UNFLIPD				;block 16
	DEFPOS	017,UNFLIPD				;block 17
	DEFPOS	018,UNFLIPD				;block 18
	DEFPOS	019,UNFLIPD				;block 19
	DEFPOS	020,UNFLIPD				;block 20
	DEFPOS	021,UNFLIPD				;block 21
	DEFPOS	022,UNFLIPD				;block 22
	DEFPOS	023,UNFLIPD				;block 23
	DEFPOS	024,UNFLIPD				;block 24
	DEFPOS	025,UNFLIPD				;block 25
	DEFPOS	026,UNFLIPD				;block 26
	DEFPOS	027,UNFLIPD				;block 27
	DEFPOS	028,UNFLIPD				;block 28
	DEFPOS	029,UNFLIPD				;block 29
	DEFPOS	030,UNFLIPD				;block 30
	DEFPOS	031,UNFLIPD				;block 31
	DEFPOS	032,UNFLIPD				;block 32
	DEFPOS	033,UNFLIPD				;block 33
	DEFPOS	034,UNFLIPD				;block 34
	DEFPOS	035,UNFLIPD				;block 35
	DEFPOS	036,UNFLIPD				;block 36
	DEFPOS	037,UNFLIPD				;block 37
	DEFPOS	038,UNFLIPD				;block 38
	DEFPOS	039,UNFLIPD				;block 39
	DEFPOS	040,UNFLIPD				;block 40
	DEFPOS	041,UNFLIPD				;block 41
	DEFPOS	042,UNFLIPD				;block 42
	DEFPOS	043,UNFLIPD				;block 43
	DEFPOS	044,UNFLIPD				;block 44
	DEFPOS	045,UNFLIPD				;block 45
	DEFPOS	046,UNFLIPD				;block 46
	DEFPOS	047,UNFLIPD				;block 47
	DEFPOS	048,UNFLIPD				;block 48
	DEFPOS	049,UNFLIPD				;block 49
	DEFPOS	050,UNFLIPD				;block 50
	DEFPOS	051,UNFLIPD				;block 51
	DEFPOS	052,UNFLIPD				;block 52
	DEFPOS	053,UNFLIPD				;block 53
	DEFPOS	054,UNFLIPD				;block 54
	DEFPOS	055,UNFLIPD				;block 55
	DEFPOS	056,UNFLIPD				;block 56
	DEFPOS	057,UNFLIPD				;block 57
	DEFPOS	058,UNFLIPD				;block 58
	DEFPOS	059,UNFLIPD				;block 59
	DEFPOS	060,UNFLIPD				;block 60
	DEFPOS	061,UNFLIPD				;block 61
	DEFPOS	062,UNFLIPD				;block 62
	DEFPOS	063,UNFLIPD				;block 63
	DEFPOS	064,UNFLIPD				;block 64
	DEFPOS	065,UNFLIPD				;block 65
	DEFPOS	066,UNFLIPD				;block 66
	DEFPOS	067,UNFLIPD				;block 67
	DEFPOS	068,UNFLIPD				;block 68
	DEFPOS	069,UNFLIPD				;block 69
	DEFPOS	070,UNFLIPD				;block 70
	DEFPOS	071,UNFLIPD				;block 71
	DEFPOS	072,UNFLIPD				;block 72
	DEFPOS	073,UNFLIPD				;block 73
	DEFPOS	074,UNFLIPD				;block 74
	DEFPOS	075,UNFLIPD				;block 75
	DEFPOS	076,UNFLIPD				;block 76
	DEFPOS	077,UNFLIPD				;block 77
	DEFPOS	078,UNFLIPD				;block 78
	DEFPOS	079,UNFLIPD				;block 79
	DEFPOS	080,UNFLIPD				;block 80
	DEFPOS	081,UNFLIPD				;block 81
	DEFPOS	082,UNFLIPD				;block 82
	DEFPOS	083,UNFLIPD				;block 83
	DEFPOS	084,UNFLIPD				;block 84
	DEFPOS	085,UNFLIPD				;block 85
	DEFPOS	086,UNFLIPD				;block 86
	DEFPOS	087,UNFLIPD				;block 87
	DEFPOS	088,UNFLIPD				;block 88
	DEFPOS	089,UNFLIPD				;block 89
	DEFPOS	090,UNFLIPD				;block 90

 	incbin	"ram:output.bin"
	end
