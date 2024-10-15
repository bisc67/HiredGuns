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

********************************************************************************
**************** Blitter Object Routines - Macros & Strcutures *****************
********************************************************************************

****************************************************************************
;Bob structure format
;When calling the blit_bob routine a0 must point to a structure arranged like
;this.
		rsreset         ;bob structure
bob_address	rs.l    1	;address of image data
bob_width	rs.w	1       ;width in pixels (multiple of 16)
bob_height	rs.w	1       ;height in pixels
bob_mask	rs.w	1       ;plane for mask 0-5 (6=no mask)
bob_control	rs.b	1	;bit 1=flipped 2=ignore d5/d7 offset 3=random flip
bob_clip	rs.b	1	;0=clipping disabled 1=clipping enabled
bob_plane	rs.b	6	;0=no draw 1=copy 2=clear 3=set
bob_struct_size	rs.b	0

unflipped	equ     0
flipped		equ     1
random_flip	equ     2
no_mask		equ	6

ignored5d7	equ     1
clipping_off	equ	1
clipping_on	equ	1
no_draw		equ	0
copy		equ	1
clear           equ	2
set		equ	3
clear2          equ     4

;NOTE ON IMAGE DATA FORMAT
;The image data is arranged one bitplane after another. No extra columns of
;words are needed for blitter shifting so this should save memory and speed.
;E.g. A 3 plane bob with a mask would have the data arranged as such...
;
;       bitplane 1, bitplane 2, bitplane 3, mask
;
;The bytes of each bitplane are arranged in standard format of top left to
;bottom right.

********************************************************************************
;Text structure format
;When calling the blit_text routine a0 must point to a structure arranged like
;this.
		rsreset
text_address	rs.l	1	;address of image data
text_width	rs.w	1	;image width in pixels
text_height	rs.w	1	;image height in pixels
text_mask	rs.w	1	;plane for mask 0-5 (6=no mask)
text_planes	rs.w	1	;number of bitplanes (1-6, not inc mask)
text_spacing	rs.b	1	;0=fixed 1=proportional
text_clip	rs.b	1	;0=clipping disabled 1=clipping enabled
text_plane	rs.b	6	;0=no draw 1=copy 2=clear 3=set
text_widths	rs.b	140	;character widths
text_backs	rs.b	140	;character back kernings
text_struct_size
		rs.b	0

fixed		equ	0
proportional	equ     1

;Special character codes:
;	255 xh xl y	= set cursor position
;	254     	= newline
;	0		= end of text

RELPOS		equ	255	;move cursor along and down
NEWLINE		equ	254	;newline
ALIGN		equ	253	;align x to a word boundary (x=x AND $fff0)
CENTRE		equ	252	;line of text centre text
ABSPOS		equ	251	;set cursor to x(word) y(word)
SUPERSCRIPT	equ	250	;raise text by 1/3 font height
SUBSCRIPT	equ	249	;lower text by 1/3 font height
SETPEN		equ	248	;set pen colour (byte)
CENTREON	equ	247	;centre text around position
PHRASEBOOK	equ	246	;consult phrasebook
ENDPHRASE	equ	245	;end phrase book message
ENDTEXT		equ	0	;end of text

COL1		equ     1
COL2		equ     2
COL3		equ     3

PHRASE		MACRO
		dc.b	PHRASEBOOK,((\1>>8)&$ff),(\1&$ff)
		ENDM

********************************************************************************
;FORMAT:	BOB_INFO a,n,n,n,n,n,n,n,a
;PARAMETERS:	address of bitplanes (long)
;		bitplanes width in bytes (word)
;		bitplanes height in pixels (word)
;		number of bitplanes (word)
;               clipping window start x (word)
;               clipping window start y (word)
;               clipping window end x (word)
;               clipping window end y (word)
;		address of save & replace buffer (long)

BOB_INFO	macro
		movem.l	d0-d4/a0-a1,-(sp)
		move.l	\1,a0			;address of planes
		move.w	\3,d0			;plane height
		swap	d0
		move.w	\2,d0			;plane width in bytes
		move.w	\4,d1			;number of planes
		move.w	\6,d2			;window start y
                swap	d2
		move.w	\5,d2			;window start x
		move.w	\8,d3			;window end y
                swap	d3
		move.w	\7,d3			;window end x
;		move.l	\9,a1			;address of save&replace buffer
		jsr     bob_info
		movem.l	(sp)+,d0-d4/a0-a1
		endm

********************************************************************************
;FORMAT:	BOB_INFO n,n,n,n
;PARAMETERS:	clipping window start x (word)
;               clipping window start y (word)
;               clipping window end x (word)
;               clipping window end y (word)

BOB_WINDOW	macro
		move.w	\1,window_start_x
		move.w	\2,window_start_y
		move.w	\3,window_end_x
		move.w	\4,window_end_y
		endm

********************************************************************************
;FORMAT:	BLIT_BOB a,n,n
;PARAMETERS:	address of bob structure (long)
;		x position in pixels (word, origin is top left)
;		y position in pixels (word, origin is top left)
;		bob draw mode (byte, 0=draw 1=save & draw)

BLIT_BOB	macro
		movem.l	a0/d5-d7,-(sp)
		move.l	\1,a0
		move.w	\2,d5
		move.w	\3,d7
		move.w	\4,d6
		jsr	blit_bob
		movem.l	(sp)+,a0/d5-d7
		endm

********************************************************************************
;FORMAT:	BLIT_REPLACE
;PARAMETERS:    none

BLIT_REPLACE	macro
		jsr	blit_replace
		endm

********************************************************************************
;FORMAT:	BLIT_TEXT "t",a,n,n
;PARAMETERS:	text to display (bytes, eg "Hello World!")
;		address of text structure (long)
;		x position of text in pixels (word)
;		y position of text in pixels (word)

BLIT_MESSAGE	macro
		movem.l  a0-a1/d0-d7,-(sp)
		move.l	\2,a0			;address of text structure
		lea	.1\@,a1			;address of text
		move.w	\3,d5			;start x
		move.w	\4,d7                   ;start y
		jsr	blit_text
		movem.l  (sp)+,a0-a1/d0-d7
		bra.s	.2\@
.1\@		dc.b	\1,0
		even
.2\@
		endm

BLIT_TEXT	macro
		movem.l  a0-a1/d1-d7,-(sp)
		lea	\1,a1			;address of text
		move.l	\2,a0			;address of text structure
		move.l	\3,d5			;start x
		move.l	\4,d7                   ;start y
		jsr	blit_text
		movem.l  (sp)+,a0-a1/d1-d7
		endm

BLIT_TEXT2	macro
		movem.l	d1-d7/a0-a1,-(sp)
		lea	\1,a1			;address of text
		move.l	\2,a0			;address of text structure
		move.w	\3,d5			;start x
		move.w	\4,d7                   ;start y
		move.w	\5,d6
		jsr	blit_text
		movem.l	(sp)+,d1-d7/a0-a1
		endm

********************************************************************************
TEXT_COLOUR	macro
		IFNE	\6			;6th binary digit of colour
		move.b	#3,text_plane+0\1	;\1 = address of text structure
		ENDC
		IFEQ	\6
		move.b	#2,text_plane+0\1
		ENDC
		IFNE	\5			;5th binary digit of colour
		move.b	#3,text_plane+1\1
		ENDC
		IFEQ	\5
		move.b	#2,text_plane+1\1
		ENDC
		IFNE	\4			;4th binary digit of colour
		move.b	#3,text_plane+2\1
		ENDC
		IFEQ	\4
		move.b	#2,text_plane+2\1
		ENDC
		IFNE	\3			;3rd binary digit of colour
		move.b	#3,text_plane+3\1
		ENDC
		IFEQ	\3
		move.b	#2,text_plane+3\1
		ENDC
		IFNE	\2			;2nd binary digit of colour
		move.b	#3,text_plane+4\1
		ENDC
		IFEQ	\2
		move.b	#2,text_plane+4\1
		ENDC
		endm

DEF_STR		macro
.str\@s		dc.b	\1
.str\@e
		IFLE	\2-(.str\@e-.str\@s)
		fail    String too big!
		ENDC

		ds.b	\2-(.str\@e-.str\@s)
		endm

TEXT_ATTR	macro
		move.b	\6,text_plane+0\1
		move.b	\5,text_plane+1\1
		move.b	\4,text_plane+2\1
		move.b	\3,text_plane+3\1
		move.b	\2,text_plane+4\1
		endm

********************************************************************************
WAIT_BLIT	macro
		btst.b	#6,dmaconr(a6)		;do it twice for old blitters
.\@		;move.w	waitcol,color00(a6)
		btst.b	#6,dmaconr(a6)
		bne.s	.\@
		endm

********************************************************************************
BLIT_FILL	macro
                movem.l d0-d2/a1,-(sp)
		move.l	\1,a1			;address to be cleared
		move.w	\2,d0			;width to clear (in words)
		move.w	\3,d1			;height
		move.w	\4,d2			;num planes
		move.l	\5,d4			;modulo
		move.w	\6,d3			;fill
		jsr	blit_fill
                movem.l (sp)+,d0-d2/a1
		endm

****************************************************************************

	IFD	BLITQ

BLITQ_ADDW	MACRO
		movem.l	a0-a1/d0,-(sp)

		move.w	\1,d0
		lea	\2,a0
		jsr	blitq_add_word

		movem.l	(sp)+,a0-a1/d0
		ENDM

BLITQ_ADDL	MACRO
		movem.l	a0-a1/d0,-(sp)

		move.l	\1,d0
		lea	\2,a0
		jsr	blitq_add_long

		movem.l	(sp)+,a0-a1/d0
		ENDM

BLITQ_GO	MACRO
		btst.b	#6,dmaconr(a6)
		bne.s	.blitting\@
		jsr	blitq
.blitting\@
		ENDM

	ENDC

****************************************************************************
***************************** Macro Definitions ****************************
****************************************************************************
C_STOP		macro
		dc.w	$ffff,$fffe		;end copper
		endm

C_MOVE		macro
		dc.w	(\1)&$fffe,\2		;reg,value
		endm

C_WAIT		macro
		dc.w	(((\1)<<8)!(\2))!1,\3	;line,pixel,mask
		endm

C_LOOP		macro
		dc.w	(((\1)<<8)!(\2))!1,\3!1	;line,pixel,mask
		dc.w	copjmp1&$fffe,0		;reg,value
		endm

LO		equ	1
HI		equ     0

C_BANK		macro
		dc.w	bplcon3,(((\1)>>5)<<13)|((\2)<<9)
		endm

C_BANK_BB	macro
		dc.w	bplcon3,(((\1)>>5)<<13)|((\2)<<9)|%0000000000100000	;border blank on
		endm

C_SET24_QUICK	macro
		C_BANK_BB	\1,HI
		dc.w	$180+(((\1)&$1f)<<1),(((\2)>>4)<<8)|(((\3)>>4)<<4)|((\4)>>4)
		C_BANK_BB	\1,LO
		dc.w	$180+(((\1)&$1f)<<1),(((\2)&$f)<<8)|(((\3)&$f)<<4)|((\4)&$f)
		endm

C_SET24		macro
		C_BANK	\1,HI
		dc.w	$180+(((\1)&$1f)<<1),(((\2)>>4)<<8)|(((\3)>>4)<<4)|((\4)>>4)
		C_BANK	\1,LO
		dc.w	$180+(((\1)&$1f)<<1),(((\2)&$f)<<8)|(((\3)&$f)<<4)|((\4)&$f)
		C_BANK	\1,HI
		endm

C_SET24_BB	macro
		C_BANK_BB	\1,HI
		dc.w	$180+(((\1)&$1f)<<1),(((\2)>>4)<<8)|(((\3)>>4)<<4)|((\4)>>4)
		C_BANK_BB	\1,LO
		dc.w	$180+(((\1)&$1f)<<1),(((\2)&$f)<<8)|(((\3)&$f)<<4)|((\4)&$f)
		C_BANK_BB	\1,HI
		endm

C_SKY		macro
		C_BANK		32,HI
		C_MOVE	color22,0
		C_MOVE	color06,0
		C_BANK		32,LO
		C_MOVE	color06,0
		C_MOVE	color22,0
		C_BANK		0,HI
		C_MOVE	color22,0
		C_BANK		0,LO
		C_MOVE	color22,0
		endm

C_SKY4		macro
		C_WAIT	(\1+\2*4),0,$80fe
		C_SKY

		C_WAIT	(\1+\2*4+1),0,$fffe
		C_SKY

		C_WAIT	(\1+\2*4+2),0,$fffe
		C_SKY

		C_WAIT	(\1+\2*4+3),0,$fffe
		C_SKY
		C_BANK	0,HI
		endm

ERROR_COLOUR    macro
		move.w	d1,-(sp)
		move.w	\1,d1
		jsr	error_colour_quick
		move.w	(sp)+,d1
		endm

START_COPPER	macro
		move.l	d0,-(sp)
		move.l	\1,cop1lch(a6)			;address of copper
		move.w	copjmp1(a6),d0
		move.w	#%1000000010000000,dmacon(a6)	;copper dma on
		move.l	(sp)+,d0
		endm

GETKEY		MACRO
		move.l	d0,-(sp)
		move.b	last_key,d0
.no_new_key\@	cmp.b	last_key,d0
		beq.s	.no_new_key\@
		move.l	(sp)+,d0
		move.b	last_key,\1
		ENDM

SFX		macro
		movem.l	d0-d1/a1,-(sp)
		move.w	\1,d0
		IFGT	NARG-1
		move.b	\2,d1
		ENDC
		jsr	play_sfx
		movem.l	(sp)+,d0-d1/a1
		endm

MEMCPY		macro
		movem.l a0-a1/d0,-(sp)
		move.l	\1,a0
		move.l	\2,a1
		move.w	\3,d0
.loop\@		move.b	(a0)+,(a1)+
		dbf	d0,.loop\@
		movem.l (sp)+,a0-a1/d0
		endm

STRCPY		macro
		movem.l a0-a1/d0,-(sp)
		lea	.start\@,a0
		lea	\2,a1
		move.w	#((.end\@-.start\@))-1,d0
.loop\@		move.b	(a0)+,(a1)+
		dbf	d0,.loop\@
		movem.l (sp)+,a0-a1/d0
		bra.s	.end\@
.start\@	dc.b	\1,0
		even
.end\@
		endm

STRCPY2		macro
		movem.l a0-a1,-(sp)
		lea	\1,a0
		lea	\2,a1
.loop\@		move.b	(a0)+,(a1)+
		bne.s	.loop\@
		movem.l	(sp)+,a0-a1
		endm

STRCMP		macro
		movem.l a0-a1/d1,-(sp)
		moveq.l	#0,d0
		lea	\1,a0
		lea	\2,a1
.loop\@		move.b	(a0)+,d0
		beq.s	.equal\@
		cmp.b	(a1)+,d0
		beq.s	.loop\@
		moveq.l	#-1,d0
.equal\@	movem.l	(sp)+,a0-a1/d1
		endm

DEC_FITNESS 	macro
                moveq.l	#0,d0
                moveq.l	#0,d1
		move.w	\2,d0
                move.w	\1,d1
		sub.l	d1,d0
		bpl.s	.ok\@
		moveq.l	#0,d0
.ok\@           move.w	d0,\2
		endm

INC_FITNESS 	macro
                moveq.l	#0,d0
                moveq.l	#0,d1
		move.w	\2,d0
                move.w	\1,d1
		add.l	d1,d0
		cmpi.l	#65535,d0
		ble.s	.ok\@
		move.w	#65535,d0
.ok\@           move.w	d0,\2
		endm

TASKSWITCH	MACRO
		tst.l	os_kill
		bne.s	.dead\@
		jsr	temp_restore_system
		WAIT_VBLANK
		jsr	temp_take_system
.dead\@
		ENDM

********************************************************************************
*********************************** DOS macros *********************************
********************************************************************************

LOG_DISK	macro
		move.l	\1,d3				;disk number
		move.l	d3,d0
		move.l  \2,a2				;a2=disk buffer
		move.l	\3,d1				;next disk
		jsr	log_disk_code
		endm

LOG_DISK_COVERT	macro
		move.b	#"0",disk_number4
		add.b	\1,disk_number4

		movem.l	d0-d1/a2,-(sp)
		move.l  \2,a2				;a2=disk buffer

.retry\@	move.l	\1,d0				;disk number
		move.l	\3,d1				;next disk
		movem.l	d1/a2,-(sp)
		jsr	log_disk
		jsr	disk_error
		movem.l	(sp)+,d1/a2
		tst.l   d0
		bne.s	.retry\@
		movem.l	(sp)+,d0-d1/a2
		endm

LOG_DISK_QUIET	macro
		movem.l	d0-d1/a2,-(sp)
		move.l  \2,a2				;a2=disk buffer

.retry\@	move.l	\3,d1				;next disk
		move.l	\1,d0				;disk number
		movem.l	d1/a2,-(sp)
		jsr	log_disk
		movem.l	(sp)+,d1/a2
		tst.l   d0
		beq.s	.ok\@
		ERROR_COLOUR #$f00
		bra.s	.retry\@
.ok\@
		movem.l	(sp)+,d0-d1/a2
		endm

PRELOG_DISK	macro
		movem.l	d0-d1/a2,-(sp)
		move.l  \2,a2				;a2=disk buffer
		move.l	\1,d0				;disk number
		move.l	\3,d1				;next disk
		jsr	prelog_disk
		movem.l	(sp)+,d0-d1/a2
		endm

LOAD_FILE	macro
		movem.l	a0-a1,-(sp)

		lea	.file\@(pc),a0			;a0=filename
		move.l	\2,a1				;a1=file buffer (dest)
		jsr	load_file_quick
		bra.s	.ok\@

.file\@		dc.b	\1,0
		even
.ok\@
		movem.l	(sp)+,a0-a1
		endm

SAVE_FILE	macro
		movem.l	d0/a0-a1,-(sp)

.retry\@	lea	.file\@(pc),a0			;a0=filename
		move.l  \2,a1				;a1=file buffer (dest)
		move.l	\3,d3				;d3=length
		jsr	save_file
		jsr	disk_error
		tst.l	d0
		beq.s	.no_error\@
		tst.w	variables+file_mode(a5)
		bne	.no_error\@
		SHOW_MESG diskio_mesg_1
.no_error\@
		tst.l	d0
		bne.s	.retry\@
		bra.s	.ok\@

.file\@		dc.b	\1,0
		even
.ok\@
		movem.l	(sp)+,d0/a0-a1
		endm

LOAD_FILE2_TMP	macro
		movem.l	a0-a1,-(sp)

.retry\@	lea	\1,a0				;a0=filename
		move.l  \2,a1				;a1=file buffer (dest)
		movem.l	d1-d7/a0-a6,-(sp)
		jsr	load_file
		movem.l	(sp)+,d1-d7/a0-a6
		tst.w	d0
		beq.s	.no_error\@
		movem.l	d1-d7/a0-a6,-(sp)
                jsr	tmp_error
		movem.l	(sp)+,d1-d7/a0-a6
		bra.s	.retry\@
.no_error\@
		movem.l	(sp)+,a0-a1
		endm

LOAD_FILE_TMP	macro
		movem.l	a0-a1,-(sp)

.retry\@	lea	.file\@(pc),a0			;a0=filename
		move.l  \2,a1				;a1=file buffer (dest)
		movem.l	d1-d7/a0-a6,-(sp)
		jsr	load_file
		movem.l	(sp)+,d1-d7/a0-a6
		tst.l	d0
		beq.s	.no_error\@
		movem.l	d1-d7/a0-a6,-(sp)
                jsr	tmp_error
		movem.l	(sp)+,d1-d7/a0-a6
		bra.s	.retry\@
.no_error\@	bra.s	.ok\@

.file\@		dc.b	\1,0
		even
.ok\@
		movem.l	(sp)+,a0-a1
		endm

LOAD_FILE2	macro
		movem.l	a0-a1,-(sp)

		lea	\1,a0				;a0=filename
		move.l  \2,a1				;a1=file buffer (dest)
		jsr	load_file2_quick

		movem.l	(sp)+,a0-a1
		endm

LOAD_FILE_QUIET	macro
		movem.l	d0/a0-a1,-(sp)

.retry\@	lea	.file\@(pc),a0			;a0=filename
		move.l  \2,a1				;a1=file buffer (dest)
		jsr	load_file

		tst.l	d0
		beq.s	.ok\@
		ERROR_COLOUR #$f00
		bra.s	.retry\@

.file\@		dc.b	\1,0
		even
.ok\@
		movem.l	(sp)+,d0/a0-a1
		endm

RETSYS		MACRO
		jsr	restore_system
		move.l	stack_ptr,a7
		moveq.l	#-1,d0
		rts
		ENDM
