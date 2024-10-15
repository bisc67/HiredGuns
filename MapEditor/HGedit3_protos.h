/* Prototypes for functions defined in
HGedit3.c
 */

int add_button(void);

void redraw_tools_window(void);

void redraw_info_window(void);

extern struct Image mons_image;

extern char monster_desc[120][40];

void update_mons_window(void);

void redraw_mons_window(void);

extern struct Image world_image;

void redraw_world_window(void);

void redraw_level(void);

int make_push_list(void);

void get_free_button(void);

ULONG find_door(ULONG target);

void make_2d_map(void);

void illuminate(void);

void redraw_lift_window(void);

void redraw_door_window(void);

void redraw_map_window(void);

void close_all(void);

void open_all(void);

