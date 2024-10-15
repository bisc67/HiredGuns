/* Prototypes for functions defined in
HGedit1.c
 */

void swap(ULONG * px,
          ULONG * py);

void exit_routine(void);

void new_routine(void);

void load_mapdata(void);

void appstr(char * dest,
            char * source);

void show_title(void);

void show_help(void);

void display(void);

void load_panels(void);

void load_horizons(void);

void load_text(void);

void crunch(void);

void save_mapdata(void);

void save_mapdata_as(void);

void save_convers(void);

void save_info(void);

void use_mapdata(void);

extern struct Image panel_image;

void redraw_tpanels_window(void);

void update_tpanels_window(void);

void menu_analysis(USHORT menunumber);

void remove_button(void);

void get_door(void);

int add_lift(void);

void remove_lift(void);

int add_door(void);

void remove_door(void);

void find_lift(void);

ULONG locate_lift(ULONG target);

void pick_block(void);

void key_analysis(USHORT code);

void tools_analysis(struct IntuiMessage * message);

void info_analysis(struct IntuiMessage * message);

void mons_analysis(struct IntuiMessage * message);

void world_analysis(struct IntuiMessage * message);

void level_analysis(struct IntuiMessage * message);

void map_analysis(struct IntuiMessage * message);

void fill_sky(void);

void cell_analysis(struct IntuiMessage * message);

void button_analysis(struct IntuiMessage * message);

void lift_analysis(struct IntuiMessage * message);

void door_analysis(struct IntuiMessage * message);

int set_highlight(void);

void main(void);

