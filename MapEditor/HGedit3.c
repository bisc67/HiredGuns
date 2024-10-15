#include "common.c"

/******************************************************************************/
int add_button(void)
{
	ULONG temp;

	if ( ((picked_block.panel_here_bit)&&((picked_block.panel==1)||(picked_block.panel==2)))||( (picked_block.floor_here_bit)&&(picked_block.floor==1)) )
	{
		get_free_button();

		if (picked_button_num<=31)
		{
			if ((picked_block.floor_here_bit)&&(picked_block.floor==1))
			{
				if (currz==0)
				{
					SimpleRequest("Sorry, no buttons on floor at level 0!");
					drawing=0; current_tool=0;
					button_dest_mode=0; last_block_x=-1; last_block_y=-1;
					redraw_tools_window();
					picked_block.panel_here_bit=0;
					picked_block.panel=0;
					redraw_cell_win();
					return(0);
				}
				picked_block.variant=0;
				stone_block.variant=picked_button_num;
			}
			else
			picked_block.variant=picked_button_num;
			picked_button->button_action_in=0;
			picked_button->button_action_out=0;
			picked_button->button_data_in=0;
			picked_button->button_data_out=0;

			switch (picked_button_action_in)
			{
				case 0: /* do nothing */
					picked_button->button_action_in=picked_button_action_in;
					picked_button->button_used=-1;
					break;
				case 1: /* floor on */
				case 2: /* floor off */
				case 3: /* floor toggle */
				case 4: /* block on */
				case 5: /* block off */
				case 6: /* block toggle */
				case 7: /* hatch */
					if (!picked_button_target)
					{
						SimpleRequest("No target selected!");
						drawing=0; current_tool=0; button_dest_mode=0; last_block_x=-1; last_block_y=-1;
						redraw_tools_window(); picked_block.panel_here_bit=0;
						picked_block.panel=0; redraw_cell_win();
					}
					else
					{
						picked_button->button_data_in=(ULONG)(&MapData->map_part1)+(ULONG)(picked_button_target)-(ULONG)(MapData);
						picked_button->button_action_in=picked_button_action_in;
						picked_button->button_used=-1;
					}
					break;
				case 8: /* psi effect */
					break;
				case 9: /* lift up */
				case 10: /* lift down */
				case 11: /* lift stop */
				case 12: /* lift toggle */
					if (!picked_button_target)
					{
						SimpleRequest("No target selected!");
						drawing=0; current_tool=0; button_dest_mode=0; last_block_x=-1; last_block_y=-1;
						redraw_tools_window(); picked_block.panel_here_bit=0;
						picked_block.panel=0; redraw_cell_win();
					}
					else {
						if(temp=locate_lift(picked_button_target))
						{
							picked_button->button_data_in=temp-(ULONG)(MapData);
							picked_button->button_action_in=picked_button_action_in;
							picked_button->button_used=-1;
						}
						else
						{
							SimpleRequest("No lift at target!");
							drawing=0; current_tool=0; button_dest_mode=0; last_block_x=-1; last_block_y=-1;
							redraw_tools_window(); picked_block.panel_here_bit=0;
							picked_block.panel=0; redraw_cell_win();
						}
					}
					break;
				case 13: /* unused */
					break;
				case 14: /* door open */
				case 15: /* door close */
				case 16: /* door toggle */
				case 17: /* door lock */
				case 18: /* door unlock */
					if (!picked_button_target)
					{
						SimpleRequest("No target selected!");
						drawing=0; current_tool=0; button_dest_mode=0; last_block_x=-1; last_block_y=-1;
						redraw_tools_window(); picked_block.panel_here_bit=0;
						picked_block.panel=0; redraw_cell_win();
					}
					else {
						if (temp=find_door(picked_button_target))
						{
							picked_button->button_data_in=temp-(ULONG)(MapData);
							picked_button->button_action_in=picked_button_action_in;
							picked_button->button_used=-1;
						}
						else
						{
							SimpleRequest("No door at target!");
							drawing=0; current_tool=0; button_dest_mode=0; last_block_x=-1; last_block_y=-1;
							redraw_tools_window(); picked_block.panel_here_bit=0;
							picked_block.panel=0; redraw_cell_win();
						}
					}
					break;
				default:
					break;
			}
			switch (picked_button_action_out)
			{
				case 0: /* do nothing */
					picked_button->button_action_out=picked_button_action_out;
					picked_button->button_used=-1;
					break;
				case 1: /* floor on */
				case 2: /* floor off */
				case 3: /* floor toggle */
				case 4: /* block on */
				case 5: /* block off */
				case 6: /* block toggle */
				case 7: /* hatch */
					if (!picked_button_target)
					{
						SimpleRequest("No target selected!");
						drawing=0; current_tool=0; button_dest_mode=0; last_block_x=-1; last_block_y=-1;
						redraw_tools_window(); picked_block.panel_here_bit=0;
						picked_block.panel=0; redraw_cell_win();
					}
					else
					{
						picked_button->button_data_out=(ULONG)(&MapData->map_part1)+(ULONG)(picked_button_target)-(ULONG)(MapData);
						picked_button->button_action_out=picked_button_action_out;
						picked_button->button_used=-1;
					}
					break;
				case 8: /* psi effect */
					break;
				case 9: /* lift up */
				case 10: /* lift down */
				case 11: /* lift stop */
				case 12: /* lift toggle */
					if (!picked_button_target)
					{
						SimpleRequest("No target selected!");
						drawing=0; current_tool=0; button_dest_mode=0; last_block_x=-1; last_block_y=-1;
						redraw_tools_window(); picked_block.panel_here_bit=0;
						picked_block.panel=0; redraw_cell_win();
					}
					else {
						if(temp=locate_lift(picked_button_target))
						{
							picked_button->button_data_out=temp-(ULONG)(MapData);
							picked_button->button_action_out=picked_button_action_out;
							picked_button->button_used=-1;
						}
						else
						{
							SimpleRequest("No lift at target!");
							drawing=0; current_tool=0; button_dest_mode=0; last_block_x=-1; last_block_y=-1;
							redraw_tools_window(); picked_block.panel_here_bit=0;
							picked_block.panel=0; redraw_cell_win();
						}
					}
					break;
				case 13: /* unused */
					break;
				case 14: /* door open */
				case 15: /* door close */
				case 16: /* door toggle */
				case 17: /* door lock */
				case 18: /* door unlock */
					if (!picked_button_target)
					{
						SimpleRequest("No target selected!");
						drawing=0; current_tool=0; button_dest_mode=0; last_block_x=-1; last_block_y=-1;
						redraw_tools_window(); picked_block.panel_here_bit=0;
						picked_block.panel=0; redraw_cell_win();
					}
					else {
						if(temp=find_door(picked_button_target))
						{
							picked_button->button_data_out=temp-(ULONG)(MapData);
							picked_button->button_action_out=picked_button_action_out;
							picked_button->button_used=-1;
						}
						else
						{
							SimpleRequest("No door at target!");
							drawing=0; current_tool=0; button_dest_mode=0; last_block_x=-1; last_block_y=-1;
							redraw_tools_window(); picked_block.panel_here_bit=0;
							picked_block.panel=0; redraw_cell_win();
						}
					}
					break;
				default:
					break;
			}
                        return(1);
		}
		else
		{
			SimpleRequest("Too many buttons!");
			drawing=0; current_tool=0;
			button_dest_mode=0; last_block_x=-1; last_block_y=-1;
			redraw_tools_window();
			picked_block.panel_here_bit=0;
			picked_block.panel=0;
			redraw_cell_win();
			return(0);
                }
	}

}

/******************************************************************************/

void redraw_tools_window()
{
	if (current_tool==1) draw_gadget_border(ToolsWindow->RPort,DOWN,&ToolsPickGadget,-1);
	else draw_gadget_border(ToolsWindow->RPort,UP,&ToolsPickGadget,-1);
	if (current_tool==2) draw_gadget_border(ToolsWindow->RPort,DOWN,&ToolsSetAllGadget,-1);
	else draw_gadget_border(ToolsWindow->RPort,UP,&ToolsSetAllGadget,-1);
	if (current_tool==3) draw_gadget_border(ToolsWindow->RPort,DOWN,&ToolsSetBlockGadget,-1);
	else draw_gadget_border(ToolsWindow->RPort,UP,&ToolsSetBlockGadget,-1);
	if (current_tool==4) draw_gadget_border(ToolsWindow->RPort,DOWN,&ToolsSetTargtGadget,-1);
	else draw_gadget_border(ToolsWindow->RPort,UP,&ToolsSetTargtGadget,-1);
	if (current_tool==5) draw_gadget_border(ToolsWindow->RPort,DOWN,&ToolsSetWaterGadget,-1);
	else draw_gadget_border(ToolsWindow->RPort,UP,&ToolsSetWaterGadget,-1);
}

/******************************************************************************/

void redraw_info_window()
{
	redraw_tpanels_window();
}

/******************************************************************************/

struct Image mons_image=
{
	0,0,				/* top left x,y */
	320,320,			/* width, height */
	3,				/* depth */
	NULL,				/* image data */
	7,				/* plane pick */
	0,				/* plane on, off */
        NULL,				/* next image */
};

char monster_desc[20*6][40]={
	"01 `LEADAHL'. Fast and agile. Brave.   ",
	"   Not strong but high endurance.      ",
	"1 Weak but fast.                       ",
	"2 Normal but fast.                     ",
	"3 Strong, fires strength 1 fireballs.  ",
	"4 Strong, fires strength 3 fireballs. *",

	"02 `SENTRY GUN'. Won't move but turns  ",
	"   and fires fireballs. Very tough.    ",
	"1 Fires strength 1 fireballs.          ",
	"2 Fires strength 2 fireballs.          ",
	"3 Fires strength 3 fireballs.          ",
	"4 Fires strength 4 fireballs.          ",

	"03 `RAHL'. Very ferocious. Slow but    ",
	"   very strong. Posionous.             ",
	"1 Quite strong but poor hit.           ",
	"2 Average.                             ",
	"3 Fires strength 1 fireballs.          ",
	"4 Extremely strong. Str 2 fballs.     *",

	"04 `SKELETON'. Very weak. Average      ",
	"   speed. Very persistent.             ",
	"1 Very poor. (.5 man strength)         ",
	"2 Normal.                              ",
	"3 Above average.                      *",
	"4 Quite strong. (2x man strength)     *",

	"05 `AHL-CIM'. Very tough but not strong",
	"   hit. Extremely slow.                ",
	"1 Poor. (3x man strengh)               ",
	"2 Average. (4x man strengh)            ",
	"3 Strong. (5x man strengh)             ",
	"4 Very strong. (6x man strengh)       *",

	"06 `Morg'. Tough with a deadly hit.    ",
	"   Powerful fireball and poison.       ",
	"1 Poor. Only strength 2 fireball.      ",
	"2 Average. 4 fireball and 2 poison.    ",
	"3 Strong. 4 fireball and 2 poison.     ",
	"4 Very strong. Non-decay fireball!.   *",

	"07 `Druid'. Quite strong. Liable to go ",
	"   beserk at any time. Cowardly.       ",
	"1 Undefined, only strength 2 poison.   ",
	"2 Average, 4 posion and 2 fireball.    ",
	"3 Strong, 4 posion and 2 fireball.     ",
	"4 Very strong, 4 posion and 2 fball.  *",

	"08 `LEMMING'. Slow but deadly. Avoid at",
	"   all costs. Beserks easily.          ",
	"1 Poor.                                ",
	"2 Average.                             ",
	"3 Strong.                              ",
	"4 Very strong, fires str 1 fball.     *",

	"09 `HADRAHL'. Robotic equivalent of a  ",
	"   leadhile but will beserk easily.    ",
	"1 Weak but fast.                       ",
	"2 Normal but fast.                     ",
	"3 Strong.                              ",
	"4 Very strong.                        *",

	"10 `BAT'. Very weak. But easily goes   ",
	"   beserk. Very fast.                  ",
	"1 Exceptionally weak.                  ",
	"2 Average.                             ",
	"3 Poor.                                ",
	"4 Ok.                                  ",

	"11 `HOVERBOT'. Weak with a very poor   ",
	"   hit. Long range fireball though.    ",
	"1 Poor. Strength 1 fireball. Range 8.  ",
	"1 Average. Strength 2 fireball.        ",
	"1 Ok. Strength 2 fireball. Range 8.    ",
	"1 Strong. Strength 2 fball. Range 8.  *",

	"12 `LIZARD'. Very cowardly weak        ",
	"   creature. Posionous.                ",
	"1 Exceptionally weak.                  ",
	"2 Average.                             ",
	"3 Poor.                                ",
	"4 Ok.                                  ",

	"13 `SQUIRREL'. Suprisingly strong and, ",
	"   beserks when first hit.             ",
	"1 Poor. (4x man strengh)               ",
	"2 Average. (5x man strengh)            ",
	"3 Strong. (6x man strengh)            *",
	"4 Very strong. (7x man strengh)       *",

	"14 `ELYSTE'. Powerful posion and       ",
	"   fireball. Moves fairly fast.        ",
	"1 Fireball 2, poison 2.                ",
	"2 Fireball 4, poison 4.                ",
	"3 Strong, fireball 4, poison 4.       *",
	"4 Very strong, fireball 4, poison 4.  *",

	"15 `ED-209'. Slighty less power than a ",
	"   Rahl but moves faster.              ",
	"1 Quite strong but poor hit.           ",
	"2 Average.                             ",
	"3 Fires strength 1 fireballs.         *",
	"4 Extremely strong. Str 2 balls.      *",

	"16 `PUPPY'. The weakest enemy.         ",
	"   Harmless.                           ",
	"1 Exceptionally weak.                  ",
	"2 Average.                             ",
	"3 Poor.                                ",
	"4 Very strong. Weak hit.               ",

	"17 `SHARK'. Extremely dangerous        ",
	"   predator especially when beserk.    ",
	"1 Poor.                                ",
	"2 Average.                             ",
	"3 Strong.                              ",
	"4 Very strong.                         ",

	"18 `RATS'. Poisonous and persistent.   ",
	"                                       ",
	"1 Poor.                                ",
	"2 Average.                             ",
	"3 Strong.                              ",
	"4 Very strong, fires str 1 fball.      ",

	"19 `BABY GARGOYLE'. Fairly strong but  ",
	"   slow. Will beserk.                  ",
	"1 Poor.                                ",
	"2 Average.                             ",
	"3 Strong.                              ",
	"4 Very strong. Non-decay fireball!.   *",

	"20 'GARGOYLE'. Ultimate bad dude. Very,",
	"   very, very strong. Most heinous.    ",
	"1 Poor. (40x man strengh)              ",
	"2 Average. (50x man strengh)           ",
	"3 Strong. (60x man strengh)            ",
	"4 Very strong. (70x man strengh)      *" };

void update_mons_window(void)
{
	int i;

	for (i=0;i<20;i++)
	{
		if (i==cur_mons-1) draw_border(MonsWindow->RPort,DOWN,47+(i%5)*64,13+(i/5)*(64+16),63,63,-1);
		else draw_border(MonsWindow->RPort,UP,47+(i%5)*64,13+(i/5)*(64+16),63,63,-1);

		if ((i==(worldmem->locn_mons1-1))||(i==(worldmem->locn_mons2-1))) draw_border(MonsWindow->RPort,DOWN,47+2+24-4+(i%5)*64,13+68-3+(i/5)*(64+16),32+6,8+4,-1);
		else draw_border(MonsWindow->RPort,UP,47+2+24-4+(i%5)*64,13+68-3+(i/5)*(64+16),32+6,8+4,-1);
	}

	if ((picked_block.aux_here_bit)&&(picked_block.auxiliary==0)&&(picked_block2.egg_contents==(cur_mons-1)*4))
	draw_border(MonsWindow->RPort,DOWN,47+2,336+22+12*0,319-4,11,-1);
	else draw_border(MonsWindow->RPort,UP,47+2,336+22+12*0,319-4,11,-1);

	if ((picked_block.aux_here_bit)&&(picked_block.auxiliary==0)&&(picked_block2.egg_contents==(cur_mons-1)*4+1))
	draw_border(MonsWindow->RPort,DOWN,47+2,336+22+12*1,319-4,11,-1);
	else draw_border(MonsWindow->RPort,UP,47+2,336+22+12*1,319-4,11,-1);

	if ((picked_block.aux_here_bit)&&(picked_block.auxiliary==0)&&(picked_block2.egg_contents==(cur_mons-1)*4+2))
	draw_border(MonsWindow->RPort,DOWN,47+2,336+22+12*2,319-4,11,-1);
	else draw_border(MonsWindow->RPort,UP,47+2,336+22+12*2,319-4,11,-1);

	if ((picked_block.aux_here_bit)&&(picked_block.auxiliary==0)&&(picked_block2.egg_contents==(cur_mons-1)*4+3))
	draw_border(MonsWindow->RPort,DOWN,47+2,336+22+12*3,319-4,11,-1);
	else draw_border(MonsWindow->RPort,UP,47+2,336+22+12*3,319-4,11,-1);

	if (cur_mons>0)
	{
		draw_text(MonsWindow->RPort,47+3,336+3,1,4,(char *)&monster_desc[(cur_mons-1)*6]);
		draw_text(MonsWindow->RPort,47+3,336+3+10,1,4,(char *)&monster_desc[(cur_mons-1)*6+1]);

		draw_text(MonsWindow->RPort,47+5,336+4+20,1,0,(char *)&monster_desc[(cur_mons-1)*6+2]);
		draw_text(MonsWindow->RPort,47+5,336+4+32,1,0,(char *)&monster_desc[(cur_mons-1)*6+3]);
		draw_text(MonsWindow->RPort,47+5,336+4+44,1,0,(char *)&monster_desc[(cur_mons-1)*6+4]);
		draw_text(MonsWindow->RPort,47+5,336+4+56,1,0,(char *)&monster_desc[(cur_mons-1)*6+5]);
	}
}

void redraw_mons_window()
{
	int i;
	char some_text[4];

	mons_image.ImageData=monsimagemem;
	DrawImage(MonsWindow->RPort,&mons_image,47,13);

	for (i=0;i<20;i++)
	{
		strcpy(some_text,"   ");
		itoa2(i+1,some_text);
		draw_text(MonsWindow->RPort,47+2+(i%5)*64,13+68+(i/5)*(64+16),1,0,some_text);
		draw_border(MonsWindow->RPort,UP,47+2+24-4+(i%5)*64,13+68-3+(i/5)*(64+16),32+6,8+4,5);
		draw_text(MonsWindow->RPort,47+2+24+(i%5)*64,13+68+(i/5)*(64+16),1,5,"LOAD");
	}

	draw_border(MonsWindow->RPort,DOWN,47,336,319,71,4);

	draw_border(MonsWindow->RPort,UP,47+2,336+22+12*0,319-4,11,0);
	draw_border(MonsWindow->RPort,UP,47+2,336+22+12*1,319-4,11,0);
	draw_border(MonsWindow->RPort,UP,47+2,336+22+12*2,319-4,11,0);
	draw_border(MonsWindow->RPort,UP,47+2,336+22+12*3,319-4,11,0);

	update_mons_window();
}

/******************************************************************************/

struct Image world_image=
{
	0,0,				/* top left x,y */
	240,192,			/* width, height */
	3,				/* depth */
	NULL,				/* image data */
	7,				/* plane pick */
	0,				/* plane on, off */
        NULL,				/* next image */
};

void redraw_world_window()
{
	world_image.ImageData=worldimagemem;
	DrawImage(WorldWindow->RPort,&world_image,15+4+2,25+4+2);

	if (((worldmem->locn_x1*256+worldmem->locn_x2)/2-2)<0)
	{ worldmem->locn_x1=0; worldmem->locn_x2=4; }

	if (((worldmem->locn_y1*256+worldmem->locn_y2)/2-2)<0)
	{ worldmem->locn_y1=0; worldmem->locn_y2=4; }

	if (((worldmem->locn_x1*256+worldmem->locn_x2)/2+2)>=238)
	{ worldmem->locn_x1=1; worldmem->locn_x2=216; }

	if (((worldmem->locn_y1*256+worldmem->locn_y2)/2+2)>=190)
	{ worldmem->locn_y1=1; worldmem->locn_y2=120; }

	draw_border(WorldWindow->RPort,UP,21+(worldmem->locn_x1*256+worldmem->locn_x2)/2-2,31+(worldmem->locn_y1*256+worldmem->locn_y2)/2-2,5,5,7);

	itoa2(worldmem->locn_destinations[0],World23Buffer);
	itoa2(worldmem->locn_destinations[1],World24Buffer);
	itoa2(worldmem->locn_destinations[2],World25Buffer);
	itoa2(worldmem->locn_destinations[3],World26Buffer);
	itoa2(worldmem->locn_disk,World6Buffer);
	itoa2(worldmem->locn_map_num,World7Buffer);
	itoa2(worldmem->locn_picture_num,World8Buffer);
	itoa2(worldmem->locn_music_num,World9Buffer);
	itoa2(worldmem->locn_atmos,World10Buffer);
	itoa2(worldmem->locn_sky,World13Buffer);
	itoa2(worldmem->locn_style+1,World14Buffer);
	itoa2(worldmem->locn_players,World14bBuffer);

        World23Info.LongInt=worldmem->locn_destinations[0];
        World24Info.LongInt=worldmem->locn_destinations[1];
        World25Info.LongInt=worldmem->locn_destinations[2];
        World26Info.LongInt=worldmem->locn_destinations[3];
        World6Info.LongInt=worldmem->locn_disk;
        World7Info.LongInt=worldmem->locn_map_num;
        World8Info.LongInt=worldmem->locn_picture_num;
        World9Info.LongInt=worldmem->locn_music_num;
        World10Info.LongInt=worldmem->locn_atmos;
        World13Info.LongInt=worldmem->locn_sky;
        World14Info.LongInt=worldmem->locn_style+1;
        World14bInfo.LongInt=worldmem->locn_players;

	if (worldmem->locn_type_flag==0) draw_gadget_border(WorldWindow->RPort,DOWN,&World1Gadget,-1L);
	else draw_gadget_border(WorldWindow->RPort,UP,&World1Gadget,-1L);
	if (worldmem->locn_type_flag==1) draw_gadget_border(WorldWindow->RPort,DOWN,&World2Gadget,-1L);
	else draw_gadget_border(WorldWindow->RPort,UP,&World2Gadget,-1L);
	if (worldmem->locn_type_flag==2) draw_gadget_border(WorldWindow->RPort,DOWN,&World3Gadget,-1L);
	else draw_gadget_border(WorldWindow->RPort,UP,&World3Gadget,-1L);
	if (worldmem->locn_type_flag==3) draw_gadget_border(WorldWindow->RPort,DOWN,&World4Gadget,-1L);
	else draw_gadget_border(WorldWindow->RPort,UP,&World4Gadget,-1L);

	RefreshGList(&World1Gadget,WorldWindow,NULL,27);
}

/******************************************************************************/
void redraw_level()
{
	SHORT BorderPairs[10];
	struct Border MyBorder={0,0,1,0,JAM1,5,NULL,NULL};

	register USHORT x,y,block_num;
	struct map_cell1 *curr_block,*curr_blockd;
	struct map_cell2 *curr_block2;

	if ((pastebx+pasteby+pastebz+pastetx+pastety+pastetz!=0)&&((currz<pastebz)||(currz>pastetz)))
	{
		MyBorder.XY=BorderPairs;
		MyBorder.FrontPen=0;

		BorderPairs[0]=0;BorderPairs[1]=0;
		BorderPairs[2]=(pastetx-pastebx)*17+17;BorderPairs[3]=0;
		BorderPairs[4]=(pastetx-pastebx)*17+17;BorderPairs[5]=(pastety-pasteby)*17+17;
		BorderPairs[6]=0;BorderPairs[7]=(pastety-pasteby)*17+17;
		BorderPairs[8]=0;BorderPairs[9]=0;
		DrawBorder(LevelWindow->RPort,&MyBorder,LEVEL_DISPLAY_X+3+pastebx*17,LEVEL_DISPLAY_Y+10+pasteby*17);
	}

	for (y=0;y<MAP_DEPTH;y++)
        {
		for (x=0;x<MAP_WIDTH;x++)
		{
			block_num=0;

			if ((x==Pl1XInfo.LongInt)&&(y==Pl1YInfo.LongInt)&&(currz==Pl1ZInfo.LongInt)) block_num=1320;
			if ((x==Pl2XInfo.LongInt)&&(y==Pl2YInfo.LongInt)&&(currz==Pl2ZInfo.LongInt)) block_num=1321;
			if ((x==Pl3XInfo.LongInt)&&(y==Pl3YInfo.LongInt)&&(currz==Pl3ZInfo.LongInt)) block_num=1322;
			if ((x==Pl4XInfo.LongInt)&&(y==Pl4YInfo.LongInt)&&(currz==Pl4ZInfo.LongInt)) block_num=1323;
			if ((x==picked_button_target_x)&&(y==picked_button_target_y)&&(currz==picked_button_target_z)&&(picked_button_target)) block_num=1328;

			if (block_num==0)
			{
				curr_block=mp1(x,y,currz);
				curr_block2=mp2(x,y,currz);

				if (curr_block->floor_here_bit) block_num=block_num+(curr_block->floor+1)*33;
				if (curr_block->block_here_bit) block_num=block_num+curr_block->block+1;
				if (curr_block->aux_here_bit) block_num=block_num+660;
				if (curr_block->panel_here_bit) block_num=block_num+165;
				if (curr_block2->flowing_bit) block_num=block_num+330;
				if ((currz>0)&&(block_num==0))
				{
					curr_blockd=mp1(x,y,currz-1);
					if ((curr_blockd->block_here_bit)&&(curr_blockd->block==0)) block_num=1325;
				}
				if ((curr_block->opaque_bit)&&(curr_block->block_here_bit==0)) block_num=1324;
			}

		        an_image.ImageData=Blocks+(block_num*48);
			DrawImage(LevelWindow->RPort,&an_image,LEVEL_DISPLAY_X+4+x*17,LEVEL_DISPLAY_Y+11+y*17);
		}
	}

        redraw_cursor();
}

/******************************************************************************/
int make_push_list()
{
	register ULONG x,y,z,blocks=0;
	struct map_cell1 *cell1;

	for (blocks=0;blocks<32;blocks++)
	{
		MapData->pushables[blocks].pushable_posn=0;
		MapData->pushables[blocks].pushable_cell.auxiliary=0;
		MapData->pushables[blocks].pushable_cell.variant=0;
		MapData->pushables[blocks].pushable_cell.explosion=0;
		MapData->pushables[blocks].pushable_cell.panel=0;
		MapData->pushables[blocks].pushable_cell.water=0;
		MapData->pushables[blocks].pushable_cell.block=0;
		MapData->pushables[blocks].pushable_cell.floor=0;
		MapData->pushables[blocks].pushable_cell.pushable_bit=0;
		MapData->pushables[blocks].pushable_cell.invisible_bit=0;
		MapData->pushables[blocks].pushable_cell.opaque_bit=0;
		MapData->pushables[blocks].pushable_cell.aux_here_bit=0;
		MapData->pushables[blocks].pushable_cell.explosion_here_bit=0;
		MapData->pushables[blocks].pushable_cell.panel_here_bit=0;
		MapData->pushables[blocks].pushable_cell.water_here_bit=0;
		MapData->pushables[blocks].pushable_cell.block_here_bit=0;
		MapData->pushables[blocks].pushable_cell.floor_here_bit=0;
	}

	blocks=0;

	for (z=1;z<MAP_HEIGHT-1;z++)
	{
		for (y=0;y<MAP_DEPTH;y++)
	        {
			for (x=0;x<MAP_WIDTH;x++)
		        {
				cell1=mp1(x,y,z);

				if (cell1->pushable_bit)
				{
					if (blocks==31) return (-1);
	MapData->pushables[blocks].pushable_posn=(x+y*MAP_DEPTH+z*FLOOR_SIZE)*4;
	MapData->pushables[blocks].pushable_cell.auxiliary=0;
	MapData->pushables[blocks].pushable_cell.variant=cell1->variant;
	MapData->pushables[blocks].pushable_cell.explosion=0;
	MapData->pushables[blocks].pushable_cell.panel=cell1->panel;
	MapData->pushables[blocks].pushable_cell.water=0;
	MapData->pushables[blocks].pushable_cell.block=cell1->block;
	MapData->pushables[blocks].pushable_cell.floor=0;
	MapData->pushables[blocks].pushable_cell.pushable_bit=cell1->pushable_bit;
	MapData->pushables[blocks].pushable_cell.invisible_bit=cell1->invisible_bit;
	MapData->pushables[blocks].pushable_cell.opaque_bit=cell1->opaque_bit;
	MapData->pushables[blocks].pushable_cell.aux_here_bit=0;
	MapData->pushables[blocks].pushable_cell.explosion_here_bit=0;
	MapData->pushables[blocks].pushable_cell.panel_here_bit=cell1->panel_here_bit;
	MapData->pushables[blocks].pushable_cell.water_here_bit=0;
	MapData->pushables[blocks].pushable_cell.block_here_bit=cell1->block_here_bit;
	MapData->pushables[blocks++].pushable_cell.floor_here_bit=0;
				}
			}
		}
	}
	return (0);
}

/******************************************************************************/
void get_free_button()
{
	int but=0;

	picked_button_num=32;
	picked_button=0;

	do
	{
		if (!(MapData->buttons[but].button_used))
		{
			picked_button=&MapData->buttons[but];
			picked_button_num=but;
		}
		but++;
	} while ((but<32)&&(!picked_button));
}

/******************************************************************************/
ULONG find_door(target)
ULONG target;
{
	int door=0;

	do
	{
		if (MapData->doors[door].door_posn==target) return((ULONG)(&MapData->doors[door]));
		door++;
	} while (door<32);
	return(0);
}

/******************************************************************************/
void make_2d_map()
{
	register ULONG x,y,z,block_num;
	struct map_cell1 *cell1,*cell2,*cell3,*cell4,*cell5,*cell6,*cell7;
	unsigned int myrand;

	for (z=0;z<MAP_HEIGHT;z++)
	{
		for (y=0;y<MAP_DEPTH;y++)
	        {
			for (x=0;x<MAP_WIDTH;x++)
		        {
				myrand=rand()/(RAND_MAX/3);
				block_num=0;
				cell1=mp1(x-1,y-1,z);
				cell2=mp1(x,y-1,z);
				cell3=mp1(x-1,y,z);
				cell4=mp1(x,y,z);
				cell5=mp1(x+1,y,z);
				cell6=mp1(x,y+1,z);
				cell7=mp1(x,y,z-1);

	if ((cell7->block_here_bit)&&(cell7->block==0))
	{
		block_num=9;
		if (myrand==1) block_num=2;
		if (myrand>=2) block_num=16;
		if ((cell1->block_here_bit)&&(cell1->pushable_bit==0)&&((cell1->block==0)||(cell1->block==2)||(cell1->block==3)||(cell1->block==5)||(cell1->block==6))) block_num=18;
		if ((cell2->block_here_bit)&&(cell2->pushable_bit==0)&&((cell2->block==0)||(cell2->block==2)||(cell2->block==3)||(cell2->block==5)||(cell2->block==6))) block_num=17;
		if ((cell3->block_here_bit)&&(cell3->pushable_bit==0)&&((cell3->block==0)||(cell3->block==2)||(cell3->block==3)||(cell3->block==5)||(cell3->block==6))) block_num=10;
		if ((cell3->block_here_bit)&&(cell1->pushable_bit==0)&&(cell3->pushable_bit==0)&&((cell3->block==0)||(cell3->block==2)||(cell3->block==3)||(cell3->block==5)||(cell3->block==6))&&(cell1->block_here_bit)&&((cell1->block==0)||(cell1->block==2)||(cell1->block==3)||(cell1->block==5)||(cell1->block==6))) block_num=8;
		if ((cell1->block_here_bit)&&(cell1->pushable_bit==0)&&(cell2->pushable_bit==0)&&((cell1->block==0)||(cell1->block==2)||(cell1->block==3)||(cell1->block==5)||(cell1->block==6))&&(cell2->block_here_bit)&&((cell2->block==0)||(cell2->block==2)||(cell2->block==3)||(cell2->block==5)||(cell2->block==6))) block_num=1;
		if ((cell3->block_here_bit)&&(cell3->pushable_bit==0)&&(cell2->pushable_bit==0)&&((cell3->block==0)||(cell3->block==2)||(cell3->block==3)||(cell3->block==5)||(cell3->block==6))&&(cell2->block_here_bit)&&((cell2->block==0)||(cell2->block==2)||(cell2->block==3)||(cell2->block==5)||(cell2->block==6))) block_num=22;
		if ((cell4->block_here_bit)&&(cell4->block==4)) block_num=35;
	}
	if ((cell4->floor_here_bit)&&(cell4->floor==0))
	{
		block_num=6;
		if (myrand==1) block_num=26;
		if (myrand>=2) block_num=33;
		if ((cell1->block_here_bit)&&(cell1->pushable_bit==0)&&((cell1->block==0)||(cell1->block==2)||(cell1->block==3)||(cell1->block==5)||(cell1->block==6))) block_num=14;
		if ((cell2->block_here_bit)&&(cell2->pushable_bit==0)&&((cell2->block==0)||(cell2->block==2)||(cell2->block==3)||(cell2->block==5)||(cell2->block==6))) block_num=7;
		if ((cell3->block_here_bit)&&(cell3->pushable_bit==0)&&((cell3->block==0)||(cell3->block==2)||(cell3->block==3)||(cell3->block==5)||(cell3->block==6))) block_num=34;
		if ((cell3->block_here_bit)&&(cell1->pushable_bit==0)&&(cell3->pushable_bit==0)&&((cell3->block==0)||(cell3->block==2)||(cell3->block==3)||(cell3->block==5)||(cell3->block==6))&&(cell1->block_here_bit)&&((cell1->block==0)||(cell1->block==2)||(cell1->block==3)||(cell1->block==5)||(cell1->block==6))) block_num=32;
		if ((cell1->block_here_bit)&&(cell1->pushable_bit==0)&&(cell2->pushable_bit==0)&&((cell1->block==0)||(cell1->block==2)||(cell1->block==3)||(cell1->block==5)||(cell1->block==6))&&(cell2->block_here_bit)&&((cell2->block==0)||(cell2->block==2)||(cell2->block==3)||(cell2->block==5)||(cell2->block==6))) block_num=25;
		if ((cell3->block_here_bit)&&(cell3->pushable_bit==0)&&(cell2->pushable_bit==0)&&((cell3->block==0)||(cell3->block==2)||(cell3->block==3)||(cell3->block==5)||(cell3->block==6))&&(cell2->block_here_bit)&&((cell2->block==0)||(cell2->block==2)||(cell2->block==3)||(cell2->block==5)||(cell2->block==6))) block_num=24;
		if ((cell4->block_here_bit)&&(cell4->block==4))
		{
			block_num=36;
			if ((cell3->block_here_bit)&&(cell3->pushable_bit==0)&&((cell3->block==0)||(cell3->block==2)||(cell3->block==3)||(cell3->block==5)||(cell3->block==6))) block_num=60;
			if ((cell2->block_here_bit)&&(cell2->pushable_bit==0)&&((cell2->block==0)||(cell2->block==2)||(cell2->block==3)||(cell2->block==5)||(cell2->block==6))) block_num=61;
			if ((cell2->block_here_bit)&&(cell3->pushable_bit==0)&&(cell2->pushable_bit==0)&&((cell2->block==0)||(cell2->block==2)||(cell2->block==3)||(cell2->block==5)||(cell2->block==6))&&(cell3->block_here_bit)&&((cell3->block==0)||(cell3->block==2)||(cell3->block==3)||(cell3->block==5)||(cell3->block==6))) block_num=62;
		}
	}
	if ((cell4->block_here_bit)&&(cell4->block==0))
	{
		block_num=12;
		if ((!cell2->block_here_bit)||(cell2->block>0)) block_num=4;
		if ((!cell3->block_here_bit)||(cell3->block>0)) block_num=11;
		if ((!cell5->block_here_bit)||(cell5->block>0)) block_num=13;
		if ((!cell6->block_here_bit)||(cell6->block>0)) block_num=20;
		if (((!cell2->block_here_bit)||(cell2->block>0))&&((!cell3->block_here_bit)||(cell3->block>1))) block_num=3;
		if (((!cell6->block_here_bit)||(cell6->block>0))&&((!cell3->block_here_bit)||(cell3->block>1))) block_num=19;
		if (((!cell6->block_here_bit)||(cell6->block>0))&&((!cell5->block_here_bit)||(cell5->block>1))) block_num=21;
		if (((!cell2->block_here_bit)||(cell2->block>0))&&((!cell5->block_here_bit)||(cell5->block>1))) block_num=5;
		if (((!cell3->block_here_bit)||(cell3->block>0))&&((!cell5->block_here_bit)||(cell5->block>1))) block_num=27;
		if (((!cell2->block_here_bit)||(cell2->block>0))&&((!cell6->block_here_bit)||(cell6->block>1))) block_num=28;
		if (((!cell2->block_here_bit)||(cell2->block>0))&&((!cell3->block_here_bit)||(cell3->block>1))&&((!cell5->block_here_bit)||(cell5->block>0))) block_num=37;
		if (((!cell2->block_here_bit)||(cell2->block>0))&&((!cell3->block_here_bit)||(cell3->block>1))&&((!cell6->block_here_bit)||(cell6->block>0))) block_num=29;
		if (((!cell5->block_here_bit)||(cell5->block>0))&&((!cell3->block_here_bit)||(cell3->block>1))&&((!cell6->block_here_bit)||(cell6->block>0))) block_num=38;
		if (((!cell5->block_here_bit)||(cell5->block>0))&&((!cell2->block_here_bit)||(cell2->block>1))&&((!cell6->block_here_bit)||(cell6->block>0))) block_num=30;
		if (((!cell3->block_here_bit)||(cell3->block>0))&&((!cell5->block_here_bit)||(cell5->block>1))&&((!cell2->block_here_bit)||(cell2->block>0))&&((!cell6->block_here_bit)||(cell6->block>0))) block_num=23;
	}
	if ((cell4->block_here_bit)&&(cell4->block==16))
	{
		block_num=40;
		if ((cell6->aux_here_bit)&&(cell6->auxiliary>7)&&(cell6->auxiliary<12)) block_num=41;
	}
	if ((cell4->block_here_bit)&&(cell4->block==17))
	{
		block_num=44;
		if ((cell3->aux_here_bit)&&(cell3->auxiliary>7)&&(cell3->auxiliary<12)) block_num=45;
	}
	if ((cell4->block_here_bit)&&(cell4->block==18))
	{
		block_num=52;
		if ((cell2->aux_here_bit)&&(cell2->auxiliary>7)&&(cell2->auxiliary<12)) block_num=53;
	}
	if ((cell4->block_here_bit)&&(cell4->block==19))
	{
		block_num=48;
		if ((cell5->aux_here_bit)&&(cell5->auxiliary>7)&&(cell5->auxiliary<12)) block_num=49;
	}
	if ((cell4->aux_here_bit)&&(cell4->auxiliary==8))
	{
		block_num=42;
		if ((cell7->block_here_bit)&&(cell7->block==0)) block_num=43;
	}
	if ((cell4->aux_here_bit)&&(cell4->auxiliary==9))
	{
		block_num=46;
		if ((cell7->block_here_bit)&&(cell7->block==0)) block_num=47;
	}
	if ((cell4->aux_here_bit)&&(cell4->auxiliary==10))
	{
		block_num=54;
		if ((cell7->block_here_bit)&&(cell7->block==0)) block_num=55;
	}
	if ((cell4->aux_here_bit)&&(cell4->auxiliary==11))
	{
		block_num=50;
		if ((cell7->block_here_bit)&&(cell7->block==0)) block_num=51;
	}
	if ((cell4->aux_here_bit)&&(cell4->auxiliary==13)) block_num=57;
	if ((cell4->aux_here_bit)&&(cell4->auxiliary==12)) block_num=59;
	if ((cell4->block_here_bit)&&((cell4->block==21)||(cell4->block==23))) block_num=56;
	if ((cell4->block_here_bit)&&((cell4->block==20)||(cell4->block==22))) block_num=58;


	if ((cell7->block_here_bit)&&(cell7->block==16)) block_num=40;
	if ((cell7->block_here_bit)&&(cell7->block==17)) block_num=44;
	if ((cell7->block_here_bit)&&(cell7->block==18)) block_num=52;
	if ((cell7->block_here_bit)&&(cell7->block==19)) block_num=48;

	if ((block_num==0)&&(cell7->aux_here_bit)&&(cell7->auxiliary==8)) block_num=42;
	if ((block_num==0)&&(cell7->aux_here_bit)&&(cell7->auxiliary==9)) block_num=46;
	if ((block_num==0)&&(cell7->aux_here_bit)&&(cell7->auxiliary==10)) block_num=54;
	if ((block_num==0)&&(cell7->aux_here_bit)&&(cell7->auxiliary==11)) block_num=50;

	if ((cell4->block_here_bit)&&((cell4->block==2)||(cell4->block==3)||(cell4->block==5)||(cell4->block==6))) block_num=39;

	mp2(x,y,z)->block_2d=block_num;
			}
		}
	}
}

/******************************************************************************/
void illuminate()
{
	register LONG x,y,z;
	struct map_cell1 *cell1;
	struct map_cell3 *cell3;
	BOOL light;

	for (y=0;y<MAP_DEPTH;y++)
        {
		for (x=0;x<MAP_WIDTH;x++)
	        {
			light=TRUE;
			z=MAP_HEIGHT-2;
			do {
				cell1=mp1(x,y,z);
				cell3=mp3(x,y,z);

				if ( (cell1->block_here_bit) && ( (cell1->block==0) || (cell1->block==1) ) )
					light=FALSE;

				if (light) cell3->light=TRUE;
				else cell3->light=FALSE;

				if (cell1->floor_here_bit)
				{
					if ( (cell1->floor==3) &&
					     (cell1->block_here_bit) &&
					     (cell1->block==0) )
						light=TRUE;
					else
						light=FALSE;
				}

				z--;
			} while (z>0);
		}
	}
}

/******************************************************************************/
void redraw_lift_window()
{
	if (picked_lift.lift_weight) draw_gadget_border(LiftWindow->RPort,DOWN,&Lift4Gadget,NONE);
	else draw_gadget_border(LiftWindow->RPort,UP,&Lift4Gadget,NONE);

	if (picked_lift.lift_direction==0) draw_gadget_border(LiftWindow->RPort,DOWN,&Lift5Gadget,NONE);
	else draw_gadget_border(LiftWindow->RPort,UP,&Lift5Gadget,NONE);
	if (picked_lift.lift_direction==1) draw_gadget_border(LiftWindow->RPort,DOWN,&Lift6Gadget,NONE);
	else draw_gadget_border(LiftWindow->RPort,UP,&Lift6Gadget,NONE);
	if (picked_lift.lift_direction==2) draw_gadget_border(LiftWindow->RPort,DOWN,&Lift7Gadget,NONE);
	else draw_gadget_border(LiftWindow->RPort,UP,&Lift7Gadget,NONE);

	if (picked_lift.lift_up==0) draw_gadget_border(LiftWindow->RPort,DOWN,&Lift8Gadget,NONE);
	else draw_gadget_border(LiftWindow->RPort,UP,&Lift8Gadget,NONE);
	if (picked_lift.lift_up==2) draw_gadget_border(LiftWindow->RPort,DOWN,&Lift10Gadget,NONE);
	else draw_gadget_border(LiftWindow->RPort,UP,&Lift10Gadget,NONE);

	if (picked_lift.lift_down==0) draw_gadget_border(LiftWindow->RPort,DOWN,&Lift11Gadget,NONE);
	else draw_gadget_border(LiftWindow->RPort,UP,&Lift11Gadget,NONE);
	if (picked_lift.lift_down==1) draw_gadget_border(LiftWindow->RPort,DOWN,&Lift12Gadget,NONE);
	else draw_gadget_border(LiftWindow->RPort,UP,&Lift12Gadget,NONE);

	if (picked_lift.lift_automove==1) draw_gadget_border(LiftWindow->RPort,DOWN,&Lift14Gadget,NONE);
	else draw_gadget_border(LiftWindow->RPort,UP,&Lift14Gadget,NONE);
	if (picked_lift.lift_automove==2) draw_gadget_border(LiftWindow->RPort,DOWN,&Lift15Gadget,NONE);
	else draw_gadget_border(LiftWindow->RPort,UP,&Lift15Gadget,NONE);
	if (picked_lift.lift_automove==3) draw_gadget_border(LiftWindow->RPort,DOWN,&Lift16Gadget,NONE);
	else draw_gadget_border(LiftWindow->RPort,UP,&Lift16Gadget,NONE);

	itoa2(picked_lift.lift_min_height,Lift1Buffer);
	Lift1Info.LongInt=picked_lift.lift_min_height;

	itoa2(picked_lift.lift_max_height,Lift2Buffer);
	Lift2Info.LongInt=picked_lift.lift_max_height;

	RefreshGList(&Lift1Gadget,LiftWindow,NULL,14);
}

/******************************************************************************/
void redraw_door_window()
{
	if (picked_door.door_direction) draw_gadget_border(DoorWindow->RPort,DOWN,&Door3Gadget,NONE);
	else draw_gadget_border(DoorWindow->RPort,UP,&Door3Gadget,NONE);

	if (picked_door.door_button_only) draw_gadget_border(DoorWindow->RPort,DOWN,&Door4Gadget,NONE);
	else draw_gadget_border(DoorWindow->RPort,UP,&Door4Gadget,NONE);

	itoa2(picked_door.door_delay,Door1Buffer);
	Door1Info.LongInt=picked_door.door_delay;

	itoa2(picked_door.door_key,Door2Buffer);
	Door2Info.LongInt=picked_door.door_key;

	RefreshGList(&Door1Gadget,DoorWindow,NULL,4);
}

/******************************************************************************/
void redraw_map_window()
{
	strcpy(MapNameBuffer,MapData->name);

	itoa2(MapData->time_limit,TimeBuffer);
	itoa2(MapData->water_speed,WaterSpeedBuffer);
	itoa2(MapData->hi_water_level,WaterMaxBuffer);
	itoa2(MapData->low_water_level,WaterMinBuffer);
	itoa2(MapData->pl1x,Pl1XBuffer);
	itoa2(MapData->pl1y,Pl1YBuffer);
	itoa2(MapData->pl1z,Pl1ZBuffer);
	itoa2(MapData->pl2x,Pl2XBuffer);
	itoa2(MapData->pl2y,Pl2YBuffer);
	itoa2(MapData->pl2z,Pl2ZBuffer);
	itoa2(MapData->pl3x,Pl3XBuffer);
	itoa2(MapData->pl3y,Pl3YBuffer);
	itoa2(MapData->pl3z,Pl3ZBuffer);
	itoa2(MapData->pl4x,Pl4XBuffer);
	itoa2(MapData->pl4y,Pl4YBuffer);
	itoa2(MapData->pl4z,Pl4ZBuffer);

	TimeInfo.LongInt=MapData->time_limit;
	WaterSpeedInfo.LongInt=MapData->water_speed;
	WaterMaxInfo.LongInt=MapData->hi_water_level;
	WaterMinInfo.LongInt=MapData->low_water_level;
	Pl1XInfo.LongInt=MapData->pl1x;
	Pl1YInfo.LongInt=MapData->pl1y;
	Pl1ZInfo.LongInt=MapData->pl1z;
	Pl2XInfo.LongInt=MapData->pl2x;
	Pl2YInfo.LongInt=MapData->pl2y;
	Pl2ZInfo.LongInt=MapData->pl2z;
	Pl3XInfo.LongInt=MapData->pl3x;
	Pl3YInfo.LongInt=MapData->pl3y;
	Pl3ZInfo.LongInt=MapData->pl3z;
	Pl4XInfo.LongInt=MapData->pl4x;
	Pl4YInfo.LongInt=MapData->pl4y;
	Pl4ZInfo.LongInt=MapData->pl4z;

	if (current_tool!=6) draw_gadget_border(MapWindow->RPort,UP,&LevelPl1Gadget,-1);
	else draw_gadget_border(MapWindow->RPort,DOWN,&LevelPl1Gadget,-1);
	if (current_tool!=7) draw_gadget_border(MapWindow->RPort,UP,&LevelPl2Gadget,-1);
	else draw_gadget_border(MapWindow->RPort,DOWN,&LevelPl2Gadget,-1);
	if (current_tool!=8) draw_gadget_border(MapWindow->RPort,UP,&LevelPl3Gadget,-1);
	else draw_gadget_border(MapWindow->RPort,DOWN,&LevelPl3Gadget,-1);
	if (current_tool!=9) draw_gadget_border(MapWindow->RPort,UP,&LevelPl4Gadget,-1);
	else draw_gadget_border(MapWindow->RPort,DOWN,&LevelPl4Gadget,-1);

	RefreshGList(&MapNameGadget,MapWindow,NULL,24);
}

/******************************************************************************/

void close_all(void)
{
	if (MapWindow) CloseWindow(MapWindow);
	if (InfoWindow) CloseWindow(InfoWindow);
	if (MonsWindow) CloseWindow(MonsWindow);
	if (LevelWindow) CloseWindow(LevelWindow);
	if (WorldWindow) CloseWindow(WorldWindow);
	HGeditProcess->pr_WindowPtr=OldWindowPtr;
	if (CellWindow) CloseWindow(CellWindow);
	if (ToolsWindow) CloseWindow(ToolsWindow);
	if (ButtonWindow) CloseWindow(ButtonWindow);
	if (DoorWindow) CloseWindow(DoorWindow);
	if (LiftWindow) CloseWindow(LiftWindow);

	if (chiptextsmem) FreeMem(chiptextsmem,sizeof(struct text)*36);
	if (monsimagemem) FreeMem(monsimagemem,38400);
	if (worldimagemem) FreeMem(worldimagemem,17300);
	if (Blocks) FreeMem(Blocks,128000);
	if (PasteBuffer) FreeMem(PasteBuffer,sizeof(struct map)+100);
	if (worldmem) FreeMem(worldmem,sizeof(struct map)+sizeof(struct locn)+100);

	if (os_version>=36) if (HGeditScreen) while (!CloseScreen(HGeditScreen));
	else if (HGeditScreen) CloseScreen(HGeditScreen);

	if (ReqBase) {
		PurgeFiles(&ReqFileStruct);
		CloseLibrary((struct Library *)(ReqBase));
	}
	if (GfxBase) CloseLibrary((struct Library *)(GfxBase));
	if (DOSBase) CloseLibrary((struct Library *)(DOSBase));
	if (IntuitionBase) CloseLibrary((struct Library *)(IntuitionBase));
}

/******************************************************************************/

void open_all(void)
{
	BPTR fhandle;

	if (!(worldmem=(struct locn*)AllocMem(sizeof(struct map)+sizeof(struct locn)+100,MEMF_CLEAR)))
	{
		printf("Could not allocate enough ram for map data!\n");
                close_all();
		exit(FALSE);
	}
	MapData=(struct map*)((ULONG)worldmem+sizeof(struct locn));

	if (!(PasteBuffer=(struct map*)AllocMem(sizeof(struct map)+100,MEMF_CLEAR)))
	{
		printf("Could not allocate enough ram for paste buffer!\n");
                close_all();
		exit(FALSE);
	}

	if (!(chiptextsmem=(struct text*)AllocMem(sizeof(struct text)*36,MEMF_CHIP)))
	{
		printf("Could not allocate enough chip ram for text panels!\n");
                close_all();
		exit(FALSE);
	}

	if (!(Blocks=(USHORT*)AllocMem(128000,MEMF_CHIP)))
	{
		printf("Could not allocate enough chip ram for blocks!\n");
                close_all();
		exit(FALSE);
	}
	if (!(fhandle=Open("Blocks.dat",MODE_OLDFILE)))
	{
		printf("Could not open Blocks.dat\n");
                close_all();
		exit(FALSE);
	}
	if (Read(fhandle,Blocks,127968)<0)
	{
		printf("Blocks.dat could not be read!\n");
                close_all();
		exit(FALSE);
	}
	Close(fhandle);
	if(!(unpack(Blocks,Blocks)))
		SimpleRequest("Blocks.dat could not be unpacked!");

	if (!(worldimagemem=(USHORT*)AllocMem(17300,MEMF_CHIP)))
	{
		printf("Could not allocate enough chip ram for world image!\n");
                close_all();
		exit(FALSE);
	}
	if (!(fhandle=Open("World.dat",MODE_OLDFILE)))
	{
		printf("Could not open World.dat\n");
                close_all();
		exit(FALSE);
	}
	if (Read(fhandle,worldimagemem,17280)<0)
	{
		printf("World.dat could not be read!\n");
                close_all();
		exit(FALSE);
	}
	Close(fhandle);

	if (!(monsimagemem=(USHORT*)AllocMem(38400,MEMF_CHIP)))
	{
		printf("Could not allocate enough chip ram for monsters image!\n");
                close_all();
		exit(FALSE);
	}
	if (!(fhandle=Open("Monsters.dat",MODE_OLDFILE)))
	{
		printf("Could not open World.dat\n");
                close_all();
		exit(FALSE);
	}
	if (Read(fhandle,monsimagemem,38400)<0)
	{
		printf("Monsters.dat could not be read!\n");
                close_all();
		exit(FALSE);
	}
	Close(fhandle);

	if (!(IntuitionBase=(struct IntuitionBase*)OpenLibrary("intuition.library",33L)))
	{
		printf("Intuition library could not be opened!\n");
                close_all();
		exit(FALSE);
	}
	os_version=IntuitionBase->LibNode.lib_Version;

	if (!(DOSBase=(struct DosBase*)OpenLibrary("dos.library",33L)))
	{
		printf("DOS library could not be opened!\n");
                close_all();
		exit(FALSE);
	}

	if ((GfxBase=(struct GfxBase*) OpenLibrary("graphics.library",33L))==NULL)
	{
		printf("Graphics library could not be opened!.\n");
                close_all();
		exit (FALSE);
	}

	if (os_version>=36)
	{
		HGeditNewScreen.Width=1324-228;
	}
	if (!(HGeditScreen=(struct Screen*)OpenScreen((struct NewScreen *)(&HGeditNewScreen))))
	{
		os_version=33;
		HGeditNewScreen.Width=640;
		if (!(HGeditScreen=(struct Screen*)OpenScreen((struct NewScreen *)(&HGeditNewScreen))))
		{
			printf("Screen could not be opened!\n");
			close_all();
			exit(FALSE);
		}
	}
	SetRGB4(&HGeditScreen->ViewPort,0,9,9,10);	/* grey */
	SetRGB4(&HGeditScreen->ViewPort,1,0,0,0); 	/* black */
	SetRGB4(&HGeditScreen->ViewPort,2,15,15,15);	/* white */
	SetRGB4(&HGeditScreen->ViewPort,3,8,8,13);	/* light blue */
	SetRGB4(&HGeditScreen->ViewPort,4,11,9,8);	/* dull tan */
	SetRGB4(&HGeditScreen->ViewPort,5,8,8,10);	/* dull blue */
	SetRGB4(&HGeditScreen->ViewPort,6,4,11,4);	/* green */
	SetRGB4(&HGeditScreen->ViewPort,7,15,0,0);	/* red */
	if (os_version>=36)
	{
		CellNewWindow.Flags=ButtonNewWindow.Flags^WINDOWDEPTH;
		ButtonNewWindow.Flags=ButtonNewWindow.Flags^WINDOWDEPTH;
		ButtonNewWindow.LeftEdge=412+228*1;
		ButtonNewWindow.TopEdge=ButtonNewWindow.TopEdge+20;
		ButtonNewWindow.Height=ButtonNewWindow.Height-20;
		DoorNewWindow.Flags=DoorNewWindow.Flags^WINDOWDEPTH;
		DoorNewWindow.LeftEdge=412+228*2;
		DoorNewWindow.Height=86;
		DoorNewWindow.TopEdge=11;
		LiftNewWindow.Flags=LiftNewWindow.Flags^WINDOWDEPTH;
		LiftNewWindow.LeftEdge=412+228*1;
		LiftNewWindow.TopEdge=11;
		LiftNewWindow.Height=89+94+20;
	}

	LiftNewWindow.Screen=HGeditScreen;
	if (!(LiftWindow=(struct Window*)OpenWindow((struct NewWindow *)(&LiftNewWindow))))
	{
		printf("Could not open lift window!\n");
                close_all();
		exit(FALSE);
	}
	SetMenuStrip(LiftWindow,&MenuProject);
	draw_text(LiftWindow->RPort,4+50,11+11-2,2,0,(UBYTE*)"Minimum");
	draw_text(LiftWindow->RPort,4+50,11+31-2,2,0,(UBYTE*)"Maximum");
	draw_text(LiftWindow->RPort,4+81,11+80-12,2,0,(UBYTE*)"Automove");
	draw_text(LiftWindow->RPort,4+85,11+110-12,2,0,(UBYTE*)"Initial");
	draw_text(LiftWindow->RPort,4+90,11+140-12,2,0,(UBYTE*)"At Top");
	draw_text(LiftWindow->RPort,4+71,11+170-12,2,0,(UBYTE*)"At Bottom");
	draw_gadget_border(LiftWindow->RPort,BOTH,&Lift1Gadget,0);
	draw_gadget_border(LiftWindow->RPort,BOTH,&Lift2Gadget,0);
	draw_gadget_border(LiftWindow->RPort,UP,&Lift4Gadget,5);
	draw_gadget_border(LiftWindow->RPort,UP,&Lift5Gadget,5);
	draw_gadget_border(LiftWindow->RPort,UP,&Lift6Gadget,5);
	draw_gadget_border(LiftWindow->RPort,UP,&Lift7Gadget,5);
	draw_gadget_border(LiftWindow->RPort,UP,&Lift8Gadget,5);
	draw_gadget_border(LiftWindow->RPort,UP,&Lift10Gadget,5);
	draw_gadget_border(LiftWindow->RPort,UP,&Lift11Gadget,5);
	draw_gadget_border(LiftWindow->RPort,UP,&Lift12Gadget,5);
	draw_gadget_border(LiftWindow->RPort,UP,&Lift14Gadget,5);
	draw_gadget_border(LiftWindow->RPort,UP,&Lift15Gadget,5);
	draw_gadget_border(LiftWindow->RPort,UP,&Lift16Gadget,5);
	redraw_lift_window();
	RefreshGList(&Lift1Gadget,LiftWindow,NULL,14);

	if (!(ReqBase=(struct ReqBase*)OpenLibrary("/libs/req.library",0L)))
	{
		printf("Fox & Dawson Requestor library could not be opened!\n");
                close_all();
		exit(FALSE);
	}
	HGeditProcess=(struct Process*)FindTask((char*)0);
	OldWindowPtr=HGeditProcess->pr_WindowPtr;
	HGeditProcess->pr_WindowPtr=LiftWindow;

	DoorNewWindow.Screen=HGeditScreen;
	if (!(DoorWindow=(struct Window*)OpenWindow((struct NewWindow *)(&DoorNewWindow))))
	{
		printf("Could not open door window!\n");
		close_all();
		exit(FALSE);
	}
	SetMenuStrip(DoorWindow,&MenuProject);
	draw_text(DoorWindow->RPort,4+50-4*8,11+11,2,0,(UBYTE*)"Close delay");
	draw_text(DoorWindow->RPort,4+50+4*8,11+31,2,0,(UBYTE*)"Key");
	draw_gadget_border(DoorWindow->RPort,BOTH,&Door1Gadget,0);
	draw_gadget_border(DoorWindow->RPort,BOTH,&Door2Gadget,0);
	draw_gadget_border(DoorWindow->RPort,UP,&Door3Gadget,5);
	draw_gadget_border(DoorWindow->RPort,UP,&Door4Gadget,5);
	redraw_door_window();
	RefreshGList(&Door1Gadget,DoorWindow,NULL,3);

	ButtonNewWindow.Screen=HGeditScreen;
	if (!(ButtonWindow=(struct Window*)OpenWindow((struct NewWindow *)(&ButtonNewWindow))))
	{
		printf("Button window could not be opened!\n");
                close_all();
		exit(FALSE);
	}
	SetMenuStrip(ButtonWindow,&MenuProject);
	draw_text(ButtonWindow->RPort,4+5+26,11+4,2,0,(UBYTE*)"Pushed");
	draw_text(ButtonWindow->RPort,4+114+16,11+4,2,0,(UBYTE*)"Released");
        redraw_button_win();
	RefreshGList(&Button1Gadget,ButtonWindow,NULL,39);

	ToolsNewWindow.Screen=HGeditScreen;
	if (!(ToolsWindow=(struct Window*)OpenWindow((struct NewWindow *)(&ToolsNewWindow))))
	{
		printf("Tools window could not be opened!\n");
                close_all();
		exit(FALSE);
	}
	SetMenuStrip(ToolsWindow,&MenuProject);
	draw_border(ToolsWindow->RPort,DOWN,4+4,11+2,96,77,5);
	draw_gadget_border(ToolsWindow->RPort,UP,&ToolsPickGadget,0);
	draw_gadget_border(ToolsWindow->RPort,UP,&ToolsSetAllGadget,0);
	draw_gadget_border(ToolsWindow->RPort,UP,&ToolsSetBlockGadget,0);
	draw_gadget_border(ToolsWindow->RPort,UP,&ToolsSetTargtGadget,0);
	draw_gadget_border(ToolsWindow->RPort,UP,&ToolsSetWaterGadget,0);
	draw_border(ToolsWindow->RPort,DOWN,12+99,11+2,106,77,4);
	draw_gadget_border(ToolsWindow->RPort,UP,&ToolsHighlightGadget,0);
	draw_gadget_border(ToolsWindow->RPort,UP,&ToolsCutGadget,0);
	draw_gadget_border(ToolsWindow->RPort,UP,&ToolsCopyGadget,0);
	draw_gadget_border(ToolsWindow->RPort,UP,&ToolsPasteGadget,0);
	draw_gadget_border(ToolsWindow->RPort,UP,&ToolsFillGadget,0);
	RefreshGList(&ToolsPickGadget,ToolsWindow,NULL,13);

	CellNewWindow.Screen=HGeditScreen;
	if (!(CellWindow=(struct Window*)OpenWindow((struct NewWindow *)(&CellNewWindow))))
	{
		printf("Cell window could not be opened!\n");
                close_all();
		exit(FALSE);
	}
	SetMenuStrip(CellWindow,&MenuProject);
	draw_border(CellWindow->RPort,DOWN,4+6,11+15-10,207,33,5);
	draw_text(CellWindow->RPort,4+28,11+21-10,2,5,"Block");
	draw_gadget_border(CellWindow->RPort,UP,&CellBlockLeftGadget,0);
	draw_gadget_border(CellWindow->RPort,UP,&CellBlockRightGadget,0);
	draw_border(CellWindow->RPort,DOWN,4+35+76,11+18-10,76,13-1,4);

	draw_border(CellWindow->RPort,DOWN,4+6,11+3+67-24,207,18,5);
	draw_text(CellWindow->RPort,4+28,11+17+58-23,2,5,"Floor");
	draw_gadget_border(CellWindow->RPort,UP,&CellFloorLeftGadget,0);
	draw_gadget_border(CellWindow->RPort,UP,&CellFloorRightGadget,0);
	draw_border(CellWindow->RPort,DOWN,4+35+76,11+18+55-24,76,13-1,4);

	draw_border(CellWindow->RPort,DOWN,4+6,11+3+102-34,207,18,5);
	draw_text(CellWindow->RPort,4+28,11+17+93-33,2,5,"Panel");
	draw_gadget_border(CellWindow->RPort,UP,&CellPanelLeftGadget,0);
	draw_gadget_border(CellWindow->RPort,UP,&CellPanelRightGadget,0);
	draw_border(CellWindow->RPort,DOWN,4+35+76,11+18+90-34,76,13-1,4);

	draw_border(CellWindow->RPort,DOWN,4+6,11+3+137-44,207,33,5);
	draw_text(CellWindow->RPort,4+28,11+17+128-43,2,5,"Water");
	draw_gadget_border(CellWindow->RPort,UP,&CellWaterLeftGadget,0);
	draw_gadget_border(CellWindow->RPort,UP,&CellWaterRightGadget,0);
	draw_border(CellWindow->RPort,DOWN,4+35+76,11+18+125-44,76,13-1,4);

	draw_border(CellWindow->RPort,DOWN,4+6,180-33,207,18,5);
	draw_text(CellWindow->RPort,4+11,185-33,2,5,"Auxiliary");
	draw_gadget_border(CellWindow->RPort,UP,&CellAuxLeftGadget,0);
	draw_gadget_border(CellWindow->RPort,UP,&CellAuxRightGadget,0);
	draw_border(CellWindow->RPort,DOWN,4+35+76,183-33,76,13-1,4);

	draw_border(CellWindow->RPort,DOWN,4+6,205-33,207,34,5);

	draw_text(CellWindow->RPort,4+11,211-33,2,5,"Egg");

	draw_text(CellWindow->RPort,4+11+40,211-33,1,5,"Delay (x20s)");
	draw_border(CellWindow->RPort,BOTH,4+35+131,208-33,44,13-1,0);

	draw_border(CellWindow->RPort,DOWN,4+6,245+16,194+13,50,5);
	draw_text(CellWindow->RPort,4+11,267,2,5,"Item");

	draw_text(CellWindow->RPort,4+11+40,299,1,5,"Ammunition");
	draw_border(CellWindow->RPort,BOTH,4+35+131,296,44,13-1,0);

	draw_text(CellWindow->RPort,4+11+40,283,1,5,"Damaged %");
	draw_border(CellWindow->RPort,BOTH,4+35+131,280,44,13-1,0);
	draw_border(CellWindow->RPort,BOTH,4+35+131,264,44,13-1,0);

	draw_gadget_border(CellWindow->RPort,UP,&CellSkyNorthGadget,0);
	draw_gadget_border(CellWindow->RPort,UP,&CellSkyEastGadget,0);
	draw_gadget_border(CellWindow->RPort,UP,&CellSkySouthGadget,0);
	draw_gadget_border(CellWindow->RPort,UP,&CellSkyWestGadget,0);
	draw_gadget_border(CellWindow->RPort,UP,&CellFillSkyGadget,0);
	draw_text(CellWindow->RPort,4+6+48+75,245-35+10,2,0,"Sky");

	MyLong.window=CellWindow;

	RefreshGList(&CellBlockLeftGadget,CellWindow,NULL,32);

	WorldNewWindow.Screen=HGeditScreen;
	if (!(WorldWindow=(struct Window*)OpenWindow((struct NewWindow *)(&WorldNewWindow))))
	{
		printf("World window could not be opened!\n");
                close_all();
		exit(FALSE);
	}
	SetMenuStrip(WorldWindow,&MenuProject);
	draw_border(WorldWindow->RPort,DOWN,15,25,240+4+4+2+1,192+4+4+2+1,4);
	draw_border(WorldWindow->RPort,UP,15+4,25+4,240+2+1,192+2+1,0);
	draw_text(WorldWindow->RPort,21+(240/2)-((14*8)/2),15,2,0,(UBYTE*)"World Position");
	draw_text(WorldWindow->RPort,275+28,15,2,0,(UBYTE*)"Game Type");
	draw_gadget_border(WorldWindow->RPort,UP,&World1Gadget,5);
	draw_gadget_border(WorldWindow->RPort,UP,&World2Gadget,5);
	draw_gadget_border(WorldWindow->RPort,UP,&World3Gadget,5);
	draw_gadget_border(WorldWindow->RPort,UP,&World4Gadget,5);
	draw_gadget_border(WorldWindow->RPort,BOTH,&World6Gadget,0);
	draw_gadget_border(WorldWindow->RPort,BOTH,&World7Gadget,0);
	draw_gadget_border(WorldWindow->RPort,BOTH,&World8Gadget,0);
	draw_gadget_border(WorldWindow->RPort,BOTH,&World9Gadget,0);
	draw_gadget_border(WorldWindow->RPort,BOTH,&World10Gadget,0);
	draw_gadget_border(WorldWindow->RPort,BOTH,&World13Gadget,0);
	draw_gadget_border(WorldWindow->RPort,BOTH,&World14Gadget,0);
	draw_gadget_border(WorldWindow->RPort,BOTH,&World14bGadget,0);

	draw_gadget_border(WorldWindow->RPort,BOTH,&World23Gadget,0);
	draw_gadget_border(WorldWindow->RPort,BOTH,&World24Gadget,0);
	draw_gadget_border(WorldWindow->RPort,BOTH,&World25Gadget,0);
	draw_gadget_border(WorldWindow->RPort,BOTH,&World26Gadget,0);
	draw_text(WorldWindow->RPort,17+15,50+290+6*8,2,0,(UBYTE*)"Destinations");

	draw_border(WorldWindow->RPort,DOWN,10,241,46*8+12+2,4*10+22+3,4);
	draw_text(WorldWindow->RPort,15,245,2,4,(UBYTE*)"Worldmap Description");
	draw_border(WorldWindow->RPort,BOTH,14,260-3,46*8+6,40+5,0);
	draw_border(WorldWindow->RPort,DOWN,10,241+6*8+20,46*8+12+2,4*10+22+3,4);
	draw_text(WorldWindow->RPort,15,245+6*8+20,2,4,(UBYTE*)"Detailed Description");
	draw_border(WorldWindow->RPort,BOTH,14,260-3+6*8+20,46*8+6,40+5,0);
	redraw_world_window();

	MonsNewWindow.Screen=HGeditScreen;
	if (!(MonsWindow=(struct Window*)OpenWindow((struct NewWindow *)(&MonsNewWindow))))
	{
		printf("Monsters window could not be opened!\n");
		close_all();
		exit(FALSE);
	}
	SetMenuStrip(MonsWindow,&MenuProject);
	redraw_mons_window();

	InfoNewWindow.Screen=HGeditScreen;
	if (!(InfoWindow=(struct Window*)OpenWindow((struct NewWindow *)(&InfoNewWindow))))
	{
		printf("Text panels window could not be opened!\n");
                close_all();
		exit(FALSE);
	}
	SetMenuStrip(InfoWindow,&MenuProject);
	redraw_info_window();
	redraw_cell_win();

	LevelNewWindow.Screen=HGeditScreen;
	if (!(LevelWindow=(struct Window*)OpenWindow((struct NewWindow *)(&LevelNewWindow))))
	{
		printf("Level window could not be opened!\n");
                close_all();
		exit(FALSE);
	}
	SetMenuStrip(LevelWindow,&MenuProject);
	copy_map_cell1(&picked_block,mp1(currx,curry,currz));
	copy_map_cell2(&picked_block2,mp2(currx,curry,currz));
	copy_map_cell3(&picked_block3,mp3(currx,curry,currz));
	NewModifyProp(&LevelGadget,LevelWindow,NULL,AUTOKNOB|PROPNEWLOOK|FREEVERT,0,(19-currz)*3449,0,3450,1);
	redraw_level();

	MapNewWindow.Screen=HGeditScreen;
	if (!(MapWindow=(struct Window*)OpenWindow((struct NewWindow *)(&MapNewWindow))))
	{
		printf("Map window could not be opened!\n");
                close_all();
		exit(FALSE);
	}
	SetMenuStrip(MapWindow,&MenuProject);
	draw_border(MapWindow->RPort,DOWN,4+5,11+5,322+144,21,4);
	draw_text(MapWindow->RPort,4+9+5,11+12,2,4,"Mesg");
	draw_border(MapWindow->RPort,BOTH,4+55,11+9,268+144,13,0);
	draw_border(MapWindow->RPort,DOWN,4+5,11+31,400,40,5);
	draw_text(MapWindow->RPort,4+13,11+39,2,5,"Pl 1");
	draw_text(MapWindow->RPort,4+13,11+58,2,5,"Pl 2");
	draw_text(MapWindow->RPort,4+211,11+39,2,5,"Pl 3");
	draw_text(MapWindow->RPort,4+211,11+58,2,5,"Pl 4");

	draw_border(MapWindow->RPort,BOTH,4+83,46,36,13,0);
	draw_border(MapWindow->RPort,BOTH,4+124,46,36,13,0);
	draw_border(MapWindow->RPort,BOTH,4+165,46,36,13,0);
	draw_border(MapWindow->RPort,BOTH,4+83,65,36,13,0);
	draw_border(MapWindow->RPort,BOTH,4+124,65,36,13,0);
	draw_border(MapWindow->RPort,BOTH,4+165,65,36,13,0);

	draw_border(MapWindow->RPort,BOTH,4+283,46,36,13,0);
	draw_border(MapWindow->RPort,BOTH,4+324,46,36,13,0);
	draw_border(MapWindow->RPort,BOTH,4+365,46,36,13,0);
	draw_border(MapWindow->RPort,BOTH,4+283,65,36,13,0);
	draw_border(MapWindow->RPort,BOTH,4+324,65,36,13,0);
	draw_border(MapWindow->RPort,BOTH,4+365,65,36,13,0);

	draw_border(MapWindow->RPort,DOWN,4+415,11+31,211,40,5);
	draw_text(MapWindow->RPort,4+505+24,11+38,1,5,"Min Ht");
	draw_text(MapWindow->RPort,4+505+24,11+57,1,5,"Max Ht");
	draw_text(MapWindow->RPort,4+424,11+57,1,5,"Speed");
	draw_text(MapWindow->RPort,4+424,11+38,2,5,"Tidal Water");
	draw_border(MapWindow->RPort,BOTH,4+586,46,36,13,0);
	draw_border(MapWindow->RPort,BOTH,4+586,65,36,13,0);
	draw_border(MapWindow->RPort,BOTH,4+457+16,65,36,13,0);

	draw_border(MapWindow->RPort,DOWN,4+333+147,11+5,186-40,21,4);
	draw_text(MapWindow->RPort,4+343+147,11+12,2,4,"Time (x10s)");
	draw_border(MapWindow->RPort,BOTH,4+415+24+147,11+9,100-48-16,13,0);

	redraw_map_window();
	RefreshGList(&MapNameGadget,MapWindow,NULL,24);

	if (os_version>=36) PubScreenStatus(HGeditScreen,0L);
	new_routine();

	show_title();
	ScreenToFront(HGeditScreen);
}
