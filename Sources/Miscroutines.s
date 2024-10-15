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

*******************************************************************************
********************************* Blit a BOB **********************************
*******************************************************************************
;INPUT:		a0=address of bob structure (long)
;		a6=base address of hardware registers (long)
;		d5=x position in pixels (word, origin is top left)
;		d6=bob draw flags (word)
;			bit 0-5 = active bitplanes
;			bit 6   = force clipping on
;			bit 7   = force clipping off
;			bit 8   = if width<=8 then no extra word to shift into
;			bit 9   = force mask off
;			bit 10  = force set planes  (colour in d4.b)
;			bit 11  = unused
;			bit 12  = outline (colour in d4.b)
;		d7=y position in pixels (word, origin is top left)
;OUTPUT:	none
;CHANGES:	none

draw_bob	cmp.l	#$200000,bob_address(a0)
		blt.s	.in_chip
		bsr	cpu_bob
		rts
.in_chip	bsr	blit_bob
		rts


image_address	ds.l	1			;temporary storage
image_width	ds.w	1
image_height	ds.w	1
bob_plane_size	ds.w    1
source_modulo	ds.w	1
left_mask	ds.w	1
right_mask	ds.w	1
		even

		rsreset
blit_image_height	rs.w	1
blit_plane_size		rs.w    1
blit_source_modulo	rs.w	1
blit_left_mask		rs.w	1
blit_right_mask		rs.w	1
blit_outline		rs.b	1
blit_unused		rs.b	1
blit_vars_size		rs.b	0
blit_left_mask_data	rs.w	16
blit_right_mask_data	rs.w	16

blit_vars	ds.b	blit_vars_size
		dc.w	%1111111111111111		;left mask data
		dc.w	%0111111111111111
		dc.w	%0011111111111111
		dc.w	%0001111111111111
		dc.w	%0000111111111111
		dc.w	%0000011111111111
		dc.w	%0000001111111111
		dc.w	%0000000111111111
		dc.w	%0000000011111111
		dc.w	%0000000001111111
		dc.w	%0000000000111111
		dc.w	%0000000000011111
		dc.w	%0000000000001111
		dc.w	%0000000000000111
		dc.w	%0000000000000011
		dc.w	%0000000000000001

		dc.w	%1111111111111111		;right mask data
		dc.w	%1111111111111110
		dc.w	%1111111111111100
		dc.w	%1111111111111000
		dc.w	%1111111111110000
		dc.w	%1111111111100000
		dc.w	%1111111111000000
		dc.w	%1111111110000000
		dc.w	%1111111100000000
		dc.w	%1111111000000000
		dc.w	%1111110000000000
		dc.w	%1111100000000000
		dc.w	%1111000000000000
		dc.w	%1110000000000000
		dc.w	%1100000000000000
		dc.w	%1000000000000000

blit_bob
		btst.l	#12,d6			;outlined?
		beq.s	.no_outline

		bclr.l	#12,d6
		movem.l	d5/d7,-(sp)

		move.l	d4,-(sp)

		move.b	#6,d4
		bset.l	#10,d6

		subi.w	#1,d7
		bsr	.do_blit		;draw solid, shifted up

		move.l	(sp)+,d4

		bclr.l	#10,d6
		addi.w	#1,d7
		bsr	.do_blit  		;draw normal

;		subi.w	#1,d5
;		subi.w	#1,d7
;		bsr	.do_blit
;		addi.w	#2,d7
;		bsr	.do_blit

		movem.l	(sp)+,d5/d7
		rts
.no_outline

.do_blit	movem.l	d0-d7/a1-a4,-(sp)

		lea	blit_vars(pc),a1

		move.l	bob_address(a0),a3
		move.w	bob_width(a0),d0
		move.w	bob_height(a0),blit_image_height(a1)
		move.b	d4,blit_outline(a1)
		move.w	#0,blit_source_modulo(a1)
		move.w	#$ffff,blit_left_mask(a1)
		move.w	#$ffff,blit_right_mask(a1)

		cmpi.b	#random_flip,bob_control(a0)	;bob to be random flipped?
		bne.s	.no_rand_flip			;no, then branch
		move.b	vhposr+1(a6),bob_control(a0)
		andi.b	#%1,bob_control(a0)
.no_rand_flip

*******************************************************************************
;Clipping
;If clipping for this bob is enabled then the bob is clipped to the size of the
;current window. The left, top and bottom window edges are measured to a pixel
;resolution and the right edge must be on a word boundary. So it is possible to
;clip to a rectangle at 3,7 to 160,217 etc. No extra columns of words are
;needed on the screen nor any in the bob image data. The blitter' first and last
;word masks do all the hard work!
;Note that the right edge coord should be given as 16 intead of 15, 256 rather
;than 255 and so on.

		btst.l	#6,d6			;force clipping on?
		bne.s	.force_clip		;yes, then branch

		btst.l	#7,d6			;force clipping off?
		bne	.end_right_clip		;yes, then branch

		tst.b	bob_clip(a0)		;clipping enabled for this bob?
		beq	.end_right_clip		;no, then branch

.force_clip	cmpi.b	#flipped,bob_control(a0);bob flipped?
		bne.s	.clip			;no, then branch

;clip top of bob when flipped
		move.w	window_start_y(pc),d4
		sub.w	d7,d4			;d4=number of lines to clip
		ble.s	.end_top_flip_clip	;branch if no clip needed
		sub.w	d4,blit_image_height(a1);new height
		ble	.end_blit		;branch if all clipped away
.end_top_flip_clip

;clip bottom of bob when flipped
		move.w	window_end_y(pc),d4
		move.w	d7,d2
		add.w	blit_image_height(a1),d2;bottom edge position
		sub.w	d4,d2			;d2=number of lines to clip
		ble.s	.end_bot_flip_clip	;branch if no clip needed

		sub.w	d2,blit_image_height(a1);new height
		ble	.end_blit		;branch if all clipped away

		sub.w	d2,d7			;new y position
		move.w	d0,d4
		lsr.w	#3,d4			;width in bytes
		mulu.w	d4,d2
		add.w	d2,a3			;new address of image
.end_bot_flip_clip
		bra.s	.clip_left

;clip top of bob
.clip		move.w	window_start_y(pc),d4
		sub.w	d7,d4			;d4=number of lines to clip
		ble.s	.end_top_clip		;branch if no clip needed

		sub.w	d4,blit_image_height(a1);new height
		ble	.end_blit		;branch if all clipped away

		add.w	d4,d7			;new y position
		move.w	d0,d2
		lsr.w	#3,d2			;width in bytes
		mulu.w	d2,d4
		add.w	d4,a3			;new address of image
.end_top_clip

;clip bottom of bob
		move.w	window_end_y(pc),d4
		move.w	d7,d2
		add.w	blit_image_height(a1),d2;bottom edge position
		sub.w	d4,d2			;d2=number of lines to clip
		ble.s	.end_bot_clip		;branch if no clip needed

		sub.w	d2,blit_image_height(a1);new height
		ble	.end_blit		;branch if all clipped away
.end_bot_clip

;clip left of bob
.clip_left	move.w	window_start_x(pc),d4
		sub.w	d5,d4			;d4=number of pixels to clip
		ble.s	.end_left_clip		;branch if no clip needed

		move.w	d4,d2
		and.w	#$000f,d4		;pixels only please
		eor.w	d4,d2			;words only please

		sub.w	d2,d0			;new image width
		ble	.end_blit		;branch if all clipped away

		add.w   d2,d5			;new x position
		lsr.w	#3,d2			;number of bytes please
		add.w	d2,blit_source_modulo(a1);increment modulo
		add.w	d2,a3			;new image address

		lsl.w   #1,d4
		move.w	blit_left_mask_data(a1,d4.w),blit_left_mask(a1)
.end_left_clip

;clip right of bob
		move.w	window_end_x(pc),d4
		move.w	d5,d2
		add.w	d0,d2
		sub.w	d4,d2			;d2=number of pixels to clip
		ble.s	.end_right_clip		;branch if not clip needed

		move.w	d2,d3
		and.w	#$fff0,d2		;extract number of words to clip
		eor.w	d2,d3
		sub.w	d2,d0
		ble	.end_blit		;yes, then branch

		lsr.w	#3,d2
		add.w	d2,blit_source_modulo(a1);increment modulo

		tst.w	d3
		beq.s	.end_right_clip
		subi.w	#16,d0
		addi.w	#2,blit_source_modulo(a1)
		lsl.w   #1,d3
		move.w	blit_right_mask_data(a1,d3.w),blit_right_mask(a1)
.end_right_clip

*******************************************************************************
;Calculate bltcon1
;This calculates the pixel shift to right required to position the bob.
;Since the bob can have a negative x-co (off left of screen) after clipping to
;a boundary in the first 16 pixels in the screen, the coord has to be checked.
;If it is negative its pixel offset to the nearest word needs to be calculated.

		move.w	d5,d4
		bpl.s	.positive_xco		;is bob x-co off left of screen?
		addi.w	#16,d4			;horiz pixel offset

.positive_xco	and.w	#$000f,d4		;horiz pixel offset
		beq.s	.no_shift

		btst.l	#8,d6			;extra word disabled?
		bne.s	.no_shift		;yes, then branch
		addi.w	#16,d0
		subi.w	#2,blit_source_modulo(a1)
		cmpi.w	#$ffff,blit_right_mask(a1)
		bne.s	.cont
		clr.w	blit_right_mask(a1)
		bra.s	.cont

.no_shift	cmpi.w	#$ffff,blit_right_mask(a1)
		beq.s	.cont
		clr.w	blit_right_mask(a1)

.cont		eor.w	d4,d5			;in words please
		asr.w	#3,d5			;horiz byte offset
		ror.w	#4,d4			;d4=bltcon1

*******************************************************************************
;Calculate blit size
;The width and height of the bob are used to find the size of the blit. Again
;the width and height are taken from the temporary data since this may have
;been altered during the clipping process.

		move.w	blit_image_height(a1),d2	;height in lines
		lsl.w	#6,d2

		move.w	d0,d1
		lsr.w	#4,d1				;width in words

		or.w	d1,d2				;d2=blit size

*******************************************************************************
;Calculate destination modulo
;This calculates how many bytes the blitter is to skip after drawing each line
;of the bob. Since the bob can also be flipped vertically a modulo for the
;blitter drawing 'backwards' must be calculated.

		lsr.w	#3,d0			;width of image in bytes

		move.w	d7,d1			;fetch y screen position

		cmpi.b	#flipped,bob_control(a0);bob to be flipped?
		bne.s	.not_flipped

		neg.w	d0
		sub.w	plane_width(pc),d0	;d0=destination modulo
		add.w	bob_height(a0),d1	;increment y screen pos
		subq.w	#1,d1
		bra.s	.flipped

.not_flipped	sub.w	plane_width(pc),d0
		neg.w	d0
.flipped
        IFND	BLITQ
		WAIT_BLIT
		move.w	d0,bltcmod(a6)		;set destination mask modulo
		move.w	d0,bltdmod(a6)		;set output modulo
	ELSEIF
		BLITQ_ADDW d0,bltcmod(a6)
		BLITQ_ADDW d0,bltdmod(a6)
	ENDC

*******************************************************************************
;Calculate image destination address & number of planes to draw
;The yco is brought down from the previous routine (since the bob may be draw
;backwards from the bottom up) and used with the screen address to find the
;fist byte to draw to.

		move.l	plane_address(pc),a2
		mulu.w	plane_width(pc),d1
		add.w	d5,d1
		add.w	d1,a2			;a2=destination address

*******************************************************************************
;Calculate source data addresses
;The address of the image data is copied from the temporary data since this may
;have been altered during the clipping process. To find the address of the mask
;the size of the image data must be calculated since the mask should be the
;last plane in the data.

		move.w	bob_width(a0),d3
		lsr.w	#3,d3
		mulu.w	bob_height(a0),d3	;d3=image plane size

		move.w	d3,d0
		cmpi.w	#7,bob_mask(a0)
		bne.s	.not_mask_7
		mulu.w	#6,d0			;size of image data
		bra.s	.skip_not_mask_7
.not_mask_7
		mulu.w	bob_mask(a0),d0		;size of image data
.skip_not_mask_7
		lea	0(a3,d0.w),a4		;a4=address of mask

*******************************************************************************
;Wait for blitter ready and calculate bltcon0
;Control of what logical operations the blitter needs to do are calculated
;here. Only two states need be considered - is a mask to be used or not. If
;so then source A is used as the mask.

		move.w	d4,d5			;d5=shift on B

		or.w	#%0000111111001010,d4	;d4=bltcon0 (D=AB+*AC)

		btst.l	#9,d6
		bne.s	.mask_off

		cmpi.w	#7,bob_mask(a0)
		beq.s	.mask_on
		cmpi.w	#no_mask,bob_mask(a0)	;mask enabled?
		bne.s	.mask_on		;yes, then branch

.mask_off	and.w	#%1111011111111111,d4	;source A off
		suba.l	a4,a4
		move.w  #$ffff,bltadat(a6)	;force A to let thru all data
.mask_on

*******************************************************************************
;Set up constant blitter registers

		move.w	blit_left_mask(a1),bltafwm(a6)	;first word unmasked
		move.w	blit_right_mask(a1),bltalwm(a6)	;last word masked
		move.w	blit_source_modulo(a1),bltbmod(a6);set source modulo
		move.w	blit_source_modulo(a1),bltamod(a6);set mask modulo
		move.w	d5,bltcon1(a6)

*******************************************************************************
;Main drawing loop
;Each plane is drawn in turn as specified in the bob structure' plane controls.

DEF_PLANE	MACRO
		asr.b	#1,d0
		bcs.s	.set\@
		move.b	#clear,(a1)+
		bra.s	.skip\@
.set\@		move.b	#set,(a1)+
.skip\@
		ENDM


		move.b	blit_outline(a1),d0	;outline colour

		move.w	#5,d1			;d1=number of planes (6)
		lea	bob_plane(a0),a1	;start of plane controls

		btst.l	#10,d6			;set all planes?
		beq.s	.not_solid
                lea	solid_table(pc),a1
	REPT	6
		DEF_PLANE
	ENDR
		lea	solid_table(pc),a1
.not_solid

.next_plane
		move.b	(a1)+,d0
		beq	.no_draw		;draw this plane? no, then branch

		cmpi.b	#copy,d0
		bne	.not_copy
		WAIT_BLIT
		move.l	a3,bltbpth(a6)		;set source B address
		add.w	d3,a3
		btst.l	#0,d6			;plane active?
		beq	.no_draw		;yes, then branch
		or.w	#%0000010000000000,d4	;source B on
		move.w	d5,bltcon1(a6)
		move.w	d4,bltcon0(a6)		;set shift on A & minterm
		move.l	a4,bltapth(a6)		;set mask source address
		move.l	a2,bltcpth(a6)		;set mask destintion address
		move.l	a2,bltdpth(a6)		;set output address
		move.w	d2,bltsize(a6)		;start blit
		bra	.no_draw
.not_copy
		cmpi.b	#clear,d0
		bne	.not_clear
		btst.l	#0,d6			;plane active?
		beq	.no_draw		;yes, then branch
		WAIT_BLIT
		and.w	#%1111101111111111,d4	;source B off
		move.w	#0,bltcon1(a6)
		move.w  #0,bltbdat(a6)		;force B to let thru no data
		move.w	d4,bltcon0(a6)		;set shift on A & minterm
		move.l	a4,bltapth(a6)		;set mask source address
		move.l	a2,bltcpth(a6)		;set mask destintion address
		move.l	a2,bltdpth(a6)		;set output address
		move.w	d2,bltsize(a6)		;start blit
		bra	.no_draw
.not_clear
		cmpi.b	#clear2,d0
		bne	.not_clear2
		btst.l	#0,d6			;plane active?
		beq	.no_draw		;yes, then branch
		WAIT_BLIT
		and.w	#%1111101111111111,d4	;source B off
		move.w	#0,bltcon1(a6)
		move.w  #0,bltbdat(a6)		;force B to let thru no data
		move.w	d4,bltcon0(a6)		;set shift on A & minterm
		move.l	a4,bltapth(a6)		;set mask source address
		move.l	a2,bltcpth(a6)		;set mask destintion address
		move.l	a2,bltdpth(a6)		;set output address
		move.w	d2,bltsize(a6)		;start blit
		bra	.no_draw
.not_clear2
		btst.l	#0,d6			;plane active?
		beq	.no_draw		;yes, then branch
		WAIT_BLIT
		and.w	#%1111101111111111,d4	;source B off
		move.w	#0,bltcon1(a6)
		move.w  #$ffff,bltbdat(a6)	;force B to let thru all data
		move.w	d4,bltcon0(a6)		;set shift on A & minterm
		move.l	a4,bltapth(a6)		;set mask source address
		move.l	a2,bltcpth(a6)		;set mask destintion address
		move.l	a2,bltdpth(a6)		;set output address
		move.w	d2,bltsize(a6)		;start blit

.no_draw	lsr.w	#1,d6
		add.l	plane_size(pc),a2	;point to next plane
		dbf	d1,.next_plane		;do loop for all planes

.end_blit	movem.l	(sp)+,d0-d7/a1-a4
		rts

solid_table	ds.b	8

set_all_table	dc.b    set
		dc.b	clear
		dc.b	clear
		dc.b	clear
		dc.b	clear
		dc.b	clear
		dc.b	clear
		dc.b	clear

set_all_table2	dc.b    clear
		dc.b    set
		dc.b    set
		dc.b	clear
		dc.b	clear
		dc.b	clear
		dc.b	clear
		dc.b	clear

*******************************************************************************
***************************** Draw a BOB with cpu *****************************
*******************************************************************************
;INPUT:		a0=address of bob structure (long)
;		a6=base address of hardware registers (long)
;		d5=x position in pixels (word, origin is top left)
;		d6=bob draw flags (word)
;			bit 0-5 = active bitplanes
;			bit 6   = force clipping on
;			bit 7   = force clipping off
;			bit 10  = force set planes type 1
;			bit 11  = force set planes type 2
;		d7=y position in pixels (word, origin is top left)
;OUTPUT:	none
;CHANGES:	none

dest_modulo	ds.w	1
pixel_shift	ds.w	1
		even

cpu_bob		movem.l	d0-d7/a1-a5,-(sp)

		moveq.l	#0,d3			;initialise temp data
		moveq.l	#0,d4
		lea	bob_plane(a0),a5	;start of plane controls

		btst.l	#10,d6			;set all planes?
		beq.s	.no_set
                lea	set_all_table,a5
.no_set
		btst.l	#11,d6			;set all planes?
		beq.s	.no_set2
		lea	set_all_table2,a5
.no_set2
		move.l	bob_address(a0),image_address
		move.w	bob_width(a0),image_width
		move.w	bob_height(a0),image_height
		move.w	#-2,source_modulo
		move.w	#$ffff,left_mask
		move.w	#$ffff,right_mask

*******************************************************************************
;Clipping
;If clipping for this bob is enabled then the bob is clipped to the size of the
;current window. The left, top and bottom window edges are measured to a pixel
;resolution and the right edge must be on a word boundary. So it is possible to
;clip to a rectangle at 3,7 to 160,217 etc. No extra columns of words are
;needed on the screen nor any in the bob image data. The blitter' first and last
;word masks do all the hard work!
;Note that the right edge coord should be given as 16 intead of 15, 256 rather
;than 255 and so on.

		btst.l	#7,d6			;force clipping off?
		bne.s	cpu_no_clipping

		btst.l	#6,d6			;force clipping on?
		bne.s	.clip

		tst.b	bob_clip(a0)		;clipping enabled for this bob?
		beq.s	cpu_no_clipping		;no, then branch

.clip		bra	cpu_clip_top
cpu_ret_clip_top
		bra	cpu_clip_bottom
cpu_ret_clip_bottom
		bra	cpu_clip_right
cpu_ret_clip_right
		bra	cpu_clip_left
cpu_ret_clip_left

cpu_no_clipping

*******************************************************************************
;Calculate bltcon1
;This calculates the pixel shift to right required to position the bob.
;Since the bob can have a negative x-co (off left of screen) after clipping to
;a boundary in the first 16 pixels in the screen, the coord has to be checked.
;If it is negative its pixel offset to the nearest word needs to be calculated.

		move.w	d5,d3
		bmi.s	.negative_xco		;is bob x-co off left of screen?
		and.w	#$000f,d3		;horiz pixel offset
		bra.s	.positive_xco

.negative_xco	addi.w	#16,d3			;horiz pixel offset
.positive_xco	and.w	#$fff0,d5		;in words please
		asr.w	#3,d5			;horiz byte offset

		move.w	d3,pixel_shift

*******************************************************************************
;Calculate source data addresses
;The address of the image data is copied from the temporary data since this may
;have been altered during the clipping process. To find the address of the mask
;the size of the image data must be calculated since the mask should be the
;last plane in the data.

		move.w	bob_width(a0),d1
		lsr.w	#3,d1
		mulu.w	bob_height(a0),d1
		move.w	d1,bob_plane_size

		cmp.w	#7,bob_mask(a0)
		bne.s	.not_mask_7
		mulu.w	#6,d1
		bra.s	.skip_not_mask_7
.not_mask_7
		mulu.w	bob_mask(a0),d1		;size of image data
.skip_not_mask_7
		move.l	image_address,a3	;a3=address of image
		lea	0(a3,d1.w),a4		;a4=address of mask

*******************************************************************************
;Calculate destination modulo
;This calculates how many bytes the blitter is to skip after drawing each line
;of the bob. Since the bob can also be flipped vertically a modulo for the
;blitter drawing 'backwards' must be calculated.

		move.w	image_width,d0
		lsr.w	#3,d0
		addq.w	#2,d0			;width of image in bytes

		move.w	d7,d1			;fetch y screen position

		cmpi.b	#flipped,bob_control(a0);bob to be flipped?
		bne.s	.not_flipped

		neg.w	d0
		sub.w	plane_width,d0		;d0=destination modulo
		add.w	bob_height(a0),d1	;increment y screen pos
		subq.w	#1,d1
		bra.s	.flipped

.not_flipped	sub.w	plane_width,d0
		neg.w	d0			;d0=destination modulo
.flipped
		move.w	d0,dest_modulo

*******************************************************************************
;Calculate image destination address & number of planes to draw
;The yco is brought down from the previous routine (since the bob may be draw
;backwards from the bottom up) and used with the screen address to find the
;fist byte to draw to. The number of planes is read from the bob structure.

		mulu.w	plane_width,d1
		add.w	d5,d1
		move.l	plane_address,a2
		lea	0(a2,d1.w),a2		;a2=destination address

*******************************************************************************
;Set up constant registers
		subi.w	#1,image_height
		move.w	image_width,d2
		lsr.w	#4,d2			;width in words
		subq.l	#1,d2
		move.w	d2,image_width
		addi.w	#2,source_modulo
		addi.w	#2,dest_modulo

		move.w	#5,d1			;d1=number of planes (6)

		cmpi.w	#7,bob_mask(a0)	;mask enabled?
		beq.s	.use_mask		;yes, then branch
		cmpi.w	#no_mask,bob_mask(a0)	;mask enabled?
		bne.s	.use_mask		;yes, then branch

		tst.w	pixel_shift
		beq	draw_unmasked_unshifted
		bra	draw_unmasked_shifted

.use_mask	tst.w	pixel_shift
		beq	draw_masked_unshifted
		bra	draw_masked_shifted

*******************************************************************************
*******************************************************************************
;Main drawing loop
;Each plane is drawn in turn as specified in the bob structure' plane controls.

draw_masked_unshifted
.next_plane	tst.b	(a5)			;draw this plane?
		beq.s	.no_draw		;no, then branch

		cmp.b	#copy,(a5)
		beq.s	.cpu_copy
		cmp.b	#clear,(a5)
		beq.s	.cpu_clear
		cmp.b	#set,(a5)
		beq	.cpu_set
		bra.s	.no_draw

.ret_draw
.no_draw	lsr.w	#1,d6

		add.l	plane_size,a2		;point to next plane
		lea	1(a5),a5		;point next plane control
		dbf	d1,.next_plane		;do loop for all planes

		movem.l	(sp)+,d0-d7/a1-a5
		rts

*******************************************************************************
.cpu_copy
		btst.l	#0,d6			;plane active?
		beq	.ret_draw		;no, then branch

		movem.l	a2-a4,-(sp)

		move.w	image_height,d0

.copy_hloop	move.w	image_width,d3

.copy_wloop	move.w	(a3)+,d2		;get source B word
		move.w	(a4)+,d4		;get mask
;		and.w	d4,d2			;AND source with mask
		not.w	d4
		and.w	d4,(a2)			;clear destination
		or.w	d2,(a2)+		;write to destination
		dbf	d3,.copy_wloop

		add.w	source_modulo,a3
		add.w	source_modulo,a4
		add.w	dest_modulo,a2

		dbf	d0,.copy_hloop

		movem.l	(sp)+,a2-a4
		adda.w	bob_plane_size,a3	;point to next plane in image
		bra	.ret_draw

*******************************************************************************
.cpu_clear
		btst.l	#0,d6			;plane active?
		beq	.ret_draw		;no, then branch

		movem.l	a2-a4,-(sp)

		move.w	image_height,d0

.clear_hloop	move.w	image_width,d3

.clear_wloop	move.w	(a4)+,d4		;get mask
		not.w	d4
		and.w	d4,(a2)+		;clear destination
		dbf	d3,.clear_wloop

		add.w	source_modulo,a4
		add.w	dest_modulo,a2

		dbf	d0,.clear_hloop

		movem.l	(sp)+,a2-a4
		bra	.ret_draw

*******************************************************************************
.cpu_set
		btst.l	#0,d6			;plane active?
		beq	.ret_draw		;no, then branch

		movem.l	a2-a4,-(sp)

		move.w	image_height,d0

.set_hloop	move.w	image_width,d3

.set_wloop	move.w	(a4)+,d4
		or.w	d4,(a2)+		;set destination
		dbf	d3,.set_wloop

		add.w	source_modulo,a4
		add.w	dest_modulo,a2

		dbf	d0,.set_hloop

		movem.l	(sp)+,a2-a4
		bra	.ret_draw

*******************************************************************************
*******************************************************************************
;Main drawing loop
;Each plane is drawn in turn as specified in the bob structure' plane controls.

draw_masked_shifted
		subi.w	#2,dest_modulo

.next_plane	tst.b	(a5)			;draw this plane?
		beq.s	.no_draw		;no, then branch

		cmp.b	#copy,(a5)
		beq.s	.cpu_copy
		cmp.b	#clear,(a5)
		beq	.cpu_clear
		cmp.b	#set,(a5)
		beq	.cpu_set
		bra.s	.no_draw

.ret_draw
.no_draw	lsr.w	#1,d6

		add.l	plane_size,a2		;point to next plane
		lea	1(a5),a5		;point next plane control
		dbf	d1,.next_plane		;do loop for all planes

		movem.l	(sp)+,d0-d7/a1-a5
		rts

*******************************************************************************
.cpu_copy
		btst.l	#0,d6			;plane active?
		beq	.ret_draw		;no, then branch

		movem.l	d1/a1-a4,-(sp)

		move.w	image_height,d0
		move.w	pixel_shift,d1

.copy_hloop	moveq.l	#0,d2
		moveq.l	#0,d7
		move.w	image_width,d3
		bne.s	.copy_wider_than_16

		move.w	(a3)+,d2		;get source B word
		move.l	d2,d4
		swap	d2
		lsr.l	d1,d4
		move.w	(a4)+,d7		;get mask
		and.w	left_mask,d7
		and.w	right_mask,d7
		move.l	d7,d5
		swap	d7
		lsr.l	d1,d5

		and.w	d5,d4			;AND source with mask
		not.w	d5
		and.w	d5,(a2)			;clear destination
		or.w	d4,(a2)+		;write to destination

		bra.s	.last_word_cpu_copy
.copy_wider_than_16

		move.w	(a3)+,d2		;get source B word
		move.l	d2,d4
		swap	d2
		lsr.l	d1,d4
		move.w	(a4)+,d7		;get mask
		and.w	left_mask,d7
		move.l	d7,d5
		swap	d7
		lsr.l	d1,d5

		and.w	d5,d4			;AND source with mask
		not.w	d5
		and.w	d5,(a2)			;clear destination
		or.w	d4,(a2)+		;write to destination

		subq.w	#2,d3
		bmi.s	.second_last_word_cpu_copy
.copy_wloop
		move.w	(a3)+,d2		;get source B word
		move.l	d2,d4
		swap	d2
		lsr.l	d1,d4
		move.w	(a4)+,d7		;get mask
		move.l	d7,d5
		swap	d7
		lsr.l	d1,d5

		and.w	d5,d4			;AND source with mask
		not.w	d5
		and.w	d5,(a2)			;clear destination
		or.w	d4,(a2)+		;write to destination

		dbf	d3,.copy_wloop

.second_last_word_cpu_copy
		move.w	(a3)+,d2		;get source B word
		move.l	d2,d4
		swap	d2
		lsr.l	d1,d4
		move.w	(a4)+,d7		;get mask
		and.w	right_mask,d7
		move.l	d7,d5
		swap	d7
		lsr.l	d1,d5

		and.w	d5,d4			;AND source with mask
		not.w	d5
		and.w	d5,(a2)			;clear destination
		or.w	d4,(a2)+		;write to destination

.last_word_cpu_copy
		lsr.l	d1,d2
		clr.w	d7
		lsr.l	d1,d7

		and.w	d7,d2			;AND source with mask
		not.w	d7
		and.w	d7,(a2)			;clear destination
		or.w	d2,(a2)+		;write to destination

		add.w	source_modulo,a3
		add.w	source_modulo,a4
		add.w	dest_modulo,a2

		dbf	d0,.copy_hloop

		movem.l	(sp)+,d1/a1-a4
		adda.w	bob_plane_size,a3	;point to next plane in image
		bra	.ret_draw

*******************************************************************************
.cpu_clear
		btst.l	#0,d6			;plane active?
		beq	.ret_draw		;no, then branch

		movem.l	d1/a1-a4,-(sp)

		move.w	image_height,d0
		move.w	pixel_shift,d1

.clear_hloop
		moveq.l	#0,d7
		move.w	image_width,d3
		bne.s	.clear_wider_than_16

		move.w	(a4)+,d7		;get mask
		and.w	left_mask,d7
		and.w	right_mask,d7
		move.l	d7,d5
		swap	d7
		lsr.l	d1,d5

		not.w	d5
		and.w	d5,(a2)+		;clear destination

		bra.s	.last_word_cpu_clear
.clear_wider_than_16

		move.w	(a4)+,d7		;get mask
		and.w	left_mask,d7
		move.l	d7,d5
		swap	d7
		lsr.l	d1,d5

		not.w	d5
		and.w	d5,(a2)+		;clear destination

		subq.w	#2,d3
		bmi.s	.second_last_word_cpu_clear
.clear_wloop
		move.w	(a4)+,d7		;get mask
		move.l	d7,d5
		swap	d7
		lsr.l	d1,d5

		not.w	d5
		and.w	d5,(a2)+		;clear destination

		dbf	d3,.clear_wloop

.second_last_word_cpu_clear
		move.w	(a4)+,d7		;get mask
		and.w	right_mask,d7
		move.l	d7,d5
		swap	d7
		lsr.l	d1,d5

		not.w	d5
		and.w	d5,(a2)+		;clear destination

.last_word_cpu_clear
		clr.w	d7
		lsr.l	d1,d7

		not.w	d7
		and.w	d7,(a2)+		;clear destination

		add.w	source_modulo,a4
		add.w	dest_modulo,a2

		dbf	d0,.clear_hloop

		movem.l	(sp)+,d1/a1-a4
		bra	.ret_draw

*******************************************************************************
*******************************************************************************

.cpu_set	btst.l	#0,d6			;plane active?
		beq	.ret_draw		;no, then branch

		movem.l	d1/a1-a4,-(sp)

		move.w	image_height,d0
		move.w	pixel_shift,d1

.set_hloop	moveq.l	#0,d7
		move.w	image_width,d3
		bne.s	.set_wider_than_16

		move.w	(a4)+,d7		;get mask
		and.w	left_mask,d7
		and.w	right_mask,d7
		move.l	d7,d5
		swap	d7
		lsr.l	d1,d5

		or.w	d5,(a2)+		;clear destination

		bra.s	.last_word_cpu_set
.set_wider_than_16

		move.w	(a4)+,d7		;get mask
		and.w	left_mask,d7
		move.l	d7,d5
		swap	d7
		lsr.l	d1,d5

		or.w	d5,(a2)+		;clear destination

		subq.w	#2,d3
		bmi.s	.second_last_word_cpu_set
.set_wloop
		move.w	(a4)+,d7		;get mask
		move.l	d7,d5
		swap	d7
		lsr.l	d1,d5

		or.w	d5,(a2)+		;clear destination

		dbf	d3,.set_wloop

.second_last_word_cpu_set
		move.w	(a4)+,d7		;get mask
		and.w	right_mask,d7
		move.l	d7,d5
		swap	d7
		lsr.l	d1,d5

		or.w	d5,(a2)+		;clear destination

.last_word_cpu_set
		clr.w	d7
		lsr.l	d1,d7

		or.w	d7,(a2)+		;clear destination

		add.w	source_modulo,a4
		add.w	dest_modulo,a2

		dbf	d0,.set_hloop

		movem.l	(sp)+,d1/a1-a4
		bra	.ret_draw


*******************************************************************************
*******************************************************************************
;Main drawing loop
;Each plane is drawn in turn as specified in the bob structure' plane controls.

draw_unmasked_unshifted
.next_plane	tst.b	(a5)			;draw this plane?
		beq.s	.no_draw		;no, then branch

		cmp.b	#copy,(a5)
		beq.s	.cpu_copy
		cmp.b	#clear,(a5)
		beq.s	.cpu_clear
		cmp.b	#set,(a5)
		beq	.cpu_set
		bra.s	.no_draw

.ret_draw	adda.w	bob_plane_size,a3	;point to next plane in image
.no_draw	lsr.w	#1,d6

		add.l	plane_size,a2		;point to next plane
		lea	1(a5),a5		;point next plane control
		dbf	d1,.next_plane		;do loop for all planes

		movem.l	(sp)+,d0-d7/a1-a5
		rts

*******************************************************************************
.cpu_copy
		btst.l	#0,d6			;plane active?
		beq	.ret_draw		;no, then branch

		movem.l	a2-a4,-(sp)

		move.w	image_height,d0

.copy_hloop	move.w	image_width,d3

.copy_wloop	move.w	(a3)+,(a2)+		;write to destination
		dbf	d3,.copy_wloop

		add.w	dest_modulo,a2
		add.w	source_modulo,a3
		dbf	d0,.copy_hloop

		movem.l	(sp)+,a2-a4
		bra	.ret_draw

*******************************************************************************
.cpu_clear
		btst.l	#0,d6			;plane active?
		beq	.ret_draw		;no, then branch

		movem.l	a2-a4,-(sp)

		move.w	image_height,d0

.clear_hloop	move.w	image_width,d3

.clear_wloop	clr.w	(a2)+			;clear destination
		dbf	d3,.clear_wloop

		add.w	dest_modulo,a2
		dbf	d0,.clear_hloop

		movem.l	(sp)+,a2-a4
		bra	.ret_draw

*******************************************************************************
.cpu_set
		btst.l	#0,d6			;plane active?
		beq	.ret_draw		;no, then branch

		movem.l	a2-a4,-(sp)

		move.w	image_height,d0
		move.w	#-1,d4

.set_hloop	move.w	image_width,d3

.set_wloop	move.w	d4,(a2)+		;set destination
		dbf	d3,.set_wloop

		add.w	dest_modulo,a2

		dbf	d0,.set_hloop

		movem.l	(sp)+,a2-a4
		bra	.ret_draw

*******************************************************************************
*******************************************************************************
;Main drawing loop
;Each plane is drawn in turn as specified in the bob structure' plane controls.

draw_unmasked_shifted
		subi.w	#2,dest_modulo

.next_plane	tst.b	(a5)			;draw this plane?
		beq.s	.no_draw		;no, then branch

		cmp.b	#copy,(a5)
		beq.s	.cpu_copy
		cmp.b	#clear,(a5)
		beq	.cpu_clear
		cmp.b	#set,(a5)
		beq	.cpu_set
		bra.s	.no_draw

.ret_draw	adda.w	bob_plane_size,a3	;point to next plane in image
.no_draw	lsr.w	#1,d6

		add.l	plane_size,a2		;point to next plane
		lea	1(a5),a5		;point next plane control
		dbf	d1,.next_plane		;do loop for all planes

		movem.l	(sp)+,d0-d7/a1-a5
		rts

*******************************************************************************
.cpu_copy
		btst.l	#0,d6			;plane active?
		beq	.ret_draw		;no, then branch

		movem.l	d1/a2-a4,-(sp)

		move.w	image_height,d0
		move.w	pixel_shift,d1

.copy_hloop	move.w	image_width,d3
		moveq.l	#0,d2
		moveq.l	#0,d7

.copy_wloop	move.w	(a3)+,d2		;get source B word
		move.l	d2,d4
		swap	d2
		lsr.l	d1,d4

		move.w	#-1,d7			;get mask
		move.l	d7,d5
		swap	d7
		lsr.l	d1,d5

		and.w	d5,d4			;AND source with mask
		not.w	d5
		and.w	d5,(a2)			;clear destination
		or.w	d4,(a2)+		;write to destination
		dbf	d3,.copy_wloop

		lsr.l	d1,d2
		clr.w	d7
		lsr.l	d1,d7

		and.w	d7,d2			;AND source with mask
		not.w	d7
		and.w	d7,(a2)			;clear destination
		or.w	d2,(a2)+		;write to destination

		add.w	source_modulo,a3
		add.w	dest_modulo,a2

		dbf	d0,.copy_hloop

		movem.l	(sp)+,d1/a2-a4
		bra	.ret_draw

*******************************************************************************
.cpu_clear
		btst.l	#0,d6			;plane active?
		beq	.ret_draw		;no, then branch

		movem.l	d1/a2-a4,-(sp)

		move.w	image_height,d0
		move.w	pixel_shift,d1

.clear_hloop	move.w	image_width,d3

		moveq.l	#0,d7

.clear_wloop	move.w	#-1,d7			;get mask
		move.l	d7,d5
		swap	d7
		lsr.l	d1,d5

		not.w	d5
		and.w	d5,(a2)+		;clear destination
		dbf	d3,.clear_wloop

		clr.w	d7
		lsr.l	d1,d7
		not.w	d7
		and.w	d7,(a2)+		;clear destination

		add.w	dest_modulo,a2

		dbf	d0,.clear_hloop

		movem.l	(sp)+,d1/a2-a4
		bra	.ret_draw

*******************************************************************************
.cpu_set
		btst.l	#0,d6			;plane active?
		beq	.ret_draw		;no, then branch

		movem.l	d1/a2-a4,-(sp)

		move.w	image_height,d0
		move.w	pixel_shift,d1

.set_hloop	move.w	image_width,d3

		moveq.l	#0,d2
		moveq.l	#0,d7

.set_wloop	move.w	#-1,d7			;get mask
		move.l	d7,d5
		swap	d7
		lsr.l	d1,d5

		or.w	d5,(a2)+		;set destination
		dbf	d3,.set_wloop

		clr.w	d7
		lsr.l	d1,d7

		or.w	d7,(a2)+		;set destination

		add.w	dest_modulo,a2

		dbf	d0,.set_hloop

		movem.l	(sp)+,d1/a2-a4
		bra	.ret_draw

*******************************************************************************
*******************************************************************************
cpu_clip_top	move.w	window_start_y,d4
		sub.w	d7,d4			;d4=number of lines to clip
		bpl	.clip			;branch if clip needed
		bra	cpu_ret_clip_top

.clip		cmpi.b	#flipped,bob_control(a0);bob flipped?
		beq.s	.flipped_clip

		sub.w	d4,image_height		;new height
		ble	end			;branch if all clipped away

		add.w	d4,d7			;new y position
		move.w	image_width,d2
		lsr.w	#3,d2			;width in bytes
		mulu.w	d2,d4
		ext.l	d4
		add.l	d4,image_address	;new address of image
		bra     cpu_ret_clip_top


.flipped_clip	sub.w	d4,image_height		;new height
		ble	end			;branch if all clipped away
		bra     cpu_ret_clip_top

*******************************************************************************
cpu_clip_bottom	move.w	window_end_y,d4
		move.w	d7,d2
		add.w	image_height,d2		;bottom edge position
		sub.w	d4,d2			;d2=number of lines to clip
		bpl	.clip			;branch if clip needed
		bra	cpu_ret_clip_bottom

.clip		cmpi.b	#flipped,bob_control(a0);bob flipped?
		beq.s	.flipped_clip

		sub.w	d2,image_height		;new height
		ble	end			;branch if all clipped away
		bra	cpu_ret_clip_bottom


.flipped_clip	sub.w	d2,image_height		;new height
		ble	end			;branch if all clipped away

		sub.w	d2,d7			;new y position
		move.w	image_width,d4
		lsr.w	#3,d4			;width in bytes
		mulu.w	d4,d2
		ext.l	d2
		add.l	d2,image_address	;new address of image
		bra	cpu_ret_clip_bottom

*******************************************************************************
cpu_clip_left
		move.w	window_start_x,d4
		sub.w	d5,d4			;d4=number of pixels to clip
		bpl	.clip			;branch if clip needed
		bra	cpu_ret_clip_left

.clip		move.w	d4,d2
		and.w	#$000f,d4		;pixels only please
		and.w	#$fff0,d2		;words only please
		beq.s	.no_word_clip		;branch if no words to clip

		sub.w	d2,image_width		;new image width
		ble	end			;branch if all clipped away

		add.w   d2,d5			;new x position
		lsr.w	#3,d2			;number of bytes please
		add.w	d2,source_modulo        ;increment modulo
		ext.l	d2
		add.l	d2,image_address	;new image address

.no_word_clip	tst.w	d4			;any pixels to clip?
		beq	cpu_ret_clip_left	;no, then branch
		lea	.mask_data,a2
		lsl.w   #1,d4
		move.w	0(a2,d4.w),left_mask
		bra     cpu_ret_clip_left

.mask_data	dc.w	%1111111111111111
		dc.w	%0111111111111111
		dc.w	%0011111111111111
		dc.w	%0001111111111111
		dc.w	%0000111111111111
		dc.w	%0000011111111111
		dc.w	%0000001111111111
		dc.w	%0000000111111111
		dc.w	%0000000011111111
		dc.w	%0000000001111111
		dc.w	%0000000000111111
		dc.w	%0000000000011111
		dc.w	%0000000000001111
		dc.w	%0000000000000111
		dc.w	%0000000000000011
		dc.w	%0000000000000001
		dc.w	%0000000000000000

end		movem.l	(sp)+,d0-d7/a1-a5
		rts

*******************************************************************************
cpu_clip_right
		move.w	window_end_x,d4
		move.w	d5,d2
		add.w	image_width,d2
		sub.w	d4,d2			;d2=number of pixels to clip
		bgt	.clip			;branch if clip needed
		bra	cpu_ret_clip_right

.clip		move.w	d2,d3
		and.w	#$fff0,d2		;extract number of words to clip

		sub.w	d2,d3
		sub.w	d2,image_width
		ble	end			;yes, then branch

		lsr.w	#3,d2
		add.w	d2,source_modulo        ;increment modulo

		tst.w	d3			;any pixels to clip?
		beq 	cpu_ret_clip_right	;no, then branch
;		subi.w	#16,image_width
;		beq	end			;yes, then branch
;		addi.w	#2,source_modulo
		lea	.mask_data,a2
		lsl.w   #1,d3
		move.w	0(a2,d3.w),right_mask	;get mask value
		bra	cpu_ret_clip_right

.mask_data
		dc.w	%1111111111111111
		dc.w	%1111111111111110
		dc.w	%1111111111111100
		dc.w	%1111111111111000
		dc.w	%1111111111110000
		dc.w	%1111111111100000
		dc.w	%1111111111000000
		dc.w	%1111111110000000
		dc.w	%1111111100000000
		dc.w	%1111111000000000
		dc.w	%1111110000000000
		dc.w	%1111100000000000
		dc.w	%1111000000000000
		dc.w	%1110000000000000
		dc.w	%1100000000000000
		dc.w	%1000000000000000
		dc.w	%0000000000000000

*******************************************************************************
************************* Describe Bitplanes & Window *************************
*******************************************************************************
;Initialise screen and window descriptions for bob routines.
;MACRO:		BOB_INFO a,n,n,n,n,n,n,n,a
;INPUT:         a0=address of bitplanes (long)
;		a1=address of save & replace buffer (long)
;		d0=	lo word = plane width in bytes
;			hi word = plane height in lines
;		d1=number of bitplanes (word)
;		d2=top left position of window (word)
;			lo word = window start x
;			hi word = window start y
;		d3=width and height of window (word)
;			lo word = window end x
;			hi word = window end y
;OUTPUT:	none
;CHANGES:	none

bob_info	movem.l	d0-d4,-(sp)

		move.l	a0,plane_address
		move.w	d1,num_planes

		move.w	d0,plane_width
		move.w	d0,d4
		swap	d0
		mulu	d0,d4
		move.l	d4,plane_size

		move.w	d2,window_start_x
		swap	d2
		move.w	d2,window_start_y

		move.w	d3,window_end_x
		swap	d3
		move.w	d3,window_end_y

		move.l	a1,replace_address

		movem.l	(sp)+,d0-d4
		rts

plane_address	ds.l    1
plane_width	ds.w    1
plane_size	ds.l    1
num_planes	ds.w	1
window_start_x	ds.w	1
window_start_y	ds.w    1
window_end_x	ds.w    1
window_end_y	ds.w    1
replace_address	ds.l    1

*******************************************************************************
****************************** Blit Clear Memory ******************************
*******************************************************************************
;Blit clear an area of memory.
;INPUT:		d0=width in words of area to clear (word)
;		d1=height in lines of area to clear (word)
;		d2=number of planes to clear (word)
;		d3=word to fill with (word)
;		d4=modulo (long)
;	        a1=start address of memory to clear (long)
;		a6=base address of hardware registers (long)
;OUTPUT:	none
;CHANGES:       none

blit_fill	movem.l	d0-d2/a1,-(sp)

		subi.w	#1,d2

		WAIT_BLIT
		move.w	#$ffff,bltalwm(a6)
		move.w	#$ffff,bltafwm(a6)
		move.w	d3,bltadat(a6)
		move.w	#0,bltdmod(a6)
		move.w	#%0000000111110000,bltcon0(a6)
		move.w	#%0000000000000000,bltcon1(a6)

		andi.w	#$3f,d0
		andi.w	#$3ff,d1

		lsl.w	#6,d1
		or.w	d1,d0			;d0=blit size

.loop		WAIT_BLIT
		move.l	a1,bltdpt(a6)
		move.w	d0,bltsize(a6)		;start blit

		add.l	d4,a1
		dbf	d2,.loop

		movem.l	(sp)+,d0-d2/a1
		rts

*******************************************************************************
***************************** Blitter text Routine ****************************
*******************************************************************************
;INPUT:		a0=address of text structure (long)
;		a1=address of text (long)
;		d5=x position in pixels (word, origin is top left)
;		d7=y position in pixels (word, origin is top left)
;		a6=base address of hardware registers (long)
;OUTPUT:	none
;CHANGES:       none

scale		dc.w    1
yoffset		dc.w	0

blit_text	movem.l	d0-d7/a0-a3,-(sp)

		lea	lastphrase_stack,a2
		move.l	a2,lastphrase

		lea	text_bob_structure,a2

		lea	(a0),a3
		move.l	text_address(a0),d2
		move.w	text_width(a0),d3

		move.l	text_address(a3),bob_address(a2)
		move.w	text_width(a3),bob_width(a2)
		move.w	text_height(a3),bob_height(a2)
		move.w	text_mask(a3),bob_mask(a2)
		move.b  #0,bob_control(a2)
		move.b  text_clip(a3),bob_clip(a2)
		move.w	text_plane(a3),bob_plane(a2)
		move.w	text_plane+2(a3),bob_plane+2(a2)
		move.w	text_plane+4(a3),bob_plane+4(a2)

		tst.b	text_spacing(a3)	;proportional spacing?
		beq.s	.not_prop
                moveq.l	#0,d3

.not_prop	moveq.l	#0,d1
		move.w	text_width(a3),d1
		lsr.w	#3,d1
		mulu.w	text_height(a3),d1
		mulu.w	text_planes(a3),d1
		lea	(a2),a0

.loop		move.b	(a1)+,d0		;get next char
		tst.b	d0
		beq	.end_of_text

		cmpi.b	#RELPOS,d0		;set position?
		bne.s	.not_255
		move.w	d0,-(sp)
		move.b	(a1)+,d0		;get high byte of x pos
		rol.w	#8,d0
		move.b	(a1)+,d0		;get low byte of x pos
		add.w	d0,d5
		move.b	(a1)+,d0		;get high byte of y pos
		rol.w	#8,d0
		move.b	(a1)+,d0		;get low byte of y pos
		mulu	scale,d0
		add.w	d0,d7
		move.w	(sp)+,d0
		bra.s	.loop
.not_255
		cmpi.b	#ABSPOS,d0		;set position?
		bne.s	.not_251
		move.b	(a1)+,d5		;get high byte of x pos
		rol.w	#8,d5
		move.b	(a1)+,d5		;get low byte of x pos
		move.b	(a1)+,d7		;get high byte of y pos
		rol.w	#8,d7
		move.b	(a1)+,d7		;get low byte of y pos
		mulu	scale,d7
		add.w	yoffset,d7
		bra.s	.loop
.not_251
		cmpi.b	#NEWLINE,d0		;new line?
		bne.s	.not_254
		move.w	text_height(a3),d0
		mulu	scale,d0
		add.w	d0,d7
		moveq.l	#0,d5
		bra.s	.loop
.not_254
		cmpi.b	#ALIGN,d0		;align?
		bne.s	.not_253
		and.w	#$fff0,d5
		bra.s	.loop
.not_253
		cmpi.b	#CENTRE,d0		;centre line?
		bne.s	.not_252
                movem.l	d1/a1,-(sp)
		bsr	copy_phrase
		moveq.l	#0,d1
.next_char	move.b	(a1)+,d0
		cmpi.b	#PHRASEBOOK,d0
		bne.s	.not_252_phrase
		bsr	get_phrase2
		bra.s	.next_char
.not_252_phrase
		cmpi.b	#ENDPHRASE,d0
		bne.s	.not_252_endpharse
		bsr	back_phrase2
		bra.s	.next_char
.not_252_endpharse
		tst.b	d0
		beq.s	.end_line
		cmpi.b	#NEWLINE,d0
		beq.s	.end_line
		and.w	#$ff,d0
		cmpi.w	#240,d0
		bgt.s	.next_char
		subi.w	#32,d0
		bmi.s	.next_char
		move.b	text_widths(a3,d0.w),d0	;find sum of widths
		add.w	d0,d1
		bra.s	.next_char
.end_line       lsr.w	#1,d1			;half of width
		move.w	window_end_x,d5
		sub.w	window_start_x,d5
		lsr.w	#1,d5
		add.w	window_start_x,d5
		sub.w	d1,d5
                movem.l	(sp)+,d1/a1
		bra	.loop
.not_252
		cmpi.b	#CENTREON,d0		;centre line?
		bne.s	.not_247
		moveq.l	#0,d4
		move.b	(a1)+,d4
                movem.l	d1/a1,-(sp)
		bsr	copy_phrase
		moveq.l	#0,d1
.co_next_char	move.b	(a1)+,d0
		cmpi.b	#PHRASEBOOK,d0
		bne.s	.not_247_phrase
		bsr	get_phrase2
		bra.s	.co_next_char
.not_247_phrase
		cmpi.b	#ENDPHRASE,d0
		bne.s	.not_247_endpharse
		bsr	back_phrase2
		bra	.co_next_char
.not_247_endpharse
		tst.b	d0
		beq.s	.co_end_line
		cmpi.b	#NEWLINE,d0
		beq.s	.co_end_line
		and.w	#$ff,d0
		cmpi.w	#240,d0
		bgt.s	.co_next_char
		subi.w	#32,d0
		bmi.s	.co_next_char
		move.b	text_widths(a3,d0.w),d0	;find sum of widths
		add.w	d0,d1
		bra.s	.co_next_char
.co_end_line	lsr.w	#1,d1			;half of width
		sub.w	d1,d4
		add.w	d4,d5
                movem.l	(sp)+,d1/a1
		bra	.loop
.not_247
		cmpi.b	#SUPERSCRIPT,d0		;superscript?
		bne.s	.not_250
		move.w	text_height(a3),d0
		lsr	#2,d0
		mulu	scale,d0
                sub.w	d0,d7
		bra	.loop
.not_250
		cmpi.b	#SUBSCRIPT,d0		;subscript?
		bne.s	.not_249
		move.w	text_height(a3),d0
		lsr	#2,d0
		mulu	scale,d0
                add.w	d0,d7
		bra	.loop
.not_249
		cmpi.b	#SETPEN,d0		;set pen?
		bne	.not_248
		move.b	(a1)+,d0

                asr.b	#1,d0
		bcc.s	.plane0_off
		move.b	#3,text_plane+0(a3)
		bra.s	.skip_plane0
.plane0_off	move.b	#2,text_plane+0(a3)
.skip_plane0
                asr.b	#1,d0
		bcc.s	.plane1_off
		move.b	#3,text_plane+1(a3)
		bra.s	.skip_plane1
.plane1_off	move.b	#2,text_plane+1(a3)
.skip_plane1
                asr.b	#1,d0
		bcc.s	.plane2_off
		move.b	#3,text_plane+2(a3)
		bra.s	.skip_plane2
.plane2_off	move.b	#2,text_plane+2(a3)
.skip_plane2
                asr.b	#1,d0
		bcc.s	.plane3_off
		move.b	#3,text_plane+3(a3)
		bra.s	.skip_plane3
.plane3_off	move.b	#2,text_plane+3(a3)
.skip_plane3
                asr.b	#1,d0
		bcc.s	.plane4_off
		move.b	#3,text_plane+4(a3)
		bra.s	.skip_plane4
.plane4_off	move.b	#2,text_plane+4(a3)
.skip_plane4
                asr.b	#1,d0
		bcc.s	.plane5_off
		move.b	#3,text_plane+5(a3)
		bra.s	.skip_plane5
.plane5_off	move.b	#2,text_plane+5(a3)
.skip_plane5
		move.w	text_plane(a3),bob_plane(a2)
		move.w	text_plane+2(a3),bob_plane+2(a2)
		move.w	text_plane+4(a3),bob_plane+4(a2)
		bra	.loop
.not_248
		cmpi.b	#PHRASEBOOK,d0		;phrase book?
		bne.s	.not_246
		bsr	get_phrase
		bra	.loop
.not_246
		cmpi.b	#ENDPHRASE,d0		;end phrase book?
		bne.s	.not_245
		bsr	back_phrase
		bra	.loop
.not_245
.not_special
		and.l	#$000000ff,d0

		cmpi.b	#129,d0
		blt.s	.not_foreign
		cmpi.b	#225,d0
		bgt.s	.not_foreign
		sub.w	#129,d0
		move.l	a0,-(sp)
		lea	foreign,a0
		move.b	0(a0,d0.w),d0
		move.l	(sp)+,a0
		cmpi.w	#32,bob_width(a2)
		bne.s	.not_foreign
		subi.w	#4,d0
.not_foreign
		subi.w	#32,d0
		move.w	d0,d4
		mulu.w	d1,d0
                add.l	d2,d0
		move.l	d0,bob_address(a2)	;set address of chars image

		tst.w	variables+abort_drawtext(a5)
		beq.s	.no
		jsr	test_input
		tst.l	d0
		bne	.abort_end_of_text
.no
		bsr	draw_bob		;draw char

		tst.w	d3
		bne.s	.norm_spacing
		move.b	text_widths(a3,d4.w),d0	;add proportional gap
		and.w	#$00ff,d0
		add.w	d0,d5
.norm_spacing	add.w	d3,d5			;move text position for next
		bra	.loop

.end_of_text	movem.l	(sp)+,d0-d7/a0-a3
		moveq.l	#0,d0
		rts

.abort_end_of_text
		movem.l	(sp)+,d0-d7/a0-a3
		moveq.l	#-1,d0
		rts

text_bob_structure
		ds.b    bob_struct_size
		even

foreign		dc.b	129,130,131,132,133,134,134,135,135,136
		dc.b	137,138,139,140,140,141,141,141,142,143
		dc.b	144,145,146,146,147,148,148,148,148,148
		dc.b	148,149,150,151,152,153,154,155,155,156
		dc.b	156,156,156,156,157,157,157,157,157,157
		dc.b	157,157,157,157,157,157,157,157,157,157
		dc.b	157,157,157,157,157,157,157,157,157,157
		dc.b	157,157,157,157,157,157,157,157,157,157
		dc.b	157,157,157,157,157,157,157,157,157,157
		dc.b	157,157,157,157,157,157,158

lastphrase	dc.l	0
lastphrase_stack
		ds.l	5

copy_lastphrase	dc.l	0
copy_lastphrase_stack
		ds.l	5

copy_phrase	move.l	d0,-(sp)
		move.l	lastphrase,d0
		sub.l	#lastphrase_stack,d0
		add.l	#copy_lastphrase_stack,d0
		move.l	d0,copy_lastphrase
		move.l	lastphrase_stack+0,copy_lastphrase_stack+0
		move.l	lastphrase_stack+4,copy_lastphrase_stack+4
		move.l	lastphrase_stack+8,copy_lastphrase_stack+8
		move.l	lastphrase_stack+12,copy_lastphrase_stack+12
		move.l	lastphrase_stack+16,copy_lastphrase_stack+16
		move.l	(sp)+,d0
		rts

get_phrase	move.l	a0,-(sp)
		move.b	(a1)+,d0
		andi.w	#$ff,d0
		lsl.w	#8,d0
		move.b	(a1)+,d0
		subi.w	#1,d0
		lsl.w	#1,d0
		move.l	lastphrase,a0
		move.l	a1,(a0)+
		move.l	a0,lastphrase
		move.l	fast_mem_base,a1
		add.l	#code_size-phrasebook_size,a1
		move.w	0(a1,d0.w),d0
		add.w	d0,a1
		move.l	(sp)+,a0
		rts

back_phrase	move.l	a0,-(sp)
		move.l	lastphrase,a0
		move.l	-(a0),a1
		move.l	a0,lastphrase
		move.l	(sp)+,a0
		rts

get_phrase2	move.l	a0,-(sp)
		move.b	(a1)+,d0
		andi.w	#$ff,d0
		lsl.w	#8,d0
		move.b	(a1)+,d0
		subi.w	#1,d0
		lsl.w	#1,d0
		move.l	copy_lastphrase,a0
		move.l	a1,(a0)+
		move.l	a0,copy_lastphrase
		move.l	fast_mem_base,a1
		add.l	#code_size-phrasebook_size,a1
		move.w	0(a1,d0.w),d0
		add.w	d0,a1
		move.l	(sp)+,a0
		rts

back_phrase2	move.l	a0,-(sp)
		move.l	copy_lastphrase,a0
		move.l	-(a0),a1
		move.l	a0,copy_lastphrase
		move.l	(sp)+,a0
		rts

*******************************************************************************
************************** Palette Control Routines ***************************
*******************************************************************************
;Move new palette into copper palette.
;MACRO:		DISPLAY_PALETTE a,a
;MACRO:		DISPLAY_SMALL_PALETTE a,a,n
;INPUT:         a0=address of colour data (long)
;               a1=address of colour moves in copper list (long)
;               (d0=number of colours (word))
;OUTPUT:	none
;CHANGES:       none

DISPLAY_PALETTE	macro
		movem.l	a0-a1,-(sp)
		lea	\1,a0			;colours source
		lea	\2,a1                   ;copper list destin.
		jsr	display_palette
		movem.l	(sp)+,a0-a1
		endm

DISPLAY_SMALL_PALETTE	macro
		movem.l	a0-a1/d0,-(sp)
		lea	\1,a0			;colours source
		lea	\2,a1                   ;copper list destin.
		move.w	\3,d0			;colours
		jsr	display_small_palette
		movem.l	(sp)+,a0-a1/d0
		endm

display_palette	movem.l	d0/a0-a1,-(sp)

		move.w	#31,d0
		lea	2(a1),a1

.loop		move.w	(a0)+,(a1)+
		lea	2(a1),a1
		dbf	d0,.loop

		movem.l	(sp)+,d0/a0-a1
		rts


display_small_palette	movem.l	d0/a0-a1,-(sp)

		subq.w	#1,d0
		lea	2(a1),a1

.loop		move.w	(a0)+,(a1)+
		lea	2(a1),a1
		dbf	d0,.loop

		movem.l	(sp)+,d0/a0-a1
		rts

*******************************************************************************
*******************************************************************************
*******************************************************************************
;Move black into copper palette.
;MACRO		BLACK_PALETTE a
;INPUT:		a1=address of colour moves in copper list (long)
;OUTPUT:	none
;CHANGES:       none

BLACK_PALETTE	macro
		move.l	a1,-(sp)
		lea	\1,a1                   ;copper list destin.
		jsr	black_palette
		move.l	(sp)+,a1
		endm

black_palette	movem.l	d0/a1,-(sp)

		moveq.l	#31,d0
		lea	2(a1),a1

.loop		move.w	#0,(a1)+
		lea	2(a1),a1
		dbf	d0,.loop

		movem.l	(sp)+,d0/a1
		rts

*******************************************************************************
*******************************************************************************
*******************************************************************************
;Force all colours to black.
;INPUT:         none
;OUTPUT:	none
;CHANGES:       none

BLACK_COLOURS	macro
		jsr	black_colours
		endm

black_colours	movem.l	d0/a0,-(sp)

		move.w	#0,bplcon3(a6)

		lea	color00(a6),a0
		moveq.l	#31,d0

.loop		move.w	#0,(a0)+
		dbf	d0,.loop

		movem.l	(sp)+,d0/a0
		rts

*******************************************************************************
*******************************************************************************
**************************** Miscellanous routines ****************************
*******************************************************************************
*******************************************************************************

*******************************************************************************
*******************************************************************************
*******************************************************************************
;Clears sprite dma data registers. This stops the dreaded banding of sprites
;down the screen!
;INPUT:         none
;OUTPUT:	none
;CHANGES:	none
disable_sprites
		move.w	#%0000000000100000,dmacon(a6)	;sprite dma off
		move.l	#0,spr0data(a6)
		move.l	#0,spr1data(a6)
		move.l	#0,spr2data(a6)
		move.l	#0,spr3data(a6)
		move.l	#0,spr4data(a6)
		move.l	#0,spr5data(a6)
		move.l	#0,spr6data(a6)
		move.l	#0,spr7data(a6)
		move.w	#0,spr0ctl(a6)
		move.w	#0,spr1ctl(a6)
		move.w	#0,spr2ctl(a6)
		move.w	#0,spr3ctl(a6)
		move.w	#0,spr4ctl(a6)
		move.w	#0,spr5ctl(a6)
		move.w	#0,spr6ctl(a6)
		move.w	#0,spr7ctl(a6)
		rts

enable_sprites
		move.w	#%1000000000100000,dmacon(a6)	;sprite dma on
		rts

*******************************************************************************
*******************************************************************************
*******************************************************************************
*******************************************************************************
*******************************************************************************
;This will swap double buffered screen.
;INPUT:         a0=address of bitplane pointers in clist (long)
;	        d0=plane size (long)
;       	d1=number of bitplanes (word)
;OUTPUT:	none
;CHANGES:       none

SWAP_PLANE_BUFFERS	macro
		movem.l	a0-a1/d0-d1,-(sp)
		lea	\1,a0			;address of clist
		move.l	\2,d0
		move.w	\3,d1
		jsr	swap_plane_buffers
		movem.l	(sp)+,a0-a1/d0-d1
		endm

swap_plane_buffers
		movem.l	a1/d2,-(sp)

		move.l	viewing_buffer,d2
		move.l	drawing_buffer,viewing_buffer
		move.l	d2,drawing_buffer

		move.l	viewing_buffer,a1
		bsr	set_up_bitplane_pointers	;set up planes

		movem.l	(sp)+,a1/d2
		rts

viewing_buffer	dc.l	0		;double buffer variables
drawing_buffer	dc.l	0

*******************************************************************************
*******************************************************************************
*******************************************************************************
;Wait for top of screen.
;INPUT:		none
;OUTPUT:	none
;CHANGES:	none

WAIT_VBLANK	macro
		sf.b	top_scr
.\@		tst.b	top_scr			;vblank flag set?
		beq.s	.\@
		endm

*******************************************************************************
*******************************************************************************
*******************************************************************************
;Wait for bottom of screen.
;INPUT:		none
;OUTPUT:	none
;CHANGES:	none

WAIT_COPINT	macro
		sf.b	bot_scr
.\@		tst.b	bot_scr			;copper interupt flag set?
		beq.s	.\@
		endm

*******************************************************************************
*******************************************************************************
*******************************************************************************
;Wait for a scanline.
;INPUT:         d0=line number (0-255, byte)
;OUTPUT:	none
;CHANGES:	none

WAIT_LINE	macro
		move.l	d0,-(sp)
		move.w	\1,d0			;line number 0-312
		jsr	wait_line
		move.l	(sp)+,d0
		endm

wait_line	move.l	d1,-(sp)
		moveq.l	#0,d1

.wait		move.l	vposr(a6),d1
		ror.l	#8,d1
		and.w	#%0000000111111111,d1
		cmp.w	d1,d0
		bne.s	.wait

		move.l	(sp)+,d1
		rts

*******************************************************************************
*******************************************************************************
*******************************************************************************
;Wait for n scanlines.
;INPUT:         d0=number of lines (0-255, byte)
;OUTPUT:	none
;CHANGES:	none

DELAY		macro
		move.l	d0,-(sp)
		move.l	\1,d0			;line number 0-312
		jsr     delay
		move.l	(sp)+,d0
		endm

COLOUR_BURST	MACRO
		movem.l	d0-d2,-(sp)
		move.w	#2,d0
.loop\@		move.b	vhposr(a6),d1
.wait\@		move.b	vhposr(a6),d2
		move.w	\1,$dff180
		cmp.b	d1,d2
		beq.s	.wait\@
		dbf	d0,.loop\@
		movem.l	(sp)+,d0-d2
		move.w	#$000,$dff180
		ENDM

delay		movem.l	d1-d2,-(sp)

.loop		move.b	vhposr(a6),d1

.wait		move.b	vhposr(a6),d2
		cmp.b	d1,d2
		beq.s	.wait

		dbf	d0,.loop

		movem.l	(sp)+,d1-d2
		rts

*******************************************************************************
*******************************************************************************
*******************************************************************************
;INPUT:		none
;OUTPUT:        d0=random number (0-255, byte)
;CHANGES:	none

get_random	move.b	vposr+1(a6),d0
		and.b	#%00000001,d0
		rol.w	#8,d0
		move.b	vhposr(a6),d0

		rts

*******************************************************************************
*******************************************************************************
*******************************************************************************
;Reset all the key flags
;INPUT:         a0=address of new key list (long)
;OUTPUT:	none
;CHANGES:       none

INITIALISE_KEYS	macro
		move.l	a0,-(sp)
		move.l  \1,a0
		jsr	initialise_keys
		move.l	(sp)+,a0
		endm

initialise_keys
		move.l	a0,key_list

		move.b	#0,(a0)+
		move.b	#0,(a0)+

.loop		move.b	#0,(a0)+
                cmpi.b	#255,(a0)
		beq.s	.end_list
		addq.l	#2,a0
		bra.s	.loop

.end_list	rts

*******************************************************************************
*******************************************************************************
*******************************************************************************
;Set up bitplane pointers in copper.
;INPUT:		a0=address of destination (long)
;		a1=address of bitplanes (long)
;		d0=size of a bitplane (word)
;		d1=number of planes (word)
;OUTPUT:	none
;CHANGES:	a0,d0-d3

SET_UP_BITPLANE_POINTERS	macro
		movem.l d0-d1/a0-a1,-(sp)
		lea	\1,a0			;address of pointers
		move.l	\2,a1			;address of bitplanes
		move.l	\3,d0			;plane size
		move.w	\4,d1			;number of planes
		jsr	set_up_bitplane_pointers
		movem.l	(sp)+,d0-d1/a0-a1
		endm

set_up_bitplane_pointers
		movem.l	d0-d2/a0,-(sp)

		move.l	a1,d2
		subq.w	#1,d1
.makecl
		lea	2(a0),a0
		swap	d2
		move.w	d2,(a0)+
		lea	2(a0),a0
		swap	d2
		move.w	d2,(a0)+
		add.l	d0,d2
		dbf	d1,.makecl

		movem.l	(sp)+,d0-d2/a0
		rts

*******************************************************************************
*******************************************************************************
*******************************************************************************
;Set up sprite pointers in copper list.
;INPUT:		a0=start address of sprite data (long)
;		a1=start address of destination (long)
;OUTPUT:	none
;CHANGES:	a0-a1,d0-d3
set_up_sprites_in_clist
		move.w	(a0)+,d3		;get number of sprites
		lea	2(a1),a1
.loop1		move.l	a0,d1			;d1=address of sprite data
		tst.w	d0			;is this a blank sprite?
		bne.s	.cont
		moveq.l	#1,d0
		move.l	d2,d1			;if it is then pointer is
		bra.s	.cont_pass		; set to end of last sprite
.cont		move.l	a0,d2			;remember this address
.cont_pass	swap 	d1
		move.w	d1,(a1)			;high word of sprite data
		lea	4(a1),a1
		swap	d1
		move.w	d1,(a1)			;low word of sprite data
		lea	4(a1),a1
.loop2		lea	4(a0),a0		;find next sprite data
		move.l	(a0),d1
		tst.l	d1
		bne.s	.loop2
		lea	4(a0),a0
		subq.w	#1,d0
		dbra	d3,.loop1
		rts

*******************************************************************************
*******************************************************************************
*******************************************************************************
;Use the processor to clear an area of memory.
;INPUT:		a0=start address of area to clear (long)
;		a1=end address of area to clear (long)
;OUTPUT:	none
;CHANGES:       none

CLR_MEM_SIZE	macro
		movem.l	a0-a1,-(sp)
		move.l	\1,a0			;start address
		move.l  a0,a1
		add.l	\2,a1			;size
		jsr	clear_memory
		movem.l	(sp)+,a0-a1
		endm

CLR_EVEN_MEM_SIZE	macro
		movem.l	a0/d0,-(sp)
		move.l	\1,a0			;start address
		move.l  \2,d0			;size (words)
		jsr	clear_even_memory
		movem.l	(sp)+,a0/d0
		endm

CLR_MEM_RANGE	macro
		movem.l	a0-a1,-(sp)
		lea	\1,a0			;start address
		lea	\2,a1			;end address
		jsr	clear_memory
		movem.l	(sp)+,a0-a1
		endm

clear_memory	movem.l	d0/a0,-(sp)

		moveq.l	#0,d0
.loop		move.b	d0,(a0)+
		cmpa.l	a0,a1
		bne.s	.loop

		movem.l	(sp)+,d0/a0
		rts

clear_even_memory
		movem.l	a0/d0-d1,-(sp)

		moveq.l	#0,d1
.loop		move.w	d1,(a0)+
		subq.l	#1,d0
		bne.s	.loop

		movem.l	(sp)+,a0/d0-d1
		rts

*******************************************************************************
*******************************************************************************
*******************************************************************************
;Calculate control words for sprite dma data.
;INPUT:		a6=address of hardware registers (long)
;		d0=sprite number (0-8, 8=dont insert sprptx into copper)
;		d1=x co of sprite (word)
;		d2=y co of sprite (word)
;		d3=height of sprite data in pixels (word)
;		d4=address of sprite data (long)
;		a1=address of sprite control in clist (long)
;OUTPUT:	none
;CHANGES:       none

HDW_SPRITE	MACRO
		movem.l d0-d4/a1,-(sp)
		move.l	\2,d4			;address of sprite data
		move.w	\4,d2			;y co
		move.w	\3,d1			;x co
		move.w	\1,d0			;sprite number
		move.w	\5,d3			;height in pixels
		move.l	\6,a1			;address in copper
		jsr	hardware_sprite
		movem.l (sp)+,d0-d4/a1
		ENDM

HDW_SPRITE16	MACRO
		movem.l d0-d4/a1,-(sp)
		move.l	\2,d4			;address of sprite data
		move.w	\4,d2			;y co
		move.w	\3,d1			;x co
		move.w	\1,d0			;sprite number
		move.w	\5,d3			;height in pixels
		move.l	\6,a1			;address in copper
		jsr	hardware_sprite_16
		movem.l (sp)+,d0-d4/a1
		ENDM

hardware_sprite_16
		movem.l	d0-d3/a0,-(sp)

		add.w	d2,d3
		rol.w	#8,d3

		rol.w	#8,d2
                rol.b   #1,d2
		or.b	d2,d3

		roxr.w	#1,d1
		roxl.b	#1,d3				;d3=2nd control word
		or.b	d1,d2				;d2=1st control word

		move.l	d4,a0
		move.w	d2,(a0)+
		move.w	d3,(a0)

		cmpi.w	#8,d0
		beq.s	.leave_clist

		lsl.w	#3,d0
		move.w 	d4,2(a1,d0.w)
		swap	d4
		move.w 	d4,6(a1,d0.w)

.leave_clist	movem.l	(sp)+,d0-d3/a0
		rts

hardware_sprite	movem.l	d0-d3/a0,-(sp)

		add.w	d2,d3
		rol.w	#8,d3

		rol.w	#8,d2
                rol.b   #1,d2
		or.b	d2,d3

		roxr.w	#1,d1
		roxl.b	#1,d3				;d3=2nd control word
		or.b	d1,d2				;d2=1st control word

		move.l	d4,a0
		move.w	d2,(a0)+
	IFD	CD32
		clr.w	(a0)+
		move.w	d3,(a0)+
		clr.w	(a0)
	ELSEIF
		move.w	d3,(a0)
	ENDC

		cmpi.w	#8,d0
		beq.s	.leave_clist

		lsl.w	#3,d0
		move.w 	d4,2(a1,d0.w)
		swap	d4
		move.w 	d4,6(a1,d0.w)

.leave_clist	movem.l	(sp)+,d0-d3/a0
		rts

*******************************************************************************
*******************************************************************************
*******************************************************************************
;INPUT:		d0.w=posn
;OUTPUT:	d2.w=volume
;CHANGES:       d0-d6,a0

find_vol_mem
		movem.l	d0-d1/d3-d6,-(sp)

		lsr.w	#2,d0

		divu	#MAP_WIDTH*MAP_DEPTH,d0
		move.b	d0,d6
		swap	d0

		ext.l	d0
		divu	#MAP_WIDTH,d0
		move.b	d0,d5
		swap	d0

		move.b	d0,d4

		ext.w	d4
		ext.w	d5
		ext.w	d6

		bsr	find_vol_posn

		movem.l	(sp)+,d0-d1/d3-d6
		rts

*******************************************************************************
*******************************************************************************
*******************************************************************************
;INPUT:		d4.w=x
;		d5.w=y
;		d6.w=z
;OUTPUT:	d2.w=volume
;CHANGES:       d0-d6

find_vol_posn
		movem.l	a0-a1,-(sp)

		moveq.l	#0,d3
		lea	audio_dist,a1

		lea	variables+player1(a5),a0
                bsr	.get_value

		lea	variables+player2(a5),a0
                bsr	.get_value

		lea	variables+player3(a5),a0
                bsr	.get_value

		lea	variables+player4(a5),a0
                bsr	.get_value

		moveq.l	#0,d2
		move.b	d3,d2

		movem.l	(sp)+,a0-a1
		rts

.get_value	moveq.l	#0,d0
		move.b	xpos(a0),d0
		sub.w	d4,d0
		bpl.s	.not_x_minus
		neg.w	d0
.not_x_minus	cmpi.w	#11,d0
		bgt.s	.out_range

		moveq.l	#0,d1
		move.b	ypos(a0),d1
		sub.w	d5,d1
		bpl.s	.not_y_minus
		neg.w	d1
.not_y_minus	cmpi.w	#11,d1
		bgt.s	.out_range

		moveq.l	#0,d2
		move.b	floor(a0),d2
		sub.w	d6,d2
		bpl.s	.not_z_minus
		neg.w	d2
.not_z_minus	cmpi.w	#11,d2
		bgt.s	.out_range

		mulu	#12*12,d2
		mulu	#12,d1

		add.w	d1,d0
		add.w	d2,d0

		move.b	0(a1,d0.w),d0
		cmp.b	d0,d3
		bgt.s	.out_range

		move.b	d0,d3

.out_range	rts

*******************************************************************************
*******************************************************************************
*******************************************************************************
;INPUT:		a0.l=base address
;		d0.w=effect number
;		d1.w=channel
;		d2.w=volume
;		d3.w=period
;OUTPUT:	none
;CHANGES:       d0/a1

PLAY_SAMPLE	macro
		movem.l	d0-d3/a0-a2,-(sp)
		move.w	\2,d0
		move.w	\3,d1
		move.w	\4,d2
		move.w	\5,d3
		move.l  \1,a0
		jsr	play_sample
		movem.l	(sp)+,d0-d3/a0-a2
		endm

PLAY_SAMPLE_MEM	macro
		movem.l	d0-d3/a0-a2,-(sp)
		move.l	\5,d0
		jsr	find_vol_mem
		move.l  \2,d0
		move.w	\3,d1
		move.w	\4,d3
		move.l  \1,a0
		jsr	play_sample
		movem.l	(sp)+,d0-d3/a0-a2
		endm

PLAY_EX_SAMPLE	macro
		movem.l	d0-d3/a0-a2,-(sp)
		move.w	\1,d0
		move.w	\2,d1
		move.w	\3,d2
		move.w	\4,d3
		jsr	play_ex_sfx
		movem.l	(sp)+,d0-d3/a0-a2
		endm

PLAY_EX_SAMPLE_RAND	macro
		movem.l	d0-d3/a0-a2,-(sp)
		move.w	\1,d0
		move.w	\2,d1
		move.w	\3,d2
		move.w	\4,d3
		jsr	play_ex_sfx_rand
		movem.l	(sp)+,d0-d3/a0-a2
		endm

PLAY_EX_SAMPLE_RAND2	macro
		movem.l	d0-d3/a0-a2,-(sp)
		move.w	\1,d0
		move.w	\2,d1
		move.w	\3,d2
		move.w	\4,d3
		jsr	play_ex_sfx_rand2
		movem.l	(sp)+,d0-d3/a0-a2
		endm

PLAY_EX_SAMPLE_MEM	macro
		movem.l	d0-d3/a0-a2,-(sp)
		move.l	\4,d0
		jsr	find_vol_mem
		move.w	\1,d0
		move.w	\2,d1
		move.w	\3,d3
		jsr	play_ex_sfx
		movem.l	(sp)+,d0-d3/a0-a2
		endm

play_sample
		cmpi.b	#3,d0
		beq.s	.no_vari
		cmpi.b	#4,d0
		beq.s	.no_vari
		cmpi.b	#5,d0
		beq.s	.no_vari
		move.w	d1,-(sp)
		move.b	vhposr+1(a6),d1
		andi.w	#%1111111,d1
		subi.w	#64,d3
		add.w	d1,d3
		move.w	(sp)+,d1
.no_vari
		subq.l	#1,d0
		lsl.w	#2,d0
		move.l	0(a0,d0.w),a1
		add.l	a0,a1			;address of sample
play_8svx
		move.w	d1,sample_channel(a5)
		move.w	d2,sample_volume(a5)
		move.w	d3,sample_period(a5)

		move.l	#"VHDR",d0
		move.l  a1,a0
		add.w	#4000,a1
		move.l	a1,a2
		bsr	find_chunk

		cmp.l	#0,a0
		beq	.error

		move.l	VHDR_oneshot_hi_samples(a0),d0
		lsr.l	#1,d0
		move.w	d0,sample_length(a5)	;one-shot sample length

		move.l	VHDR_repeat_hi_samples(a0),d0
		lsr.l	#1,d0
		move.w	d0,sample_rept_length(a5);repeat sample length

		add.l	(a0),a0			;skip chunk

		move.l	#"BODY",d0
		move.l  a0,a1
		add.w	#4000,a1
		move.l	a1,a2
		bsr	find_chunk

		cmp.l	#0,a0
		beq	.error

		lea	4(a0),a0		;ignore chunk length
		move.l	a0,sample_oneshot_address(a5)	;one-shot sample start
		move.w	sample_length(a5),d0
		lsl.w	#1,d0
		add.w	d0,a0
		move.l	a0,sample_rept_address(a5)	;repeat sample start

		tst.w	sample_channel(a5)
		beq.s   channel0
		cmpi.w	#1,sample_channel(a5)
		beq	channel1
		cmpi.w	#2,sample_channel(a5)
		beq	channel2
		bra	channel3
.error		rts


channel0	move.w	#0,aud0lch+vol(a6)		;set channel volume
		move.w	#%0000000000000001,dmacon(a6)	;kill audio dma
		move.l	sample_oneshot_address(a5),aud0lch+lch(a6)	;set sample address
		move.w	sample_length(a5),aud0lch+len(a6)		;set sample length
		bne.s	.no_rept
		move.w	sample_rept_length(a5),aud0lch+len(a6)
.no_rept	move.w	sample_volume(a5),aud0lch+vol(a6)	;set channel volume
		move.w	sample_period(a5),aud0lch+per(a6)	;set sample period
		DELAY	#6
		move.w	#%1000000000000001,dmacon(a6)	;start audio dma
		DELAY	#6
		tst.w	sample_rept_length(a5)
		beq.s	.no_rept2
		move.l	sample_rept_address(a5),aud0lch+lch(a6)	;set sample address
		move.w	sample_rept_length(a5),aud0lch+len(a6)	;set sample length
		rts
.no_rept2	move.l	#chipzero,a0
		add.l	chip_mem_base,a0
		move.l	a0,aud0lch+lch(a6)		;set sample address
		move.w	#1,aud0lch+len(a6)		;set sample length
		rts

channel1	move.w	#0,aud1lch+vol(a6)		;set channel volume
		move.w	#%0000000000000010,dmacon(a6)	;kill audio dma
		move.l	sample_oneshot_address(a5),aud1lch+lch(a6)	;set sample address
		move.w	sample_length(a5),aud1lch+len(a6)		;set sample length
		bne.s	.no_rept
		move.w	sample_rept_length(a5),aud1lch+len(a6)
.no_rept	move.w	sample_volume(a5),aud1lch+vol(a6)	;set channel volume
		move.w	sample_period(a5),aud1lch+per(a6)	;set sample period
		DELAY	#6
		move.w	#%1000000000000010,dmacon(a6)	;start audio dma
		DELAY	#6
		tst.w	sample_rept_length(a5)
		beq.s	.no_rept2
		move.l	sample_rept_address(a5),aud1lch+lch(a6)	;set sample address
		move.w	sample_rept_length(a5),aud1lch+len(a6)	;set sample length
		rts
.no_rept2	move.l	#chipzero,a0
		add.l	chip_mem_base,a0
		move.l	a0,aud1lch+lch(a6)		;set sample address
		move.w	#1,aud1lch+len(a6)		;set sample length
		rts

channel2	move.w	#0,aud2lch+vol(a6)		;set channel volume
		move.w	#%0000000000000100,dmacon(a6)	;kill audio dma
		move.l	sample_oneshot_address(a5),aud2lch+lch(a6)	;set sample address
		move.w	sample_length(a5),aud2lch+len(a6)		;set sample length
		bne.s	.no_rept
		move.w	sample_rept_length(a5),aud2lch+len(a6)
.no_rept	move.w	sample_volume(a5),aud2lch+vol(a6)	;set channel volume
		move.w	sample_period(a5),aud2lch+per(a6)	;set sample period
		DELAY	#6
		move.w	#%1000000000000100,dmacon(a6)	;start audio dma
		DELAY	#6
		tst.w	sample_rept_length(a5)
		beq.s	.no_rept2
		move.l	sample_rept_address(a5),aud2lch+lch(a6)	;set sample address
		move.w	sample_rept_length(a5),aud2lch+len(a6)	;set sample length
		rts
.no_rept2	move.l	#chipzero,a0
		add.l	chip_mem_base,a0
		move.l	a0,aud2lch+lch(a6)		;set sample address
		move.w	#1,aud2lch+len(a6)		;set sample length
		rts

channel3	move.w	#0,aud3lch+vol(a6)		;set channel volume
		move.w	#%0000000000001000,dmacon(a6)	;kill audio dma
		move.l	sample_oneshot_address(a5),aud3lch+lch(a6)	;set sample address
		move.w	sample_length(a5),aud3lch+len(a6)		;set sample length
		bne.s	.no_rept
		move.w	sample_rept_length(a5),aud3lch+len(a6)
.no_rept	move.w	sample_volume(a5),aud3lch+vol(a6)	;set channel volume
		move.w	sample_period(a5),aud3lch+per(a6)	;set sample period
		DELAY	#6
		move.w	#%1000000000001000,dmacon(a6)	;start audio dma
		DELAY	#6
		tst.w	sample_rept_length(a5)
		beq.s	.no_rept2
		move.l	sample_rept_address(a5),aud3lch+lch(a6)	;set sample address
		move.w	sample_rept_length(a5),aud3lch+len(a6)	;set sample length
		rts
.no_rept2	move.l	#chipzero,a0
		add.l	chip_mem_base,a0
		move.l	a0,aud3lch+lch(a6)		;set sample address
		move.w	#1,aud3lch+len(a6)		;set sample length
		rts

*******************************************************************************
find_chunk
.loop1		move.l	d0,d1
		rol.l	#8,d1

.loop2		cmpa.l	a0,a2
		beq.s	.not_found
		cmp.b	(a0)+,d1
		bne.s	.loop2

		move.l	a0,a1

		rol.l	#8,d1
		cmp.b	(a1)+,d1
		bne.s	.loop1

		rol.l	#8,d1
		cmp.b	(a1)+,d1
		bne.s	.loop1

		rol.l	#8,d1
		cmp.b	(a1)+,d1
		bne.s	.loop1

		move.l	a1,a0
		rts
.not_found
		suba.l	a0,a0				;0=not found
		rts

*******************************************************************************

killaud		move.w	#0,aud0lch+vol(a6)
		move.w	#0,aud1lch+vol(a6)
		move.w	#0,aud2lch+vol(a6)
		move.w	#0,aud3lch+vol(a6)

		move.w	#0,aud0lch+dat(a6)
		move.w	#0,aud1lch+dat(a6)
		move.w	#0,aud2lch+dat(a6)
		move.w	#0,aud3lch+dat(a6)

		move.w	#1,aud0lch+len(a6)
		move.w	#1,aud1lch+len(a6)
		move.w	#1,aud2lch+len(a6)
		move.w	#1,aud3lch+len(a6)

		move.l	#chipzero,d0
		add.l	chip_mem_base,d0

		move.l	d0,aud0lch+lch(a6)
		move.l	d0,aud1lch+lch(a6)
		move.l	d0,aud2lch+lch(a6)
		move.l	d0,aud3lch+lch(a6)

		DELAY	#6

		move.w	#%1111,dmacon(a6)

		rts

*******************************************************************************
*******************************************************************************
*******************************************************************************
;INPUT:		a0=address of copper list 1 (long)
;		a2=address of copper list 1 (long)
;		a3=address of scratch area
;OUTPUT:
;CHANGES:       none

fade_copper_to_black_interlace
		movem.l	a0-a5/d0-d6,-(sp)

		move.l	a3,a4
		move.l	a0,a1
		move.l	a2,a3

		moveq.l	#0,d5
		move.l	a4,a5

.loop1		cmpi.w	#$180+0*2,(a0)
		blt	.no_colour_change1
		cmpi.w	#$180+31*2,(a0)
		bgt	.no_colour_change1

		addq.w	#1,d5
		move.w	2(a0),(a5)+
		move.l	a0,d0
		sub.l	a1,d0
		add.l	#2,d0
		move.l	d0,(a5)+

.no_colour_change1
		lea	4(a0),a0

		cmpi.l	#$fffffffe,(a0)
		bne.s	.loop1

		tst.w	d5
		beq.s	.end

		subq.w	#1,d5
		moveq.l	#0,d2

.next_fade	move.w	d5,d4
		move.l	a4,a5

		WAIT_VBLANK
		WAIT_VBLANK

                lea	blue,a0

.next_colour	move.w	(a5)+,d0

		move.w	d0,d1
		and.w	#$00f,d1
		lsl.w	#5,d1
		add.w	d2,d1
		move.w	0(a0,d1.w),d3

		move.w	d0,d1
		and.w	#$0f0,d1
		lsl.w	#1,d1
		add.w	d2,d1
		move.w	0(a0,d1.w),d6
		lsl.w	#4,d6
		or.w	d6,d3

		move.w	d0,d1
		and.w	#$f00,d1
		lsr.w	#3,d1
		add.w	d2,d1
		move.w	0(a0,d1.w),d6
		lsl.w	#8,d6
		or.w	d6,d3

		move.l	(a5)+,d1
		move.w	d3,0(a1,d1.w)
		move.w	d3,0(a3,d1.w)

		dbf	d4,.next_colour

		addq.w	#2,d2

		cmpi.w	#32,d2
		blt.s	.next_fade

.end		movem.l	(sp)+,a0-a5/d0-d6
		rts

*******************************************************************************
;INPUT:		a0=address of copper list 1 (long)
;		a3=address of scratch area
;OUTPUT:
;CHANGES:       none

fade_copper_to_black
		movem.l	a0-a5/d0-d5,-(sp)

		move.l	a3,a4
		move.l	a0,a1

		moveq.l	#0,d5
		move.l	a4,a5

.loop1		cmpi.w	#$180+0*2,(a0)
		blt	.no_colour_change1
		cmpi.w	#$180+31*2,(a0)
		bgt	.no_colour_change1

		addq.w	#1,d5
		move.w	2(a0),(a5)+
		move.l	a0,d0
		sub.l	a1,d0
		add.l	#2,d0
		move.l	d0,(a5)+

.no_colour_change1
		lea	4(a0),a0

		cmpi.l	#$fffffffe,(a0)
		bne.s	.loop1

		tst.w	d5
		beq.s	.end

		subq.w	#1,d5
		moveq.l	#0,d2

.next_fade	move.w	d5,d4
		move.l	a4,a5

		WAIT_VBLANK
		WAIT_VBLANK

		lea	blue,a0

.next_colour	move.w	(a5)+,d0

		move.w	d0,d1
		and.w	#$00f,d1
		lsl.w	#5,d1
		add.w	d2,d1
		move.w	0(a0,d1.w),d3

		move.w	d0,d1
		and.w	#$0f0,d1
		lsl.w	#1,d1
		add.w	d2,d1
		move.w	0(a0,d1.w),d6
		lsl.w	#4,d6
		or.w	d6,d3

		move.w	d0,d1
		and.w	#$f00,d1
		lsr.w	#3,d1
		add.w	d2,d1
		move.w	0(a0,d1.w),d6
		lsl.w	#8,d6
		or.w	d6,d3

		move.l	(a5)+,d1
		move.w	d3,0(a1,d1.w)

		dbf	d4,.next_colour

		addq.w	#2,d2

		cmpi.w	#32,d2
		blt.s	.next_fade

.end		movem.l	(sp)+,a0-a5/d0-d5
		rts

*******************************************************************************

blue		dc.w	$000,$000,$000,$000,$000,$000,$000,$000,$000,$000,$000,$000,$000,$000,$000,$000
		dc.w	$001,$001,$001,$001,$001,$001,$001,$001,$000,$000,$000,$000,$000,$000,$000,$000
		dc.w	$002,$002,$002,$002,$002,$001,$001,$001,$001,$001,$001,$000,$000,$000,$000,$000
		dc.w	$003,$003,$003,$003,$002,$002,$002,$002,$001,$001,$001,$001,$000,$000,$000,$000
		dc.w	$004,$004,$004,$003,$003,$003,$002,$002,$002,$002,$001,$001,$001,$000,$000,$000
		dc.w	$005,$005,$005,$004,$004,$003,$003,$003,$002,$002,$002,$001,$001,$000,$000,$000
		dc.w	$006,$006,$005,$005,$005,$004,$004,$003,$003,$002,$002,$002,$001,$001,$000,$000
		dc.w	$007,$007,$006,$006,$005,$005,$004,$004,$003,$003,$002,$002,$001,$001,$000,$000
		dc.w	$008,$008,$007,$007,$006,$005,$005,$004,$004,$003,$003,$002,$001,$001,$000,$000
		dc.w	$009,$009,$008,$007,$007,$006,$005,$005,$004,$003,$003,$002,$001,$001,$000,$000
		dc.w	$00a,$00a,$009,$008,$008,$007,$006,$006,$005,$004,$004,$003,$002,$001,$001,$000
		dc.w	$00b,$00a,$00a,$009,$008,$007,$007,$006,$005,$004,$004,$003,$002,$001,$001,$000
		dc.w	$00c,$00b,$00a,$009,$009,$008,$007,$006,$005,$005,$004,$003,$002,$002,$001,$000
		dc.w	$00d,$00c,$00b,$00a,$009,$009,$008,$007,$006,$005,$004,$003,$003,$002,$001,$000
		dc.w	$00e,$00d,$00c,$00b,$00a,$009,$008,$008,$007,$006,$005,$004,$003,$002,$001,$000
		dc.w	$00f,$00e,$00d,$00c,$00b,$00a,$009,$008,$007,$006,$005,$004,$003,$002,$001,$000

*******************************************************************************
*******************************************************************************
*******************************************************************************
;INPUT:		a0=address of copper colour changes 1 (long)
;		a2=address of copper colour changes 2 (long)
;		d0=number of colours to fade (long)
;		d1=target colour (word)
;OUTPUT:
;CHANGES:       none
fade_to_colour_interlace
		movem.l	a0-a3/d0-d7,-(sp)

		move.w	d1,d7			;save target colour

		move.l	a0,a1
		move.l	a2,a3
		subq.w	#1,d0
		move.w	d0,d5

.more_fade	move.l	a1,a0
		move.l	a3,a2
		moveq.l	#0,d3			;reset finish flag
		move.w	d5,d0

		WAIT_VBLANK

.loop		move.w  2(a0),d1
		move.w	d1,d4

		move.w	d1,d2
		move.w	d7,d6
		andi.w	#$f00,d2		;extract red component
		andi.w	#$f00,d6
		cmp.w	d6,d2
		beq.s	.red_ok
		blt.s	.red_lower
		subi.w	#1<<8,d2
		and.w	#$0ff,d4
                or.w	d2,d4
		moveq.l	#-1,d3
		bra.s	.red_ok
.red_lower	addi.w	#1<<8,d2
		and.w	#$0ff,d4
                or.w	d2,d4
		moveq.l	#-1,d3
.red_ok
		move.w	d1,d2
		move.w	d7,d6
		andi.w	#$0f0,d2		;extract green component
		andi.w	#$0f0,d6
		cmp.w	d6,d2
		beq.s	.green_ok
		blt.s	.green_lower
		subi.w	#1<<4,d2
		and.w	#$f0f,d4
                or.w	d2,d4
		moveq.l	#-1,d3
		bra.s	.green_ok
.green_lower	addi.w	#1<<4,d2
		and.w	#$f0f,d4
                or.w	d2,d4
		moveq.l	#-1,d3
.green_ok
		move.w	d1,d2
		move.w	d7,d6
		andi.w	#$00f,d2		;extract blue component
		andi.w	#$00f,d6
		cmp.w	d6,d2
		beq.s	.blue_ok
		blt.s	.blue_lower
		subi.w	#1,d2
		and.w	#$ff0,d4
                or.w	d2,d4
		moveq.l	#-1,d3
		bra.s	.blue_ok
.blue_lower	addi.w	#1,d2
		and.w	#$ff0,d4
                or.w	d2,d4
		moveq.l	#-1,d3
.blue_ok
		move.w	d4,2(a0)
		move.w	d4,2(a2)

		lea	4(a0),a0
		lea	4(a2),a2

		dbf	d0,.loop

		tst.w	d3
		bne	.more_fade

		movem.l	(sp)+,a0-a3/d0-d7
		rts

*******************************************************************************
*******************************************************************************
*******************************************************************************
;INPUT:         none
;OUTPUT:	none
;CHANGES:       none

SHOW_MESG	macro
	IFND	CD32
		move.l  a3,-(sp)
		lea	\1,a3
		jsr	show_message
		move.l  (sp)+,a3
	ENDC
		endm

unshow_message
	IFND	CD32
		tst.w	variables+file_mode(a5)
		bne	.covert

		tst.l	os_kill
		bne	.os_dead
.covert		rts
.os_dead
		movem.l	a0-a2/d0-d1,-(sp)
		move.l	#lc_mesg_copperlist+mesg_palette1+4,a0
		move.l	#lc_mesg_copperlist+mesg_palette2+4,a2
		add.l	chip_mem_base,a0
		add.l	chip_mem_base,a2
		moveq.l	#7,d0
		move.w	#$236,d1
		jsr	fade_to_colour_interlace
		movem.l	(sp)+,a0-a2/d0-d1
	ENDC
		rts

show_message
	IFND	CD32
		tst.w	variables+file_mode(a5)
		bne	.covert

		tst.l	os_kill
		bne	.os_dead
.covert		rts
.os_dead

		movem.l	a0-a2/d0-d1,-(sp)
		move.l	#lc_mesg_copperlist+mesg_palette1+4,a0
		move.l	#lc_mesg_copperlist+mesg_palette2+4,a2
		add.l	chip_mem_base,a0
		add.l	chip_mem_base,a2
		moveq.l	#7,d0
		move.w	#$236,d1
		jsr	fade_to_colour_interlace
		BLIT_FILL viewing_buffer,#mesg_plane_width/16,#mesg_plane_height,#mesg_num_planes,#mesg_plane_size,#0
		WAIT_BLIT
		move.l	#front_font_s,a0
		adda.l	a5,a0
		BLIT_TEXT2 (a3),a0,#0,#0,#%111
		move.l	#lc_mesg_copperlist+mesg_palette1+4,a0
		move.l	#lc_mesg_copperlist+mesg_palette2+4,a2
		add.l	chip_mem_base,a0
		add.l	chip_mem_base,a2
		moveq.l	#7,d0
		lea	mesg_palette,a3
		jsr	fade_to_palette_interlace
		movem.l	(sp)+,a0-a2/d0-d1
	ENDC
		rts

*******************************************************************************
*******************************************************************************
*******************************************************************************
;INPUT:		a0=address of copper colour changes 1 (long)
;		a2=address of copper colour changes 2 (long)
;		d0=number of colours to fade (long)
;		a3=address of palette (word)
;OUTPUT:
;CHANGES:       none
fade_to_palette_interlace
		movem.l	a0-a5/d0-d7,-(sp)

		move.l	a3,a4
		move.l	a3,a5

		move.l	a0,a1
		move.l	a2,a3
		subq.w	#1,d0
		move.w	d0,d5

.more_fade	move.l	a1,a0
		move.l	a3,a2
		moveq.l	#0,d3			;reset finish flag
		move.w	d5,d0
		move.l	a5,a4

		WAIT_VBLANK

.loop		move.w  2(a0),d1
		move.w	d1,d4

		move.w  (a4),d6
		move.w	d1,d2
		andi.w	#$f00,d2		;extract red component
		andi.w	#$f00,d6
		cmp.w	d6,d2
		beq.s	.red_ok
		blt.s	.red_lower
		subi.w	#1<<8,d2
		and.w	#$0ff,d4
                or.w	d2,d4
		moveq.l	#-1,d3
		bra.s	.red_ok
.red_lower	addi.w	#1<<8,d2
		and.w	#$0ff,d4
                or.w	d2,d4
		moveq.l	#-1,d3
.red_ok
		move.w  (a4),d6
		move.w	d1,d2
		andi.w	#$0f0,d2		;extract green component
		andi.w	#$0f0,d6
		cmp.w	d6,d2
		beq.s	.green_ok
		blt.s	.green_lower
		subi.w	#1<<4,d2
		and.w	#$f0f,d4
                or.w	d2,d4
		moveq.l	#-1,d3
		bra.s	.green_ok
.green_lower	addi.w	#1<<4,d2
		and.w	#$f0f,d4
                or.w	d2,d4
		moveq.l	#-1,d3
.green_ok
		move.w  (a4)+,d6
		move.w	d1,d2
		andi.w	#$00f,d2		;extract blue component
		andi.w	#$00f,d6
		cmp.w	d6,d2
		beq.s	.blue_ok
		blt.s	.blue_lower
		subi.w	#1,d2
		and.w	#$ff0,d4
                or.w	d2,d4
		moveq.l	#-1,d3
		bra.s	.blue_ok
.blue_lower	addi.w	#1,d2
		and.w	#$ff0,d4
                or.w	d2,d4
		moveq.l	#-1,d3
.blue_ok
		move.w	d4,2(a0)
		move.w	d4,2(a2)

		lea	4(a0),a0
		lea	4(a2),a2

		dbf	d0,.loop

		tst.w	d3
		bne	.more_fade

		movem.l	(sp)+,a0-a5/d0-d7
		rts

*******************************************************************************
*******************************************************************************
*******************************************************************************
;Change an unsigned  word into a decimal string
;INPUT:		d0=number (word)
;		a0=address of 5 bytes destination (long)
;OUTPUT:	none
;CHANGES:       d0/a1

ITOA_WU		macro
		movem.l	d0/a0,-(sp)
		move.w	\1,d0
                lea	\2,a0
		jsr	itoa_wu
		movem.l	(sp)+,d0/a0
		endm

itoa_wu		move.b	#"/",(a0)
		move.b	#"/",1(a0)
		move.b	#"/",2(a0)
		move.b	#"/",3(a0)
		move.b	#"0",4(a0)
		and.l	#$ffff,d0

.loop_10000	add.b	#1,(a0)			;find number of 10000's
		subi.l	#10000,d0
		bpl.s	.loop_10000
.not_zero_10000	addi.l	#10000,d0

.loop_1000	add.b	#1,1(a0)		;find number of 1000's
		subi.l	#1000,d0
		bpl.s	.loop_1000
.not_zero_1000	addi.l	#1000,d0

.loop_100	add.b	#1,2(a0)		;find number of 100's
		subi.l	#100,d0
		bpl.s	.loop_100
.not_zero_100	addi.l	#100,d0

.loop_10	add.b	#1,3(a0)		;find number of 10's
		subi.l	#10,d0
		bpl.s	.loop_10
.not_zero_10	addi.l	#10,d0

		add.b	d0,4(a0)

		cmpi.b	#"0",(a0)
		bne.s	.end
		move.b	#" ",(a0)
		cmpi.b	#"0",1(a0)
		bne.s	.end
		move.b	#" ",1(a0)
		cmpi.b	#"0",2(a0)
		bne.s	.end
		move.b	#" ",2(a0)
		cmpi.b	#"0",3(a0)
		bne.s	.end
		move.b	#" ",3(a0)

.end		rts

;Change an unsigned word into a 2 digit string
;INPUT:		d0=number (word)
;		a0=address of 2 bytes destination (long)
;OUTPUT:	none
;CHANGES:       d0/a1

ITOA_BU		macro
		movem.l	d0/a0,-(sp)
		move.w	\1,d0
                lea	\2,a0
		jsr	itoa_bu
		movem.l	(sp)+,d0/a0
		endm

itoa_bu
		movem.l	a0/d0,-(sp)

		move.b	#"/",(a0)
		move.b	#"0",1(a0)
		and.l	#$ff,d0

.loop_10	add.b	#1,(a0)				;find number of 10's
		subi.l	#10,d0
		bpl.s	.loop_10
.not_zero_10	addi.l	#10,d0

		add.b	d0,1(a0)

		movem.l	(sp)+,a0/d0
		rts

;Change an unsigned word into a 1 digit string
;INPUT:		d0=number (word)
;		a0=address of 1 byte destination (long)
;OUTPUT:	none
;CHANGES:       d0/a1

ITOA_1U		macro
		movem.l	d0/a0,-(sp)
		move.b	#"0",\2
		add.b	\1,\2
		movem.l	(sp)+,d0/a0
		endm

;Change an unsigned word into a 3 digit string
;INPUT:		d0=number (word)
;		a0=address of 3 bytes destination (long)
;OUTPUT:	none
;CHANGES:       d0/a1

ITOA_3U		macro
		movem.l	d0/a0,-(sp)
		move.w	\1,d0
                lea	\2,a0
		jsr	itoa_3u
		movem.l	(sp)+,d0/a0
		endm

itoa_3u
		movem.l	a0/d0,-(sp)

		move.b	#"/",(a0)
		move.b	#"/",1(a0)
		move.b	#"0",2(a0)
		and.l	#$fff,d0

.loop_100	add.b	#1,(a0)			;find number of 100's
		subi.l	#100,d0
		bpl.s	.loop_100
.not_zero_100	addi.l	#100,d0

.loop_10	add.b	#1,1(a0)		;find number of 10's
		subi.l	#10,d0
		bpl.s	.loop_10
.not_zero_10	addi.l	#10,d0

		add.b	d0,2(a0)

		movem.l	(sp)+,a0/d0
		rts

*******************************************************************************
ITOA_WUZ	macro
		movem.l	d0/a0,-(sp)
		move.w	\1,d0
                lea	\2,a0
		jsr	itoa_wuz
		movem.l	(sp)+,d0/a0
		endm

itoa_wuz	move.b	#"/",(a0)
		move.b	#"/",1(a0)
		move.b	#"/",2(a0)
		move.b	#"/",3(a0)
		move.b	#"0",4(a0)
		and.l	#$ffff,d0

.loop_10000	add.b	#1,(a0)			;find number of 10000's
		subi.l	#10000,d0
		bpl.s	.loop_10000
.not_zero_10000	addi.l	#10000,d0

.loop_1000	add.b	#1,1(a0)		;find number of 1000's
		subi.l	#1000,d0
		bpl.s	.loop_1000
.not_zero_1000	addi.l	#1000,d0

.loop_100	add.b	#1,2(a0)		;find number of 100's
		subi.l	#100,d0
		bpl.s	.loop_100
.not_zero_100	addi.l	#100,d0

.loop_10	add.b	#1,3(a0)		;find number of 10's
		subi.l	#10,d0
		bpl.s	.loop_10
.not_zero_10	addi.l	#10,d0

		add.b	d0,4(a0)

.end		rts

****************************************************************************
****************************** Play IFF animation **************************
****************************************************************************

			rsreset
anim_scr_address	rs.l	1		;provided by user
anim_data_address	rs.l	1

anim_scr_width		rs.w	1
anim_scr_plane_size	rs.w	1
anim_last_scr_address	rs.l	1
anim_colour_map		rs.l	1
anim_first_frame	rs.l	1
anim_next_frame		rs.l	1
anim_frame_count	rs.w	1
anim_frame_total	rs.w	1

bmhd_width		rs.w	1		;from BMHD chunk
bmhd_height		rs.w	1
bmhd_x			rs.w	1
bmhd_y			rs.w	1
bmhd_depth		rs.b	1
bmhd_mask		rs.b	1
bmhd_compression	rs.b	1
CMP_NONE		equ	0		;compression types
CMP_BYTERUN1		equ	1
bmhd_pad		rs.b	1
bmhd_transparent	rs.w	1
bmhd_x_aspect		rs.b	1
bmhd_y_aspect		rs.b	1
bmhd_page_width		rs.w	1
bmhd_page_height	rs.w	1

anim_vars_size		rs.b	0		;56 bytes

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a0.l=address of workspace
;		a1.l=address of to anim data
;OUTPUT:	a0.l=address of CMAP chunk (0=no colour map found)
;CHANGES:	none

ANIM_initialise
		movem.l	d1-d7/a1-a6,-(sp)

		move.l	a0,a5
		move.l	a1,anim_data_address(a5)

		bsr	ANIM_read_chunks

		move.w	#1,anim_frame_count(a5)

		move.l	anim_colour_map(a5),a0

		movem.l	(sp)+,d1-d7/a1-a6
		rts

****************************************************************************
;INPUT:		a0.l=address of CMAP chunk (0=no colour map found)
;		a1.l=address of colours in copperlist
;OUTPUT:	none
;CHANGES:	none

ANIM_init_copper_palette
		movem.l	d0-d2/a0-a1,-(sp)

		cmp.l	#0,a0			;CMAP exists?
		beq.s	.ret			;no, then branch

		move.l	(a0)+,d0
		beq.s	.ret			;branch if chunk empty

.next_colour	lea	2(a1),a1
		moveq.l	#0,d2

		move.b	(a0)+,d1		;get red component
		lsl.w	#4,d1
		and.w	#$0f00,d1
		or.w	d1,d2

		move.b	(a0)+,d1		;get green component
		and.w	#$00f0,d1
		or.w	d1,d2

		move.b	(a0)+,d1		;get blue component
		lsr.w	#4,d1
		and.w	#$000f,d1
		or.w	d1,d2

		move.w	d2,(a1)+

		subq.w	#3,d0
		bpl.s	.next_colour

.ret		movem.l	(sp)+,d0-d2/a0-a1
		rts

****************************************************************************
;INPUT:		a0.l=address of workspace
;		a1.l=address of drawing buffer
;OUTPUT:	d0.l=result 0=ok, 1=last frame
;CHANGES:	none

ANIM_draw_next_frame
		movem.l	d1-d7/a0-a6,-(sp)

		move.l	a0,a5
		move.l	anim_scr_address(a5),anim_last_scr_address(a5)
		move.l	a1,anim_scr_address(a5)

		cmpi.w	#1,anim_frame_count(a5)		;first frame?
		bne.s	.not_first			;no, then branch
		bsr	ANIM_draw_picture
		bra.s	.cont
.not_first
		cmpi.w	#2,anim_frame_count(a5)		;second frame?
		bne.s	.not_second			;no, then branch
		bsr	ANIM_copy_picture
		bsr	ANIM_draw_frame
		move.l	anim_next_frame(a5),anim_first_frame(a5)
		bra.s	.cont
.not_second
		bsr	ANIM_draw_frame

.cont		moveq.l	#0,d0				;flag ok

		move.w	anim_frame_total(a5),d1
		sub.w	anim_frame_count(a5),d1		;last frame?
		bgt.s	.ret				;no, then branch

		tst.w	d1
		beq.s	.last_frame
		cmpi.w	#-2,d1
		beq.s	.restart

.ret		add.w	#1,anim_frame_count(a5)
		movem.l	(sp)+,d1-d7/a0-a6
		rts
		
.last_frame	moveq.l	#1,d0				;flag last frame
		bra.s	.ret

.restart	move.l	anim_first_frame(a5),anim_next_frame(a5)
		move.w	#2,anim_frame_count(a5)
		bra.s	.ret

****************************************************************************
;INPUT:		a5.l=address of variables
;OUTPUT:	none
;CHANGES:	none
ANIM_copy_picture
		move.w	bmhd_page_width(a5),d0
		lsr	#3,d0
		mulu	bmhd_page_height(a5),d0
		moveq.l	#0,d1
		move.b	bmhd_depth(a5),d1
		mulu	d1,d0

		divu	#40,d0
		subq.w	#1,d0

		move.l	anim_last_scr_address(a5),a2
		move.l	anim_scr_address(a5),a0

.loop		move.l	(a2)+,(a0)+
		move.l	(a2)+,(a0)+
		move.l	(a2)+,(a0)+
		move.l	(a2)+,(a0)+
		move.l	(a2)+,(a0)+
		move.l	(a2)+,(a0)+
		move.l	(a2)+,(a0)+
		move.l	(a2)+,(a0)+
		move.l	(a2)+,(a0)+
		move.l	(a2)+,(a0)+

		dbf	d0,.loop
		
		rts

****************************************************************************
;INPUT:		a5.l=address of variables
;OUTPUT:	none
;CHANGES:	none

ANIM_draw_picture
		move.l	anim_data_address(a5),a4
		move.l	#20000,d3
		move.l	#"BODY",d0
		bsr	ANIM_find_chunk
		lea	4(a4),a4		;skip chunk length
		move.l	a4,a3

		tst.b	bmhd_compression(a5)	;compression?
		beq.s	display_body		;no, then branch

		cmpi.b	#CMP_BYTERUN1,bmhd_compression(a5)
						;byte run type 1 compression?
		beq.s	decompress_body		;yes, then branch

;if reached here then compression type is not supported
		rts


display_body	move.l	anim_scr_address(a5),a0
		move.l	a0,a1			;save drawing buffer base
		move.l	a0,a2			;save drawing buffer base

		move.w	bmhd_height(a5),d7	;bmhd_height
		subq.w	#1,d7

.body_loop	moveq.l	#0,d6
		move.b	bmhd_depth(a5),d6	;number of bitplanes
		subq.w	#1,d6

.planes_loop	move.w	anim_scr_width(a5),d5	;number of columns
		subq.w	#1,d5

.lines_loop	move.b	(a4)+,(a0)+		;copy object to buffer
		dbf	d5,.lines_loop

		add.w	anim_scr_plane_size(a5),a1
		move.l	a1,a0
		dbf	d6,.planes_loop

		add.w	anim_scr_width(a5),a2
		move.l	a2,a0
		move.l	a2,a1
		dbf	d7,.body_loop

		rts

;
;Algorithm for decompressing the BODY chunk
;
; LOOP until produced the desired number of bytes
;  Read the next source byte into n
;  SELECT n FROM
;   [0..127]   => copy the next n+1 bytes literally
;   [-1..-127] => replicate the next byte -n+1 times
;   -128       => no operation
;  END SELECT;
; END LOOP;
;

decompress_body
		move.l	anim_scr_address(a5),a0
		move.l	a0,a1
		move.l	a0,a2

		move.w	bmhd_height(a5),d7
		subq.w	#1,d7

.body_loop	moveq.l	#0,d6
		move.b	bmhd_depth(a5),d6
		subq.w	#1,d6

.planes_loop	move.w	anim_scr_width(a5),d5
		subq.w	#1,d5

.lines_loop	move.b	(a4)+,d0
		bpl.s	.literal_copy

		cmp.b	#-128,d0
		beq.s	.lines_loop

		neg.b	d0
		ext.w	d0
		sub.w	d0,d5
		move.b	(a4)+,d1
.replicate_loop	move.b	d1,(a0)+
		dbf	d0,.replicate_loop
		bra.s	.cont

.literal_copy	ext.w	d0
		sub.w	d0,d5
.literal_loop	move.b	(a4)+,(a0)+
		dbf	d0,.literal_loop

.cont		dbf	d5,.lines_loop

		add.w	anim_scr_plane_size(a5),a1
		move.l	a1,a0
		dbf	d6,.planes_loop

		add.w	anim_scr_width(a5),a2
		move.l	a2,a0
		move.l	a2,a1
		dbf	d7,.body_loop

		rts

****************************************************************************
;INPUT:		a5.l=address of variables
;OUTPUT:	none
;CHANGES:	none

ANIM_draw_frame
		move.l	anim_next_frame(a5),a4
		move.l	#20000,d3
 		move.l	#"DLTA",d0
		bsr	ANIM_find_chunk

.anim_loop	move.l	(a4)+,d0		;length of anim data
 		move.l	a4,a0
		add.l	d0,a0
		move.l	a0,anim_next_frame(a5)	;start of next frame of anim
		move.l	a4,d1			;remember address of current anim data
		move.l	anim_scr_address(a5),a3	;a3 is ptr to bitplane in drawing buffer

		moveq.l	#0,d7
		move.b	bmhd_depth(a5),d7	;number of bitplanes
		subq.w	#1,d7

.planes_loop	move.l	d1,a0			;a0 is pointer to anim data
		move.l	(a4)+,d0		;get bitplane data offset
		beq.s	.end_of_plane

		add.l	d0,a0			;a0 holds start of bitplane info
		move.l	a3,a2			;a2 is ptr to column in drawing buffer
		move.w	anim_scr_width(a5),d6	;number of columns of screen
		subq.w	#1,d6

.columns_loop	move.l	a2,a1			;a1 is ptr to byte in drawing buffer
		moveq.l	#0,d5
		move.b	(a0)+,d5		;number of bytes in column
		beq.s	.end_of_column		;if none then skip a column
		subq.b	#1,d5

.byte_loop	moveq.l	#0,d0
		move.b	(a0)+,d0		;anim data to skip,copy or repeat bytes
		beq.s	.repeat_bytes
		bmi.s	.copy_bytes
		mulu	anim_scr_width(a5),d0	;skip d0 lines down.
		add.l	d0,a1			;add to byte address
		dbf	d5,.byte_loop
		bra.s	.end_of_column

.copy_bytes	add.b	#127,d0			;get in range 0 to 127
.copy_loop	move.b	(a0)+,(a1)		;anim data to drawing buffer
		add.w	anim_scr_width(a5),a1	;add modulo for next byte down
		dbf	d0,.copy_loop
		dbf	d5,.byte_loop
		bra.s	.end_of_column

.repeat_bytes	move.b	(a0)+,d0		;number of bytes to be copied
		subq.b	#1,d0			;num bytes -1 for dbra d0
		move.b	(a0)+,d4		;anim data to be repeated

.repeat_loop	move.b	d4,(a1)			;anim data in drawing buffer
		add.w	anim_scr_width(a5),a1	;add for next byte
		dbf	d0,.repeat_loop
		dbf	d5,.byte_loop

.end_of_column	lea	1(a2),a2		;move to top of next column
		dbf	d6,.columns_loop

.end_of_plane	add.w	anim_scr_plane_size(a5),a3	;next bitplane
		dbf	d7,.planes_loop

		rts

***********************************************************************************
;INPUT:		a5.l=address of variables
;OUTPUT:	none
;CHANGES:	none

ANIM_read_chunks
		move.l	anim_data_address(a5),a4
		move.l	#20000,d3
		move.l	#"BMHD",d0
		bsr	ANIM_find_chunk

		lea	4(a4),a4		;skip chunk length
		move.w	(a4)+,bmhd_width(a5)
		move.w	(a4)+,bmhd_height(a5)
		move.w	(a4)+,bmhd_x(a5)
		move.w	(a4)+,bmhd_y(a5)
		move.b	(a4)+,bmhd_depth(a5)
		move.b	(a4)+,bmhd_mask(a5)
		move.b	(a4)+,bmhd_compression(a5)
		move.b	(a4)+,bmhd_pad(a5)
		move.w	(a4)+,bmhd_transparent(a5)
		move.b	(a4)+,bmhd_x_aspect(a5)
		move.b	(a4)+,bmhd_y_aspect(a5)
		move.w	(a4)+,bmhd_page_width(a5)
		move.w	(a4)+,bmhd_page_height(a5)

		move.w	bmhd_page_width(a5),d0
		lsr.w	#3,d0
		move.w	d0,anim_scr_width(a5)
		mulu	bmhd_page_height(a5),d0
		move.w	d0,anim_scr_plane_size(a5)

		move.l	#0,anim_colour_map(a5)

		move.l	anim_data_address(a5),a4
		move.l	#20000,d3
		move.l	#"CMAP",d0
		bsr	ANIM_find_chunk
		tst.w	d3
		beq.s	.no_colour_map
		move.l	a4,anim_colour_map(a5)
.no_colour_map
		move.w	#0,anim_frame_total(a5)

		move.l	anim_data_address(a5),a4
		move.l	#20000,d3
		move.l	#"DPAN",d0
		bsr	ANIM_find_chunk
		tst.w	d3
		beq.s	.not_animation

		move.w	6(a4),anim_frame_total(a5)	;get number of frames

		move.l	anim_data_address(a5),a4
		move.l	#20000,d3
		move.l	#"ANHD",d0		;search for anim header
		bsr	ANIM_find_chunk

		move.l	a4,anim_next_frame(a5)

.not_animation	rts

****************************************************************************
;INPUT:		d0.l=string to search for e.g. "BMHD"
;		a4.l=start address (even)
;		d3.l=distance to search in bytes
;OUTPUT:	a4.l=address after matching string
;		d3.l=result 0=not found, -1=found
;CHANGES:	d0-d1,a0

ANIM_find_chunk
		lsr.w	#1,d3
.loop		cmp.l	(a4),d0
		beq.s	.found
		addq.w	#2,a4
		dbf	d3,.loop
		moveq.l	#0,d3
		rts

.found		addq.w	#4,a4
		moveq.l	#-1,d3
		rts


****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a0.l=address of source
;		a1.l=address of destination
;OUTPUT:	d0.l=length of unpacked file (0=error)
;CHANGES:	none

PP_DECRUNCH	macro
		movem.l	a0-a1,-(sp)
		move.l	\1,a0			;source
		move.l	\1,a1			;destination
		jsr	pp_decrunch
		movem.l	(sp)+,a0-a1
		endm

PP_DECRUNCH_QUIET	macro
		movem.l	a0-a1,-(sp)
		move.l	\1,a0			;source
		move.l	\1,a1			;destination
		jsr	pp_decrunch_quiet
		movem.l	(sp)+,a0-a1
		endm

pp_decrunch	bsr	decrunch
		tst.w	d0
		bne	.ok
		SHOW_MESG decrunch_error
		tst.l	os_kill
		bne	.os_dead
		jsr	kill_screen
.os_dead
.freeze		ERROR_COLOUR #front_decrunch_failed
		bra.s	.freeze
.ok		rts

pp_decrunch_quiet
		bsr	decrunch
		tst.w	d0
		bne	.ok
.freeze		ERROR_COLOUR #front_decrunch_failed
		bra.s	.freeze
.ok		rts

decrunch
		cmpi.b	#"R",0(a0)
		bne	no_decrunch
		cmpi.b	#"N",1(a0)
		bne	no_decrunch
		cmpi.b	#"C",2(a0)
		bne	no_decrunch

		include	rnc_1.s

no_decrunch	moveq.l	#-1,d0
		rts

decrunch_error	dc.b	ABSPOS,0>>8,0,0>>8,0
		PHRASE	265
		dc.b    ENDTEXT

		even

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a0.l=address of chip (for db screen)
;		a1.l=address of anim
;OUTPUT:	none
;CHANGES:	none

play_anim
		tst.l	os_kill
		bne	.os_dead
		rts
.os_dead
;setup short dpaint animation
		move.l	a0,-(sp)

		lea	iff_variables+variables(a5),a0
		jsr	ANIM_initialise

                move.l	#lc_anim_copperlist+anim_palette,a1
		add.l	a4,a1
		jsr	ANIM_init_copper_palette

		move.l	(sp)+,a0

		move.l	a0,viewing_buffer
		add.l	#anim_plane_size*anim_num_planes,a0
		move.l	a0,drawing_buffer

;		move.w	#%1000000001000000,dmacon(a6)	;enable blitter dma
;		BLIT_FILL drawing_buffer,#anim_plane_width/16,#anim_plane_height,#anim_num_planes,#anim_plane_size,#0
;		BLIT_FILL viewing_buffer,#anim_plane_width/16,#anim_plane_height,#anim_num_planes,#anim_plane_size,#0
;		WAIT_BLIT

		WAIT_VBLANK
		DELAY	#250
		move.l  drawing_buffer,a1
		lea	iff_variables+variables(a5),a0
		jsr	ANIM_draw_next_frame

		move.l	#lc_anim_copperlist+anim_bplpt,a0
		add.l	chip_mem_base,a0
		SWAP_PLANE_BUFFERS (a0),#anim_plane_size,#anim_num_planes
		WAIT_VBLANK
		jsr	set_up_anim_screen

;play the animation once

.not_last_frame
		move.l  drawing_buffer,a1
		lea	iff_variables+variables(a5),a0
		jsr	ANIM_draw_next_frame
		WAIT_VBLANK
		move.l	#lc_anim_copperlist+anim_bplpt,a0
		add.l	chip_mem_base,a0
		SWAP_PLANE_BUFFERS (a0),#anim_plane_size,#anim_num_planes
		tst.l	d0
		beq	.not_last_frame

		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:		a0.l=address of message
;OUTPUT:	none
;CHANGES:	none

PUSH_MESG	macro
		movem.l	d0-d2/a0-a2,-(sp)
		lea	.text\@(pc),a0
		jsr	push_msg
		movem.l	(sp)+,d0-d2/a0-a2
		bra	.skip\@
.text\@		dc.l	0,0
		dc.b	\1,0
		even
.skip\@
		endm

PUSH_MESG_RAND	macro
		movem.l	d0-d2/a0-a2,-(sp)
		move.w	\1,d0
		jsr	push_mesg_rand
		movem.l	(sp)+,d0-d2/a0-a2
		endm

push_mesg_rand
                move.l	#mesgs,a1
		add.l	a5,a1

		move.l	a1,a0
		lsl.w	#2,d0
		add.w	d0,a0

		move.w	(a0)+,d0
		moveq.l	#0,d1
		move.w	variables+random_num(a5),d1
	IFD	demo
		tst.w	global_vars+attract_mode(a5)
		bne.s	.skip_rand
	ENDC
		move.w	vhposr(a6),d2
		eor.w	d2,d1
.skip_rand
		mulu	#47,d1
		move.w	d1,variables+random_num(a5)
		andi.w	#$ff,d1
		mulu	d0,d1
		lsr.w	#$7,d1
		andi.w	#%1111111111111110,d1

		move.w	(a0),a0
		add.l	a1,a0

		move.w	0(a0,d1.w),a0
		add.l	a1,a0

		jsr	push_msg

		rts

push_msg
		bsr	count_participants
		addq.w	#1,d0
		cmp.w	variables+players_alive(a5),d0
		bgt	.end

		move.l	variables+scroll_head(a5),a1
		cmp.l	#0,a1
		bne	.not_empty_list

		tst.l	variables+scroll_head(a5)
		bne.s	.ok
		clr.w	variables+scroll_ch_width(a5)
.ok		clr.w	variables+scrolly_on(a5)

		clr.l	scroll_node_prec(a0)
		clr.l	scroll_node_succ(a0)

		add.w	#scroll_node_text,a0
		move.l	a0,variables+scroll_prt(a5)
		sub.w	#scroll_node_text,a0
		move.l	a0,variables+scroll_head(a5)
		move.l	a0,variables+scroll_tail(a5)

		rts

.not_empty_list
.find_same	cmp.l	a0,a1
		beq.s	.end            ;abort if message already in list
		cmp.l	#0,a1
		beq.s	.not_found
		move.l	scroll_node_succ(a1),a1
		bra.s	.find_same
.not_found
		move.l	variables+scroll_tail(a5),a1
		move.l	a0,scroll_node_succ(a1)

		move.l	a1,scroll_node_prec(a0)
		clr.l	scroll_node_succ(a0)

		move.l	a0,variables+scroll_tail(a5)

.end		rts


count_participants
                lea	scroll_node_text(a0),a1
		moveq.l	#0,d0

.next		move.b	(a1)+,d1
		beq.s	.end
		cmpi.b	#27,d1
		bne.s	.next
		addq.w	#1,d0
		bra.s	.next

.end		rts

*******************************************************************************
*******************************************************************************
*******************************************************************************
;Uncompress.
;INPUT:		a0=address of crunched data (long)
;		a1=address of destination (long)
;OUTPUT:        Z set = ok
;CHANGES:       d0

cr_decrunch	bsr	decrunchc
		beq	.ok
		SHOW_MESG decrunch_error
.freeze	bra.s	.freeze
.ok		rts

PutByte		macro
		move.b	d0,-(a1)
		endm

decrunchc	movem.l	d1-d7/a0-a6,-(sp)

		moveq	#0,d4
		move.l	a1,a3			; store the base pointer
		move.b	(a0),d4
		addq	#1,d4			; d4 - CurrNumberOfBits
		move.b	1(a0),d3		; d3 - CheckSum
		move.l	2(a0),d0		; d0 - length of uncompacted data
		add.l	d0,a1			; a1 - pointer to destination data
		move.l	6(a0),d0		; d0 - length of compacted data
		add.l	d0,a0			; a0 - pointer to source data

		move.b	-(a0),d2		; d2 - CurrByte
		eor.b	d2,d3			; Unravel checksum

DCloop		moveq.l	#1,d1
		bsr	ReadBits		; get 1 bit
		cmp.w	#1,d0
		bne	DCBit1Unset

		moveq.l	#2,d1
		bsr	ReadBits		; get 2 bits
		cmp.w	#2,d0
		bge	DCNotSmallToMedium

		move.w	d0,d5
		addq.w	#2,d5			; get size of pattern
		move.w	d0,d1
		add.w	#9,d1			; get number of bit in offset
		bsr	DoDuplicate
		bra	DCNextToken

DCNotSmallToMedium
		cmp.w	#3,d0
		bne	DCNotACopy

		moveq.l	#8,d1
		bsr	ReadBits		; get size of copy
		addq	#8,d0			; should have been 9 adjust for dbf
		move.w	d0,d5
		bra	DCCopyloop

DCNotACopy	moveq.l	#8,d1
		bsr	ReadBits		; get size of pattern
		move.w	d0,d5
		moveq.l	#12,d1			; get number of bits in offset
		bsr	DoDuplicate		; copy the pattern
		bra	DCNextToken

DCBit1Unset	moveq.l	#1,d1
		bsr	ReadBits		; get 1 bit
		cmp.w	#1,d0
		bne	DCNoDuplicate

		moveq.l	#1,d5
		moveq.l	#8,d1
		bsr	DoDuplicate
		bra	DCNextToken

DCNoDuplicate
		moveq.l	#3,d1
		bsr	ReadBits
		move.w	d0,d5
DCCopyloop	moveq.l	#8,d1
		bsr	ReadBits
		PutByte
		dbf	d5,DCCopyloop

DCNextToken	cmp.l	a3,a1			; check to see if we have finished
		bgt	DCloop			; if a1>a3 then loop

		move.b	d3,d0
		movem.l	(sp)+,d1-d7/a0-a6
		tst.b	d0
		rts

*******************************************************************************
; Copy patterns from memory to the current buffer
;
; on entry :-
;	d5 - length of the pattern
;	d1 - number of bits to read for offset of the pattern
;	a0 - source pointer
;	a1 - destination pointer
;
DoDuplicate	bsr	ReadBits
DDloop		subq.l	#1,a1
		move.l	a1,a2
		add.l	d0,a2			; a2 points to start of pattern
		addq.l	#1,a2
		move.b	(a2),(a1)		; move the byte
		dbf	d5,DDloop
		rts

*******************************************************************************
; Read bits from the buffer
;
; on entry :-
;	d1 - number of bits to read for offset of the pattern
;	a0 - source pointer
;
; on exit :-
;	d0 - contains extracted bits
;
; Note :-
;	d2 - CurrByte
;	d3 - checksum
;	d4 - CurrNumberOfBits
;
ReadBits	moveq	#0,d0
		subq.w	#1,d1
RBloop		subq	#1,d4
		bne.s	RBskip

		move.b	-(a0),d2
		eor.b	d2,d3			; unravel the checksum
		moveq	#8,d4

RBskip		lsr.b	#1,d2
		roxl.w	#1,d0
		dbf	d1,RBloop

		rts

****************************************************************************
********************************* Square root ******************************
****************************************************************************
;Finds the integer square root of a 32 bit unsigned number.
;INPUT:		d0.l = square
;OUTPUT:	d3.w = root
;CHANGES:	d1-d4
square_root	moveq.l	#32,d1
		moveq.l	#0,d3		;d3 = partial root
		move.l	#1<<30,d4

.loop		move.l	d3,d2
		lsl.l	d1,d2
		add.l	d4,d2		;subtrahend = partial_root << (count*2) + 1 << (count-1 *2)

		cmp.l	d0,d2
		bhi.s	.more

		sub.l	d2,d0		;square = square - subtrahend
		add.w	d3,d3
		addq.w	#1,d3		;partial_root = partial_root * 2 + 1
		bra.s	.less

.more		add.w	d3,d3		;partial_root = partial_root * 2

.less		lsr.l	#2,d4
		subq.w	#2,d1
		bne.s	.loop

		rts

