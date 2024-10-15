;#script before
;#copy 3dgame:graphics/misc/ilbm/hydraulic.ilbm ram:output.ilbm
;#copy 3dgame:graphics/misc/ass/hydraulic.s ram:script
;#work:c/ilbm2raw -b4cm -@ram:script -#start_here ram:output.ilbm ram:output.bin
;#script abort
;:start_here
;-cf160,5,16,19
;-cf176,47,16,28
;-cf160,123,16,24
;-cf160,208,16,14
;-cf160,28,16,9
;-cf176,77,16,15
;-cf160,154,16,20
;-cf160,235,16,32
;
;script assemble
;devpac3-2.0:devpac/genam >ram:errors.txt ram:test.s
;
;script after
;work:c/strip ram:test 32 4
;copy ram:test 3dgame:graphics/misc/raw/Hydraulic.bin
;script end

	output	ram:test
	include	"3dgame:sources/macros.i"
	opt     o+,ow-

*******************************************************************************

planes  equ     5
size	set	bob_struct_size+67*14
;dump	equ	0

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

	IFND	dump

bob_structure	dc.l    0	;address of image data
		dc.w	0       ;width in pixels
		dc.w	0       ;height in pixels
		dc.w	4	;plane for mask 0-5 (6=no mask)
		dc.b	0	;0=unflipped 1=flipped
		dc.b	1	;0=clipping disabled 1=clipping enabled
		dc.b	1       ;0=no draw 1=copy 2=clear 3=set
		dc.b    1
		dc.b    1
		dc.b    1
		dc.b    2
		dc.b    0

	DEFSZE	16,19					;block 1
	DEFSZE	16,28					;block 2
	DEFSZE	16,24					;block 3
	DEFSZE	16,14					;block 4
	DEFSZE	16,9					;block 5
	DEFSZE	16,15					;block 6
	DEFSZE	16,20					;block 7
	DEFSZE	16,32					;block 8

	DEFPOS	001,$22,$f,UNFLIPD			;block 0
	DEFPOS	001,$34,$f,UNFLIPD			;block 1
	DEFPOS	001,$46,$f,UNFLIPD			;block 2
	DEFPOS	001,$58,$f,UNFLIPD			;block 3
	DEFPOS	001,$69,$f,UNFLIPD			;block 4
	DEFPOS	002,$14,$0,UNFLIPD			;block 5
	DEFPOS	002,$2c,$0,UNFLIPD			;block 6
	DEFPOS	002,$45,$0,UNFLIPD			;block 7
	DEFPOS	002,$5d,$0,UNFLIPD			;block 8
	DEFPOS	002,$77,$0,UNFLIPD			;block 9
	DEFPOS	003,$fffd,$0,UNFLIPD			;block 10
	DEFPOS	003,$20,$0,UNFLIPD			;block 11
	DEFPOS	003,$44,$0,UNFLIPD			;block 12
	DEFPOS	003,$66,$0,UNFLIPD			;block 13
	DEFPOS	003,$89,$0,UNFLIPD			;block 14
	DEFPOS	004,$4,$0,UNFLIPD			;block 15
	DEFPOS	004,$3f,$0,UNFLIPD			;block 16
	DEFPOS	004,$7a,$0,UNFLIPD			;block 17
	DEFPOS	001,0,0,NONE				;block 18
	DEFPOS	001,0,0,NONE				;block 19
	DEFPOS	001,0,0,NONE				;block 20
	DEFPOS	005,$11,$22,NRMFLP			;block 21
	DEFPOS	005,$22,$22,NRMFLP			;block 22
	DEFPOS	005,$34,$22,NRMFLP			;block 23
	DEFPOS	005,$46,$22,NRMFLP			;block 24
	DEFPOS	005,$58,$22,NRMFLP			;block 25
	DEFPOS	005,$69,$22,NRMFLP			;block 26
	DEFPOS	005,$7a,$22,NRMFLP			;block 27
	DEFPOS	001,0,0,NONE				;block 28
	DEFPOS	006,$14,$1b,NRMFLP			;block 29
	DEFPOS	006,$2c,$1b,NRMFLP			;block 30
	DEFPOS	006,$45,$1b,NRMFLP			;block 31
	DEFPOS	006,$5d,$1b,NRMFLP			;block 32
	DEFPOS	006,$77,$1b,NRMFLP			;block 33
	DEFPOS	001,0,0,NONE				;block 34
	DEFPOS	007,$fffd,$16,NRMFLP			;block 35
	DEFPOS	007,$20,$16,NRMFLP			;block 36
	DEFPOS	007,$44,$16,NRMFLP			;block 37
	DEFPOS	007,$66,$16,NRMFLP			;block 38
	DEFPOS	007,$89,$16,NRMFLP			;block 39
	DEFPOS	008,$4,$a,NRMFLP			;block 40
	DEFPOS	008,$3f,$a,NRMFLP			;block 41
	DEFPOS	008,$7a,$a,NRMFLP			;block 42
	DEFPOS	001,0,0,NONE				;block 43
	DEFPOS	001,0,0,NONE				;block 44
	DEFPOS	001,0,0,NONE				;block 45
	DEFPOS	001,$22,$34,FLIPPED			;block 46
	DEFPOS	001,$34,$34,FLIPPED			;block 47
	DEFPOS	001,$46,$34,FLIPPED			;block 48
	DEFPOS	001,$58,$34,FLIPPED			;block 49
	DEFPOS	001,$69,$34,FLIPPED			;block 50
	DEFPOS	002,$14,$38,FLIPPED			;block 51
	DEFPOS	002,$2c,$38,FLIPPED			;block 52
	DEFPOS	002,$45,$38,FLIPPED			;block 53
	DEFPOS	002,$5d,$38,FLIPPED			;block 54
	DEFPOS	002,$77,$38,FLIPPED			;block 55
	DEFPOS	003,$fffd,$3c,FLIPPED			;block 56
	DEFPOS	003,$20,$3c,FLIPPED			;block 57
	DEFPOS	003,$44,$3c,FLIPPED			;block 58
	DEFPOS	003,$66,$3c,FLIPPED			;block 59
	DEFPOS	003,$89,$3c,FLIPPED			;block 60
	DEFPOS	004,$4,$46,FLIPPED			;block 61
	DEFPOS	004,$3f,$46,FLIPPED			;block 62
	DEFPOS	004,$7a,$46,FLIPPED			;block 63
	DEFPOS	001,0,0,NONE				;block 64
	DEFPOS	001,0,0,NONE				;block 65
	DEFPOS	001,0,0,NONE				;block 66

	ENDC

	IFD	dump
	incbin	"3dgame:graphics/misc/dump/Hydraulic.dump"
        ENDC

	incbin	"ram:output.bin"
	end


