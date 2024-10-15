#define MAP_HEIGHT 20
#define MAP_WIDTH 23
#define MAP_DEPTH 23
#define FLOOR_SIZE 529

#define keep_floor_here_bit	0x00000001
#define keep_block_here_bit	0x00000002
#define keep_water_here_bit	0x00000004
#define keep_panel_here_bit	0x00000008
#define keep_explosion_here_bit	0x00000010
#define keep_aux_here_bit	0x00000020
#define keep_opaque_bit		0x00000040
#define keep_invisible_bit	0x00000080
#define keep_pushable_bit	0x00000100
#define keep_floor		0x00000601
#define keep_block		0x0001f802
#define keep_water		0x00060004
#define keep_panel		0x00180008
#define keep_explosion		0x00600010
#define keep_variant		0x0f800000
#define keep_aux		0xf0000020

#define floor_shift	9
#define block_shift	11
#define water_shift	17
#define panel_shift	19
#define explosion_shift	21
#define variant_shift	23
#define aux_shift       28

#define keep_water_direction	0xffff

typedef struct map_cell1
{
	unsigned int	auxiliary:4,
			variant:5,
			explosion:2,
			panel:2,
			water:2,
			block:6,
			floor:2,
			pushable_bit:1,
			invisible_bit:1,
			opaque_bit:1,
			aux_here_bit:1,
			explosion_here_bit:1,
			panel_here_bit:1,
			water_here_bit:1,
			block_here_bit:1,
			floor_here_bit:1;
} map_cell1;

typedef struct map_cell2
{
	unsigned int	egg_hatch:12,
                        egg_contents:8,
			flowing_bit:1,
			qmark_here_bit:1,
			pl4_seen:1,
			pl3_seen:1,
			pl2_seen:1,
			pl1_seen:1,
			block_2d:6;
} map_cell2;

typedef struct map_cell3
{
	unsigned int	light:1,
			no_question:1,
			no_monster:1,
			no_egg:1,
			sky_west:1,
			sky_south:1,
			sky_east:1,
			sky_north:1,
			item_ammo:8,
			item_damage:8,
			item_type:8;
} map_cell3;

typedef struct monster
{
	ULONG monster_type;
	ULONG monster_mem;
	UWORD monster_health;
	UBYTE monster_direct;
	UBYTE monster_x;
	UBYTE monster_y;
	UBYTE monster_floor;
	UBYTE monster_count;
	UBYTE monster_pad;
} monster;

typedef struct button
{
	BYTE button_used;
	UBYTE button_action_in;
	UBYTE button_action_out;
	UBYTE button_pad5;
	ULONG button_data_in;
	ULONG button_data_out;
	ULONG button_pad1;
	ULONG button_pad2;
	ULONG button_pad3;
	ULONG button_pad4;
} button;

typedef struct lift
{
	UWORD lift_posn;
	UBYTE lift_height;
	UBYTE lift_min_height;
	UBYTE lift_max_height;
	UBYTE lift_direction;
	UBYTE lift_weight;
	UBYTE lift_up;
	UBYTE lift_down;
	UBYTE lift_automove;
} lift;

typedef struct door
{
	UWORD door_posn;
	UBYTE door_trig;
	UBYTE door_direction;
	struct map_cell1 door_type;
	UBYTE door_delay;
	UBYTE door_count;
	UBYTE door_key;
	BYTE door_button_only;
} door;

typedef struct pushable
{
	UWORD pushable_posn;
	struct map_cell1 pushable_cell;
} pushable;

typedef struct text
{
	UBYTE text_data[((48/8)*40)*2];
} text;

typedef struct horizon
{
	UBYTE horizon_data[(144/8)*32];
} horizon;

typedef struct text_trigger
{
	ULONG trigger_posn;
	UWORD mesg_offset;
} text_trigger;

typedef struct expl
{
	UWORD expl_posn;
	UBYTE expl_direction;
	UBYTE expl_speed;
	UBYTE expl_count;
	UBYTE expl_pad;
	ULONG expl_and;
	ULONG expl_or;
	UWORD expl_damage;
} expl;

typedef struct locn
{
	UBYTE locn_x1,locn_x2;
	UBYTE locn_y1,locn_y2;
	UWORD locn_hit_width,locn_hit_height;
	UBYTE locn_players;
	UBYTE locn_type_flag;
	UBYTE locn_legend1_codes[6];
	char locn_legend1[45];
	UBYTE locn_legend2_codes[6];
	char locn_legend2[60];
	UBYTE locn_legend3_codes[6];
	char locn_legend3[60];
	UBYTE locn_legend4_codes[6];
	char locn_legend4[60];
	UBYTE locn_legend_endcode;
	UBYTE locn_info1_codes[6];
	char locn_info1[60];
	UBYTE locn_info2_codes[6];
	char locn_info2[60];
	UBYTE locn_info3_codes[6];
	char locn_info3[60];
	UBYTE locn_info4_codes[6];
	char locn_info4[60];
	UBYTE locn_info_endcode;
	UBYTE locn_disk;
	UBYTE locn_map_num;
	UBYTE locn_picture_num;
	UBYTE locn_music_num;
	UBYTE locn_atmos;
	BYTE locn_mons1;
	BYTE locn_mons2;
	UBYTE locn_sky;
	UBYTE locn_style;
	UWORD locn_destinations[4];
} locn;

typedef struct map
{
        char name_pred1;
        char name_pred2;
        char name_pred3;
        char name_pred4;
	ULONG name_succ;
	char name[120];
	UBYTE pl1x;
	UBYTE pl1y;
	UBYTE pl1z;
	UBYTE pl2x;
	UBYTE pl2y;
	UBYTE pl2z;
	UBYTE pl3x;
	UBYTE pl3y;
	UBYTE pl3z;
	UBYTE pl4x;
	UBYTE pl4y;
	UBYTE pl4z;
	UBYTE exitx;
	UBYTE exity;
	UBYTE exitz;
	UBYTE time_limit;
	UWORD water_level;
	UWORD low_water_level;
	UWORD hi_water_level;
	UWORD not_used;
	UWORD water_speed;

	struct expl explosions[32];
	struct horizon horizons[4];
	struct text_trigger text_triggers[50];
	ULONG eod5;
	char text_mesgs[3*1024];
	struct monster monsters[128];
	ULONG eod1;
	struct button buttons[32];
	struct lift lifts[32];
	UWORD eod2;
	struct door doors[32];
	UWORD eod3;
	struct pushable pushables[32];
	UWORD eod4;
	struct text texts[36];

	ULONG saftey_net1[5*MAP_WIDTH];
	struct map_cell1 map_part1[MAP_HEIGHT][MAP_DEPTH][MAP_WIDTH];
	ULONG saftey_net2[5*MAP_WIDTH];

	ULONG saftey_net3[5*MAP_WIDTH];
	struct map_cell2 map_part2[MAP_HEIGHT][MAP_DEPTH][MAP_WIDTH];
	ULONG saftey_net4[5*MAP_WIDTH];

	ULONG saftey_net5[5*MAP_WIDTH];
	struct map_cell3 map_part3[MAP_HEIGHT][MAP_DEPTH][MAP_WIDTH];
	ULONG saftey_net6[5*MAP_WIDTH];
} map;

