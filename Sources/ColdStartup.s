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
********************************************************************************
********************************************************************************
;INPUT:		d0.l= hi word = kill sys flag (-1=kill sys, 0=OS intact)
;                     lo word = language chosen
;		d1.l-d3.l=parameters
;                       d1.l=0 campaign game
;                            1 action game
;                            2 attract mode record in campaign game
;                            3 attract mode play in campaign game
;			d2.l=number of players (in demo/editor)
;		d4.l=checksum failed flag
;		d5.l=config info
;		d6.l=size of ram disk
;		a2.l=base of extra chip memory
;		a3.l=base of extra fast memory
;		a4.l=base of chip memory
;		a5.l=base of fast memory
;		a6.l=base of ram disk
;		a0.l=base of parameters/variables block (if os friendly)
;OUTPUT:	none
;CHANGES:	all

fast_mem_base	ds.l	1
chip_mem_base	ds.l	1
exfast_mem_base	ds.l	1
exchip_mem_base	ds.l	1
ram_disk_base	ds.l	1
ram_disk_size	ds.l	1
ram_disk_used	ds.w	1
os_kill		ds.l	1
vars_block	ds.l	1
loaded_backsfx	ds.w	1
loaded_style	ds.w	1
loaded_mons1	ds.w	1
loaded_mons2	ds.w	1
loaded_pl1	ds.b    28
loaded_pl2	ds.b    28
loaded_pl3	ds.b	28
loaded_pl4	ds.b	28
loaded_disk	ds.w	1
loaded_copper	ds.w	1
position_chosen	ds.w	1
bank_chosen	ds.l	1
number_players	ds.w    1
waitcol		ds.w	1
config_info	ds.l	1
cheat_mode	ds.w	1
cheat_mode2	ds.w	1
cheat_mode3	ds.w	1
checksum_flag	ds.w	1
lang		ds.b	1
noexit		ds.b	1

save_device	ds.w	1
save_mode	ds.w	1
MODE_LOADING	equ	0
MODE_SAVING	equ	1
save_method	ds.w	1
SAVE_TO_RAM	equ	1
SAVE_TO_FLOPPY	equ     2
SAVE_TO_HARD	equ     3
ABANDON_SAVE	equ	4
FORMAT_DISK	equ     5

START
		exg	d0,a4
		add.l	#$00000007,d0
		and.l	#$ffffff08,d0
		exg	d0,a4

		move.l	a2,exchip_mem_base
		move.l	a3,exfast_mem_base
		move.l	a6,ram_disk_base
		move.l	d5,config_info
		move.l	d6,ram_disk_size
		move.w	d2,number_players
		move.w	d4,checksum_flag
		move.l	a5,fast_mem_base
		add.l	#code_size,a5		;allow space for program
		move.l	a4,chip_mem_base
		move.b	d0,lang
		bpl.s	.lang_ok
		clr.b	lang			;default to english
.lang_ok

		swap	d0
		tst.w	d0
		bne.s	.not_os_friendly

		move.l	#0,os_kill
		move.l	a0,vars_block
		move.l	#$dff000,a6		;hardware regs base
		move.l	a7,stack_ptr		;remember this for emergencies

		jsr	main_program

		movem.l	d0-d7/a0-a6,-(sp)
		jsr	_RemPlayer		;deinstall med module player
		movem.l	(sp)+,d0-d7/a0-a6

		jsr	restore_system
		moveq.l	#0,d0			;flag no error
		rts

.not_os_friendly
		move.l	#-1,os_kill
		move.w	#$2700,sr
		move.l	#$dff000,a6		;hardware regs base
	IFD	download
		move.l	#super_routine,$84	;into supervisor mode
		trap	#1			;go!
		rts
super_routine
	ENDC
		move.l	#super_stack,a7
		add.l	a5,a7			;super stack pointer

		jmp	main_program		;run main program

stack_ptr	dc.l	0			;for emergencies

********************************************************************************

level1		move.w	#%0000000000000011,intreq+$dff000
		rte

level2		movem.l	d0-d7/a0-a6,-(sp)
		move.b	ciaaicr,d0
		btst	#3,d0
		beq.s	.not_for_me		;check it was serial flag
		jsr	level2_dead
.not_for_me	move.w	#%0000000000001000,intreq+$dff000
		movem.l	(sp)+,d0-d7/a0-a6
		rte

level3		movem.l	d0-d7/a0-a6,-(sp)
		move.w	intreqr+$dff000,d0
		btst.l	#4,d0			;copper interrupt?
		beq.s	.not_copper
		jsr     copper_interrupt
		move.w	#%0000000000010000,intreq+$dff000
		movem.l	(sp)+,d0-d7/a0-a6
		rte
.not_copper	btst.l	#5,d0			;vlbank interrupt?
		beq.s	.not_vblank
		jsr	vblank_interrupt
		move.w	#%0000000000100000,intreq+$dff000
		movem.l	(sp)+,d0-d7/a0-a6
		rte
.not_vblank
	IFD	BLITQ
		move.w	#%0000000001000000,intreq+$dff000
		jsr	blitq
        ENDC
		movem.l	(sp)+,d0-d7/a0-a6
		rte

level4		move.w	#%0000011110000000,intreq+$dff000
		rte

level5		move.w	#%0001100000000000,intreq+$dff000
		rte

level6		movem.l	d0-d7/a0-a6,-(sp)
		jsr	ciab_ta_interrupt
		move.w	#%0010000000000000,intreq+$dff000
		movem.l	(sp)+,d0-d7/a0-a6
		rte

level7		rte

********************************************************************************
********************************************************************************
********************************************************************************
;Level 2 interrupt routine for keyboard.
;INPUT:		none
;OUTPUT:	none
;CHANGES:	none

level2_dead
		move.l	#$dff000,a6

		move.b	ciaasdr,d0		;read from the serial line
		ror.b	#1,d0			;up/down last bit
		not.b	d0			;data is inverted
		or.b	#%00000001,ciaasdr	;pulse spdat low
		or.b	#%01000000,ciaacra	;set serial to output
		DELAY	#3
		and.b	#%10111111,ciaacra	;set serial back to input
		bsr.s	read_keyboard

		moveq.l	#1,d0			;flag, request for me
		rts

.not_for_me	moveq.l	#0,d0			;flag, request not for me
		rts

level2_key_interrupt
		move.l	#$dff000,a6

		move.b	ciaasdr,d0		;read from the serial line
		beq.s	.not_for_me

		ror.b	#1,d0			;up/down last bit
		not.b	d0			;data is inverted
		or.b	#%00000001,ciaasdr	;pulse spdat low
		or.b	#%01000000,ciaacra	;set serial to output
		DELAY	#3
		and.b	#%10111111,ciaacra	;set serial back to input
		clr.b	ciaasdr			;reset serial
		bsr.s	read_keyboard

		move.b	ciaaicr,d0		;clear request
		moveq.l	#1,d0			;flag, request for me
		rts

.not_for_me	moveq.l	#0,d0			;flag, request not for me
		rts

********************************************************************************
key_list	dc.l	default_key_list

read_keyboard	move.l	key_list,a5

		moveq.l	#0,d1		;reset key release flag
		tst.b	d0		;test for key down
		bpl.s	.key_down
		sub.b	#$80,d0
		move.b	d0,1(a5)	;store key up
		moveq.l	#1,d1		;if key release then d1=1
		addq.l	#2,a5
		bra	.do_key

.key_down	move.b	d0,(a5)		;store key down
		lea	cheat_buffer,a1
		move.b	7(a1),8(a1)
		move.b	6(a1),7(a1)
		move.b	5(a1),6(a1)
		move.b	4(a1),5(a1)
		move.b	3(a1),4(a1)
		move.b	2(a1),3(a1)
		move.b	1(a1),2(a1)
		move.b	(a1),1(a1)
		move.b	d0,(a1)

		cmp.l	#$20361714,(a1)
		bne.s	.not_cheat1
		cmp.l	#$21171325,4(a1)
		bne.s	.not_cheat1
		cmp.b	#$33,8(a1)
		bne.s	.not_cheat1
		st.b	cheat_mode
		move.w	#30000,d2
.loop2		move.w	#$f00,$dff180
		dbf	d2,.loop2
		move.w	#0,$dff180
.not_cheat1
		cmp.l	#$12142024,(a1)
		bne.s	.not_cheat2
		cmp.l	#$12281919,4(a1)
		bne.s	.not_cheat2
		cmp.b	#$20,8(a1)
		bne.s	.not_cheat2
		st.b	cheat_mode2
		move.w	#30000,d2
.loop3		move.w	#$0f0,$dff180
		dbf	d2,.loop3
		move.w	#0,$dff180
.not_cheat2
		cmp.l	#$20241737,(a1)
		bne.s	.not_cheat3
		cmp.b	#$20,4(a1)
		bne.s	.not_cheat3
		st.b	cheat_mode
		st.b	cheat_mode2
		st.b	cheat_mode3
		move.w	#30000,d2
.loop4		move.w	#$00f,$dff180
		dbf	d2,.loop4
		move.w	#0,$dff180
.not_cheat3
		move.b	d0,last_key
	IFD     CHEAT
		cmpi.b	#$59,d0		;f10?
		beq	kill_sys
	ENDC
		addq.l	#2,a5
.do_key
.loop	 	move.b	1(a5),d2
		cmp.b	#$ff,d2
		beq.s	.end		;end of keyboard table (eod=$ff)
		cmp.b	d0,d2
		beq.s	.press
		lea	3(a5),a5
		bra.s	.loop

.press	 	tst.b	d1
		bne.s	.release	;if d1 is 1 then release key
		move.b	#1,(a5)
		lea	3(a5),a5
		bra.s	.loop

.release	tst.b	2(a5)
		beq.s	.release_off
		sf.b	(a5)
.release_off	lea	3(a5),a5
		bra.s	.loop

.end		rts

last_key	dc.w	0
cheat_buffer	ds.b    10

****************************************************************************
kill_sys	move.w	#%0000001111111111,dmacon(a6)	;all dma off
		BLACK_COLOURS
		jsr	disable_sprites
		move.w	#%1000011001001111,dmacon(a6)	;set blit nasty, enable
							; blit dma, enable audio
		move.w	#%0000000000000000,copcon(a6)	;copper CANNOT access

		illegal

****************************************************************************

test_input
		tst.w	last_key
		bne.s	.ok

		btst.b	#6,ciaapra		;port 1 left button
		beq.s	.ok

		btst.b	#7,ciaapra		;port 2 left button
		beq.s	.ok

		moveq.l	#0,d0
		rts

.ok		moveq.l	#-1,d0
		rts

wait_for_input	move.l	d0,-(sp)

		clr.w	last_key

.wait		bsr	test_input
		tst.l	d0
		beq.s	.wait

		move.l	(sp)+,d0
		rts

wait_for_no_input	move.l	d0,-(sp)

		clr.w	last_key

.wait		bsr	test_input
		tst.l	d0
		bne.s	.wait

		move.l	(sp)+,d0
		rts

****************************************************************************

default_key_list
default_key_down
		dc.b	0
default_key_up
		dc.b	0
		dc.b	0,$ff,0		;eod marker

                even

****************************************************************************
****************************************************************************
;Med interrupt
;INPUT:         none
;OUTPUT:	none
;CHANGES:	none

ciab_ta_interrupt
		move.b	ciabicr,d0			;get ciabicr
		btst	#0,d0				;timer b?
		beq	.not_for_me			;no, then branch
		move.l	4.w,a6
		jsr	_IntHandler		;med module player interrupt
.not_for_me
		rts

****************************************************************************
****************************************************************************
****************************************************************************
;Level 3 interrupts
;INPUT:		none
;OUTPUT:	none
;CHANGES:	none

up   		equ     0
down		equ     1
left		equ     2
right		equ     3
fire		equ     4	;joypad button b
buta		equ     5	;joypad button a
butd		equ     6	;joypad button d (start)
butc		equ     7	;joypad button c

	IFD	BLITQ

bq_start        dc.l	0
bq_end		dc.l	0
bq_head		dc.l	0
bq_tail		dc.l	0

BQ_WORD		equ     0
BQ_LONG		equ     1

set_up_blitq
		move.l	#background_sfx,a0
		add.l	a5,a0
		move.l	a0,bq_start
		move.l	a0,bq_head
		move.l	a0,bq_tail
		adda.l	#15000,a0
		move.l	a0,bq_end
		rts

blitq_add_word
		move.l	bq_head,a1
		adda.w	#10,a1

		cmpa.l	bq_tail,a1
		bne.s	.queue_not_full
.wait		btst.b	#6,dmaconr(a6)
		bne.s	.wait
		jsr	blitq
.queue_not_full
		move.w	#BQ_WORD,-10(a1)
		move.l	a0,-8(a1)
		move.w	d0,-4(a1)

		cmpa.l	bq_end,a1
		bne.s	.no_wrap
		move.l	bq_start,a1
.no_wrap
		move.l	a1,bq_head
		rts

blitq_add_long
		move.l	bq_head,a1
		adda.w	#10,a1

		cmpa.l	bq_tail,a1
		bne.s	.queue_not_full
.wait		btst.b	#6,dmaconr(a6)
		bne.s	.wait
		jsr	blitq
.queue_not_full
		move.w	#BQ_LONG,-10(a1)
		move.l	a0,-8(a1)
		move.l	d0,-4(a1)

		cmpa.l	bq_end,a1
		bne.s	.no_wrap
		move.l	bq_start,a1
.no_wrap
		move.l	a1,bq_head
		rts

blitq
		movem.l	d0/a0-a1,-(sp)

		move.l	bq_tail,a0
.next_instruction
		cmpa.l	bq_head,a0
		beq.s	.queue_empty

		move.w	(a0)+,d0
		move.l	(a0)+,a1
		cmp.w	#BQ_LONG,d0
		beq.s	.long
		move.w	(a0)+,(a1)
		add.w	#2,a0
		bra.s	.cont
.long		move.l	(a0)+,(a1)
.cont
		cmpa.l	bq_end,a0
		bne.s	.no_wrap
		move.l	bq_start,a0
.no_wrap
		cmpa.l	#$dff000+bltsize,a1
		bne.s	.next_instruction

		move.l	a0,bq_tail
.queue_empty
		movem.l	(sp)+,d0/a0-a1
		rts

	ENDC

copper_interrupt
		move.l	#$dff000,a6
		move.l	chip_mem_base,a4
		move.l	fast_mem_base,a5	;fast mem base
		add.l	#code_size,a5		;allow 100k for program

		tst.w	variables+swap(a5)
		beq.s	.dont_swap
		jsr	swap_screen
.dont_swap
		st.b	bot_scr
		cmpi.w	#MODE_WORLD,variables+mode(a5)
		bne.s	.not_world
                jsr	map_copper_interrupt
.not_world
		cmpi.w	#MODE_HELP,variables+mode(a5)
		beq	.help

		cmpi.w	#MODE_GAME,variables+mode(a5)
		bne	.not_game_copper1
		bsr     hud
		bsr	scroll_field
		jsr	shake_screen
.not_game_copper1

	IFD	demo
		cmpi.w	#2,global_vars+attract_mode(a5)
		beq.s	.skip_play
	ENDC
		cmpi.w	#MODE_NOPOTGO,variables+mode(a5)
		beq	.no_potgo

		move.b	variables+joystick1_temp(a5),variables+joystick1_old(a5)
		move.b	variables+joystick2_temp(a5),variables+joystick2_old(a5)
		move.b	variables+joystick3_temp(a5),variables+joystick3_old(a5)
		move.b	variables+joystick4_temp(a5),variables+joystick4_old(a5)

		bsr	digital_joystick1
		bsr	digital_joystick2
.skip_play
		move.w	global_vars+active_controls(a5),d0
		btst.l	#ACTV_PAD1B,d0
		beq	.no_pad1
		bsr	pad1_read1
.no_pad1	move.w	global_vars+active_controls(a5),d0
		btst.l	#ACTV_PAD2B,d0
		beq	.no_pad2
		bsr	pad2_read1
.no_pad2	move.w	#%1110111000000000,potgo(a6)

		cmpi.w	#MODE_GAME,variables+mode(a5)
		bne	.not_game_copper2
		bsr	scroll_scrolly
.not_game_copper2

		move.w	global_vars+active_controls(a5),d0
		btst.l	#ACTV_JOY3B,d0
		beq.s	.no_joy3
		bsr	parallel_joystick1
.no_joy3	move.w	global_vars+active_controls(a5),d0
		btst.l	#ACTV_JOY4B,d0
		beq.s	.no_joy4
		bsr	parallel_joystick2
.no_joy4
		move.w	global_vars+active_controls(a5),d0
		btst.l	#ACTV_PAD1B,d0
		beq	.no_pad1b
		bsr	pad1_read2
.no_pad1b	move.w	global_vars+active_controls(a5),d0
		btst.l	#ACTV_PAD2B,d0
		beq	.no_pad2b
		bsr	pad2_read2
.no_pad2b	move.w	#%1111111100000000,potgo(a6)

.no_potgo

		cmpi.w	#MODE_GAME,variables+mode(a5)
		bne	.not_game_copper
		bsr	xcr_counters

	IFD	demo
		jsr	flash_logo
	ENDC
.not_game_copper
		rts

.help		add.w	#1,cursor_flash
		rts

****************************************************************************
****************************************************************************

do_mouse0
		move.w	global_vars+active_controls(a5),d0
		btst.l	#ACTV_MOUSE1B,d0
		beq	.no_mouse0

	IFD	demo
		cmpi.w	#2,global_vars+attract_mode(a5)
		bne	.not_play
		bsr	replay_attract_mode
		bra.s	.skip_play
.not_play
	ENDC
		bsr	mouse0_read
.skip_play
		bsr	get_sprite_image0
		move.w	variables+mouse0_x(a5),d0
		move.w	variables+mouse0_y(a5),d1
		subi.w	#8,d0
		subi.w	#8,d1
		add.w	variables+shake(a5),d1
		move.l	#copperlist+clist_sprites,a2
		add.l	a4,a2
		HDW_SPRITE #0,a3,d0,d1,#16,a2
		rts

.no_mouse0	move.l	#sprites,a3
		add.l   a4,a3
		move.l	#copperlist+clist_sprites,a2
		add.l	a4,a2
		HDW_SPRITE #0,a3,#100,#100,#16,a2
		rts

****************************************************************************

do_mouse1
		move.w	global_vars+active_controls(a5),d0
		btst.l	#ACTV_MOUSE2B,d0
		beq.s	.no_mouse1
		bsr	mouse1_read

		bsr	get_sprite_image1
		move.w	variables+mouse1_x(a5),d0
		move.w	variables+mouse1_y(a5),d1
		subi.w	#8,d0
		subi.w	#8,d1
		add.w	variables+shake(a5),d1
		move.l	#copperlist+clist_sprites,a2
		add.l	a4,a2
		HDW_SPRITE #1,a3,d0,d1,#16,a2
		rts

.no_mouse1
	IFD	CD32
		move.l	#sprites+19*144,a3
	ELSEIF
		move.l	#sprites+19*72,a3
	ENDC
		add.l   a4,a3
		move.l	#copperlist+clist_sprites,a2
		add.l	a4,a2
		HDW_SPRITE #1,a3,#100,#100,#16,a2
		rts

****************************************************************************

vblank_interrupt
		move.l	#$dff000,a6
		move.l	chip_mem_base,a4
		move.l	fast_mem_base,a5	;fast mem base
		add.l	#code_size,a5		;allow 100k for program

		st.b    top_scr

		cmpi.w	#MODE_INTRO,variables+mode(a5)
		bne.s	.not_intro
		addi.w	#1,intro_timer
.not_intro	addi.w	#1,frame_count

		addi.w	#1,timer

        IFD	demo
		tst.b	global_vars+playtime(a5)
		beq	.not_playtime
		addi.w	#1,logo_count
		cmpi.w	#50*90,logo_count
		blt.s	.not_playtime
		sf.b	global_vars+playtime(a5)
		move.w	#2,global_vars+attract_mode(a5)
		move.w	#RESTART_RETRY,variables+restart_flag(a5)
	IFD	download
		move.w	#0,global_vars+attract_mode(a5)
		move.w	#0,variables+restart_flag(a5)
	ENDC
.not_playtime
	ENDC

	IFD	CD32
		cmpi.w	#MODE_CHSELECT_SCROLL,variables+mode(a5)
		bne.s	.not_chselect
		jsr	chselect_vblank
.not_chselect
	ENDC
		cmpi.w	#MODE_GAME,variables+mode(a5)
		bne	.not_game

		addi.w	#1,variables+mouse_timer(a5)

		bsr	do_mouse0
		bsr	do_mouse1

		tst.w	global_vars+action_flag(a5)
		beq	.not_action_game
		bsr	move_digits
.not_action_game

	IFD	demo
		cmpi.w	#2,global_vars+attract_mode(a5)
		bne	.skip_play
		move.w	variables+mouse_timer(a5),d1
		move.w	d1,d2
		andi.w	#$fff,d1
		andi.w	#$e00,d2
		cmp.w	d1,d2
		bne.s	.skip_play
		rol.w	#7,d2
		mulu	#104,d2
		move.l	#mesg1,a0
		add.w	d2,a0
		jsr	push_msg
.skip_play
	ENDC
		move.w	mesg_timer,d1
		cmpi.w	#2500,d1
		blt.s	.not_mesg
		clr.w	mesg_timer
		cmpi.w	#1,variables+players_alive(a5)
		ble.s	.not_mesg
		PUSH_MESG_RAND #4
.not_mesg
.not_game
	IFD	download
		jsr	check_host
	ENDC
		rts

timers
top_scr		dc.w	0
bot_scr		dc.w	0
drown_count	dc.w	0
frame_count	dc.w	0
water_count	dc.w	0
lift_count	dc.w	0
automove_count	dc.w	0
fall_count	dc.w	0
door_count	dc.w	0
explosion_count	dc.w	0
timer		dc.w	0
mesg_timer	dc.w	0
mons_count	dc.w	0
hatch_count	dc.w	0
swap_buffer	dc.w	0
flash_count	dc.w	0
offset1_count	dc.w	0
offset2_count	dc.w	0
offset3_count	dc.w	0
offset4_count	dc.w	0
intro_timer	dc.w    0
cursor_flash	dc.w	0
timers_end
logo_count	dc.w	0

	IFD	demo

mesg1		dc.l	0,0
		dc.b	COL3,"   HIRED GUNS DEMONSTRATION   ",COL1,0,"                                                               "
mesg2		dc.l	0,0
		dc.b	COL3,"   A DMA DESIGN GAME BY SCOTT JOHNSTON   ",COL1,0,"                                                    "
mesg3		dc.l	0,0
		dc.b	COL3,"   FOR MORE INFORMATION TELEPHONE PSYGNOSIS 051 709 5755   ",COL1,0,"                                  "
mesg4		dc.l	0,0
		dc.b	COL3,"   UP TO FOUR INDEPENDENT PLAYERS ON ONE MACHINE USING MOUSE, JOYSTICK, JOYPAD OR KEYBOARD   ",COL1,0,""
mesg5		dc.l	0,0
		dc.b	COL3,"   FULL USE OF 1 MEGABYTE OR MORE OF MEMORY - HARD DISK INSTALLABLE   ",COL1,0,"                       "
mesg6		dc.l	0,0
		dc.b	COL3,"   8 MEGABYTES OF DATA PACKED ON TO 5 DISKS   ",COL1,0,"                                               "
mesg7		dc.l	0,0
		dc.b	COL3,"   ENHANCED SOUND EFFECTS FOR AMIGAS WITH MORE CHIP MEMORY   ",COL1,0,"                                "
mesg8		dc.l	0,0
		dc.b	COL3,"   AUTO-MAPPING - ON-LINE ENCYCLOPEDIA - EXPLORE A WHOLE CONTINENT   ",COL1,0,"                        "

	ENDC

		even

****************************************************************************
****************************************************************************
;INPUT:		none
;OUTPUT:	none
;CHANGES:
xcr_counters
        IFD	demo
		tst.b	variables+playtime(a5)
		bne.s	.playtime
		addi.w	#1,logo_count
.playtime
	ENDC
		addi.w	#1,drown_count
		addi.w	#1,water_count
		addi.w	#1,lift_count
		addi.w	#1,fall_count
		addi.w	#1,automove_count
		addi.w	#1,door_count
		addi.w	#1,explosion_count
		addi.w	#1,mons_count
		addi.w	#1,hatch_count
		addi.w	#1,mesg_timer

		move.w	variables+player1+poisoned_strength(a5),d0
		beq.s	.not_poison1
		subi.w	#1,variables+player1+poisoned_count(a5)
		bpl.s	.not_poison1
		move.w	variables+player1+poisoned_count_store(a5),variables+player1+poisoned_count(a5)
		add.w	d0,variables+player1+poisoned_total(a5)
.not_poison1
		move.w	variables+player2+poisoned_strength(a5),d0
		beq.s	.not_poison2
		subi.w	#1,variables+player2+poisoned_count(a5)
		bpl.s	.not_poison2
		move.w	variables+player2+poisoned_count_store(a5),variables+player2+poisoned_count(a5)
		add.w	d0,variables+player2+poisoned_total(a5)
.not_poison2
		move.w	variables+player3+poisoned_strength(a5),d0
		beq.s	.not_poison3
		subi.w	#1,variables+player3+poisoned_count(a5)
		bpl.s	.not_poison3
		move.w	variables+player3+poisoned_count_store(a5),variables+player3+poisoned_count(a5)
		add.w	d0,variables+player3+poisoned_total(a5)
.not_poison3
		move.w	variables+player4+poisoned_strength(a5),d0
		beq.s	.not_poison4
		subi.w	#1,variables+player4+poisoned_count(a5)
		bpl.s	.not_poison4
		move.w	variables+player4+poisoned_count_store(a5),variables+player4+poisoned_count(a5)
		add.w	d0,variables+player4+poisoned_total(a5)
.not_poison4

		tst.w	variables+player1+active_count(a5)
		beq.s	.not_active1
		subi.w	#1,variables+player1+active_count(a5)
		bpl.s	.not_active1
		clr.w	variables+player1+active_count(a5)
.not_active1
		tst.w	variables+player2+active_count(a5)
		beq.s	.not_active2
		subi.w	#1,variables+player2+active_count(a5)
		bpl.s	.not_active2
		clr.w	variables+player2+active_count(a5)
.not_active2
		tst.w	variables+player3+active_count(a5)
		beq.s	.not_active3
		subi.w	#1,variables+player3+active_count(a5)
		bpl.s	.not_active3
		clr.w	variables+player3+active_count(a5)
.not_active3
		tst.w	variables+player4+active_count(a5)
		beq.s	.not_active4
		subi.w	#1,variables+player4+active_count(a5)
		bpl.s	.not_active4
		clr.w	variables+player4+active_count(a5)
.not_active4

		tst.w	variables+player1+lock_count(a5)
		beq.s	.not_lock_count1
		subi.w	#1,variables+player1+lock_count(a5)
		bne.s	.not_lock_count1
		st.b	variables+redraw_flag(a5)
.not_lock_count1
		tst.w	variables+player2+lock_count(a5)
		beq.s	.not_lock_count2
		subi.w	#1,variables+player2+lock_count(a5)
		bne.s	.not_lock_count2
		st.b	variables+redraw_flag(a5)
.not_lock_count2
		tst.w	variables+player3+lock_count(a5)
		beq.s	.not_lock_count3
		subi.w	#1,variables+player3+lock_count(a5)
		bne.s	.not_lock_count3
		st.b	variables+redraw_flag(a5)
.not_lock_count3
		tst.w	variables+player4+lock_count(a5)
		beq.s	.not_lock_count4
		subi.w	#1,variables+player4+lock_count(a5)
		bne.s	.not_lock_count4
		st.b	variables+redraw_flag(a5)
.not_lock_count4

		tst.w	variables+player1+monster_attacking(a5)
		beq.s	.not_monster_attacking1
		subi.w	#1,variables+player1+monster_attacking(a5)
		bne.s	.not_monster_attacking1
		st.b	variables+redraw_flag(a5)
.not_monster_attacking1
		tst.w	variables+player2+monster_attacking(a5)
		beq.s	.not_monster_attacking2
		subi.w	#1,variables+player2+monster_attacking(a5)
		bne.s	.not_monster_attacking2
		st.b	variables+redraw_flag(a5)
.not_monster_attacking2
		tst.w	variables+player3+monster_attacking(a5)
		beq.s	.not_monster_attacking3
		subi.w	#1,variables+player3+monster_attacking(a5)
		bne.s	.not_monster_attacking3
		st.b	variables+redraw_flag(a5)
.not_monster_attacking3
		tst.w	variables+player4+monster_attacking(a5)
		beq.s	.not_monster_attacking4
		subi.w	#1,variables+player4+monster_attacking(a5)
		bne.s	.not_monster_attacking4
		st.b	variables+redraw_flag(a5)
.not_monster_attacking4


		tst.w	variables+player1+used_count(a5)
		beq.s	.not_used_count1
		subi.w	#1,variables+player1+used_count(a5)
		bne.s	.not_used_count1
		st.b	variables+redraw_flag(a5)
.not_used_count1
		tst.w	variables+player2+used_count(a5)
		beq.s	.not_used_count2
		subi.w	#1,variables+player2+used_count(a5)
		bne.s	.not_used_count2
		st.b	variables+redraw_flag(a5)
.not_used_count2
		tst.w	variables+player3+used_count(a5)
		beq.s	.not_used_count3
		subi.w	#1,variables+player3+used_count(a5)
		bne.s	.not_used_count3
		st.b	variables+redraw_flag(a5)
.not_used_count3
		tst.w	variables+player4+used_count(a5)
		beq.s	.not_used_count4
		subi.w	#1,variables+player4+used_count(a5)
		bne.s	.not_used_count4
		st.b	variables+redraw_flag(a5)
.not_used_count4


		tst.w	variables+player1+noammo_count(a5)
		beq.s	.not_noammo_count1
		subi.w	#1,variables+player1+noammo_count(a5)
		bne.s	.not_noammo_count1
		st.b	variables+redraw_flag(a5)
.not_noammo_count1
		tst.w	variables+player2+noammo_count(a5)
		beq.s	.not_noammo_count2
		subi.w	#1,variables+player2+noammo_count(a5)
		bne.s	.not_noammo_count2
		st.b	variables+redraw_flag(a5)
.not_noammo_count2
		tst.w	variables+player3+noammo_count(a5)
		beq.s	.not_noammo_count3
		subi.w	#1,variables+player3+noammo_count(a5)
		bne.s	.not_noammo_count3
		st.b	variables+redraw_flag(a5)
.not_noammo_count3
		tst.w	variables+player4+noammo_count(a5)
		beq.s	.not_noammo_count4
		subi.w	#1,variables+player4+noammo_count(a5)
		bne.s	.not_noammo_count4
		st.b	variables+redraw_flag(a5)
.not_noammo_count4

		tst.w	variables+player1+noroom_count(a5)
		beq.s	.not_noroom_count1
		subi.w	#1,variables+player1+noroom_count(a5)
		bne.s	.not_noroom_count1
		st.b	variables+redraw_flag(a5)
.not_noroom_count1
		tst.w	variables+player2+noroom_count(a5)
		beq.s	.not_noroom_count2
		subi.w	#1,variables+player2+noroom_count(a5)
		bne.s	.not_noroom_count2
		st.b	variables+redraw_flag(a5)
.not_noroom_count2
		tst.w	variables+player3+noroom_count(a5)
		beq.s	.not_noroom_count3
		subi.w	#1,variables+player3+noroom_count(a5)
		bne.s	.not_noroom_count3
		st.b	variables+redraw_flag(a5)
.not_noroom_count3
		tst.w	variables+player4+noroom_count(a5)
		beq.s	.not_noroom_count4
		subi.w	#1,variables+player4+noroom_count(a5)
		bne.s	.not_noroom_count4
		st.b	variables+redraw_flag(a5)
.not_noroom_count4

DECR_ICON_DUR	MACRO	;player,icon
		tst.w	variables+player\1+icon_\2_dur(a5)
		beq.s	.not_duration_count\@
		subi.w	#1,variables+player\1+icon_\2_dur(a5)
		bne.s	.not_duration_count\@
.not_duration_count\@
		ENDM

		DECR_ICON_DUR 1,weights
		DECR_ICON_DUR 1,immu
		DECR_ICON_DUR 1,shield
		DECR_ICON_DUR 1,wings
		DECR_ICON_DUR 1,water

		DECR_ICON_DUR 2,weights
		DECR_ICON_DUR 2,immu
		DECR_ICON_DUR 2,shield
		DECR_ICON_DUR 2,wings
		DECR_ICON_DUR 2,water

		DECR_ICON_DUR 3,weights
		DECR_ICON_DUR 3,immu
		DECR_ICON_DUR 3,shield
		DECR_ICON_DUR 3,wings
		DECR_ICON_DUR 3,water

		DECR_ICON_DUR 4,weights
		DECR_ICON_DUR 4,immu
		DECR_ICON_DUR 4,shield
		DECR_ICON_DUR 4,wings
		DECR_ICON_DUR 4,water

		tst.w	variables+player1+heavy_count(a5)
		beq.s	.not_heavy_count1
		subi.w	#1,variables+player1+heavy_count(a5)
		bne.s	.not_heavy_count1
		st.b	variables+redraw_flag(a5)
.not_heavy_count1
		tst.w	variables+player2+heavy_count(a5)
		beq.s	.not_heavy_count2
		subi.w	#1,variables+player2+heavy_count(a5)
		bne.s	.not_heavy_count2
		st.b	variables+redraw_flag(a5)
.not_heavy_count2
		tst.w	variables+player3+heavy_count(a5)
		beq.s	.not_heavy_count3
		subi.w	#1,variables+player3+heavy_count(a5)
		bne.s	.not_heavy_count3
		st.b	variables+redraw_flag(a5)
.not_heavy_count3
		tst.w	variables+player4+heavy_count(a5)
		beq.s	.not_heavy_count4
		subi.w	#1,variables+player4+heavy_count(a5)
		bne.s	.not_heavy_count4
		st.b	variables+redraw_flag(a5)
.not_heavy_count4

		tst.w	variables+player1+blocked_count(a5)
		beq.s	.not_blocked_count1
		subi.w	#1,variables+player1+blocked_count(a5)
		bne.s	.not_blocked_count1
		st.b	variables+redraw_flag(a5)
.not_blocked_count1
		tst.w	variables+player2+blocked_count(a5)
		beq.s	.not_blocked_count2
		subi.w	#1,variables+player2+blocked_count(a5)
		bne.s	.not_blocked_count2
		st.b	variables+redraw_flag(a5)
.not_blocked_count2
		tst.w	variables+player3+blocked_count(a5)
		beq.s	.not_blocked_count3
		subi.w	#1,variables+player3+blocked_count(a5)
		bne.s	.not_blocked_count3
		st.b	variables+redraw_flag(a5)
.not_blocked_count3
		tst.w	variables+player4+blocked_count(a5)
		beq.s	.not_blocked_count4
		subi.w	#1,variables+player4+blocked_count(a5)
		bne.s	.not_blocked_count4
		st.b	variables+redraw_flag(a5)
.not_blocked_count4

		tst.w	variables+player1+blocked2_count(a5)
		beq.s	.not_blocked2_count1
		subi.w	#1,variables+player1+blocked2_count(a5)
		bne.s	.not_blocked2_count1
		st.b	variables+redraw_flag(a5)
.not_blocked2_count1
		tst.w	variables+player2+blocked2_count(a5)
		beq.s	.not_blocked2_count2
		subi.w	#1,variables+player2+blocked2_count(a5)
		bne.s	.not_blocked2_count2
		st.b	variables+redraw_flag(a5)
.not_blocked2_count2
		tst.w	variables+player3+blocked2_count(a5)
		beq.s	.not_blocked2_count3
		subi.w	#1,variables+player3+blocked2_count(a5)
		bne.s	.not_blocked2_count3
		st.b	variables+redraw_flag(a5)
.not_blocked2_count3
		tst.w	variables+player4+blocked2_count(a5)
		beq.s	.not_blocked2_count4
		subi.w	#1,variables+player4+blocked2_count(a5)
		bne.s	.not_blocked2_count4
		st.b	variables+redraw_flag(a5)
.not_blocked2_count4

		tst.w	variables+player1+drowning_count(a5)
		beq.s	.not_drowning_count1
		subi.w	#1,variables+player1+drowning_count(a5)
		bne.s	.not_drowning_count1
		st.b	variables+redraw_flag(a5)
.not_drowning_count1
		tst.w	variables+player2+drowning_count(a5)
		beq.s	.not_drowning_count2
		subi.w	#1,variables+player2+drowning_count(a5)
		bne.s	.not_drowning_count2
		st.b	variables+redraw_flag(a5)
.not_drowning_count2
		tst.w	variables+player3+drowning_count(a5)
		beq.s	.not_drowning_count3
		subi.w	#1,variables+player3+drowning_count(a5)
		bne.s	.not_drowning_count3
		st.b	variables+redraw_flag(a5)
.not_drowning_count3
		tst.w	variables+player4+drowning_count(a5)
		beq.s	.not_drowning_count4
		subi.w	#1,variables+player4+drowning_count(a5)
		bne.s	.not_drowning_count4
		st.b	variables+redraw_flag(a5)
.not_drowning_count4

		tst.w	variables+player1+invalid_count(a5)
		beq.s	.not_invalid_count1
		subi.w	#1,variables+player1+invalid_count(a5)
		bne.s	.not_invalid_count1
		st.b	variables+redraw_flag(a5)
.not_invalid_count1
		tst.w	variables+player2+invalid_count(a5)
		beq.s	.not_invalid_count2
		subi.w	#1,variables+player2+invalid_count(a5)
		bne.s	.not_invalid_count2
		st.b	variables+redraw_flag(a5)
.not_invalid_count2
		tst.w	variables+player3+invalid_count(a5)
		beq.s	.not_invalid_count3
		subi.w	#1,variables+player3+invalid_count(a5)
		bne.s	.not_invalid_count3
		st.b	variables+redraw_flag(a5)
.not_invalid_count3
		tst.w	variables+player4+invalid_count(a5)
		beq.s	.not_invalid_count4
		subi.w	#1,variables+player4+invalid_count(a5)
		bne.s	.not_invalid_count4
		st.b	variables+redraw_flag(a5)
.not_invalid_count4

		tst.w	variables+player1+claw_count(a5)
		beq.s	.not_claw_count1
		subi.w	#1,variables+player1+claw_count(a5)
		bne.s	.not_claw_count1
		st.b	variables+redraw_flag(a5)
.not_claw_count1
		tst.w	variables+player2+claw_count(a5)
		beq.s	.not_claw_count2
		subi.w	#1,variables+player2+claw_count(a5)
		bne.s	.not_claw_count2
		st.b	variables+redraw_flag(a5)
.not_claw_count2
		tst.w	variables+player3+claw_count(a5)
		beq.s	.not_claw_count3
		subi.w	#1,variables+player3+claw_count(a5)
		bne.s	.not_claw_count3
		st.b	variables+redraw_flag(a5)
.not_claw_count3
		tst.w	variables+player4+claw_count(a5)
		beq.s	.not_claw_count4
		subi.w	#1,variables+player4+claw_count(a5)
		bne.s	.not_claw_count4
		st.b	variables+redraw_flag(a5)
.not_claw_count4

		tst.w	variables+player1+bigclaw_count(a5)
		beq.s	.not_bigclaw_count1
		subi.w	#1,variables+player1+bigclaw_count(a5)
		bne.s	.not_bigclaw_count1
		st.b	variables+redraw_flag(a5)
.not_bigclaw_count1
		tst.w	variables+player2+bigclaw_count(a5)
		beq.s	.not_bigclaw_count2
		subi.w	#1,variables+player2+bigclaw_count(a5)
		bne.s	.not_bigclaw_count2
		st.b	variables+redraw_flag(a5)
.not_bigclaw_count2
		tst.w	variables+player3+bigclaw_count(a5)
		beq.s	.not_bigclaw_count3
		subi.w	#1,variables+player3+bigclaw_count(a5)
		bne.s	.not_bigclaw_count3
		st.b	variables+redraw_flag(a5)
.not_bigclaw_count3
		tst.w	variables+player4+bigclaw_count(a5)
		beq.s	.not_bigclaw_count4
		subi.w	#1,variables+player4+bigclaw_count(a5)
		bne.s	.not_bigclaw_count4
		st.b	variables+redraw_flag(a5)
.not_bigclaw_count4

		addi.w	#1,variables+player1+grunt_count(a5)
		addi.w	#1,variables+player2+grunt_count(a5)
		addi.w	#1,variables+player3+grunt_count(a5)
		addi.w	#1,variables+player4+grunt_count(a5)

		rts

****************************************************************************
****************************************************************************
;INPUT:		none
;OUTPUT:	none
;CHANGES:
	IFD	demo

replay_attract_mode
		lea	variables+player1(a5),a0
		move.w	variables+mouse0_player(a5),d0
		cmpi.w	#1,d0
		blt.s	.not_dead
		cmpi.w	#4,d0
		bgt.s	.not_dead
		subq.w	#1,d0
		mulu	#player_struct_size,d0
		add.l	d0,a0

		tst.w	dead_flag2(a0)
		beq.s	.not_dead
		move.w	#RESTART_RETRY,variables+restart_flag(a5)
		rts
.not_dead
		tst.w	variables+mouse0_left_bt(a5)
		bne	.play
		tst.w	variables+mouse0_right_bt(a5)
		bne	.play

		move.w	variables+mouse0_left_bt(a5),variables+mouse0_old_left_bt(a5)
		move.w	variables+mouse0_right_bt(a5),variables+mouse0_old_right_bt(a5)

		moveq.l	#0,d0
		move.w	variables+mouse_move(a5),d0
                move.l	#mouse_moves,a0
		add.l	a5,a0
		add.l	d0,a0

		move.w	(a0)+,d0
		cmpi.w	#$ffff,d0
		bne.s	.not_end_play
		move.w	#RESTART_RETRY,variables+restart_flag(a5)
	IFD	download
		clr.w	global_vars+attract_mode(a5)
	ENDC
		bra.s	.not_play
.not_end_play
		move.w	d0,d3
		sub.w	variables+mouse_timer(a5),d0
		beq.s	.play_now
		bmi.s	.play_now
		move.w	(a0),d1
		move.w	2(a0),d2
		sub.w	-8(a0),d1
		sub.w	-6(a0),d2
		sub.w	-10(a0),d3
		muls	d0,d1
		muls	d0,d2
		divs	d3,d1
		divs	d3,d2
		neg.w	d1
		neg.w	d2
		add.w	(a0),d1
		add.w	2(a0),d2
		move.w	d1,variables+mouse0_x(a5)
		move.w	d2,variables+mouse0_y(a5)
		bra.s	.not_play_yet

.play_now	move.w	-2(a0),variables+mouse_timer(a5)
		move.w	(a0)+,variables+mouse0_x(a5)
		move.w	(a0)+,variables+mouse0_y(a5)
		move.w	(a0),d0
		beq.s	.play_left_button
		cmpi.w	#1,d0
		bne     .skip_play_left_button
		move.w	#1,variables+mouse0_right_bt(a5)
		bra.s	.skip_play_left_button
.play_left_button
		move.w	#1,variables+mouse0_left_bt(a5)
.skip_play_left_button
		addi.w	#8,variables+mouse_move(a5)
.not_play_yet
		bra.s	.play
.not_play
		bsr	mouse0_read
.play
		rts

	ENDC

****************************************************************************
****************************************************************************
;INPUT:		none
;OUTPUT:	none
;CHANGES:
move_digits
		move.l	#copperlist+clist_sprites,a2
		add.l	a4,a2

		move.l	#miscgfx+digits_bob,a0
		add.l	a4,a0
		move.l	(a0),a0
		add.l	#miscgfx,a0
		add.l	a4,a0

	IFD	CD32
		move.w	#41+98-7,d1
		add.w	variables+shake(a5),d1
		HDW_SPRITE #5,a0,#270,d1,#28,a2
	ELSEIF
		move.w	#41+98,d1
		add.w	variables+shake(a5),d1
		HDW_SPRITE #5,a0,#278,d1,#14,a2
	ENDC

		subi.w	#1,global_vars+at_trip3(a5)
		bpl.s	.not_tripped3
		move.w	global_vars+at_trip3_dur(a5),global_vars+at_trip3(a5)
	IFD	CD32
		move.w	#-28*8,global_vars+at_trip2_rot(a5)
	ELSEIF
		move.w	#-14*4,global_vars+at_trip2_rot(a5)
	ENDC

		subi.w	#1,global_vars+at_trip2(a5)
		bpl.s	.not_tripped2
		move.w	global_vars+at_trip2_dur(a5),global_vars+at_trip2(a5)
	IFD	CD32
		move.w	#-28*8,global_vars+at_trip1_rot(a5)
	ELSEIF
		move.w	#-14*4,global_vars+at_trip1_rot(a5)
	ENDC

		subi.w	#1,global_vars+at_trip1(a5)
		bpl.s	.not_tripped1
		clr.w	global_vars+at_trip1(a5)

.not_tripped1
.not_tripped2
.not_tripped3

		move.w	#10,d0
		sub.w	global_vars+at_trip1(a5),d0
	IFD	CD32
		mulu.w	#224,d0
	ELSEIF
		mulu.w	#56,d0
	ENDC
		add.w	global_vars+at_trip1_rot(a5),d0
		tst.w	global_vars+at_trip1_rot(a5)
		beq.	.not_rot_1
	IFD	CD32
		add.w	#8,global_vars+at_trip1_rot(a5)
	ELSEIF
		add.w	#4,global_vars+at_trip1_rot(a5)
	ENDC
.not_rot_1	lea	0(a0,d0.w),a1
	IFD	CD32
		add.w	#240,a1
	ELSEIF
		add.w	#64,a1
	ENDC

		move.w	#10,d0
		sub.w	global_vars+at_trip2(a5),d0
	IFD	CD32
		mulu.w	#224,d0
	ELSEIF
		mulu.w	#56,d0
	ENDC
		add.w	global_vars+at_trip2_rot(a5),d0
		tst.w	global_vars+at_trip2_rot(a5)
		beq.	.not_rot_2
	IFD	CD32
		add.w	#8,global_vars+at_trip2_rot(a5)
	ELSEIF
		add.w	#4,global_vars+at_trip2_rot(a5)
	ENDC
.not_rot_2	lea	0(a0,d0.w),a2
	IFD	CD32
		add.w	#240,a2
	ELSEIF
		add.w	#64,a2
	ENDC

	IFD	CD32
		add.w	#8,a0
	ELSEIF
		add.w	#4,a0
	ENDC

	IFD	CD32
		move.w	#(28*2)-1,d1
.copy		move.l	(a1)+,(a0)
		move.l	(a2)+,d0
		swap	d0
		or.l	d0,(a0)+
		dbf	d1,.copy
	ELSEIF
		REPT	14
		move.l	(a1)+,(a0)
		move.l	(a2)+,d0
		lsr.l	#8,d0
		or.l	d0,(a0)+
		ENDR
	ENDC

.end
		rts

****************************************************************************
****************************************************************************
;INPUT:         a0.l=address of players structure
;OUTPUT:	none
;CHANGES:
hud
                move.w	timer,d0
		andi.w	#%11,d0

		lea	variables+player1(a5),a0
		lea	global_vars+player1_stats(a5),a1
		tst.w	d0
		beq.s	.player_hud

		lea	variables+player2(a5),a0
		lea	global_vars+player2_stats(a5),a1
		cmpi.w	#1,d0
		beq.s	.player_hud

		lea	variables+player3(a5),a0
		lea	global_vars+player3_stats(a5),a1
		cmpi.w	#2,d0
		beq.s	.player_hud

		lea	variables+player4(a5),a0
		lea	global_vars+player4_stats(a5),a1

.player_hud
		move.l	#copperlist+clist_sprites,a2
		add.l	a4,a2

		bsr	fitness_flash

		tst.w	dead_flag(a1)
		bne	.no_anim

		move.w	fire_anim(a0),d0
		beq	.no_anim

		tst.b	control_method(a0)
		beq	.no_anim

		move.l	#copperlist,a3
		add.l	a4,a3
		move.w	fire_colour(a0),d1

		move.w	d1,gun_palette+2*16+4+2(a3)
		move.w	d1,gun_palette+2*16+12+2(a3)

		move.w	d1,d2
		andi.w	#$f00,d2
		beq.s	.no_red2
		addi.w	#$300,d2
		cmpi.w	#$f00,d2
		ble.s	.not_red_overflow
		move.w	#$f00,d2
.not_red_overflow
		andi.w	#$f00,d2
		andi.w	#$0ff,d1
		or.w	d2,d1
.no_red2
		move.w	d1,d2
		andi.w	#$f0,d2
		beq.s	.no_green2
		addi.w	#$30,d2
		cmpi.w	#$f0,d2
		ble.s	.not_green_overflow
		move.w	#$f0,d2
.not_green_overflow
		andi.w	#$f0,d2
		andi.w	#$f0f,d1
		or.w	d2,d1
.no_green2
		move.w	d1,d2
		andi.w	#$f,d2
		beq.s	.no_blue2
		addi.w	#$3,d2
		cmpi.w	#$f,d2
		ble.s	.not_blue_overflow
		move.w	#$f,d2
.not_blue_overflow
		andi.w	#$f,d2
		andi.w	#$ff0,d1
		or.w	d2,d1
.no_blue2
		move.w	d1,gun_palette+1*16+4+2(a3)
		move.w	d1,gun_palette+1*16+12+2(a3)

		subi.b	#1,fire_duration(a0)
		bge.s	.not_end
		move.w	#0,fire_anim(a0)
		bra	.no_anim
.not_end

.next_frame	move.w	fire_frame(a0),d1
		addi.w	#1,d1
		cmpi.w	#5,d1
		blt.s	.not_end_of_frames
		move.w	#0,d1
.not_end_of_frames
		move.w	d1,fire_frame(a0)
	IFD	CD32
		mulu	#672,d1
		subq.l	#1,d0
		mulu	#3360,d0
	ELSEIF
		mulu	#336,d1
		subq.l	#1,d0
		mulu	#1680,d0
	ENDC

		move.l	#fireeffects+200,a3
		add.l	a4,a3
		add.w	d0,a3
		add.w	d1,a3

		move.w	variables+random_num(a5),d1
		mulu	#47,d1
		rol.w	#8,d1
		move.w	d1,variables+random_num(a5)
		move.b	fire_accuracy(a0),d0
		ext.w	d0
		move.w	d0,d2
		beq.s	.x0
		add.w	d0,d0
		subq.w	#1,d0
		and.w	d0,d1
		sub.w	d1,d2
.x0		move.w	d2,fire_x(a0)

		move.w	variables+random_num(a5),d1
		mulu	#47,d1
		rol.w	#8,d1
		move.w	d1,variables+random_num(a5)
		move.b	fire_accuracy(a0),d0
		ext.w	d0
		move.w	d0,d2
		beq.s	.y0
		add.w	d0,d0
		subq.w	#1,d0
		and.w	d0,d1
		sub.w	d1,d2
.y0		move.w	d2,fire_y(a0)

		bsr	muzzle_flash
		bsr	muzzle_hit

		rts

.no_anim	move.l	#fireeffects,a3
		add.l	a4,a3
		HDW_SPRITE #2,a3,#0,#41,#2,a2
		add.w	#32,a3
		HDW_SPRITE #3,a3,#0,#41,#2,a2
		add.w	#32,a3
		HDW_SPRITE #4,a3,#0,#41,#2,a2
		clr.b	fire_duration(a0)
		rts

muzzle_flash
		tst.w	window_type(a0)
		bne	.no_anim

		move.w	gadget_xoffset(a0),d0
	IFD	CD32
		addi.w	#128+73-32,d0
		add.w	fire_x(a0),d0
		move.w	gadget_yoffset(a0),d1
		addi.w	#41+51-1,d1
	ELSEIF
		addi.w	#128+73-16,d0
		add.w	fire_x(a0),d0
		move.w	gadget_yoffset(a0),d1
		addi.w	#41+51,d1
	ENDC
		add.w	variables+shake(a5),d1

		addi.w	#8,d1
		HDW_SPRITE #2,a3,d0,d1,#40,a2
	IFD	CD32
		addi.w	#32,d0
		add.w	#336,a3
	ELSEIF
		addi.w	#16,d0
		add.w	#168,a3
	ENDC
		HDW_SPRITE #3,a3,d0,d1,#40,a2
		rts

.no_anim	move.l	#fireeffects,a3
		add.l	a4,a3
		HDW_SPRITE #2,a3,#0,#41,#2,a2
		add.w	#32,a3
		HDW_SPRITE #3,a3,#0,#41,#2,a2

		rts

muzzle_hit
	IFD	CD32
		move.l	#fireeffects+200+3360*3,a3
	ELSEIF
		move.l	#fireeffects+200+1680*3,a3
	ENDC
		add.l	a4,a3

		move.w	fire_x(a0),d0
		move.w	fire_y(a0),d2

		cmpi.w	#-8,d0
		ble.s	.765
		cmpi.w	#8,d0
		bge.s	.123

		cmpi.w	#-8,d2
		ble.s	.0
		cmpi.w	#8,d2
		bge.s	.4
		move.w	#8,d1
		subi.w	#8,d0
		subi.w	#8,d2
		bra.s	.cont
.0		move.w	#0,d1
		subi.w	#8,d0
		subi.w	#16,d2
		bra.s	.cont
.4		move.w	#4,d1
		subi.w	#8,d0
		bra.s	.cont

.123		cmpi.w	#-8,d2
		ble.s	.1
		cmpi.w	#8,d2
		bge.s	.3
		move.w	#2,d1
		subi.w	#8,d2
		bra.s	.cont
.1		move.w	#1,d1
		subi.w	#16,d2
		bra.s	.cont
.3		move.w	#3,d1
		bra.s	.cont

.765		cmpi.w	#-8,d2
		ble.s	.7
		cmpi.w	#8,d2
		bge.s	.5
		move.w	#6,d1
		subi.w	#16,d0
		subi.w	#8,d2
		bra.s	.cont
.7		move.w	#7,d1
		subi.w	#16,d0
		subi.w	#16,d2
		bra.s	.cont
.5		move.w	#5,d1
		subi.w	#16,d0


.cont		moveq.l	#0,d3
		move.b	fire_dist(a0),d3
		cmpi.w	#4,d3
		bge	.no_muzzle_hit
		tst.w	fire_splat(a0)
		beq	.no_muzzle_hit

		mulu	#9,d3
		add.w	d3,d1

	IFD	CD32
		mulu	#144,d1
	ELSEIF
		mulu	#72,d1
	ENDC
		add.l	d1,a3

		add.w	gadget_xoffset(a0),d0
		addi.w	#128+73,d0
		add.w	gadget_yoffset(a0),d2
		addi.w	#41+57,d2
		add.w	variables+shake(a5),d2

		moveq.l	#0,d4
		move.b	fire_dist_vol(a0),d4

		tst.b	fire_ricochet(a0)
		bne.s	.no_ricochet

		tst.l	exchip_mem_base
		beq.s	.no_ex

		move.w	variables+random_num(a5),d1
		mulu	#47,d1
		rol.w	#7,d1
		move.w	d1,variables+random_num(a5)
		cmpi.w	#20000,d1
		bhi.s	.no_ricochet2

		add.w	#sample_length2-sample_length,a5
		PLAY_EX_SAMPLE_RAND #29,#2,d4,#128
		bra.s	.skip_thud
.no_ricochet2
		tst.b	fire_against_door(a0)
		beq.s	.no_ex

		add.w	#sample_length2-sample_length,a5
		PLAY_EX_SAMPLE_RAND #11,#2,d4,#150
		bra.s	.skip_thud
.no_ex
.no_ricochet
		move.l	#miscsfx,a1
		add.l	chip_mem_base,a1
		add.w	#sample_length2-sample_length,a5
		PLAY_SAMPLE a1,#9,#2,d4,#428
.skip_thud
		sub.w	#sample_length2-sample_length,a5

		tst.w	window_type(a0)
		bne	.no_anim

		HDW_SPRITE #4,a3,d0,d2,#16,a2

.no_muzzle_hit	rts

.no_anim	move.l	#fireeffects,a3
		add.l	a4,a3
		add.w	#32,a3
		add.w	#32,a3
		HDW_SPRITE #4,a3,#0,#41,#2,a2
		rts

fitness_flash
		tst.w	dead_flag(a1)
		bne	.no_anim

		tst.b	fitness_flash_dur(a1)
		beq.s	.no_anim
		subi.b	#1,fitness_flash_dur(a1)

	IFD	CD32
		move.l	#fireeffects+200+3360*3+4*9*144,a3
	ELSEIF
		move.l	#fireeffects+200+1680*3+4*9*72,a3
	ENDC
		add.l	a4,a3

		move.w	gadget_xoffset(a0),d0
		addi.w	#128+112,d0
		move.w	gadget_yoffset(a0),d2
		addi.w	#39,d2
		add.w	variables+shake(a5),d2

		HDW_SPRITE #6,a3,d0,d2,#17,a2
	IFD	CD32
		add.w	#152,a3
	ELSEIF
		add.w	#76,a3
	ENDC
		add.w	#16,d0
		HDW_SPRITE #7,a3,d0,d2,#17,a2

		rts

.no_anim	move.l	#fireeffects,a3
		add.l	a4,a3
		add.w	#32,a3
		add.w	#32,a3
		add.w	#32,a3
		HDW_SPRITE #6,a3,#0,#41,#2,a2
		add.w	#32,a3
		HDW_SPRITE #7,a3,#0,#41,#2,a2
		rts

****************************************************************************

pad2_read1
		move.b	variables+joystick2(a5),d3
		move.b	variables+joystick2_temp(a5),d1

		move.w	variables+pad2_button_a(a5),variables+pad2_old_button_a(a5)
		move.w	variables+pad2_button_c(a5),variables+pad2_old_button_c(a5)
		move.w	variables+pad2_button_d(a5),variables+pad2_old_button_d(a5)

		btst.b	#6,potgor(a6)		;button c?
		bne.s	.not_buttonc
		move.w	#1,variables+pad2_button_c(a5)
		btst.l	#butc,d1
		bne.s	.button_c_skip
		bset	#butc,d3
		bset	#butc,d1
		bra.s	.button_c_skip
.not_buttonc	bclr	#butc,d1
		clr.w	variables+pad2_button_c(a5)
.button_c_skip
		move.b	d3,variables+joystick2(a5)
		move.b	d1,variables+joystick2_temp(a5)
		rts

pad2_read2
		move.b	variables+joystick2(a5),d3
		move.b	variables+joystick2_temp(a5),d1

		btst.b	#7,ciaapra		;button a?
		bne.s	.not_buttona
		move.w	#1,variables+pad2_button_a(a5)
		btst.l	#buta,d1
		bne.s	.button_a_skip
		bset	#buta,d3
		bset	#buta,d1
		bra.s	.button_a_skip
.not_buttona	bclr	#buta,d1
		clr.w	variables+pad2_button_a(a5)
.button_a_skip
		btst.b	#6,potgor(a6)		;button d?
		bne.s	.not_buttond
		move.w	#1,variables+pad2_button_d(a5)
		btst.l	#butd,d1
		bne.s	.button_d_skip
		bset	#butd,d3
		bset	#butd,d1
		bra.s	.button_d_skip
.not_buttond	bclr	#butd,d1
		clr.w	variables+pad2_button_d(a5)
.button_d_skip
		move.b	d3,variables+joystick2(a5)
		move.b	d1,variables+joystick2_temp(a5)
		rts

pad1_read1
		move.b	variables+joystick1(a5),d3
		move.b	variables+joystick1_temp(a5),d1

		move.w	variables+pad1_button_a(a5),variables+pad1_old_button_a(a5)
		move.w	variables+pad1_button_c(a5),variables+pad1_old_button_c(a5)
		move.w	variables+pad1_button_d(a5),variables+pad1_old_button_d(a5)

		btst.b	#2,potgor(a6)		;button c?
		bne.s	.not_buttonc
		move.w	#1,variables+pad1_button_c(a5)
		btst.l	#butc,d1
		bne.s	.button_c_skip
		bset	#butc,d3
		bset	#butc,d1
		bra.s	.button_c_skip
.not_buttonc	bclr	#butc,d1
		clr.w	variables+pad1_button_c(a5)
.button_c_skip
		move.b	d3,variables+joystick1(a5)
		move.b	d1,variables+joystick1_temp(a5)
		rts

pad1_read2
		move.b	variables+joystick1(a5),d3
		move.b	variables+joystick1_temp(a5),d1

		btst.b	#6,ciaapra		;button a?
		bne.s	.not_buttona
		move.w	#1,variables+pad1_button_a(a5)
		btst.l	#buta,d1
		bne.s	.button_a_skip
		bset	#buta,d3
		bset	#buta,d1
		bra.s	.button_a_skip
.not_buttona	bclr	#buta,d1
		clr.w	variables+pad1_button_a(a5)
.button_a_skip
		btst.b	#2,potgor(a6)		;button d?
		bne.s	.not_buttond
		move.w	#1,variables+pad1_button_d(a5)
		btst.l	#butd,d1
		bne.s	.button_d_skip
		bset	#butd,d3
		bset	#butd,d1
		bra.s	.button_d_skip
.not_buttond	bclr	#butd,d1
		clr.w	variables+pad1_button_d(a5)
.button_d_skip
		move.b	d3,variables+joystick1(a5)
		move.b	d1,variables+joystick1_temp(a5)
		rts

****************************************************************************
****************************************************************************
****************************************************************************
****************************************************************************
;INPUT:         none
;OUTPUT:	d3=bits set for directions (byte)
;CHANGES:       d1

digital_joystick1
		move.w	joy0dat(a6),d0
		move.b	variables+joystick1_temp(a5),d1
		move.b	variables+joystick1(a5),d3

		move.w	global_vars+active_controls(a5),d4
		andi.w	#ACTV_JOY1M!ACTV_PAD1M,d4
		beq.s	.no_joy1
        	bsr	digital_joystick
.no_joy1
		move.w	variables+mouse0_left_bt(a5),variables+mouse0_old_left_bt(a5)
		btst.b	#6,ciaapra		;fire
		bne.s	.not_fire

                move.w	#1,variables+mouse0_left_bt(a5)
		bset	#fire,d3
		bset	#fire,d1
		bra.s	.fire_skip
.not_fire	bclr	#fire,d1
		bclr	#fire,d3
		clr.w	variables+mouse0_left_bt(a5)
.fire_skip
		move.b	d3,variables+joystick1(a5)
		move.b	d1,variables+joystick1_temp(a5)
		rts

digital_joystick2
		move.w	joy1dat(a6),d0
		move.b	variables+joystick2_temp(a5),d1
		move.b	variables+joystick2(a5),d3

		move.w	global_vars+active_controls(a5),d4
		andi.w	#ACTV_JOY2M!ACTV_PAD2M,d4
        	bsr.s	digital_joystick
.no_joy2
                move.w	variables+mouse1_left_bt(a5),variables+mouse1_old_left_bt(a5)
		btst.b	#7,ciaapra
		bne.s	.not_fire

                move.w	#1,variables+mouse1_left_bt(a5)
		bset	#fire,d3
		bset	#fire,d1
		bra.s	.fire_skip
.not_fire	bclr	#fire,d1
		bclr	#fire,d3
		clr.w	variables+mouse1_left_bt(a5)
.fire_skip
		move.b	d3,variables+joystick2(a5)
		move.b	d1,variables+joystick2_temp(a5)
		rts

digital_joystick
		move.w	d1,d4
		andi.w	#$f,d4

		move.w	d0,d2
		lsr.w	#1,d2
		eor.w	d0,d2

		btst.l	#8,d2			;up
		beq.s	.not_up
		tst.w	d4
		bne.s	.up_skip
		bset	#up,d3
		bset	#up,d1
		bra.s	.up_skip
.not_up		bclr.l	#up,d1
.up_skip
		btst.l	#0,d2			;down
		beq.s	.not_down
		tst.w	d4
		bne.s	.down_skip
		bset	#down,d3
		bset	#down,d1
		bra.s	.down_skip
.not_down	bclr.l	#down,d1
.down_skip
		btst.l	#9,d0			;left
		beq.s	.not_left
		tst.w	d4
		bne.s	.left_skip
		bset	#left,d3
		bset	#left,d1
		bra.s	.left_skip
.not_left	bclr.l	#left,d1
.left_skip
		btst.l	#1,d0			;right
		beq.s	.not_right
		tst.w	d4
		bne.s	.right_skip
		bset	#right,d3
		bset	#right,d1
		bra.s	.right_skip
.not_right	bclr.l	#right,d1
.right_skip
		rts

****************************************************************************
;INPUT:         none
;OUTPUT:	d3=bits set for directions (byte)
;CHANGES:       d1
parallel_joystick2
		move.b	variables+joystick4_temp(a5),d1
		move.b	variables+joystick4(a5),d3

		move.w	d1,d4
		andi.w	#$f,d4

		btst.b	#4,ciaaprb		;up
		bne.s	.not_up
		tst.w	d4
		bne.s	.up_skip
		bset	#up,d3
		bset	#up,d1
		bra.s	.up_skip
.not_up		bclr.l	#up,d1
.up_skip
		btst.b	#5,ciaaprb		;down
		bne.s	.not_down
		tst.w	d4
		bne.s	.down_skip
		bset	#down,d3
		bset	#down,d1
		bra.s	.down_skip
.not_down	bclr.l	#down,d1
.down_skip
		btst.b	#6,ciaaprb		;left
		bne.s	.not_left
		tst.w	d4
		bne.s	.left_skip
		bset	#left,d3
		bset	#left,d1
		bra.s	.left_skip
.not_left	bclr.l	#left,d1
.left_skip
		btst.b	#7,ciaaprb		;right
		bne.s	.not_right
		tst.w	d4
		bne.s	.right_skip
		bset	#right,d3
		bset	#right,d1
		bra.s	.right_skip
.not_right	bclr.l	#right,d1
.right_skip
		btst.b	#0,$bfd000		;fire
		bne.s	.not_fire
		bset	#fire,d3
		bset.l	#fire,d1
		bra.s	.fire_skip
.not_fire	bclr.l	#fire,d1
		bclr.l	#fire,d3
.fire_skip
		move.b	d3,variables+joystick4(a5)
		move.b	d1,variables+joystick4_temp(a5)
		rts

****************************************************************************
;INPUT:         none
;OUTPUT:	d3=bits set for directions (byte)
;CHANGES:       d1
parallel_joystick1
		move.b	variables+joystick3_temp(a5),d1
		move.b	variables+joystick3(a5),d3

		move.w	d1,d4
		andi.w	#$f,d4

		btst.b	#0,ciaaprb		;up
		bne.s	.not_up
		tst.w	d4
		bne.s	.up_skip
		bset	#up,d3
		bset	#up,d1
		bra.s	.up_skip
.not_up		bclr.l	#up,d1
.up_skip
		btst.b	#1,ciaaprb		;down
		bne.s	.not_down
		tst.w	d4
		bne.s	.down_skip
		bset	#down,d3
		bset	#down,d1
		bra.s	.down_skip
.not_down	bclr.l	#down,d1
.down_skip
		btst.b	#2,ciaaprb		;left
		bne.s	.not_left
		tst.w	d4
		bne.s	.left_skip
		bset	#left,d3
		bset	#left,d1
		bra.s	.left_skip
.not_left	bclr.l	#left,d1
.left_skip
		btst.b	#3,ciaaprb		;right
		bne.s	.not_right
		tst.w	d4
		bne.s	.right_skip
		bset	#right,d3
		bset	#right,d1
		bra.s	.right_skip
.not_right	bclr.l	#right,d1
.right_skip
		btst.b	#2,$bfd000		;fire
		bne.s	.not_fire
		bset	#fire,d3
		bset.l	#fire,d1
		bra.s	.fire_skip
.not_fire	bclr.l	#fire,d1
		bclr.l	#fire,d3
.fire_skip
		move.b	d3,variables+joystick3(a5)
		move.b	d1,variables+joystick3_temp(a5)
		rts

****************************************************************************
****************************************************************************
****************************************************************************
;INPUT: 	none
;OUTPUT:	none
;CHANGES:       d1

mouse_xmin	equ	128+3
mouse_xmax	equ	128+314+3
mouse_ymin	equ	41+0-2
mouse_ymax	equ	41+212+3

mouse0_read
		move.w	variables+mouse0_right_bt(a5),variables+mouse0_old_right_bt(a5)
		btst.b	#2,potgor(a6)		;fire
		bne.s	.not_fire

		move.w	#1,variables+mouse0_right_bt(a5)
		bset	#fire,d3
		bset.l	#fire,d1
		bra.s	.fire_skip
.not_fire	bclr.l	#fire,d1
		clr.w	variables+mouse0_right_bt(a5)
.fire_skip
		move.w	variables+mouse0_trip(a5),d0
		move.w	joy0dat(a6),d1
		move.w	d1,variables+mouse0_trip(a5)

.move_left	move.w	d0,d2
		move.w	d1,d3
		sub.b	d1,d0			;horizontal change
		beq.s	.move_up		;no change then skip
		bmi.s	.move_right		;-ve move then right
		ext.w	d0
		sub.w	d0,variables+mouse0_x(a5)		;+ve move then left
		cmpi.w	#mouse_xmin,variables+mouse0_x(a5)	;too far too left?
		bgt.s	.move_up
		move.w	#mouse_xmin,variables+mouse0_x(a5)
		bra.s	.move_up

.move_right	ext.w	d0
		sub.w	d0,variables+mouse0_x(a5)
		cmpi.w	#mouse_xmax,variables+mouse0_x(a5)	;too far to right?
		blt.s	.move_up
		move.w	#mouse_xmax,variables+mouse0_x(a5)

.move_up	lsr.w	#8,d2
		lsr.w	#8,d3
		sub.b	d3,d2			;vertical change
		beq.s	.no_vert_move		;no change then skip
		bmi.s	.move_down		;-ve move down
		ext.w	d2
		sub.w	d2,variables+mouse0_y(a5)		;+ve move up
		cmpi.w	#mouse_ymin,variables+mouse0_y(a5)	;too far up?
		bgt.s	.no_vert_move
		move.w	#mouse_ymin,variables+mouse0_y(a5)
.no_vert_move	rts

.move_down	ext.w	d2
		sub.w	d2,variables+mouse0_y(a5)
		cmpi.w	#mouse_ymax,variables+mouse0_y(a5)	;too far down?
		blt.s	.no_vert_move
		move.w	#mouse_ymax,variables+mouse0_y(a5)
		rts

.play
		rts

mouse_hires_xmin	equ	mouse_xmin*3
mouse_hires_xmax	equ	mouse_xmax*3
mouse_hires_ymin	equ	mouse_ymin*2
mouse_hires_ymax	equ	mouse_ymax*2

mouse0_hires_read
		move.w	variables+mouse0_right_bt(a5),variables+mouse0_old_right_bt(a5)
		btst.b	#2,potgor(a6)		;fire
		bne.s	.not_fire

		move.w	#1,variables+mouse0_right_bt(a5)
		bset	#fire,d3
		bset.l	#fire,d1
		bra.s	.fire_skip
.not_fire	bclr.l	#fire,d1
		clr.w	variables+mouse0_right_bt(a5)
.fire_skip
		move.w	variables+mouse0_trip(a5),d0
		move.w	joy0dat(a6),d1
		move.w	d1,variables+mouse0_trip(a5)

.move_left	move.w	d0,d2
		move.w	d1,d3
		sub.b	d1,d0			;horizontal change
		beq.s	.move_up		;no change then skip
		bmi.s	.move_right		;-ve move then right
		ext.w	d0
		sub.w	d0,variables+mouse0_x(a5)		;+ve move then left
		cmpi.w	#mouse_hires_xmin,variables+mouse0_x(a5)	;too far too left?
		bgt.s	.move_up
		move.w	#mouse_hires_xmin,variables+mouse0_x(a5)
		bra.s	.move_up

.move_right	ext.w	d0
		sub.w	d0,variables+mouse0_x(a5)
		cmpi.w	#mouse_hires_xmax,variables+mouse0_x(a5)	;too far to right?
		blt.s	.move_up
		move.w	#mouse_hires_xmax,variables+mouse0_x(a5)

.move_up	lsr.w	#8,d2
		lsr.w	#8,d3
		sub.b	d3,d2			;vertical change
		beq.s	.no_vert_move		;no change then skip
		bmi.s	.move_down		;-ve move down
		ext.w	d2
		sub.w	d2,variables+mouse0_y(a5)		;+ve move up
		cmpi.w	#mouse_hires_ymin,variables+mouse0_y(a5)	;too far up?
		bgt.s	.no_vert_move
		move.w	#mouse_hires_ymin,variables+mouse0_y(a5)
.no_vert_move	rts

.move_down	ext.w	d2
		sub.w	d2,variables+mouse0_y(a5)
		cmpi.w	#mouse_hires_ymax,variables+mouse0_y(a5)	;too far down?
		blt.s	.no_vert_move
		move.w	#mouse_hires_ymax,variables+mouse0_y(a5)
		rts

.play
		rts

****************************************************************************
mouse1_read
		move.w	variables+mouse1_right_bt(a5),variables+mouse1_old_right_bt(a5)
		btst.b	#6,potgor(a6)		;fire
		bne.s	.not_fire

                move.w	#1,variables+mouse1_right_bt(a5)
		bset	#fire,d3
		bset.l	#fire,d1
		bra.s	.fire_skip
.not_fire	bclr.l	#fire,d1
		clr.w	variables+mouse1_right_bt(a5)
.fire_skip
		move.w	variables+mouse1_trip(a5),d0
		move.w	joy1dat(a6),d1
		move.w	d1,variables+mouse1_trip(a5)

.move_left	move.w	d0,d2
		move.w	d1,d3
		sub.b	d1,d0			;horizontal change
		beq.s	.move_up		;no change then skip
		bmi.s	.move_right		;-ve move then right
		ext.w	d0
		sub.w	d0,variables+mouse1_x(a5)		;+ve move then left
		cmpi.w	#mouse_xmin,variables+mouse1_x(a5)	;too far too left?
		bgt.s	.move_up
		move.w	#mouse_xmin,variables+mouse1_x(a5)
		bra.s	.move_up

.move_right	ext.w	d0
		sub.w	d0,variables+mouse1_x(a5)
		cmpi.w	#mouse_xmax,variables+mouse1_x(a5)	;too far to right?
		blt.s	.move_up
		move.w	#mouse_xmax,variables+mouse1_x(a5)

.move_up	lsr.w	#8,d2
		lsr.w	#8,d3
		sub.b	d3,d2			;vertical change
		beq.s	.no_vert_move		;no change then skip
		bmi.s	.move_down		;-ve move down
		ext.w	d2
		sub.w	d2,variables+mouse1_y(a5)		;+ve move up
		cmpi.w	#mouse_ymin,variables+mouse1_y(a5)	;too far up?
		bgt.s	.no_vert_move
		move.w	#mouse_ymin,variables+mouse1_y(a5)
.no_vert_move	rts

.move_down	ext.w	d2
		sub.w	d2,variables+mouse1_y(a5)
		cmpi.w	#mouse_ymax,variables+mouse1_y(a5)	;too far down?
		blt.s	.no_vert_move
		move.w	#mouse_ymax,variables+mouse1_y(a5)
		rts

mouse1_hires_read
		move.w	variables+mouse1_right_bt(a5),variables+mouse1_old_right_bt(a5)
		btst.b	#6,potgor(a6)		;fire
		bne.s	.not_fire

                move.w	#1,variables+mouse1_right_bt(a5)
		bset	#fire,d3
		bset.l	#fire,d1
		bra.s	.fire_skip
.not_fire	bclr.l	#fire,d1
		clr.w	variables+mouse1_right_bt(a5)
.fire_skip
		move.w	variables+mouse1_trip(a5),d0
		move.w	joy1dat(a6),d1
		move.w	d1,variables+mouse1_trip(a5)

.move_left	move.w	d0,d2
		move.w	d1,d3
		sub.b	d1,d0			;horizontal change
		beq.s	.move_up		;no change then skip
		bmi.s	.move_right		;-ve move then right
		ext.w	d0
		sub.w	d0,variables+mouse1_x(a5)		;+ve move then left
		cmpi.w	#mouse_hires_xmin,variables+mouse1_x(a5)	;too far too left?
		bgt.s	.move_up
		move.w	#mouse_hires_xmin,variables+mouse1_x(a5)
		bra.s	.move_up

.move_right	ext.w	d0
		sub.w	d0,variables+mouse1_x(a5)
		cmpi.w	#mouse_hires_xmax,variables+mouse1_x(a5)	;too far to right?
		blt.s	.move_up
		move.w	#mouse_hires_xmax,variables+mouse1_x(a5)

.move_up	lsr.w	#8,d2
		lsr.w	#8,d3
		sub.b	d3,d2			;vertical change
		beq.s	.no_vert_move		;no change then skip
		bmi.s	.move_down		;-ve move down
		ext.w	d2
		sub.w	d2,variables+mouse1_y(a5)		;+ve move up
		cmpi.w	#mouse_hires_ymin,variables+mouse1_y(a5)	;too far up?
		bgt.s	.no_vert_move
		move.w	#mouse_hires_ymin,variables+mouse1_y(a5)
.no_vert_move	rts

.move_down	ext.w	d2
		sub.w	d2,variables+mouse1_y(a5)
		cmpi.w	#mouse_hires_ymax,variables+mouse1_y(a5)	;too far down?
		blt.s	.no_vert_move
		move.w	#mouse_hires_ymax,variables+mouse1_y(a5)
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		d0=mouse x (word)
;		d1=mouse y (word)
;		a3=address of sprite data (long)
;OUTPUT:        a3=address of sprite image (long)
;CHANGES:       d4,d5

get_sprite_image0
		move.l	a4,-(sp)

		move.l	#sprites,a3
		add.l   a4,a3
		move.w	variables+mouse0_x(a5),d0
		move.w	variables+mouse0_y(a5),d1
		subi.w	#128,d0
		subi.w	#41,d1

		cmp.w	variables+player2+gadget_xoffset(a5),d0
		bge.s	.pl2or4
		cmp.w	variables+player3+gadget_yoffset(a5),d1
		bge.s	.pl3
		move.w	#1,d3
		move.w 	variables+player1+window_type(a5),d4
		move.w	variables+player1+aux_here(a5),d2
		add.w	variables+player1+using_grenade(a5),d2
		sub.w	variables+player1+behind_pushable(a5),d2
		move.b 	variables+player1+control_method(a5),d5
		sub.w	variables+player1+gadget_xoffset(a5),d0
		sub.w	variables+player1+gadget_yoffset(a5),d1
		bra	.find_gadget
.pl3		cmp.w	variables+player3+gadget_xoffset(a5),d0
		blt	.end_list
		cmp.w	variables+player4+gadget_xoffset(a5),d0
		bge	.end_list
		move.w	#3,d3
		move.w 	variables+player3+window_type(a5),d4
		move.w 	variables+player3+aux_here(a5),d2
		add.w 	variables+player3+using_grenade(a5),d2
		sub.w	variables+player3+behind_pushable(a5),d2
		move.b 	variables+player3+control_method(a5),d5
		sub.w	variables+player3+gadget_xoffset(a5),d0
		sub.w	variables+player3+gadget_yoffset(a5),d1
		bra.s	.find_gadget
.pl2or4		cmp.w	variables+player4+gadget_yoffset(a5),d1
		bge.s	.pl4
		move.w	#2,d3
		move.w 	variables+player2+window_type(a5),d4
		move.w 	variables+player2+aux_here(a5),d2
		add.w 	variables+player2+using_grenade(a5),d2
		sub.w	variables+player2+behind_pushable(a5),d2
		move.b 	variables+player2+control_method(a5),d5
		sub.w	variables+player2+gadget_xoffset(a5),d0
		sub.w	variables+player2+gadget_yoffset(a5),d1
		bra.s	.find_gadget
.pl4		cmp.w	variables+player4+gadget_xoffset(a5),d0
		blt	.pl3
		move.w	#4,d3
		move.w 	variables+player4+window_type(a5),d4
		move.w 	variables+player4+aux_here(a5),d2
		add.w 	variables+player4+using_grenade(a5),d2
		sub.w	variables+player4+behind_pushable(a5),d2
		move.b 	variables+player4+control_method(a5),d5
		sub.w	variables+player4+gadget_xoffset(a5),d0
		sub.w	variables+player4+gadget_yoffset(a5),d1
.find_gadget
		cmpi.b	#5,d5
		bne	.end_list
		cmpi.w	#MODE_GAME,variables+mode(a5)
		bne	.end_list

		tst.w	variables+mouse0_left_bt(a5)
		beq.s	.no_left_button
		move.w	d3,variables+mouse0_player(a5)
.no_left_button
		tst.w	variables+mouse0_right_bt(a5)
		beq.s	.no_right_button
		move.w	d3,variables+mouse0_player(a5)
.no_right_button
		subq.w	#1,d3
		mulu	#player_struct_size,d3
		lea	variables+player1(a5),a0
		add.w	d3,a0

		cmpi.w	#0,d4
		bne.s	.not_win0
		lea	win0_gadgets_no_aux_grenade,a4
		tst.w	d2
		bpl.s	.ok_g
		addq.w	#2,d2
.ok_g		cmpi.w	#2,d2
		blt.s	.without_g
		bgt.s	.with_g
		bra	.loop
.without_g	tst.w	d2
		beq.w	.nup
		lea	win0_gadgets_aux,a4
		bra	.loop
.nup		lea	win0_gadgets_no_aux,a4
		bra	.loop
.with_g		lea	win0_gadgets_aux_grenade,a4
		bra	.loop
.not_win0
		cmpi.w	#1,d4
		bne.s	.not_win1
		lea	win1_gadgets,a4
		bra	.loop
.not_win1
		cmpi.w	#2,d4
		bne.s	.not_win2
		lea	win2_gadgets,a4
		bra	.loop
.not_win2
		cmpi.w	#3,d4
		bne.s	.not_win3
		lea	win3_gadgets,a4
		bra	.loop
.not_win3
		cmpi.w	#4,d4
		bne	.not_win4
		lea	win4_gadgets,a4
		bra	.loop
.not_win4
		cmpi.w	#6,d4
		bne	.not_win6
		lea	win6_gadgets,a4
		bra	.loop
.not_win6
		cmpi.w	#7,d4
		bne	.end_list
		lea	win7_gadgets,a4
		bra	.loop
.loop
		tst.w	(a4)
		bmi	.end_list

                cmp.w	(a4),d0
		blt	.next_gadget
                cmp.w	2(a4),d1
		blt	.next_gadget
                cmp.w	4(a4),d0
		bgt	.next_gadget
                cmp.w	6(a4),d1
		bgt	.next_gadget

		move.w  8(a4),d2
	IFD	CD32
		mulu	#144,d2
	ELSEIF
		mulu	#72,d2
	ENDC
		add.w	d2,a3

		tst.w	variables+mouse0_left_bt(a5)
		beq	.left_skip_action
		tst.w	variables+mouse0_old_left_bt(a5)
		bne.s	.left_skip_action
		move.w  10(a4),variables+mouse0_action(a5)

	IFD	demo
		cmpi.w	#2,global_vars+attract_mode(a5)
		bne.s	.play
		clr.w	variables+mouse0_left_bt(a5)
.play
		cmpi.w	#1,global_vars+attract_mode(a5)
		bne.s	.not_record
		moveq.l	#0,d0
		move.w	variables+mouse_move(a5),d0
                move.l	#mouse_moves,a0
		add.l	a5,a0
		add.l	d0,a0
		move.w	variables+mouse_timer(a5),(a0)+
		move.w	variables+mouse0_x(a5),(a0)+
		move.w	variables+mouse0_y(a5),(a0)+
		move.w	#0,(a0)
		addi.w	#8,variables+mouse_move(a5)
.not_record
	ENDC
.left_skip_action
		tst.w	variables+mouse0_right_bt(a5)
		beq.s	.right_skip_action
		tst.w	variables+mouse0_old_right_bt(a5)
		bne.s	.right_skip_action
		move.w	12(a4),variables+mouse0_action(a5)

	IFD	demo
		cmpi.w	#2,global_vars+attract_mode(a5)
		bne.s	.play2
		clr.w	variables+mouse0_right_bt(a5)
.play2
		cmpi.w	#1,global_vars+attract_mode(a5)
		bne.s	.not_record2
		moveq.l	#0,d0
		move.w	variables+mouse_move(a5),d0
                move.l	#mouse_moves,a0
		add.l	a5,a0
		add.l	d0,a0
		move.w	variables+mouse_timer(a5),(a0)+
		move.w	variables+mouse0_x(a5),(a0)+
		move.w	variables+mouse0_y(a5),(a0)+
		move.w	#1,(a0)
		addi.w	#8,variables+mouse_move(a5)
.not_record2
	ENDC
.right_skip_action
		move.l	(sp)+,a4
		rts

.next_gadget	add.w	#14,a4
		bra	.loop

.end_list	move.l	a3,variables+mouse0_last_image(a5)
		move.l	(sp)+,a4
		rts

****************************************************************************
get_sprite_image1
		move.l	a4,-(sp)

	IFD	CD32
		move.l	#sprites+19*144,a3
	ELSEIF
		move.l	#sprites+19*72,a3
	ENDC
		add.l	a4,a3
		move.w	variables+mouse1_x(a5),d0
		move.w	variables+mouse1_y(a5),d1
		subi.w	#128,d0
		subi.w	#41,d1

		cmp.w	variables+player2+gadget_xoffset(a5),d0
		bge.s	.pl2or4
		cmp.w	variables+player3+gadget_yoffset(a5),d1
		bge.s	.pl3
		move.w	#1,d3
		move.w 	variables+player1+window_type(a5),d4
		move.w 	variables+player1+aux_here(a5),d2
		add.w 	variables+player1+using_grenade(a5),d2
		sub.w	variables+player1+behind_pushable(a5),d2
		move.b 	variables+player1+control_method(a5),d5
		sub.w	variables+player1+gadget_xoffset(a5),d0
		sub.w	variables+player1+gadget_yoffset(a5),d1
		bra	.find_gadget
.pl3		cmp.w	variables+player3+gadget_xoffset(a5),d0
		blt	.end_list
		cmp.w	variables+player4+gadget_xoffset(a5),d0
		bge	.end_list
		move.w	#3,d3
		move.w 	variables+player3+window_type(a5),d4
		move.w 	variables+player3+aux_here(a5),d2
		add.w 	variables+player3+using_grenade(a5),d2
		sub.w	variables+player3+behind_pushable(a5),d2
		move.b 	variables+player3+control_method(a5),d5
		sub.w	variables+player3+gadget_xoffset(a5),d0
		sub.w	variables+player3+gadget_yoffset(a5),d1
		bra.s	.find_gadget
.pl2or4		cmp.w	variables+player3+gadget_yoffset(a5),d1
		bge.s	.pl4
		move.w	#2,d3
		move.w 	variables+player2+window_type(a5),d4
		move.w 	variables+player2+aux_here(a5),d2
		add.w 	variables+player2+using_grenade(a5),d2
		sub.w	variables+player2+behind_pushable(a5),d2
		move.b 	variables+player2+control_method(a5),d5
		sub.w	variables+player2+gadget_xoffset(a5),d0
		sub.w	variables+player2+gadget_yoffset(a5),d1
		bra.s	.find_gadget
.pl4		cmp.w	variables+player4+gadget_xoffset(a5),d0
		blt	.pl3
		move.w	#4,d3
		move.w 	variables+player4+window_type(a5),d4
		move.w 	variables+player4+aux_here(a5),d2
		add.w 	variables+player4+using_grenade(a5),d2
		sub.w	variables+player4+behind_pushable(a5),d2
		move.b 	variables+player4+control_method(a5),d5
		sub.w	variables+player4+gadget_xoffset(a5),d0
		sub.w	variables+player4+gadget_yoffset(a5),d1
.find_gadget
		cmpi.b	#6,d5
		bne	.end_list
		cmpi.w	#MODE_GAME,variables+mode(a5)
		bne	.end_list

		tst.w	variables+mouse1_left_bt(a5)
		beq.s	.no_left_button
		move.w	d3,variables+mouse1_player(a5)
.no_left_button
		tst.w	variables+mouse1_right_bt(a5)
		bne.s	.no_right_button
		move.w	d3,variables+mouse1_player(a5)
.no_right_button
		subq.w	#1,d3
		mulu	#player_struct_size,d3
		lea	variables+player1(a5),a0
		add.w	d3,a0

		cmpi.w	#0,d4
		bne.s	.not_win0
		lea	win0_gadgets_no_aux_grenade,a4
		tst.w	d2
		bpl.s	.ok_g
		addq.w	#2,d2
.ok_g		cmpi.w	#2,d2
		blt.s	.without_g
		bgt.s	.with_g
		bra	.loop
.without_g	tst.w	d2
		beq.w	.nup
		lea	win0_gadgets_aux,a4
		bra	.loop
.nup		lea	win0_gadgets_no_aux,a4
		bra	.loop
.with_g		lea	win0_gadgets_aux_grenade,a4
		bra	.loop
.not_win0
		cmpi.w	#1,d4
		bne.s	.not_win1
		lea	win1_gadgets,a4
		bra	.loop
.not_win1
		cmpi.w	#2,d4
		bne.s	.not_win2
		lea	win2_gadgets,a4
		bra	.loop
.not_win2
		cmpi.w	#3,d4
		bne.s	.not_win3
		lea	win3_gadgets,a4
		bra	.loop
.not_win3
		cmpi.w	#4,d4
		bne	.not_win4
		lea	win4_gadgets,a4
		bra	.loop
.not_win4
		cmpi.w	#6,d4
		bne	.not_win6
		lea	win6_gadgets,a4
		bra	.loop
.not_win6
		cmpi.w	#7,d4
		bne	.end_list
		lea	win7_gadgets,a4
		bra	.loop
.loop
		tst.w	(a4)
		bmi	.end_list

                cmp.w	(a4),d0
		blt	.next_gadget
                cmp.w	2(a4),d1
		blt	.next_gadget
                cmp.w	4(a4),d0
		bgt	.next_gadget
                cmp.w	6(a4),d1
		bgt	.next_gadget

		move.w  8(a4),d2
	IFD	CD32
		mulu	#144,d2
	ELSEIF
		mulu	#72,d2
	ENDC
		add.w	d2,a3

		tst.w	variables+mouse1_left_bt(a5)
		beq.s	.left_skip_action
		tst.w	variables+mouse1_old_left_bt(a5)
		bne.s	.left_skip_action
		move.w  10(a4),variables+mouse1_action(a5)
.left_skip_action

		tst.w	variables+mouse1_right_bt(a5)
		beq.s	.right_skip_action
		tst.w	variables+mouse1_old_right_bt(a5)
		bne.s	.right_skip_action
		move.w  12(a4),variables+mouse1_action(a5)
.right_skip_action
		move.l	(sp)+,a4
		rts

.next_gadget	add.w	#14,a4
		bra	.loop

.end_list	move.l	a3,variables+mouse1_last_image(a5)
		move.l	(sp)+,a4
		rts

****************************************************************************
;format : top x,y, bottom x,y, sprite num, action num, right action num
win0_gadgets_no_aux
		dc.w	38,14,107,41,1,1,0		;forward
		dc.w	108,14,143,75,4,4,0		;turn right
		dc.w	2,14,37,75,3,3,0		;turn left
		dc.w	108,76,143,97,13,13,0		;sidestep right
		dc.w	2,76,37,97,14,14,0		;sidestep left
		dc.w	38,42,107,76,5,5,6		;fire
		dc.w	38,77,107,97,2,2,0		;backwards
		dc.w	38,0,59,9,10,10,0		;select store
		dc.w	60,0,79,9,10,11,0		;select vdu
		dc.w	80,0,99,9,10,12,0		;select stats
		dc.w	144,10,151,19,10,16,0		;select leader
		dc.w	-1				;eod

win0_gadgets_aux
		dc.w	4,64,35,95,14,14,22		;pick up
		dc.w	38,14,107,41,1,1,0		;forward
		dc.w	108,14,143,75,4,4,0		;turn right
		dc.w	2,14,37,75,3,3,0		;turn left
		dc.w	108,76,143,97,13,13,0		;sidestep right
		dc.w	2,76,37,97,14,14,0		;sidestep left
		dc.w	38,42,107,76,5,5,6		;fire
		dc.w	38,77,107,97,2,2,0		;backwards
		dc.w	38,0,59,9,10,10,0		;select store
		dc.w	60,0,79,9,10,11,0		;select vdu
		dc.w	80,0,99,9,10,12,0		;select stats
		dc.w	144,10,151,19,10,16,0		;select leader
		dc.w	-1				;eod

win0_gadgets_no_aux_grenade
		dc.w	38,14,107,41,1,1,0		;forward
		dc.w	108,14,143,75,4,4,0		;turn right
		dc.w	2,14,37,75,3,3,0		;turn left
		dc.w	108,76,143,97,13,13,0		;sidestep right
		dc.w	2,76,37,97,14,14,0		;sidestep left

		dc.w	38,41,107,50,18,26,0		;fire 4
		dc.w	38,51,107,59,17,27,0		;fire 3
		dc.w	38,60,107,68,16,28,0		;fire 2
		dc.w	38,69,107,77,15,29,0		;fire 1

		dc.w	38,77,107,97,2,2,0		;backwards
		dc.w	38,0,59,9,10,10,0		;select store
		dc.w	60,0,79,9,10,11,0		;select vdu
		dc.w	80,0,99,9,10,12,0		;select stats
		dc.w	144,10,151,19,10,16,0		;select leader
		dc.w	-1				;eod

win0_gadgets_aux_grenade
		dc.w	4,64,35,95,14,14,22		;pick up
		dc.w	38,14,107,41,1,1,0		;forward
		dc.w	108,14,143,75,4,4,0		;turn right
		dc.w	2,14,37,75,3,3,0		;turn left
		dc.w	108,76,143,97,13,13,0		;sidestep right
		dc.w	2,76,37,97,14,14,0		;sidestep left

		dc.w	38,41,107,50,18,26,0		;fire 4
		dc.w	38,51,107,59,17,27,0		;fire 3
		dc.w	38,60,107,68,16,28,0		;fire 2
		dc.w	38,69,107,77,15,29,0		;fire 1

		dc.w	38,77,107,97,2,2,0		;backwards
		dc.w	38,0,59,9,10,10,0		;select store
		dc.w	60,0,79,9,10,11,0		;select vdu
		dc.w	80,0,99,9,10,12,0		;select stats
		dc.w	144,10,151,19,10,16,0		;select leader
		dc.w	-1				;eod

****************************************************************************
;format : top x,y, bottom x,y, sprite num, action num, right action num
win1_gadgets	dc.w	0,17,65,43,1,1,0		;scroll down
		dc.w	0,67,65,93,2,2,0		;scroll up
		dc.w	66,33,83,58,6,15,0		;pick up
		dc.w	66,59,83,84,7,23,0		;drop
		dc.w	0,44,65,66,13,4,0		;use
		dc.w	84,36,149,74,14,3,17		;unuse
		dc.w	66,10,83,32,9,19,0		;info
		dc.w	0,0,31,9,10,9,0			;select view
		dc.w	58,0,79,9,10,11,0		;select vdu
		dc.w	80,0,99,9,10,12,0		;select stats
		dc.w	146,10,153,19,10,16,0		;select leader
		dc.w	-1				;eod

****************************************************************************
;format : top x,y, bottom x,y, sprite num, action num, right action num
win2_gadgets
		dc.w	0,0,39,9,10,9,0			;select view
		dc.w	40,0,51,9,10,10,0		;select store
		dc.w	78,0,99,9,10,12,0		;select stats
		dc.w	55,15,98,55,11,1,20		;forward
		dc.w	99,15,141,96,13,4,20		;turn right
		dc.w	12,15,54,96,14,3,20		;turn left
		dc.w	55,56,98,96,12,2,20		;turn right
		dc.w	142,10,149,19,10,16,0		;select leader
		dc.w	-1				;eod

****************************************************************************
;format : top x,y, bottom x,y, sprite num, action num, right action num
win3_gadgets	dc.w	0,0,39,11,10,9,0		;select view
		dc.w	40,0,59,11,10,10,0		;select store
		dc.w	60,0,71,11,10,11,0		;select vdu
		dc.w	146,10,153,19,10,16,0		;select leader
		dc.w	-1				;eod

****************************************************************************
;format : top x,y, bottom x,y, sprite num, action num, right action num
win4_gadgets	dc.w	-1				;eod

****************************************************************************
;format : top x,y, bottom x,y, sprite num, action num, right action num
win6_gadgets	dc.w	0,0,153,99,8,21,0		;wake up
		dc.w	-1				;eod

****************************************************************************
;format : top x,y, bottom x,y, sprite num, action num, right action num
win7_gadgets	dc.w	0,0,153,99,8,0,0		;wake up
		dc.w	-1				;eod

****************************************************************************
****************************************************************************
****************************************************************************
scroll_field
		move.l	a4,-(sp)

		move.l	#copperlist+col_waits+6,a2
		add.l	a4,a2
		move.l	#copperlist+col_waits2+6,a3
		add.l	a4,a3

		move.w	variables+field_posn(a5),d0
		addq.w	#1,d0
		cmpi.w  #6*15,d0
		bne.s	.not_end_of_list
		moveq.l	#0,d0
.not_end_of_list
		move.w	d0,variables+field_posn(a5)

		lsl.w	#1,d0
		lea	field_cols,a4
		add.w	d0,a4

		move.w	(a4),(a2)
		move.w	(a4)+,(a3)
		move.w	(a4),4+1*SKY_4LINE_SIZE(a2)
		move.w	(a4)+,4+1*SKY_4LINE_SIZE(a3)
		move.w	(a4),8+2*SKY_4LINE_SIZE(a2)
		move.w	(a4)+,8+2*SKY_4LINE_SIZE(a3)
		move.w	(a4),8+3*SKY_4LINE_SIZE(a2)
		move.w	(a4)+,8+3*SKY_4LINE_SIZE(a3)
		move.w	(a4),8+4*SKY_4LINE_SIZE(a2)
		move.w	(a4)+,8+4*SKY_4LINE_SIZE(a3)
		move.w	(a4),8+5*SKY_4LINE_SIZE(a2)
		move.w	(a4)+,8+5*SKY_4LINE_SIZE(a3)
		move.w	(a4),8+6*SKY_4LINE_SIZE(a2)
		move.w	(a4)+,8+6*SKY_4LINE_SIZE(a3)
		move.w	(a4),8+7*SKY_4LINE_SIZE(a2)
		move.w	(a4)+,8+7*SKY_4LINE_SIZE(a3)
		move.w	(a4),8+8*SKY_4LINE_SIZE(a2)
		move.w	(a4)+,8+8*SKY_4LINE_SIZE(a3)
		move.w	(a4),8+9*SKY_4LINE_SIZE(a2)
		move.w	(a4)+,8+9*SKY_4LINE_SIZE(a3)
		move.w	(a4),8+10*SKY_4LINE_SIZE(a2)
		move.w	(a4)+,8+10*SKY_4LINE_SIZE(a3)
		move.w	(a4),8+11*SKY_4LINE_SIZE+0*8(a2)
		move.w	(a4)+,8+11*SKY_4LINE_SIZE+0*8(a3)
		move.w	(a4),8+11*SKY_4LINE_SIZE+1*8(a2)
		move.w	(a4)+,8+11*SKY_4LINE_SIZE+1*8(a3)
		move.w	(a4),8+11*SKY_4LINE_SIZE+2*8(a2)
		move.w	(a4)+,8+11*SKY_4LINE_SIZE+2*8(a3)
		move.w	(a4),8+11*SKY_4LINE_SIZE+3*8(a2)
		move.w	(a4)+,8+11*SKY_4LINE_SIZE+3*8(a3)
		move.w	(a4),8+11*SKY_4LINE_SIZE+4*8(a2)
		move.w	(a4)+,8+11*SKY_4LINE_SIZE+4*8(a3)
		move.w	(a4),8+11*SKY_4LINE_SIZE+5*8(a2)
		move.w	(a4)+,8+11*SKY_4LINE_SIZE+5*8(a3)
		move.w	(a4),8+11*SKY_4LINE_SIZE+6*8(a2)
		move.w	(a4)+,8+11*SKY_4LINE_SIZE+6*8(a3)
		move.w	(a4),8+11*SKY_4LINE_SIZE+7*8(a2)
		move.w	(a4)+,8+11*SKY_4LINE_SIZE+7*8(a3)
		move.w	(a4),8+11*SKY_4LINE_SIZE+8*8(a2)
		move.w	(a4)+,8+11*SKY_4LINE_SIZE+8*8(a3)
		move.w	(a4),8+11*SKY_4LINE_SIZE+9*8(a2)
		move.w	(a4)+,8+11*SKY_4LINE_SIZE+9*8(a3)

		move.l	(sp)+,a4

		rts

field_cols	dc.w    $f00
		dc.w	$f10
		dc.w	$f20
		dc.w	$f30
		dc.w	$f40
		dc.w	$f50
		dc.w	$f60
		dc.w	$f70
		dc.w	$f80
		dc.w	$f90
		dc.w	$fa0
		dc.w	$fb0
		dc.w	$fc0
		dc.w	$fd0
		dc.w	$fe0

		dc.w	$ff0
		dc.w	$ef0
		dc.w	$df0
		dc.w	$cf0
		dc.w	$bf0
		dc.w	$af0
		dc.w	$9f0
		dc.w	$8f0
		dc.w	$7f0
		dc.w	$6f0
		dc.w	$5f0
		dc.w	$4f0
		dc.w	$3f0
		dc.w	$2f0
		dc.w	$1f0

		dc.w	$0f0
		dc.w	$0f1
		dc.w	$0f2
		dc.w	$0f3
		dc.w	$0f4
		dc.w	$0f5
		dc.w	$0f6
		dc.w	$0f7
		dc.w	$0f8
		dc.w	$0f9
		dc.w	$0fa
		dc.w	$0fb
		dc.w	$0fc
		dc.w	$0fd
		dc.w	$0fe

		dc.w	$0ff
		dc.w	$0ef
		dc.w	$0df
		dc.w	$0cf
		dc.w	$0bf
		dc.w	$0af
		dc.w	$09f
		dc.w	$08f
		dc.w	$07f
		dc.w	$06f
		dc.w	$05f
		dc.w	$04f
		dc.w	$03f
		dc.w	$02f
		dc.w	$01f

		dc.w	$00f
		dc.w	$10f
		dc.w	$20f
		dc.w	$30f
		dc.w	$40f
		dc.w	$50f
		dc.w	$60f
		dc.w	$70f
		dc.w	$80f
		dc.w	$90f
		dc.w	$a0f
		dc.w	$b0f
		dc.w	$c0f
		dc.w	$d0f
		dc.w	$e0f

		dc.w	$f0f
		dc.w	$f0e
		dc.w	$f0d
		dc.w	$f0c
		dc.w	$f0b
		dc.w	$f0a
		dc.w	$f09
		dc.w	$f08
		dc.w	$f07
		dc.w	$f06
		dc.w	$f05
		dc.w	$f04
		dc.w	$f03
		dc.w	$f02
		dc.w	$f01

		dc.w    $f00
		dc.w	$f10
		dc.w	$f20
		dc.w	$f30
		dc.w	$f40
		dc.w	$f50
		dc.w	$f60
		dc.w	$f70
		dc.w	$f80
		dc.w	$f90
		dc.w	$fa0
		dc.w	$fb0
		dc.w	$fc0
		dc.w	$fd0
		dc.w	$fe0

		dc.w	$ff0
		dc.w	$ef0
		dc.w	$df0
		dc.w	$cf0
		dc.w	$bf0
		dc.w	$af0
		dc.w	$9f0
		dc.w	$8f0
		dc.w	$7f0
		dc.w	$6f0
		dc.w	$5f0
		dc.w	$4f0
		dc.w	$3f0
		dc.w	$2f0
		dc.w	$1f0

		dc.w	$0f0
		dc.w	$0f1
		dc.w	$0f2
		dc.w	$0f3
		dc.w	$0f4
		dc.w	$0f5
		dc.w	$0f6
		dc.w	$0f7
		dc.w	$0f8
		dc.w	$0f9
		dc.w	$0fa
		dc.w	$0fb
		dc.w	$0fc
		dc.w	$0fd
		dc.w	$0fe

****************************************************************************
****************************************************************************
****************************************************************************
scroll_scrolly
		move.l	a4,-(sp)
		move.l	chip_mem_base,a4

		cmpi.w	#12,variables+scrolly_on(a5)
		beq	.skip_scroll
		clr.w	variables+scrolly_on(a5)

		move.l	#scrolly+scrolly_plane_size+(scrolly_plane_width/8)*7,a0
		add.l	a4,a0

		movem.l	-32(a0),d0-d7
		add.l	d7,d7
		addx.l	d6,d6
		addx.l	d5,d5
		addx.l	d4,d4
		addx.l	d3,d3
		addx.l	d2,d2
		addx.l	d1,d1
		addx.l	d0,d0
		movem.l	d0-d7,-32(a0)

		movem.l	-64(a0),d0-d7
		addx.l	d7,d7
		addx.l	d6,d6
		addx.l	d5,d5
		addx.l	d4,d4
		bne.s	.not_empty1
		addi.w	#1,variables+scrolly_on(a5)
.not_empty1
		add.l	d3,d3
		addx.l	d2,d2
		addx.l	d1,d1
		addx.l	d0,d0
		movem.l	d0-d7,-64(a0)

		movem.l	-96(a0),d0-d7
		addx.l	d7,d7
		addx.l	d6,d6
		addx.l	d5,d5
		addx.l	d4,d4
		addx.l	d3,d3
		addx.l	d2,d2
		addx.l	d1,d1
		addx.l	d0,d0
		bne.s	.not_empty2
		addi.w	#1,variables+scrolly_on(a5)
.not_empty2
		movem.l	d0-d7,-96(a0)

		movem.l	-128(a0),d0-d7
		add.l	d7,d7
		addx.l	d6,d6
		addx.l	d5,d5
		addx.l	d4,d4
		addx.l	d3,d3
		addx.l	d2,d2
		addx.l	d1,d1
		addx.l	d0,d0
		movem.l	d0-d7,-128(a0)

		movem.l	-160(a0),d0-d7
		addx.l	d7,d7
		addx.l	d6,d6
		addx.l	d5,d5
		addx.l	d4,d4
		bne.s	.not_empty3
		addi.w	#1,variables+scrolly_on(a5)
.not_empty3
		add.l	d3,d3
		addx.l	d2,d2
		addx.l	d1,d1
		addx.l	d0,d0
		movem.l	d0-d7,-160(a0)

		movem.l	-192(a0),d0-d7
		addx.l	d7,d7
		addx.l	d6,d6
		addx.l	d5,d5
		addx.l	d4,d4
		addx.l	d3,d3
		addx.l	d2,d2
		addx.l	d1,d1
		addx.l	d0,d0
		bne.s	.not_empty4
		addi.w	#1,variables+scrolly_on(a5)
.not_empty4
		movem.l	d0-d7,-192(a0)

		movem.l	-224(a0),d0-d7
		add.l	d7,d7
		addx.l	d6,d6
		addx.l	d5,d5
		addx.l	d4,d4
		addx.l	d3,d3
		addx.l	d2,d2
		addx.l	d1,d1
		addx.l	d0,d0
		movem.l	d0-d7,-224(a0)

		movem.l	-256(a0),d0-d7
		addx.l	d7,d7
		addx.l	d6,d6
		addx.l	d5,d5
		addx.l	d4,d4
		bne.s	.not_empty5
		addi.w	#1,variables+scrolly_on(a5)
.not_empty5
		add.l	d3,d3
		addx.l	d2,d2
		addx.l	d1,d1
		addx.l	d0,d0
		movem.l	d0-d7,-256(a0)

		movem.l	-288(a0),d0-d7
		addx.l	d7,d7
		addx.l	d6,d6
		addx.l	d5,d5
		addx.l	d4,d4
		addx.l	d3,d3
		addx.l	d2,d2
		addx.l	d1,d1
		addx.l	d0,d0
		bne.s	.not_empty6
		addi.w	#1,variables+scrolly_on(a5)
.not_empty6
		movem.l	d0-d7,-288(a0)

		move.l	#scrolly+(scrolly_plane_width/8)*7,a0
		add.l	a4,a0

		movem.l	-32(a0),d0-d7
		add.l	d7,d7
		addx.l	d6,d6
		addx.l	d5,d5
		addx.l	d4,d4
		addx.l	d3,d3
		addx.l	d2,d2
		addx.l	d1,d1
		addx.l	d0,d0
		movem.l	d0-d7,-32(a0)

		movem.l	-64(a0),d0-d7
		addx.l	d7,d7
		addx.l	d6,d6
		addx.l	d5,d5
		addx.l	d4,d4
		bne.s	.not_empty8
		addi.w	#1,variables+scrolly_on(a5)
.not_empty8
		add.l	d3,d3
		addx.l	d2,d2
		addx.l	d1,d1
		addx.l	d0,d0
		movem.l	d0-d7,-64(a0)

		movem.l	-96(a0),d0-d7
		addx.l	d7,d7
		addx.l	d6,d6
		addx.l	d5,d5
		addx.l	d4,d4
		addx.l	d3,d3
		addx.l	d2,d2
		addx.l	d1,d1
		addx.l	d0,d0
		bne.s	.not_empty9
		addi.w	#1,variables+scrolly_on(a5)
.not_empty9
		movem.l	d0-d7,-96(a0)

		movem.l	-128(a0),d0-d7
		add.l	d7,d7
		addx.l	d6,d6
		addx.l	d5,d5
		addx.l	d4,d4
		addx.l	d3,d3
		addx.l	d2,d2
		addx.l	d1,d1
		addx.l	d0,d0
		movem.l	d0-d7,-128(a0)

		movem.l	-160(a0),d0-d7
		addx.l	d7,d7
		addx.l	d6,d6
		addx.l	d5,d5
		addx.l	d4,d4
		bne.s	.not_empty10
		addi.w	#1,variables+scrolly_on(a5)
.not_empty10
		add.l	d3,d3
		addx.l	d2,d2
		addx.l	d1,d1
		addx.l	d0,d0
		movem.l	d0-d7,-160(a0)

		movem.l	-192(a0),d0-d7
		addx.l	d7,d7
		addx.l	d6,d6
		addx.l	d5,d5
		addx.l	d4,d4
		addx.l	d3,d3
		addx.l	d2,d2
		addx.l	d1,d1
		addx.l	d0,d0
		bne.s	.not_empty11
		addi.w	#1,variables+scrolly_on(a5)
.not_empty11
		movem.l	d0-d7,-192(a0)

		movem.l	-224(a0),d0-d7
		add.l	d7,d7
		addx.l	d6,d6
		addx.l	d5,d5
		addx.l	d4,d4
		addx.l	d3,d3
		addx.l	d2,d2
		addx.l	d1,d1
		addx.l	d0,d0
		movem.l	d0-d7,-224(a0)

		movem.l	-256(a0),d0-d7
		addx.l	d7,d7
		addx.l	d6,d6
		addx.l	d5,d5
		addx.l	d4,d4
		bne.s	.not_empty12
		addi.w	#1,variables+scrolly_on(a5)
.not_empty12
		add.l	d3,d3
		addx.l	d2,d2
		addx.l	d1,d1
		addx.l	d0,d0
		movem.l	d0-d7,-256(a0)

		movem.l	-288(a0),d0-d7
		addx.l	d7,d7
		addx.l	d6,d6
		addx.l	d5,d5
		addx.l	d4,d4
		addx.l	d3,d3
		addx.l	d2,d2
		addx.l	d1,d1
		addx.l	d0,d0
		bne.s	.not_empty13
		addi.w	#1,variables+scrolly_on(a5)
.not_empty13
		movem.l	d0-d7,-288(a0)

.skip_scroll
		bsr	.reorganise_players

		move.l	variables+scroll_head(a5),a3
		cmp.l	#0,a3
		beq	.no_mesg

		clr.w	variables+scrolly_on(a5)

		move.w	variables+scroll_ch_width(a5),d0
		bne	.end

		move.l	#miscgfx+game_font,a1
		add.l	a4,a1
		move.l	(a1),a1
		add.l	#miscgfx,a1
		add.l   a4,a1
		move.l	(a1),a2

		move.l	variables+scroll_prt(a5),a4
		move.b	(a4)+,d0
		bne.s	.do_char

		tst.l	variables+scroll_ret_name(a5)
		beq.s	.not_printing_name
		move.l	variables+scroll_ret_name(a5),a4
		clr.l	variables+scroll_ret_name(a5)
		move.b	#1,variables+scroll_colr(a5)
		move.b	(a4)+,d0
		bra.s	.do_char
.not_printing_name

		move.l	scroll_node_succ(a3),d0
		bne.s	.not_end
		clr.l	variables+scroll_head(a5)
		clr.l	variables+scroll_tail(a5)
		bra	.no_mesg
.not_end	move.l	d0,variables+scroll_head(a5)
		add.l	#scroll_node_text,d0
		move.l	d0,variables+scroll_prt(a5)
                bra	.no_mesg
.do_char	move.l	a4,variables+scroll_prt(a5)
		clr.l	scroll_node_prec(a3)

		cmpi.b	#27,d0
		bne	.not_esc
		move.b	(a4)+,d0
		cmpi.b	#"p",d0
		beq.s	.direct_player
		cmpi.b	#"5",d0
		beq.s	.random_player
		subi.w	#"1",d0
		lsl.w	#2,d0
		move.l	a4,variables+scroll_ret_name(a5)
		move.b	#2,variables+scroll_colr(a5)
		lea	variables+scroll_pl1(a5),a4
		move.l	0(a4,d0.w),a4
		move.b	(a4)+,d0
		bra.s	.do_char
.direct_player
		move.b	(a4)+,d0
		subi.w	#"1",d0
		lsl.w	#2,d0
		move.l	a4,variables+scroll_ret_name(a5)
		move.b	#2,variables+scroll_colr(a5)
		lea	variables+scrolld_pl1(a5),a4
		move.l	0(a4,d0.w),a4
		move.b	(a4)+,d0
		bra.s	.do_char
.random_player
		move.w	variables+random_num(a5),d0
	IFD	demo
		tst.w	global_vars+attract_mode(a5)
		bne.s	.skip_rand
	ENDC
		move.w	vhposr(a6),d1
		eor.w	d1,d0
.skip_rand
		mulu	#47,d0
		move.w	d0,variables+random_num(a5)
		andi.w	#$ff,d0
		move.w	variables+players_alive(a5),d1
		mulu	d1,d0
		lsr.w	#$6,d0
		andi.w	#%1100,d0
		move.l	a4,variables+scroll_ret_name(a5)
		move.b	#2,variables+scroll_colr(a5)
		lea	variables+scroll_pl1(a5),a4
		tst.l	0(a4,d0.w)
		bne.s	.ok2
		move.l	(a4),a4
		bra.s	.cont
.ok2		move.l	0(a4,d0.w),a4
.cont		move.b	(a4)+,d0
		bra	.do_char
.not_esc
		cmpi.b	#COL3,d0
		bhi.s	.not_colr
		move.b	d0,variables+scroll_colr(a5)
		bra	.no_mesg
.not_colr
		andi.w	#$ff,d0
		cmpi.b	#129,d0
		blt.s	.not_foreign
		cmpi.b	#225,d0
		bgt.s	.not_foreign
		sub.w	#129,d0
		move.l	a0,-(sp)
		lea	foreign,a0
		move.b	0(a0,d0.w),d0
		move.l	(sp)+,a0
.not_foreign

		subi.b	#32,d0
		move.b	text_widths(a1,d0.w),variables+scroll_ch_width+1(a5)
		andi.w	#$ff,d0
		mulu.w	#12,d0
		add.w	d0,a2

		btst.b	#0,variables+scroll_colr(a5)
		beq.s	.not_plane0

		move.w	(a2)+,-242(a0)
		move.w	(a2)+,-194(a0)
		move.w	(a2)+,-146(a0)
		move.w	(a2)+,-98(a0)
		move.w	(a2)+,-50(a0)
		move.w	(a2)+,-2(a0)
		sub.w	#12,a2
.not_plane0
		btst.b	#1,variables+scroll_colr(a5)
		beq.s	.not_plane1

		add.w	#scrolly_plane_size,a0
		move.w	(a2)+,-242(a0)
		move.w	(a2)+,-194(a0)
		move.w	(a2)+,-146(a0)
		move.w	(a2)+,-98(a0)
		move.w	(a2)+,-50(a0)
		move.w	(a2)+,-2(a0)
.not_plane1

.end		subi.w	#1,variables+scroll_ch_width(a5)
.no_mesg
                move.w	flash_count,d0
		subi.w	#1,d0
		bpl.s	.not_neg
		move.w	#50,d0
.not_neg	move.w	d0,flash_count
		bsr	flash_leader
		move.l	(sp)+,a4
		rts

.reorganise_players
		clr.w	variables+players_alive(a5)
		lea	variables+scroll_pl4+4(a5),a1
		clr.l	-(a1)
		clr.l	-(a1)
		clr.l	-(a1)
		clr.l	-(a1)
		tst.b	global_vars+player1_stats+dead_flag(a5)
		bne.s	.dead1
		cmpi.w	#7,variables+player1+window_type(a5)
		beq.s	.dead1
		move.l	variables+player1+mem_position(a5),a2
		btst.b	#water_here_bit_num,3(a2)
		bne.s	.dead1
		addi.w	#1,variables+players_alive(a5)
		cmpi.w	#4,variables+player1+window_type(a5)
		beq.s	.dead1
		lea	global_vars+player1_stats+player_name(a5),a2
		move.l	a2,(a1)+
.dead1		tst.b	global_vars+player2_stats+dead_flag(a5)
		bne.s	.dead2
		cmpi.w	#7,variables+player2+window_type(a5)
		beq.s	.dead2
		move.l	variables+player2+mem_position(a5),a2
		btst.b	#water_here_bit_num,3(a2)
		bne.s	.dead2
		addi.w	#1,variables+players_alive(a5)
		cmpi.w	#4,variables+player2+window_type(a5)
		beq.s	.dead2
		lea	global_vars+player2_stats+player_name(a5),a2
		move.l	a2,(a1)+
.dead2		tst.b	global_vars+player3_stats+dead_flag(a5)
		bne.s	.dead3
		cmpi.w	#7,variables+player3+window_type(a5)
		beq.s	.dead3
		move.l	variables+player3+mem_position(a5),a2
		btst.b	#water_here_bit_num,3(a2)
		bne.s	.dead3
		addi.w	#1,variables+players_alive(a5)
		cmpi.w	#4,variables+player3+window_type(a5)
		beq.s	.dead3
		lea	global_vars+player3_stats+player_name(a5),a2
		move.l	a2,(a1)+
.dead3		tst.b	global_vars+player4_stats+dead_flag(a5)
		bne.s	.dead4
		tst.b	variables+player4+control_method(a5)
		beq	.dead4
		cmpi.w	#7,variables+player4+window_type(a5)
		beq.s	.dead4
		move.l	variables+player4+mem_position(a5),a2
		btst.b	#water_here_bit_num,3(a2)
		bne.s	.dead4
		addi.w	#1,variables+players_alive(a5)
		cmpi.w	#4,variables+player4+window_type(a5)
		beq.s	.dead4
		lea	global_vars+player4_stats+player_name(a5),a2
		move.l	a2,(a1)+
.dead4
		rts


flash_leader
		move.l	#copperlist,a4
		add.l	chip_mem_base,a4
.not_neg	cmpi.w	#25,flash_count
		bgt.s	.red
		move.w	#$822,scrolly_bplpt1+9*4+2(a4)
		move.w	#$d70,col_wait1+3*4+2(a4)
		move.w	#$d70,col_wait3+3*4+2(a4)
		move.w	#$d70,col_waits+11*4+2(a4)
		move.w	#$d70,col_waits+13*4+2(a4)
		move.w	#$d70,col_waits+SET_SKY_SIZE+4+11*4+2(a4)
		move.w	#$d70,col_waits+SET_SKY_SIZE+4+13*4+2(a4)
		move.w	#$d70,col_waits+SET_SKY_SIZE*2+8+11*4+2(a4)
		move.w	#$d70,col_waits+SET_SKY_SIZE*2+8+13*4+2(a4)
		move.w	#$d70,col_waits+SET_SKY_SIZE*3+12+11*4+2(a4)
		move.w	#$d70,col_waits+SET_SKY_SIZE*3+12+13*4+2(a4)
		move.w	#$d70,col_waits2+11*4+2(a4)
		move.w	#$d70,col_waits2+13*4+2(a4)
		move.w	#$d70,col_waits2+SET_SKY_SIZE+4+11*4+2(a4)
		move.w	#$d70,col_waits2+SET_SKY_SIZE+4+13*4+2(a4)
		move.w	#$d70,col_waits2+SET_SKY_SIZE*2+8+11*4+2(a4)
		move.w	#$d70,col_waits2+SET_SKY_SIZE*2+8+13*4+2(a4)
		move.w	#$d70,col_waits2+SET_SKY_SIZE*3+12+11*4+2(a4)
		move.w	#$d70,col_waits2+SET_SKY_SIZE*3+12+13*4+2(a4)
		bra.s	.ok
.red		move.w	#$f44,scrolly_bplpt1+9*4+2(a4)
		move.w	#$fa4,col_wait1+3*4+2(a4)
		move.w	#$fa4,col_wait3+3*4+2(a4)
		move.w	#$fa4,col_waits+11*4+2(a4)
		move.w	#$fa4,col_waits+13*4+2(a4)
		move.w	#$fa4,col_waits+SET_SKY_SIZE+4+11*4+2(a4)
		move.w	#$fa4,col_waits+SET_SKY_SIZE+4+13*4+2(a4)
		move.w	#$fa4,col_waits+SET_SKY_SIZE*2+8+11*4+2(a4)
		move.w	#$fa4,col_waits+SET_SKY_SIZE*2+8+13*4+2(a4)
		move.w	#$fa4,col_waits+SET_SKY_SIZE*3+12+11*4+2(a4)
		move.w	#$fa4,col_waits+SET_SKY_SIZE*3+12+13*4+2(a4)
		move.w	#$fa4,col_waits2+11*4+2(a4)
		move.w	#$fa4,col_waits2+13*4+2(a4)
		move.w	#$fa4,col_waits2+SET_SKY_SIZE+4+11*4+2(a4)
		move.w	#$fa4,col_waits2+SET_SKY_SIZE+4+13*4+2(a4)
		move.w	#$fa4,col_waits2+SET_SKY_SIZE*2+8+11*4+2(a4)
		move.w	#$fa4,col_waits2+SET_SKY_SIZE*2+8+13*4+2(a4)
		move.w	#$fa4,col_waits2+SET_SKY_SIZE*3+12+11*4+2(a4)
		move.w	#$fa4,col_waits2+SET_SKY_SIZE*3+12+13*4+2(a4)
.ok		rts

****************************************************************************

SET_SKY		MACRO
		move.w	(a2)+,\1+\2*SKY_4LINE_SIZE+0*SKY_LINE_SIZE+4+8+2(a1)
		move.w	(a2)+,\1+\2*SKY_4LINE_SIZE+0*SKY_LINE_SIZE+4+16+2(a1)
		move.w	(a6)+,\1+\2*SKY_4LINE_SIZE+0*SKY_LINE_SIZE+4+28+2(a1)
		move.w	(a6)+,\1+\2*SKY_4LINE_SIZE+0*SKY_LINE_SIZE+4+36+2(a1)
		move.w	(a3)+,\1+\2*SKY_4LINE_SIZE+0*SKY_LINE_SIZE+4+4+2(a1)
		move.w	(a3)+,\1+\2*SKY_4LINE_SIZE+0*SKY_LINE_SIZE+4+20+2(a1)

		move.w	(a2)+,\1+\2*SKY_4LINE_SIZE+1*SKY_LINE_SIZE+4+8+2(a1)
		move.w	(a2)+,\1+\2*SKY_4LINE_SIZE+1*SKY_LINE_SIZE+4+16+2(a1)
		move.w	(a6)+,\1+\2*SKY_4LINE_SIZE+1*SKY_LINE_SIZE+4+28+2(a1)
		move.w	(a6)+,\1+\2*SKY_4LINE_SIZE+1*SKY_LINE_SIZE+4+36+2(a1)
		move.w	(a3)+,\1+\2*SKY_4LINE_SIZE+1*SKY_LINE_SIZE+4+4+2(a1)
		move.w	(a3)+,\1+\2*SKY_4LINE_SIZE+1*SKY_LINE_SIZE+4+20+2(a1)

		move.w	(a2)+,\1+\2*SKY_4LINE_SIZE+2*SKY_LINE_SIZE+4+8+2(a1)
		move.w	(a2)+,\1+\2*SKY_4LINE_SIZE+2*SKY_LINE_SIZE+4+16+2(a1)
		move.w	(a6)+,\1+\2*SKY_4LINE_SIZE+2*SKY_LINE_SIZE+4+28+2(a1)
		move.w	(a6)+,\1+\2*SKY_4LINE_SIZE+2*SKY_LINE_SIZE+4+36+2(a1)
		move.w	(a3)+,\1+\2*SKY_4LINE_SIZE+2*SKY_LINE_SIZE+4+4+2(a1)
		move.w	(a3)+,\1+\2*SKY_4LINE_SIZE+2*SKY_LINE_SIZE+4+20+2(a1)

		move.w	(a2)+,\1+\2*SKY_4LINE_SIZE+3*SKY_LINE_SIZE+4+8+2(a1)
		move.w	(a2)+,\1+\2*SKY_4LINE_SIZE+3*SKY_LINE_SIZE+4+16+2(a1)
		move.w	(a6)+,\1+\2*SKY_4LINE_SIZE+3*SKY_LINE_SIZE+4+28+2(a1)
		move.w	(a6)+,\1+\2*SKY_4LINE_SIZE+3*SKY_LINE_SIZE+4+36+2(a1)
		move.w	(a3)+,\1+\2*SKY_4LINE_SIZE+3*SKY_LINE_SIZE+4+4+2(a1)
		move.w	(a3)+,\1+\2*SKY_4LINE_SIZE+3*SKY_LINE_SIZE+4+20+2(a1)
		ENDM

update_sky
		movem.l	a4/a6,-(sp)

		move.l	#copperlist,a4
		add.l	chip_mem_base,a4

		move.w	variables+lightning(a5),d0
		cmp.w	variables+old_lightning(a5),d0
		beq.s	.not_diff
		move.w	#-1,variables+player1+old_sky_flag(a5)
		move.w	#-1,variables+player2+old_sky_flag(a5)
		move.w	#-1,variables+player3+old_sky_flag(a5)
		move.w	#-1,variables+player4+old_sky_flag(a5)
		move.w	d0,variables+old_lightning(a5)
.not_diff
		lea	nosky,a2
		lea	nosky_planet,a3
		lea	scotch_mist,a6
		moveq.l	#0,d0
		move.b	locn+locn_sky(a5),d0
		mulu	#44*4,d0
		add.w	d0,a6
		tst.w	variables+lightning(a5)
		beq.s	.no_l
		addi.w	#44*4*5,d0
		subi.w	#1,variables+lightning(a5)
.no_l		add.w	d0,a2
		add.w	d0,a3

		lea	variables+player1(a5),a0
		lea	col_waits+8(a4),a1
		bsr	.do_sky
		lea	variables+player3(a5),a0
		lea	col_waits2+8(a4),a1
		bsr	.do_sky

		bsr	flash_leader

		movem.l	(sp)+,a4/a6
		rts

.do_sky		movem.l	a2-a3/a6,-(sp)

		move.w	old_sky_flag(a0),d0
		bmi.s	.force1
		cmp.w	sky_flag(a0),d0
		beq	.end
.force1		move.w	sky_flag(a0),old_sky_flag(a0)

		tst.w	sky_flag(a0)
		bne	.cont
;		lea	nosky,a2
;		lea	nosky_planet,a3
;		lea	scotch_mist,a6
.cont
		SET_SKY	4,0
		SET_SKY	8,1
		SET_SKY	8,2
		SET_SKY	8,3
		SET_SKY	8,4
		SET_SKY	8,5
		SET_SKY	8,6
		SET_SKY	8,7
		SET_SKY	8,8
		SET_SKY	8,9
		SET_SKY	8,10

.end		movem.l	(sp)+,a2-a3/a6
		rts

		include	sky.s

********************************************************************************
;out d0.l=checksum

        IFD	CHECKSUM

calc_gamegfx_checksum
		movem.l	a0/d1,-(sp)

		move.l	#gamegfx,a0
		add.l	chip_mem_base,a0
		move.l	#(chip_mem_size-gamegfx)/20,d1

		moveq.l	#0,d0
.loop		add.l	(a0)+,d0
		add.l	(a0)+,d0
		add.l	(a0)+,d0
		add.l	(a0)+,d0
		add.l	(a0)+,d0
		subq.l	#1,d1
		bne.s	.loop

		neg.l	d0

		movem.l	(sp)+,a0/d1
		rts

calc_miscgfx_checksum
		movem.l	a0/d1,-(sp)

		move.l	#miscgfx,a0
		add.l	chip_mem_base,a0
		move.l	#(backsfx_buf-miscgfx)/4,d1

		moveq.l	#0,d0
.loop		add.l	(a0)+,d0
		subq.l	#1,d1
		bne.s	.loop

		neg.l	d0

		movem.l	(sp)+,a0/d1
		rts

check_gamegfx_checksum
		bsr	calc_gamegfx_checksum
		cmp.l	variables+gamegfx_checksum(a5),d0
		beq.s	.ok
.loop		move.w	d1,color00+$dff000
		bra.s	.loop
.ok		rts

check_miscgfx_checksum
		bsr	calc_miscgfx_checksum
		cmp.l	variables+miscgfx_checksum(a5),d0
		beq.s	.ok
.loop		move.w	d1,color00+$dff000
		bra.s	.loop
.ok		rts

	ENDC

TEST_CHECKSUM	MACRO
		move.l	d1,-(sp)
;		move.w	\1,d1
;		jsr	check_gamegfx_checksum
		move.w	\1,d1
		jsr	check_miscgfx_checksum
		move.l	(sp)+,d1
		ENDM

****************************************************************************
************************** End of System Takeover **************************
****************************************************************************
