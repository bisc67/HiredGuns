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

FLAG		macro
\1		equ	0
		endm

FLAGV		macro
\1		equ     \2
		endm

********************************************************************************

;		FLAG	download		;download enabled
;		FLAG	rolling_demo
;		FLAG	demo			;make a demonstration version
;		FLAG	editor			;load styles/atmos from map editor
						; (set demo as well!!!)

		FLAG	CD32

;		FLAG	se			;special edition
;		FLAG	SKIPCHECK		;no password
		FLAG	savegame		;save/load game enabled
;		FLAG	CHEAT			;cheat mode
		FLAG	DOUBLE_BUFFER
		FLAG	MINIMAL_REDRAW
;		FLAG	CHECKSUM
;		FLAG	BLITQ			;enable blit queuing

	IFD	download
		opt 	o+,ow-,d+
	ELSEIF
		opt 	o+,ow-
	ENDC

	IFD	CD32
		FLAG	SKIPCHECK
		opt	p=68020
	ENDC

VERSION				equ	"3926"
COMPATIBLE_VERSION		equ	"3925"

********************************************************************************
********************************** Include Files *******************************
********************************************************************************

		section	HiredGuns,CODE

begining
		jmp	START

		incdir	include:

		include	exec/libraries.i
		include	dos/dos_lib.i
		include	exec/exec_lib.i
		include	graphics/graphics_lib.i

		include	exec/types.i
		include	dos/dosextens.i
		include	graphics/gfxbase.i
		include	libraries/lowlevel.i

		incdir	source:hiredguns/sources

		include	Hardware.i
		include	Macros.i
		include	Equates.i
		include	MiscRoutines.s
		include	ColdStartup.s
		include	/takeover/library.s
		include	Drawviews.s
		include	Front.s
		include	ChSelect.s
		include	WorldMap.s
		include	Static.s
		include	DeathSequence.s
		include	EndSequence.s
		include	Intro.s
		include	MonsterMovement.s
		include	MEDmodplayer.s
		include	Controls&Movement.s
		include	Tables.s
		include	DosIO.s

	IFD	download
		include	CheckHost.s
	ENDC
	IFD	CHEAT
		include	Cheat.s
	ENDC

********************************************************************************
********************************** Main Program ********************************
********************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:       none
main_program
		jsr	killaud

		CLR_MEM_RANGE variables(a5),global_end(a5)
		move.w	#MODE_NONE,variables+mode(a5)
		move.w	#1,variables+file_mode(a5)

		move.w	vhposr(a6),variables+random_num(a5)

		cmpi.l	#1,d1
		bne.s	.not_action_game
		move.w	#1,global_vars+action_flag(a5)
.not_action_game
                cmpi.l	#2,d1
		blt.s	.not_attract_mode_on
		subq.w	#1,d1
		move.w	d1,global_vars+attract_mode(a5)
.not_attract_mode_on

		move.w	#%0000000110100000,dmacon(a6)	;dma off

		BLACK_COLOURS
		jsr	disable_sprites
		jsr	take_system
	IFD	BLITQ
		jsr	set_up_blitq
        ENDC
		move.l	#lc_chipzero,a0
		add.l	chip_mem_base,a0
		clr.l	(a0)

		jsr	_InitPlayer		;install med module player

		sf.b	noexit
		move.w	#2,global_vars+max_num_players(a5)
		move.w	#ACTV_MOUSE1M,global_vars+default_cntrl(a5)
		tst.l	os_kill
		bne.s	.default_mouse
		move.l	vars_block,a0
		tst.b	default_control(a0)
		beq.s	.default_mouse
		st.b	noexit
		move.w	#ACTV_PAD1M,global_vars+default_cntrl(a5)
.default_mouse
		clr.w	global_vars+enabled_controls(a5)
		or.w	#ACTV_PAD1M|ACTV_PAD2M,global_vars+enabled_controls(a5)
		or.w	#ACTV_JOY1M|ACTV_JOY2M,global_vars+enabled_controls(a5)
		or.w	#ACTV_MOUSE1M|ACTV_MOUSE2M,global_vars+enabled_controls(a5)

		tst.l	os_kill
		bne.s	.keyboard
		move.l	vars_block,a0
		move.w	installed_flags(a0),d0
		btst.l	#FLAGB_KEYBOARD,d0
		beq.s	.no_keyboard
.keyboard	move.w	#4,global_vars+max_num_players(a5)
		or.w	#ACTV_KEYS1M|ACTV_KEYS2M|ACTV_KEYS3M|ACTV_KEYS4M,global_vars+enabled_controls(a5)
.no_keyboard
		tst.l	os_kill
		bne.s	.parallel
		move.l	vars_block,a0
		move.w	installed_flags(a0),d0
		btst.l	#FLAGB_PARALLEL,d0
		beq.s	.no_parallel
.parallel	move.w	#4,global_vars+max_num_players(a5)
		or.w	#ACTV_JOY3M|ACTV_JOY4M,global_vars+enabled_controls(a5)
.no_parallel

	IFD	download
		bra	.do_game
	ENDC
	IFND	editor
		bsr	load_and_decrunch_mesg_data
		jsr     show_intro
        ELSEIF
		move.l  #lc_disk_buffer,a2
		add.l	a4,a2
		PRELOG_DISK #1,a2,#1
;		jsr	load_ex_sfx
;		jsr	decrunch_ex_sfx
	ENDC
		clr.w	variables+restart_flag(a5)
.start		clr.w	global_vars+game_count(a5)
		move.w	global_vars+default_cntrl(a5),global_vars+active_controls(a5)
		CLR_MEM_RANGE global_vars+completed(a5),global_vars+completed_end(a5)
		jsr	do_front

		cmpi.w	#RESTART_LOAD,variables+restart_flag(a5)
		beq	.game
		cmpi.w	#RESTART_EXIT,variables+restart_flag(a5)
		beq	.quit

		jsr     select_characters

		cmpi.w	#RESTART_QUIT,variables+restart_flag(a5)
		beq	.start
		cmpi.w	#RESTART_EXIT,variables+restart_flag(a5)
		beq	.quit

.main_loop	jsr	do_worldmap

		cmpi.w	#RESTART_QUIT,variables+restart_flag(a5)
		beq	.start
		cmpi.w	#RESTART_EXIT,variables+restart_flag(a5)
		beq	.quit

		jsr	show_static
		clr.w	ram_disk_used

.game		jsr	.do_game

		cmpi.w	#RESTART_RETRY,variables+restart_flag(a5)
		beq.s	.game
		clr.w	ram_disk_used
		cmpi.w	#RESTART_QUIT,variables+restart_flag(a5)
		beq	.start
		cmpi.w	#RESTART_EXIT,variables+restart_flag(a5)
		beq	.quit
		cmpi.w	#RESTART_MAP,variables+restart_flag(a5)
		beq	.main_loop
		cmpi.w	#RESTART_ABORT,variables+restart_flag(a5)
		beq	.main_loop
		cmpi.w	#RESTART_END,variables+restart_flag(a5)
		beq	.end

	IFND	se
		jsr	do_death_sequence
	ENDC
;		jsr	do_end_sequence
		bra	.start

.quit		rts

.end		jsr	do_end_sequence
		bra	.start

********************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:       none

.do_game
		jsr	load_and_decrunch_game_data

		move.w	variables+curr_disk(a5),global_vars+ret_disk(a5)

		cmpi.w	#RESTART_QUIT,variables+restart_flag(a5)
		beq	.exit_game
		cmpi.w	#RESTART_LOAD,variables+restart_flag(a5)
		beq	.game_quick

		addi.b	#1,global_vars+map_count(a5)
		jsr	initialise_variables

		jsr	reset_monsters
		jsr	update_player_positions

		move.w	#19*23,d0
.loop		move.w	d0,-(sp)
		jsr	do_hatch
		jsr	force_move_water
		move.w	(sp)+,d0
		dbf	d0,.loop

		jsr	set_up_game_screen
		jsr	game_screen_on

	IFD	demo
		tst.w	global_vars+attract_mode(a5)
		beq.s	.not_playing
		CLR_MEM_RANGE	timers,timers_end
.not_playing
	ENDC

	IFD	download
		move.w	#6,global_vars+worldmap_back_sfx(a5)
		move.b	#1,global_vars+curr_locn+locn_sky(a5)
	ENDC

		move.b	#COL1,variables+scroll_colr(a5)
		tst.b   lang
		bne.s	.for
		move.l	#map,a0
		add.l	#name,a0
		add.l   a5,a0
		jsr	push_msg
.for

********************************************************************************

.game_quick	clr.w	variables+restart_flag(a5)
.game_loop	clr.w	frame_count

		bsr	update_background_sfx
		bsr	drowning
		jsr	hatch_eggs
		bsr	move_water
		bsr	stuff_falls
		bsr	move_lifts
		bsr	move_doors
		bsr	move_fireballs
		jsr     move_monsters
		jsr	scan_controls
		jsr	swap_players
		jsr	follow_leader
		bsr	check_players_controls
		bsr	push_messages
		jsr	draw_views
		bsr	draw_fitness_bars
		bsr	update_fx
		bsr	check_exit

	IFD	CHEAT
		bsr	display_info
		bsr	check_cheat_controls
	ENDC

		tst.w	variables+restart_flag(a5)
		beq	.game_loop

.exit_game	move.w	#MODE_NONE,variables+mode(a5)

		cmpi.w	#RESTART_EXIT,variables+restart_flag(a5)
		beq.s	.exit
		tst.l	os_kill
		beq.s	.exit
		move.w	#1,variables+file_mode(a5)
		move.w	global_vars+ret_disk(a5),d0
		move.w	#-1,variables+curr_disk(a5)
		jsr	get_disk
.exit
	IFND	CD32
		cmpi.w	#RESTART_RETRY,variables+restart_flag(a5)
		beq.s	.retry
		move.l	#copperlist,a0
		add.l	a4,a0
		move.l	drawing_buffer,a3
		jsr	fade_copper_to_black
	ENDC
.retry
		jsr	kill_screen

		jsr	_InitPlayer		;install med module player

		jsr	killaud

		bsr	load_and_decrunch_abort

		rts

********************************************************************************

stuff_falls
		cmp.w	#6,fall_count		;time to move pushables?
		bls	.end			;no, then branch
		subi.w	#6,fall_count		;reset timer

		bsr	blocks_fall
		bsr	players_fall
		jsr	monsters_fall
		jsr	sentries_fall

.end		rts

********************************************************************************
	IFD	demo

flash_logo
		cmpi.w	#2,global_vars+attract_mode(a5)
		bne.s	not_yet

		move.w	logo_count,d0
		cmp.w	#100,d0
		blt.s	not_yet
		clr.w	logo_count
flash_logo2
		move.l	#miscgfx+logo_bob,a1
		add.l	a4,a1
		move.l	(a1),a1
		add.l	#miscgfx,a1
		add.l	a4,a1
		move.l	#logo2,a0
		add.l	a5,a0

		move.w	#(600/4)-1,d0

.loop		move.l	(a0),d1
		move.l	(a1),(a0)+
		move.l	d1,(a1)+
		dbf	d0,.loop

		move.l	#copperlist,a0
		add.l	a4,a0

		not.w	logo_bplpt1-4*7+2(a0)
		not.w	logo_bplpt1+4*3+2(a0)
		not.w	logo_bplpt1+4*5+2(a0)
		not.w	logo_bplpt1+4*7+2(a0)
		not.w	logo_bplpt1+4*11+2(a0)
		not.w	logo_bplpt1+4*16+2(a0)
		not.w	logo_bplpt1+4*18+2(a0)

		not.w	global_vars+which_logo(a5)

not_yet		rts
	ENDC

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:        d0=flag everbody by exit (long)
;CHANGES:       none
check_exit
		moveq.l	#0,d0
		moveq.l	#0,d1

		lea	variables+player1(a5),a0
		lea	global_vars+player1_stats(a5),a1
		bsr	.test_exit

		lea	variables+player2(a5),a0
		lea	global_vars+player2_stats(a5),a1
		bsr	.test_exit

		lea	variables+player3(a5),a0
		lea	global_vars+player3_stats(a5),a1
		bsr	.test_exit

		lea	variables+player4(a5),a0
		lea	global_vars+player4_stats(a5),a1
		bsr	.test_exit

		cmpi.w	#4,d1
		bne.s	.not_dead
	IFD	demo
		tst.w	global_vars+attract_mode(a5)
		bne	.retry
		tst.w	global_vars+playtime(a5)
		bne	.retry
	ENDC
		jsr	do_death
		rts

.retry		move.w	#RESTART_RETRY,variables+restart_flag(a5)
		rts

;-------------------------------------------------------------------------------

.not_dead	tst.w	global_vars+action_flag(a5)
		beq.s	.not_action

		tst.w   global_vars+at_trip1(a5)
		bne.s	.not_time_up
		tst.w   global_vars+at_trip2(a5)
		bne.s	.not_time_up
	IFD	demo
		tst.w	global_vars+attract_mode(a5)
		bne	.retry
		tst.w	global_vars+playtime(a5)
		bne	.retry
	ENDC
		jsr	do_timeup
		rts
.not_time_up
		move.l	#locn,a1
		add.l	a5,a1
		cmp.b	#1,locn_players(a1)
		beq.s	.1pl
		cmp.w	d0,d1
		blt.s	.actioncomplete
		bra.s	.not_exit
.1pl
		cmpi.w	#4,d0
		bne.s	.not_exit
		cmpi.b	#3,global_vars+num_players(a5)
		bne.s	.not_3pl
		cmpi.w	#1,d1
		bgt.s	.action_failed
		bra.s	.actioncomplete
.not_3pl	cmpi.w	#0,d1
		bgt.s	.action_failed
.actioncomplete

	IFD	demo
		tst.w	global_vars+attract_mode(a5)
		bne	.retry
		tst.w	global_vars+playtime(a5)
		bne	.retry
	ENDC
		jsr	do_actioncomplete
		rts

.action_failed
		jsr	do_actionfailed
		rts

;-------------------------------------------------------------------------------

.not_action	cmpi.w	#4,d0
		bne.s	.not_exit
	IFD	demo
		tst.w	global_vars+attract_mode(a5)
		bne	.retry
	ENDC
		jsr	do_campaigncomplete
		rts

.not_exit	rts


.test_exit	tst.w	dead_flag2(a0)
		bne	.dead
		tst.b	control_method(a0)
		beq	.dead
		cmpi.w	#7,window_type(a0)
		beq.s	.inside
		rts

.inside		addq.w	#1,d0
		tst.l	variables+winner_var(a5)
		bne.s	.not_winner
		move.l	a0,variables+winner_var(a5)
		move.l	a1,variables+winner_glo(a5)
		INCR_EXP #EXP_EXIT,experience(a1)
.not_winner
		rts

.dead		addq.w	#1,d1
		addq.w	#1,d0
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:       none
push_messages
		tst.b   lang
		bne	.end

		move.l	#map+map_data1,d4
		add.l	a5,d4
		move.l	variables+player1+mem_position(a5),d0
		sub.l	d4,d0
		move.l	variables+player2+mem_position(a5),d1
		sub.l	d4,d1
		move.l	variables+player3+mem_position(a5),d2
		sub.l	d4,d2
		move.l	variables+player4+mem_position(a5),d3
		sub.l	d4,d3

		lea	map+text_triggers(a5),a2
		lea	map+text_mesgs(a5),a1

.loop		tst.l	trigger_posn(a2)
		beq.s	.end

		cmp.l	trigger_posn(a2),d0
		bne.s	.not1
		move.b	#"1",d4
		bsr	.push_message
.not1
		cmp.l	trigger_posn(a2),d1
		bne.s	.not2
		move.b	#"2",d4
		bsr	.push_message
.not2
		cmp.l	trigger_posn(a2),d2
		bne.s	.not3
		move.b	#"3",d4
		bsr	.push_message
.not3
		cmp.l	trigger_posn(a2),d3
		bne.s	.not4
		move.b	#"4",d4
		bsr	.push_message
.not4
		add.w	#trigger_size,a2
		bra.s	.loop
.end		rts

.push_message
		movem.l	a1-a2/d0-d3,-(sp)
		move.w	trigger_offset(a2),d0
		lea	0(a1,d0.w),a0

		cmp.b	#"4",scroll_node_text+4(a0)
		bgt.s	.ok
		cmp.b	scroll_node_text+4(a0),d4
		bne.s	.no_mesg
.ok
		cmp.b	#"6",scroll_node_text+4(a0)
		bne.s	.no
		move.b	d4,scroll_node_text+4(a0)
.no
		move.l	#-1,trigger_posn(a2)
		jsr	push_msg
.no_mesg	movem.l	(sp)+,a1-a2/d0-d3
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:       none

drowning
		cmpi.w	#50,drown_count
		blt.s	.no_drowning
		clr.w	drown_count

		lea	variables+player1(a5),a0
		lea	global_vars+player1_stats(a5),a1
		bsr	drown

		lea	variables+player2(a5),a0
		lea	global_vars+player2_stats(a5),a1
		bsr	drown

		lea	variables+player3(a5),a0
		lea	global_vars+player3_stats(a5),a1
		bsr	drown

		lea	variables+player4(a5),a0
		lea	global_vars+player4_stats(a5),a1
		bsr	drown

.no_drowning	rts

drown		tst.w	dead_flag(a1)
		bne.s	.not_drowning
		cmpi.w	#7,window_type(a0)
		beq.s	.not_drowning
		tst.b	control_method(a0)
		beq	.not_drowning

		move.l	mem_position(a0),a2
		move.l	(a2),d0
		btst.l	#water_here_bit_num,d0
		beq.s	.breath
		and.l	#keep_water,d0
		move.w	#32-water_shift,d1
		rol.l	d1,d0
		cmpi.w	#2,d0
		blt.s	.breath

		bsr	water_damage_items

		cmpi.b	#1,race(a1)			;mechs dont drown
		beq.s	.breath
		cmpi.w	#97,spell_water(a0)
		beq.s	.breath

		addi.w	#1,underwater_count(a0)
		move.w	underwater_count(a0),d0

		move.w	physique(a1),d1
		mulu.w	fitness(a1),d1
		divu	#65536/100,d1
		ext.l	d1
		divu	#400,d1

		cmp.w	d1,d0
		ble.s	.not_drowning

		move.w	#150,drowning_count(a0)

		mulu	#200,d0
		jsr	damage_fitness

.not_drowning	rts

.breath		clr.w	underwater_count(a0)
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:       none

update_background_sfx
        IFD	BLITQ
		rts
	ENDC
		lea	variables+player1(a5),a0
		lea	global_vars+player1_stats(a5),a1
		bsr	.test_water
		lea	variables+player2(a5),a0
		lea	global_vars+player2_stats(a5),a1
		bsr	.test_water
		lea	variables+player3(a5),a0
		lea	global_vars+player3_stats(a5),a1
		bsr	.test_water
		lea	variables+player4(a5),a0
		lea	global_vars+player4_stats(a5),a1
		bsr	.test_water
		bra.s	.skip

.test_water	tst.w	dead_flag(a1)
		bne.s	.dead
		cmpi.w	#7,window_type(a0)
		beq.s	.dead
		move.l	mem_position(a0),a2
		btst.b	#water_here_bit_num,3(a2)
		beq	.dead
		add.l	#4,sp
		bra	.water
.dead		rts

********************************************************************************

.skip
		move.w	global_vars+worldmap_back_sfx(a5),variables+back_sample(a5)
		addi.w	#1,variables+back_sample(a5)

		move.w	variables+old_back_sample(a5),d0
		cmp.w	variables+back_sample(a5),d0
		beq	.no_change

		tst.w	global_vars+water_in_buf(a5)
		beq.s	.no_water
		bsr	swapit
		move.l	a1,global_vars+backsfx_sample(a5)
.no_water
		move.l	global_vars+backsfx_sample(a5),a1
		move.w	variables+back_sample(a5),variables+old_back_sample(a5)

		moveq.l	#3,d1		;channel

		cmpi.w	#0,global_vars+worldmap_back_sfx(a5)
		bne.s	.not1
		move.w	#360,d3		;period
    		move.w	#63,d2		;volume
		bra	.cont
.not1
		cmpi.w	#1,global_vars+worldmap_back_sfx(a5)
		bne.s	.not2
		move.w	#1100,d3	;period
		move.w	#20,d2		;volume
		bra	.cont
.not2
		cmpi.w	#2,global_vars+worldmap_back_sfx(a5)
		bne.s	.not3
		move.w	#360,d3		;period
		move.w	#63,d2		;volume
		bra.s	.cont
.not3
		cmpi.w	#3,global_vars+worldmap_back_sfx(a5)
		bne.s	.not4
		move.w	#180,d3		;period
		move.w	#63,d2		;volume
.not4
		cmpi.w	#4,global_vars+worldmap_back_sfx(a5)
		bne.s	.not5
		move.w	#325,d3		;period
		move.w	#40,d2		;volume
.not5
		cmpi.w	#5,global_vars+worldmap_back_sfx(a5)
		bne.s	.not6
		move.w	#369,d3		;period
		move.w	#40,d2		;volume
.not6
		cmpi.w	#6,global_vars+worldmap_back_sfx(a5)
		bne.s	.not7
		move.w	#856,d3		;period
		move.w	#30,d2		;volume
.not7
		cmpi.w	#7,global_vars+worldmap_back_sfx(a5)
		bne.s	.not8
		move.w	#713,d3		;period
		move.w	#30,d2		;volume
.not8
.cont		jsr	play_8svx

.no_change	rts

********************************************************************************
.water
		move.w	#284,d3		;period
		move.l	(a2),d0
		and.l	#keep_water,d0
		move.w	#water_shift,d1
		lsr.l	d1,d0
		andi.w	#%11,d0
		lsl.w	#5,d0
		add.w	d0,d3

		move.w	d3,variables+back_sample(a5)

		move.w	variables+old_back_sample(a5),d0
		cmp.w	variables+back_sample(a5),d0
		beq	.no_change

		cmpi.w	#10,variables+old_back_sample(a5)
		bge.s	.already_water
		tst.w	global_vars+water_in_buf(a5)
		bne.s	.already_water
		bsr	swapit

		move.l	a1,global_vars+water_sample(a5)
.already_water
		move.w	variables+back_sample(a5),variables+old_back_sample(a5)

		move.l	global_vars+water_sample(a5),a1
		moveq.l	#3,d1		;channel
		move.w	#63,d2		;volume
		jsr	play_8svx
		rts

********************************************************************************
;INPUT:		none
;OUTPUT:        a1=sample in chip to play
;CHANGES:       none
swapit
		tst.l	exchip_mem_base
		beq.s	.no_ex_sfx
		move.l	#ex_water,a0
		add.l	exchip_mem_base,a0
		bra.s	.skip_no_ex_sfx
.no_ex_sfx
		move.l	#water,a0
		add.l	a5,a0
.skip_no_ex_sfx
		cmp.l	#$200000,a0			;sample in chip ?
		blt.s	.in_chip

		move.l	#backsfx_buf,a1
		add.l	a4,a1

		move.w	#%0000000000001000,dmacon(a6)	;ch 3 off
		move.w	#0,aud3vol(a6)

		move.w	#(20000/40)-1,d0
.loop
	REPT	10
		move.l	(a0),d1
		move.l	(a1),(a0)+
		move.l	d1,(a1)+
	ENDR
		dbf	d0,.loop

		move.l	#backsfx_buf,a1
		add.l	a4,a1

		not.w	global_vars+water_in_buf(a5)

		rts

.in_chip	move.l	a0,a1
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT		a5=base address of fast memory (long)
;		d0=sample number
;		d1=channel
;		d2=volume
;		d3=period
;OUTPUT:	none
;CHANGES:       none

play_ex_sfx
		tst.l	exchip_mem_base
		beq.s	.no_ex_sfx

		move.l	#ex_effects,a1
		add.l	exchip_mem_base,a1
		subq.l	#1,d0
		lsl.w	#2,d0
		add.l	0(a1,d0.w),a1

		jsr	play_8svx
.no_ex_sfx
		rts

play_ex_sfx_rand
		tst.l	exchip_mem_base
		beq.s	.no_ex_sfx

		move.w	d1,-(sp)
		move.b	vhposr+1(a6),d1
		andi.w	#%1111111,d1
		subi.w	#64,d3
		add.w	d1,d3
		move.w	(sp)+,d1

		cmpi.w	#90,d3
		bgt.s	.skip
		move.w	#90,d3
.skip
		move.l	#ex_effects,a1
		add.l	exchip_mem_base,a1
		subq.l	#1,d0
		lsl.w	#2,d0
		add.l	0(a1,d0.w),a1

		jsr	play_8svx
.no_ex_sfx
		rts

play_ex_sfx_rand2
		tst.l	exchip_mem_base
		beq.s	.no_ex_sfx

		move.w	d1,-(sp)
		moveq.l	#0,d1
		move.b	vhposr+1(a6),d1
		lsl.w	#1,d1
		subi.w	#256,d3
		add.w	d1,d3
		move.w	(sp)+,d1

		cmpi.w	#90,d3
		bgt.s	.skip
		move.w	#90,d3
.skip
		move.l	#ex_effects,a1
		add.l	exchip_mem_base,a1
		subq.l	#1,d0
		lsl.w	#2,d0
		add.l	0(a1,d0.w),a1

		jsr	play_8svx
.no_ex_sfx
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:       none
update_fx
		tst.l	exchip_mem_base
		beq	.no_lning

		move.w	variables+random_num(a5),d2
		mulu	#27,d2
		rol.w	#7,d2
		move.w	d2,variables+random_num(a5)

		lea	variables+player1(a5),a0
		tst.w	fire_anim(a0)
		bne	.no_lning
		lea	variables+player2(a5),a0
		tst.w	fire_anim(a0)
		bne	.no_lning
		lea	variables+player3(a5),a0
		tst.w	fire_anim(a0)
		bne	.no_lning
		lea	variables+player4(a5),a0
		tst.w	fire_anim(a0)
		bne	.no_lning

		cmpi.w	#100,d2
		bhi.s	.no_drip
		PLAY_EX_SAMPLE #4,#1,#32,#128
.no_drip
		tst.w	variables+on_a_lift(a5)
		bne.s	.no_lning
		rol.w	#7,d2
		cmpi.w	#100,d2
		bhi.s	.no_lning
		move.w	d2,d3
		andi.w	#$f,d2
		addi.w	#1,d2
		andi.w	#$1f,d3
		addi.w	#30,d3
		PLAY_EX_SAMPLE_RAND2 #16,#2,d3,#450
		move.w	d2,variables+lightning(a5)
.no_lning
		jsr	update_sky

		lea	variables+player1(a5),a1
		bsr	get_sample
		lea	variables+player2(a5),a1
		bsr	get_sample
		lea	variables+player3(a5),a1
		bsr	get_sample
		lea	variables+player4(a5),a1
		bsr	get_sample

		tst.b	variables+fx_sample(a5)
		beq	.no_gun

		moveq.l	#0,d0
		move.b	variables+fx_sample(a5),d0

		tst.l	exchip_mem_base
		beq.s	.no_ex_sfx
		move.l	#ex_moresfx,a1
		add.l	exchip_mem_base,a1
		bra.s	.skip_no_ex_sfx
.no_ex_sfx	move.l	#moresfx,a1
		add.l	a5,a1
.skip_no_ex_sfx
		subq.l	#1,d0
		lsl.w	#2,d0
		add.l	0(a1,d0.w),a1

		cmp.l	#$200000,a1			;sample in chip ?
		bge	not_in_chip

		move.b	variables+fx_sample(a5),variables+old_fx_sample(a5)
		move.w	variables+fx_channel(a5),d1		;channel

		cmpi.b	#1,variables+fx_sample(a5)
		bne.s	.not1
		move.w	variables+fx_period(a5),d3		;period
		move.w	#63,d2		;volume
		bra	.cont
.not1
		cmpi.b	#2,variables+fx_sample(a5)
		bne.s	.not2
		move.w	variables+fx_period(a5),d3		;period
		move.w	#63,d2		;volume
		bra	.cont
.not2
		cmpi.b	#3,variables+fx_sample(a5)
		bne.s	.not3
		move.w	#360,d3		;period
		move.w	#63,d2		;volume
		bra	.cont
.not3
		cmpi.b	#4,variables+fx_sample(a5)
		bne.s	.not4
		move.w	#380,d3		;period
		move.w	#63,d2		;volume
		bra	.cont
.not4
		cmpi.b	#5,variables+fx_sample(a5)
		bne.s	.not5
		move.w	variables+fx_position(a5),d0
		movem.l	a0-a1/d1,-(sp)
		jsr	find_vol_mem
		movem.l	(sp)+,a0-a1/d1
		move.w	variables+fx_period(a5),d3
		moveq.l	#0,d1		;channel
		bra.s	.cont
.not5
		cmpi.b	#7,variables+fx_sample(a5)
		bne.s	.not6
		move.w	variables+fx_position(a5),d0
		movem.l	a0-a1/d1,-(sp)
		jsr	find_vol_mem
		movem.l	(sp)+,a0-a1/d1
		move.w	variables+fx_period(a5),d3
		bra	.cont
.not6
		cmpi.b	#8,variables+fx_sample(a5)
		bne.s	.not8
		move.w	variables+fx_period(a5),d3		;period
		move.w	#63,d2		;volume
		bra	.cont
.not8
		cmpi.b	#9,variables+fx_sample(a5)
		bne.s	.not9
		move.w	variables+fx_period(a5),d3		;period
		move.w	#63,d2		;volume
		bra	.cont
.not9
		cmpi.b	#10,variables+fx_sample(a5)
		bne.s	.not10
		move.w	variables+fx_period(a5),d3		;period
		move.w	#63,d2		;volume
		bra	.cont
.not10
.cont		jsr	play_8svx
		clr.b	variables+fx_sample(a5)

.no_gun		rts


not_in_chip
		moveq.l	#0,d0
		move.b	variables+fx_sample(a5),d0
		cmp.b	variables+old_fx_sample(a5),d0
		beq	.no_change

		move.w	#%0000000000000001,dmacon(a6)	;ch 0 off
		move.w	#0,aud0vol(a6)

		move.l	#gun_sfx,a0
		add.l	a4,a0

		move.w	#(8720/40)-1,d0
.loop		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		move.l	(a1)+,(a0)+
		dbf	d0,.loop

.no_change	move.l	#gun_sfx,a1
		add.l	a4,a1

		move.b	variables+fx_sample(a5),variables+old_fx_sample(a5)
		move.w	#0,d1					;channel

		cmpi.b	#1,variables+fx_sample(a5)
		bne.s	.not1
		move.w	variables+fx_period(a5),d3		;period
		move.w	#63,d2		;volume
		bra	.cont
.not1
		cmpi.b	#2,variables+fx_sample(a5)
		bne.s	.not2
		move.w	variables+fx_period(a5),d3		;period
		move.w	#63,d2		;volume
		bra	.cont
.not2
		cmpi.b	#3,variables+fx_sample(a5)
		bne.s	.not3
		move.w	#360,d3		;period
		move.w	#63,d2		;volume
		bra	.cont
.not3
		cmpi.b	#4,variables+fx_sample(a5)
		bne.s	.not4
		move.w	#380,d3		;period
		move.w	#63,d2		;volume
		bra	.cont
.not4
		cmpi.b	#5,variables+fx_sample(a5)
		bne.s	.not5
		move.w	variables+fx_position(a5),d0
		movem.l	a0-a1/d1,-(sp)
		jsr	find_vol_mem
		movem.l	(sp)+,a0-a1/d1
		move.w	variables+fx_period(a5),d3
		bra.s	.cont
.not5
		cmpi.b	#7,variables+fx_sample(a5)
		bne.s	.not6
		move.w	variables+fx_position(a5),d0
		movem.l	a0-a1/d1,-(sp)
		jsr	find_vol_mem
		movem.l	(sp)+,a0-a1/d1
		move.w	variables+fx_period(a5),d3
		bra	.cont
.not6
		cmpi.b	#8,variables+fx_sample(a5)
		bne.s	.not8
		move.w	variables+fx_period(a5),d3		;period
		move.w	#63,d2		;volume
		bra	.cont
.not8
		cmpi.b	#9,variables+fx_sample(a5)
		bne.s	.not9
		move.w	variables+fx_period(a5),d3		;period
		move.w	#63,d2		;volume
		bra	.cont
.not9
		cmpi.b	#10,variables+fx_sample(a5)
		bne.s	.not10
		move.w	variables+fx_period(a5),d3		;period
		move.w	#63,d2		;volume
		bra	.cont
.not10
.cont		jsr	play_8svx
		clr.b	variables+fx_sample(a5)

.no_gun		rts

********************************************************************************
get_sample
		tst.b	fire_sample(a1)
		beq.s	.not_pl
		move.b	fire_sample(a1),variables+fx_sample(a5)
		move.w	fire_period(a1),variables+fx_period(a5)
		move.w	aud_ch(a1),variables+fx_channel(a5)
		clr.b	fire_sample(a1)
.not_pl
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:       none

handle_dead
		st.b	dead_flag(a1)
		st.b	dead_flag2(a0)

		cmpi.b	#1,gender(a1)
		bne.s	.not_female
		PLAY_EX_SAMPLE #6,aud_ch(a0),#63,#180
.not_female
		movem.l	d0-a1/a1-a2,-(sp)

		move.w	variables+leader1(a5),d0
		subq.w	#1,d0
		cmp.w	player_num(a0),d0
		bne.s	.not_leader1
		clr.w	variables+leader1(a5)
.not_leader1
		move.w	variables+leader2(a5),d0
		subq.w	#1,d0
		cmp.w	player_num(a0),d0
		bne.s	.not_leader2
		clr.w	variables+leader2(a5)
.not_leader2

		move.l	mem_position(a0),a1
		move.l	a1,old_mem_position(a0)
		andi.l	#erase_person,(a1)	;remove person
		jsr	check_pad_released
.find_floor
		move.l	-map_cell_size*MAP_WIDTH*MAP_DEPTH(a1),d1
		and.l	#keep_block,d1
		beq.s	.no_block
		cmp.l	#(16<<block_shift)!keep_block_here_bit,d1
		beq	.stairsn
		cmp.l	#(17<<block_shift)!keep_block_here_bit,d1
		beq	.stairse
		cmp.l	#(18<<block_shift)!keep_block_here_bit,d1
		beq	.stairss
		cmp.l	#(19<<block_shift)!keep_block_here_bit,d1
		beq	.stairsw
		cmp.l	#(4<<block_shift)!keep_block_here_bit,d1
		bls	.found_floor
		cmp.l	#(5<<block_shift)!keep_block_here_bit,d1
		beq	.found_floor
		cmp.l	#(6<<block_shift)!keep_block_here_bit,d1
		beq	.found_floor
.no_block
		btst.b	#floor_here_bit_num,3(a1)
		bne.s	.found_floor

		sub.l	#map_cell_size*MAP_WIDTH*MAP_DEPTH,a1
		bra	.find_floor
.found_floor
		move.l	(a1),d1
		and.l	#keep_aux,d1
		cmp.l	#(12<<aux_shift)!keep_aux_here_bit,d1
		beq	.doorns
		cmp.l	#(13<<aux_shift)!keep_aux_here_bit,d1
		beq	.doorew
		cmp.l	#(8<<aux_shift)!keep_aux_here_bit,d1
		beq	.stairsn
		cmp.l	#(9<<aux_shift)!keep_aux_here_bit,d1
		beq	.stairse
		cmp.l	#(10<<aux_shift)!keep_aux_here_bit,d1
		beq	.stairss
		cmp.l	#(11<<aux_shift)!keep_aux_here_bit,d1
		beq	.stairsw

		and.l	#erase_aux,(a1)
		or.l	#(7<<aux_shift)!keep_aux_here_bit,(a1)	;add skeleton

		add.l	#map_part_size,a1
		and.l	#erase_aux_data,(a1)
		moveq.l	#0,d0
		move.w	player_num(a0),d0
		move.w	#aux_data_shift,d1
		lsl.l	d1,d0
		or.l	d0,(a1)
.no_skel
		movem.l	(sp)+,d0-a1/a1-a2
		rts

.doorns		sub.l	#map_cell_size*MAP_WIDTH,a1
		move.l	(a1),d1
		andi.l	#keep_block,d1
		beq	.find_floor
		cmp.l	#(4<<block_shift)!keep_block_here_bit,d1
		bls	.doorns_blocked
		cmp.l	#(5<<block_shift)!keep_block_here_bit,d1
		beq	.doorns_blocked
		cmp.l	#(6<<block_shift)!keep_block_here_bit,d1
		bne	.find_floor
.doorns_blocked	add.l	#2*map_cell_size*MAP_WIDTH,a1
		move.l	(a1),d1
		andi.l	#keep_block,d1
		beq	.find_floor
		cmp.l	#(4<<block_shift)!keep_block_here_bit,d1
		bls	.no_skel
		cmp.l	#(5<<block_shift)!keep_block_here_bit,d1
		beq	.no_skel
		cmp.l	#(6<<block_shift)!keep_block_here_bit,d1
		bne	.find_floor
		bra	.no_skel

.doorew		sub.l	#map_cell_size,a1
		move.l	(a1),d1
		andi.l	#keep_block,d1
		beq	.find_floor
		cmp.l	#(4<<block_shift)!keep_block_here_bit,d1
		bls	.doorew_blocked
		cmp.l	#(5<<block_shift)!keep_block_here_bit,d1
		beq	.doorew_blocked
		cmp.l	#(6<<block_shift)!keep_block_here_bit,d1
		bne	.find_floor
.doorew_blocked	add.l	#2*map_cell_size,a1
		move.l	(a1),d1
		andi.l	#keep_block,d1
		beq	.find_floor
		cmp.l	#(4<<block_shift)!keep_block_here_bit,d1
		bls	.no_skel
		cmp.l	#(5<<block_shift)!keep_block_here_bit,d1
		beq	.no_skel
		cmp.l	#(6<<block_shift)!keep_block_here_bit,d1
		bne	.find_floor
		bra	.no_skel

.stairsn	add.l	#map_cell_size*MAP_WIDTH,a1
		move.l	(a1),d1
		andi.l	#keep_block,d1
		beq	.find_floor
		cmp.l	#(4<<block_shift)!keep_block_here_bit,d1
		bls	.no_skel
		cmp.l	#(5<<block_shift)!keep_block_here_bit,d1
		beq	.no_skel
		cmp.l	#(6<<block_shift)!keep_block_here_bit,d1
		bne	.find_floor
		bra	.no_skel

.stairse	sub.l	#map_cell_size,a1
		move.l	(a1),d1
		andi.l	#keep_block,d1
		beq	.find_floor
		cmp.l	#(4<<block_shift)!keep_block_here_bit,d1
		bls	.no_skel
		cmp.l	#(5<<block_shift)!keep_block_here_bit,d1
		beq	.no_skel
		cmp.l	#(6<<block_shift)!keep_block_here_bit,d1
		bne	.find_floor
		bra	.no_skel

.stairss	sub.l	#map_cell_size*MAP_WIDTH,a1
		move.l	(a1),d1
		andi.l	#keep_block,d1
		beq	.find_floor
		cmp.l	#(4<<block_shift)!keep_block_here_bit,d1
		bls	.no_skel
		cmp.l	#(5<<block_shift)!keep_block_here_bit,d1
		beq	.no_skel
		cmp.l	#(6<<block_shift)!keep_block_here_bit,d1
		bne	.find_floor
		bra	.no_skel

.stairsw	add.l	#map_cell_size,a1
		move.l	(a1),d1
		andi.l	#keep_block,d1
		beq	.find_floor
		cmp.l	#(4<<block_shift)!keep_block_here_bit,d1
		bls	.no_skel
		cmp.l	#(5<<block_shift)!keep_block_here_bit,d1
		beq	.no_skel
		cmp.l	#(6<<block_shift)!keep_block_here_bit,d1
		bne	.find_floor
		bra	.no_skel



INCR_FITNESS	macro
		movem.l	d0-d2/a1,-(sp)
		moveq.l	#0,d0
		move.w	\2,d0
		lea	global_vars+player\1_stats(a5),a1
		jsr	incr_fitness
		movem.l	(sp)+,d0-d2/a1
		endm

incr_fitness	moveq.l	#0,d2
		move.w	fitness(a1),d2
		move.l	#65535,d1
		sub.w	d2,d1
		cmp.w	d1,d0
		bls.s	.not_full
		exg	d0,d1
.not_full	add.w	fitness(a1),d0
		move.w	d0,fitness(a1)
		divu	#655,d0
		divu	#655,d2
		cmp.w	d0,d2
		beq.s	.no_change
		st.b	variables+redraw_flag(a5)
.no_change	rts


DECR_FITNESS	macro
		movem.l	d0-d1/a1,-(sp)
		moveq.l	#0,d0
		move.w	\2,d0
		lea	global_vars+player\1_stats(a5),a1
		jsr	decr_fitness
		movem.l	(sp)+,d0-d1/a1
		endm

damage_fitness
		cmpi.w	#87,spell_shield(a0)
		bne.s	.no_shield
		lsr.l	#3,d0
.no_shield
		move.w	physique(a1),d1
		divu	d1,d0
		bvc.s	.no_overflow
		move.l	#$0fffffff/100,d0
.no_overflow
		mulu	#100,d0
		jsr	decr_fitness		;damage = ( hit / physique ) * 100
		rts

punch_fitness
		cmpi.w	#87,spell_shield(a0)
		bne.s	.no_shield
		lsr.l	#3,d0
.no_shield
		move.w	physique(a1),d1
		divu	d1,d0
		bvc.s	.no_overflow
		move.l	#$0fffffff/100,d0
.no_overflow
		move.w	variables+random_num(a5),d2
		mulu	#27,d2
		rol.w	#7,d2
		move.w	d2,variables+random_num(a5)
                btst.l	#0,d2
		bne.s	.big
		add.w	d0,claw_count(a0)
		bpl.s	.skip_big
		move.w	#32767,claw_count(a0)
		bra.s	.skip_big
.big		add.w	d0,bigclaw_count(a0)
		bpl.s	.skip_big
		move.w	#32767,claw_count(a0)
.skip_big
		move.w	#25,monster_attacking(a0)
		st.b	variables+redraw_flag(a5)
		mulu	#100,d0
		jsr	decr_fitness		;damage = ( hit / physique ) * 100
		rts

decr_fitness
		tst.b	cheat_mode3
		bne	.no_change
		tst.b	cheat_mode2
		beq	.not_cheat2
		lsr.l	#2,d0
.not_cheat2
		st.b	fire_white(a0)
		cmpi.w	#4,window_type(a0)
		bne.s	.not_resting
		lsl.l	#2,d0       		;damage * 4
		move.w	#0,window_type(a0)	;view window
		st.b	variables+redraw_flag(a5)
.not_resting
		move.l	d0,d1
		lsr.l	#1,d1
		lsr.l	#8,d1
		addi.b	#1,d1
		add.b	d1,fitness_flash_dur(a1)

		movem.l	d0/a1,-(sp)
		cmpi.w	#100,grunt_count(a0)
		blt	.no_grunt
		clr.w	grunt_count(a0)
		tst.l	exchip_mem_base
		beq.s	.no_ex_sfx
		move.w	#7,d0
                cmpi.b	#1,gender(a1)
		beq.s	.do_grunt
		move.w	#10,d0
                cmpi.b	#0,gender(a1)
		beq.s	.do_grunt
		move.w	#11,d0
		PLAY_EX_SAMPLE_RAND #11,#2,#63,#128
		bra.s	.no_grunt
.do_grunt
		PLAY_EX_SAMPLE_RAND d0,#2,#63,#262
		bra.s	.no_grunt
.no_ex_sfx
		move.l	#miscsfx,a1
		add.l	chip_mem_base,a1
		PLAY_SAMPLE a1,#6,#2,#63,grunt_period(a0)
.no_grunt	movem.l	(sp)+,d0/a1

		moveq.l	#0,d1
		lsr.l	#1,d0
		move.w	fitness(a1),d1
		cmp.l	d1,d0
		bls.s	.not_dead
.dead		moveq.l	#0,d0
		bsr	handle_dead
		st.b	variables+redraw_flag(a5)
		bra.s	.no_change
.not_dead	sub.w	d0,fitness(a1)
		move.w	fitness(a1),d0
		divu	#655,d0
		beq.s	.dead
		divu	#655,d1
		cmp.w	d0,d1
		beq.s	.no_change
		st.b	variables+redraw_flag(a5)
.no_change	rts

INCR_PHYSIQUE	macro
		movem.l	d0-d1/a1,-(sp)
		move.w	\2,d0
		lea	global_vars+player\1_stats(a5),a1
		jsr	incr_physique
		movem.l	(sp)+,d0-d1/a1
		endm

incr_physique
		moveq.l	#-1,d1
		sub.w	physique(a1),d1
		cmp.w	d1,d0
		bls.s	.not_full
		move.w	#-1,physique(a1)
		st.b	variables+redraw_flag(a5)
		bra.s	.end
.not_full	add.w	d0,physique(a1)
.end		st.b	variables+redraw_flag(a5)
		rts

DECR_PHYSIQUE	macro
		movem.l	d0/a1,-(sp)
		move.w	\2,d0
		lea	global_vars+player\1_stats(a5),a1
		jsr	decr_physique
		movem.l	(sp)+,d0/a1
		endm

decr_physique
		moveq.l	#0,d1
		move.w	physique(a1),d1
		cmp.l	d1,d0
		bls.s	.not_dead
		moveq.l	#0,d0
		bsr	handle_dead
.not_dead	sub.w	d0,physique(a1)
.end		st.b	variables+redraw_flag(a5)
		rts

draw_fitness_bars
		lea	variables+player1(a5),a0
		lea	global_vars+player1_stats(a5),a1
		bsr	draw_fitness_bar

		lea	variables+player2(a5),a0
		lea	global_vars+player2_stats(a5),a1
		bsr	draw_fitness_bar

		lea	variables+player3(a5),a0
		lea	global_vars+player3_stats(a5),a1
		bsr	draw_fitness_bar

		move.b	global_vars+num_players(a5),d0
                cmpi.b	#3,d0
		beq.s	.no4
		lea	variables+player4(a5),a0
		lea	global_vars+player4_stats(a5),a1
		bsr	draw_fitness_bar
.no4
		rts

draw_fitness_bar
		tst.w	dead_flag(a1)
		bne	.dead
		cmpi.w	#6,view_window(a0)
		bgt	.dead
		tst.b	control_method(a0)
		beq	.dead

		moveq.l	#0,d0
		move.w	poisoned_total(a0),d0
		beq.s	.no_poison
		jsr	decr_fitness
		clr.w	poisoned_total(a0)
		st.b	variables+redraw_flag(a5)
.no_poison
		tst.w	icon_weights_dur(a0)
		bne.s	.no_icon_weights
		moveq.l	#0,d0
		move.w	spell_weights(a0),d0
		beq.s	.no_icon_weights
		jsr	decr_physique
		clr.w	spell_weights(a0)
		st.b	variables+redraw_flag(a5)
.no_icon_weights
		tst.w	icon_immu_dur(a0)
		bne.s	.no_icon_immu
		tst.w	spell_immu(a0)
		beq.s	.no_icon_immu
		clr.w	spell_immu(a0)
		st.b	variables+redraw_flag(a5)
.no_icon_immu
		tst.w	icon_shield_dur(a0)
		bne.s	.no_icon_shield
		tst.w	spell_shield(a0)
		beq.s	.no_icon_shield
		clr.w	spell_shield(a0)
		st.b	variables+redraw_flag(a5)
.no_icon_shield
		tst.w	icon_water_dur(a0)
		bne.s	.no_icon_water
		tst.w	spell_water(a0)
		beq.s	.no_icon_water
		clr.w	spell_water(a0)
		st.b	variables+redraw_flag(a5)
.no_icon_water
		tst.w	icon_wings_dur(a0)
		bne.s	.no_icon_wings
		tst.w	spell_wings(a0)
		beq.s	.no_icon_wings
		clr.w	spell_wings(a0)
		bsr	calc_weight
		st.b	variables+redraw_flag(a5)
.no_icon_wings

		move.w	view_xoffset(a0),d5	;d5=window top left x
		move.w	view_yoffset(a0),d7	;d7=window top left y
                move.l	mem_position(a0),a2

		mulu	#40,d7
		lsr.w	#3,d5
		add.w	d5,d7
		add.w	#214,d7

		move.w	fitness(a1),d1

		moveq.l	#0,d0
		move.w	d1,d0
		divu	#6000,d0
		cmp.w	old_fitness_band(a1),d0
		beq.s	.no_change
		move.w	d0,old_fitness_band(a1)
		cmpi.w	#3,d0
		bgt.s	.no_change
		btst.b	#water_here_bit_num,3(a2)
		bne.s	.no_change
		move.w	player_num(a0),d2
		lsl.w	#2,d2
		addq.w	#5,d2
                add.w	d2,d0
                PUSH_MESG_RAND d0
.no_change
		tst.w	d1
		beq	.dead

		cmpi.w	#20*655,d1
		bhi.s	.not_red
		move.b	timer+1,d0
		andi.b	#%111111,d0
		cmpi.b	#32,d0
		blt.s	.not_red
		tst.w	warning(a0)
		bne.s	.skip
		st.b	variables+redraw_flag(a5)
		st.b	warning(a0)
		bra.s	.skip
.not_red	tst.w	warning(a0)
		beq.s	.skip
		st.b	variables+redraw_flag(a5)
		sf.b	warning(a0)
.skip
		tst.w	poisoned_strength(a0)
		beq.s	.skip_poison
		move.b	timer+1,d0
		andi.b	#%111111,d0
		cmpi.b	#32,d0
		blt.s	.not_on_poison
		tst.w	poisoned(a0)
		bne.s	.skip_poison
		st.b	variables+redraw_flag(a5)
		st.b	poisoned(a0)
		bra.s	.skip_poison
.not_on_poison	tst.w	poisoned(a0)
		beq.s	.skip_poison
		st.b	variables+redraw_flag(a5)
		sf.b	poisoned(a0)
.skip_poison

		rol.w	#5,d1
		andi.w	#$1f,d1
		addq.w	#1,d1
		move.l	#$ffffffff,d0
                lsr.l	d1,d0

		move.l	viewing_buffer,a2
		add.w	d7,a2

		move.l	#-1,8480*3(a2)
		move.l	#-1,8480*3+40(a2)
		move.l	d0,0(a2)
		move.l	d0,40(a2)

.dead		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT		a5=base address of fast memory (long)
;		a2=address of players structure (long)
;		d0=damage amount (word)
;OUTPUT:	none
;CHANGES:	d0-d4,a0-a4

damage_inventory
		tst.b	cheat_mode3
		bne.s	.cheat3

		movem.l	d0-d2/a0-a3,-(sp)

		lsr.l	#1,d0

		move.l	a2,a0
		bsr	count_items

		tst.w	inven_num_items(a2)
		beq.s	.end

		divu	inven_num_items(a2),d0

		lea	inven_using(a2),a1
		bsr	.damage_item

		lea	inven_store(a2),a1
		move.w	#inven_size-1,d1
.loop		bsr	.damage_item
		add.l	#inven_item_size,a1
		dbf	d1,.loop

.end		move.l	a2,a0
		bsr	calc_weight

		movem.l	(sp)+,d0-d2/a0-a3
.cheat3		rts

.damage_item
		moveq.l	#0,d2
		move.b	inven_item_num(a1),d2
		beq.s	.no_item

		subq.l	#1,d2
		mulu	#item_size,d2
		move.l	#items,a3
		add.w	d2,a3
		add.l	a5,a3

		moveq.l	#0,d3
		move.w	item_maxdamage(a3),d3
		beq.s	.indestructable

		st.b	variables+redraw_flag(a5)	;set redraw flag

		moveq.l	#0,d2
		move.b	inven_item_damage(a1),d2
		lsl.w	#8,d2
		add.w	d0,d2
		cmp.l	d3,d2
		bge.s	.destroyed
		lsr.w	#8,d2

		move.b	d2,inven_item_damage(a1)
		rts

.destroyed	move.b	item_container_type(a3),d0
		cmpi.b	#CONT_BIGCRATE,d0
		bne.s	.not_big
		move.b	#52,inven_item_num(a1)
		bra.s	.no_item
.not_big	cmpi.b	#CONT_SMALLCRATE,d0
		bne.s	.not_small
		move.b	#111,inven_item_num(a1)
		bra.s	.no_item
.not_small	move.b	#22,inven_item_num(a1)
.indestructable
.no_item	rts

********************************************************************************
********************************** Move Lifts **********************************
********************************************************************************
;Move lifts.
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	d0-d4,a0-a4

move_lifts	move.l  a4,-(sp)

		cmp.w	#50,lift_count		;time to move lifts?
		bls	.end_of_lifts		;no, then branch

		move.w	variables+on_a_lift(a5),variables+last_on_a_lift(a5)
		clr.w	variables+on_a_lift(a5)

		subi.w	#50,lift_count		;reset timer

		lea	map+lifts(a5),a0
		move.l	#map,a1
		add.l   a5,a1
		add.l	#map_data1,a1
		move.w	#MAP_WIDTH*MAP_DEPTH*map_cell_size,d1
		move.w	d1,d2
		neg.w	d1

		move.w	#31,d7

.next_lift	moveq.l	#0,d0
		move.w	lift_posn(a0),d0
		beq	.next_entry

		move.l	a1,a2
		add.l	d0,a2				;address of lift
		move.l	(a2),d0

                tst.b	lift_direction(a0)
		beq	.lift_stopped

;-------------------------------------------------------------------------------

		cmpi.b	#LIFT_AUTOMOVE_UP,lift_direction(a0)	;lift going up?
		bne	.not_automove_up			;no, then branch
		btst.l	#block_here_bit_num,d0
		bne.s	.automove_up
		move.b	#LIFT_STOPPED,lift_direction(a0)
		bra.s	.not_automove_up
.automove_up	move.b	#LIFT_GOING_UP,lift_direction(a0)
.not_automove_up

;-------------------------------------------------------------------------------

		cmpi.b	#LIFT_AUTOMOVE_DOWN,lift_direction(a0)	;lift going down?
		bne	.not_automove_down			;no, then branch
		btst.l	#block_here_bit_num,d0
		bne.s	.automove_down
		move.b	#LIFT_STOPPED,lift_direction(a0)
		bra.s	.not_automove_down
.automove_down	move.b	#LIFT_GOING_DOWN,lift_direction(a0)
.not_automove_down

;-------------------------------------------------------------------------------

		cmpi.b	#LIFT_GOING_UP,lift_direction(a0)	;lift going up?
		bne	.not_up					;no, then branch
		move.b 	lift_height(a0),d3
		cmp.b	lift_max_height(a0),d3		;max height reached?
		blt.s	.move_up			;no, then branch
		move.b  lift_up(a0),lift_direction(a0)
		bra	.lift_stopped

.move_up	lea	0(a2,d2.w),a3			;address of new lift position
		move.l	(a3),d3

		and.l	#keep_block!keep_panel!keep_floor,d3	;movement up blocked?
		bne	.lift_stopped				;yes, then branch

		move.l	d0,d4
		and.l	#keep_block!keep_aux,d4
		beq	.lift_nothing_up
		and.l	#keep_block,d4
		beq	.carry_up

		tst.b	lift_weight(a0)			;can i lift a block?
		beq	.lift_stopped			;no, then branch

		btst.l	#pushable_bit_num,d0
		beq.s	.not_pushable_going_up
		movem.l	d0/a1/a3,-(sp)
		move.l	a3,a1
		move.l	a2,a3
		bsr	move_pushable_address
		movem.l	(sp)+,d0/a1/a3
		bra	.carry_up
.not_pushable_going_up
		move.l	d0,d3
		and.l	#keep_block,d3
		cmp.l	#(8<<block_shift)!keep_block_here_bit,d3
		blt	.lift_stopped
		cmp.l	#(47<<block_shift)!keep_block_here_bit,d3
		bgt	.lift_stopped
		cmp.l	#(31<<block_shift)!keep_block_here_bit,d3
		bgt	.carry_up
		cmp.l	#(16<<block_shift)!keep_block_here_bit,d3
		blt	.carry_up
		cmp.l	#(24<<block_shift)!keep_block_here_bit,d3
		blt	.lift_stopped
		cmp.l	#(27<<block_shift)!keep_block_here_bit,d3
		bgt	.lift_stopped
.carry_up
		addi.b	#1,lift_height(a0)			;move lift
		add.w	d2,lift_posn(a0)

		move.l	d0,d3
		and.l	#keep_block,d3
		cmp.l	#(22<<block_shift)!keep_block_here_bit,d3
		beq.s	.grenade
		cmp.l	#(23<<block_shift)!keep_block_here_bit,d3
		bne.s	.not_grenade
.grenade
		and.l	#keep_floor!keep_aux,d0
		and.l	#erase_floor&erase_aux,(a2)
		or.l	#(7<<block_shift)!keep_block_here_bit,(a2)	;lift hydraulic
		and.l	#erase_floor&erase_aux,(a3)
		or.l	d0,(a3)
		bra	.skip_not_grenade
.not_grenade
		and.l	#keep_block_fall!keep_floor!keep_variant!keep_aux,d0	;d0=stuff to be lifted
		and.l	#erase_block_fall&erase_floor&erase_variant&erase_aux,(a2)
		or.l	#(7<<block_shift)!keep_block_here_bit,(a2)	;lift hydraulic
		and.l	#erase_block_fall&erase_floor&erase_variant&erase_aux,(a3)
		or.l	d0,(a3)
.skip_not_grenade

		add.l	#map_part_size,a2
		add.l	#map_part_size,a3
		move.l	(a2),d3
		and.l	#keep_aux_data!keep_hatch_time,d3	;d0=stuff to be lifted
		and.l	#erase_aux_data&erase_hatch_time,(a3)
		or.l	d3,(a3)

		add.l	#map_part_size,a2
		add.l	#map_part_size,a3
		move.l	(a2),d3
		and.l	#keep_item_type!keep_item_damage!keep_item_ammo!keep_no_question,d3	;d0=stuff to be lifted
		and.l	#erase_item_type&erase_item_damage&erase_item_ammo&erase_no_question,(a3)
		or.l	d3,(a3)

		sub.l	#map_part_size*2,a2
		sub.l	#map_part_size*2,a3

		st.b	variables+redraw_flag(a5)	;set redraw flag

		movem.l	d0-d2/a2,-(sp)
		bsr	find_heads_owner_quick
		cmp.l	#0,a4				;figure lifted?
		beq.s	.not_fig_up			;no, then branch
		move.l	a3,mem_position(a4)
		addi.b	#1,floor(a4)
		st.b	variables+on_a_lift(a5)
.not_fig_up	movem.l	(sp)+,d0-d2/a2

		movem.l	d0-d2/a2,-(sp)
		jsr	find_monsters_owner
		tst.w	d2				;figure lifted?
		bmi.s	.not_mons_up			;no, then branch
		move.l	a3,monster_posn(a4)
		addi.b	#1,monster_floor(a4)
.not_mons_up	movem.l	(sp)+,d0-d2/a2

		movem.l	d0-d2/a0/a3,-(sp)
		move.l	(a3),d0
		and.l	#keep_block,d0
		cmp.l	#(24<<block_shift)!keep_block_here_bit,d0
		blt.s	.not_sentry
		cmp.l	#(27<<block_shift)!keep_block_here_bit,d0
		bgt.s	.not_sentry
		move.l	(a3),d0
		and.l	#keep_variant_sentry,d0
		move.w	#32-variant_shift,d1
		rol.l	d1,d0
		mulu	#sn_struct_size,d0
		lea	variables+sentries(a5),a0
		add.l	d0,a0
		sub.l	#map+map_data1,a3
		sub.l	a5,a3
		move.l	a3,sn_address(a0)
.not_sentry	movem.l	(sp)+,d0-d2/a0/a3

		bra	.next_entry

;-------------------------------------------------------------------------------

.lift_nothing_up
		addi.b	#1,lift_height(a0)      			;move lift
                add.w	d2,lift_posn(a0)
		and.l	#keep_floor,d0					;d0=stuff to be lifted
		and.l	#erase_floor,(a2)
		or.l	#(7<<block_shift)!keep_block_here_bit,(a2)	;lift hydraulic
		and.l	#erase_floor,(a3)
		or.l	d0,(a3)
.skip_lift_up
		st.b	variables+redraw_flag(a5)			;set redraw flag
		bra	.next_entry
.not_up

;-------------------------------------------------------------------------------

		cmpi.b	#LIFT_GOING_DOWN,lift_direction(a0)	;lift going down?
		bne	.not_down		;no, then branch
		move.b 	lift_height(a0),d3
		cmp.b	lift_min_height(a0),d3	;min height reached?
		bgt.s	.move_down		;no, then branch
		move.b  lift_down(a0),lift_direction(a0)
		bra	.lift_stopped

.move_down	lea	0(a2,d1.w),a3		;address of new lift position
		subi.b	#1,lift_height(a0)	;move lift
                add.w	d1,lift_posn(a0)
		move.l  d0,d3
		and.l	#keep_aux!keep_block,d3
		beq	.nothing_going_down

.move_down_loop	move.l	(a2),d0

		move.l	d0,d3
		and.l	#keep_aux!keep_block,d3
		beq	.end_loop_down
		move.l	d0,d3
		and.l	#keep_floor,d3
		beq.s	.ok
                cmp.l	#(2<<floor_shift)!keep_floor_here_bit,d3
		bne	.end_loop_down
.ok
		add.l	#map_part_size,a2
		add.l	#map_part_size,a3
		move.l	(a2),d3
		and.l	#keep_aux_data!keep_hatch_time,d3
		and.l	#erase_aux_data&erase_hatch_time,(a3)
		or.l	d3,(a3)

		add.l	#map_part_size,a2
		add.l	#map_part_size,a3
		move.l	(a2),d3
		and.l	#keep_item_type!keep_item_damage!keep_item_ammo!keep_no_question,d3
		and.l	#erase_item_type&erase_item_damage&erase_item_ammo!erase_no_question,(a3)
		or.l	d3,(a3)

		sub.l	#map_part_size*2,a2
		sub.l	#map_part_size*2,a3

		st.b	variables+redraw_flag(a5)		;set redraw flag

		btst.l	#pushable_bit_num,d0
		beq.s	.not_pushable_down
		and.l	#erase_block_fall&erase_floor&erase_variant&erase_aux,(a3)
		and.l	#keep_block_fall!keep_floor!keep_variant!keep_aux,d0	;d0=stuff to be lifted
		movem.l	d0/a1/a3,-(sp)
		move.l	a3,a1
		move.l	a2,a3
		bsr	move_pushable_address
		movem.l	(sp)+,d0/a1/a3
		and.l	#erase_block_fall&erase_floor&erase_variant&erase_aux,(a2)
		or.l	d0,(a3)
		bra.s	.moved_down
.not_pushable_down
		btst.l	#opaque_bit_num,d0
		beq.s	.not_opaque_down
		and.l	#keep_floor,d0			;d0=stuff to be lifted
		and.l	#erase_floor,(a2)
		and.l	#erase_block_fall&erase_floor&erase_variant,(a3)
		or.l	d0,(a3)
		bra	.end_loop_down
.not_opaque_down
		move.l	d0,d3
		and.l	#keep_block,d3
		cmp.l	#(22<<block_shift)!keep_block_here_bit,d3
		beq.s	.grenade_down
		cmp.l	#(23<<block_shift)!keep_block_here_bit,d3
		bne.s	.not_grenade_down
.grenade_down
		and.l	#erase_block_fall&erase_floor&erase_variant&erase_aux,(a3)
		and.l	#keep_floor!keep_aux,d0		;d0=stuff to be lifted
		and.l	#erase_floor&erase_aux,(a2)
		or.l	d0,(a3)
		bra	.end_loop_down
.not_grenade_down
		and.l	#erase_block_fall&erase_floor&erase_variant&erase_aux,(a3)
		and.l	#keep_block_fall!keep_floor!keep_variant!keep_aux,d0	;d0=stuff to be lifted
		and.l	#erase_block_fall&erase_floor&erase_variant&erase_aux,(a2)
		or.l	d0,(a3)
.moved_down
		movem.l	d0-d2/a2,-(sp)
		bsr	find_heads_owner_quick
		cmp.l	#0,a4					;figure lifted?
		beq.s	.not_fig_down				;no, then branch
		move.l	a3,mem_position(a4)
		sub.b	#1,floor(a4)
		st.b	variables+on_a_lift(a5)
.not_fig_down	movem.l	(sp)+,d0-d2/a2

		movem.l	d0-d2/a2,-(sp)
		jsr	find_monsters_owner
		tst.w	d2					;figure lifted?
		bmi.s	.not_mons_down				;no, then branch
		move.l	a3,monster_posn(a4)
		sub.b	#1,monster_floor(a4)
.not_mons_down	movem.l	(sp)+,d0-d2/a2

		movem.l	d0-d2/a0-a3,-(sp)
		move.l	(a3),d0
		and.l	#keep_block,d0
		cmp.l	#(24<<block_shift)!keep_block_here_bit,d0
		blt.s	.not_sentry_down
		cmp.l	#(27<<block_shift)!keep_block_here_bit,d0
		bgt.s	.not_sentry_down
		move.l	(a3),d0
		and.l	#keep_variant_sentry,d0
		move.w	#32-variant_shift,d1
		rol.l	d1,d0
		mulu	#sn_struct_size,d0
		lea	variables+sentries(a5),a0
		add.l	d0,a0
		sub.l	#map+map_data1,a3
		sub.l	a5,a3
		move.l	a3,sn_address(a0)
.not_sentry_down
		movem.l	(sp)+,d0-d2/a0-a3

		add.w	#MAP_WIDTH*MAP_DEPTH*map_cell_size,a2
		add.w	#MAP_WIDTH*MAP_DEPTH*map_cell_size,a3
		bra	.move_down_loop

.end_loop_down	bra	.next_entry

;------------------------------------------------------------------------------

.nothing_going_down
		and.l	#keep_floor,d0
		and.l	#erase_floor,(a2)
		and.l	#erase_block_fall&erase_floor&erase_variant,(a3)
		or.l	d0,(a3)

		st.b	variables+redraw_flag(a5)	;set redraw flag
		bra	.next_entry
.not_down

;-------------------------------------------------------------------------------

.lift_stopped
		moveq.l	#0,d3
		move.w	lift_posn(a0),d3
		move.l	a1,a2
		add.l	d3,a2

		tst.b	lift_automove(a0)
		beq	.next_entry
		move.l	(a2),d0
		btst.l	#pushable_bit_num,d0
		bne.s	.auto
		and.l	#keep_block,d0
		beq	.next_entry
		cmp.l	#(8<<block_shift)!keep_block_here_bit,d0
		blt	.next_entry
		cmp.l	#(47<<block_shift)!keep_block_here_bit,d0
		bgt.s	.next_entry
		cmp.l	#(15<<block_shift)!keep_block_here_bit,d0
		ble.s	.auto
		cmp.l	#(32<<block_shift)!keep_block_here_bit,d0
		bge.s	.auto
		cmp.l	#(24<<block_shift)!keep_block_here_bit,d0
		blt.s	.next_entry
		cmp.l	#(27<<block_shift)!keep_block_here_bit,d0
		bgt.s	.next_entry
.auto
		cmpi.b	#1,lift_automove(a0)
		bne.s	.no_automove1
		move.b 	lift_height(a0),d3
		cmp.b	lift_min_height(a0),d3
		bgt.s	.next_entry
		move.b	#LIFT_AUTOMOVE_UP,lift_direction(a0)
		bra.s	.next_entry
.no_automove1
		cmpi.b	#2,lift_automove(a0)
		bne.s	.no_automove2
		move.b 	lift_height(a0),d3
		cmp.b	lift_max_height(a0),d3
		blt.s	.next_entry
		move.b	#LIFT_AUTOMOVE_DOWN,lift_direction(a0)
		bra.s	.next_entry
.no_automove2
		move.b 	lift_height(a0),d3
		cmp.b	lift_min_height(a0),d3
		ble.s	.at_bottom3
		cmp.b	lift_max_height(a0),d3
		blt.s	.next_entry
		move.b	#LIFT_AUTOMOVE_DOWN,lift_direction(a0)
		bra.s	.next_entry
.at_bottom3	move.b	#LIFT_AUTOMOVE_UP,lift_direction(a0)

.next_entry	lea	lift_size(a0),a0
		dbf	d7,.next_lift

		tst.l	exchip_mem_base
		beq.s	.no_ex
		tst.b	variables+on_a_lift(a5)
		beq.s	.skip_lift_noise
		tst.b	variables+last_on_a_lift(a5)
		bne.s	.skip_lift_noise2
		PLAY_EX_SAMPLE #9,#2,#40,#412
		bra.s	.skip_lift_noise2
.skip_lift_noise
		tst.b	variables+last_on_a_lift(a5)
		beq.s	.skip_lift_noise2
		move.w	#0,aud2lch+vol(a6)
.skip_lift_noise2
.no_ex

.end_of_lifts
		move.l	(sp)+,a4

		rts

********************************************************************************
********************************* Move Doors ***********************************
********************************************************************************
;Move doors.
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	d0-d4,a0-a3
move_doors
		cmp.w	#6,door_count		;time to move doors?
		bls	.end_of_doors		;no, then branch

.again		subi.w	#6,door_count
		bmi.s	.end

		bsr	.do_doors
		bra.s	.again

.end		addi.w	#6,door_count
		rts

.do_doors
		lea	map+doors(a5),a0

		move.l	#map+map_data1,a3
		add.l   a5,a3

		move.w	#32-variant_shift,d2
		move.w	#block_shift,d3
		move.w	#31,d7

.next_door	moveq.l	#0,d0
		move.w	door_posn(a0),d0
		beq     .next_entry
		move.l	a3,a1
		add.l	d0,a1

		move.b	door_delay(a0),d1
		bmi.s	.no_delay
		move.l	(a1),d4
		btst.l	#block_here_bit_num,d4
		bne.s	.no_delay
		addi.b	#1,door_del_count(a0)
		cmp.b	door_del_count(a0),d1
		bgt.s	.no_delay
		move.b	#0,door_del_count(a0)
		move.b	#2,door_trig(a0)
.no_delay
		moveq.l	#0,d4

		tst.b	door_trig(a0)
		beq	.cont_trig

		cmp.b	#1,door_trig(a0)
		bne.s	.not_trig_1
		clr.b	door_trig(a0)
		cmpi.b	#3,door_direction(a0)
		beq.s	.cont_trig
		cmpi.b	#1,door_direction(a0)
		beq.s	.cont_trig
		move.b	#1,door_direction(a0)
		moveq.l	#-1,d4			;flag trigger changed
		bra.s	.cont_trig
.not_trig_1
		cmp.b	#2,door_trig(a0)
		bne.s	.not_trig_2
		clr.b	door_trig(a0)
		cmpi.b	#3,door_direction(a0)
		beq.s	.cont_trig
		cmpi.b	#2,door_direction(a0)
		beq.s	.cont_trig
		move.b	#2,door_direction(a0)
		moveq.l	#-1,d4			;flag trigger changed
		bra.s	.cont_trig
.not_trig_2
		cmp.b	#3,door_trig(a0)
		bne.s	.not_trig_3
		cmpi.b	#0,door_direction(a0)
		bne.s	.cont_trig
		move.b	#3,door_direction(a0)
		clr.b	door_trig(a0)
		bra.s	.cont_trig
.not_trig_3
		cmp.b	#4,door_trig(a0)
		bne.s	.not_trig_4
		cmpi.b	#3,door_direction(a0)
		bne.s	.cont_trig
		move.b	#0,door_direction(a0)
		clr.b	door_trig(a0)
		bra.s	.cont_trig
.not_trig_4
.cont_trig
		tst.b	door_direction(a0)
		beq	.door_stopped

********************************************************************************
		cmpi.b	#1,door_direction(a0)
		bne	.not_opening

		move.l	(a1),d1
		btst.l	#block_here_bit_num,d1
		beq	.not_opening		;already fully opened
		and.l	#keep_block,d1
		ror.l	d3,d1
		cmpi.b  #20,d1
		blt	.obstructed
		cmpi.b  #21,d1
		bgt  	.obstructed

		move.l	(a1),d1
		and.l	#keep_variant,d1
		rol.l	d2,d1
		cmpi.b	#10,d1
		blt.s	.not_fully_opened
		move.b	#0,door_del_count(a0)
		move.b	#0,door_direction(a0)
		and.l	#erase_block,(a1)
		move.l	#miscsfx,a2
		add.l	a4,a2
		tst.b	variables+on_a_lift(a5)
		bne.s	.not_opening
		PLAY_SAMPLE_MEM a2,#4,#2,#568,d0
		bra.s	.not_opening
.not_fully_opened
		tst.l	d4
		beq.s	.not_newly_opening
		move.l	#miscsfx,a2
		add.l	a4,a2
		tst.b	variables+on_a_lift(a5)
		bne.s	.not_newly_opening
		PLAY_SAMPLE_MEM a2,#5,#2,#428,d0
.not_newly_opening

		addi.b	#1,d1
		ror.l	d2,d1
		and.l	#erase_variant,(a1)
		or.l	d1,(a1)
		st.b	variables+redraw_flag(a5)
		bra.s	.not_opening
.open_obstructed
		move.b	#0,door_direction(a0)
.not_opening

********************************************************************************
		cmpi.b	#2,door_direction(a0)
		bne	.not_closing

		move.l	(a1),d1
		btst.l	#block_here_bit_num,d1
		bne.s   .possible_obstruction
		and.l	#erase_variant,(a1)
		moveq.l	#10,d1
		bra.s	.not_fully_closed
.possible_obstruction
		and.l	#keep_block,d1
		ror.l	d3,d1
		cmpi.b  #20,d1
		blt	.obstructed
		cmpi.b  #21,d1
		bgt  	.obstructed

		move.l	(a1),d1
		and.l	#keep_variant,d1
		rol.l	d2,d1

		cmpi.b	#0,d1
		bgt.s	.not_fully_closed
		move.b	#0,door_direction(a0)
		move.l	#miscsfx,a2
		add.l	a4,a2
		tst.b	variables+on_a_lift(a5)
		bne.s	.not_closing
		PLAY_SAMPLE_MEM a2,#4,#2,#568,d0
		bra.s	.not_closing
.not_fully_closed
		tst.l	d4
		beq.s	.not_newly_closing
		move.l	#miscsfx,a2
		add.l	a4,a2
		tst.b	variables+on_a_lift(a5)
		bne.s	.not_newly_closing
		PLAY_SAMPLE_MEM a2,#5,#2,#428,d0
.not_newly_closing
		subi.b	#1,d1
		ror.l	d2,d1
		and.l	#erase_variant&erase_block,(a1)
		or.l	door_type(a0),d1
		or.l	d1,(a1)
		st.b	variables+redraw_flag(a5)

		bra.s	.not_closing
.obstructed
		move.b	#0,door_direction(a0)
.not_closing

********************************************************************************
.door_stopped
.next_entry	lea	door_size(a0),a0
		dbf	d7,.next_door

.end_of_doors	rts

.stop_door	clr.b	door_trig(a0)
		clr.b	door_direction(a0)
		lea	door_size(a0),a0
		bra	.next_door

********************************************************************************
****************************** Move Fireballs **********************************
********************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	d0-d4,a0-a3

move_fireballs
		cmp.w	#10,explosion_count	;time to move explosions?
		bls	.end_of_expls		;no, then branch

		clr.w	explosion_count		;reset timer

		bsr	move_grenades

		move.l	#map+explosions,a0
		add.l	a5,a0

		move.l	#map+map_data1,a1
		add.l   a5,a1

		move.l	#locn,a3
		add.l	a5,a3

		move.w	#block_shift,d2
		move.w	#31,d7

.next_explosion
		tst.w	expl_posn(a0)
		beq     .next_entry

		cmpi.b	#255,expl_speed(a0)
		beq     .next_entry

		st.b	variables+redraw_flag(a5)

		move.b	expl_count(a0),d0
		cmp.b	expl_speed(a0),d0
		blt	.skip_fireball
		tst.b	expl_direction(a0)
		bmi	.skip_fireball

		moveq.l	#0,d0
		move.w	expl_posn(a0),d0
		move.l	d0,a2
		add.l	a1,a2
		and.l	#erase_explosion,(a2)

		clr.b	expl_count(a0)
		moveq.l	#0,d0			;reset decay flag

		cmpi.b	#0,expl_direction(a0)
		bne.s	.not_north
		move.l	-map_cell_size*MAP_WIDTH(a2),d1
		cmpi.l	#keep_opaque_bit,d1
		beq	.kill_fireball
		btst.l	#opaque_bit_num,d1
		bne.s	.blocked_north
		btst.l	#block_here_bit_num,d1
		beq.s	.not_blocked_north
		and.l	#keep_block,d1
		bclr.l	#block_here_bit_num,d1
		tst.b	locn_style(a3)
		beq.s	.tree_not_opaque_north
		cmpi.b	#2,locn_style(a3)
		beq.s	.tree_not_opaque_north
		cmp.l	#4<<block_shift,d1
		beq.s	.blocked_north
.tree_not_opaque_north
		cmp.l	#16<<block_shift,d1
		blt.s	.not_blocked_north
		cmp.l	#21<<block_shift,d1
		ble.s	.blocked_north
.not_blocked_north
		sub.w	#map_cell_size*MAP_WIDTH,expl_posn(a0)
		bra	.end_move
.blocked_north	moveq.l	#-1,d0			;flag check decay
		bra	.end_move
.not_north
		cmpi.b	#1,expl_direction(a0)
		bne.s	.not_east
		move.l	map_cell_size(a2),d1
		cmpi.l	#keep_opaque_bit,d1
		beq	.kill_fireball
		btst.l	#opaque_bit_num,d1
		bne.s	.blocked_east
		btst.l	#block_here_bit_num,d1
		beq.s	.not_blocked_east
		and.l	#keep_block,d1
		bclr.l	#block_here_bit_num,d1
		tst.b	locn_style(a3)
		beq.s	.tree_not_opaque_east
		cmpi.b	#2,locn_style(a3)
		beq.s	.tree_not_opaque_east
		cmp.l	#4<<block_shift,d1
		beq.s	.blocked_east
.tree_not_opaque_east
		cmp.l	#16<<block_shift,d1
		blt.s	.not_blocked_east
		cmp.l	#21<<block_shift,d1
		ble.s	.blocked_east
.not_blocked_east
		add.w	#map_cell_size,expl_posn(a0)
		bra	.end_move
.blocked_east	moveq.l	#-1,d0			;flag check decay
		bra	.end_move
.not_east
		cmpi.b	#2,expl_direction(a0)
		bne.s	.not_south
		move.l	map_cell_size*MAP_WIDTH(a2),d1
		cmpi.l	#keep_opaque_bit,d1
		beq	.kill_fireball
		btst.l	#opaque_bit_num,d1
		bne.s	.blocked_south
		btst.l	#block_here_bit_num,d1
		beq.s	.not_blocked_south
		and.l	#keep_block,d1
		bclr.l	#block_here_bit_num,d1
		tst.b	locn_style(a3)
		beq.s	.tree_not_opaque_south
		cmpi.b	#2,locn_style(a3)
		beq.s	.tree_not_opaque_south
		cmp.l	#4<<block_shift,d1
		beq.s	.blocked_south
.tree_not_opaque_south
		cmp.l	#16<<block_shift,d1
		blt.s	.not_blocked_south
		cmp.l	#21<<block_shift,d1
		ble.s	.blocked_south
.not_blocked_south
		add.w	#map_cell_size*MAP_WIDTH,expl_posn(a0)
		bra	.end_move
.blocked_south	moveq.l	#-1,d0			;flag check decay
		bra	.end_move
.not_south
		cmpi.b	#3,expl_direction(a0)
		bne.s	.not_west
		move.l	-map_cell_size(a2),d1
		cmpi.l	#keep_opaque_bit,d1
		beq	.kill_fireball
		btst.l	#opaque_bit_num,d1
		bne.s	.blocked_west
		btst.l	#block_here_bit_num,d1
		beq.s	.not_blocked_west
		and.l	#keep_block,d1
		bclr.l	#block_here_bit_num,d1
		tst.b	locn_style(a3)
		beq.s	.tree_not_opaque_west
		cmpi.b	#2,locn_style(a3)
		beq.s	.tree_not_opaque_west
		cmp.l	#4<<block_shift,d1
		beq.s	.blocked_west
.tree_not_opaque_west
		cmp.l	#16<<block_shift,d1
		blt.s	.not_blocked_west
		cmp.l	#21<<block_shift,d1
		ble.s	.blocked_west
.not_blocked_west
		sub.w	#map_cell_size,expl_posn(a0)
		bra	.end_move
.blocked_west	moveq.l	#-1,d0			;flag check decay
		bra	.end_move
.not_west
		cmpi.b	#4,expl_direction(a0)
		bne.s	.not_down
		move.l	(a2),d1
		btst.l	#floor_here_bit_num,d1
		bne	.blocked_down
		move.l	-map_cell_size*MAP_WIDTH*MAP_DEPTH(a2),d1
		cmpi.l	#keep_opaque_bit,d1
		beq	.kill_fireball
		btst.l	#opaque_bit_num,d1
		bne.s	.blocked_down
		btst.l	#block_here_bit_num,d1
		beq.s	.not_blocked_down
		and.l	#keep_block,d1
		bclr.l	#block_here_bit_num,d1
		tst.b	locn_style(a3)
		beq.s	.tree_not_opaque_down
		cmpi.b	#2,locn_style(a3)
		beq.s	.tree_not_opaque_down
		cmp.l	#4<<block_shift,d1
		beq.s	.blocked_down
.tree_not_opaque_down
		cmp.l	#16<<block_shift,d1
		blt.s	.not_blocked_down
		cmp.l	#21<<block_shift,d1
		ble.s	.blocked_down
.not_blocked_down
		sub.w	#map_cell_size*MAP_WIDTH*MAP_DEPTH,expl_posn(a0)
		bra.s	.end_move
.blocked_down	moveq.l	#-1,d0			;flag check decay
		bra	.end_move
.not_down
		cmpi.b	#5,expl_direction(a0)
		bne.s	.not_up
		move.l	map_cell_size*MAP_WIDTH*MAP_DEPTH(a2),d1
		btst.l	#floor_here_bit_num,d1
		bne	.blocked_up
		cmpi.l	#keep_opaque_bit,d1
		beq	.kill_fireball
		btst.l	#opaque_bit_num,d1
		bne.s	.blocked_up
		btst.l	#block_here_bit_num,d1
		beq.s	.not_blocked_up
		and.l	#keep_block,d1
		bclr.l	#block_here_bit_num,d1
		tst.b	locn_style(a3)
		beq.s	.tree_not_opaque_up
		cmpi.b	#2,locn_style(a3)
		beq.s	.tree_not_opaque_up
		cmp.l	#4<<block_shift,d1
		beq.s	.blocked_up
.tree_not_opaque_up
		cmp.l	#16<<block_shift,d1
		blt.s	.not_blocked_up
		cmp.l	#21<<block_shift,d1
		ble.s	.blocked_up
.not_blocked_up
		add.w	#map_cell_size*MAP_WIDTH*MAP_DEPTH,expl_posn(a0)
		bra	.end_move
.blocked_up	moveq.l	#-1,d0			;flag check decay
.not_up


.end_move	tst.w	d0
		beq.s	.not_vanish
		move.w	variables+random_num(a5),d0
		mulu	#47,d0
		rol.w	#7,d0
		move.w	d0,variables+random_num(a5)
		andi.w	#%111,d0
		cmp.w	#5,d0
                ble.s	.dir_ok
		lsr.w	#1,d0
.dir_ok
                tst.b	expl_decay(a0)
		beq.s	.no_flameback
		move.b	expl_flameback(a0),d1
		bmi.s	.no_flameback
		cmp.b	d0,d1
		bne.s	.no_flameback
		add.b	#2,d0
		andi.b	#%11,d0
.no_flameback
		move.b	d0,expl_direction(a0)

                cmpi.b	#1,expl_decay(a0)
		bne.s	.not_decay
		subi.b	#1,expl_density(a0)
		bmi	.kill_fireball
		bsr	.do_explosion
.not_decay
		cmpi.b	#2,expl_decay(a0)
		bne.s	.not_vanish
		bsr	.do_explosion
		bra	.kill_fireball
.not_vanish
		move.l	a1,a2
		moveq.l	#0,d0
		add.w	expl_posn(a0),d0	;new position
		add.l	d0,a2

		bsr	fball_hits

		moveq.l	#0,d0
		move.b	expl_density(a0),d0
		move.w	#32-explosion_shift,d1
		ror.l	d1,d0
		or.l	#keep_explosion_here_bit,d0
		and.l	#erase_explosion,(a2)
		or.l	d0,(a2)

.skip_fireball	addi.b	#1,expl_count(a0)

.next_entry	lea	expl_size(a0),a0
		dbf	d7,.next_explosion

.end_of_expls	rts

.kill_fireball	clr.w	expl_posn(a0)
		bra	.next_entry

;-------------------------------------------------------------------------------

.do_explosion	tst.l	exchip_mem_base
		beq.s	.no_ex_expl
		cmpi.b	#3,expl_density(a0)
		bne.s	.not_3b
		move.w	#316,d3
                bra.s	.ex_expl
.not_3b		cmpi.b	#2,expl_density(a0)
		bne.s	.not_2b
		move.w	#296,d3
                bra.s	.ex_expl
.not_2b		cmpi.b	#1,expl_density(a0)
		bne.s	.not_1b
		move.w	#276,d3
                bra.s	.ex_expl
.not_1b		move.w	#256,d3

.ex_expl	moveq.l	#0,d4
		move.w	expl_posn(a0),d4
		PLAY_EX_SAMPLE_MEM #26,#2,d3,d4
		rts
.no_ex_expl
		move.w	expl_posn(a0),variables+fx_position(a5)
		move.b	#7,variables+fx_sample(a5)
		move.w	#2,variables+fx_channel(a5)

		cmpi.b	#3,expl_density(a0)
		bne.s	.not_3
		move.w	#700,variables+fx_period(a5)
		rts
.not_3
		cmpi.b	#2,expl_density(a0)
		bne.s	.not_2
		move.w	#650,variables+fx_period(a5)
		rts
.not_2
		cmpi.b	#1,expl_density(a0)
		bne.s	.not_1
		move.w	#600,variables+fx_period(a5)
		rts
.not_1
		move.w	#550,variables+fx_period(a5)
		rts

;-------------------------------------------------------------------------------

fball_hits
		move.l	a2,a3
		bsr	trigger_mine

		move.l	#locn+locn_style,a3
		add.l	a5,a3
		cmp.b	#4,(a3)
		beq.s	.no_aux
		move.l	(a2),d0
		and.l	#keep_aux,d0
		beq.s	.no_aux
		cmp.l	#(0<<aux_shift)!keep_aux_here_bit,d0
		bne.s	.no_aux
		bsr	.hatch_egg
.no_aux
		movem.l	a0-a4,-(sp)
		move.l	(a2),d0
		jsr	find_heads_owner
		tst.w	d2
		bmi.s   .no_player
		moveq.l	#0,d0
		move.b	expl_density(a0),d0
		addq.w	#1,d0
		mulu	#4000,d0
		move.l	a4,a0
		mulu	#stats_struct_size,d2
		lea	global_vars+player1_stats(a5),a1
		add.w	d2,a1
		cmpi.w	#86,spell_shield(a0)
		bne.s	.no_fireshield
		lsr.l	#3,d0
.no_fireshield
		move.l	d0,-(sp)
		jsr	damage_fitness
		move.l	(sp)+,d0
		move.l	a0,a2
		jsr	damage_inventory
.no_player	movem.l	(sp)+,a0-a4

		movem.l	a0-a4,-(sp)
		move.l	(a2),d0
		and.l	#keep_block,d0
		cmp.l	#(24<<block_shift)!keep_block_here_bit,d0
		blt.s	.no_sentry
		cmp.l	#(27<<block_shift)!keep_block_here_bit,d0
		bgt.s	.no_sentry
		move.l	(a2),d0
		andi.l	#keep_variant_sentry,d0
		move.w	#32-variant_shift,d2
		rol.l	d2,d0
		mulu	#sn_struct_size,d0
		lea	variables+sentries(a5),a0
		add.l	d0,a0
		moveq.l	#0,d0
		move.b	expl_density(a0),d0
		addq.w	#1,d0
		mulu	#5500,d0
		jsr	damage_sentry_fitness
.no_sentry	movem.l	(sp)+,a0-a4

		movem.l	a0-a4,-(sp)
		move.l	(a2),d0
		jsr	find_monsters_owner
		tst.w	d2
		bmi.s   .no_monster
		moveq.l	#0,d0
		move.b	expl_density(a0),d0
		addq.w	#1,d0
		mulu	#7000,d0
		move.l	a4,a0
		move.l	monster_type(a0),a2
		jsr	damage_monster_fitness
.no_monster	movem.l	(sp)+,a0-a4

		rts

;-------------------------------------------------------------------------------

.hatch_egg	movem.l	a0-a2/d0-d5,-(sp)

		move.l	a2,d5
		sub.l	#map+map_data1,d5
		sub.l	a5,d5
		divu	#map_cell_size*MAP_WIDTH*MAP_DEPTH,d5
		move.w	d5,d4
		swap	d5
		ext.l	d5
		divu	#map_cell_size*MAP_WIDTH,d5
		move.w	d5,d6
		swap	d5
		lsr.w	#2,d5

		movem.l	a0/a2,-(sp)

		moveq.l	#-1,d0
		move.l	a2,a1
		move.l	a2,a0

		add.l	#map_part_size,a0
		move.l	(a0),d2
		and.l	#keep_hatch_time,d2
		cmp.l	#(4093<<hatch_time_shift),d2
		beq.s	.hatch_no_monster		;branch if egg empty
		move.l	(a0),d2
		and.l	#keep_aux_data,d2

		move.l	a1,a0
		jsr	add_monster
.hatch_no_monster
		movem.l	(sp)+,a0/a2

		tst.l	d0
		bne.s	.hatch_too_many_monsters	;branch if 32 monsters out already

		and.l	#erase_aux,(a1)
		or.l	#(1<<aux_shift)!keep_aux_here_bit,(a1)	;change to an open egg
		add.l	#map_part_size,a1
		and.l	#erase_aux_data,(a1)
.hatch_too_many_monsters

		movem.l	(sp)+,a0-a2/d0-d5
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;Find door at position a3 and open it.
;INPUT:		a5=base address of fast memory (long)
;		a0=address of player struct (long, 0=monster)
;		a3=address of door (long)
;OUTPUT:	none
;CHANGES:	none
open_door
		movem.l	d0-d6/a1-a3,-(sp)

		move.l	#map,a1
		add.l   a5,a1
		add.l	#map_data1,a1

		suba.l	a1,a3

		lea	map+doors(a5),a1
		move.w	#31,d3

.next_door
		tst.w	door_posn(a1)
		beq	.not_found_door

		moveq.l	#0,d0
		move.w	door_posn(a1),d0
		cmp.l	d0,a3
		bne	.not_found_door

		cmp.b	#-1,door_button_only(a1)
		bne.s	.not_button_only
		tst.b	door_direction(a0)
		bne	.not_locked
		clr.b	lock_key(a0)
		bra.s	.do_lock2
.not_button_only
		cmp.l	#0,a0
		beq	.monster
		move.b	#1,door_trig(a1)

		cmp.b	#3,door_direction(a1)
		bne	.not_locked
		move.b	door_key(a1),d0
		beq.s	.do_lock
		tst.b	cheat_mode2
		bne.s	.unlock
		jsr	carrying_item
		cmpa.l  #0,a2
		bne.s	.unlock

.do_lock	move.b	door_key(a1),lock_key(a0)
.do_lock2	move.w	#100,lock_count(a0)
		st.b	variables+redraw_flag(a5)
		bra.s	.not_locked

.unlock		move.w	#100,used_count(a0)
		move.b	door_key(a1),used_key(a0)
		clr.b	door_direction(a1)

		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a1
		add.w	d1,a1
		INCR_EXP #EXP_UNLOCK,experience(a1)

		tst.b	cheat_mode2
		bne.s	.unlock2
		jsr	remove_item
.unlock2
		PLAY_EX_SAMPLE #17,#1,#63,#136

.not_locked	movem.l	(sp)+,d0-d6/a1-a3
		rts

.monster	tst.b	door_trig(a1)
		bne.s	.end
		move.b	#1,door_trig(a1)
.end		movem.l	(sp)+,d0-d6/a1-a3
		rts

.not_found_door
		lea	door_size(a1),a1
		dbf	d3,.next_door

.end_of_doors
		movem.l	(sp)+,d0-d6/a1-a3
		rts


********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5.l=base address of fast memory
;		a3.l=address of fireball
;		d0.b=direction
;		d1.b=speed
;		d3.b=fireball density
;		d4.b=decay
;		d5.b=flameback direction
;OUTPUT:	none
;CHANGES:	a1,a3,d0,d6

add_fireball	movem.l	d0-d6/a0-a3,-(sp)

		move.l	#map+map_data1,a1
		add.l   a5,a1
		suba.l	a1,a3

		lea	map+explosions(a5),a1
		move.w	#31,d6

.next_expl	tst.w	expl_posn(a1)
		bne.s	.occupied

		move.w	a3,expl_posn(a1)
		move.b	d0,expl_direction(a1)
		move.b	d1,expl_speed(a1)
		clr.b	expl_count(a1)
		move.b	#9,expl_colour(a1)
		move.b	d3,expl_density(a1)
		move.b	d4,expl_decay(a1)
		tst.b	d5
		bmi.s	.fl
		add.b	#2,d5
		andi.w	#%11,d5
.fl		move.b	d5,expl_flameback(a1)
		clr.w	expl_damage(a1)

		move.l	a3,a2
		add.l	#map+map_data1,a2
		add.l   a5,a2
		move.l	a1,a0
		bsr	fball_hits

		moveq.l	#0,d0
		move.b	expl_density(a0),d0
		move.w	#32-explosion_shift,d1
		ror.l	d1,d0
		or.l	#keep_explosion_here_bit,d0
		and.l	#erase_explosion,(a2)
		or.l	d0,(a2)

		st.b	variables+redraw_flag(a5)

		movem.l	(sp)+,d0-d6/a0-a3
		rts

.occupied	lea	expl_size(a1),a1
		dbf	d6,.next_expl

.end_of_expls	movem.l	(sp)+,d0-d6/a0-a3
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5.l=base address of fast memory
;		a3.l=address of grenade
;		a2.l=grenade structure
;		a0.l=player_structure
;		d0.b=direction
;		d1.w=yvel
;		d2.w=height (0-31)
;		d3.w=xvel
;OUTPUT:	none
;CHANGES:	a1,a3,d0,d5
add_grenade
		movem.l	d5/a1-a4,-(sp)

		move.l	a3,a4
		sub.l	#map+map_data1,a3
		sub.l	a5,a3

		move.l	(a4),d5
		and.l	#keep_block,d5
		cmp.l	#(22<<block_shift)!keep_block_here_bit,d5
		beq	.end
		cmp.l	#(23<<block_shift)!keep_block_here_bit,d5
		beq	.end

		lea	variables+grenades(a5),a1
		move.w	#NUM_GRENADES-1,d5

.next_gr	tst.l	gr_address(a1)
		bne.s	.occupied

		move.l	a3,gr_address(a1)
		move.b	d0,gr_direction(a1)
		move.w	d1,gr_yvel(a1)
		move.w	d2,gr_height(a1)
		move.w	d3,gr_xvel(a1)
		move.b	player_num+1(a0),gr_owner(a1)
		move.b	itemgrenade_firenorth(a2),gr_firenorth(a1)
		move.b	itemgrenade_fireeast(a2),gr_fireeast(a1)
		move.b	itemgrenade_firesouth(a2),gr_firesouth(a1)
		move.b	itemgrenade_firewest(a2),gr_firewest(a1)
		move.b	itemgrenade_fireup(a2),gr_fireup(a1)
		move.b	itemgrenade_firedown(a2),gr_firedown(a1)
		move.w	itemgrenade_radius(a2),gr_radius(a1)
		move.b	itemgrenade_type(a2),gr_type(a1)

		move.l	(a4),d5
		btst.l	#block_here_bit_num,d5
		bne.s	.explode
		btst.l	#opaque_bit_num,d5
		bne.s	.explode
		bsr	put_grenade_in_map
.explode
		movem.l	(sp)+,d5/a1-a4
		moveq.l	#0,d0
		rts

.occupied	lea	gr_struct_size(a1),a1
		dbf	d5,.next_gr

.end		movem.l	(sp)+,d5/a1-a4
		moveq.l	#-1,d0
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a5.l=base address of fast memory
;		a1.l=sentry item struture
;		a2.l=mem position
;		d0.b=direction
;		d1.b=type (item number)
;		d2.b=owner (1-4, 0=none)
;OUTPUT:        d0.l=0=ok,-1=failed
;CHANGES:	a1,a3,d0,d5
add_sentry
		movem.l	d5-d6/a1-a3,-(sp)

		move.l	(a2),d5
		btst.l	#block_here_bit_num,d5
		bne	.end
		btst.l	#opaque_bit_num,d5
		bne.s	.end

		sub.l	#map+map_data1,a2
		sub.l	a5,a2

		lea	variables+sentries(a5),a3
		move.w	#NUM_SENTRIES-1,d5
		moveq.l	#0,d6

.next_gr	tst.l	sn_address(a3)
		bne.s	.occupied

		move.b	d6,sn_num(a3)
		clr.b	sn_white(a3)
		move.l	a2,sn_address(a3)
		move.b	d0,sn_direction(a3)
		move.b	d1,sn_type(a3)
		move.b	d2,sn_owner(a3)
		move.w	itemsentry_delay(a1),sn_delay(a3)
		move.w	itemsentry_rounds(a1),sn_rounds(a3)
		move.w	itemsentry_physique(a1),sn_physique(a3)
		move.w	#65535,sn_fitness(a3)
		move.w	#50,sn_turn_count(a3)
		move.b	itemsentry_turn_flag(a1),sn_turn_flag(a3)
		move.b	itemsentry_shoot_players_flag(a1),sn_shoot_players_flag(a3)
		move.b	itemsentry_range(a1),sn_range(a3)
		move.b	itemsentry_density(a1),sn_density(a3)

		move.l	a3,a1
		bsr	put_sentry_in_map

		movem.l	(sp)+,d5-d6/a1-a3
		moveq.l	#0,d0
		rts

.occupied	lea	sn_struct_size(a3),a3
		addq.w	#1,d6
		dbf	d5,.next_gr

.end		movem.l	(sp)+,d5-d6/a1-a3
		moveq.l	#-1,d0
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		d0=map block code (word)
;OUTPUT:        d2=sentry number (word, -1 if not found)
;		a4=address of sentry structure if found (long)
;CHANGES:    	none

find_sentries_owner
		btst.l	#block_here_bit_num,d0
		bne.s	.block_here
.not_sentry	moveq.l	#-1,d2
		rts

.block_here	move.w	#block_shift,d1
		move.l	d0,d2
		and.l	#keep_block,d2
		ror.l	d1,d2

		cmpi.b	#24,d2
		blt.s	.not_sentry
		cmpi.b	#27,d2
		bgt.s	.not_sentry

		and.l	#keep_variant_sentry,d0
		move.w	#32-variant_shift,d1
		rol.l	d1,d0
		move.l	d0,d2

                mulu	#sn_struct_size,d0
		lea	variables+sentries(a5),a4
		add.w	d0,a4

		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT		a5=base address of fast memory (long)
;		a1=address of sentry struct (long)
;OUTPUT:	none
;CHANGES:       none

put_sentry_in_map
		movem.l	d0-d2/a2,-(sp)

		move.l	sn_address(a1),a2
		add.l	#map+map_data1,a2
		add.l   a5,a2

		and.l	#erase_block,(a2)
		and.l	#erase_variant,(a2)

		moveq.l	#0,d0
		move.b	sn_num(a1),d0
		tst.b	sn_white(a1)
		beq.s	.not_white
		addi.w	#16,d0
.not_white	move.w	#variant_shift,d2
		rol.l	d2,d0

		moveq.l	#24,d1
		add.b	sn_direction(a1),d1
		move.w	#block_shift,d2
		rol.l	d2,d1

		or.l	d1,d0
		or.l	#keep_block_here_bit,d0

		or.l	d0,(a2)

		st.b	variables+redraw_flag(a5)

		movem.l	(sp)+,d0-d2/a2
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:       none

sentries_fall
		lea	variables+sentries(a5),a1
		move.w	#NUM_SENTRIES-1,d5

.loop		tst.l	sn_address(a1)
		beq	.no_sentry

		move.l	sn_address(a1),a3
		add.l	#map+map_data1,a3
		add.l	a5,a3

		btst.b	#floor_here_bit_num,3(a3)
		bne.s	.no_fall

		move.l	-map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),d1
		and.l	#keep_block,d1
		beq.s	.fall
		cmp.l	#(8<<block_shift)!keep_block_here_bit,d1
		blt.s	.no_fall
		cmp.l	#(47<<block_shift)!keep_block_here_bit,d1
		bgt.s	.no_fall
		cmp.l	#(16<<block_shift)!keep_block_here_bit,d1
		blt	.squash_monster
		cmp.l	#(32<<block_shift)!keep_block_here_bit,d1
		bge	.squash_player
		cmp.l	#(22<<block_shift)!keep_block_here_bit,d1
		blt.s	.no_fall
		cmp.l	#(27<<block_shift)!keep_block_here_bit,d1
		bgt.s	.no_fall
		cmp.l	#(24<<block_shift)!keep_block_here_bit,d1
		bge	.squash_sentry
		bra.s	.no_fall
.fall
		move.l	(a3),d1
		and.l	#keep_block!keep_variant,d1
		and.l	#erase_block&erase_variant,(a3)
		and.l	#erase_block&erase_variant,-map_cell_size*MAP_WIDTH*MAP_DEPTH(a3)
		or.l	d1,-map_cell_size*MAP_WIDTH*MAP_DEPTH(a3)
		sub.l	#map_cell_size*MAP_WIDTH*MAP_DEPTH,sn_address(a1)

		st.b	variables+redraw_flag(a5)	;set redraw flag
.no_fall
.no_sentry	add.l	#sn_struct_size,a1
		dbf	d5,.loop
		rts

;-------------------------------------------------------------------------------

.squash_monster
		movem.l	d5/a0-a1/a2-a4,-(sp)

		lea	-map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a2
		jsr	find_monsters_owner
		tst.l	d2
		bmi.s	.no_monster

		move.l	a4,a0
		move.l	monster_type(a4),a2
		move.l	#2500,d0
		lsl.l	#6,d0
		jsr	damage_monster_fitness

.no_monster	movem.l	(sp)+,d5/a0-a1/a2-a4
		bra.s	.no_fall

;-------------------------------------------------------------------------------

.squash_player
		movem.l	d5/a0-a1/a3-a4,-(sp)

		move.l	-map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),d0
		bsr	find_heads_owner
		tst.l	d2
		bmi.s	.no_head

		move.l	a3,a1
		move.l	a4,a0
		move.l	#2500,d0
		jsr	damage_fitness

.no_head	movem.l	(sp)+,d5/a0-a1/a3-a4
		bra.s	.no_fall

;-------------------------------------------------------------------------------

.squash_sentry
		movem.l	d5/a0-a1/a3-a4,-(sp)

		move.l	-map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),d0
		bsr	find_sentries_owner
		tst.l	d2
		bmi.s	.no_sentry2

		move.l	a4,a0
		move.l	#2500,d0
		jsr	damage_sentry_fitness

.no_sentry2	movem.l	(sp)+,d5/a0-a1/a3-a4
		bra.s	.no_fall

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:       none

move_sentries
		lea	variables+sentries(a5),a1
		move.w	#NUM_SENTRIES-1,d5

.loop		tst.l	sn_address(a1)
		beq	.no_sentry

		tst.w	sn_delay(a1)
		beq.s	.no_delay
		subi.w	#10,sn_delay(a1)
		bgt.s	.next
		clr.w	sn_delay(a1)
		moveq.l	#0,d0
		move.b	sn_owner(a1),d0
		beq.s	.no_delay
		subq.w	#1,d0
		mulu	#player_struct_size,d0
		lea	variables+player1(a5),a0
		add.l	d0,a0
		move.w	#150,active_count(a0)
.no_delay
		move.l	sn_address(a1),a3
		add.l	#map+map_data1,a3
		add.l	a5,a3

		tst.b	sn_turn_flag(a1)
		beq.s	.no_turning
		tst.w	sn_turn_count(a1)
		bne.s	.dont_turn
		move.b	sn_direction(a1),d0
		add.b	#1,d0
		cmpi.b	#4,d0
		blt.s	.not_wrapped
                clr.b	d0
.not_wrapped	move.b	d0,sn_direction(a1)
		move.w	#60,sn_turn_count(a1)
.dont_turn	subi.w	#10,sn_turn_count(a1)
.no_turning
		bsr	sentry_fire

.next		tst.b	sn_white(a1)
		beq.s	.not_white
		sf.b	sn_white(a1)
		st.b	variables+redraw_flag(a5)
.not_white
		bsr	put_sentry_in_map

.no_sentry	lea	sn_struct_size(a1),a1
		dbf	d5,.loop
		rts

sentry_fire
		move.b	sn_direction(a1),d1
		move.l	a3,a2

		tst.b	d1
		bne.s	.not_north
		move.w	#-map_cell_size*MAP_WIDTH,d0
		bra.s   .cont
.not_north	cmpi.b	#1,d1
		bne.s	.not_east
		move.w	#map_cell_size,d0
		bra.s	.cont
.not_east	cmpi.b	#2,d1
		bne.s	.not_south
		move.w	#map_cell_size*MAP_WIDTH,d0
		bra.s	.cont
.not_south	cmpi.b	#3,d1
		bne.s	.not_west
		move.w	#-map_cell_size,d0
		bra.s	.cont
.not_west

.cont		moveq.l	#0,d2
		move.b  sn_range(a1),d2

.loop		add.w	d0,a2
		move.l	(a2),d1

		btst.l	#block_here_bit_num,d1
		beq	.no_block

		move.w	#block_shift,d3
		and.l	#keep_block,d1
		ror.l	d3,d1

		cmpi.b	#4,d1
		beq.s	.no_block
		cmpi.b	#5,d1
		beq.s	.no_block
		cmpi.b	#7,d1
		beq.s	.no_block

		cmpi.b	#8,d1
		blt.s	.end
		cmpi.b	#15,d1
		bgt.s	.not_monster
		bra.s	.fire
.not_monster
		tst.b	sn_shoot_players_flag(a1)
		beq.s	.end

		cmpi.b	#32,d1
		blt.s	.end
		cmpi.b	#47,d1
		bgt.s	.end

.fire		move.l	sn_address(a1),d0
		PLAY_EX_SAMPLE_MEM #8,#1,#95,d0

		movem.l	a0-a3/d1-d5,-(sp)
		move.b	sn_direction(a1),d0		;direction
		move.b	#1,d1				;speed
		move.b	#EXPL_DECAY,d4			;decay on
		move.b	sn_density(a1),d3		;density
		subi.b	#1,d3
		move.b	d0,d5				;no flameback
		bsr	chuck_fireball
		movem.l	(sp)+,a0-a3/d1-d5
		moveq.l	#-1,d0				;fireball fired
		rts

.no_block	dbf	d2,.loop

.end		moveq.l	#0,d0			;no fireball fired
		rts

********************************************************************************
;a0=sentry struct
damage_sentry_fitness
		move.w	sn_physique(a0),d1
		divu	d1,d0
		mulu	#100,d0
		jsr	decr_sentry_fitness	;damage = ( hit / physique ) * 100
		rts

;a0=sentry struct
decr_sentry_fitness
		move.l	a3,-(sp)

		move.l	sn_address(a0),a3
		add.l	#map+map_data1,a3
		add.l	a5,a3

		st.b	sn_white(a0)
		or.l	#(16<<variant_shift),(a3)
		st.b	variables+redraw_flag(a5)

		moveq.l	#0,d1
		move.w	sn_fitness(a0),d1
		cmp.l	d1,d0
		bls.s	.not_dead
		moveq.l	#0,d0

		clr.l	sn_address(a0)
		and.l	#erase_person,(a3)

.not_dead	sub.w	d0,sn_fitness(a0)
		move.l	(sp)+,a3
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:       none

move_grenades
		lea	variables+grenades(a5),a1
		move.w	#NUM_GRENADES-1,d5

.loop		move.l	gr_address(a1),d0
		beq	.no_grenade

		move.l	d0,a3
		add.l	#map+map_data1,a3
		add.l	a5,a3

		move.l	(a3),d1
		and.l	#keep_block,d1
		tst.b	gr_type(a1)
		bne.s	.stun
		cmp.l	#(22<<block_shift)!keep_block_here_bit,d1
		bne	.explosion
		bra.s	.skip_stun
.stun		cmp.l	#(23<<block_shift)!keep_block_here_bit,d1
		bne	.explosion
.skip_stun
		and.l	#erase_block&erase_opaque_bit&erase_variant,(a3)

		moveq.l	#0,d1
		tst.w	gr_xvel(a1)
		beq.s	.no_x_move

		move.b	gr_direction(a1),d0
		tst.b	d0
		bne.s	.not_north
		move.w	#-map_cell_size*MAP_WIDTH,d1
.not_north
		cmpi.b	#1,d0
		bne.s	.not_east
		move.w	#map_cell_size,d1
.not_east
		cmpi.b	#2,d0
		bne.s	.not_south
		move.w	#map_cell_size*MAP_WIDTH,d1
.not_south
		cmpi.b	#3,d0
		bne.s	.not_west
		move.w	#-map_cell_size,d1
.not_west
		subi.w	#1,gr_xvel(a1)
.no_x_move

.retest_height	tst.w   gr_height(a1)
		bpl.s	.no_falling
		btst.b	#floor_here_bit_num,3(a3)
		bne	.explosion
		add.w	#-map_cell_size*MAP_WIDTH*MAP_DEPTH,d1
		add.w	#32,gr_height(a1)
		bra.s	.retest_height
.no_falling
		move.l	0(a3,d1.w),d2
		btst.l	#opaque_bit_num,d2
		bne	.explosion
		and.l	#keep_block,d2
		cmp.l	#(16<<block_shift)!keep_block_here_bit,d2
		blt.s	.ok
		cmp.l	#(21<<block_shift)!keep_block_here_bit,d2
		ble.s	.explosion
.ok
		ext.l	d1
		add.l	d1,gr_address(a1)
		add.l	d1,a3

		tst.l	d2
		bne.s	.explosion

		move.l	#locn+locn_style,a2
		add.l	a5,a2
		cmp.b	#4,(a2)
		beq.s	.too_high_for_egg
		move.w	gr_height(a1),d0
		andi.w	#%11111,d0
		cmp.w	#16,d0
		bgt.s	.too_high_for_egg
		move.l	(a3),d0
		and.l	#keep_aux,d0
		beq.s	.too_high_for_egg
		cmp.l	#(0<<aux_shift)!keep_aux_here_bit,d0
		bne.s   .too_high_for_egg
		and.l	#erase_aux,(a3)
		or.l	#(1<<aux_shift)!keep_aux_here_bit,(a3)
		bra.s	.explosion
.too_high_for_egg

		st.b	variables+redraw_flag(a5)
		bsr	put_grenade_in_map
.no_grenade
		move.w	gr_yvel(a1),d2
		cmpi.w	#-1000,d2
		beq.s	.no_out_range
		add.w	d2,gr_height(a1)
		sub.w	#8,gr_yvel(a1)
		cmpi.w	#-16,gr_yvel(a1)
		bge.s	.no_out_range
		move.w	#-16,gr_yvel(a1)
.no_out_range

.next		lea	gr_struct_size(a1),a1
		dbf	d5,.loop
		rts

;-------------------------------------------------------------------------------

.explosion	st.b	variables+redraw_flag(a5)

		move.l	d5,-(sp)

		move.b	#1,d1			;speed
		move.b	#EXPL_VANISH,d4
		move.b	#-1,d5			;flameback

		move.l	a1,-(sp)
		lea	gr_firenorth(a1),a1
		bsr	add_fireballs
		move.l	(sp)+,a1

		tst.b	gr_type(a1)
		beq.s	.not_stun

		move.b	#20,shake_power(a5)
		move.b	#0,shake_x(a5)
		move.b	#0,shake_y(a5)
		move.b	#0,shake_z(a5)

		move.w	gr_address+2(a1),variables+fx_position(a5)
		move.b	#7,variables+fx_sample(a5)
		move.w	#0,variables+fx_channel(a5)
		move.w	#550,variables+fx_period(a5)
		bra	.end

.not_stun
		move.b	#17,shake_power(a5)
		move.b	#0,shake_x(a5)
		move.b	#0,shake_y(a5)
		move.b	#0,shake_z(a5)

		move.l	#240000,d3
		lea	(a3),a2
		bsr	.wound
		move.l	#160000,d3
		lea	-map_cell_size*MAP_WIDTH(a3),a2	;north
		bsr	.wound
		lea	map_cell_size*MAP_WIDTH(a3),a2	;south
		bsr	.wound
		lea	map_cell_size(a3),a2		;east
		bsr	.wound
		lea	-map_cell_size(a3),a2		;west
		bsr	.wound
		lea	map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a2	;up
		bsr	.wound
		lea	-map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a2	;down
		bsr	.wound
		move.l	#100000,d3
		lea	-map_cell_size-map_cell_size*MAP_WIDTH(a3),a2	;north west
		bsr	.wound
		lea	map_cell_size-map_cell_size*MAP_WIDTH(a3),a2	;north east
		bsr	.wound
		lea	-map_cell_size+map_cell_size*MAP_WIDTH(a3),a2	;south west
		bsr	.wound
		lea	map_cell_size+map_cell_size*MAP_WIDTH(a3),a2	;south east
		bsr	.wound
		lea	-map_cell_size*MAP_WIDTH+map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a2	;north up
		bsr	.wound
		lea	-map_cell_size+map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a2			;west up
		bsr	.wound
		lea	map_cell_size+map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a2			;east up
		bsr	.wound
		lea	map_cell_size*MAP_WIDTH+map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a2	;south up
		bsr	.wound
		lea	-map_cell_size*MAP_WIDTH-map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a2	;north down
		bsr	.wound
		lea	-map_cell_size-map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a2			;west down
		bsr	.wound
		lea	map_cell_size-map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a2			;east down
		bsr	.wound
		lea	map_cell_size*MAP_WIDTH-map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a2	;south down
		bsr	.wound
		move.l	#60000,d3
		lea	-map_cell_size-map_cell_size*MAP_WIDTH+map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a2	;north west up
		bsr	.wound
		lea	map_cell_size-map_cell_size*MAP_WIDTH+map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a2	;north east up
		bsr	.wound
		lea	-map_cell_size+map_cell_size*MAP_WIDTH+map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a2	;south west up
		bsr	.wound
		lea	map_cell_size+map_cell_size*MAP_WIDTH+map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a2	;south east up
		bsr	.wound
		lea	-map_cell_size-map_cell_size*MAP_WIDTH-map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a2	;north west down
		bsr	.wound
		lea	map_cell_size-map_cell_size*MAP_WIDTH-map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a2	;north east down
		bsr	.wound
		lea	-map_cell_size+map_cell_size*MAP_WIDTH-map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a2	;south west down
		bsr	.wound
		lea	map_cell_size+map_cell_size*MAP_WIDTH-map_cell_size*MAP_WIDTH*MAP_DEPTH(a3),a2	;south east down
		bsr	.wound

		move.w	gr_address+2(a1),variables+fx_position(a5)
		move.b	#7,variables+fx_sample(a5)
		move.w	#1,variables+fx_channel(a5)
		move.w	#550,variables+fx_period(a5)

.end		clr.l	gr_address(a1)
		move.l	(sp)+,d5
		bra	.next

;-------------------------------------------------------------------------------

;in: d3.l=damage, a2.l=address
.wound
		move.l	(a2),d1
		and.l	#keep_block,d1
		beq.s	.empty
		cmp.l	#(8<<block_shift)!keep_block_here_bit,d1
		blt.s	.empty
		cmp.l	#(47<<block_shift)!keep_block_here_bit,d1
		bgt.s	.empty
		cmp.l	#(32<<block_shift)!keep_block_here_bit,d1
		bge.s	wound_player
		cmp.l	#(15<<block_shift)!keep_block_here_bit,d1
		ble.s	wound_monster
		cmp.l	#(24<<block_shift)!keep_block_here_bit,d1
		blt.s	.empty
		cmp.l	#(27<<block_shift)!keep_block_here_bit,d1
		ble.s	wound_sentry
.empty		rts

;-------------------------------------------------------------------------------

wound_player
		movem.l	a0-a4,-(sp)

		move.l	(a2),d0
		bsr	find_heads_owner
		tst.l	d2
		bmi.s	.no_head

		move.l	a3,a1
		move.l	a4,a0
		move.l	d3,d0
		lsr.l	#1,d0
		jsr	damage_fitness

.no_head	movem.l	(sp)+,a0-a4
		rts

;-------------------------------------------------------------------------------

wound_monster
		movem.l	a0-a4,-(sp)

		jsr	find_monsters_owner
		tst.l	d2
		bmi.s	.no_monster

		move.l	monster_type(a4),a2

		moveq.l	#0,d1
		move.w	mdfn_physique(a2),d1
		divu	#EXP_KILL,d1

		movem.l	a1/d1,-(sp)

		move.l	a4,a0
		move.l	d3,d0
		lsl.l	#1,d0
		jsr	damage_monster_fitness

		movem.l	(sp)+,a1/d1

		tst.l	d0
		beq.s	.not_dead
		move.l	d1,d0
		moveq.l	#0,d1
		move.b	gr_owner(a1),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a2
		add.w	d1,a2
		INCR_EXP d0,experience(a2)
.not_dead

.no_monster	movem.l	(sp)+,a0-a4
		rts

;-------------------------------------------------------------------------------

wound_sentry
		movem.l	a0-a4,-(sp)

		move.l	(a2),d0
		bsr	find_sentries_owner
		tst.l	d2
		bmi.s	.no_sentry

		move.l	a4,a0
		move.l	d3,d0
		lsl.l	#1,d0
		jsr	damage_sentry_fitness

.no_sentry	movem.l	(sp)+,a0-a4
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT		a5=base address of fast memory (long)
;		a1=address of grenade struct (long)
;OUTPUT:	none
;CHANGES:       none

put_grenade_in_map
		movem.l	d0-d1/a2,-(sp)

		move.l	gr_address(a1),a2
		add.l	#map+map_data1,a2
		add.l   a5,a2

		and.l	#erase_block,(a2)
		and.l	#erase_variant,(a2)

		moveq.l	#0,d0
		move.w	gr_height(a1),d0
		andi.w	#%11111,d0
		move.w	#variant_shift,d1
		rol.l	d1,d0

		tst.b	gr_type(a1)
		beq.s	.expl
		or.l	#(23<<block_shift)!keep_block_here_bit,d0
		bra.s	.skip_expl
.expl		or.l	#(22<<block_shift)!keep_block_here_bit,d0
.skip_expl
		or.l	d0,(a2)

		st.b	variables+redraw_flag(a5)

		movem.l	(sp)+,d0-d1/a2
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT		a5=base address of fast memory (long)
;		a0=address of player struct (long)
;OUTPUT:	none
;CHANGES:	d0-d4,a0-a3

test_mine
		movem.l	d0-d5/a1-a3,-(sp)

		move.l	mem_position(a0),a3
		move.l	a3,a1
		add.l	#map_part_size*2,a1
		and.l	#erase_no_monster,(a1)

		bsr	trigger_mine

		tst.l	d0
		beq.s	.no_damage
		move.w	player_num(a0),d1
		mulu	#stats_struct_size,d1
		lea	global_vars+player1_stats(a5),a1
		add.w	d1,a1
		jsr	damage_fitness

		move.b	#15,fire_flash_dur(a0)
		move.b	#9,fire_flash(a0)
.no_damage

		movem.l	(sp)+,d0-d5/a1-a3
		rts


;in:
;a3=mem position
;out:
;d0=damage to inflict

trigger_mine	movem.l	a0-a1/d1-d5,-(sp)

		move.l	(a3),d0

		btst.l	#aux_here_bit_num,d0
		beq	.no_mine

		and.l	#keep_aux,d0
		cmpi.l	#2<<aux_shift,d0
		blt	.no_mine
		cmpi.l	#6<<aux_shift,d0
		bgt	.no_mine

		add.l	#map_part_size*2,a3
		move.l	(a3),d0
		sub.l	#map_part_size*2,a3
		and.l	#keep_item_type,d0
		beq	.no_mine

		subq.l	#1,d0
		mulu.w	#item_size,d0
		move.l	a5,a1
		add.l	#items,a1
		add.l	d0,a1

		cmpi.b	#CAT_ARMED_MINE,item_category(a1)
		bne	.no_mine

		and.l	#erase_aux,(a3)

		lea	itemmine_firenorth(a1),a1

		moveq.l	#1,d1				;speed
		moveq.l	#EXPL_DECAY,d4			;decay on
		move.b	#-1,d5				;flameback
		bsr	add_fireballs

		move.b	#17,shake_power(a5)
		move.b	#0,shake_x(a5)
		move.b	#0,shake_y(a5)
		move.b	#0,shake_z(a5)

		st.b	variables+redraw_flag(a5)	;set redraw flag

		move.l	a3,d0
		sub.l	#map_data1+map,d0
		sub.l	a5,d0
		move.w	d0,variables+fx_position(a5)
		move.b	#7,variables+fx_sample(a5)
		move.w	#0,variables+fx_channel(a5)
		move.w	#550,variables+fx_period(a5)

		moveq.l	#0,d0
		move.w	itemmine_damage(a1),d0
		lsl.l	#8,d0
		lsl.l	#3,d0

		movem.l	(sp)+,a0-a1/d1-d5
		rts

.no_mine	moveq.l	#0,d0
		movem.l	(sp)+,a0-a1/d1-d5
		rts

********************************************************************************

add_fireballs	move.l	a1,-(sp)

		move.b	(a1)+,d3			;fire north?
		beq.s	.no_front
		subi.b	#1,d3              		;density
		move.b	#0,d0				;direction
		jsr	add_fireball
.no_front
		move.b	(a1)+,d3			;fire south?
		beq.s	.no_rear
		subi.b	#1,d3              		;density
		move.b	#2,d0				;direction
		jsr	add_fireball
.no_rear
		move.b	(a1)+,d3			;fire east?
		beq.s	.no_right
		subi.b	#1,d3				;density
		move.b	#1,d0				;direction
		jsr	add_fireball
.no_right
		move.b	(a1)+,d3			;fire west?
		beq.s	.no_left
		subi.b	#1,d3              		;density
		move.b	#3,d0				;direction
		jsr	add_fireball
.no_left
		move.b	(a1)+,d3			;fire down?
		beq.s	.no_down
		subi.b	#1,d3              		;density
		move.b	#5,d0				;direction
		jsr	add_fireball
.no_down
		move.b	(a1)+,d3			;fire up?
		beq.s	.no_up
		subi.b	#1,d3              		;density
		move.b	#4,d0				;direction
		jsr	add_fireball
.no_up
		move.l	(sp)+,a1
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	d0-d4,a0-a3
players_fall
		move.l	#-MAP_WIDTH*MAP_DEPTH*map_cell_size,d1

		lea	variables+player1(a5),a0
		lea	global_vars+player1_stats(a5),a1
		bsr     .player_fall

		lea	variables+player2(a5),a0
		lea	global_vars+player2_stats(a5),a1
		bsr     .player_fall

		lea	variables+player3(a5),a0
		lea	global_vars+player3_stats(a5),a1
		bsr     .player_fall

		lea	variables+player4(a5),a0
		lea	global_vars+player4_stats(a5),a1
		bsr     .player_fall

		rts

********************************************************************************
.player_fall
		tst.w	dead_flag(a1)
		bne	.no_fall
		cmpi.w	#7,window_type(a0)
		beq	.no_fall
		tst.b	control_method(a0)
		beq	.no_fall

		move.l	mem_position(a0),a2

		move.l	(a2),d0
		and.l	#keep_water,d0
		cmp.l	#(2<<water_shift)!keep_water_here_bit,d0
		blt.s	.no_water
		tst.w	water_fall(a0)
		beq.s	.float_down
		subi.w	#1,water_fall(a0)
		clr.l	fall_damage(a0)
		bra	.no_fall
.float_down	move.w	#2,water_fall(a0)
		clr.l	fall_damage(a0)
		bra.s	.skip_water
.no_water	clr.w	water_fall(a0)
.skip_water
		move.l	(a2),d0

		btst.l	#floor_here_bit_num,d0		;any floor below?
		bne	.end_fall			;yes, then dont fall

		move.l	-2*MAP_WIDTH*MAP_DEPTH*map_cell_size(a2),d0			;get of block below
		and.l	#keep_block,d0
		cmpi.l	#(4<<block_shift)!keep_block_here_bit,d0
		beq	.block_below

		move.l	-MAP_WIDTH*MAP_DEPTH*map_cell_size(a2),d0			;get of block below

		btst.l	#block_here_bit_num,d0		;any floor below?
		bne	.block_below			;yes, then dont fall

		andi.l	#erase_person,(a2)		;remove person
		move.l	mem_position(a0),old_mem_position(a0)
		add.l	#-MAP_WIDTH*MAP_DEPTH*map_cell_size,mem_position(a0)
		sub.b	#1,floor(a0)

		move.l	fall_damage(a0),d0
		bne.s	.falling
		move.l	weight(a0),d0
		divu	agility(a1),d0
		swap	d0
		clr.w	d0
		swap	d0
		add.w	physique(a1),d0
		lsl.l	#5,d0
.falling	asl.l	#1,d0
		cmp.l	#$1000000,d0
		blt.s	.no_overflow
		move.l	#$1000000,d0
.no_overflow	move.l	d0,fall_damage(a0)

		jsr	check_pad_released
		jsr	check_pad_pushed
		jsr	test_mine
		bsr	put_head_in_map
		st.b	variables+redraw_flag(a5)	;set redraw flag
		rts

.end_fall
		move.l	fall_damage(a0),d0
		beq.s	.no_damage

		move.l	(a2),d1
		and.l	#keep_water,d1
		beq.s	.no_water2
		cmp.l	#(1<<water_shift)!keep_water_here_bit,d1
		bge.s	.skip_damage
		lsr.l	#1,d0
		cmp.l	#(1<<water_shift)!keep_water_here_bit,d1
		beq.s	.no_water2
		lsr.l	#1,d0
.no_water2
		jsr	damage_fitness
.skip_damage	clr.l	fall_damage(a0)
.no_fall
.no_damage
		move.l	(a2),d0
		and.l	#keep_water,d0
		cmp.l	#(2<<water_shift)!keep_water_here_bit,d0
		blt.s	.no_water3
		clr.l	fall_damage(a0)
.no_water3	rts

.block_below	and.l	#keep_block,d0

		movem.l	a1,-(sp)
		cmpi.l	#(6<<block_shift)!keep_block_here_bit,d0
		bne.s	.not_teleport
		andi.l	#erase_person,(a2)		;remove person
		move.l	mem_position(a0),a3
		suba.l	#MAP_WIDTH*MAP_DEPTH*map_cell_size,a3
		jsr	teleport
		bsr	put_head_in_map
		clr.l	fall_damage(a0)
		movem.l	(sp)+,a1
		rts
.not_teleport	movem.l	(sp)+,a1

		cmp.l	#(8<<block_shift)!keep_block_here_bit,d0
		blt.s	.no_squash
		cmp.l	#(47<<block_shift)!keep_block_here_bit,d0
		bgt.s   .no_squash
		cmp.l	#(16<<block_shift)!keep_block_here_bit,d0
		blt	.squash_monster
		cmp.l	#(32<<block_shift)!keep_block_here_bit,d0
		bge	.squash_player
		cmp.l	#(22<<block_shift)!keep_block_here_bit,d0
		blt.s   .no_squash
		cmp.l	#(27<<block_shift)!keep_block_here_bit,d0
		bgt.s   .no_squash
		cmp.l	#(24<<block_shift)!keep_block_here_bit,d0
		bge	.squash_sentry
.no_squash
                bra	.end_fall

;-------------------------------------------------------------------------------

.squash_monster
		movem.l	d5/a0-a1/a2-a4,-(sp)

		lea	-map_cell_size*MAP_WIDTH*MAP_DEPTH(a2),a2
		jsr	find_monsters_owner
		tst.l	d2
		bmi.s	.no_monster

		move.l	a4,a0
		move.l	monster_type(a4),a2
		move.l	#2500,d0
		lsl.l	#6,d0
		jsr	damage_monster_fitness

.no_monster	movem.l	(sp)+,d5/a0-a1/a2-a4
		bra	.no_squash

;-------------------------------------------------------------------------------

.squash_player
		movem.l	d5/a0-a1/a3-a4,-(sp)

		move.l	-map_cell_size*MAP_WIDTH*MAP_DEPTH(a2),d0
		bsr	find_heads_owner
		tst.l	d2
		bmi.s	.no_head

		move.l	a3,a1
		move.l	a4,a0
		move.l	#2500,d0
		jsr	damage_fitness

.no_head	movem.l	(sp)+,d5/a0-a1/a3-a4
		bra	.no_squash

;-------------------------------------------------------------------------------

.squash_sentry
		movem.l	d5/a0-a1/a3-a4,-(sp)

		move.l	-map_cell_size*MAP_WIDTH*MAP_DEPTH(a2),d0
		bsr	find_sentries_owner
		tst.l	d2
		bmi.s	.no_sentry2

		move.l	a4,a0
		move.l	#2500,d0
		jsr	damage_sentry_fitness

.no_sentry2	movem.l	(sp)+,d5/a0-a1/a3-a4
		bra	.no_squash

********************************************************************************
**************************** Handle Falling Blocks *****************************
********************************************************************************
;Handle falling blocks.
;INPUT		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	d0-d4,a0-a3

blocks_fall
		move.l	a4,-(sp)

		lea	map+pushables(a5),a0
		move.l	#map+map_data1,a1
		add.l   a5,a1
		move.w	#MAP_WIDTH*MAP_DEPTH*map_cell_size,d1
		neg.w	d1

		move.w	#31,d7
.next_pushable
		moveq.l	#0,d0
		move.w	pushable_posn(a0),d0
		beq.s	.next_entry

		move.l	a1,a2
		add.l	d0,a2			;address of pushable
		lea	0(a2,d1.w),a3		;address of block below
		lea	0(a3,d1.w),a4		;address of block fallen on top of
		bsr.s	.block_fall		;yes, then test for fall

		lea	pushable_size(a0),a0
		bra.s   .next_pushable
.end_of_pushables
.next_entry	dbf	d7,.next_pushable
.end		move.l	(sp)+,a4
		rts

********************************************************************************
.block_fall	move.l	(a2),d0			;pushable to fall
		move.l	(a3),d4			;block to fall into
		move.l	(a4),d2			;block fallen on top of
		move.l	pushable_cell(a0),d3	;block type to fall

		btst.l	#floor_here_bit_num,d0	;any floor below?
		bne	.end_fall		;yes, then dont fall
                btst.l	#block_here_bit_num,d4	;any block below?
		bne	.any_stairs		;yes, then dont fall

.do_fall	movem.l	a1-a3,-(sp)
		move.l	a3,a1
		move.l	a2,a3
		move.l	a0,a2
		bsr	move_a_pushable
		movem.l	(sp)+,a1-a3
		tst.l	d6
		bne.s	.end_fall

		st.b	variables+redraw_flag(a5)	;set redraw flag
		move.l	#20000,d3

		btst.l	#floor_here_bit_num,d4	;any floor to hit?
		bne.s	.sound			;yes, then play sound
		btst.l	#opaque_bit_num,d2
		bne.s	.sound
		and.l	#keep_block,d2
		beq.s	.no_sound
		cmp.l	#(8<<block_shift)!keep_block_here_bit,d2
		blt.s	.sound
		cmp.l	#(47<<block_shift)!keep_block_here_bit,d2
		bgt.s	.sound
		cmp.l	#(16<<block_shift)!keep_block_here_bit,d2
		blt	.squash_monster
		cmp.l	#(32<<block_shift)!keep_block_here_bit,d2
		bge	.squash_player
		cmp.l	#(22<<block_shift)!keep_block_here_bit,d2
		blt.s	.sound
		cmp.l	#(27<<block_shift)!keep_block_here_bit,d2
		bgt.s	.sound
		cmp.l	#(24<<block_shift)!keep_block_here_bit,d2
		bge	.squash_sentry
.no_sound
.end_fall	rts

.sound
		move.l  a2,d0
		sub.l	a5,d0
		subi.l	#map+map_data1,d0
		tst.l	exchip_mem_base
		beq.s	.no_ex
		PLAY_EX_SAMPLE_MEM #28,#1,#153,d0
		bra.s	.skip
.no_ex		move.l	#miscsfx,a2
		add.l	chip_mem_base,a2
		PLAY_SAMPLE_MEM a2,#2,#1,#600,d0
.skip
		move.b	#1,shake_power(a5)
		move.b	#0,shake_x(a5)
		move.b	#0,shake_y(a5)
		move.b	#0,shake_z(a5)

		rts

;-------------------------------------------------------------------------------

.squash_monster
		movem.l	d1/d7/a0-a1/a3-a4,-(sp)

		move.l	a4,a2
		jsr	find_monsters_owner
		tst.l	d2
		bmi.s	.no_monster

		move.l	a4,a0
		move.l	d3,d0
		jsr	decr_monster_fitness

.no_monster	movem.l	(sp)+,d1/d7/a0-a1/a3-a4
		rts

.squash_monster2
		movem.l	d1/d7/a0-a1/a2-a4,-(sp)

		move.l	a3,a2
		jsr	find_monsters_owner
		tst.l	d2
		bmi.s	.no_monster2

		move.l	a4,a0
		move.l	monster_type(a4),a2
		move.l	d3,d0
		lsl.l	#6,d0
		jsr	damage_monster_fitness

.no_monster2	movem.l	(sp)+,d1/d7/a0-a1/a2-a4
		rts

;-------------------------------------------------------------------------------

.squash_player
		movem.l	d1/d7/a0-a1/a3-a4,-(sp)

		move.l	(a4),d0
		bsr	find_heads_owner
		tst.l	d2
		bmi.s	.no_head

		move.l	a3,a1
		move.l	a4,a0
		move.l	d3,d0
		jsr	decr_fitness

.no_head	movem.l	(sp)+,d1/d7/a0-a1/a3-a4
		rts

.squash_player2
		movem.l	d1/d7/a0-a1/a3-a4,-(sp)

		move.l	(a3),d0
		bsr	find_heads_owner
		tst.l	d2
		bmi.s	.no_head2

		move.l	a3,a1
		move.l	a4,a0
		move.l	d3,d0
		jsr	damage_fitness

.no_head2	movem.l	(sp)+,d1/d7/a0-a1/a3-a4
		rts

;-------------------------------------------------------------------------------

.squash_sentry
		movem.l	d1/d7/a0-a1/a3-a4,-(sp)

		move.l	(a4),d0
		bsr	find_sentries_owner
		tst.l	d2
		bmi.s	.no_sentry

		move.l	a4,a0
		move.l	d3,d0
		jsr	decr_sentry_fitness

.no_sentry	movem.l	(sp)+,d1/d7/a0-a1/a3-a4
		rts

.squash_sentry2
		movem.l	d1/d7/a0-a1/a3-a4,-(sp)

		move.l	(a3),d0
		bsr	find_sentries_owner
		tst.l	d2
		bmi.s	.no_sentry2

		move.l	a4,a0
		move.l	d3,d0
		jsr	damage_sentry_fitness

.no_sentry2	movem.l	(sp)+,d1/d7/a0-a1/a3-a4
		rts

;-------------------------------------------------------------------------------

.any_stairs	move.l	d4,d0
		and.l	#keep_block,d4

		cmpi.l	#(6<<block_shift)!keep_block_here_bit,d4	;teleport?
		beq	.do_fall

		cmpi.l	#(16<<block_shift)!keep_block_here_bit,d4			;stairs down to south
		bne.s	.not_south		;no, then branch
		btst.b	#block_here_bit_num,map_cell_size*MAP_WIDTH+3(a2)
						;obstruction to south?
		bne	.end_fall		;yes, then branch
		btst.b	#floor_here_bit_num,map_cell_size*MAP_WIDTH+3(a2)
						;floor to south?
		bne	.end_fall		;yes, then branch
		lea	map_cell_size*MAP_WIDTH(a3),a3
		lea	map_cell_size*MAP_WIDTH(a4),a4
		move.l	(a3),d4			;block to fall into
		move.l	(a4),d2			;block fallen on top of
		bra	.do_fall
.not_south
		cmpi.l	#(17<<block_shift)!keep_block_here_bit,d4			;stairs down to west
		bne.s	.not_west		;no, then branch
		btst.b	#block_here_bit_num,-map_cell_size+3(a2)
						;obstruction to west?
		bne	.end_fall		;yes, then branch
		btst.b	#floor_here_bit_num,-map_cell_size+3(a2)
						;floor to west?
		bne	.end_fall		;yes, then branch
		lea	-map_cell_size(a3),a3
		lea	-map_cell_size(a4),a4
		move.l	(a3),d4			;block to fall into
		move.l	(a4),d2			;block fallen on top of
		bra	.do_fall
.not_west
		cmpi.l	#(18<<block_shift)!keep_block_here_bit,d4			;stairs down to north
		bne.s	.not_north		;no, then branch
		btst.b	#block_here_bit_num,-map_cell_size*MAP_WIDTH+3(a2)
						;obstruction to north?
		bne	.end_fall		;yes, then branch
		btst.b	#floor_here_bit_num,-map_cell_size*MAP_WIDTH+3(a2)
						;floor to north?
		bne	.end_fall		;yes, then branch
		lea	-map_cell_size*MAP_WIDTH(a3),a3
		lea	-map_cell_size*MAP_WIDTH(a4),a4
		move.l	(a3),d4			;block to fall into
		move.l	(a4),d2			;block fallen on top of
		bra	.do_fall
.not_north
		cmpi.l	#(19<<block_shift)!keep_block_here_bit,d4			;stairs down to east
		bne	.not_east		;no, then branch
		btst.b	#block_here_bit_num,map_cell_size+3(a2)
						;obstruction to east?
		bne	.end_fall		;yes, then branch
		btst.b	#floor_here_bit_num,map_cell_size+3(a2)
						;floor to east?
		bne	.end_fall		;yes, then branch
		lea	map_cell_size(a3),a3
		lea	map_cell_size(a4),a4
		move.l	(a3),d4			;block to fall into
		move.l	(a4),d2			;block fallen on top of
		bra	.do_fall
.not_east
		cmp.l	#(8<<block_shift)!keep_block_here_bit,d4
		blt	.end_fall
		cmp.l	#(47<<block_shift)!keep_block_here_bit,d4
		bgt	.end_fall

		st.b	variables+redraw_flag(a5)	;set redraw flag
		move.l	#2500,d3

		cmp.l	#(16<<block_shift)!keep_block_here_bit,d4
		blt	.squash_monster2
		cmp.l	#(32<<block_shift)!keep_block_here_bit,d4
		bge	.squash_player2
		cmp.l	#(22<<block_shift)!keep_block_here_bit,d4
		blt	.end_fall
		cmp.l	#(27<<block_shift)!keep_block_here_bit,d4
		bgt	.end_fall
		cmp.l	#(24<<block_shift)!keep_block_here_bit,d4
		bge	.squash_sentry2

		bra	.end_fall

********************************************************************************
********************************************************************************
********************************************************************************
;Simulate waves at water level
;INPUT:		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	none
move_water
		move.w	map+water_speed(a5),d2
                beq.s	.no_water
		cmp.w	#99,d2
		beq.s	.no_water

		cmp.w	water_count,d2
		bls.s	.do_water
.no_water	rts
.do_water
force_move_water
		move.w	map+water_speed(a5),d2
		bne.s	.do_water
		rts
.do_water
		clr.w	water_count
		move.w	map+water_level(a5),d2		;get water level

		cmp.w	map+low_water_level(a5),d2	;at lowest level?
		bne.s	.not_at_low			;no, then branch
		move.w	#1,variables+water_direction(a5)		;change direction to up
.not_at_low
		cmp.w	map+hi_water_level(a5),d2	;at lowest level?
		bne.s	.not_at_high			;no, then branch
		move.w	#0,variables+water_direction(a5)		;change direction to down
.not_at_high
		tst.w	variables+water_direction(a5)		;which direction?
		beq.s	.water_down     		;zero? then branch
		addq.w	#1,d2				;move water up
		bra.s	.skip_down
.water_down	subq.w	#1,d2				;move water down
.skip_down
		move.w	d2,map+water_level(a5)		;store new water level
                move.w	d2,d3
		and.w	#%11,d3
		lsl.w	#2,d3				;d3=water level (in quarters)
		lsr.w	#2,d2				;d2=water level (in map levels)

		move.w	#MAP_WIDTH*MAP_DEPTH*map_cell_size,d4	;d4=floor size
		move.w	d4,d1
		lsr.w	#2,d1				;d1=number blocks on level
		mulu.w	d4,d2
		move.l	#map,a1
		add.l   a5,a1
		move.l	a1,a2
		add.l	#map_data1,a1			;a1=address of level
		add.l	#map_data2,a2
		add.w	d2,a1
		add.w	d2,a2

		tst.w	variables+water_direction(a5)
		bne.s	.012_water_draw
		cmp.w	#%1100,d3			;level 3 in .25 blocks?
		beq.s	.3_water_draw			;yes, then branch

.012_water_draw	move.l  water_heights(pc,d3.w),d3 	;water level (in .25 blocks)
.012_loop	btst.b	#flowing_bit_num-8,2(a2)
		beq.s	.no_012_flow
		and.l 	#erase_water,(a1)
		or.l	d3,(a1)+
                lea     4(a2),a2
		dbf	d1,.012_loop
		st.b	variables+redraw_flag(a5)	;set redraw flag
		rts
.no_012_flow	lea	4(a1),a1
                lea     4(a2),a2
		dbf	d1,.012_loop
		st.b	variables+redraw_flag(a5)	;set redraw flag
		rts

.3_water_draw	move.l  water_heights(pc,d3.w),d3 	;water level (in .25 blocks)
.3_loop		btst.b	#flowing_bit_num-8,2(a2)
		beq.s	.no_3_flow
		and.l 	#erase_water,0(a1,d4.w)
		and.l 	#erase_water,(a1)
		or.l	d3,(a1)+
		lea     4(a2),a2
		dbf	d1,.3_loop
		st.b	variables+redraw_flag(a5)	;set redraw flag
		rts
.no_3_flow	lea	4(a1),a1
                lea     4(a2),a2
		dbf	d1,.3_loop
		st.b	variables+redraw_flag(a5)	;set redraw flag
		rts

water_heights	dc.l	(0<<water_shift)!keep_water_here_bit
		dc.l	(1<<water_shift)!keep_water_here_bit
		dc.l	(2<<water_shift)!keep_water_here_bit
		dc.l	(3<<water_shift)!keep_water_here_bit

********************************************************************************
*********************************** Shake screen *******************************
********************************************************************************
;INPUT:		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	none

shake_screen
		move.b	variables+shake_power(a5),d0
		beq	.end_shake

		ext.w	d0
		move.b	variables+.shake_table(pc,d0.w),d0

		cmp.b	#-127,d0
		bne.s	.do_shake
		clr.w	variables+shake(a5)
		clr.w	variables+shake_power(a5)
		sf.b	variables+redraw_flag(a5)
		rts

.shake_table	dc.b	0
		dc.b	12,16,12,0
		dc.b	-10,-14,-10,0
		dc.b	8,12,8,0
		dc.b	-7,-11,-7,0
		dc.b	6,8,6,0
		dc.b	-6,0
		dc.b    5,0
		dc.b	-4,0
		dc.b	3,0
		dc.b    -2,0
		dc.b	1,0
		dc.b	-1,0
		dc.b	1,0
		dc.b	-1,0
		dc.b    -127

.do_shake	ext.w	d0
		move.w	d0,variables+shake(a5)
		addi.b	#1,shake_power(a5)
		move.l	#copperlist,a0
		add.l	a4,a0

		movem.l	d1-d2/a1,-(sp)
		lea	.table,a1
.loop		move.w	(a1)+,d1
		bmi.s	.end
		add.w	d0,d1
		cmpi.w	#255,d1
		ble.s	.ok
		move.w	#255,d1
.ok		move.w	(a1)+,d2
		move.b	d1,0(a0,d2.w)
		bra.s	.loop
.end		movem.l	(sp)+,d1-d2/a1

.end_shake	rts

.table		dc.w	$27,diw_strt+2
		dc.w	50,col_wait1

		dc.w	53+0*4,col_waits+0*SKY_4LINE_SIZE+0*SKY_LINE_SIZE
		dc.w	53+0*4+1,col_waits+4+0*SKY_4LINE_SIZE+1*SKY_LINE_SIZE+8
		dc.w	53+0*4+2,col_waits+4+0*SKY_4LINE_SIZE+2*SKY_LINE_SIZE+8
		dc.w	53+0*4+3,col_waits+4+0*SKY_4LINE_SIZE+3*SKY_LINE_SIZE+8
		dc.w	53+1*4,col_waits+4+1*SKY_4LINE_SIZE+0*SKY_LINE_SIZE
		dc.w	53+1*4+1,col_waits+8+1*SKY_4LINE_SIZE+1*SKY_LINE_SIZE+8
		dc.w	53+1*4+2,col_waits+8+1*SKY_4LINE_SIZE+2*SKY_LINE_SIZE+8
		dc.w	53+1*4+3,col_waits+8+1*SKY_4LINE_SIZE+3*SKY_LINE_SIZE+8
		dc.w	53+2*4,col_waits+8+2*SKY_4LINE_SIZE+0*SKY_LINE_SIZE
		dc.w	53+2*4+1,col_waits+8+2*SKY_4LINE_SIZE+1*SKY_LINE_SIZE+8
		dc.w	53+2*4+2,col_waits+8+2*SKY_4LINE_SIZE+2*SKY_LINE_SIZE+8
		dc.w	53+2*4+3,col_waits+8+2*SKY_4LINE_SIZE+3*SKY_LINE_SIZE+8
		dc.w	53+3*4,col_waits+8+3*SKY_4LINE_SIZE+0*SKY_LINE_SIZE
		dc.w	53+3*4+1,col_waits+8+3*SKY_4LINE_SIZE+1*SKY_LINE_SIZE+8
		dc.w	53+3*4+2,col_waits+8+3*SKY_4LINE_SIZE+2*SKY_LINE_SIZE+8
		dc.w	53+3*4+3,col_waits+8+3*SKY_4LINE_SIZE+3*SKY_LINE_SIZE+8
		dc.w	53+4*4,col_waits+8+4*SKY_4LINE_SIZE+0*SKY_LINE_SIZE
		dc.w	53+4*4+1,col_waits+8+4*SKY_4LINE_SIZE+1*SKY_LINE_SIZE+8
		dc.w	53+4*4+2,col_waits+8+4*SKY_4LINE_SIZE+2*SKY_LINE_SIZE+8
		dc.w	53+4*4+3,col_waits+8+4*SKY_4LINE_SIZE+3*SKY_LINE_SIZE+8
		dc.w	53+5*4,col_waits+8+5*SKY_4LINE_SIZE+0*SKY_LINE_SIZE
		dc.w	53+5*4+1,col_waits+8+5*SKY_4LINE_SIZE+1*SKY_LINE_SIZE+8
		dc.w	53+5*4+2,col_waits+8+5*SKY_4LINE_SIZE+2*SKY_LINE_SIZE+8
		dc.w	53+5*4+3,col_waits+8+5*SKY_4LINE_SIZE+3*SKY_LINE_SIZE+8
		dc.w	53+6*4,col_waits+8+6*SKY_4LINE_SIZE+0*SKY_LINE_SIZE
		dc.w	53+6*4+1,col_waits+8+6*SKY_4LINE_SIZE+1*SKY_LINE_SIZE+8
		dc.w	53+6*4+2,col_waits+8+6*SKY_4LINE_SIZE+2*SKY_LINE_SIZE+8
		dc.w	53+6*4+3,col_waits+8+6*SKY_4LINE_SIZE+3*SKY_LINE_SIZE+8
		dc.w	53+7*4,col_waits+8+7*SKY_4LINE_SIZE+0*SKY_LINE_SIZE
		dc.w	53+7*4+1,col_waits+8+7*SKY_4LINE_SIZE+1*SKY_LINE_SIZE+8
		dc.w	53+7*4+2,col_waits+8+7*SKY_4LINE_SIZE+2*SKY_LINE_SIZE+8
		dc.w	53+7*4+3,col_waits+8+7*SKY_4LINE_SIZE+3*SKY_LINE_SIZE+8
		dc.w	53+8*4,col_waits+8+8*SKY_4LINE_SIZE+0*SKY_LINE_SIZE
		dc.w	53+8*4+1,col_waits+8+8*SKY_4LINE_SIZE+1*SKY_LINE_SIZE+8
		dc.w	53+8*4+2,col_waits+8+8*SKY_4LINE_SIZE+2*SKY_LINE_SIZE+8
		dc.w	53+8*4+3,col_waits+8+8*SKY_4LINE_SIZE+3*SKY_LINE_SIZE+8
		dc.w	53+9*4,col_waits+8+9*SKY_4LINE_SIZE+0*SKY_LINE_SIZE
		dc.w	53+9*4+1,col_waits+8+9*SKY_4LINE_SIZE+1*SKY_LINE_SIZE+8
		dc.w	53+9*4+2,col_waits+8+9*SKY_4LINE_SIZE+2*SKY_LINE_SIZE+8
		dc.w	53+9*4+3,col_waits+8+9*SKY_4LINE_SIZE+3*SKY_LINE_SIZE+8
		dc.w	53+10*4,col_waits+8+10*SKY_4LINE_SIZE+0*SKY_LINE_SIZE
		dc.w	53+10*4+1,col_waits+8+10*SKY_4LINE_SIZE+1*SKY_LINE_SIZE+8
		dc.w	53+10*4+2,col_waits+8+10*SKY_4LINE_SIZE+2*SKY_LINE_SIZE+8
		dc.w	53+10*4+3,col_waits+8+10*SKY_4LINE_SIZE+3*SKY_LINE_SIZE+8
		dc.w	53+11*4,col_waits+8+11*SKY_4LINE_SIZE+0*8
		dc.w	53+12*4,col_waits+8+11*SKY_4LINE_SIZE+1*8
		dc.w	53+13*4,col_waits+8+11*SKY_4LINE_SIZE+2*8
		dc.w	53+14*4,col_waits+8+11*SKY_4LINE_SIZE+3*8
		dc.w	53+15*4,col_waits+8+11*SKY_4LINE_SIZE+4*8
		dc.w	53+16*4,col_waits+8+11*SKY_4LINE_SIZE+5*8
		dc.w	53+17*4,col_waits+8+11*SKY_4LINE_SIZE+6*8
		dc.w	53+18*4,col_waits+8+11*SKY_4LINE_SIZE+7*8
		dc.w	53+19*4,col_waits+8+11*SKY_4LINE_SIZE+8*8
		dc.w	53+20*4,col_waits+8+11*SKY_4LINE_SIZE+9*8

		dc.w	138,col_wait2
		dc.w	141,scrolly_wait1
		dc.w	143,scrolly_wait4
		dc.w	144,scrolly_wait5
		dc.w	145,scrolly_wait6
		dc.w	150,scrolly_wait2
		dc.w	$27,scrolly_diwstrt+2
		dc.w	151,scrolly_wait3
		dc.w	163,col_wait3

		dc.w	166+0*4,col_waits2+0*SKY_4LINE_SIZE+0*SKY_LINE_SIZE
		dc.w	166+0*4+1,col_waits2+4+0*SKY_4LINE_SIZE+1*SKY_LINE_SIZE+8
		dc.w	166+0*4+2,col_waits2+4+0*SKY_4LINE_SIZE+2*SKY_LINE_SIZE+8
		dc.w	166+0*4+3,col_waits2+4+0*SKY_4LINE_SIZE+3*SKY_LINE_SIZE+8
		dc.w	166+1*4,col_waits2+4+1*SKY_4LINE_SIZE+0*SKY_LINE_SIZE
		dc.w	166+1*4+1,col_waits2+8+1*SKY_4LINE_SIZE+1*SKY_LINE_SIZE+8
		dc.w	166+1*4+2,col_waits2+8+1*SKY_4LINE_SIZE+2*SKY_LINE_SIZE+8
		dc.w	166+1*4+3,col_waits2+8+1*SKY_4LINE_SIZE+3*SKY_LINE_SIZE+8
		dc.w	166+2*4,col_waits2+8+2*SKY_4LINE_SIZE+0*SKY_LINE_SIZE
		dc.w	166+2*4+1,col_waits2+8+2*SKY_4LINE_SIZE+1*SKY_LINE_SIZE+8
		dc.w	166+2*4+2,col_waits2+8+2*SKY_4LINE_SIZE+2*SKY_LINE_SIZE+8
		dc.w	166+2*4+3,col_waits2+8+2*SKY_4LINE_SIZE+3*SKY_LINE_SIZE+8
		dc.w	166+3*4,col_waits2+8+3*SKY_4LINE_SIZE+0*SKY_LINE_SIZE
		dc.w	166+3*4+1,col_waits2+8+3*SKY_4LINE_SIZE+1*SKY_LINE_SIZE+8
		dc.w	166+3*4+2,col_waits2+8+3*SKY_4LINE_SIZE+2*SKY_LINE_SIZE+8
		dc.w	166+3*4+3,col_waits2+8+3*SKY_4LINE_SIZE+3*SKY_LINE_SIZE+8
		dc.w	166+4*4,col_waits2+8+4*SKY_4LINE_SIZE+0*SKY_LINE_SIZE
		dc.w	166+4*4+1,col_waits2+8+4*SKY_4LINE_SIZE+1*SKY_LINE_SIZE+8
		dc.w	166+4*4+2,col_waits2+8+4*SKY_4LINE_SIZE+2*SKY_LINE_SIZE+8
		dc.w	166+4*4+3,col_waits2+8+4*SKY_4LINE_SIZE+3*SKY_LINE_SIZE+8
		dc.w	166+5*4,col_waits2+8+5*SKY_4LINE_SIZE+0*SKY_LINE_SIZE
		dc.w	166+5*4+1,col_waits2+8+5*SKY_4LINE_SIZE+1*SKY_LINE_SIZE+8
		dc.w	166+5*4+2,col_waits2+8+5*SKY_4LINE_SIZE+2*SKY_LINE_SIZE+8
		dc.w	166+5*4+3,col_waits2+8+5*SKY_4LINE_SIZE+3*SKY_LINE_SIZE+8
		dc.w	166+6*4,col_waits2+8+6*SKY_4LINE_SIZE+0*SKY_LINE_SIZE
		dc.w	166+6*4+1,col_waits2+8+6*SKY_4LINE_SIZE+1*SKY_LINE_SIZE+8
		dc.w	166+6*4+2,col_waits2+8+6*SKY_4LINE_SIZE+2*SKY_LINE_SIZE+8
		dc.w	166+6*4+3,col_waits2+8+6*SKY_4LINE_SIZE+3*SKY_LINE_SIZE+8
		dc.w	166+7*4,col_waits2+8+7*SKY_4LINE_SIZE+0*SKY_LINE_SIZE
		dc.w	166+7*4+1,col_waits2+8+7*SKY_4LINE_SIZE+1*SKY_LINE_SIZE+8
		dc.w	166+7*4+2,col_waits2+8+7*SKY_4LINE_SIZE+2*SKY_LINE_SIZE+8
		dc.w	166+7*4+3,col_waits2+8+7*SKY_4LINE_SIZE+3*SKY_LINE_SIZE+8
		dc.w	166+8*4,col_waits2+8+8*SKY_4LINE_SIZE+0*SKY_LINE_SIZE
		dc.w	166+8*4+1,col_waits2+8+8*SKY_4LINE_SIZE+1*SKY_LINE_SIZE+8
		dc.w	166+8*4+2,col_waits2+8+8*SKY_4LINE_SIZE+2*SKY_LINE_SIZE+8
		dc.w	166+8*4+3,col_waits2+8+8*SKY_4LINE_SIZE+3*SKY_LINE_SIZE+8
		dc.w	166+9*4,col_waits2+8+9*SKY_4LINE_SIZE+0*SKY_LINE_SIZE
		dc.w	166+9*4+1,col_waits2+8+9*SKY_4LINE_SIZE+1*SKY_LINE_SIZE+8
		dc.w	166+9*4+2,col_waits2+8+9*SKY_4LINE_SIZE+2*SKY_LINE_SIZE+8
		dc.w	166+9*4+3,col_waits2+8+9*SKY_4LINE_SIZE+3*SKY_LINE_SIZE+8
		dc.w	166+10*4,col_waits2+8+10*SKY_4LINE_SIZE+0*SKY_LINE_SIZE
		dc.w	166+10*4+1,col_waits2+8+10*SKY_4LINE_SIZE+1*SKY_LINE_SIZE+8
		dc.w	166+10*4+2,col_waits2+8+10*SKY_4LINE_SIZE+2*SKY_LINE_SIZE+8
		dc.w	166+10*4+3,col_waits2+8+10*SKY_4LINE_SIZE+3*SKY_LINE_SIZE+8
		dc.w	166+11*4,col_waits2+8+11*SKY_4LINE_SIZE+0*8
		dc.w	166+12*4,col_waits2+8+11*SKY_4LINE_SIZE+1*8
		dc.w	166+13*4,col_waits2+8+11*SKY_4LINE_SIZE+2*8
		dc.w	166+14*4,col_waits2+8+11*SKY_4LINE_SIZE+3*8
		dc.w	166+15*4,col_waits2+8+11*SKY_4LINE_SIZE+4*8
		dc.w	166+16*4,col_waits2+8+11*SKY_4LINE_SIZE+5*8
		dc.w	166+17*4,col_waits2+8+11*SKY_4LINE_SIZE+6*8
		dc.w	166+18*4,col_waits2+8+11*SKY_4LINE_SIZE+7*8
		dc.w	166+19*4,col_waits2+8+11*SKY_4LINE_SIZE+8*8
		dc.w	166+20*4,col_waits2+8+11*SKY_4LINE_SIZE+9*8

		dc.w	251,col_wait4
;	IFD	CD32
;		dc.w	255,col_wait4+16*4+9*4
;	ELSEIF
		dc.w	255,col_wait4+9*4
;	ENDC

		dc.w	-1

********************************************************************************
**************************** Initialise Game Variables *************************
********************************************************************************
;Read data from map info and insert it into variables structure.
;INPUT:		a5=base address of fast memory (long)
;OUTPUT:	none
;CHANGES:	d0,a1-a2

quick_initialise_variables
		INITIALISE_KEYS	#game_key_list

		movem.l	d0-d7/a0-a6,-(sp)
		jsr	_RemPlayer		;deinstall med module player
		movem.l	(sp)+,d0-d7/a0-a6

		jsr	killaud
		bclr	#1,$bfe001		;switch filter off

		move.w	#%1111111100000000,potgo(a6)
		clr.b	variables+joystick1(a5)
		clr.b	variables+joystick1_temp(a5)
		clr.b	variables+joystick2(a5)
		clr.b	variables+joystick2_temp(a5)

		move.w	vhposr(a6),variables+random_num(a5)

;copy horizons down to chip ram
		lea	map+horizons(a5),a0
		move.l	a4,a1
		add.l	#horizon_images,a1
		move.w	#((576*4)/4)-1,d0
.copy		move.l	(a0)+,(a1)+
		dbf	d0,.copy

		move.l	#sprites,a0
		add.l	a4,a0
		move.l	#copperlist+clist_sprites,a1
		add.l	a4,a1
		HDW_SPRITE #0,a0,#100,#100,#16,a1
	IFD	CD32
                move.l	#sprites+19*144,a0
	ELSEIF
                move.l	#sprites+19*72,a0
	ENDC
		add.l	a4,a0
		HDW_SPRITE #1,a0,#100,#100,#16,a1

		move.l	#miscgfx+digits_bob,a0
		add.l	a4,a0
		move.l	(a0),a0
		add.l	#miscgfx,a0
		add.l	a4,a0
		HDW_SPRITE #5,a0,#100,#100,#14,a1

		move.w	#200,variables+mouse0_x(a5)
		move.w	#100,variables+mouse0_y(a5)
		move.w	#300,variables+mouse1_x(a5)
		move.w	#100,variables+mouse1_y(a5)

		lea	global_vars+orig_player1_stats+player_name(a5),a0
		move.l	a0,variables+scroll_pl1(a5)
		move.l	a0,variables+scrolld_pl1(a5)
		lea	global_vars+orig_player2_stats+player_name(a5),a0
		move.l	a0,variables+scroll_pl2(a5)
		move.l	a0,variables+scrolld_pl2(a5)
		lea	global_vars+orig_player3_stats+player_name(a5),a0
		move.l	a0,variables+scroll_pl3(a5)
		move.l	a0,variables+scrolld_pl3(a5)
		lea	global_vars+orig_player4_stats+player_name(a5),a0
		move.l	a0,variables+scroll_pl4(a5)
		move.l	a0,variables+scrolld_pl4(a5)

		rts

initialise_variables
		CLR_MEM_RANGE	variables(a5),variables_end(a5)
		CLR_MEM_RANGE	timers,timers_end

		bsr	quick_initialise_variables

	IFD     download
		move.b	number_players+1,global_vars+num_players(a5)
		move.b	#CNTRL_MOUSE1,global_vars+pl1_control(a5)
		move.b	#CNTRL_PAD2,global_vars+pl2_control(a5)
		move.b	#CNTRL_KEYS2,global_vars+pl3_control(a5)
		move.b	#CNTRL_KEYS3,global_vars+pl4_control(a5)
		move.w	#ACTV_MOUSE1M!ACTV_PAD2M!ACTV_KEYS2M!ACTV_KEYS3M,global_vars+active_controls(a5)
	ENDC
		move.b	global_vars+num_players(a5),d0

                cmpi.b	#1,d0
		bne.s	.not1
		move.w	#4,variables+players_alive(a5)
		move.b	#CNTRL_MOUSE1,variables+player1+control_method(a5)
		move.b	#CNTRL_MOUSE1,variables+player2+control_method(a5)
		move.b	#CNTRL_MOUSE1,variables+player3+control_method(a5)
		move.b	#CNTRL_MOUSE1,variables+player4+control_method(a5)
		move.w	#ACTV_MOUSE1M,global_vars+active_controls(a5)
.not1
                cmpi.b	#2,d0
		bne.s	.not2
		move.w	#4,variables+players_alive(a5)
		move.b	#CNTRL_MOUSE1,variables+player1+control_method(a5)
		move.b	#CNTRL_MOUSE2,variables+player2+control_method(a5)
		move.b	#CNTRL_MOUSE1,variables+player3+control_method(a5)
		move.b	#CNTRL_MOUSE2,variables+player4+control_method(a5)
		move.w	#ACTV_MOUSE1M!ACTV_MOUSE2M,global_vars+active_controls(a5)
.not2
                cmpi.b	#3,d0
		bne.s	.not3
		move.w	#3,variables+players_alive(a5)
		move.b	global_vars+pl1_control(a5),variables+player1+control_method(a5)
		move.b	global_vars+pl2_control(a5),variables+player2+control_method(a5)
		move.b	global_vars+pl3_control(a5),variables+player3+control_method(a5)
		move.b	#0,global_vars+pl4_control(a5)
		move.b	#0,variables+player4+control_method(a5)
.not3
                cmpi.b	#4,d0
		bne.s	.not4
		move.w	#4,variables+players_alive(a5)
		move.b	global_vars+pl1_control(a5),variables+player1+control_method(a5)
		move.b	global_vars+pl2_control(a5),variables+player2+control_method(a5)
		move.b	global_vars+pl3_control(a5),variables+player3+control_method(a5)
		move.b	global_vars+pl4_control(a5),variables+player4+control_method(a5)
.not4
		move.w	#1,variables+water_direction(a5)			;going up
		move.w	#old_view1,variables+last_view(a5)
                move.w	#1,variables+water_anim(a5)

		lea	variables+player1(a5),a1
		lea	global_vars+player1_stats(a5),a2
		lea	global_vars+orig_player1_stats(a5),a3
		move.w	#32,head_images(a1)
		move.w	#0,player_num(a1)
		move.w	#0,aud_ch(a1)
		move.w	#pl1_seen_bit_num,seen_bit_num(a1)
		move.w	#pl1_view_xoffset,view_xoffset(a1)
		move.w	#pl1_view_yoffset,view_yoffset(a1)
		move.w	#pl1_view_xoffset+3,gadget_xoffset(a1)
		move.w	#pl1_view_yoffset-2,gadget_yoffset(a1)
		lea	map+pl1_pos(a5),a0
	IFD	download
		STRCPY	<"Cheule">,player_name(a3)
		move.b	#1,gender(a3)
		move.b	#0,race(a3)
		move.b	#4,class(a3)
		move.w	#129,physique(a3)
		move.w	#160,agility(a3)
		move.w	#11341,experience(a3)
		move.w	#330,footstep(a3)
		move.w	#509,grunt(a3)
		move.l	#(25<<24)!(64<<8),global_vars+orig_pl1_store+0*4(a5)
		move.l	#(64<<24)!(0<<8),global_vars+orig_pl1_store+1*4(a5)
		move.l	#(57<<24)!(0<<8),global_vars+orig_pl1_store+2*4(a5)
		move.l	#(40<<24)!(150<<8),global_vars+orig_pl1_store+3*4(a5)
		move.l	#(47<<24)!(250<<8),global_vars+orig_pl1_store+4*4(a5)
		move.l	#(79<<24)!(0<<8),global_vars+orig_pl1_store+5*4(a5)
		move.l	#(107<<24)!(5<<8),global_vars+orig_pl1_store+6*4(a5)
		move.l	#(27<<24)!(12<<8),global_vars+orig_pl1_store+7*4(a5)
		move.l	#(26<<24)!(3<<8),global_vars+orig_pl1_store+8*4(a5)
		move.l	#(28<<24)!(12<<8),global_vars+orig_pl1_store+9*4(a5)
	ENDC
		bsr	.initialise_player

		lea	variables+player2(a5),a1
		lea	global_vars+player2_stats(a5),a2
		lea	global_vars+orig_player2_stats(a5),a3
		move.w	#36,head_images(a1)
		move.w	#1,player_num(a1)
		move.w	#1,aud_ch(a1)
		move.w	#pl2_seen_bit_num,seen_bit_num(a1)
		move.w	#pl2_view_xoffset,view_xoffset(a1)
		move.w	#pl2_view_yoffset,view_yoffset(a1)
		move.w	#pl2_view_xoffset+3,gadget_xoffset(a1)
		move.w	#pl2_view_yoffset-2,gadget_yoffset(a1)
		lea	map+pl2_pos(a5),a0
	IFD	download
		STRCPY	<"CIM">,player_name(a3)
		move.b	#2,gender(a3)
		move.b	#1,race(a3)
		move.b	#2,class(a3)
		move.w	#321,physique(a3)
		move.w	#28,agility(a3)
		move.w	#2889,experience(a3)
		move.w	#460,footstep(a3)
		move.w	#669,grunt(a3)
		move.l	#(12<<24)!(200<<8),global_vars+orig_pl2_store+0*4(a5)
		move.l	#(15<<24)!(16<<8),global_vars+orig_pl2_store+1*4(a5)
		move.l	#(39<<24)!(150<<8),global_vars+orig_pl2_store+2*4(a5)
		move.l	#(39<<24)!(150<<8),global_vars+orig_pl2_store+3*4(a5)
		move.l	#(46<<24)!(50<<8),global_vars+orig_pl2_store+4*4(a5)
		move.l	#(9<<24)!(40<<8),global_vars+orig_pl2_store+5*4(a5)
		move.l	#(66<<24)!(0<<8),global_vars+orig_pl2_store+6*4(a5)
		move.l	#(66<<24)!(0<<8),global_vars+orig_pl2_store+7*4(a5)
		move.l	#(30<<24)!(3<<8),global_vars+orig_pl2_store+8*4(a5)
		move.l	#(0<<24)!(0<<8),global_vars+orig_pl2_store+9*4(a5)
	ENDC
		bsr	.initialise_player

		lea	variables+player3(a5),a1
		lea	global_vars+player3_stats(a5),a2
		lea	global_vars+orig_player3_stats(a5),a3
		move.w	#40,head_images(a1)
		move.w	#2,player_num(a1)
		move.w	#0,aud_ch(a1)
		move.w	#pl3_seen_bit_num,seen_bit_num(a1)
		move.w	#pl3_view_yoffset,view_yoffset(a1)
		move.w	#pl3_view_yoffset-2+8,gadget_yoffset(a1)
		cmpi.b	#3,global_vars+num_players(a5)
		beq.s	.3pl
		move.w	#pl3_view_xoffset,view_xoffset(a1)
		move.w	#pl3_view_xoffset+3,gadget_xoffset(a1)
		bra.s	.skip_3pl
.3pl		move.w	#80,view_xoffset(a1)
		move.w	#80+3,gadget_xoffset(a1)
.skip_3pl	lea	map+pl3_pos(a5),a0
	IFD	download
		STRCPY	<"Rorian">,player_name(a3)
		move.b	#0,gender(a3)
		move.b	#0,race(a3)
		move.b	#0,class(a3)
		move.w	#156,physique(a3)
		move.w	#105,agility(a3)
		move.w	#13221,experience(a3)
		move.w	#360,footstep(a3)
		move.w	#579,grunt(a3)
		move.l	#(11<<24)!(54<<8),global_vars+orig_pl3_store+0*4(a5)
		move.l	#(16<<24)!(6<<8),global_vars+orig_pl3_store+1*4(a5)
		move.l	#(47<<24)!(150<<8),global_vars+orig_pl3_store+2*4(a5)
		move.l	#(47<<24)!(150<<8),global_vars+orig_pl3_store+3*4(a5)
		move.l	#(27<<24)!(6<<8),global_vars+orig_pl3_store+4*4(a5)
		move.l	#(79<<24)!(0<<8),global_vars+orig_pl3_store+5*4(a5)
		move.l	#(86<<24)!(5<<8),global_vars+orig_pl3_store+6*4(a5)
		move.l	#(83<<24)!(20<<8),global_vars+orig_pl3_store+7*4(a5)
		move.l	#(57<<24)!(0<<8),global_vars+orig_pl3_store+8*4(a5)
		move.l	#(57<<24)!(0<<8),global_vars+orig_pl3_store+9*4(a5)
	ENDC
		bsr	.initialise_player

		lea	variables+player4(a5),a1
		lea	global_vars+player4_stats(a5),a2
		lea	global_vars+orig_player4_stats(a5),a3
		move.w	#44,head_images(a1)
		move.w	#3,player_num(a1)
		move.w	#1,aud_ch(a1)
		move.w	#pl4_seen_bit_num,seen_bit_num(a1)
		move.w	#pl4_view_xoffset,view_xoffset(a1)
		move.w	#pl4_view_yoffset,view_yoffset(a1)
		move.w	#pl4_view_xoffset+3,gadget_xoffset(a1)
		move.w	#pl4_view_yoffset-2+8,gadget_yoffset(a1)
		lea	map+pl4_pos(a5),a0
	IFD	download
		STRCPY	<"Jenillee">,player_name(a3)
		move.b	#1,gender(a3)
		move.b	#0,race(a3)
		move.b	#3,class(a3)
		move.w	#95,physique(a3)
		move.w	#211,agility(a3)
		move.w	#10097,experience(a3)
		move.w	#320,footstep(a3)
		move.w	#479,grunt(a3)
		move.l	#(21<<24)!(50<<8),global_vars+orig_pl4_store+0*4(a5)
		move.l	#(49<<24)!(50<<8),global_vars+orig_pl4_store+1*4(a5)
		move.l	#(64<<24)!(0<<8),global_vars+orig_pl4_store+2*4(a5)
		move.l	#(64<<24)!(0<<8),global_vars+orig_pl4_store+3*4(a5)
		move.l	#(64<<24)!(0<<8),global_vars+orig_pl4_store+4*4(a5)
		move.l	#(108<<24)!(3<<8),global_vars+orig_pl4_store+5*4(a5)
		move.l	#(87<<24)!(5<<8),global_vars+orig_pl4_store+6*4(a5)
		move.l	#(107<<24)!(5<<8),global_vars+orig_pl4_store+7*4(a5)
		move.l	#(96<<24)!(6<<8),global_vars+orig_pl4_store+8*4(a5)
		move.l	#(0<<24)!(0<<8),global_vars+orig_pl4_store+9*4(a5)
	ENDC
		bsr	.initialise_player

		cmpi.b	#3,global_vars+num_players(a5)
		bne.s	.not_3pl
		move.w	#$400,view_xoffset(a1)
		move.w	#$400,gadget_xoffset(a1)
		move.w	#0,fitness(a2)
		st.b	dead_flag(a2)
		st.b	dead_flag2(a1)
.not_3pl
	IFD	demo
		cmpi.w	#2,global_vars+attract_mode(a5)
		bne.s	.not_playing
		move.l	#mouse_moves,a0
		add.l	a5,a0
		move.b	(a0)+,variables+player1+direction(a5)
		move.b	(a0)+,variables+player2+direction(a5)
		move.b	(a0)+,variables+player3+direction(a5)
		move.b	(a0)+,variables+player4+direction(a5)
		move.w	(a0)+,variables+random_num(a5)
		move.w	(a0)+,variables+mouse_timer(a5)
		move.w	(a0)+,variables+mouse0_x(a5)
		move.w	(a0)+,variables+mouse0_y(a5)
		move.w	#14,variables+mouse_move(a5)
.not_playing
		cmpi.w	#1,global_vars+attract_mode(a5)
		bne.s	.not_recording
		move.w	#0,variables+mouse_timer(a5)
		move.l	#mouse_moves,a0
		add.l	a5,a0
		move.b	variables+player1+direction(a5),(a0)+
		move.b	variables+player2+direction(a5),(a0)+
		move.b	variables+player3+direction(a5),(a0)+
		move.b	variables+player4+direction(a5),(a0)+
		move.w	variables+random_num(a5),(a0)+
		move.w	variables+mouse_timer(a5),(a0)+
		move.w	variables+mouse0_x(a5),(a0)+
		move.w	variables+mouse0_y(a5),(a0)+
		move.w	#0,(a0)+
		move.w	#14,variables+mouse_move(a5)
.not_recording
	ENDC

		moveq.l	#0,d0
		move.b	map+time_limit(a5),d0
		divu	#10,d0
		move.w	d0,global_vars+at_trip1(a5)
		swap	d0
		move.w	d0,global_vars+at_trip2(a5)

		move.w	#600,global_vars+at_trip3(a5)

		move.w	#9,global_vars+at_trip1_dur(a5)
		move.w	#9,global_vars+at_trip2_dur(a5)
		move.w	#600,global_vars+at_trip3_dur(a5)

		move.w	#0,global_vars+at_trip1_rot(a5)
		move.w	#0,global_vars+at_trip2_rot(a5)

		rts

********************************************************************************
.initialise_player
		movem.l	a1-a3,-(sp)

		move.w	#stats_struct_size-1,d0
.loop		move.b	(a3)+,(a2)+
		dbf	d0,.loop

		move.l	(a3)+,inven_using(a1)

		move.w	#inven_size-1,d0
		lea	inven_store(a1),a1
.loop2		move.l	(a3)+,(a1)+
		dbf	d0,.loop2

		movem.l	(sp)+,a1-a3

		move.w	footstep(a2),footstep_period(a1)
		move.w	grunt(a2),grunt_period(a1)
		clr.w	old_fitness_band(a2)
		clr.b	fitness_flash_dur(a2)
		move.w	#65535,fitness(a2)
		move.w	dead_flag(a2),dead_flag2(a1)
		move.w	#-1,bumping_into(a1)

		move.w	variables+random_num(a5),d0
		mulu	#47,d0
		rol.w	#8,d0
		move.w	d0,variables+random_num(a5)
		andi.w	#%11,d0
		move.b	d0,direction(a1)
		add.w	head_images(a1),d0
		move.w	d0,block_num(a1)

		move.b	(a0)+,xpos(a1)
		move.b	(a0)+,ypos(a1)
		move.b	(a0)+,floor(a1)

		move.w  #-1,draw_window(a1)
		move.w  #-1,view_window(a1)

		move.l	a1,a0
		jsr	calc_weight
		rts

********************************************************************************
************************* Load And Decrunch Message Data ***********************
********************************************************************************
load_and_decrunch_mesg_data

		move.l  #lc_disk_buffer,a2
		add.l	a4,a2
		LOG_DISK_QUIET #1,a2,#2

		move.l	fast_mem_base,a1
		add.l	#code_size-phrasebook_size,a1
		move.b	lang,d0

		cmpi.b	#ENGLISH,d0
		bne.s	.not_eng
		LOAD_FILE_QUIET <"Languages/Phrasebook.eng">,a1
		bra	.not_spa
.not_eng
		cmpi.b	#FRENCH,d0
		bne.s	.not_fre
		LOAD_FILE_QUIET <"Languages/Phrasebook.fre">,a1
		bra	.not_spa
.not_fre
		cmpi.b	#GERMAN,d0
		bne.s	.not_ger
		LOAD_FILE_QUIET <"Languages/Phrasebook.ger">,a1
		bra	.not_spa
.not_ger
		cmpi.b	#ITALIAN,d0
		bne.s	.not_ita
		LOAD_FILE_QUIET <"Languages/Phrasebook.ita">,a1
		bra.s	.not_spa
.not_ita
		cmpi.b	#SPANISH,d0
		bne.s	.not_spa
		LOAD_FILE_QUIET <"Languages/Phrasebook.spa">,a1
		bra.s	.not_spa
.not_spa
		move.l	fast_mem_base,a0
		add.l	#code_size-phrasebook_size,a0
		PP_DECRUNCH_QUIET a0

		bsr	load_mesg

		move.l	#front_font_s,a0
		add.l	a5,a0
		PP_DECRUNCH_QUIET a0

		move.l	#front_mesg_cpr,a0
		add.l	a5,a0
		move.l	#lc_mesg_copperlist,a1
		add.l	a4,a1
		move.w	#(344/4)-1,d0
.copy_mesg_cpr	move.l	(a0)+,(a1)+
		dbf	d0,.copy_mesg_cpr

		move.l	#front_anim_cpr,a0
		add.l	a5,a0
		move.l	#lc_anim_copperlist,a1
		add.l	a4,a1
		move.w	#(288/4)-1,d0
.copy_anim_cpr	move.l	(a0)+,(a1)+
		dbf	d0,.copy_anim_cpr

;Set up in-line pointers
		move.l	#front_font_s,a0
		adda.l	a5,a0
		move.l	a0,d0
		add.l	d0,text_address(a0)
		move.b	#2,text_plane+4(a0)

		rts

********************************************************************************
************************* Load And Decrunch Message Data ***********************
********************************************************************************
load_and_decrunch_abort
		cmpi.w	#RESTART_RETRY,variables+restart_flag(a5)
		bne.s	.not_retry

		move.w	#1,variables+file_mode(a5)

		move.l  #screen_buffer2,a2
		add.l	a4,a2
		moveq.l	#0,d0
		move.b	global_vars+curr_locn+locn_disk(a5),d0
		PRELOG_DISK d0,a2,#2

		rts
.not_retry

;copy figures up to fast ram
		move.l	#miscgfx,a3
		add.l	a4,a3

		move.l	#front_figures_save+figure1,a1
		add.l   a5,a1
		move.l	#miscgfx+pl1in_bob,a0
		add.l	a4,a0
		move.l	(a0),a0
		add.l	a3,a0
		bsr	copy_figure

		move.l	#front_figures_save+face1,a1
		add.l   a5,a1
		move.l	#miscgfx+face1_bob,a0
		add.l	a4,a0
		move.l	(a0),a0
		add.l	a3,a0
		bsr	copy_face

		move.l	#front_figures_save+figure2,a1
		add.l   a5,a1
		move.l	#miscgfx+pl2in_bob,a0
		add.l	a4,a0
		move.l	(a0),a0
		add.l	a3,a0
		bsr	copy_figure

		move.l	#front_figures_save+face2,a1
		add.l   a5,a1
		move.l	#miscgfx+face2_bob,a0
		add.l	a4,a0
		move.l	(a0),a0
		add.l	a3,a0
		bsr	copy_face

		move.l	#front_figures_save+figure3,a1
		add.l   a5,a1
		move.l	#miscgfx+pl3in_bob,a0
		add.l	a4,a0
		move.l	(a0),a0
		add.l	a3,a0
		bsr	copy_figure

		move.l	#front_figures_save+face3,a1
		add.l   a5,a1
		move.l	#miscgfx+face3_bob,a0
		add.l	a4,a0
		move.l	(a0),a0
		add.l	a3,a0
		bsr	copy_face

		move.l	#front_figures_save+figure4,a1
		add.l   a5,a1
		move.l	#miscgfx+pl4in_bob,a0
		add.l	a4,a0
		move.l	(a0),a0
		add.l	a3,a0
		bsr	copy_figure

		move.l	#front_figures_save+face4,a1
		add.l   a5,a1
		move.l	#miscgfx+face4_bob,a0
		add.l	a4,a0
		move.l	(a0),a0
		add.l	a3,a0
		bsr	copy_face

	IFD	editor
		move.l  #lc_disk_buffer,a2
		add.l	a4,a2
		PRELOG_DISK #1,a2,#2
	ELSEIF
		move.l  #lc_disk_buffer,a2
		add.l	a4,a2
		moveq.l	#0,d0
		move.b	global_vars+curr_locn+locn_disk(a5),d0
		PRELOG_DISK d0,a2,#2

		bsr	load_mesg

		move.l	#front_font_s,a0
		add.l	a5,a0
		PP_DECRUNCH_QUIET a0

		move.l	#front_mesg_cpr,a0
		add.l	a5,a0
		move.l	#lc_mesg_copperlist,a1
		add.l	a4,a1
		move.w	#(344/4)-1,d0
.copy_mesg_cpr	move.l	(a0)+,(a1)+
		dbf	d0,.copy_mesg_cpr

		move.l	#front_anim_cpr,a0
		add.l	a5,a0
		move.l	#lc_anim_copperlist,a1
		add.l	a4,a1
		move.w	#(288/4)-1,d0
.copy_anim_cpr	move.l	(a0)+,(a1)+
		dbf	d0,.copy_anim_cpr

;Set up in-line pointers
		move.l	#front_font_s,a0
		adda.l	a5,a0
		move.l	a0,d0
		add.l	d0,text_address(a0)
		move.b	#2,text_plane+4(a0)

		move.w	#0,variables+file_mode(a5)

	ENDC

		rts

********************************************************************************

load_mesg
		move.l	#front_font_s,a1
		add.l	a5,a1
		tst.b	lang
		bne.s	.not_eng
		LOAD_FILE_QUIET <"Front/Mesg.dat">,a1
		bra.s	.skip_forg
.not_eng	LOAD_FILE_QUIET <"Front/SmallMesg.dat">,a1
.skip_forg
		rts

********************************************************************************
***************************** Load & Decrunch Game Data ************************
********************************************************************************

map_name	dc.b	"Maps/"
map_num		dc.b	"xx.map",0
atmos_name	dc.b	"Atmos/Atmos"
atmos_num	dc.b	"xx.sfx",0
style_name	dc.b	"Styles/Style"
style_num	dc.b	"xx.gfx",0
mons1_name	dc.b	"MonstersGfx/Monster"
mons1_num	dc.b	"xx.gfx",0
mons2_name	dc.b    "MonstersGfx/Monster"
mons2_num	dc.b	"xx.gfx",0

		even

load_and_decrunch_game_data
	IFND	download

	  IFND	editor

		cmpi.w	#RESTART_LOAD,variables+restart_flag(a5)
		bne	.not_loading_save

		move.l  #ch_screen_buffer,a0
		add.l	a4,a0
		move.l	#front_anim_in,a1
		add.l	a5,a1
		jsr	play_anim

		move.l	#lc_mesg_buffer,a0
		add.l	a4,a0
		jsr	set_up_message_screen

		move.w	#0,variables+file_mode(a5)

		move.l  #lc_disk_buffer,a2
		add.l	a4,a2
		PRELOG_DISK #1,a2,#2

		SHOW_MESG diskio_mesg_1

		bsr	load_ex_sfx
		bsr	load_miscgfx
		move.b	#1,global_vars+num_players(a5)
		bsr	load_copper
		bsr	decrunch_miscgfx
		bsr	setup_inline_pointers

		move.w	#1,variables+file_mode(a5)

		jsr	unshow_message
		move.l	#ch_screen_buffer,a0
		add.l	a4,a0
		move.l	#front_anim_out,a1
		add.l	a5,a1
		jsr	play_anim

		jsr	kill_screen
		jsr	set_up_game_screen
		jsr	game_screen_on2
		jsr	do_load_game

		cmpi.w	#RESTART_QUIT,variables+restart_flag(a5)
		beq	.exit_game
		jsr	quick_initialise_variables
		jsr	unfill
.exit_game
		rts

.not_loading_save
		cmpi.w	#RESTART_RETRY,variables+restart_flag(a5)
		bne.s	.not_retry

		move.l	#screen_buffer2,a2
		add.l	a4,a2
		moveq.l	#0,d0
		move.b	global_vars+curr_locn+locn_disk(a5),d0
		moveq.l	#2,d1
		tst.w	global_vars+action_flag(a5)
		beq.s	.not_action
		moveq.l	#1,d1
.not_action
		PRELOG_DISK d0,a2,d1

		clr.w	variables+restart_flag(a5)
		bsr	load_map
		bsr	decrunch_map
		rts
.not_retry
		move.l	#screen_buffer2,a2
		add.l	a4,a2
		moveq.l	#0,d1
		move.b	global_vars+curr_locn+locn_disk(a5),d1
		PRELOG_DISK #2,a2,d1

            IFND rolling_demo
		SHOW_MESG diskio_mesg_1
	    ENDC

		bsr	load_copper
		bsr	load_miscsfx
		bsr	load_moresfx
		bsr	load_miscgfx
            IFD demo
		bsr	load_mouse
		bsr	load_attract
	    ENDC

		SHOW_MESG decrunch_message

		bsr	decrunch_miscsfx
		bsr	decrunch_moresfx
		bsr	decrunch_miscgfx

		move.l	#screen_buffer2,a2
		add.l	a4,a2			;disk buffer
		moveq.l	#0,d0
		move.b	global_vars+curr_locn+locn_disk(a5),d0
		move.w	d0,loaded_disk
		moveq.l	#2,d1
		tst.w	global_vars+action_flag(a5)
		beq.s	.not_action2
		moveq.l	#1,d1
.not_action2
	    IFD	demo
		PRELOG_DISK d0,a2,d1
            ELSEIF
		LOG_DISK d0,a2,d1
	    ENDC

		SHOW_MESG diskio_mesg_1

		bsr	load_atmos
		bsr	load_water
		bsr	load_style
		bsr	load_monsters

		SHOW_MESG decrunch_message

		bsr	decrunch_style
		bsr	decrunch_atmos
		bsr	decrunch_water
		bsr	copy_figures_to_chip

		move.w	#1,variables+file_mode(a5)

		bsr	load_itemgfx
		bsr	load_map
		bsr	decrunch_itemgfx
		bsr	decrunch_map

		bsr	wait_end_static_screen
		bsr	kill_screen
		bsr	load_ex_sfx

		bsr	setup_inline_pointers

		rts

	  ELSEIF

		move.l  #screen_buffer2,a2
		add.l	a4,a2
		PRELOG_DISK #1,a2,#-1

		cmpi.w	#RESTART_RETRY,variables+restart_flag(a5)
		bne.s	.not_retry
		clr.w	variables+restart_flag(a5)
		bsr	load_map
		bsr	decrunch_map
		rts
.not_retry
		bsr	load_miscsfx
		bsr	load_miscgfx
		bsr	load_map_at_moresfx

		bsr	decrunch_miscsfx
		bsr	decrunch_miscgfx
		bsr	decrunch_map_at_moresfx

		move.w	#0,global_vars+worldmap_loc(a5)
		move.l	#moresfx,a1
		add.l   a5,a1
		move.w	#locn_struct_size-1,d0
		lea	global_vars+curr_locn(a5),a2
.loop		move.b	(a1)+,(a2)+
		dbf	d0,.loop
		move.w	global_vars+worldmap_loc(a5),global_vars+worldmap_last_locn(a5)

		clr.w	global_vars+action_flag(a5)
		move.l	#moresfx+locn_type_flag,a0
		add.l   a5,a0
		cmpi.b	#1,(a0)
		bne.s	.not_action_game
		move.w	#1,global_vars+action_flag(a5)
.not_action_game
		jsr	do_front

		bsr	load_copper
		bsr	load_atmos
		bsr	load_style
		bsr	load_monsters

		bsr	decrunch_atmos
		bsr	decrunch_style

		bsr	copy_figures_to_chip
		bsr	copy_map_from_moresfx

		bsr	load_moresfx
		bsr	load_itemgfx
		bsr	decrunch_moresfx
		bsr	decrunch_itemgfx
		bsr	load_water
		bsr	decrunch_water

		bsr	setup_inline_pointers

		rts

          ENDC

        ELSEIF

		bsr	decrunch_map
		bsr	decrunch_atmos
		bsr	decrunch_water
		bsr	decrunch_miscsfx
		bsr	decrunch_itemgfx

		bsr	setup_inline_pointers

		rts

	ENDC

********************************************************************************
load_map
		moveq.l	#0,d0
	IFND 	editor
		move.b	global_vars+curr_locn+locn_map_num(a5),d0
	ENDC
		lea	map_num,a0
 		jsr	itoa_bu
		move.l	#locn,a1
		add.l   a5,a1
		LOAD_FILE2 map_name,a1
		rts

********************************************************************************
decrunch_map
		move.l	#locn,a1
		add.l   a5,a1
		PP_DECRUNCH a1
		rts

********************************************************************************
	IFD	editor
load_map_at_moresfx
		moveq.l	#0,d0
		lea	map_num,a0
 		jsr	itoa_bu
		move.l	#moresfx,a1
		add.l   a5,a1
		LOAD_FILE2 map_name,a1
		rts

********************************************************************************
decrunch_map_at_moresfx
		move.l	#moresfx,a1
		add.l   a5,a1
		PP_DECRUNCH a1
		rts

********************************************************************************
copy_map_from_moresfx
		move.l	#moresfx,a0
		add.l   a5,a0
		move.l	#locn,a1
		add.l   a5,a1

		move.l	#(map_end-locn)/2,d0

.loop		move.w	(a0)+,(a1)+
		subi.l	#1,d0
		bne.s	.loop

                rts
	ENDC

********************************************************************************
setup_inline_pointers
		move.l	#miscgfx+game_font,a2
		add.l   a4,a2
		move.l	(a2),a2
		add.l	#miscgfx,a2
		add.l	a4,a2
		move.l	a2,d0
		add.l	d0,text_address(a2)
		rts

********************************************************************************
decrunch_itemgfx
		move.l	#item_images,a1
		add.l	a5,a1
		PP_DECRUNCH a1
		rts

********************************************************************************
load_itemgfx
		move.l	#item_images,a1
		add.l	a5,a1
		LOAD_FILE <"Game/Items.gfx">,a1
		rts

********************************************************************************
load_miscsfx
		move.l	#miscsfx,a1
		add.l	a4,a1
		LOAD_FILE <"Game/GameChip.dat">,a1
		rts

********************************************************************************
decrunch_miscsfx
		move.l	#miscsfx,a1
		add.l   a4,a1
		PP_DECRUNCH a1
		rts

********************************************************************************
load_moresfx
		move.l	#moresfx,a1
		add.l	a5,a1
		LOAD_FILE <"Game/GameFast.dat">,a1

		rts


********************************************************************************
load_water
		move.l	#water,a1
		add.l	a5,a1
		tst.l	exchip_mem_base
		beq.s	.not_ex
		move.l	#ex_water,a1
		add.l	exchip_mem_base,a1
.not_ex
		LOAD_FILE <"Atmos/Water.sfx">,a1
		rts

********************************************************************************
	IFD	demo
load_mouse
		cmp.w	#2,global_vars+attract_mode(a5)
		bne.w	.not_attract
		move.l	#mouse_moves,a1
		add.l	a5,a1
		LOAD_FILE <"Game/Mouse.dat">,a1
.not_attract	rts

********************************************************************************
load_attract
		cmp.w	#2,global_vars+attract_mode(a5)
		bne.w	.not_attract
		move.l	#logo2,a1
		add.l	a5,a1
		LOAD_FILE <"Game/Attract.dat">,a1
.not_attract	rts
	ENDC

********************************************************************************
decrunch_style
		move.l	#gamegfx,a1
		add.l   a4,a1
		PP_DECRUNCH a1
		rts

********************************************************************************
decrunch_ex_sfx
		tst.l	exchip_mem_base
		beq.s	.no_ex_sfx

		move.l	exchip_mem_base,a1
		PP_DECRUNCH a1
.no_ex_sfx
		rts

********************************************************************************
decrunch_miscgfx
		move.l	#miscgfx,a1
		add.l   a4,a1
		PP_DECRUNCH a1

		bsr	load_foreignfont

		rts

********************************************************************************
load_style
		moveq.l	#0,d0
		move.b	global_vars+curr_locn+locn_style(a5),d0
		move.w	d0,loaded_style
		lea	style_num,a0
 		jsr	itoa_bu
		move.l	#gamegfx,a1
		add.l	a4,a1
		LOAD_FILE2 style_name,a1
		rts

********************************************************************************
load_ex_sfx
		tst.l	exchip_mem_base
		beq.s	.no_ex_sfx

		move.l	#ex_effects,a1
		add.l	exchip_mem_base,a1
		LOAD_FILE <"Game/ExtraSfx.dat">,a1
.no_ex_sfx
		rts

********************************************************************************
load_monsters
		move.l	#front_figures_save+load_monster1,a1
		add.l   a5,a1
		moveq.l	#0,d0
		move.b	global_vars+curr_locn+locn_mons1(a5),d0
		move.w	d0,loaded_mons1
		tst.w	d0
		beq.s	.no_monster1
		cmpi.w	#20,d0
		beq.s	.no_monster1
		lea	mons1_num,a0
 		jsr	itoa_bu
		LOAD_FILE2 mons1_name,a1
.no_monster1

		move.l	#front_figures_save+load_monster2,a1
		add.l   a5,a1
		moveq.l	#0,d0
		move.b	global_vars+curr_locn+locn_mons2(a5),d0
		move.w	d0,loaded_mons2
		tst.w	d0
		beq.s	.no_monster2
		cmpi.w	#20,d0
		beq.s	.no_monster2
		lea	mons2_num,a0
 		jsr	itoa_bu
		LOAD_FILE2 mons2_name,a1
.no_monster2
		rts

********************************************************************************
load_miscgfx
		move.l	#miscgfx,a1
		add.l	a4,a1
		LOAD_FILE <"Game/Misc.gfx">,a1
		rts

********************************************************************************
load_foreignfont
		tst.b	lang
		beq.s	.not_forgn

		move.l	#miscgfx,a1
		add.l	a4,a1
		add.l	game_font(a1),a1

		LOAD_FILE <"Game/Foreign.font">,a1
.not_forgn
		rts

********************************************************************************
wait_end_static_screen
		cmpi.w	#3,variables+restart_flag(a5)
		beq.s	.skip_wait

		tst.w	global_vars+attract_mode(a5)
		bne.s	.skip_wait
		tst.l	os_kill
		bne.s	.skip_wait
		jsr	temp_restore_system
		jsr	wait_for_input
		jsr	temp_take_system
.skip_wait
		clr.w	variables+restart_flag(a5)
		move.w	#0,variables+file_mode(a5)

		movem.l	d0-d7/a0-a6,-(sp)
		jsr	_StopPlayer
		movem.l	(sp)+,d0-d7/a0-a6

		jsr	killaud

		rts

********************************************************************************
show_game_load_screen
		move.l	#screen_buffer1+400,a0
		add.l	a4,a0
		bsr	set_up_message_screen
		rts

********************************************************************************
decrunch_atmos
		move.l	#backsfx_buf,a1
		add.l	chip_mem_base,a1
		PP_DECRUNCH a1

		move.l	a1,global_vars+backsfx_sample(a5)
		rts

********************************************************************************
decrunch_moresfx
		move.l	#moresfx,a1
		add.l   a5,a1
		PP_DECRUNCH a1

		move.l	#mesgs,a1
		add.l	a5,a1
		move.l	#items,a2
		add.l	a5,a2
		move.b	lang,d0
		beq	.no_lang

		cmpi.b	#FRENCH,d0
		bne.s	.not_fre
		LOAD_FILE <"Game/Messages.fre">,a1
		LOAD_FILE <"Game/Items.fre">,a2
		bra	.not_spa
.not_fre
		cmpi.b	#GERMAN,d0
		bne.s	.not_ger
		LOAD_FILE <"Game/Messages.ger">,a1
		LOAD_FILE <"Game/Items.ger">,a2
		bra	.not_spa
.not_ger
		cmpi.b	#ITALIAN,d0
		bne.s	.not_ita
		LOAD_FILE <"Game/Messages.ita">,a1
		LOAD_FILE <"Game/Items.ita">,a2
		bra.s	.not_spa
.not_ita
		cmpi.b	#SPANISH,d0
		bne.s	.not_spa
		LOAD_FILE <"Game/Messages.spa">,a1
		LOAD_FILE <"Game/Items.spa">,a2
.not_spa
		move.l	#mesgs,a0
		add.l	a5,a0
		PP_DECRUNCH a0
		move.l	#items,a0
		add.l	a5,a0
		PP_DECRUNCH a0
.no_lang

		tst.l	exchip_mem_base
		beq	.no_ex_sfx

		move.l	#moresfx,a0
		add.l   a5,a0
		move.l	#ex_moresfx,a1
		add.l	exchip_mem_base,a1

		move.w	#((moresfx_size-moresfx)/4)-1,d0
.loop		move.l	(a0)+,(a1)+
		dbf	d0,.loop
.no_ex_sfx
		rts

********************************************************************************
decrunch_water
		move.l	#water,a1
		add.l	a5,a1
		tst.l	exchip_mem_base
		beq.s	.not_ex
		move.l	#ex_water,a1
		add.l	exchip_mem_base,a1
.not_ex
		PP_DECRUNCH a1

		clr.w	global_vars+water_in_buf(a5)
		move.l	a1,global_vars+water_sample(a5)
		rts

********************************************************************************
load_atmos
		moveq.l	#0,d0
		move.b	global_vars+curr_locn+locn_atmos(a5),d0
		move.w	d0,loaded_backsfx
		move.b	d0,global_vars+worldmap_back_sfx+1(a5)
		lea	atmos_num,a0
 		jsr	itoa_bu
		move.l	#backsfx_buf,a1
		add.l	chip_mem_base,a1
		LOAD_FILE2 atmos_name,a1
		rts

********************************************************************************
load_copper
		move.l	#copperlist,a1
		add.l	a4,a1
		LOAD_FILE <"Game/Game.cpr">,a1
		move.w	#0,loaded_copper
.skip3
		rts

********************************************************************************

copy_figures_to_chip
		move.l	#miscgfx,a3
		add.l	a4,a3

		move.l	#front_figures_save+figure1,a0
		add.l   a5,a0
		move.l	#miscgfx+pl1in_bob,a1
		add.l	a4,a1
		move.l	(a1),a1
		add.l	a3,a1
		bsr	copy_figure
		move.l	#front_figures_save+face1,a0
		add.l   a5,a0
		move.l	#miscgfx+face1_bob,a1
		add.l	a4,a1
		move.l	(a1),a1
		add.l	a3,a1
		bsr	copy_face

		move.l	#front_figures_save+figure2,a0
		add.l   a5,a0
		move.l	#miscgfx+pl2in_bob,a1
		add.l	a4,a1
		move.l	(a1),a1
		add.l	a3,a1
		bsr	copy_figure
		move.l	#front_figures_save+face2,a0
		add.l   a5,a0
		move.l	#miscgfx+face2_bob,a1
		add.l	a4,a1
		move.l	(a1),a1
		add.l	a3,a1
		bsr	copy_face

		move.l	#front_figures_save+figure3,a0
		add.l   a5,a0
		move.l	#miscgfx+pl3in_bob,a1
		add.l	a4,a1
		move.l	(a1),a1
		add.l	a3,a1
		bsr	copy_figure
		move.l	#front_figures_save+face3,a0
		add.l   a5,a0
		move.l	#miscgfx+face3_bob,a1
		add.l	a4,a1
		move.l	(a1),a1
		add.l	a3,a1
		bsr	copy_face

		move.l	#front_figures_save+figure4,a0
		add.l   a5,a0
		move.l	#miscgfx+pl4in_bob,a1
		add.l	a4,a1
		move.l	(a1),a1
		add.l	a3,a1
		bsr	copy_figure
		move.l	#front_figures_save+face4,a0
		add.l   a5,a0
		move.l	#miscgfx+face4_bob,a1
		add.l	a4,a1
		move.l	(a1),a1
		add.l	a3,a1
		bsr	copy_face

		move.l	#gamegfx,a3
		add.l	a4,a3

		move.b	global_vars+curr_locn+locn_mons1(a5),d0
		beq.s	.no_monsterb1
		move.l	#front_figures_save+load_monster1,a0
		add.l   a5,a0
		move.l	#front_figures_save+monster1,a1
		add.l   a5,a1
		jsr	cr_decrunch
		move.l	#front_figures_save+monster1,a0
		add.l   a5,a0
		move.l	#gamegfx+mon1in_bob,a1
		add.l	a4,a1
		move.l	(a1),a1
		add.l	a3,a1
		bsr	copy_figure
		move.l	#front_figures_save+dead1,a0
		add.l   a5,a0
		move.l	#gamegfx+monster1_dead_bob,a1
		add.l	a4,a1
		move.l	(a1),a1
		add.l	a3,a1
		bsr	copy_dead
		move.l	#front_figures_save+attck1,a0
		add.l   a5,a0
		move.l	#attack1,a1
		add.l	a5,a1
		bsr	copy_attack
.no_monsterb1

		move.b	global_vars+curr_locn+locn_mons2(a5),d0
		beq.s	.no_monsterb2
		move.l	#front_figures_save+load_monster2,a0
		add.l   a5,a0
		move.l	#front_figures_save+monster2,a1
		add.l   a5,a1
		jsr	cr_decrunch
		move.l	#front_figures_save+monster2,a0
		add.l   a5,a0
		move.l	#gamegfx+mon2in_bob,a1
		add.l	a4,a1
		move.l	(a1),a1
		add.l	a3,a1
		bsr	copy_figure
		move.l	#front_figures_save+dead2,a0
		add.l   a5,a0
		move.l	#gamegfx+monster2_dead_bob,a1
		add.l	a4,a1
		move.l	(a1),a1
		add.l	a3,a1
		bsr	copy_dead
		move.l	#front_figures_save+attck2,a0
		add.l   a5,a0
		move.l	#attack2,a1
		add.l	a5,a1
		bsr	copy_attack
.no_monsterb2
		rts

********************************************************************************

copy_figure	move.w	#(14224/4)-1,d0
.loop		move.l	(a0)+,(a1)+
		dbf	d0,.loop
		rts

copy_face	move.w	#(1126/2)-1,d0
.loop		move.w	(a0)+,(a1)+
		dbf	d0,.loop
		rts

copy_dead	move.w	#(2486/2)-1,d0
.loop		move.w	(a0)+,(a1)+
		dbf	d0,.loop
		rts

copy_attack	move.w	#(2592/2)-1,d0
.loop		move.w	(a0)+,(a1)+
		dbf	d0,.loop
		rts

********************************************************************************
*********************************** Kill Screen ********************************
********************************************************************************
;INPUT:         a6=base address of hardware registers (long)
;OUTPUT:	none
;CHANGES:       d0,a0
kill_screen
		WAIT_VBLANK
		move.w	#%0000000110100000,dmacon(a6)	;dma off

		BLACK_COLOURS
		jsr	disable_sprites

		move.w	#0,fmode(a6)
		move.w	#0,bplcon3(a6)
		move.w	#0,bplcon4(a6)

		rts

********************************************************************************
*********************** Set up hardware for front end screen *******************
********************************************************************************
;INPUT:         a6=base address of hardware registers (long)
;OUTPUT:	none
;CHANGES:	none

	IFND	demo

set_up_front_screen
		WAIT_BLIT

		WAIT_VBLANK
		move.w	#%0000000110100000,dmacon(a6)	;coppe,sprite & plane dma off
		move.w	#%1000000001000000,dmacon(a6)	;enable blitter dma
		BLACK_COLOURS
		jsr	disable_sprites

;set up bitplane pointers
		move.l	#lace_copperlist,a0
		add.l	a4,a0
		SET_UP_BITPLANE_POINTERS lace_bplpt1(a0),viewing_buffer,#lace_plane_size,#lace_num_planes
		move.l	viewing_buffer,a2
		add.w	#80,a2
		SET_UP_BITPLANE_POINTERS lace_bplpt2(a0),a2,#lace_plane_size,#lace_num_planes

		move.l	a0,d0
		move.w  d0,lace_jmpl2+2(a0)
		swap	d0
		move.w  d0,lace_jmph2+2(a0)
		move.l	#lace_copperlist+lace_clist_start2,d0
		add.l	a4,d0
		move.w  d0,lace_jmpl1+2(a0)
		swap	d0
		move.w  d0,lace_jmph1+2(a0)

		lea	lace_sprites1(a0),a1
		lea	lace_sprites2(a0),a2
		jsr	cursor_off

		move.w	#%1011000000000100,bplcon0(a6)

		WAIT_VBLANK
.not_long	btst.b	#7,vposr(a6)
		beq.s	.not_long

		START_COPPER a0
	IFD	CD32
		move.w	#%1000000100100000,dmacon(a6)	;enable sprite & bitplane dma
	ELSEIF
		move.w	#%1000000100000000,dmacon(a6)	;enable bitplane dma
	ENDC

		INITIALISE_KEYS	#front_key_list

		rts

********************************************************************************
****************** Set up hardware for character selection screen **************
********************************************************************************
;INPUT:         a6=base address of hardware registers (long)
;OUTPUT:	none
;CHANGES:	none
set_up_chselect_screen
		move.l	#ch_faces,a0
		add.l	a4,a0
		move.l	a0,viewing_buffer

		move.l	#ch_screen_buffer,a0
		add.l	a4,a0
		move.l	a0,drawing_buffer

		WAIT_BLIT
		WAIT_VBLANK
		move.w	#%0000000110100000,dmacon(a6)	;copper, sprite & plane dma off
		move.w	#%1000000001000000,dmacon(a6)	;enable blitter dma
		BLACK_COLOURS
		jsr	disable_sprites

;set up bitplane pointers
		move.l	#ch_copperlist,a0
		add.l	a4,a0
		move.l	viewing_buffer,a2
		SET_UP_BITPLANE_POINTERS chselect_bplpt1(a0),a2,#faces_plane_size,#faces_num_planes
		add.w	#faces_plane_width/8,a2
		SET_UP_BITPLANE_POINTERS chselect_bplpt2(a0),a2,#faces_plane_size,#faces_num_planes

		move.l	drawing_buffer,a2
		add.w	#-4,a2
		SET_UP_BITPLANE_POINTERS chselect_bplpt1b(a0),a2,#chselect_plane_size,#chselect_num_planes
		add.w	#chselect_plane_width/8,a2
		SET_UP_BITPLANE_POINTERS chselect_bplpt2b(a0),a2,#chselect_plane_size,#chselect_num_planes

		moveq.l	#0,d4
		move.l	a0,-(sp)
		jsr	reposition_faces
		move.l	(sp)+,a0

		move.l	a0,d0
		move.w  d0,chselect_jmpl2+2(a0)
		swap	d0
		move.w  d0,chselect_jmph2+2(a0)
		move.l	#ch_copperlist+chselect_clist_start2,d0
		add.l	a4,d0
		move.w  d0,chselect_jmpl1+2(a0)
		swap	d0
		move.w  d0,chselect_jmph1+2(a0)

		move.w	#%1011000000000100,bplcon0(a6)

		WAIT_VBLANK
.not_long	btst.b	#7,vposr(a6)
		beq.s	.not_long

		START_COPPER a0
		move.w	#%1000000100000000,dmacon(a6)	;enable bitplane dma

		INITIALISE_KEYS	#chselect_key_list

		rts

	ENDC

********************************************************************************
*********************** Set up hardware for message screen *********************
********************************************************************************
;INPUT:		a0=address of screen memory (long)
;		a6=base address of hardware registers (long)
;OUTPUT:	none
;CHANGES:	none
set_up_message_screen
		tst.l	os_kill
		bne	.os_dead
		jsr	kill_screen
		rts
.os_dead
	IFND	CD32
		move.l	a0,viewing_buffer
		move.l	a0,drawing_buffer

		move.l	#lc_mesg_copperlist+2,a0
		add.l	a4,a0
		bsr	.black_mesg_palette
		move.l	#lc_mesg_copperlist+2+43*4,a0
		add.l	a4,a0
		bsr	.black_mesg_palette

;set up bitplane pointers
		SET_UP_BITPLANE_POINTERS lc_mesg_copperlist+mesg_bplpt1(a4),viewing_buffer,#mesg_plane_size,#mesg_num_planes
		move.l	viewing_buffer,a2
		add.w	#80,a2
		SET_UP_BITPLANE_POINTERS lc_mesg_copperlist+mesg_bplpt2(a4),a2,#mesg_plane_size,#mesg_num_planes

		move.l	#lc_mesg_copperlist+mesg_clist_start1,d0
		add.l	a4,d0
		move.w  d0,lc_mesg_copperlist+mesg_jmpl2+2(a4)
		swap	d0
		move.w  d0,lc_mesg_copperlist+mesg_jmph2+2(a4)
		move.l	#lc_mesg_copperlist+mesg_clist_start2,d0
		add.l	a4,d0
		move.w  d0,lc_mesg_copperlist+mesg_jmpl1+2(a4)
		swap	d0
		move.w  d0,lc_mesg_copperlist+mesg_jmph1+2(a4)

		DELAY #50
		BLIT_FILL viewing_buffer,#mesg_plane_width/16,#mesg_plane_height,#mesg_num_planes,#mesg_plane_size,#0
		WAIT_BLIT

		WAIT_VBLANK
		jsr	disable_sprites
		move.w	#%1011000000000100,bplcon0(a6)

		btst.b	#7,vposr(a6)
		beq.s	.start2
		move.l	#lc_mesg_copperlist+mesg_clist_start1,a0
		bra.s	.start3
.start2		move.l	#lc_mesg_copperlist+mesg_clist_start2,a0
.start3		add.l	a4,a0
		START_COPPER a0
		move.w	#%1000000100000000,dmacon(a6)	;enable bitplane dma

		move.l	#lc_mesg_copperlist+2,a0
		add.l	a4,a0
		bsr	.setup_mesg_palette
		move.l	#lc_mesg_copperlist+2+43*4,a0
		add.l	a4,a0
		bsr	.setup_mesg_palette

		BOB_INFO viewing_buffer,#mesg_plane_width/8,#mesg_plane_height,#mesg_num_planes,#0,#0,#mesg_plane_width,#mesg_plane_height-1,#0

		INITIALISE_KEYS	#mesg_key_list

		rts

.black_mesg_palette
		clr.w	4*16(a0)		;setup palette
		clr.w	4*17(a0)
		clr.w	4*18(a0)
		clr.w	4*19(a0)
		clr.w	4*20(a0)
		clr.w	4*21(a0)
		clr.w	4*22(a0)
		clr.w	4*23(a0)
		clr.w	4*25(a0)
		clr.w	4*27(a0)
		clr.w	4*29(a0)
		clr.w	4*31(a0)
		clr.w	4*33(a0)
		clr.w	4*35(a0)
		clr.w	4*37(a0)
		clr.w	4*39(a0)
		rts

.setup_mesg_palette
		move.w	#$000,4*16(a0)		;setup palette
		move.w	#$fff,4*17(a0)
		move.w	#$dde,4*18(a0)
		move.w	#$bbd,4*19(a0)
		move.w	#$99c,4*20(a0)
		move.w	#$77a,4*21(a0)
		move.w	#$558,4*22(a0)
		move.w	#$347,4*23(a0)

		move.w	#$347,4*25(a0)
		move.w	#$458,4*27(a0)
		move.w	#$569,4*29(a0)

		move.w	#$236,4*31(a0)

		move.w	#$024,4*33(a0)
		move.w	#$113,4*35(a0)
		move.w	#$202,4*37(a0)

		move.w	#$000,4*39(a0)
		rts

mesg_palette	dc.w	$fff
		dc.w	$ccd
		dc.w	$aac
		dc.w	$88a
		dc.w	$669
		dc.w	$447
		dc.w	$224

	ENDC

		rts

********************************************************************************
*************************** Set up hardware for game screen ********************
********************************************************************************
;INPUT:         a6=base address of hardware registers (long)
;OUTPUT:	none
;CHANGES:	none
set_up_game_screen
		jsr	killaud
		bclr	#1,$bfe001		;switch filter off

		WAIT_VBLANK
		jsr	kill_screen
		jsr	disable_sprites
		move.w	#MODE_GAME,variables+mode(a5)

		move.l  #screen_buffer1,a0
		add.l	a4,a0
		move.l	a0,viewing_buffer
		move.l  #screen_buffer2,a0
		add.l	a4,a0
		move.l	a0,drawing_buffer

		BLIT_FILL viewing_buffer,#views_plane_width/16,#views_plane_height,#views_num_planes,#views_plane_size,#0
		BLIT_FILL drawing_buffer,#views_plane_width/16,#views_plane_height,#views_num_planes,#views_plane_size,#0
		move.l	#scrolly,a0
		add.l	a4,a0
		BLIT_FILL a0,#scrolly_plane_width/16,#scrolly_plane_height,#scrolly_num_planes,#scrolly_plane_size,#0

		move.l	#copperlist+views_bplpt,a0
		add.l	a4,a0
		SET_UP_BITPLANE_POINTERS (a0),viewing_buffer,#views_plane_size,#views_num_planes

		move.l	#copperlist+scrolly_bplpt1,a0
		add.l	a4,a0
                move.l	#scrolly,a1
		add.l	a4,a1
		SET_UP_BITPLANE_POINTERS (a0),a1,#scrolly_plane_size,#scrolly_num_planes

		move.l	#copperlist+scrolly_bplpt2,a0
		add.l	a4,a0
		move.l	viewing_buffer,a1
		add.l	#views_split*views_plane_width/8,a1
		SET_UP_BITPLANE_POINTERS (a0),a1,#views_plane_size,#views_num_planes

                move.l	#miscgfx+logo_bob,a1
		add.l	a4,a1
		move.l	(a1),a1
		add.l	#miscgfx,a1
		add.l	a4,a1
		move.l	#copperlist+logo_bplpt1,a0
		add.l	a4,a0
		SET_UP_BITPLANE_POINTERS (a0),a1,#logo_plane_size,#logo_num_planes

		INITIALISE_KEYS	#game_key_list

		rts

game_screen_on	bsr	gs_part1
		bsr	gs_part2
		jsr	unfill2
		bsr	gs_part3
		rts

game_screen_on2
		bsr	gs_part2
		bsr	gs_part1
		bsr	gs_part3
		rts

game_screen_on3	bsr	gs_part1
		bsr	gs_part3
		rts

gs_part1	WAIT_VBLANK
		bsr	kill_screen
		move.w	#MODE_GAME,variables+mode(a5)
		rts

gs_part3
		move.l	#copperlist,a1
		add.l	a4,a1
		DISPLAY_PALETTE game_palette,views_palette(a1)
		WAIT_VBLANK
		lea	clist_start(a1),a0
		START_COPPER a0
		move.w	#%1000000100100000,dmacon(a6)	;enable sprite & bitplane dma
		rts

gs_part2	move.w	#-1,variables+player1+old_sky_flag(a5)
		move.w	#-1,variables+player2+old_sky_flag(a5)
		move.w	#-1,variables+player3+old_sky_flag(a5)
		move.w	#-1,variables+player4+old_sky_flag(a5)
		move.w	#0,variables+player1+sky_flag(a5)
		move.w	#0,variables+player2+sky_flag(a5)
		move.w	#0,variables+player3+sky_flag(a5)
		move.w	#0,variables+player4+sky_flag(a5)
		jsr	update_sky
		rts

********************************************************************************
*************************** Set up hardware for game screen ********************
********************************************************************************
;INPUT:		a0.l=address of 64000 bytes of chip (for db screen)
;		a6.l=base address of hardware registers
;OUTPUT:	none
;CHANGES:	none
set_up_anim_screen
		WAIT_VBLANK
		move.w	#%0000000110100000,dmacon(a6)	;disable sprite, copper & bitplane dma
		jsr	disable_sprites

		move.l	#lc_anim_copperlist,a0
		add.l	a4,a0

		SET_UP_BITPLANE_POINTERS anim_bplpt(a0),viewing_buffer,#anim_plane_size,#anim_num_planes
		move.w	#%0010000000000000,bplcon0(a6)	;2 bitplanes
		WAIT_VBLANK
		START_COPPER a0
		move.w	#%1000000110000000,dmacon(a6)	;stat copper & bitplane dma

		INITIALISE_KEYS	#anim_key_list

		rts

anim_key_list
anim_key_down	dc.b	0
anim_key_up	dc.b	0

anim_esc	dc.b	0,$45,0		;escape

		dc.b	0,$ff,0		;eod marker

		even

********************************************************************************
*************************** Set up hardware for map screen *********************
********************************************************************************
;INPUT:         a6=base address of hardware registers (long)
;OUTPUT:	none
;CHANGES:	none
set_up_map_screen
		movem.l	d0-d7/a0-a6,-(sp)
		move.l	chip_mem_base,a4
		jsr	kill_screen

		move.w	#%0110100000000000,bplcon0(a6)	;6 bitplanes + HAM
		move.w	#50,d0				;re-sync
.wait
		WAIT_VBLANK
		dbf	d0,.wait

		move.l	#worldmap_copperlist,a0
		add.l	a4,a0

	IFD	CD32
		move.l	#ex_effects,a1
		add.l	exchip_mem_base,a1
	ELSEIF
		move.l	#worldmap_map,a1
		add.l	a4,a1
	ENDC
		SET_UP_BITPLANE_POINTERS map_bplpt1(a0),a1,#map_plane_size,#map_num_planes
		move.l	#worldmap_panel,a1
		add.l	a4,a1
		SET_UP_BITPLANE_POINTERS map_bplpt2(a0),a1,#map_p_plane_size,#map_p_num_planes
		WAIT_VBLANK
		START_COPPER a0

		move.w	#%1000000100100000,dmacon(a6)	;enable sprite & bitplane dma

		move.l	a0,a2
	IFND	CD32
		DISPLAY_PALETTE worldmap_palette,map_palette(a2)
	ENDC
		DISPLAY_PALETTE worldmap_palette2,map_palette2(a2)

		INITIALISE_KEYS	#map_key_list

		movem.l	(sp)+,d0-d7/a0-a6
		rts

********************************************************************************
************************ Set up hardware for static screen *********************
********************************************************************************
;INPUT:         a6=base address of hardware registers (long)
;OUTPUT:	none
;CHANGES:	none
set_up_static_screen
		WAIT_VBLANK
		jsr	disable_sprites
		jsr	kill_screen

		tst.l	text
		bne	.text

		move.l	#static_copperlist_notext,a0
		add.l	exchip_mem_base,a0

		move.l	viewing_buffer,a1
		SET_UP_BITPLANE_POINTERS static2_bplpt1(a0),a1,#static_plane_size,#static_num_planes
		add.w	#80,a1
		SET_UP_BITPLANE_POINTERS static2_bplpt2(a0),a1,#static_plane_size,#static_num_planes

		move.l	a0,d0
		move.w  d0,static2_jmpl2+2(a0)
		swap	d0
		move.w  d0,static2_jmph2+2(a0)
		move.l	#static_copperlist_notext+static_clist_start2,d0
		add.l	exchip_mem_base,d0
		move.w  d0,static2_jmpl1+2(a0)
		swap	d0
		move.w  d0,static2_jmph1+2(a0)

		bsr	set_up_static_palette2

		move.w	#%1000100000010100,bplcon0(a6)

		move.l	#static_copperlist_notext,a0
		add.l	exchip_mem_base,a0

		bra	.skip_text
.text
		move.l	#static_copperlist,a0
		add.l	exchip_mem_base,a0

		move.l	viewing_buffer,a1
		SET_UP_BITPLANE_POINTERS static_bplpt1(a0),a1,#static_plane_size,#static_num_planes
		add.w	#80,a1
		SET_UP_BITPLANE_POINTERS static_bplpt2(a0),a1,#static_plane_size,#static_num_planes

		move.l	drawing_buffer,a1
		SET_UP_BITPLANE_POINTERS static_bplptb1(a0),a1,#static_p_plane_size,#static_p_num_planes
		add.w	#80,a1
		SET_UP_BITPLANE_POINTERS static_bplptb2(a0),a1,#static_p_plane_size,#static_p_num_planes

		move.l	a0,d0
		move.w  d0,static_jmpl2+2(a0)
		swap	d0
		move.w  d0,static_jmph2+2(a0)
		move.l	#static_copperlist+static_clist_start2,d0
		add.l	exchip_mem_base,d0
		move.w  d0,static_jmpl1+2(a0)
		swap	d0
		move.w  d0,static_jmph1+2(a0)

		bsr	set_up_static_palette

		move.w	#%1000100000010100,bplcon0(a6)

		move.l	#static_copperlist,a0
		add.l	exchip_mem_base,a0
.skip_text

		WAIT_VBLANK
.not_long	btst.b	#7,vposr(a6)
		beq.s	.not_long

		START_COPPER a0
		move.w	#%1000000100000000,dmacon(a6)	;enable bitplane dma

		INITIALISE_KEYS	#static_key_list

		WAIT_VBLANK
		move.w	#%1000000100000000,dmacon(a6)	;enable bitplane dma

		rts

set_up_static_palette
		movem.l	d0-d5/a0-a4,-(sp)

		move.l	viewing_buffer,a1
		add.l	#static_plane_size*static_num_planes,a1

		move.l	#static_copperlist+static_palette1,a0
		add.l	exchip_mem_base,a0
		move.l	#static_copperlist+static_palette2,a2
		add.l	exchip_mem_base,a2
		move.l	#static_copperlist+static_palette1+33*4,a3
		add.l	exchip_mem_base,a3
		move.l	#static_copperlist+static_palette2+33*4,a4
		add.l	exchip_mem_base,a4

		bsr	do_colours

		move.l	#static_copperlist+static_palette1+66*4,a0
		add.l	exchip_mem_base,a0
		move.l	#static_copperlist+static_palette2+66*4,a2
		add.l	exchip_mem_base,a2
		move.l	#static_copperlist+static_palette1+66*4+33*4,a3
		add.l	exchip_mem_base,a3
		move.l	#static_copperlist+static_palette2+66*4+33*4,a4
		add.l	exchip_mem_base,a4

		bsr	do_colours

		movem.l	(sp)+,d0-d5/a0-a4
		rts

set_up_static_palette2
		movem.l	d0-d5/a0-a4,-(sp)

		move.l	viewing_buffer,a1
		add.l	#static_plane_size*static_num_planes,a1

		move.l	#static_copperlist+static2_palette1,a0
		add.l	exchip_mem_base,a0
		move.l	#static_copperlist+static2_palette2,a2
		add.l	exchip_mem_base,a2
		move.l	#static_copperlist+static2_palette1+33*4,a3
		add.l	exchip_mem_base,a3
		move.l	#static_copperlist+static2_palette2+33*4,a4
		add.l	exchip_mem_base,a4

		bsr	do_colours

		move.l	#static_copperlist+static2_palette1+66*4,a0
		add.l	exchip_mem_base,a0
		move.l	#static_copperlist+static2_palette2+66*4,a2
		add.l	exchip_mem_base,a2
		move.l	#static_copperlist+static2_palette1+66*4+33*4,a3
		add.l	exchip_mem_base,a3
		move.l	#static_copperlist+static2_palette2+66*4+33*4,a4
		add.l	exchip_mem_base,a4

		bsr	do_colours

		movem.l	(sp)+,d0-d5/a0-a4
		rts

do_colours
		move.w	#31,d5

.next_colour	move.l	(a1)+,d0
		move.l	#$ffffff,d0
		moveq.l	#0,d2
		moveq.l	#0,d4

		move.b	d0,d3
		and.b	#$f,d3
		move.b	d3,d4				;get lo blue nibble
		lsr.l	#4,d0
		move.b	d0,d1
		and.b	#$f,d1
		move.b	d1,d2				;get hi blue nibble

		move.b	d0,d3
		and.b	#$f0,d3
		or.b	d3,d4				;get lo green nibble
		lsr.l	#4,d0
		move.b	d0,d1
		and.b	#$f0,d1
		or.b	d1,d2				;get hi green nibble

		move.w	d0,d3
		and.w	#$f00,d3
		or.w	d3,d4				;get lo red nibble
		lsr.l	#4,d0
		move.w	d0,d1
		and.w	#$f00,d1
		or.w	d1,d2				;get hi red nibble

		move.w	d2,2(a0)
		move.w	d2,2(a2)
		add.w	#4,a0
		add.w	#4,a2

		move.w	d4,2(a3)
		move.w	d4,2(a4)
		add.w	#4,a3
		add.w	#4,a4

		dbf	d5,.next_colour

		rts


********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:         a6=base address of hardware registers (long)
;		a0=address of bitmaps (long)
;OUTPUT:	none
;CHANGES:	none
set_up_intro_screen
		move.l	a0,viewing_buffer
		move.l	a0,drawing_buffer

		WAIT_VBLANK
		jsr	disable_sprites
		jsr	kill_screen

		move.w	#%1000000001000000,dmacon(a6)	;enable blitter dma

		WAIT_BLIT
		WAIT_VBLANK
		move.w	#%0000000110000000,dmacon(a6)	;copper & plane dma off
		BLACK_COLOURS

		move.l  #intro_copper,a0
		add.l	a4,a0
		SET_UP_BITPLANE_POINTERS intro_bplpt(a0),viewing_buffer,#intro_plane_size,#intro_num_planes
		move.l	viewing_buffer,a1
		add.w	#intro_plane_width/8,a1
		SET_UP_BITPLANE_POINTERS intro_bplpt2(a0),a1,#intro_plane_size,#intro_num_planes

		move.l	#intro_copper+intro_clist_start,d0
		add.l	a4,d0
		move.w  d0,intro_jmpl2+2(a0)
		swap	d0
		move.w  d0,intro_jmph2+2(a0)
		move.l	#intro_copper+intro_clist_start2,d0
		add.l	a4,d0
		move.w  d0,intro_jmpl+2(a0)
		swap	d0
		move.w  d0,intro_jmph+2(a0)

		move.w	#%1011000000000100,bplcon0(a6)
.not_long	btst.b	#7,vposr(a6)
		beq.s	.not_long

		START_COPPER a0
		move.w	#%1000000100000000,dmacon(a6)	;enable bitplane dma

		move.l	a0,a2

		move.l	viewing_buffer,a0
		add.l	#intro_plane_size*intro_num_planes,a0
		DISPLAY_PALETTE (a0),intro_palette(a2)

		move.l	viewing_buffer,a0
		add.l	#intro_plane_size*intro_num_planes,a0
		DISPLAY_PALETTE (a0),intro_palette2(a2)

		INITIALISE_KEYS	#intro_key_list

		rts

********************************************************************************
********************************* Responsive keys ******************************
********************************************************************************
		even
;Format : keydown, keycode, release
; Keydown is set while the key is pressed.
; Use keycode as specified in Hardware Reference Manual page 249.
; Set release for keyup messages to be interpreted.

game_key_list
game_key_down	dc.b	0
game_key_up	dc.b	0
kb1up		dc.b	0,$10,0		;q
kb1down		dc.b	0,$20,0		;a
kb1left		dc.b	0,$18,0		;o
kb1right	dc.b	0,$19,0		;p
kb1fire		dc.b	0,$40,1		;space
kb1pickup	dc.b	0,$17,0		;i

kb2up		dc.b	0,$10,0		;q
kb2down		dc.b	0,$20,0		;a
kb2left		dc.b	0,$14,0		;t
kb2right	dc.b	0,$15,0		;y
kb2fire		dc.b	0,$40,1		;space
kb2pickup	dc.b	0,$13,0		;r

kb3up		dc.b	0,$4c,0		;cursor up
kb3down		dc.b	0,$4d,0		;cursor down
kb3left		dc.b	0,$3f,0		;kp 9
kb3right	dc.b	0,$4a,0		;kp -
kb3fire		dc.b	0,$0f,1		;kp 0
kb3pickup	dc.b	0,$3e,0		;kp 8

kb4up		dc.b	0,$4c,0		;cursor up
kb4down		dc.b	0,$4d,0		;cursor down
kb4left		dc.b	0,$4f,0		;cursor left
kb4right	dc.b	0,$4e,0		;cursor right
kb4fire		dc.b	0,$61,1		;right shift
kb4pickup	dc.b	0,$44,0		;return

kbf1		dc.b	0,$50,0		;f1
kbf2		dc.b	0,$51,0		;f2
kbf3		dc.b	0,$52,0		;f3
kbf4		dc.b	0,$53,0		;f4
kbf6		dc.b	0,$55,1		;f6
kbf7		dc.b	0,$56,1		;f7
kbf8		dc.b	0,$57,0		;f8
kbf9		dc.b	0,$58,0		;f9
ctrl		dc.b	0,$63,1		;control
freeze_frame	dc.b	0,$23,1		;f
save_game	dc.b	0,$21,1		;s
load_game	dc.b	0,$28,1		;l
quit_game	dc.b	0,$10,1		;q
abort_game	dc.b	0,$20,1		;a
exit_game	dc.b	0,$45,1		;esc
retry_game	dc.b	0,$13,1		;r
wbench_front	dc.b	0,$11,1		;w
grab_screen	dc.b	0,$24,1		;g
help		dc.b	0,$5f,1		;help

		IFD	CHEAT
gedit_on	dc.b	0,$5d,0		;keypad *
gedit_next	dc.b	0,$5e,0		;keypad +
gedit_last	dc.b	0,$4a,0		;keypad -
gedit_up	dc.b	0,$3e,0		;keypad 8
gedit_down	dc.b	0,$1e,0		;keypad 2
gedit_left	dc.b	0,$2d,0		;keypad 4
gedit_right	dc.b	0,$2f,0		;keypad 6
gedit_flip	dc.b	0,$0f,0		;keypad 0
gedit_mirror_up	dc.b	0,$3d,0		;keypad 7
gedit_mirror_dn	dc.b	0,$1d,0		;keypad 1
gedit_sl_floor	dc.b	0,$01,0		;1
gedit_sl_block	dc.b	0,$02,0		;2
gedit_sl_water	dc.b	0,$03,0		;3
gedit_sl_panel	dc.b	0,$04,0		;4
gedit_sl_expl	dc.b	0,$05,0		;5
gedit_sl_aux	dc.b	0,$06,0		;6
gedit_save	dc.b	0,$43,1		;keypad 'enter'
attract_save	dc.b	0,$55,1		;f6
ntsc_mode	dc.b	0,$57,0		;f8
pal_mode	dc.b	0,$58,0		;f9
		ENDC

		dc.b	0,$ff,0		;eod marker

                even

;Format : keydown, keycode, release
; Keydown is set while the key is pressed.
; Use keycode as specified in Hardware Reference Manual page 249.
; Set release for keyup messages to be interpreted.

mesg_key_list
mesg_key_down	dc.b	0
mesg_key_up	dc.b	0
mesg_esc	dc.b	0,$45,0		;escape
		dc.b	0,$ff,0		;eod marker

                even

help_key_list
help_key_down	dc.b	0
help_key_up	dc.b	0
helpf1		dc.b	0,$50,0		;f1
helpf2		dc.b	0,$51,0		;f2
helpf3		dc.b	0,$52,0		;f3
helpf4		dc.b	0,$53,0		;f4
helpwhoops	dc.b	0,$45,1		;esc
		dc.b	0,$ff,0		;eod marker

                even

dummy_key_list
dummy_key_down	dc.b	0
dummy_key_up	dc.b	0
		dc.b	0,$ff,0		;eod marker

                even

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a6.l=base address of hardware registers
;		d0.b=disk number to log
;		d1.b=next disk
;		a2.l=disk buffer
;OUTPUT:	none
;CHANGES:	none

prelog_disk
        IFD	demo
		moveq.l	#1,d0
		moveq.l	#1,d1
	ENDC

		tst.l	os_kill
		bne	.os_dead
		rts
.os_dead
	        movem.l	a0-a1/d1,-(sp)

		tst.b	d1
		bpl.s	.not_neg
		move.b	#"?",d1
		bra.s	.skip_not_neg
.not_neg	add.b	#"\"-1,d1
.skip_not_neg
		move.b	d1,next_disk1
		move.b	d1,next_disk2

		move.b	#"0",log_disk_name+2
		move.l	a2,current_disk_buffer

		move.b	#"0",log_file_name+4
		add.b	d0,log_file_name+4
		move.b	log_file_name+4,disk_number1
		move.b	log_file_name+4,disk_number2
		move.b	log_file_name+4,disk_number3
		move.b	log_file_name+4,disk_number4
		move.b	log_file_name+4,disk_number5

		move.w	d0,variables+curr_disk(a5)

	        movem.l	(sp)+,a0-a1/d1
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a6.l=base address of hardware registers
;		d0.b=disk number to log
;		d1.b=next disk
;		a2.l=disk buffer
;OUTPUT:        d0.l=error number
;CHANGES:	none

log_disk
        IFD	demo
		moveq.l	#1,d0
		moveq.l	#1,d1
	ENDC

		tst.l	os_kill
		bne	.os_dead
		moveq.l	#0,d0
		rts
.os_dead
	        movem.l	a0-a1/d1,-(sp)

		tst.b	d1
		bpl.s	.not_neg
		move.b	#"?",d1
		bra.s	.skip_not_neg
.not_neg	add.b	#"\"-1,d1
.skip_not_neg
		move.b	d1,next_disk1
		move.b	d1,next_disk2

		move.b	#"0",log_disk_name+2
		move.l	a2,current_disk_buffer

		move.b	#"0",log_file_name+4
		add.b	d0,log_file_name+4
		move.b	log_file_name+4,disk_number1
		move.b	log_file_name+4,disk_number2
		move.b	log_file_name+4,disk_number3
		move.b	log_file_name+4,disk_number4
		move.b	log_file_name+4,disk_number5

		move.w	d0,variables+curr_disk(a5)

		lea	log_disk_name(pc),a0
		lea	log_buffer(pc),a1

		moveq.l	#3,d2			;try four drives
		move.w	#0,d3
.loop
		btst.b	d3,config_info+1
		beq.s	.no_disk

		move.w	d3,-(sp)
		moveq.l	#0,d0			;function = load file
		jsr	dosio
		move.w	(sp)+,d3
		tst.l	d0
		beq.s	.found			;branch if no error

.no_disk	addq.w	#1,d3
		add.b	#1,log_disk_name+2      ;try next drive
		dbf	d2,.loop
		move.w	#205,d0			;error: file not found

.found		move.b	log_disk_name+2,disk_name+2

	        movem.l	(sp)+,a0-a1/d1
		rts

log_disk_name	dc.b	"DF0:"
log_file_name	dc.b	"Disk0",0

current_disk_buffer
		dc.l    0
log_buffer	ds.l	20

log_disk_code
		movem.l	d0-d1/a2,-(sp)

		move.b	#"0",disk_number4
		add.b	d0,disk_number4

		move.b	config_info+1,d0
		andi.b	#$f,d0
		cmpi.b	#1,d0
		beq.s	.no_mesg
		move.l	d3,-(sp)
		SHOW_MESG diskio_mesg_2			;"searching for disk x"
		move.l	(sp)+,d3
.no_mesg

.retry		movem.l	d1/d3/a2,-(sp)
		move.l	d3,d0				;disk number
		jsr	log_disk
		jsr	disk_error
		movem.l	(sp)+,d1/d3/a2
		tst.l   d0
		bne.s	.retry

		movem.l	(sp)+,d0-d1/a2
                rts


********************************************************************************
;INPUT:		a6.l=base address of hardware registers (long)
;		a0.l=filename
;               a1.l=destination
;OUTPUT:        d0.l=error number
;               d1.l=file length
;CHANGES:	none
load_file

		tst.l	os_kill
		bne	.os_dead

		movem.l a0-a3,-(sp)
		jsr	temp_restore_system
		move.l	a0,a2
		move.l	a1,a3
		jsr	dos_load_file
		jsr	temp_take_system
		movem.l (sp)+,a0-a3
		tst.l	d0
		beq	.no_error
		tst.l	os_kill
		bne	.no_error
		jsr	restore_system
		move.l	stack_ptr,a7
		moveq.l	#-1,d0
.no_error	rts
.os_dead
		movem.l	a0-a3,-(sp)

		move.l	current_disk_buffer,a2	;disk buffer
		moveq.l	#0,d0			;load file

		lea	file_name(pc),a3
.next_char	move.b	(a0)+,(a3)+
		bne.s	.next_char

		lea	disk_name(pc),a0	;file name

		jsr	dosio

		movem.l	(sp)+,a0-a3
		rts

disk_name	dc.b    "DF0:"
file_name	ds.b	100

********************************************************************************
;INPUT:		a6.l=base address of hardware registers (long)
;		a0.l=filename
;               a1.l=source
;		d3.l=length
;OUTPUT:        d0.l=error number
;CHANGES:	none
save_file

		tst.l	os_kill
		bne	.os_dead

		movem.l a0-a3,-(sp)
		jsr	temp_restore_system
		move.l	a0,a2
		move.l	a1,a3
		jsr	dos_save_file
		jsr	temp_take_system
		movem.l (sp)+,a0-a3
		tst.l	d0
		beq	.no_error
		tst.l	os_kill
		bne	.no_error
		jsr	restore_system
		move.l	stack_ptr,a7
		moveq.l	#-1,d0
.no_error	rts
.os_dead
		movem.l	a0-a3,-(sp)

		move.l	current_disk_buffer,a2	;disk buffer
		moveq.l	#1,d0			;load file

		lea	file_name(pc),a3
.next_char	move.b	(a0)+,(a3)+
		bne.s	.next_char

		lea	disk_name(pc),a0	;file name
		move.l	d3,d1

		jsr	dosio

		movem.l	(sp)+,a0-a3
		rts

********************************************************************************
********************************************************************************
********************************************************************************
;INPUT:		a6.l=base address of hardware registers
;		d0.l=error number
;OUTPUT:	d0.l=error number
;CHANGES:	none

disk_error
		movem.l	a0-a2,-(sp)

		tst.l	d0
		beq	.no_error
		tst.l	os_kill
		bne	.os_dead
		jsr	restore_system
		move.l	stack_ptr,a7
		moveq.l	#-1,d0
		rts
.os_dead
		tst.w	variables+file_mode(a5)
		beq.s	.not_covert
		ERROR_COLOUR #$f00
		bra	.no_error
.not_covert
		lea	err_misc,a3	;"disk error"

		cmp.l	#30,d0      	;seek error?
		bne	.not_err204
		lea	err205,a3	;"insert disk"
.not_err30
		cmp.l	#204,d0      	;directory not found?
		bne	.not_err204
		lea	err205,a3	;"insert disk"
.not_err204
		cmp.l	#205,d0      	;file not found?
		bne	.not_err205
		lea	err205,a3	;"insert disk"
.not_err205
		cmp.l	#29,d0		;no disk in drive?
		bne	.not_err29
		lea	err205,a3	;"insert disk"
.not_err29
		cmp.l	#221,d0		;disk full
		bne	.not_err221
		lea	err221,a3	;"disk full"
.not_err221
		cmp.l	#28,d0		;write protected
		bne	.not_err28
		lea	err28,a3	;"write protected"
.not_err28
		cmp.l	#225,d0		;not a dos disk
		bne	.not_err225
		lea	err225,a3	;"not a dos disk"
.not_err225
		cmp.l	#405,d0		;bad block checksum
		bne	.not_err405
		lea	err405,a3	;"disk corrupt"
.not_err405

.error		jsr	show_message

		jsr     wait_for_input

.no_error	movem.l	(sp)+,a0-a2
		rts

err205		dc.b	ABSPOS,0>>8,0,0>>8,0
		dc.b	CENTRE
		PHRASE	90
disk_number1	dc.b	"0",NEWLINE
		PHRASE	91
		dc.b    ENDTEXT

err221		dc.b	ABSPOS,0>>8,0,0>>8,0
		PHRASE	92
		dc.b    ENDTEXT

err225		dc.b	ABSPOS,0>>8,0,0>>8,0
		PHRASE	93
		dc.b    ENDTEXT

err405		dc.b	ABSPOS,0>>8,0,0>>8,0
		PHRASE	94
		dc.b    ENDTEXT

err28		dc.b	ABSPOS,0>>8,0,0>>8,0
		PHRASE	95
		dc.b    ENDTEXT

err_misc	dc.b	ABSPOS,0>>8,0,0>>8,0
		PHRASE	96
disk_number2	dc.b	"0",NEWLINE,NEWLINE
		PHRASE	97
		dc.b    ENDTEXT

diskio_mesg_1	dc.b	ABSPOS,0>>8,0,0>>8,0
		PHRASE	98
disk_number3	dc.b	"0",RELPOS,0>>510,510&$ff,0,0,"=> "
next_disk1	dc.b	"\",NEWLINE
		PHRASE	99
		dc.b    ENDTEXT

diskio_mesg_2	dc.b	ABSPOS,0>>8,0,44>>8,44
		dc.b	CENTRE
		PHRASE  100
disk_number4	dc.b	"0"
		PHRASE  240
		dc.b    ENDTEXT

decrunch_message
		dc.b	ABSPOS,0>>8,0,0>>8,0
		PHRASE	101
disk_number5	dc.b	"0",RELPOS,0>>510,510&$ff,0,0,"=> "
next_disk2	dc.b	"\",NEWLINE
		PHRASE	102
		dc.b    ENDTEXT

********************************************************************************

		even

load_file_quick
		move.l	d0,-(sp)
		move.l	a0,_a0
		move.l	a1,_a1

.retry		move.l	_a0,a0				;a0=filename
		move.l  _a1,a1				;a1=file buffer (dest)
		jsr	load_file
		jsr	disk_error
		tst.l	d0
		beq.s	.no_error
		tst.w	variables+file_mode(a5)
		bne	.no_error
		SHOW_MESG diskio_mesg_1
.no_error
		tst.l	d0
		bne.s	.retry

		move.l	(sp)+,d0
		rts

_a0		dc.l	0
_a1		dc.l	0

load_file2_quick
		move.l	d0,-(sp)
		move.l	a0,_a0
		move.l	a1,_a1

.retry		move.l	_a0,a0				;a0=filename
		move.l  _a1,a1				;a1=file buffer (dest)
		jsr	load_file
		jsr	disk_error
		tst.l	d0
		beq.s	.no_error
		tst.w	variables+file_mode(a5)
		bne	.no_error
		SHOW_MESG diskio_mesg_1
.no_error
		tst.l	d0
		bne.s	.retry

		move.l	(sp)+,d0
		rts

error_colour_quick
		move.l	d0,-(sp)
		move.w	#100,d0
.loopb		sf.b	top_scr
.loop		move.w	d1,$dff180
		tst.b	top_scr			;vblank flag set?
		beq.s	.loop
		dbf	d0,.loopb
		move.l	(sp)+,d0
		rts

********************************************************************************
************************************* Palette **********************************
********************************************************************************

game_palette	dc.w	$000,$edc,$a98,$654,$432,$000,$fff,$251
		dc.w	$4f4,$f44,$130,$620,$841,$962,$400,$300
		dc.w	$122,$8ba,$487,$255,$033,$122,$ff0,$052
		dc.w	$072,$b23,$100,$900,$700,$fff,$300,$500
ending
		IFLE	(code_size-phrasebook_size)-(ending-begining)
		fail	Code too large!
		ENDC

		end
