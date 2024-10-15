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

		include	/takeover/takeover.i

********************************************************************************
*********************************** Game Equates *******************************
********************************************************************************
;Bitplanes

views_plane_width	equ	320		;width in pixels
views_plane_height	equ	212		;height in pixels
	IFD	CD32
views_num_planes	equ	6
	ELSEIF
views_num_planes	equ	5
	ENDC
views_plane_size	equ	(views_plane_width/8)*views_plane_height
views_split		equ	104

scrolly_plane_width	equ	384		;width in pixels
scrolly_plane_height	equ	9		;height in pixels
scrolly_num_planes	equ     2
scrolly_plane_size	equ	(scrolly_plane_width/8)*scrolly_plane_height

logo_plane_width	equ	320		;width in pixels
logo_plane_height	equ	15		;height in pixels
logo_num_planes		equ     1
logo_plane_size		equ	(logo_plane_width/8)*logo_plane_height

death1_plane_width	equ	320		;width in pixels
death1_plane_height	equ	212		;height in pixels
death1_num_planes	equ     5
death1_plane_size	equ	(death1_plane_width/8)*death1_plane_height

outro_plane_width	equ	320		;width in pixels
outro_plane_height	equ	212		;height in pixels
outro_num_planes	equ     6
outro_plane_size	equ	(outro_plane_width/8)*outro_plane_height

backdrop_plane_width	equ	320		;width in pixels
backdrop_plane_height	equ	212		;height in pixels
backdrop_num_planes	equ     5
backdrop_plane_size	equ	(backdrop_plane_width/8)*backdrop_plane_height

lace_plane_width	equ	640		;width in pixels
lace_plane_height	equ	420		;height in pixels
lace_num_planes		equ     5
lace_plane_size		equ	(lace_plane_width/8)*lace_plane_height

mesg_plane_width	equ	640		;width in pixels
mesg_plane_height	equ	145		;height in pixels
mesg_num_planes		equ     3
mesg_plane_size		equ	(mesg_plane_width/8)*mesg_plane_height

	IFD	CD32
map_plane_width		equ	960		;width in pixels
map_plane_height	equ	384		;height in pixels
map_num_planes		equ     8
	ELSEIF
map_plane_width		equ	480		;width in pixels
map_plane_height	equ	384		;height in pixels
map_num_planes		equ     6
	ENDC
map_plane_size		equ	(map_plane_width/8)*map_plane_height

map_p_plane_width	equ	640		;width in pixels
map_p_plane_height	equ	51		;height in pixels
map_p_num_planes	equ     4
map_p_plane_size	equ	(map_p_plane_width/8)*map_p_plane_height

static_p_plane_width	equ	640		;width in pixels
static_p_plane_height	equ	102		;height in pixels
static_p_num_planes	equ     5
static_p_plane_size	equ	(static_p_plane_width/8)*static_p_plane_height

anim_plane_width	equ	320		;width in pixels
anim_plane_height	equ	200		;height in pixels
anim_num_planes		equ     2
anim_plane_size		equ	(anim_plane_width/8)*anim_plane_height

	IFD	CD32
faces_plane_width	equ	2624		;width in pixels
	ELSEIF
faces_plane_width	equ	1296		;width in pixels
	ENDC
faces_plane_height	equ	226		;height in pixels
faces_num_planes	equ     4
faces_plane_size	equ	(faces_plane_width/8)*faces_plane_height

chselect_plane_width	equ	640		;width in pixels
chselect_plane_height	equ	210		;height in pixels
chselect_num_planes	equ     4
chselect_plane_size	equ	(chselect_plane_width/8)*chselect_plane_height

static_plane_width	equ	640		;width in pixels
static_plane_height	equ	340		;height in pixels
static_num_planes	equ     8
static_plane_size	equ	(static_plane_width/8)*static_plane_height

intro_plane_width	equ	352		;width in pixels
intro_plane_height	equ	280		;height in pixels
intro_num_planes	equ	6
intro_plane_size	equ	(intro_plane_width/8)*intro_plane_height

title_plane_width	equ	320		;width in pixels
title_plane_height	equ	1152		;height in pixels
title_num_planes	equ	6
title_plane_size	equ	(title_plane_width/8)*title_plane_height

MAP_WIDTH		equ	23
MAP_DEPTH		equ	23
MAP_HEIGHT		equ	20

****************************************************************************
****************************************************************************
****************************************************************************
;Block graphics structure

block_structure_size	equ	14

block_num_planes	equ	4		;not inc mask
block_mask_plane	equ	4		;0-3=image,4=mask

		rsreset
block_width	rs.w	1
block_height	rs.w	1
xposition	rs.w	1
yposition	rs.w	1
control		rs.w	1	;0=norm,1=flipped,2=norm&flipped,3=none
data		rs.l	1
block_struct_size	rs.b	0

;Game graphics
		rsreset
floor_addresses	rs.b	0
grass_bob	rs.l	1
lights_bob	rs.l	1
lift_bob	rs.l	1
puddle_bob	rs.l	1
light_bob	rs.l	1

block_addresses	rs.b	0
stone_bob	rs.l    1
push_bob 	rs.l    1
not_used1	rs.l    1
not_used2	rs.l    1
tree_bob	rs.l    1
field_bob	rs.l    1
not_used3	rs.l	1
lift_hydraulic	rs.l	1
mon1in_bob	rs.l	1
mon1left_bob	rs.l	1
mon1right_bob	rs.l	1
mon1out_bob	rs.l	1
mon2in_bob	rs.l	1
mon2left_bob	rs.l	1
mon2right_bob	rs.l	1
mon2out_bob	rs.l	1
stairs2_out_bob	rs.l	1
stairs2_right_bob	rs.l	1
stairs2_left_bob	rs.l	1
stairs2_in_bob	rs.l	1
door1_front_bob	rs.l	1
door1_side_bob	rs.l	1
door2_front_bob	rs.l	1
door2_side_bob	rs.l	1

panel_addresses	rs.b	0
text_bob	rs.l	1
butin_bob	rs.l	1
butout_bob	rs.l	1

aux_addresses   rs.b	0
egg_closed_bob	rs.l	1
egg_open_bob	rs.l	1
container1_bob	rs.l	1
container2_bob	rs.l	1
container3_bob	rs.l	1
container4_bob	rs.l	1
container5_bob	rs.l	1
egg_remains_bob	rs.l	1
stairs1_out_bob	rs.l	1
stairs1_right_bob	rs.l	1
stairs1_left_bob	rs.l	1
stairs1_in_bob	rs.l	1
door1_open_front_bob	rs.l	1
door1_open_side_bob	rs.l	1
monster1_dead_bob	rs.l	1
monster2_dead_bob	rs.l	1

mapblocks	rs.l	1

;Misc graphics
		rsreset
player_addresses	rs.b	0
pl1in_bob	rs.l	1
pl1left_bob	rs.l	1
pl1right_bob	rs.l	1
pl1out_bob	rs.l	1
pl2in_bob	rs.l	1
pl2left_bob	rs.l	1
pl2right_bob	rs.l	1
pl2out_bob	rs.l	1
pl3in_bob	rs.l	1
pl3left_bob	rs.l	1
pl3right_bob	rs.l	1
pl3out_bob	rs.l	1
pl4in_bob	rs.l	1
pl4left_bob	rs.l	1
pl4right_bob	rs.l	1
pl4out_bob	rs.l	1

water_addresses	rs.b	0
water1_bob	rs.l    1
water2_bob	rs.l    1
water3_bob	rs.l    1
water4_bob	rs.l    1

	IFD	CD32
light_addresses	rs.b	0
light1_bob	rs.l    1
light2_bob	rs.l    1
light3_bob	rs.l    1
	ENDC

explosion_addresses	rs.b	0
explosion1_bob	rs.l	1
explosion2_bob	rs.l	1
explosion3_bob	rs.l	1
explosion4_bob	rs.l	1

foam_addresses	rs.b	0
foam_bob	rs.l	1

misc_addresses	rs.b	0
compass_n_bob	rs.l	1
compass_e_bob	rs.l	1
compass_s_bob	rs.l	1
compass_w_bob	rs.l	1
vertline_bob	rs.l	1
horizline_bob	rs.l	1

item_addresses	rs.b	0
game_font	rs.l	1
leader_bob	rs.l	1
leader_off_bob	rs.l	1
warning_bob	rs.l	1
locked_bob	rs.l	1
locked2_bob	rs.l	1
heavy_bob	rs.l	1
noroom_bob	rs.l	1
claws_bob	rs.l	1
bigclaws_bob	rs.l	1
rip_bob		rs.l	1
planet_bob	rs.l	1
icon1_bob	rs.l	1
icon2_bob	rs.l	1
icon3_bob	rs.l	1
icon4_bob	rs.l	1
icon5_bob	rs.l	1
noammo_bob	rs.l	1
rotations_bob	rs.l	1
face1_bob	rs.l	1
face2_bob	rs.l	1
face3_bob	rs.l	1
face4_bob	rs.l	1
logo_bob	rs.l	1
used_bob        rs.l	1
blocked_bob	rs.l	1
blocked2_bob	rs.l	1
invalid_bob	rs.l	1
skeleton_bob	rs.l	1
exit_bob	rs.l	1
digits_bob	rs.l	1
fill_bob	rs.l	1
drowning_bob	rs.l	1
poisoned_bob	rs.l	1

;exgfx
		rsreset
grenade_bob	rs.l	1
stungrenade_bob	rs.l	1
sentry1_bob	rs.l	1
sentry2_bob	rs.l	1
sentry3_bob	rs.l	1
sentry4_bob	rs.l	1
active_bob	rs.l	1

****************************************************************************
****************************************************************************
****************************************************************************
;Sound structure
		rsreset
crash		rs.l	1
blockslide	rs.l    1
gunfire1	rs.l	1
gunempty	rs.l	1
gunfire2	rs.l	1
gunfire3	rs.l	1
gunreload	rs.l	1

****************************************************************************
****************************************************************************
****************************************************************************
;Map structure
		rsreset			;monster format
monster_type	rs.l	1		;address of type data
monster_posn	rs.l	1		;memory position
monster_fitness	rs.w	1		;current health
monster_direct	rs.b	1		;current direction
monster_x	rs.b	1
monster_y	rs.b	1
monster_floor	rs.b	1
monster_count	rs.b	1		;speed counter
monster_white	rs.b	1
monster_move	rs.b    4
monster_dr	rs.b    1
monster_stun_count	rs.b	1
monster_size	rs.b	0

			rsreset
button_used		rs.b	1       ;-1=button is valid
button_action_in	rs.b	1	;action when pressing in
button_action_out	rs.b	1	;action when pushing out
button_pad1		rs.b	1
button_data_in		rs.l	1	;data dependent on action in
button_data_out		rs.l	1	;data dependent on action out
button_pad		rs.b	16
button_size		rs.b	0

;button actions
BUTTON_NOTHING			equ	0
BUTTON_FLOOR_ON			equ     1
BUTTON_FLOOR_OFF		equ     2
BUTTON_FLOOR_TOGGLE		equ     3
BUTTON_BLOCK_ON			equ     4
BUTTON_BLOCK_OFF		equ     5
BUTTON_BLOCK_TOGGLE		equ     6
BUTTON_HATCH			equ     7
BUTTON_PSI_EFFECT		equ     8
BUTTON_LIFT_UP			equ     9
BUTTON_LIFT_DOWN		equ	10
BUTTON_LIFT_STOP		equ	11
BUTTON_LIFT_TOGGLE		equ     12
BUTTON_UNUSED			equ	13
BUTTON_DOOR_OPEN		equ	14
BUTTON_DOOR_CLOSE		equ	15
BUTTON_DOOR_TOGGLE		equ     16
BUTTON_DOOR_LOCK		equ     17
BUTTON_DOOR_UNLOCK		equ     18

text_size       equ	((48/8)*40)*2	;text panel is 2 bitplanes 48x40

horizon_size	equ	(144/8)*32

		rsreset			;lift format
lift_posn	rs.w	1
lift_height	rs.b	1
lift_min_height	rs.b	1
lift_max_height	rs.b	1
lift_direction	rs.b	1	;(0=stopped,1=up, 2=down, 3=automove up, 4=automove down)
lift_weight	rs.b	1	;carry something? (1=yes)
lift_up		rs.b	1	;direction to move once stopped going up
lift_down	rs.b	1	;direction to move once stopped going down
lift_automove	rs.b	1	;0=no,1=automove (moves if block on lift)
lift_size	rs.b	0

LIFT_STOPPED	equ	0
LIFT_GOING_UP	equ     1
LIFT_GOING_DOWN	equ     2
LIFT_AUTOMOVE_UP	equ     3
LIFT_AUTOMOVE_DOWN	equ     4

		rsreset			;door format
door_posn	rs.w	1
door_trig	rs.b	1		;try to 1=open, 2=close, 3=lock, 4=unlock
door_direction	rs.b	1		;(0=stopped,1=opening, 2=closing, 3=locked)
door_type	rs.l    1
door_delay	rs.b	1		;number of cycles before door shuts (-1=stays open)
door_del_count	rs.b	1		;used for door closing delay
door_key        rs.b	1		;object required to open door (0=none)
door_button_only	rs.b	1	;-1=opened/closed/etc by button only
door_size	rs.b	0

DOOR_STOPPED	equ	0
DOOR_OPENING	equ     1
DOOR_CLOSING	equ     2

		rsreset			;pushable format
pushable_posn	rs.w	1
pushable_cell	rs.l	1
pushable_size	rs.b	0

		rsreset			;text trigger format
trigger_posn	rs.l	1
trigger_offset	rs.w	1
trigger_size	rs.b    0

		rsreset			;explosion format
expl_posn	rs.w	1
expl_direction	rs.b	1		;-1=cant move (0-3, 4,5=up, 6,7=down)
expl_speed	rs.b	1		;1-254 (255=dont draw in map yet)
expl_count	rs.b	1
expl_colour	rs.b	1
expl_density	rs.b	1		;0-3
EXPL_NO_DECAY	equ	0
EXPL_DECAY	equ     1
EXPL_VANISH	equ     2
expl_decay	rs.b	1		;0=decay off, 1=decay on, 2=vanish on
expl_flameback	rs.b	1	;-1=none, >-1=direction+1
expl_unused	rs.b    5
expl_damage	rs.w	1
expl_size	rs.b    0

****************************************************************************

		rsreset			;152
name		rs.l	2
name_text	rs.b	120		;map format
pl1_pos		rs.b	3		;start pl1 (x 0-19,y 0-19,floor 1-20)
pl2_pos		rs.b	3		;start pl2 (x 0-19,y 0-19,floor 1-20)
pl3_pos		rs.b	3               ;start pl3 (x 0-19,y 0-19,floor 1-20)
pl4_pos		rs.b	3               ;start pl4 (x 0-19,y 0-19,floor 1-20)
exit_pos        rs.b	3		;(x 0-19,y 0-19,floor 1-20)
time_limit	rs.b	1		;1 unit = 10 secs
water_level	rs.w	1               ;water level
low_water_level	rs.w	1               ;low water level
hi_water_level	rs.w	1               ;high water level
notused		rs.w	1               ;used to be initial water direction
					; just start water going up all the time now
water_speed	rs.w	1               ;water speed

explosions	rs.b	expl_size*32		;448*4
horizons	rs.b	horizon_size*4		;576*4
text_triggers	rs.b	50*trigger_size		;50*6
eod5		rs.l	1			;4
text_mesgs	rs.b	3*1024			;3*1024
num_monsters	equ	(128*16)/monster_size
monsters	rs.b	128*16			;128*16
eod1		rs.l	1			;4
buttons		rs.b	32*button_size		;32*28
lifts		rs.b	32*lift_size		;32*10
eod2		rs.w	1			;2
doors		rs.b	32*door_size		;32*12
eod3		rs.w	1			;2
pushables	rs.b	32*pushable_size	;32*6
eod4		rs.w	1			;2
texts		rs.b	36*text_size		;36*480
						;top+header+buffer=23594
map_cell_size	equ	4
map_part_size	equ	(MAP_WIDTH*MAP_DEPTH*MAP_HEIGHT*map_cell_size)+2*(MAP_WIDTH*5*map_cell_size)

map_buffer1	rs.b	MAP_WIDTH*5*map_cell_size	;460
map_data1	rs.b    MAP_WIDTH*MAP_DEPTH*MAP_HEIGHT*map_cell_size
map_buffer2	rs.b	MAP_WIDTH*5*map_cell_size
map_buffer3	rs.b	MAP_WIDTH*5*map_cell_size
map_data2	rs.b    MAP_WIDTH*MAP_DEPTH*MAP_HEIGHT*map_cell_size
map_buffer4	rs.b	MAP_WIDTH*5*map_cell_size
map_buffer5	rs.b	MAP_WIDTH*5*map_cell_size
map_data3	rs.b    MAP_WIDTH*MAP_DEPTH*MAP_HEIGHT*map_cell_size
map_buffer6	rs.b	MAP_WIDTH*5*map_cell_size

;Cell type 1
;	Bits	Meaning
;	0-8	flags
;		 bit 0 = floor here?
;		 bit 1 = block here?
;		 bit 2 = water here?
;		 bit 3 = panel here?
;		 bit 4 = explosion here?
;		 bit 5 = aux here?
;		 bit 6 = opaque?
;		 bit 7 = invisible?
;		 bit 8 = pushable?
;	9-10	floor type
;		  0 = grass
;		  1 = button (button number stored in variant field of block below)
;		  2 = lift
;		  3 = puddle / light (if there is a stone block on top)
;	11-16	block type
;		  0 = stone block
;		  1 = push block
;		  2 = fitness boost field (cell 4 is added to fitness)
;		  3 = exit field (end level)
;		  4 = tree
;		  5 = repulsion field (does nothing)
;		  6 = teleport field (cell 4 points to destination)
;	          7 = lift hydraulic
;		  8 = monster type 1 (image: front) (map: north)
;		  9 = monster type 1 (image: left)  (map: east)
;		 10 = monster type 1 (image: right) (map: south)
;		 11 = monster type 1 (image: back)  (map: west)
;		 12 = monster type 2 (image: front) (map: north)
;		 13 = monster type 2 (image: left)  (map: east)
;		 14 = monster type 2 (image: right) (map: south)
;		 15 = monster type 2 (image: back)  (map: west)
;		 16 = stairs2 (image: out) (map: north)
;		 17 = stairs2 (image: right) (map: east)
;		 18 = stairs2 (image: left) (map: south)
;		 19 = stairs2 (image: in) (map: west)
;		 20 = Door 1 closed (image: front) (map: north/south)
;		 21 = Door 1 closed (image: side) (map: east/west)
;                22 = ExGfx : Grenade
;                23 = ExGfx : Stun Grenade
;		 24 = ExGfx : Sentry Gun (image: right) (map: north)
;		 25 = ExGfx : Sentry Gun (image: left)  (map: east)
;		 26 = ExGfx : Sentry Gun (image: back) (map: south)
;		 27 = ExGfx : Sentry Gun (image: front)  (map: west)
;                28 = ExGfx : unused
;                29 = ExGfx : unused
;                30 = ExGfx : unused
;                31 = ExGfx : unused
;		 32 = player 1 (image: front) (map: north)
;		 33 = player 1 (image: left)  (map: east)
;		 34 = player 1 (image: right) (map: south)
;		 35 = player 1 (image: back)  (map: west)
;		 36 = player 2 (image: front) (map: north)
;		 37 = player 2 (image: left)  (map: east)
;		 38 = player 2 (image: right) (map: south)
;		 39 = player 2 (image: back)  (map: west)
;		 40 = player 3 (image: front) (map: north)
;		 41 = player 3 (image: left)  (map: east)
;		 42 = player 3 (image: right) (map: south)
;		 43 = player 3 (image: back)  (map: west)
;		 44 = player 4 (image: front) (map: north)
;		 45 = player 4 (image: left)  (map: east)
;		 46 = player 4 (image: right) (map: south)
;		 47 = player 4 (image: back)  (map: west)
;	      48-63 = not used
;	17-18	water level
;		  0 = .25 full (1)
;		  1 = .5 full (2)
;                 2 = .75 full (3)
;		  3 = full (4)
;	19-20	panel type
;		  0 = text
;		  1 = button in
;                 2 = button out
;		  3 = not used
;	21-22   explosion ferocity
;		  0 = least (1)
;		  1 = weak (2)
;                 2 = strong (3)
;		  3 = most (4)
;	23-27	variant
;		  monster = bit 0 (m_flashed)   = monster flashed
;		 	    bit 1 (m_outlined)  = outlined
;			    bits 2-3 (m_unused) = unused
;		  player  = player number (0-3, 4-7=white figure, 8-11=glow figure)
;                 text    = text string number
;                 button  = button struct number
;		  door    = opening size
;		  grenade = grenade height
;		  sentry  = sentry number
;	28-31	auxiliary block
;		  0 = egg closed
;		  1 = egg open
;		  2 = container 1
;		  3 = container 2
;		  4 = container 3
;		  5 = container 4
;		  6 = container 5
;		  7 = dead player
;		  8 = stairs1 (image: out) (map: north)
;		  9 = stairs1 (image: right) (map: east)
;		 10 = stairs1 (image: left) (map: south)
;		 11 = stairs1 (image: in) (map: west)
;		 12 = door 1 open (image: front) (map: north/south)
;		 13 = door 1 open (image: side) (map: east/west)
;		 14 = monster 1 dead
;		 15 = monster 2 dead

keep_flags	equ	%00000000000000000000000111111111	;AND these masks
keep_floor	equ	%00000000000000000000011000000001	; to keep
keep_block	equ	%00000000000000011111100000000010	; desired
keep_water	equ	%00000000000001100000000000000100	; component
keep_panel	equ	%00000000000110000000000000001000
keep_explosion	equ	%00000000011000000000000000010000
keep_variant	equ	%00001111100000000000000000000000
keep_variant_player	equ	%00000001100000000000000000000000
keep_variant_sentry	equ	%00000111100000000000000000000000
keep_aux	equ	%11110000000000000000000000100000

floor_shift	equ	9
block_shift	equ	11
water_shift	equ	17
panel_shift	equ	19
explosion_shift	equ	21
variant_shift	equ	23
aux_shift	equ	28

m_flashed	equ	variant_shift+0
m_outlined	equ	variant_shift+1
m_unused	equ	variant_shift+2

keep_floor_here_bit	equ	%00000000000000000000000000000001
keep_block_here_bit	equ	%00000000000000000000000000000010
keep_water_here_bit	equ	%00000000000000000000000000000100
keep_panel_here_bit	equ	%00000000000000000000000000001000
keep_explosion_here_bit	equ	%00000000000000000000000000010000
keep_aux_here_bit	equ	%00000000000000000000000000100000
keep_opaque_bit		equ	%00000000000000000000000001000000
keep_invisible_bit	equ	%00000000000000000000000010000000
keep_pushable_bit	equ	%00000000000000000000000100000000
keep_person		equ	((keep_block!keep_variant))

keep_block_fall		equ	keep_block!keep_panel!keep_opaque_bit!keep_pushable_bit
erase_block_fall	equ	~keep_block_fall

erase_flags	equ	~keep_flags			;AND these masks
erase_floor	equ	~keep_floor			; to erase
erase_block	equ	~keep_block			; desired
erase_water	equ	~keep_water			; component
erase_panel	equ	~keep_panel
erase_explosion	equ	~keep_explosion
erase_person	equ	~keep_person
erase_variant	equ	~keep_variant
erase_aux	equ	~keep_aux

floor_here_bit_num	equ	0
block_here_bit_num	equ     1
water_here_bit_num	equ     2
panel_here_bit_num	equ     3
explosion_here_bit_num	equ     4
opaque_bit_num		equ     6
invisible_bit_num	equ     7
pushable_bit_num	equ     8
aux_here_bit_num	equ     5

erase_floor_here_bit	equ     ~keep_floor_here_bit
erase_block_here_bit	equ     ~keep_block_here_bit
erase_water_here_bit	equ     ~keep_water_here_bit
erase_panel_here_bit	equ     ~keep_panel_here_bit
erase_explosion_here_bit	equ     ~keep_explosion_here_bit
erase_invisible_bit	equ     ~keep_invisible_bit
erase_pushable_bit	equ     ~keep_pushable_bit
erase_opaque_bit	equ     ~keep_opaque_bit
erase_aux_here_bit	equ     ~keep_aux_here_bit

;Cell type 2
;	Bits	Meaning
;	0-5	2D map block
;	6-11	flags
;		 bit 0 = player one has seen this block
;		 bit 1 = player two has seen this block
;		 bit 2 = player three has seen this block
;		 bit 3 = player four has seen this block
;		 bit 4 = question mark on this block
;		 bit 5 = flowing water?
;	12-19   egg contains monster type (0=contains nothing)
;		 (or dead player number)
;	20-31   time until egg hatch / light
;		 (0-4092, 1 unit = 20 seconds
;		  0 = hatch immediately
;		  4095 = dont hatch until shot or button pressed
;		  4094 = hatch at random
;		  4093 = never hatch, egg empty)

keep_pl1_seen_bit	equ	%00000000000000000000000001000000
keep_pl2_seen_bit	equ	%00000000000000000000000010000000
keep_pl3_seen_bit	equ	%00000000000000000000000100000000
keep_pl4_seen_bit	equ	%00000000000000000000001000000000
keep_question_mark_bit	equ	%00000000000000000000010000000000
keep_flowing_bit	equ	%00000000000000000000100000000000

keep_2D_block		equ     %00000000000000000000000000111111
keep_aux_data		equ     %00000000000011111111000000000000
keep_hatch_time		equ     %11111111111100000000000000000000

pl1_seen_bit_num	equ	6
pl2_seen_bit_num	equ	7
pl3_seen_bit_num	equ	8
pl4_seen_bit_num	equ	9
question_mark_bit_num	equ	10
flowing_bit_num		equ	11

block_2D_shift		equ     4
aux_data_shift		equ     12
hatch_time_shift	equ     20

erase_pl1_seen_bit	equ	~keep_pl1_seen_bit
erase_pl2_seen_bit	equ	~keep_pl2_seen_bit
erase_pl3_seen_bit	equ	~keep_pl3_seen_bit
erase_pl4_seen_bit	equ	~keep_pl4_seen_bit
erase_question_mark_bit	equ	~keep_question_mark_bit
erase_flowing_bit	equ	~keep_flowing_bit

erase_2D_block		equ	~keep_2D_block
erase_aux_data		equ	~keep_aux_data
erase_hatch_time	equ	~keep_hatch_time

;Cell type 3
;	Bits	Meaning
;	0-7     item type
;       8-15	item damage
;	16-23	item ammo
;	24	sky visible when facing north? (0=no, 1=yes)
;	25	sky visible when facing east? (0=no, 1=yes)
;	26	sky visible when facing south? (0=no, 1=yes)
;	27	sky visible when facing west? (0=no, 1=yes)
;	28	hatch and remove egg?
;	29	no monster allowed to move here (reset by a player moving here)
;	30      don't leave question mark (set when pushed a non-metal block)
;	31	light here

;*** IMPORTANT ***
; If this block is a teleport field then this cell becomes variant data
;*** END OF NOTICE ***

keep_item_type		equ     %00000000000000000000000011111111
keep_item_damage	equ     %00000000000000001111111100000000
keep_item_ammo		equ     %00000000111111110000000000000000
keep_sky		equ     %00001111000000000000000000000000
keep_remove_egg		equ     %00010000000000000000000000000000
keep_no_monster		equ     %00100000000000000000000000000000
keep_no_question	equ     %01000000000000000000000000000000
keep_light		equ     %10000000000000000000000000000000

remove_egg_bit_num	equ	28
no_monster_bit_num	equ	29
no_question_bit_num	equ     30
keep_light_bit_num	equ     31

item_type_shift		equ	0
item_damage_shift	equ     8
item_ammo_shift		equ     16
sky_shift		equ     24
remove_egg_shift	equ     28
no_monster_shift	equ     29
no_question_shift	equ     30
light_shift		equ     31

erase_item_type 	equ	~keep_item_type
erase_item_damage 	equ	~keep_item_damage
erase_item_ammo		equ	~keep_item_ammo
erase_sky	 	equ	~keep_sky
erase_remove_egg	equ	~keep_remove_egg
erase_no_monster	equ	~keep_no_monster
erase_no_question 	equ	~keep_no_question
erase_light	 	equ	~keep_light

****************************************************************************
****************************************************************************
****************************************************************************
;monster data defnintion

		rsreset
mdfn_physique	rs.w	1		;physique
mdfn_modifier	rs.w	1		;weapon modifier
mdfn_speed	rs.b	1		;speed (0=vfast,1=fast,2=norm,3=slow)
mdfn_fireball	rs.b	1		;fireball density (1-4, 0=none)
mdfn_poison	rs.b	1		;poison strength
mdfn_maxdist	rs.b	1		;max distance to fire at player
mdfn_number	rs.b	1		;monster number
mdfn_two_high	rs.b	1		;1=monster is two high
mdfn_water_only	rs.b	1		;1=monster will stay in water
mdfn_bravery	rs.w	1		;bravery
mdfn_effect	rs.w	1		;sample number
mdfn_period	rs.w	1		;sample period
mdfn_fspeed	rs.b	1		;fireball speed (2=norm)
mdfn_fdecay	rs.b	1		;fireball decay (-1=on,0=off)
mdfn_outline	rs.b	1		;outline (0=no, 1=yes)
mdfn_stunned	rs.b	1		;stun possible (0=no, 1=yes)
mdfn_size	rs.b	0

****************************************************************************
****************************************************************************
****************************************************************************
;Players

;item types
CAT_GUN		equ     0
CAT_HAND2HAND	equ     1	;does nothing
CAT_MINE	equ     2
CAT_AMMO	equ     4
CAT_FOOD	equ     5
CAT_KEY		equ     6
CAT_UPLINK	equ     7	;not used
CAT_CAMCORDER	equ     8	;not used
CAT_DTS		equ     9
CAT_DATABANK	equ     11	;not used
CAT_PSIAMP	equ     12
CAT_ARMED_MINE	equ     13
CAT_FLAMER	equ	15
CAT_LAUNCHER	equ	16
CAT_TRASH	equ	17
CAT_IMMU	equ	18
CAT_REPAIR	equ     19
CAT_GRLAUNCHER	equ	20
CAT_GRENADE	equ     21
CAT_NUKE	equ     22
CAT_SENTRY	equ     23
CAT_CELLAMMO	equ     24
CAT_SENTRYCNTRL	equ     25	;not used
CAT_CORPSE	equ     26	;not used

;containers
CONT_SPECIAL	equ	2
CONT_CONSUMABLE	equ     3
CONT_PSIONIC	equ     4
CONT_SMALLCRATE	equ     5
CONT_BIGCRATE	equ     6
CONT_CORPSE	equ     7

;anim
ANIM_MUZZLE	equ     1
ANIM_ZAP	equ     2
ANIM_ELECTRIC	equ     3

			rsreset
item_header1		rs.b	16
item_header2		rs.b	16
item_footer1		rs.b	16
item_footer2		rs.b	16
item_info1		rs.b	19
item_info2		rs.b	19
item_info3		rs.b	19
item_info4		rs.b	19
item_info5		rs.b	19
item_info6		rs.b	19
item_info7		rs.b	19
item_info8		rs.b	19
item_info9		rs.b	19
item_info10		rs.b	19
item_category		rs.b	1
item_image		rs.b	1
item_container_type	rs.b	1
item_waterdamage	rs.b	1
item_maxdamage		rs.w	1
item_weight		rs.w	1
item_animcolour		rs.w	1
item_anim		rs.b	1
item_animduration	rs.b	1
item_flashcolour	rs.b	1
item_sample		rs.b	1
item_sampleperiod	rs.w	1
item_exsample		rs.w	1
item_exsampleperiod	rs.w	1
item_header_size	rs.b	0

item_size		equ	item_header_size+12

			rsset	item_header_size
itemnuke_num		rs.b	1

			rsset	item_header_size
itemgun_accuracy	rs.b	1
itemgun_firefront	rs.b	1
itemgun_firerear	rs.b	1
itemgun_fireright	rs.b	1
itemgun_fireleft	rs.b	1
itemgun_firedown	rs.b	1
itemgun_fireup		rs.b	1
itemgun_clip1		rs.b	1
itemgun_clip2		rs.b	1
itemgun_clip3		rs.b	1
itemgun_maxrounds	rs.b	1
itemgun_damageperhit	rs.b	1		;use scaled up by 512

			rsset	item_header_size
itemgrln_accuracy	rs.b	1
itemgrln_firefront	rs.b	1
itemgrln_firerear	rs.b	1
itemgrln_fireright	rs.b	1
itemgrln_fireleft	rs.b	1
itemgrln_firedown	rs.b	1
itemgrln_fireup		rs.b	1
itemgrln_clip1		rs.b	1
itemgrln_clip2		rs.b	1
itemgrln_clip3		rs.b	1
itemgrln_maxrounds	rs.b	1

			rsset	item_header_size
itemhand_modifier	rs.b	1

			rsset	item_header_size
itemsentry_delay	rs.w	1
itemsentry_rounds	rs.w	1
itemsentry_physique	rs.w	1
itemsentry_turn_flag	rs.b	1
itemsentry_shoot_players_flag	rs.b	1
itemsentry_range	rs.b	1
itemsentry_density	rs.b	1

			rsset	item_header_size
itemmine_firenorth	rs.b	1
itemmine_fireeast	rs.b	1
itemmine_firesouth	rs.b	1
itemmine_firewest	rs.b	1
itemmine_firedown	rs.b	1
itemmine_fireup		rs.b	1
itemmine_damage		rs.w	1
itemmine_armeditem	rs.b	1

			rsset	item_header_size
itemgrenade_firenorth	rs.b	1
itemgrenade_fireeast	rs.b	1
itemgrenade_firesouth	rs.b	1
itemgrenade_firewest	rs.b	1
itemgrenade_firedown	rs.b	1
itemgrenade_fireup	rs.b	1
itemgrenade_radius	rs.w	1
itemgrenade_type	rs.b	1	;0=expl,1=stun

			rsset	item_header_size
itemfood_fitnessboost	rs.w	1
itemfood_phboost	rs.w	1
itemfood_intboost	rs.w	1
itemfood_duration	rs.w	1

			rsset	item_header_size
itemrepair_fitnessboost	rs.w	1
itemrepair_phboost	rs.w	1
itemrepair_intboost	rs.w	1
itemrepair_duration	rs.w	1

			rsset	item_header_size
itemimmu_duration	rs.w	1

			rsset	item_header_size
itempsi_level		rs.b	1

			rsreset
inven_item_num		rs.b	1
inven_item_damage	rs.b	1
inven_item_gun_ammo	rs.b	1
inven_item_outlined  	rs.b	1
inven_item_size		rs.b    0

inven_size		equ	30	;number of items that player can carry

pl1_view_xoffset	equ     0
pl1_view_yoffset	equ     0
pl2_view_xoffset	equ	160
pl2_view_yoffset	equ     0
pl3_view_xoffset	equ     0
pl3_view_yoffset	equ     105
pl4_view_xoffset	equ	160
pl4_view_yoffset	equ     105

init_inven_size		equ	10

			rsreset
player_origin_text	rs.b    33
player_chselect_name	rs.b    33
player_gender_text	rs.b    33
player_class_text	rs.b    33
player_game_name        rs.b    17
player_load_name        rs.b    28
player_gender		rs.b	1	;0=male, 1=female, 2=n/a
player_race		rs.b	1	;0=Human
					;  Mech
					;  Golem
					;  Humanoid
					;  Cyborg
player_class		rs.b	1	;0=Marine
					;  Assassin
					;  Combat Droid
					;  Medic
					;  Citizen
					;  Pilot
					;  UPBI agent
					;  Engineer
					;  Slave
					;  Marksman
					;  Trooper
					;  UPBI Agent
					;  Multipurpose
					;  Pilot
					;  Porn King
					;  Borg
					;  Early Cyborg
					;  Barbarella
player_fitness		rs.w	1
player_physique		rs.w	1
player_agility		rs.w	1	;psi/1000 = spell potency multiplier
player_experience	rs.w	1
EXP_NEWBLOCK		equ	1
EXP_KILL	    	equ	10	;(monsters physiqe/10 for every hit on monster)
EXP_UNLOCK	    	equ     15	;door unlocked
EXP_PSI		    	equ	5	;every psi used
EXP_EXIT		equ	500	;first into exit
EXP_MAX		    	equ     60000
player_footstep		rs.w	1
player_grunt		rs.w	1
player_inven_store	rs.b    inven_item_size*init_inven_size
player_action_store	rs.b    inven_item_size*init_inven_size
player_dat_size		rs.b	0

INCR_EXP	MACRO
		add.w	\1,\2
		cmpi.w	#EXP_MAX,\2
		bls.s	.ok\@
		move.w	#EXP_MAX,\2
.ok\@
		ENDM

LIGHT_FLOOR_BIT		equ	%00000001
LIGHT_NORTHWALL_BIT	equ	%00000010
LIGHT_EASTWALL_BIT	equ	%00000100
LIGHT_SOUTHWALL_BIT	equ	%00001000
LIGHT_WESTWALL_BIT	equ	%00010000

LIGHT_FLOOR		equ	0
LIGHT_NORTHWALL		equ	1
LIGHT_EASTWALL		equ	2
LIGHT_SOUTHWALL		equ	3
LIGHT_WESTWALL		equ	4

			rsreset
xpos			rs.b	1	;player format
ypos			rs.b	1
scroll_x		rs.b	1
scroll_y		rs.b	1
floor			rs.b	1
direction		rs.b	1
in_team			rs.w	1
auto_move		rs.w	1
bumping_into		rs.w	1
block_num		rs.w	1
head_images		rs.w	1
seen_bit_num		rs.w	1
old_mem_position	rs.l	1
mem_position		rs.l	1
exp			rs.w	1
view_xoffset		rs.w	1
view_yoffset		rs.w	1
gadget_xoffset		rs.w	1
gadget_yoffset		rs.w	1
player_num		rs.w	1
aud_ch			rs.w	1
aux_here_temp		rs.w	1
aux_here		rs.w	1
pl_shake		rs.w	1
active_count		rs.w	1
lock_count		rs.w	1
poisoned		rs.w	1
poisoned_strength	rs.w	1
poisoned_count		rs.w	1
poisoned_count_store	rs.w	1
poisoned_total		rs.w	1
noroom_count		rs.w	1
noammo_count		rs.w	1
heavy_count		rs.w	1
claw_count		rs.w	1
blocked_count		rs.w	1
blocked2_count		rs.w	1
invalid_count		rs.w	1
bigclaw_count		rs.w	1
used_count		rs.w	1
drowning_count		rs.w	1
lock_key		rs.w	1
used_key		rs.w	1
weight			rs.l	1
footstep_period		rs.w	1
grunt_period		rs.w	1
fall_damage		rs.l	1
underwater_count	rs.w	1
dead_flag2		rs.w	1
grunt_count		rs.w	1
dts_farsight		rs.w	1
old_sky_flag		rs.w	1
sky_flag		rs.w	1
warning			rs.w	1
control_method		rs.b	1
control_action		rs.b	1
view_window		rs.w	1
draw_window		rs.w	1
window_type		rs.w	1	;0=view 1=store 2=map 3=stats
VIEW_SIZE		equ     92
VIEW_WARNING		equ	67*4
VIEW_SHAKE		equ	68*4
VIEW_SCROLL		equ	69*4
VIEW_LOCK		equ     70*4
VIEW_WEIGHTS_ICON	equ     71*4
VIEW_FLASH		equ     72*4
VIEW_NOROOM		equ     73*4
VIEW_HEAVY		equ     74*4
VIEW_CLAW		equ     75*4
VIEW_BIGCLAW		equ     76*4
VIEW_CARRYING_DTS	equ     77*4
VIEW_CARRYING_STATS	equ     78*4
VIEW_SHIELD_ICON	equ     79*4
VIEW_WINGS_ICON		equ     80*4
VIEW_IMMU_ICON		equ     81*4
VIEW_WATER_ICON		equ     82*4
VIEW_NOAMMO		equ     83*4
VIEW_BLOCKED		equ     84*4
VIEW_INVALID		equ     85*4
VIEW_USED		equ     86*4
VIEW_OBJECT		equ	87*4
VIEW_BLOCKED2		equ     88*4
VIEW_DROWNING		equ     89*4
VIEW_POISONED		equ	90*4
VIEW_ACTIVE		equ	91*4
dummy1			rs.l	1
view			rs.l    VIEW_SIZE
	IFD	CD32
viewb			rs.l	VIEW_SIZE
	ENDC
dummy2			rs.l	1
old_view1		rs.l    VIEW_SIZE
	IFD	CD32
old_view1b		rs.l	VIEW_SIZE
	ENDC
dummy3			rs.l	1
old_view2		rs.l    VIEW_SIZE
	IFD	CD32
old_view2b		rs.l	VIEW_SIZE
	ENDC
end_views       	rs.b	0

fire_splat		rs.w	1
fire_duration		rs.w	1
fire_anim		rs.w	1	;(0=none)
fire_colour		rs.w	1
fire_ricochet_colour	rs.w	1
fire_frame		rs.w	1
fire_flash		rs.b	1
fire_flash_dur		rs.b	1
fire_dist		rs.b	1
fire_against_door	rs.b	1
fire_dist_vol		rs.b	1
fire_white		rs.b	1
fire_accuracy		rs.b	1
fire_sample		rs.b	1
fire_period		rs.w	1
fire_x			rs.w	1
fire_y			rs.w	1
dofx			rs.b	1
tooheavy		rs.b	1
fire_ricochet		rs.w	1
water_fall		rs.w	1

icon_weights_dur	rs.w	1
spell_weights		rs.w	1
icon_immu_dur		rs.w	1
spell_immu		rs.w	1
icon_shield_dur		rs.w	1
spell_shield		rs.w	1
icon_wings_dur		rs.w	1
spell_wings		rs.w	1
icon_water_dur		rs.w	1
spell_water		rs.w	1
monster_attacking	rs.w	1
using_grenade		rs.w	1
behind_pushable		rs.w	1
grenade_dur		rs.w	1
throw_grenade		rs.w	1
last_posn               rs.w	1

inven_posn		rs.w	1
inven_num_items		rs.w	1
inven_using		rs.b    inven_item_size
inven_temp		rs.b    inven_item_size
inven_store		rs.b    inven_item_size*inven_size
inven_end_store		rs.b	0
inven_pad		rs.b	inven_item_size*3

PATH_SIZE		equ	20
path			rs.l    PATH_SIZE

player_struct_size	rs.b	0

			rsreset
player_name		rs.b    17
load_name		rs.b    28
gender			rs.b	1
race			rs.b	1
class			rs.b	1
fitness			rs.w	1
physique		rs.w	1
agility			rs.w	1
experience		rs.w	1
footstep		rs.w	1
grunt			rs.w	1
global_inven_store	rs.b    inven_item_size*init_inven_size
global_action_store	rs.b    inven_item_size*init_inven_size
old_fitness_band	rs.w	1
dead_flag       	rs.w	1
fitness_flash_dur	rs.b	1
stats_pad		rs.b	1
stats_struct_size	rs.b	0

****************************************************************************
****************************************************************************
****************************************************************************
;World map locations

			rsreset
locn_x			rs.b    2
locn_y			rs.b    2
locn_hit_width		rs.b    2
locn_hit_height		rs.b    2
locn_players		rs.b	1			;recommended number of players (0=any)
locn_type_flag		rs.b	1			;0=norm campaign, 1=action, 2=possible campaign start, 3=campaign end
locn_legend		rs.b    6+45
locn_legend2		rs.b	6+60+6+60
locn_legend3		rs.b	6+60+1
locn_info		rs.b	6+60+6+60+6+60+6+60+1
locn_disk		rs.b	1			;disk number to find map and monsters on
locn_map_num		rs.b	1
locn_picture_num	rs.b	1			;picture number, -1=no pic
locn_music_num		rs.b	1			;music number, -1=no music
locn_atmos		rs.b	1			;background sfx
locn_mons1		rs.b	1			;monster type 1
locn_mons2		rs.b	1			;monster type 1
locn_sky		rs.b	1
locn_style		rs.b	1
locn_destinations	rs.b	8			;0=end of destinations
locn_struct_size	rs.b	0

			rsreset
for_legend		rs.b    6+60+6+60
for_info		rs.b	6+60+6+60+6+60+6+60+1
for_size		rs.b	0

			rsreset
temp_locn_legend	rs.b    6+45+6+60
temp_locn_legend2	rs.b	6+60+6+60+1
temp_locn_info		rs.b	6+60+6+60+6+60+6+60+1
temp_locn_size		rs.b	0

****************************************************************************
;In-game copper list

	IFD	CD32
SET_SKY_SIZE	equ	40
SKY_LINE_SIZE	equ	(4+SET_SKY_SIZE)
SKY_4LINE_SIZE	equ	12+(SKY_LINE_SIZE*4)
	ELSEIF
SET_SKY_SIZE	equ	4
SKY_LINE_SIZE	equ	(4+(SET_SKY_SIZE*2))*3
SKY_4LINE_SIZE	equ	8+(SKY_LINE_SIZE*4)
	ENDC

		rsreset
	IFD	CD32
clist_start	rs.l    3+64
clist_dma	rs.l	3
	ELSEIF
clist_start	rs.l    3
	ENDC
clist_sprites	rs.l    24
diw_strt	rs.l    1
diw_stop	rs.l	1
views_palette	rs.l	32+3*4
gun_palette	rs.l	2+9*4
views_bplpt	rs.l	12
col_wait1	rs.l    9
col_waits	rs.l    2+11*(SKY_4LINE_SIZE/4)+10*2
col_wait2	rs.l    10
scrolly_wait1	rs.l    10
scrolly_bplpt1	rs.l    13
scrolly_wait4	rs.l    5
scrolly_wait5	rs.l    5
scrolly_wait6	rs.l    5
scrolly_wait2	rs.l    1
scrolly_diwstrt	rs.l    8
scrolly_diwstop	rs.l    10
scrolly_wait3	rs.l    1
scrolly_bplpt2	rs.l	12
col_wait3	rs.l    10
col_waits2	rs.l    2+11*(SKY_4LINE_SIZE/4)+10*2
col_wait4	rs.l    37+5*5
logo_bplpt1	rs.l    0

****************************************************************************
;Front end copper list

	IFD	CD32
			rsreset
lace_clist_start1	rs.l    2
lace_sprites1		rs.l    26
lace_bplpt1		rs.l    76+17
lace_scanA1		rs.l    18
lace_scanB1		rs.l    18
lace_scanC1		rs.l    18
lace_scanD1		rs.l    18
lace_scanE1		rs.l    18
lace_scanF1		rs.l    18
lace_scanG1		rs.l    18
lace_scanH1		rs.l    18
lace_scanI1		rs.l    18
lace_scanJ1		rs.l    18
lace_scanK1		rs.l    18
lace_scanL1		rs.l    18
lace_scanM1		rs.l    18
lace_scanN1		rs.l    18
lace_scanO1		rs.l    18
lace_scanP1		rs.l    36
lace_jmpl1		rs.l	1
lace_jmph1		rs.l	2

lace_clist_start2	rs.l    2
lace_sprites2		rs.l    26
lace_bplpt2		rs.l    76+17
lace_scanA2		rs.l    18
lace_scanB2		rs.l    18
lace_scanC2		rs.l    18
lace_scanD2		rs.l    18
lace_scanE2		rs.l    18
lace_scanF2		rs.l    18
lace_scanG2		rs.l    18
lace_scanH2		rs.l    18
lace_scanI2		rs.l    18
lace_scanJ2		rs.l    18
lace_scanK2		rs.l    18
lace_scanL2		rs.l    18
lace_scanM2		rs.l    18
lace_scanN2		rs.l    18
lace_scanO2		rs.l    18
lace_scanP2		rs.l    36
lace_jmpl2		rs.l	1
lace_jmph2		rs.l	2

	ELSEIF
			rsreset
lace_clist_start1	rs.l    10
lace_bplpt1		rs.l    8
lace_paletteA1		rs.l    22
lace_highlightA1	rs.l    10
lace_highlightB1	rs.l    10
lace_highlightC1	rs.l    10
lace_band_palette1	rs.l    17
lace_downlightA1	rs.l    10
lace_downlightB1	rs.l    10
lace_downlightC1	rs.l    10
lace_paletteB1		rs.l    16
lace_scanA1		rs.l	9
lace_scanB1		rs.l	9
lace_scanC1		rs.l	9
lace_scanD1		rs.l	9
lace_scanE1		rs.l	9
lace_scanF1		rs.l	9
lace_scanG1		rs.l	9
lace_scanH1		rs.l	9
lace_scanI1		rs.l	9
lace_scanJ1		rs.l	9
lace_scanK1		rs.l	9
lace_scanL1		rs.l	9
lace_scanM1		rs.l	9
lace_scanN1		rs.l	9
lace_scanO1		rs.l	9
lace_scanP1		rs.l	9
lace_jmpl1		rs.l	1
lace_jmph1		rs.l	2

lace_clist_start2	rs.l	10
lace_bplpt2		rs.l	8
lace_paletteA2		rs.l	22
lace_highlightA2	rs.l	10
lace_highlightB2	rs.l	10
lace_highlightC2	rs.l	10
lace_band_palette2	rs.l	17
lace_downlightA2	rs.l	10
lace_downlightB2	rs.l	10
lace_downlightC2	rs.l	10
lace_paletteB2		rs.l	16
lace_scanA2		rs.l	9
lace_scanB2		rs.l	9
lace_scanC2		rs.l	9
lace_scanD2		rs.l	9
lace_scanE2		rs.l	9
lace_scanF2		rs.l	9
lace_scanG2		rs.l	9
lace_scanH2		rs.l	9
lace_scanI2		rs.l	9
lace_scanJ2		rs.l	9
lace_scanK2		rs.l	9
lace_scanL2		rs.l	9
lace_scanM2		rs.l	9
lace_scanN2		rs.l	9
lace_scanO2		rs.l	9
lace_scanP2		rs.l	9
lace_jmpl2		rs.l	1
lace_jmph2		rs.l    2

	ENDC

****************************************************************************
;Character selection copper list

			rsreset
	IFD	CD32
chselect_clist_start1	rs.l    3
	ELSEIF
chselect_clist_start1	rs.l    2
	ENDC
chselect_bplcon11	rs.l    8
chselect_bplpt1		rs.l    8
chselect_palette1	rs.l    32
chselect_loop_point1	rs.l	2
chselect_loop1		rs.l    5
chselect_loop_point1b	rs.l	2
chselect_loop1b		rs.l    19
chselect_bplpt1b	rs.l    8
chselect_palette1b	rs.l    34
chselect_jmpl1		rs.l	1
chselect_jmph1		rs.l    3

	IFD	CD32
chselect_clist_start2	rs.l    3
	ELSEIF
chselect_clist_start2	rs.l    2
	ENDC
chselect_bplcon12	rs.l    8
chselect_bplpt2		rs.l    8
chselect_palette2	rs.l    32
chselect_loop_point2	rs.l	2
chselect_loop2		rs.l    5
chselect_loop_point2b	rs.l	2
chselect_loop2b		rs.l    19
chselect_bplpt2b	rs.l	8
chselect_palette2b	rs.l	34
chselect_jmpl2		rs.l	1
chselect_jmph2		rs.l    3

****************************************************************************
;Message copper list
			rsreset
mesg_clist_start1	rs.l    10
mesg_bplpt1		rs.l    6
mesg_palette1		rs.l    8
mesg_colours1		rs.l    16
mesg_jmpl1		rs.l	1
mesg_jmph1		rs.l    2

mesg_clist_start2	rs.l    10
mesg_bplpt2		rs.l    6
mesg_palette2		rs.l    8
mesg_colours2		rs.l    16
mesg_jmpl2		rs.l	1
mesg_jmph2		rs.l    2

****************************************************************************
;Map copper list

	IFD	CD32
			rsreset
map_clist_start		rs.l    5
map_sprites		rs.l    17
map_bplcon1		rs.l    2
map_mod			rs.l    7+17
map_palette		rs.l    33
map_paletteb		rs.l    33
map_palettec		rs.l    33
map_paletted		rs.l    34
map_bplpt1		rs.l    16
map_line_wait1		rs.l    3
map_line_wait2		rs.l    1
map_line_bplpt		rs.l    22
map_split		rs.l	22
map_palette2		rs.l    32
map_bplpt2		rs.l    15
	ELSEIF
			rsreset
map_clist_start		rs.l    2
map_sprites		rs.l    17
map_bplcon1		rs.l    2
map_mod			rs.l    6
map_palette		rs.l    33
map_bplpt1		rs.l    12
map_line_wait1		rs.l    3
map_line_wait2		rs.l    3
map_line_bplpt		rs.l    12
map_split		rs.l	22
map_palette2		rs.l    32
map_bplpt2		rs.l    15
	ENDC

****************************************************************************
;Static copper list
			rsreset
static_clist_start1	rs.l	28
static_palette1		rs.l	132
static_bplpt1		rs.l    30
static_palette2b1	rs.l	67
static_bplptb1		rs.l	11
static_jmpl1		rs.l	1
static_jmph1		rs.l	2

static_clist_start2	rs.l	28
static_palette2		rs.l	132
static_bplpt2		rs.l    30
static_palette2b2	rs.l	67
static_bplptb2		rs.l	11
static_jmpl2		rs.l	1
static_jmph2		rs.l	2

			rsreset
static2_clist_start1	rs.l	28
static2_palette1	rs.l	132
static2_bplpt1		rs.l    17
static2_jmpl1		rs.l	1
static2_jmph1		rs.l	2

static2_clist_start2	rs.l	28
static2_palette2	rs.l	132
static2_bplpt2		rs.l    17
static2_jmpl2		rs.l	1
static2_jmph2		rs.l	2

****************************************************************************
;Death copper list
			rsreset
death1_clist_start	rs.l    10
death1_bplpt		rs.l    26
death1_palette		rs.l	32

****************************************************************************
;Outro copper list
			rsreset
outro_clist_start	rs.l    1
outro_bplcon0		rs.l    9
outro_bplpt		rs.l    28
outro_palette		rs.l	32

****************************************************************************
;intro copper list
			rsreset
intro_clist_start	rs.l	1
intro_sprites		rs.l	16
intro_screen_stuff	rs.l    9
intro_palette		rs.l    33
intro_bplpt		rs.l    12
intro_jmpl		rs.l	1
intro_jmph		rs.l    2
intro_clist_start2	rs.l	1
intro_sprites2		rs.l	16
intro_screen_stuff2	rs.l    9
intro_palette2		rs.l    33
intro_bplpt2		rs.l    12
intro_jmpl2		rs.l	1
intro_jmph2		rs.l    2

****************************************************************************
;Anim copper list
			rsreset
anim_clist_start	rs.l    1
anim_sprites		rs.l    25
anim_palette		rs.l    32
anim_bplpt		rs.l    14

********************************************************************************
************************************ Variables *********************************
********************************************************************************

			rsreset
gr_address		rs.l	1
gr_direction		rs.b	1
gr_type			rs.b	1	;0=expl,1=stun
gr_xvel			rs.w	1
gr_yvel			rs.w	1
gr_height		rs.w	1
gr_radius		rs.w	1
gr_firenorth		rs.b	1
gr_fireeast		rs.b	1
gr_firesouth		rs.b	1
gr_firewest		rs.b	1
gr_firedown		rs.b	1
gr_fireup		rs.b	1
gr_owner		rs.b	1
gr_pad			rs.b	1
gr_struct_size		rs.b	0

			rsreset
sn_num			rs.b	1
sn_white		rs.b	1
sn_address		rs.l	1
sn_direction		rs.b	1
sn_type			rs.b	1
sn_density		rs.w	1
sn_rounds		rs.w	1
sn_delay		rs.w	1
sn_fitness		rs.w	1
sn_physique		rs.w	1
sn_turn_count		rs.w	1
sn_turn_flag		rs.b	1
sn_shoot_players_flag	rs.b	1
sn_range		rs.b	1
sn_owner		rs.b	1
sn_struct_size		rs.b	0

			rsreset
scroll_node_prec	rs.l	1
scroll_node_succ	rs.l	1
scroll_node_text	rs.b    0

MODE_NONE	equ     0
MODE_GAME       equ	1
MODE_FRONT	equ     2
MODE_CHSELECT	equ     3
MODE_WORLD	equ     4
MODE_STATIC	equ     5
MODE_HELP	equ     6
MODE_INTRO	equ     7
MODE_DEATH	equ     8
MODE_END	equ     9
MODE_CHSELECT_SCROLL	equ     10
MODE_NOPOTGO	equ     11

		rsreset
player1		rs.b	player_struct_size
player2		rs.b	player_struct_size
player3		rs.b	player_struct_size
player4		rs.b	player_struct_size
time_left	rs.l	1
leader1		rs.w	1	;0=none, 1-4=leader
leader2		rs.w	1	;0=none, 1-4=leader
floor_size	rs.w	1
last_view	rs.w	1
water_anim	rs.w	1
hatch_level	rs.w	1
hatch_line	rs.w	1
shake_power	rs.b    1
shake_x		rs.b	1
shake_y		rs.b	1
shake_z		rs.b	1
field_posn      rs.w	1
mouse_move	rs.w	1
mouse_timer	rs.w	1
mouse_tot_time	rs.w	1
back_sound	rs.w	1
mode		rs.w	1
redraw_flag	rs.w	1
redraw_solid	rs.w	1
redraw_temp	rs.w	1
map_flags	rs.w	1
map_floor	rs.w	1
map_block	rs.w	1
map_water	rs.w	1
map_panel	rs.w	1
map_explosion	rs.w	1
map_variant	rs.w	1
map_aux		rs.w	1
joystick1	rs.w	1		;bits 0=up,1=down,2=left,3=right,4=fire
joystick2	rs.w    1
joystick3	rs.w    1
joystick4	rs.w    1
joystick1_old	rs.w	1		;bits 0=up,1=down,2=left,3=right,4=fire
joystick2_old	rs.w    1
joystick3_old	rs.w    1
joystick4_old	rs.w    1
joystick1_temp	rs.w    1
joystick2_temp	rs.w    1
joystick3_temp	rs.w    1
joystick4_temp	rs.w    1
pen_old_x	rs.w	1
pen_old_y	rs.w	1
pen_x		rs.w	1
pen_y		rs.w	1
pen_left_bt	rs.w    1
pen_right_bt	rs.w    1
pen_old_left_bt	rs.w    1
pen_old_right_bt	rs.w    1
pen_action	rs.w    1
pen_player	rs.w    1
block_struct	rs.b 	block_struct_size
iff_variables	rs.b	60
back_sample	rs.w	1	;current sample in buffer
old_back_sample	rs.w	1
old_fx_sample	rs.b	1
fx_sample	rs.b	1
fx_position	rs.b	1
pad2		rs.b	1
fx_period	rs.w	1
fx_channel	rs.w	1
scroll_ch_width	rs.w	1
scroll_head	rs.l	1
scroll_tail	rs.l	1
scroll_prt	rs.l	1
scroll_colr	rs.w	1
scroll_name	rs.l	1
scroll_ret_name	rs.l	1
scroll_pl1	rs.l	1
scroll_pl2	rs.l	1
scroll_pl3	rs.l	1
scroll_pl4	rs.l	1
scrolld_pl1	rs.l	1
scrolld_pl2	rs.l	1
scrolld_pl3	rs.l	1
scrolld_pl4	rs.l	1
last_on_a_lift	rs.w	1
on_a_lift	rs.w	1
offsetx		rs.w	1
offsety		rs.w	1
players_alive	rs.w	1
random_num      rs.w    1
restart_flag	rs.w	1
RESTART_QUIT	equ	1		;quit to main menu
RESTART_EXIT	equ     2		;exit to workbench
RESTART_RETRY	equ     3		;retry level
RESTART_MAP	equ     4		;back to world map
RESTART_QUIT_VIA_DEATH	equ	5	;quit to main menu via death sequence
RESTART_LOAD	equ	6		;load game from main menu
RESTART_ABORT	equ     7		;back to world map
RESTART_END	equ     9		;to end sequence
blast_damage	rs.l	1
winner_var	rs.l	1
winner_glo	rs.l	1
pad1_button_a	rs.w	1
pad1_button_b	rs.w	1
pad1_button_c	rs.w	1
pad1_button_d	rs.w	1
pad2_button_a	rs.w	1
pad2_button_b	rs.w	1
pad2_button_c	rs.w	1
pad2_button_d	rs.w	1
pad1_old_button_a	rs.w	1
pad1_old_button_b	rs.w	1
pad1_old_button_c	rs.w	1
pad1_old_button_d	rs.w	1
pad2_old_button_a	rs.w	1
pad2_old_button_b	rs.w	1
pad2_old_button_c	rs.w	1
pad2_old_button_d	rs.w	1
mouse0_trip	rs.w    1
mouse0_x	rs.w    1
mouse0_y	rs.w    1
mouse0_left_bt	rs.w    1
mouse0_right_bt	rs.w    1
mouse0_old_left_bt	rs.w    1
mouse0_old_right_bt	rs.w    1
mouse0_action	rs.w    1
mouse0_player	rs.w    1
mouse0_last_image	rs.l	1
mouse1_trip	rs.w    1
mouse1_x	rs.w    1
mouse1_y	rs.w    1
mouse1_left_bt	rs.w    1
mouse1_right_bt	rs.w    1
mouse1_old_left_bt	rs.w    1
mouse1_old_right_bt	rs.w    1
mouse1_action	rs.w    1
mouse1_player	rs.w    1
mouse1_last_image	rs.l	1
water_direction	rs.w	1
new_backsfx	rs.w	1
new_style	rs.w	1
new_mons1	rs.w	1
new_mons2	rs.w	1
new_disk	rs.w	1
chip_base	rs.l	1
fast_base	rs.l	1
num_locns	rs.w	1
curr_disk	rs.w	1
lightning	rs.w	1
old_lightning	rs.w	1
shake		rs.w	1
swap		rs.w	1
changed		rs.w	1
scrolly_on	rs.w	1
abort_drawtext	rs.w	1
NUM_GRENADES	equ	32
grenades	rs.b	gr_struct_size*NUM_GRENADES
NUM_SENTRIES	equ     16
sentries	rs.b	sn_struct_size*NUM_SENTRIES
info_height	rs.w	1

	IFD	CHECKSUM
gamegfx_checksum	rs.l	1
miscgfx_checksum	rs.l	1
	ENDC

sample_length		rs.w    1
sample_rept_length	rs.w    1
sample_oneshot_address	rs.l    1
sample_rept_address	rs.l    1
sample_channel		rs.w    1
sample_volume		rs.w    1
sample_period		rs.w    1

sample_length2		rs.w    1
sample_rept_length2	rs.w    1
sample_oneshot_address2	rs.l    1
sample_rept_address2	rs.l    1
sample_channel2		rs.w    1
sample_volume2		rs.w    1
sample_period2		rs.w    1

		IFD	CHEAT

gedit_position	rs.w	1
gedit_timer	rs.l	1
gedit_onoff	rs.w	1
gedit_block	rs.l	1
gedit_selected	rs.w	1	;0=floor,1=block,2=water,3=panel,4=explosion
gedit_grab	rs.w	1
gedit_save_posn	rs.l	1
gedit_filename	rs.l	2
gedit_x		rs.w	1
gedit_y		rs.w	1

		ENDC

nukes_armed	rs.w	1
outro_char	rs.w	1
code1		rs.b    27
pad4		rs.b	1
position	rs.l	1
;illuminate	rs.w	1
block_rear	rs.l	1
block_side	rs.l	1
block_below	rs.l	1
vars_size	rs.b	0

********************************************************************************
;global variables

CNTRL_JOY1	equ	1
CNTRL_JOY2	equ     2
CNTRL_JOY3	equ     3
CNTRL_JOY4	equ	4
CNTRL_MOUSE1	equ     5
CNTRL_MOUSE2	equ     6
CNTRL_KEYS1	equ     7 	;q   a     o     p      space
CNTRL_KEYS2	equ     8	;q   a     t     y      space
CNTRL_KEYS3	equ     9	;cup cdown kp9   kp-    kp0
CNTRL_KEYS4	equ     10	;cup cdown cleft cright rshift
CNTRL_UNUSED	equ     11
CNTRL_PAD1	equ     12
CNTRL_PAD2	equ     13

ACTV_JOY1M	equ	%0000000000001
ACTV_JOY2M	equ	%0000000000010
ACTV_JOY3M	equ	%0000000000100
ACTV_JOY4M	equ	%0000000001000
ACTV_MOUSE1M	equ	%0000000010000
ACTV_MOUSE2M	equ	%0000000100000
ACTV_KEYS1M	equ	%0000001000000
ACTV_KEYS2M	equ	%0000010000000
ACTV_KEYS3M	equ	%0000100000000
ACTV_KEYS4M	equ	%0001000000000
ACTV_UNUSEDM	equ	%0010000000000
ACTV_PAD1M	equ	%0100000000000
ACTV_PAD2M	equ	%1000000000000

ACTV_JOY1B	equ	0
ACTV_JOY2B	equ	1
ACTV_JOY3B	equ	2
ACTV_JOY4B	equ	3
ACTV_MOUSE1B	equ	4
ACTV_MOUSE2B	equ	5
ACTV_KEYS1B	equ     6
ACTV_KEYS2B	equ     7
ACTV_KEYS3B	equ     8
ACTV_KEYS4B	equ     9
ACTV_UNUSEDB	equ	10
ACTV_PAD1B	equ     11
ACTV_PAD2B	equ     12

		rsreset
active_controls	rs.w	1
first_time_at_front	rs.w	1
new_active_controls	rs.w	1
num_players	rs.b	1
pl1_control	rs.b	1
pl2_control	rs.b	1
pl3_control	rs.b	1
pl4_control	rs.b	1
curr_player	rs.w	1
control1	rs.b	1
control2	rs.b	1
control3	rs.b	1
control4	rs.b	1
control5	rs.b	1
control6	rs.b	1
control7	rs.b	1
control8	rs.b	1
control9	rs.b	1
control10	rs.b	1
control11	rs.b	1
control12	rs.b	1
control13	rs.b	1
curr_player_ctl	rs.l	1
worldmap_loc	rs.w	1
worldmap_last_locn	rs.w	1
worldmap_loc_x	rs.w	1
worldmap_loc_y	rs.w	1
worldmap_x	rs.w	1
worldmap_y	rs.w	1
worldmap_cur_x	rs.w	1
worldmap_cur_y	rs.w	1
worldmap_anim1	rs.w	1
worldmap_anim2	rs.w	1
worldmap_last_scan	rs.w	1
worldmap_map_num	rs.w	1
worldmap_back_sfx	rs.w	1
worldmap_add1	rs.l	1
worldmap_store1	rs.l	1
worldmap_add2	rs.l	1
worldmap_store2	rs.l	1
worldmap_glow	rs.w	1
curr_locn	rs.b	locn_struct_size
chselect_x	rs.w	1
chselect_direct	rs.w	1
chselect_timer	rs.w	1
chselect_ch1	rs.w	1
chselect_ch2	rs.w	1
chselect_ch3	rs.w	1
chselect_ch4	rs.w	1
chselect_ch	rs.w	1
chselect_num	rs.w	1
title_scroll	rs.w	1
file_mode	rs.w	1	;0=show all messages 1=only show on error
completed	rs.b    42	;1=completed
completed_end	rs.b	0
game_count	rs.w	1
no_music        rs.w	1
attract_mode	rs.w	1	;0=off, 1=record, 2=play
action_flag	rs.w	1	;0=campaign game 1=action game
draw_mode	rs.w	1	;0=blitter, -1=cpu
at_trip1	rs.w	1
at_trip2	rs.w	1
at_trip3	rs.w	1
at_trip1_dur	rs.w	1
at_trip2_dur	rs.w	1
at_trip3_dur	rs.w	1
at_trip1_rot	rs.w	1
at_trip2_rot	rs.w	1
playtime	rs.w	1
which_logo	rs.w	1
water_sample	rs.l	1
backsfx_sample	rs.l	1
water_in_buf	rs.w	1		(0=no,-1=yes)
action_map	rs.w	1
training_flag	rs.w	1	;0=no 1=yes
world_strobe	rs.w	1

player1_stats	rs.b	stats_struct_size
player2_stats	rs.b	stats_struct_size
player3_stats	rs.b	stats_struct_size
player4_stats	rs.b	stats_struct_size

orig_player1_stats	rs.b	stats_struct_size
orig_pl1_using		rs.b	inven_item_size
orig_pl1_store		rs.b    inven_item_size*inven_size
orig_player2_stats	rs.b	stats_struct_size
orig_pl2_using		rs.b    inven_item_size
orig_pl2_store		rs.b    inven_item_size*inven_size
orig_player3_stats	rs.b	stats_struct_size
orig_pl3_using		rs.b    inven_item_size
orig_pl3_store		rs.b    inven_item_size*inven_size
orig_player4_stats	rs.b	stats_struct_size
orig_pl4_using		rs.b    inven_item_size
orig_pl4_store		rs.b    inven_item_size*inven_size

save_count	rs.b	1
map_count	rs.b	1
ret_disk	rs.w	1
default_cntrl	rs.w	1
new_default_cntrl	rs.w	1
enabled_controls	rs.w	1
max_num_players	rs.w	1
global_size	rs.b	0

********************************************************************************
******************************** Audio Channels ********************************
********************************************************************************

;1/2 mb chip
;
;3 background sound
;2 long quietish noises
;	door
;1 loud quick noises
;	blockthud
;	footsteps players 1 & 3
;	explosion
;0 firing
;	footsteps players 2 & 4
;	guns players 1-4
;       swish players 1-4
;	egghatch


;1 mb chip
;
;3 background sound
;2 long quietish noises
;	door
;	explosion
;1 loud quick noises
;	blockthud
;       players 2 & 4
;0 firing
;	egg hatch
;	players 1 & 3
			rsreset			;sample data format "VHDR"
VHDR_chunk_length	rs.l	1
VHDR_oneshot_hi_samples	rs.l	1
VHDR_repeat_hi_samples	rs.l	1
VHDR_samples_per_hi_cyc	rs.l	1
VHDR_samples_per_sec	rs.w	1
VHDR_ct_octave		rs.b	1
VHDR_s_compression	rs.b	1
VHDR_volume		rs.l	1
VHDR_chunk_size		rs.b	0

			rsreset
lch			rs.w	1		;hardware regs format
lcl			rs.w	1
len			rs.w	1
per			rs.w	1
vol			rs.w	1
dat			rs.w	1

********************************************************************************
********************************* Error colours ********************************
********************************************************************************

bad_monster             equ	$888
id_pushable_failed	equ	$00f
reloc_dos_buffer_failed	equ	$0f0
reloc_dos_load_failed	equ	$0ff
reloc_mem_alloc_failed	equ	$f0f
dos_buffer_failed	equ	$ff0
dos_load_failed		equ	$f0f
front_decrunch_failed	equ	$ff0
game_decrunch_failed	equ	$fff

********************************************************************************
***************************** Low Chip Memory Map ******************************
********************************************************************************

			rsreset
lc_chipzero		rs.b	4
lc_mesg_copperlist	rs.b    344
lc_mesg_buffer		rs.b	34800
lc_anim_copperlist	rs.b	300
lc_disk_buffer		rs.b	19712

lc_size			rs.b	0	;55160 bytes

********************************************************************************
***************************** Intro Chip Memory Map ****************************
********************************************************************************

;Chip memory
			rsreset
intro_lc		rs.b	55160
	IFD	CD32
intro_copper		rs.b	592
lace_screen_buffer1	rs.b	168800
lace_anim_buffer	rs.b	34800
lace_copperlist		rs.b    3440
lace_fontb		rs.b	67884
lace_music		rs.b	128696
lace_cursor		rs.b	1536
	ELSEIF
intro_copper		rs.b	592
lace_screen_buffer1	rs.b	0
intro_music		rs.b	157474
intro_screen1		rs.b	73952-34800
lace_anim_buffer	rs.b	34800
lace_copperlist		rs.b	2240
lace_fontb		rs.b	67884
lace_music		rs.b	128696
lace_fill		rs.b	10080
	ENDC

intro_chip_mem_size	rs.b	0	;484.4 k

phrasebook_size		equ	9000
			rsreset
	IFD	CD32
code_size		set	139720+phrasebook_size
	ELSEIF
code_size		set	129720+phrasebook_size
	ENDC
	IFD	demo
code_size		set	122*1024+phrasebook_size
	ENDC
	IFD	download
code_size		set	135*1024+phrasebook_size
	ENDC

;code size			129720+9000

	IFD	CD32
front_variables		rs.b	25*512
	ELSEIF
front_variables		rs.b	15*512
	ENDC
front_variables_end	rs.b	0
front_global_vars	rs.b	5*512
front_global_end	rs.b	0

front_figures_save	rs.b	100604
front_font_s		rs.b	98368
	IFD	CD32
front_font_s_small	rs.b	0
	ENDC
front_anim_in		rs.b	27328
front_anim_out		rs.b	28852
front_mesg_cpr		rs.b	344
front_anim_cpr		rs.b    288
	IFD	CD32
front_font_s_small_ext	rs.b	98368
	ENDC
front_player_dat	rs.b	4*12*272
front_locations_dat	rs.b	25474
	IFND	CD32
front_se_logo		rs.b	67896
	ENDC

front_fast_mem_size	rs.b	0	;496.4 K

********************************************************************************
****************************** ChSelect Memory Map *****************************
********************************************************************************
;Chip memory
			rsreset
ch_lc			rs.b	55160
	IFD	CD32
ch_copperlist		rs.b	1000
ch_music		rs.b    57872
ch_faces		rs.b	296512
ch_smallfaces		rs.b    24960
ch_fill			rs.b	13464
ch_anti_scroll		rs.b	100
ch_screen_buffer	rs.b	67200
	ELSEIF
ch_copperlist		rs.b	992
ch_music		rs.b    57872
ch_faces		rs.b	146448
ch_smallfaces		rs.b    24960
ch_anti_scroll		rs.b	100
ch_screen_buffer	rs.b	67200
	ENDC

ch_chip_mem_size	rs.b	0	;344.5 K

********************************************************************************
********************************************************************************
********************************************************************************
;world map chip memory
	IFD	CD32
			rsreset
worldmap_lc		rs.b	55160
worldmap_panel		rs.b	16320
worldmap_music		rs.b	136608
worldmap_copperlist	rs.b	1168
worldmap_font		rs.b	6248
worldmap_sprites	rs.b	3428
worldmap_panel_buffer	rs.b	16320
worldmap_anim_buffer	rs.b	34800
worldmap_foreign	rs.b	74636

	ELSEIF
			rsreset
worldmap_lc		rs.b	55160
worldmap_panel		rs.b	16320
worldmap_music		rs.b	136608
worldmap_copperlist	rs.b	636
worldmap_font		rs.b	6248
worldmap_sprites	rs.b	3428
worldmap_map		rs.b	138272
worldmap_panel_buffer	rs.b	16320
worldmap_anim_buffer	rs.b	34800
worldmap_foreign	rs.b	74636
	ENDC

worldmap_chip_mem_size	rs.b	0	;471.1 K

********************************************************************************
********************************************************************************
********************************************************************************
;death chip memory
			rsreset
death_lc		rs.b	55160
death_copperlist	rs.b	276
death_music		rs.b	128606
death_screen		rs.b	42400
death_plt		rs.b	64

death_chip_mem_size	rs.b	0	;221.1 K

********************************************************************************
********************************************************************************
********************************************************************************
;outro chip memory
			rsreset
outro_lc		rs.b	55160
outro_copperlist	rs.b	284
outro_music		rs.b	100238
outro_screen		rs.b	50880
outro_plt		rs.b    32
outro_backdrop		rs.b	42400
outro_plt2		rs.b    64
outro_foreignfont	rs.b	1676
outro_font		rs.b	1676
outro_fill		rs.b	432
outro_text		rs.b	4428

outro_chip_mem_size	rs.b	0	;248.2 K

********************************************************************************
********************************* In-game Memory Map ***************************
********************************************************************************

;static gamegfx
			rsreset
static_copperlist		rs.b	2168
static_copperlist_notext	rs.b    1440
static_font			rs.b	16408
static_panel			rs.b	40800
static_picture			rs.b	217600
static_palette			rs.b	256
static_music			rs.b	137000
static_size			rs.b	0

;save figure
			rsreset
load_figure1		rs.b	100
figure1			rs.b	14224
face1			rs.b	1126
load_figure2		rs.b	100
figure2			rs.b	14224
face2			rs.b	1126
load_figure3		rs.b	100
figure3			rs.b	14224
face3			rs.b	1126
load_figure4		rs.b	100
figure4			rs.b	14224
face4			rs.b	1126
load_monster1		rs.b	100
monster1		rs.b	14224
dead1			rs.b    2486
attck1			rs.b    2592
load_monster2		rs.b	100
monster2		rs.b	14224
dead2			rs.b    2486
attck2			rs.b    2592 	;98.2k 100604

			rsreset
tmp_load_figure		rs.b	100
tmp_figure		rs.b	14224
tmp_face		rs.b	1126	;15k

                        rsreset
tmp_load_monster	rs.b	100
tmp_monster		rs.b	14224
tmp_dead		rs.b    2486
tmp_attck		rs.b    2592	;18.9k

;Chip memory
		rsreset
chipzero	rs.b	4
mesg_copperlist	rs.b	0
	IFD	CD32
fmode_pad	rs.b	4
screen_buffer1	rs.b	50880
screen_buffer2	rs.b	50880
end_screens	rs.b	0
copperlist	rs.b	7252
miscgfx		rs.b	181312
	ELSEIF
screen_buffer1	rs.b	42400
screen_buffer2	rs.b	42400
end_screens	rs.b	0
copperlist	rs.b	4524
miscgfx		rs.b	128860
	ENDC
backsfx_buf	rs.b	20000
gun_sfx		rs.b	8720
miscsfx		rs.b	28640
	IFD	CD32
sprites		rs.b	5472
fireeffects	rs.b	15820
	ELSEIF
sprites		rs.b	2736
fireeffects	rs.b	7836
	ENDC
scrolly		rs.b	864
horizon_images	rs.b	2304
	IFD	CD32
gamegfx		rs.b	243492
	ELSEIF
gamegfx		rs.b	234604
	ENDC
chip_mem_size	rs.b	0	;511.6k

		rsreset
;code size		129720+9000

	IFD	CD32
variables	rs.b	25*512
	ELSEIF
variables	rs.b	15*512
	ENDC
variables_end	rs.b	0
global_vars	rs.b	5*512
global_end	rs.b	0

locn		rs.b	542
map		rs.b	157738-542
map_end		rs.b	0
attack1		rs.b	2592
attack2		rs.b	2592
	IFD	CD32
item_images	rs.b	49228
	ELSEIF
item_images	rs.b	34660
	ENDC
water		rs.b	20000
moresfx		rs.b	58024
moresfx_size	rs.b	0
windows		rs.b	45284
items		rs.b	32604
mesgs		rs.b	6048
monsters_defns	rs.b	1760
exgfx		rs.b	11692
		rs.b	1024
super_stack	rs.b	0
dir_buffer	rs.b	512
	IFD	demo
logo2		rs.b	600
mouse_moves	rs.b	5000
end_mouse_moves	rs.b	0
	ENDC

fast_mem_size	rs.b	0	;512.0k

********************************************************************************

		rsreset
	IFD	CD32
ex_effects	rs.b	547184
	ELSEIF
ex_effects	rs.b	413984
	ENDC
ex_end_effects	rs.b	0
ex_water	rs.b	20000
ex_moresfx	rs.b    58024
ex_sizeof	rs.b	0	;492008 480.4k

********************************************************************************
;save game structure

dir_sector_size		equ	1		;1
bank_sector_size	equ	map_end/512 	;326

		rsreset
BANK_NAME_SIZE	equ	28
bank_name	rs.b    BANK_NAME_SIZE
bank_used	rs.w	1
BANK_UNUSED	equ	0
BANK_USED	equ     1
bank_checksum	rs.l    1
bank_size	rs.b	0

		rsreset
dir_id		rs.l	1	;"HGUN"
dir_version	rs.l	1	;contains of VERSION
dir_checksum	rs.l	1
dir_bank1	rs.b	bank_size
dir_bank2	rs.b	bank_size
dir_bank3	rs.b	bank_size
dir_bank4	rs.b	bank_size
dir_bank5	rs.b	bank_size
dir_size        rs.b	0

		rsreset
directory	rs.b	dir_sector_size	;disk in blocks 0-1759
bank1		rs.b	bank_sector_size
bank2		rs.b	bank_sector_size
bank3		rs.b	bank_sector_size
bank4		rs.b	bank_sector_size
bank5		rs.b	bank_sector_size	;1630 blocks
disk_size	rs.b	0

;checksums calculated by:
; 1. zeroing checksum location
; 2. taking sum of all data to be checksummed

********************************************************************************
;check sizes of structures
		IFLE	524032-(intro_chip_mem_size)
		fail    Intro chip mem too big!
		ENDC

	IFD	CD32
		IFLE	623500-(worldmap_chip_mem_size)
		fail    WorldMap chip mem too big!
		ENDC

		IFLE	623500-(chip_mem_size)
		fail    Game chip mem too big!
		ENDC
	ELSEIF
		IFLE	524032-(worldmap_chip_mem_size)
		fail    WorldMap chip mem too big!
		ENDC

		IFLE	524032-(chip_mem_size)
		fail    Game chip mem too big!
		ENDC
	ENDC

		IFLE	ex_end_effects-(static_size)
		fail    Static chip mem too big!
		ENDC

		IFLE	524032-(ch_chip_mem_size)
		fail    ChSelect chip mem too big!
		ENDC

	IFD	CD32
		IFLE	558000-(fast_mem_size+code_size)
		fail    Fast mem too big!
		ENDC

		IFLE	558000-(front_fast_mem_size+code_size)
		fail    Front fast mem too big!
		ENDC
	ELSEIF
		IFLE	512*1024-(fast_mem_size+code_size)
		fail    Fast mem too big!
		ENDC

		IFLE	512*1024-(front_fast_mem_size+code_size)
		fail    Front fast mem too big!
		ENDC
	ENDC

		IFLE	(variables_end-variables)-vars_size
		fail	Variables structure too large!
		ENDC

		IFLE	(global_end-global_vars)-global_size
		fail	Global structure too large!
		ENDC

		IFLE	1760-disk_size
		fail	Save game disk data too large!
		ENDC

		IFLE	(dir_sector_size*512)-dir_size
		fail	Save game dir structure too large!
		ENDC
