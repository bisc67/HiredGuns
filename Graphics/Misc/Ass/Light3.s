	output  /raw/Light3.bin
	opt     o+,ow-

	include	"3dgame:sources/macros.i"

size	set	bob_struct_size+67*14

DEF_BOB	macro
	dc.w	\3					;width in pixels
	dc.w	\4					;height in lines
	dc.w	\1					;x position
	dc.w	(412-\2)				;y position
	dc.w	\5					;control
	dc.l	size
size	set	size+((\3/8)*\4)
	endm

bob_structure	dc.l    0	;address of image data
		dc.w	0       ;width in pixels
		dc.w	0       ;height in pixels
		dc.w	0	;plane for mask 0-5 (6=no mask)
		dc.b	0	;0=unflipped 1=flipped
		dc.b	0	;0=clipping disabled 1=clipping enabled
		dc.b	0       ;0=no draw 1=copy 2=clear 3=set
		dc.b    0
		dc.b    0
		dc.b    0
		dc.b    0
		dc.b    3

size	set	size+((48/8)*4)
	DEF_BOB	14,381,48,4,0				;block 0
	DEF_BOB	37,381,32,4,0				;block 1
	DEF_BOB	60,381,32,4,0				;block 2
	DEF_BOB	78,381,32,4,0				;block 3
	DEF_BOB	93,381,48,4,0				;block 4
size	set	size+((48/8)*4)
size	set	size+((32/8)*9)
	DEF_BOB	0,387,48,9,0				;block 5
	DEF_BOB	23,387,48,9,0				;block 6
	DEF_BOB	55,387,32,9,0				;block 7
	DEF_BOB	81,387,48,9,0				;block 8
	DEF_BOB	102,387,48,9,0				;block 9
size	set	size+((32/8)*9)
	DEF_BOB	0,395,32,13,0				;block 10
	DEF_BOB	0,395,64,13,0				;block 11
	DEF_BOB	47,395,48,13,0				;block 12
	DEF_BOB	86,395,64,13,0				;block 13
	DEF_BOB	117,395,32,13,0				;block 14
	DEF_BOB	0,412,48,24,0				;block 15
	DEF_BOB	31,412,80,24,0				;block 16
	DEF_BOB	94,412,48,24,0				;block 17
	DEF_BOB	0,412,32,10,0				;block 18
	DEF_BOB	29,412,96,10,0				;block 19
	DEF_BOB	110,412,32,10,0				;block 20

size	set	bob_struct_size+67*14

	DEF_BOB	0,363,48,4,1				;block 21
	DEF_BOB	14,363,48,4,1				;block 22
	DEF_BOB	37,363,32,4,1				;block 23
	DEF_BOB	60,363,32,4,1				;block 24
	DEF_BOB	78,363,32,4,1				;block 25
	DEF_BOB	93,363,48,4,1				;block 26
	DEF_BOB	108,363,48,4,1				;block 27
	DEF_BOB	0,362,32,9,1				;block 28
	DEF_BOB	0,362,48,9,1				;block 29
	DEF_BOB	23,362,48,9,1				;block 30
	DEF_BOB	55,362,32,9,1				;block 31
	DEF_BOB	81,362,48,9,1				;block 32
	DEF_BOB	102,362,48,9,1				;block 33
	DEF_BOB	123,362,32,9,1				;block 34
	DEF_BOB	0,357,32,13,1				;block 35
	DEF_BOB	0,357,64,13,1				;block 36
	DEF_BOB	47,357,48,13,1				;block 37
	DEF_BOB	86,357,64,13,1				;block 38
	DEF_BOB	117,357,32,13,1				;block 39
	DEF_BOB	0,353,48,24,1				;block 40
	DEF_BOB	31,353,80,24,1				;block 41
	DEF_BOB	94,353,48,24,1				;block 42
	DEF_BOB	0,338,32,10,1				;block 43
	DEF_BOB	29,338,96,10,1				;block 44
	DEF_BOB	110,338,32,10,1				;block 45

	DEF_BOB 0,0,0,0,3 				;block 46
	DEF_BOB	0,0,0,0,3				;block 47
	DEF_BOB	0,0,0,0,3				;block 48
	DEF_BOB	0,0,0,0,3				;block 49
	DEF_BOB	0,0,0,0,3				;block 50
	DEF_BOB	0,0,0,0,3				;block 51
	DEF_BOB	0,0,0,0,3				;block 52
	DEF_BOB	0,0,0,0,3				;block 53
	DEF_BOB	0,0,0,0,3				;block 54
	DEF_BOB	0,0,0,0,3				;block 55
	DEF_BOB	0,0,0,0,3				;block 56
	DEF_BOB	0,0,0,0,3				;block 57
	DEF_BOB	0,0,0,0,3				;block 58
	DEF_BOB	0,0,0,0,3				;block 59
	DEF_BOB	0,0,0,0,3				;block 60
	DEF_BOB	0,0,0,0,3				;block 61
	DEF_BOB	0,0,0,0,3				;block 62
	DEF_BOB	0,0,0,0,3				;block 63
	DEF_BOB	0,0,0,0,3				;block 64
	DEF_BOB	0,0,0,0,3				;block 65
	DEF_BOB	0,0,0,0,3				;block 66

	incbin	"ram:output.bin"

	end
