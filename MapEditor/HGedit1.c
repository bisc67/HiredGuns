#include "common.c"

/******************************************************************************/

void swap(px,py)
ULONG *px;
ULONG *py;
{
	ULONG temp;

	temp=*px;
	*px=*py;
	*py=temp;
}

/******************************************************************************/

void exit_routine()
{
	if (changed)
		if (!(TwoGadRequest("Changes not saved! Are you sure?")))
		{
			exit(0);
		}
	WBenchToFront();
	close_all();
        exit(TRUE);
}

/******************************************************************************/

void new_routine()
{
	BPTR fhandle;

	if (!(fhandle=Open("Blank.map",MODE_OLDFILE)))
		SimpleRequest("Could not open Blank.map!");
	else
		if (Read(fhandle,worldmem,sizeof(struct map)+sizeof(struct locn))<0)
			SimpleRequest("Blank.map could not be read!");
		else
		{
			changed=0;
			Close(fhandle);
			if ((worldmem->locn_x1=='R')&&(worldmem->locn_x2=='N')&&(worldmem->locn_y1=='C'))
				if(!(unpack(worldmem,worldmem)))
					SimpleRequest("Blank.map could not be unpacked!");
			redraw_tpanels_window();
			redraw_map_window();
			memcpy(World15Buffer,worldmem->locn_legend1,45);
			memcpy(World16Buffer,worldmem->locn_legend2,60);
			memcpy(World17Buffer,worldmem->locn_legend3,60);
			memcpy(World18Buffer,worldmem->locn_legend4,60);
			memcpy(World19Buffer,worldmem->locn_info1,60);
			memcpy(World20Buffer,worldmem->locn_info2,60);
			memcpy(World21Buffer,worldmem->locn_info3,60);
			memcpy(World22Buffer,worldmem->locn_info4,60);
			redraw_world_window();
			redraw_info_window();
			redraw_mons_window();
			redraw_level();
		}
}

/******************************************************************************/

void load_mapdata()
{
	BPTR fhandle;

	if (!((changed)&&(!(TwoGadRequest("Current data not saved!")))))
	{
		strcpy(ReqFilename,map_fbuf);
		strcpy(ReqDirectoryName,map_dbuf);
		strcpy(fname,map_nbuf);
		if(file_request("Load map"))
		{
			strcpy(map_fbuf,ReqFilename);
			strcpy(map_dbuf,ReqDirectoryName);
			strcpy(map_nbuf,fname);
			if (!(fhandle=Open(fname,MODE_OLDFILE)))
				SimpleRequest("Could not open file!");
			else
				if (Read(fhandle,worldmem,sizeof(struct map)+sizeof(struct locn))<0)
					SimpleRequest("File could not be read!");
				else
				{
					changed=0;
					Close(fhandle);
					if ((worldmem->locn_x1=='R')&&(worldmem->locn_x2=='N')&&(worldmem->locn_y1=='C'))
						if(!(unpack(worldmem,worldmem)))
							SimpleRequest("File could not be unpacked!");
					OnMenu(MapWindow,SHIFTMENU(0)|SHIFTITEM(5));
					redraw_tpanels_window();
					redraw_map_window();
					memcpy(World15Buffer,worldmem->locn_legend1,45);
					memcpy(World16Buffer,worldmem->locn_legend2,60);
					memcpy(World17Buffer,worldmem->locn_legend3,60);
					memcpy(World18Buffer,worldmem->locn_legend4,60);
					memcpy(World19Buffer,worldmem->locn_info1,60);
					memcpy(World20Buffer,worldmem->locn_info2,60);
					memcpy(World21Buffer,worldmem->locn_info3,60);
					memcpy(World22Buffer,worldmem->locn_info4,60);
					redraw_world_window();
					redraw_info_window();
					redraw_mons_window();
					redraw_level();
				}
		}
	}
}

/******************************************************************************/

void appstr(dest,source)
char *dest;
char *source;
{
	register ULONG i=0,s=0;

	while (dest[i++]!=0);
	i--;
	while (source[s]!=0)
		dest[i++]=source[s++];
	dest[i]=0;
}

/******************************************************************************/

void show_title(void)
{
	BPTR outhandle;
	char command_str[400]={"c/m title.ilbm secs 5 nomouse center quiet"};

	outhandle=Open("nil:",MODE_NEWFILE);
	if (outhandle)
	{
		Execute(command_str,0L,outhandle);
		Close(outhandle);
	}
}

/******************************************************************************/

void show_help(void)
{
	BPTR outhandle;
	char command_str[100]={"c/amigaguide help.guide"};

	outhandle=Open("nil:",MODE_NEWFILE);
	if (outhandle)
	{
		WBenchToFront();
		Execute(command_str,0L,outhandle);
		Close(outhandle);
		ScreenToFront(HGeditScreen);
	}
}

/******************************************************************************/

void display(void)
{
	BPTR outhandle;
	char command_str[100];

	sprintf(command_str,"hg_display MEM %d",worldmem);

	outhandle=Open("nil:",MODE_NEWFILE);
	if (outhandle)
	{
		Execute(command_str,0L,outhandle);
		Close(outhandle);
		ScreenToFront(HGeditScreen);
	}

}

/******************************************************************************/

void load_panels(void)
{
	BPTR fhandle,outhandle;
	char command_str1[400]={"copy "};
	char command_str2[100]={"c/ilbm2raw -b2gM48N40rcZ ram:panels.ilbm ram:panels.bin"};

	strcpy(ReqFilename,panel_fbuf);
	strcpy(ReqDirectoryName,panel_dbuf);
	if(file_request("Load panel data"))
	{
		strcpy(panel_fbuf,ReqFilename);
		strcpy(panel_dbuf,ReqDirectoryName);
		outhandle=Open("con:0/11/640/150/Converting to raw...",MODE_NEWFILE);
		if (outhandle)
		{
			WBenchToFront();
			appstr(command_str1,fname);
			appstr(command_str1," ram:panels.ilbm");
			Execute(command_str1,0L,outhandle);
			Execute(command_str2,0L,outhandle);
			ScreenToFront(HGeditScreen);
			Close(outhandle);

			if (!(fhandle=Open("ram:panels.bin",MODE_OLDFILE)))
				SimpleRequest("Could not open file!");
			else
				if (Read(fhandle,&MapData->texts,sizeof(struct text)*36)<0)
					SimpleRequest("File could not be read!");
				else
				{
					redraw_tpanels_window();
					changed=1;
					Close(fhandle);
				}
		}
	}
}

/******************************************************************************/

void load_horizons(void)
{
	BPTR fhandle,outhandle;
	char command_str1[400]={"copy "};
	char command_str2[100]={"ilbm2raw -b1f0,0,144,32c ram:horizons.ilbm ram:horizon1.bin"};
	char command_str3[100]={"ilbm2raw -b1f0,32,144,32c ram:horizons.ilbm ram:horizon2.bin"};
	char command_str4[100]={"ilbm2raw -b1f0,64,144,32c ram:horizons.ilbm ram:horizon3.bin"};
	char command_str5[100]={"ilbm2raw -b1f0,96,144,32c ram:horizons.ilbm ram:horizon4.bin"};
	char command_str6[150]={"join ram:horizon1.bin ram:horizon2.bin ram:horizon3.bin ram:horizon4.bin as ram:horizon.bin"};

	strcpy(ReqFilename,horiz_fbuf);
	strcpy(ReqDirectoryName,horiz_dbuf);
	if(file_request("Load horizon data"))
	{
		strcpy(horiz_fbuf,ReqFilename);
		strcpy(horiz_dbuf,ReqDirectoryName);
		outhandle=Open("con:0/11/640/150/Converting to raw...",MODE_NEWFILE);
		if (outhandle)
		{
			WBenchToFront();
			appstr(command_str1,fname);
			appstr(command_str1," ram:horizons.ilbm");
			Execute(command_str1,0L,outhandle);
			Execute(command_str2,0L,outhandle);
			Execute(command_str3,0L,outhandle);
			Execute(command_str4,0L,outhandle);
			Execute(command_str5,0L,outhandle);
			Execute(command_str6,0L,outhandle);
			ScreenToFront(HGeditScreen);
			Close(outhandle);

			if (!(fhandle=Open("ram:horizon.bin",MODE_OLDFILE)))
				SimpleRequest("Could not open file!");
			else
				if (Read(fhandle,&MapData->horizons,sizeof(struct horizon)*4)<0)
					SimpleRequest("File could not be read!");
				else
				{
					changed=1;
					Close(fhandle);
				}
			}
		}
}

/******************************************************************************/

void load_text(void)
{
	BPTR fhandle;
        unsigned int fcount;
	ULONG tt=0,offset=0;
        char c;
	ULONG x,y,z;

	for (tt=0;tt<32;tt++)
	{
		MapData->text_triggers[tt].mesg_offset=0;
		MapData->text_triggers[tt].trigger_posn=0;
	}

	tt=0;
	strcpy(ReqFilename,text_fbuf);
	strcpy(ReqDirectoryName,text_dbuf);
	if(file_request("Load text data"))
	{
		strcpy(text_fbuf,ReqFilename);
		strcpy(text_dbuf,ReqDirectoryName);
		if(!(fhandle=Open(fname,MODE_OLDFILE)))
			SimpleRequest("Could not open file!");
		else
		{
			fcount=Read(fhandle,&c,1);
			while ((fcount)&&(tt<50)&&(offset<3*1024))
			{
				MapData->text_triggers[tt].mesg_offset=offset;
				x=c-'0';
				fcount=Read(fhandle,&c,1);x*=10;x=x+c-'0';
				fcount=Read(fhandle,&c,1);
				fcount=Read(fhandle,&c,1);y=c-'0';
				fcount=Read(fhandle,&c,1);y*=10;y=y+c-'0';
				fcount=Read(fhandle,&c,1);
				fcount=Read(fhandle,&c,1);z=c-'0';
				fcount=Read(fhandle,&c,1);z*=10;z=z+c-'0';
				fcount=Read(fhandle,&c,1);
				MapData->text_triggers[tt++].trigger_posn=(x+y*MAP_DEPTH+z*FLOOR_SIZE)*4;

				MapData->text_mesgs[offset++]=0;	/* enough space for node pointers */
				MapData->text_mesgs[offset++]=0;
				MapData->text_mesgs[offset++]=0;
				MapData->text_mesgs[offset++]=0;
				MapData->text_mesgs[offset++]=0;
				MapData->text_mesgs[offset++]=0;
				MapData->text_mesgs[offset++]=0;
				MapData->text_mesgs[offset++]=0;
				while ((MapData->text_mesgs[offset-1]!=EOL)&&(offset<3*1024)&&(fcount))
				{
					fcount=Read(fhandle,&MapData->text_mesgs[offset++],1);
				}
				MapData->text_mesgs[offset-1]=0;

				if (offset%2) MapData->text_mesgs[offset++]=0; /* even up messages */

				fcount=Read(fhandle,&c,1);
			}
			if (tt>=50) SimpleRequest("Too many messages!");
			if (offset>=3*1024) SimpleRequest("Too much message data!");
			changed=1;
			Close(fhandle);
		}
	}
}

/******************************************************************************/

void crunch(void)
{
	BPTR outhandle;
	char command_str[200]={"propack p d "};

	if(file_request("Crunch Map Data"))
	{
		outhandle=Open("con:0/11/640/150/Crunching...",MODE_NEWFILE);
		if (outhandle)
		{
			WBenchToFront();
			strcpy(&command_str[16],fname);
			Execute(command_str,0L,outhandle);
			ScreenToFront(HGeditScreen);
			Close(outhandle);
		}
	}
}

/******************************************************************************/

void save_mapdata()
{
	BPTR fhandle;

	strcpy(MapData->name,MapNameBuffer);
	MapData->time_limit=TimeInfo.LongInt;
	MapData->water_speed=WaterSpeedInfo.LongInt;
	MapData->hi_water_level=WaterMaxInfo.LongInt;
	MapData->low_water_level=WaterMinInfo.LongInt;
	MapData->pl1x=Pl1XInfo.LongInt;
	MapData->pl1y=Pl1YInfo.LongInt;
	MapData->pl1z=Pl1ZInfo.LongInt;
	MapData->pl2x=Pl2XInfo.LongInt;
	MapData->pl2y=Pl2YInfo.LongInt;
	MapData->pl2z=Pl2ZInfo.LongInt;
	MapData->pl3x=Pl3XInfo.LongInt;
	MapData->pl3y=Pl3YInfo.LongInt;
	MapData->pl3z=Pl3ZInfo.LongInt;
	MapData->pl4x=Pl4XInfo.LongInt;
	MapData->pl4y=Pl4YInfo.LongInt;
	MapData->pl4z=Pl4ZInfo.LongInt;

	memcpy(worldmem->locn_legend1,World15Buffer,45);
	memcpy(worldmem->locn_legend2,World16Buffer,60);
	memcpy(worldmem->locn_legend3,World17Buffer,60);
	memcpy(worldmem->locn_legend4,World18Buffer,60);
	memcpy(worldmem->locn_info1,World19Buffer,60);
	memcpy(worldmem->locn_info2,World20Buffer,60);
	memcpy(worldmem->locn_info3,World21Buffer,60);
	memcpy(worldmem->locn_info4,World22Buffer,60);
	worldmem->locn_legend2_codes[0]=0xfb;
	worldmem->locn_legend3_codes[0]=0xfb;
	worldmem->locn_legend4_codes[0]=0xfb;
	worldmem->locn_info2_codes[0]=0xfb;
	worldmem->locn_info3_codes[0]=0xfb;
	worldmem->locn_info4_codes[0]=0xfb;

        worldmem->locn_hit_width=10;
        worldmem->locn_hit_height=10;
        worldmem->locn_destinations[0]=World23Info.LongInt;
        worldmem->locn_destinations[1]=World24Info.LongInt;
        worldmem->locn_destinations[2]=World25Info.LongInt;
        worldmem->locn_destinations[3]=World26Info.LongInt;
        worldmem->locn_disk=World6Info.LongInt;
        worldmem->locn_map_num=World7Info.LongInt;
        worldmem->locn_picture_num=World8Info.LongInt;
        worldmem->locn_music_num=World9Info.LongInt;
        worldmem->locn_atmos=World10Info.LongInt;
        worldmem->locn_sky=World13Info.LongInt;
        worldmem->locn_style=World14Info.LongInt-1;
        worldmem->locn_players=World14bInfo.LongInt;

	if (!make_push_list())
	{
		make_2d_map();
		illuminate();

		if (!(fhandle=Open(fname,MODE_NEWFILE)))
		{
			SimpleRequest("Could not open file!");
			exit (0);
		}
		if (!(Write(fhandle,worldmem,sizeof(struct map)+sizeof(struct locn))))
		{
			SimpleRequest("File could not be written!");
			exit (0);
		}
		Close(fhandle);
		changed=0;
        }
	else
        {
		SimpleRequest("Too many pushables! max=32");
		drawing=0; current_tool=0;
		last_block_x=-1; last_block_y=-1;
		redraw_tools_window();
	}

}

/******************************************************************************/

void save_mapdata_as()
{
	if(file_request("Save map as..."))
	{
		strcpy(map_fbuf,ReqFilename);
		strcpy(map_dbuf,ReqDirectoryName);
		strcpy(map_nbuf,fname);
		OnMenu(MapWindow,SHIFTMENU(0)|SHIFTITEM(5));
		save_mapdata();
	}
}

/******************************************************************************/

void save_convers()
{
	FILE *fhandle;
	ULONG tt=0,offset=0;

	strcpy(ReqFilename,convers_fbuf);
	strcpy(ReqDirectoryName,convers_dbuf);
	if(file_request("Save conversations as..."))
	{
		strcpy(convers_fbuf,ReqFilename);
		strcpy(convers_dbuf,ReqDirectoryName);
		strcpy(convers_nbuf,fname);

		if (!(fhandle=fopen(fname,"w")))
			SimpleRequest("Could not open file for writing!");
		else
		{
			tt=0;
			while (offset=MapData->text_triggers[tt].trigger_posn)
			{
				offset=MapData->text_triggers[tt].mesg_offset;
				fprintf(fhandle,"\"%s\"\n",&MapData->text_mesgs[offset+8]);
				tt++;
			}
			fclose(fhandle);
		}
	}
}

/******************************************************************************/

void save_info()
{
	FILE *fhandle;

	strcpy(ReqFilename,info_fbuf);
	strcpy(ReqDirectoryName,info_dbuf);
	if(file_request("Save information as..."))
	{
		strcpy(info_fbuf,ReqFilename);
		strcpy(info_dbuf,ReqDirectoryName);
		strcpy(info_nbuf,fname);

		if (!(fhandle=fopen(fname,"w")))
			SimpleRequest("Could not open file for writing!");
		else
		{
			fprintf(fhandle,"\"%s\"\n",worldmem->locn_legend1);
			fprintf(fhandle,"\"%s\"\n",worldmem->locn_legend2);
			fprintf(fhandle,"\"%s\"\n",worldmem->locn_legend3);
			fprintf(fhandle,"\"%s\"\n",worldmem->locn_legend4);

			fprintf(fhandle,"\"%s\"\n",worldmem->locn_info1);
			fprintf(fhandle,"\"%s\"\n",worldmem->locn_info2);
			fprintf(fhandle,"\"%s\"\n",worldmem->locn_info3);
			fprintf(fhandle,"\"%s\"\n",worldmem->locn_info4);

			fclose(fhandle);
		}
	}
}

/******************************************************************************/


void use_mapdata()
{
	strcpy(fname,"/Maps/00.map");
	save_mapdata();
}

/******************************************************************************/

struct Image panel_image=
{
	0,0,				/* top left x,y */
	48,40,				/* width, height */
	2,				/* depth */
	NULL,				/* image data */
	3,				/* plane pick */
	0,				/* plane on, off */
        NULL,				/* next image */
};

void redraw_tpanels_window(void)
{
	int i;
	char some_text[4];

	memcpy(chiptextsmem,&MapData->texts,sizeof(struct text)*36);

	for (i=0;i<32;i++)
	{
		strcpy(some_text,"   ");
		itoa2(i+1,some_text);
		draw_text(InfoWindow->RPort,17+2+(i%6)*64,23-6+(i/6)*66,1,0,some_text);
		panel_image.ImageData=(UWORD*)&chiptextsmem[i];
		DrawImage(InfoWindow->RPort,&panel_image,17+2+(i%6)*64,23+2+(i/6)*66);
	}
}

void update_tpanels_window(void)
{
	int i,z=-1;

	if ((picked_block.panel_here_bit)&&(picked_block.panel==0))
		z=picked_block.variant;

	for (i=0;i<32;i++)
	{
		if (i==z) draw_border(InfoWindow->RPort,DOWN,17-2+(i%6)*64,23-8-2+(i/6)*66,62,64,-1);
		else draw_border(InfoWindow->RPort,UP,17-2+(i%6)*64,23-8-2+(i/6)*66,62,64,-1);
	}
}

/******************************************************************************/

void menu_analysis(menunumber)
USHORT menunumber;
{
	USHORT menu,menuitem,subitem;
	struct MenuItem *menupoint;

	menu=MENUNUM(menunumber);
	menuitem=ITEMNUM(menunumber);
	subitem=SUBNUM(menunumber);

	menupoint=(struct MenuItem*)ItemAddress(&MenuProject,menunumber);

	switch(menu)
	{
		case 0:
			switch(menuitem)
			{
				case 0:      		/* new */
                                        new_routine();
					break;

				case 1:      		/* help */
                                        show_help();
					break;
				case 2:			/* import */
					switch(subitem)
					{
						case 0:
							load_panels();
							break;
						case 1:
							load_text();
							break;
						case 2:
							load_horizons();
							break;
						default:
							break;
					}
					break;
				case 3:			/* export */
					switch(subitem)
					{
						case 0:
							save_convers();
							break;
						case 1:
							save_info();
							break;
						default:
							break;
					}
					break;
				case 4:			/* load map */
					load_mapdata();
					break;
				case 5:			/* save map */
					strcpy(fname,map_nbuf);
					save_mapdata();
					break;
				case 6:			/* save as */
					strcpy(ReqFilename,map_fbuf);
					strcpy(ReqDirectoryName,map_dbuf);
					strcpy(fname,map_nbuf);
					save_mapdata_as();
					break;
				case 7:			/* use */
                                        use_mapdata();
					break;
				case 8:			/* display */
					display();
					break;
				case 9:			/* quit */
                                        exit_routine();
					break;
				default:
					break;
			}
			break;
		default:
			break;
	}

}

/******************************************************************************/
void remove_button(void)
{
	struct map_cell1 picked_temp;

	copy_map_cell1(&picked_temp,mp1(currx,curry,currz));

	if ((picked_temp.panel_here_bit)&&((picked_temp.panel==1)||(picked_temp.panel==2)))
	{
		MapData->buttons[picked_temp.variant].button_used=0;
		mp1(currx,curry,currz)->panel=0;
		mp1(currx,curry,currz)->panel_here_bit=0;
	}

	if ((picked_temp.floor_here_bit)&&(picked_temp.floor==1))
	{
		copy_map_cell1(&picked_temp,mp1(currx,curry,currz-1));
		MapData->buttons[picked_temp.variant].button_used=0;
		mp1(currx,curry,currz-1)->floor=0;
		mp1(currx,curry,currz-1)->floor_here_bit=0;
	}

	if (currz<MAP_HEIGHT-1)
	{
		copy_map_cell1(&picked_temp,mp1(currx,curry,currz+1));
		if ((picked_temp.floor_here_bit)&&(picked_temp.floor==1))
		{
			SimpleRequest("The button on the floor above has been deleted!");
			MapData->buttons[picked_temp.variant].button_used=0;
			mp1(currx,curry,currz+1)->floor=0;
			mp1(currx,curry,currz+1)->floor_here_bit=0;
		}
	}
}

/******************************************************************************/
void get_door(void)
{
	int i=0;

	for (i=0;i<32;i++)
		if (MapData->doors[i].door_posn==(currx+curry*MAP_DEPTH+currz*FLOOR_SIZE)*4)
                {
			picked_door.door_posn=MapData->doors[i].door_posn;
			picked_door.door_trig=MapData->doors[i].door_trig;
			picked_door.door_direction=MapData->doors[i].door_direction;
			picked_door.door_type.auxiliary=MapData->doors[i].door_type.auxiliary;
			picked_door.door_type.variant=MapData->doors[i].door_type.variant;
			picked_door.door_type.explosion=MapData->doors[i].door_type.explosion;
			picked_door.door_type.panel=MapData->doors[i].door_type.panel;
			picked_door.door_type.water=MapData->doors[i].door_type.water;
			picked_door.door_type.floor=MapData->doors[i].door_type.floor;
			picked_door.door_type.pushable_bit=MapData->doors[i].door_type.pushable_bit;
			picked_door.door_type.invisible_bit=MapData->doors[i].door_type.invisible_bit;
			picked_door.door_type.opaque_bit=MapData->doors[i].door_type.opaque_bit;
			picked_door.door_type.aux_here_bit=MapData->doors[i].door_type.aux_here_bit;
			picked_door.door_type.explosion_here_bit=MapData->doors[i].door_type.explosion_here_bit;
			picked_door.door_type.panel_here_bit=MapData->doors[i].door_type.panel_here_bit;
			picked_door.door_type.water_here_bit=MapData->doors[i].door_type.water_here_bit;
			picked_door.door_type.floor_here_bit=MapData->doors[i].door_type.floor_here_bit;
			picked_door.door_type.block_here_bit=MapData->doors[i].door_type.block_here_bit;
			picked_door.door_type.block=MapData->doors[i].door_type.block;
			picked_door.door_delay=MapData->doors[i].door_delay;
			picked_door.door_count=0;
			picked_door.door_key=MapData->doors[i].door_key;
			picked_door.door_button_only=MapData->doors[i].door_button_only;
		}
}

/******************************************************************************/
int add_lift(void)
{
	int i=0;

	if ((picked_block.floor_here_bit)&&(picked_block.floor==2))
	{
		while ((MapData->lifts[i++].lift_posn)&&(i<=32));
		if (i>32)
		{
			SimpleRequest("Too many lifts!");
			picked_block.floor=0;
			picked_block.floor_here_bit=0;
			redraw_cell_win();
			drawing=0; current_tool=0;
			last_block_x=-1; last_block_y=-1;
			redraw_tools_window();
			return(0);
		}
		else
		{
			i--;
			MapData->lifts[i].lift_posn=(currx+curry*MAP_DEPTH+currz*FLOOR_SIZE)*4;
			MapData->lifts[i].lift_height=currz;
			MapData->lifts[i].lift_min_height=picked_lift.lift_min_height;
			MapData->lifts[i].lift_max_height=picked_lift.lift_max_height;
			MapData->lifts[i].lift_direction=picked_lift.lift_direction;
			MapData->lifts[i].lift_weight=picked_lift.lift_weight;
			MapData->lifts[i].lift_up=picked_lift.lift_up;
			MapData->lifts[i].lift_down=picked_lift.lift_down;
			MapData->lifts[i].lift_automove=picked_lift.lift_automove;
		}
	}
	return(1);
}

/******************************************************************************/
void remove_lift(void)
{
	int i=0;
	struct map_cell1 picked_temp;

	copy_map_cell1(&picked_temp,mp1(currx,curry,currz));

	if ((picked_temp.floor_here_bit)&&(picked_temp.floor==2))
                for (i=0;i<32;i++)
			if (MapData->lifts[i].lift_posn==(currx+curry*MAP_DEPTH+currz*FLOOR_SIZE)*4)
			{
				MapData->lifts[i].lift_posn=0;
				mp1(currx,curry,currz)->floor=0;
				mp1(currx,curry,currz)->floor_here_bit=0;
                        }
}

/******************************************************************************/
int add_door(void)
{
	int i=0;

	if ((picked_block.block_here_bit)&&(picked_block.block>=20)&&(picked_block.block<=23))
	{
		while ((MapData->doors[i++].door_posn)&&(i<=32));
		if (i>32)
		{
			SimpleRequest("Too many doors!");
			picked_block.block=0;
			picked_block.block_here_bit=0;
			picked_block.auxiliary=0;
			picked_block.aux_here_bit=0;
			redraw_cell_win();
			drawing=0; current_tool=0;
			last_block_x=-1; last_block_y=-1;
			redraw_tools_window();
			return(0);
		}
		else
		{
			i--;
			picked_block.variant=0;
			MapData->doors[i].door_posn=(currx+curry*MAP_DEPTH+currz*FLOOR_SIZE)*4;
			MapData->doors[i].door_trig=0;
			MapData->doors[i].door_direction=picked_door.door_direction;
			MapData->doors[i].door_type.auxiliary=0;
			MapData->doors[i].door_type.variant=0;
			MapData->doors[i].door_type.explosion=0;
			MapData->doors[i].door_type.panel=0;
			MapData->doors[i].door_type.water=0;
			MapData->doors[i].door_type.floor=0;
			MapData->doors[i].door_type.pushable_bit=0;
			MapData->doors[i].door_type.invisible_bit=0;
			MapData->doors[i].door_type.opaque_bit=0;
			MapData->doors[i].door_type.aux_here_bit=0;
			MapData->doors[i].door_type.explosion_here_bit=0;
			MapData->doors[i].door_type.panel_here_bit=0;
			MapData->doors[i].door_type.water_here_bit=0;
			MapData->doors[i].door_type.floor_here_bit=0;
			MapData->doors[i].door_type.block_here_bit=picked_block.block_here_bit;
			MapData->doors[i].door_type.block=picked_block.block;
			MapData->doors[i].door_delay=picked_door.door_delay;
			MapData->doors[i].door_count=0;
			MapData->doors[i].door_key=picked_door.door_key;
			MapData->doors[i].door_button_only=picked_door.door_button_only;
		}
	}
	return(1);
}

/******************************************************************************/
void remove_door(void)
{
	int i=0;
	struct map_cell1 picked_temp;

	copy_map_cell1(&picked_temp,mp1(currx,curry,currz));

	if ((picked_temp.block_here_bit)&&(picked_temp.block>=20)&&(picked_temp.block<=23))
                for (i=0;i<32;i++)
			if (MapData->doors[i].door_posn==(currx+curry*MAP_DEPTH+currz*FLOOR_SIZE)*4)
			{
				MapData->doors[i].door_posn=0;
				mp1(currx,curry,currz)->block=0;
				mp1(currx,curry,currz)->block_here_bit=0;
				mp1(currx,curry,currz)->auxiliary=0;
				mp1(currx,curry,currz)->aux_here_bit=0;
			}
}

/******************************************************************************/
void find_lift(void)
{
	int i=0;

	for (i=0;i<32;i++)
		if (MapData->lifts[i].lift_posn==(currx+curry*MAP_DEPTH+currz*FLOOR_SIZE)*4)
                {
			picked_lift.lift_posn=MapData->lifts[i].lift_posn;
			picked_lift.lift_height=MapData->lifts[i].lift_height;
			picked_lift.lift_min_height=MapData->lifts[i].lift_min_height;
			picked_lift.lift_max_height=MapData->lifts[i].lift_max_height;
			picked_lift.lift_direction=MapData->lifts[i].lift_direction;
			picked_lift.lift_weight=MapData->lifts[i].lift_weight;
			picked_lift.lift_up=MapData->lifts[i].lift_up;
			picked_lift.lift_down=MapData->lifts[i].lift_down;
			picked_lift.lift_automove=MapData->lifts[i].lift_automove;
		}
}

/******************************************************************************/
ULONG locate_lift(target)
ULONG target;
{
	int i=0;

	for (i=0;i<32;i++)
		if (MapData->lifts[i].lift_posn==target)
			return((ULONG)(&MapData->lifts[i]));
	return(0);
}

/******************************************************************************/

void pick_block(void)
{
	ULONG picked_field_variant;

	copy_map_cell1(&picked_block,mp1(currx,curry,currz));
	copy_map_cell2(&picked_block2,mp2(currx,curry,currz));
	copy_map_cell3(&picked_block3,mp3(currx,curry,currz));
	redraw_cell_win();

	if ((picked_block.aux_here_bit)&&(picked_block.auxiliary==0))
		cur_mons=(picked_block2.egg_contents/4)+1;
	update_mons_window();

	if ( ((picked_block.panel_here_bit)&&((picked_block.panel==1)||(picked_block.panel==2))) || ( (picked_block.floor_here_bit)&&(picked_block.floor==1) ) )
	{
		picked_button_num=picked_block.variant;

		if ((picked_block.floor_here_bit)&&(picked_block.floor==1)&&(currz>0))
		{
			copy_map_cell1(&stone_block,mp1(currx,curry,currz-1));
			picked_button_num=stone_block.variant;
		}

		picked_button=&MapData->buttons[picked_button_num];
		picked_button_action_in=picked_button->button_action_in;
		picked_button_action_out=picked_button->button_action_out;
		if (picked_button->button_used) picked_button_target=picked_button->button_data_in;
		switch(picked_button_action_in)
		{
			case 1:
			case 2:
			case 3:
			case 4:
			case 5:
			case 6:
			case 7:
				picked_button_target=picked_button_target-((ULONG)(&MapData->map_part1)-(ULONG)(MapData));
				picked_button_target_z=picked_button_target/(FLOOR_SIZE*4);
				picked_button_target_y=(picked_button_target-picked_button_target_z*FLOOR_SIZE*4)/(MAP_DEPTH*4);
				picked_button_target_x=(picked_button_target-picked_button_target_z*FLOOR_SIZE*4-picked_button_target_y*MAP_WIDTH*4)/4;
                         	break;
                        case 9:
                        case 10:
                        case 11:
                        case 12:
				picked_button_target=MapData->lifts[((picked_button_target-((ULONG)(&MapData->lifts[0])-(ULONG)(MapData)))/sizeof(struct lift))].lift_posn;
				picked_button_target_z=picked_button_target/(FLOOR_SIZE*4);
				picked_button_target_y=(picked_button_target-picked_button_target_z*FLOOR_SIZE*4)/(MAP_DEPTH*4);
				picked_button_target_x=(picked_button_target-picked_button_target_z*FLOOR_SIZE*4-picked_button_target_y*MAP_WIDTH*4)/4;
                         	break;
                        case 14:
                        case 15:
                        case 16:
                        case 17:
                        case 18:
				picked_button_target=MapData->doors[(picked_button_target-((ULONG)(&MapData->doors[0])-(ULONG)(MapData)))/sizeof(struct door)].door_posn;
				picked_button_target_z=picked_button_target/(FLOOR_SIZE*4);
				picked_button_target_y=(picked_button_target-picked_button_target_z*FLOOR_SIZE*4)/(MAP_DEPTH*4);
				picked_button_target_x=(picked_button_target-picked_button_target_z*FLOOR_SIZE*4-picked_button_target_y*MAP_WIDTH*4)/4;
                         	break;
                        default:
				picked_button_target=0;
				picked_button_target_z=0;picked_button_target_y=0;picked_button_target_x=0;
                         	break;
		}
		redraw_level();
		redraw_button_win();
	}
	else
	{
		picked_button_action_in=0;
		picked_button_action_out=0;
		picked_button_target=0;
		redraw_button_win();
	}
	if ((picked_block.block_here_bit)&&(picked_block.block==6))
	{
		copy_map_cell3((struct map_cell3 *)&picked_field_variant,mp3(currx,curry,currz));
		picked_button_target=picked_field_variant;
		picked_button_target_z=picked_field_variant/(FLOOR_SIZE*4);
		picked_button_target_y=(picked_button_target-picked_button_target_z*FLOOR_SIZE*4)/(MAP_DEPTH*4);
		picked_button_target_x=(picked_button_target-picked_button_target_z*FLOOR_SIZE*4-picked_button_target_y*MAP_WIDTH*4)/4;
		redraw_level();
	}
	if ((picked_block.floor_here_bit)&&(picked_block.floor==2))
	{
		find_lift();
		redraw_lift_window();
	}
	if ((picked_block.block_here_bit)&&(picked_block.block>=20)&&(picked_block.block<=23))
	{
		get_door();
		redraw_door_window();
	}
}

/******************************************************************************/

void key_analysis(code)
USHORT code;
{
	switch(code)
	{
		case 0x0b:
			if (currz==0) currz=1;
 		        currz-=1;
			NewModifyProp(&LevelGadget,LevelWindow,NULL,AUTOKNOB|PROPNEWLOOK|FREEVERT,0,(19-currz)*3449,0,3449,1);
			redraw_level();
			picked_block3.sky_west=mp3(currx,curry,currz)->sky_west;
			picked_block3.sky_south=mp3(currx,curry,currz)->sky_south;
			picked_block3.sky_east=mp3(currx,curry,currz)->sky_east;
			picked_block3.sky_north=mp3(currx,curry,currz)->sky_north;
			redraw_cell_win();
			redraw_cursor();
			break;
		case 0x0c:
 		        currz+=1;
			if (currz>=MAP_HEIGHT) currz=MAP_HEIGHT-1;
			NewModifyProp(&LevelGadget,LevelWindow,NULL,AUTOKNOB|PROPNEWLOOK|FREEVERT,0,(19-currz)*3449,0,3449,1);
			redraw_level();
			picked_block3.sky_west=mp3(currx,curry,currz)->sky_west;
			picked_block3.sky_south=mp3(currx,curry,currz)->sky_south;
			picked_block3.sky_east=mp3(currx,curry,currz)->sky_east;
			picked_block3.sky_north=mp3(currx,curry,currz)->sky_north;
			redraw_cell_win();
			redraw_cursor();
			break;
		case 76:
			redraw_level_block();
			if (curry==0) curry=1;
 		        curry-=1;
			last_block_y=-1;
			redraw_cursor();
			picked_block3.sky_west=mp3(currx,curry,currz)->sky_west;
			picked_block3.sky_south=mp3(currx,curry,currz)->sky_south;
			picked_block3.sky_east=mp3(currx,curry,currz)->sky_east;
			picked_block3.sky_north=mp3(currx,curry,currz)->sky_north;
			redraw_cell_win();
			break;
		case 77:
			redraw_level_block();
 		        curry+=1;
			if (curry>=MAP_DEPTH) curry=MAP_DEPTH-1;
			last_block_y=-1;
			redraw_cursor();
			picked_block3.sky_west=mp3(currx,curry,currz)->sky_west;
			picked_block3.sky_south=mp3(currx,curry,currz)->sky_south;
			picked_block3.sky_east=mp3(currx,curry,currz)->sky_east;
			picked_block3.sky_north=mp3(currx,curry,currz)->sky_north;
			redraw_cell_win();
			break;
		case 78:
			redraw_level_block();
 		        currx+=1;
			if (currx>=MAP_WIDTH) currx=MAP_WIDTH-1;
			last_block_x=-1;
			redraw_cursor();
			picked_block3.sky_west=mp3(currx,curry,currz)->sky_west;
			picked_block3.sky_south=mp3(currx,curry,currz)->sky_south;
			picked_block3.sky_east=mp3(currx,curry,currz)->sky_east;
			picked_block3.sky_north=mp3(currx,curry,currz)->sky_north;
			redraw_cell_win();
			break;
		case 79:
			redraw_level_block();
			if (currx==0) currx=1;
 		        currx-=1;
			last_block_x=-1;
			redraw_cursor();
			picked_block3.sky_west=mp3(currx,curry,currz)->sky_west;
			picked_block3.sky_south=mp3(currx,curry,currz)->sky_south;
			picked_block3.sky_east=mp3(currx,curry,currz)->sky_east;
			picked_block3.sky_north=mp3(currx,curry,currz)->sky_north;
			redraw_cell_win();
			break;
		case 0x5f:
			show_help();
			break;
		case 0x40:
/*			if (os_version>-36)
			{
				if (HGeditScreen->ViewPort.RasInfo->RxOffset<320) HGeditScreen->ViewPort.RasInfo->RxOffset=320;
				else HGeditScreen->ViewPort.RasInfo->RxOffset=0;
				ScrollVPort(&(HGeditScreen->ViewPort));
			}
*/			break;
		case 0x01:
			current_tool=1;
			draw_gadget_border(ToolsWindow->RPort,DOWN,&ToolsPickGadget,-1);
			draw_gadget_border(ToolsWindow->RPort,UP,&ToolsSetAllGadget,-1);
			draw_gadget_border(ToolsWindow->RPort,UP,&ToolsSetBlockGadget,-1);
			draw_gadget_border(ToolsWindow->RPort,UP,&ToolsSetTargtGadget,-1);
			draw_gadget_border(ToolsWindow->RPort,UP,&ToolsSetWaterGadget,-1);
			ToolsSetAllGadget.Flags=ToolsSetAllGadget.Flags&(~SELECTED);
			ToolsSetBlockGadget.Flags=ToolsSetBlockGadget.Flags&(~SELECTED);
			ToolsSetTargtGadget.Flags=ToolsSetTargtGadget.Flags&(~SELECTED);
			ToolsSetWaterGadget.Flags=ToolsSetWaterGadget.Flags&(~SELECTED);
			break;
		case 0x02:
		{
			current_tool=2;
			draw_gadget_border(ToolsWindow->RPort,UP,&ToolsPickGadget,-1);
			draw_gadget_border(ToolsWindow->RPort,DOWN,&ToolsSetAllGadget,-1);
			draw_gadget_border(ToolsWindow->RPort,UP,&ToolsSetBlockGadget,-1);
			draw_gadget_border(ToolsWindow->RPort,UP,&ToolsSetTargtGadget,-1);
			draw_gadget_border(ToolsWindow->RPort,UP,&ToolsSetWaterGadget,-1);
			ToolsPickGadget.Flags=ToolsPickGadget.Flags&(~SELECTED);
			ToolsSetBlockGadget.Flags=ToolsSetBlockGadget.Flags&(~SELECTED);
			ToolsSetTargtGadget.Flags=ToolsSetTargtGadget.Flags&(~SELECTED);
			ToolsSetWaterGadget.Flags=ToolsSetWaterGadget.Flags&(~SELECTED);
			break;
		}
		case 0x03:
		{
			current_tool=3;
			draw_gadget_border(ToolsWindow->RPort,UP,&ToolsPickGadget,-1);
			draw_gadget_border(ToolsWindow->RPort,UP,&ToolsSetAllGadget,-1);
			draw_gadget_border(ToolsWindow->RPort,DOWN,&ToolsSetBlockGadget,-1);
			draw_gadget_border(ToolsWindow->RPort,UP,&ToolsSetTargtGadget,-1);
			draw_gadget_border(ToolsWindow->RPort,UP,&ToolsSetWaterGadget,-1);
			ToolsPickGadget.Flags=ToolsPickGadget.Flags&(~SELECTED);
			ToolsSetAllGadget.Flags=ToolsSetAllGadget.Flags&(~SELECTED);
			ToolsSetTargtGadget.Flags=ToolsSetTargtGadget.Flags&(~SELECTED);
			ToolsSetWaterGadget.Flags=ToolsSetWaterGadget.Flags&(~SELECTED);
			break;
		}
		case 0x04:
		{
			current_tool=5;
			draw_gadget_border(ToolsWindow->RPort,UP,&ToolsPickGadget,-1);
			draw_gadget_border(ToolsWindow->RPort,UP,&ToolsSetAllGadget,-1);
			draw_gadget_border(ToolsWindow->RPort,UP,&ToolsSetBlockGadget,-1);
			draw_gadget_border(ToolsWindow->RPort,UP,&ToolsSetTargtGadget,-1);
			draw_gadget_border(ToolsWindow->RPort,DOWN,&ToolsSetWaterGadget,-1);
			ToolsPickGadget.Flags=ToolsPickGadget.Flags&(~SELECTED);
			ToolsSetAllGadget.Flags=ToolsSetAllGadget.Flags&(~SELECTED);
			ToolsSetBlockGadget.Flags=ToolsSetBlockGadget.Flags&(~SELECTED);
			ToolsSetTargtGadget.Flags=ToolsSetTargtGadget.Flags&(~SELECTED);
			break;
		}
		case 0x05:
		{
			current_tool=4;
			draw_gadget_border(ToolsWindow->RPort,UP,&ToolsPickGadget,-1);
			draw_gadget_border(ToolsWindow->RPort,UP,&ToolsSetAllGadget,-1);
			draw_gadget_border(ToolsWindow->RPort,UP,&ToolsSetBlockGadget,-1);
			draw_gadget_border(ToolsWindow->RPort,DOWN,&ToolsSetTargtGadget,-1);
			draw_gadget_border(ToolsWindow->RPort,UP,&ToolsSetWaterGadget,-1);
			ToolsPickGadget.Flags=ToolsPickGadget.Flags&(~SELECTED);
			ToolsSetAllGadget.Flags=ToolsSetAllGadget.Flags&(~SELECTED);
			ToolsSetBlockGadget.Flags=ToolsSetBlockGadget.Flags&(~SELECTED);
			ToolsSetWaterGadget.Flags=ToolsSetWaterGadget.Flags&(~SELECTED);
			break;
		}
		case 0x37 :			/* m */
			ActivateWindow(MonsWindow);
			WindowToFront(MonsWindow);
			break;
		case 0x11 :			/* w */
			ActivateWindow(WorldWindow);
			WindowToFront(WorldWindow);
			break;
		case 0x14 :			/* t */
			ActivateWindow(InfoWindow);
			WindowToFront(InfoWindow);
			break;
		case 0x28 :			/* l */
			ActivateWindow(LevelWindow);
			WindowToFront(LevelWindow);
			break;
		default:
			break;
	}
}

/******************************************************************************/

void tools_analysis(message)
struct IntuiMessage *message;
{
	ULONG message_class;
	USHORT code;

	struct map_cell1 copyof_picked_block;
	struct map_cell2 copyof_picked_block2;
	struct map_cell3 copyof_picked_block3;

	struct Message *GetMsg();
	struct Gadget *GadgetPtr;
	USHORT GadgetID;

	LONG ix=0,iy=0,iz=0;
	LONG oldx,oldy,oldz;

	message_class=message->Class;
	GadgetPtr=(struct Gadget*)message->IAddress;
	code=message->Code;

	drawing=0;

	switch(message_class)
	{
		case GADGETDOWN:
			GadgetID=GadgetPtr->GadgetID;
			switch(GadgetID)
			{
				case 1:
				{
					if (current_tool==1) current_tool=0;
					else current_tool=1;
					redraw_tools_window();
					break;
				}
				case 2:
				{
					if (current_tool==2) current_tool=0;
					else current_tool=2;
					redraw_tools_window();
					break;
				}
				case 3:
				{
					if (current_tool==3) current_tool=0;
					else current_tool=3;
					redraw_tools_window();
					break;
				}
				case 4:
				{
					if (current_tool==4) current_tool=0;
					else current_tool=4;
					redraw_tools_window();
					break;
				}
				case 5:
				{
					if (current_tool==5) current_tool=0;
					else current_tool=5;
					redraw_tools_window();
					break;
				}
				case 6:
				{
					oldx=currx;
					oldy=curry;
					oldz=currz;
					for (currz=pastebz;currz<=pastetz;currz++)
						for (curry=pasteby;curry<=pastety;curry++)
							for (currx=pastebx;currx<=pastetx;currx++)
							{
								remove_button();
								remove_lift();
								remove_door();
								if ((add_button()) && (add_lift()) && (add_door()))
								{
									copy_map_cell1(mp1(currx,curry,currz),&picked_block);
									copy_map_cell2(mp2(currx,curry,currz),&picked_block2);
									copy_map_cell3(mp3(currx,curry,currz),&picked_block3);
								} else { currz=99; curry=99; currz=99; }
							}
					currx=oldx;
					curry=oldy;
					currz=oldz;
					if ((currz<=pastetz)&&(currz>=pastebz)) redraw_level();
					break;
				}
				case 7:
				{
					oldx=currx;
					oldy=curry;
					oldz=currz;
					copy_map_cell1(&copyof_picked_block,&picked_block);
					copy_map_cell2(&copyof_picked_block2,&picked_block2);
					copy_map_cell3(&copyof_picked_block3,&picked_block3);
					for (iz=pastebz;iz<=pastetz;iz++)
						for (iy=pasteby;iy<=pastety;iy++)
							for (ix=pastebx;ix<=pastetx;ix++)
							{
								currx=oldx+(ix-pastebx);
								curry=oldy+(iy-pasteby);
								currz=oldz+(iz-pastebz);
								if ( (currx>=0) && (currx<MAP_WIDTH) )
									if ( (curry>=0) && (curry<MAP_DEPTH) )
										if ( (currz>=0) && (currz<MAP_HEIGHT) )
										{
											remove_button();
											remove_lift();
											remove_door();
											copy_map_cell1(&picked_block,pb1(ix,iy,iz));
											copy_map_cell2(&picked_block2,pb2(ix,iy,iz));
											copy_map_cell3(&picked_block3,pb3(ix,iy,iz));
											if ((add_button()) && (add_lift()) && (add_door()))
											{
												copy_map_cell1(mp1(currx,curry,currz),pb1(ix,iy,iz));
												copy_map_cell2(mp2(currx,curry,currz),pb2(ix,iy,iz));
												copy_map_cell3(mp3(currx,curry,currz),pb3(ix,iy,iz));
											} else { iz=99; iy=99; iz=99; }
										}
							}
					copy_map_cell1(&picked_block,&copyof_picked_block);
					copy_map_cell2(&picked_block2,&copyof_picked_block2);
					copy_map_cell3(&picked_block3,&copyof_picked_block3);
					currx=oldx;
					curry=oldy;
					currz=oldz;
					redraw_level();
					changed=1;
					break;
				}
				case 8:
				{
					for (iz=pastebz;iz<=pastetz;iz++)
						for (iy=pasteby;iy<=pastety;iy++)
							for (ix=pastebx;ix<=pastetx;ix++)
							{
								copy_map_cell1(pb1(ix,iy,iz),mp1(ix,iy,iz));
								copy_map_cell2(pb2(ix,iy,iz),mp2(ix,iy,iz));
								copy_map_cell3(pb3(ix,iy,iz),mp3(ix,iy,iz));
							}
					break;
				}
				case 9:
				{
					oldx=currx;
					oldy=curry;
					oldz=currz;
					for (currz=pastebz;currz<=pastetz;currz++)
						for (curry=pasteby;curry<=pastety;curry++)
							for (currx=pastebx;currx<=pastetx;currx++)
							{
								remove_button();
								remove_lift();
								remove_door();
								copy_map_cell1(pb1(currx,curry,currz),mp1(currx,curry,currz));
								copy_map_cell2(pb2(currx,curry,currz),mp2(currx,curry,currz));
								copy_map_cell3(pb3(currx,curry,currz),mp3(currx,curry,currz));
								copy_map_cell1(mp1(currx,curry,currz),&empty_long);
								copy_map_cell2(mp2(currx,curry,currz),&empty_long2);
								copy_map_cell3(mp3(currx,curry,currz),&empty_long3);
							}
					currx=oldx;
					curry=oldy;
					currz=oldz;
					if ((currz<=pastetz)&&(currz>=pastebz)) redraw_level();
					changed=1;
					break;
				}
				case 10:
				{
					current_tool=0;
					redraw_tools_window();
					if (highlight_flag==1)
					{
						draw_gadget_border(ToolsWindow->RPort,UP,&ToolsHighlightGadget,-1);
						highlight_flag=0;
					}
					else
					{
						draw_gadget_border(ToolsWindow->RPort,DOWN,&ToolsHighlightGadget,-1);
						highlight_flag=1;
					}
					break;
				}
				default:
					break;
			}
			ReplyMsg((struct Message *)message);
			break;
		case MENUPICK:
			ReplyMsg((struct Message *)message);
			menu_analysis(code);
			break;
		case RAWKEY:
			ReplyMsg((struct Message *)message);
			key_analysis(code);
			break;
		default:
			ReplyMsg((struct Message *)message);
			break;
	}
}

/******************************************************************************/

void info_analysis(message)
struct IntuiMessage *message;
{
	ULONG message_class;
	USHORT code;

	struct Message *GetMsg();
	struct Gadget *GadgetPtr;
	int panelx,panely;

	message_class=message->Class;
	GadgetPtr=(struct Gadget*)message->IAddress;
	code=message->Code;

	drawing=0;

	switch(message_class)
	{
		case MOUSEBUTTONS:
			switch(code)
			{
				case SELECTUP:
					panely=(((message->MouseY)-(23-8-2))/66);
					panelx=((message->MouseX)-(17-2))/64;

					if ((panely>=0)&&(panely<=5)&&(panelx>=0)&&(panelx<=5)&&((panely*6+panelx)<=31))
					{
						picked_block.panel=0;
						picked_block.panel_here_bit=1;
						picked_block.variant=panely*6+panelx;
					}
					redraw_cell_win();
					break;
				default:
					break;
			}
			break;
		case MENUPICK:
			ReplyMsg((struct Message *)message);
			menu_analysis(code);
			break;
		case RAWKEY:
			ReplyMsg((struct Message *)message);
			key_analysis(code);
			break;
		default:
			ReplyMsg((struct Message *)message);
			break;
	}
}

/******************************************************************************/

void mons_analysis(message)
struct IntuiMessage *message;
{
	ULONG message_class;
	USHORT code;
	USHORT GadgetID;

	struct Message *GetMsg();
	struct Gadget *GadgetPtr;

	message_class=message->Class;
	GadgetPtr=(struct Gadget*)message->IAddress;
	code=message->Code;

	drawing=0;

	switch(message_class)
	{
		case GADGETDOWN:
			GadgetID=GadgetPtr->GadgetID;
			if ((GadgetID>=1)&&(GadgetID<=20))
			{
				cur_mons=GadgetID;
				update_mons_window();
			}
			else
			if ((GadgetID>=21)&&(GadgetID<=40))
			{
				if (worldmem->locn_mons1==GadgetID-20) worldmem->locn_mons1=0;
				else
					if (worldmem->locn_mons2==GadgetID-20) worldmem->locn_mons2=0;
					else
					if ((worldmem->locn_mons1>0)&&(worldmem->locn_mons2>0))
						SimpleRequest("Only 2 monsters can be loaded at one time! Deselect one first.");
					else
						if (worldmem->locn_mons1==0) worldmem->locn_mons1=GadgetID-20;
						else
							worldmem->locn_mons2=GadgetID-20;
				update_mons_window();
			}
			else
				switch(GadgetID)
				{
					case 41:
						if ((picked_block.aux_here_bit)&&(picked_block.auxiliary==0)&&(picked_block2.egg_contents==(cur_mons-1)*4))
						{
							picked_block.auxiliary=0;
							picked_block.aux_here_bit=0;
							picked_block2.egg_contents=0;
						}
						else
						{
							picked_block.auxiliary=0;
							picked_block.aux_here_bit=1;
							picked_block2.egg_contents=(cur_mons-1)*4;
						}
						update_mons_window();
						redraw_cell_win();
						break;
					case 42:
						if ((picked_block.aux_here_bit)&&(picked_block.auxiliary==0)&&(picked_block2.egg_contents==(cur_mons-1)*4+1))
						{
							picked_block.auxiliary=0;
							picked_block.aux_here_bit=0;
							picked_block2.egg_contents=0;
						}
						else
						{
							picked_block.auxiliary=0;
							picked_block.aux_here_bit=1;
							picked_block2.egg_contents=(cur_mons-1)*4+1;
						}
						update_mons_window();
						redraw_cell_win();
						break;
					case 43:
						if ((picked_block.aux_here_bit)&&(picked_block.auxiliary==0)&&(picked_block2.egg_contents==(cur_mons-1)*4+2))
						{
							picked_block.auxiliary=0;
							picked_block.aux_here_bit=0;
							picked_block2.egg_contents=0;
						}
						else
						{
							picked_block.auxiliary=0;
							picked_block.aux_here_bit=1;
							picked_block2.egg_contents=(cur_mons-1)*4+2;
						}
						update_mons_window();
						redraw_cell_win();
						break;
					case 44:
						if ((picked_block.aux_here_bit)&&(picked_block.auxiliary==0)&&(picked_block2.egg_contents==(cur_mons-1)*4+3))
						{
							picked_block.auxiliary=0;
							picked_block.aux_here_bit=0;
							picked_block2.egg_contents=0;
						}
						else
						{
							picked_block.auxiliary=0;
							picked_block.aux_here_bit=1;
							picked_block2.egg_contents=(cur_mons-1)*4+3;
						}
						update_mons_window();
						redraw_cell_win();
						break;
					default:
						break;
				}
			ReplyMsg((struct Message *)message);
			break;
		case MENUPICK:
			ReplyMsg((struct Message *)message);
			menu_analysis(code);
			break;
		case RAWKEY:
			ReplyMsg((struct Message *)message);
			key_analysis(code);
			break;
		default:
			ReplyMsg((struct Message *)message);
			break;
	}
}

/******************************************************************************/

void world_analysis(message)
struct IntuiMessage *message;
{
	ULONG message_class;
	USHORT code;

	struct Message *GetMsg();
	struct Gadget *GadgetPtr;
	USHORT GadgetID;

	message_class=message->Class;
	GadgetPtr=(struct Gadget*)message->IAddress;
	code=message->Code;

	drawing=0;

	switch(message_class)
	{
		case GADGETDOWN:
			GadgetID=GadgetPtr->GadgetID;
			switch(GadgetID)
			{
				case 1:
					worldmem->locn_type_flag=0;
					redraw_world_window();
					break;
				case 2:
					worldmem->locn_type_flag=1;
					redraw_world_window();
					break;
				case 3:
					worldmem->locn_type_flag=2;
					redraw_world_window();
					break;
				case 4:
					worldmem->locn_type_flag=3;
					redraw_world_window();
					break;
				case 5:
					worldmem->locn_x1=(message->MouseX-21)/128;
					worldmem->locn_x2=((message->MouseX-21)*2)-(worldmem->locn_x1*256);
					worldmem->locn_y1=(message->MouseY-31)/128;
					worldmem->locn_y2=((message->MouseY-31)*2)-(worldmem->locn_y1*256);
					redraw_world_window();
					break;
				default:
					break;
			}
			ReplyMsg((struct Message *)message);
			break;
		case GADGETUP:
			GadgetID=GadgetPtr->GadgetID;
			switch(GadgetID)
			{
				case 6:
					if (World6Info.LongInt<0)
                                        {
						SimpleRequest("Out of range");
						itoa2(0,World6Buffer);
						World6Info.LongInt=0;
                                                redraw_world_window();
					}
					else
					{
						worldmem->locn_disk=World6Info.LongInt;
						changed=1;
						redraw_world_window();
					}
					break;
				case 7:
					if (World7Info.LongInt<0)
                                        {
						SimpleRequest("Out of range");
						itoa2(0,World7Buffer);
						World7Info.LongInt=0;
                                                redraw_world_window();
					}
					else
					{
						worldmem->locn_map_num=World7Info.LongInt;
						changed=1;
						redraw_world_window();
					}
					break;
				case 8:
					if ((World8Info.LongInt>14)||(World8Info.LongInt<0))
                                        {
						SimpleRequest("Out of range");
						itoa2(0,World8Buffer);
						World8Info.LongInt=0;
                                                redraw_world_window();
					}
					else
					{
						worldmem->locn_picture_num=World8Info.LongInt;
						changed=1;
						redraw_world_window();
					}
					break;
				case 9:
					if ((World9Info.LongInt>6)||(World9Info.LongInt<0))
                                        {
						SimpleRequest("Out of range");
						itoa2(0,World9Buffer);
						World9Info.LongInt=0;
                                                redraw_world_window();
					}
					else
					{
						worldmem->locn_music_num=World9Info.LongInt;
						changed=1;
						redraw_world_window();
					}
					break;
				case 10:
					if ((World10Info.LongInt>7)||(World10Info.LongInt<0))
                                        {
						SimpleRequest("Out of range");
						itoa2(0,World10Buffer);
						World10Info.LongInt=0;
                                                redraw_world_window();
					}
					else
					{
						worldmem->locn_atmos=World10Info.LongInt;
						changed=1;
						redraw_world_window();
					}
					break;
				case 13:
					if ((World13Info.LongInt>4)||(World13Info.LongInt<0))
                                        {
						SimpleRequest("Out of range");
						itoa2(0,World13Buffer);
						World13Info.LongInt=0;
                                                redraw_world_window();
					}
					else
					{
						worldmem->locn_sky=World13Info.LongInt;
						changed=1;
						redraw_world_window();
					}
					break;
				case 14:
					if ((World14Info.LongInt>5)||(World14Info.LongInt<1))
                                        {
						SimpleRequest("Out of range");
						itoa2(0,World14Buffer);
						World14Info.LongInt=0;
                                                redraw_world_window();
					}
					else
					{
						worldmem->locn_style=World14Info.LongInt-1;
						changed=1;
						redraw_world_window();
					}
					break;
				case 23:
					if (World23Info.LongInt<0)
                                        {
						SimpleRequest("Out of range");
						itoa2(0,World23Buffer);
						World23Info.LongInt=0;
                                                redraw_world_window();
					}
					else
					{
						worldmem->locn_destinations[0]=World23Info.LongInt;
						changed=1;
						redraw_world_window();
					}
					break;
				case 24:
					if (World24Info.LongInt<0)
                                        {
						SimpleRequest("Out of range");
						itoa2(0,World24Buffer);
						World24Info.LongInt=0;
                                                redraw_world_window();
					}
					else
					{
						worldmem->locn_destinations[1]=World24Info.LongInt;
						changed=1;
						redraw_world_window();
					}
					break;
				case 25:
					if (World25Info.LongInt<0)
                                        {
						SimpleRequest("Out of range");
						itoa2(0,World25Buffer);
						World25Info.LongInt=0;
                                                redraw_world_window();
					}
					else
					{
						worldmem->locn_destinations[2]=World25Info.LongInt;
						changed=1;
						redraw_world_window();
					}
					break;
				case 26:
					if (World26Info.LongInt<0)
                                        {
						SimpleRequest("Out of range");
						itoa2(0,World26Buffer);
						World26Info.LongInt=0;
                                                redraw_world_window();
					}
					else
					{
						worldmem->locn_destinations[3]=World26Info.LongInt;
						changed=1;
						redraw_world_window();
					}
					break;
				case 27:
					if ((World14bInfo.LongInt>4)||(World14bInfo.LongInt<0))
                                        {
						SimpleRequest("Out of range");
						itoa2(0,World14bBuffer);
						World14bInfo.LongInt=0;
                                                redraw_world_window();
					}
					else
					{
						worldmem->locn_players=World14bInfo.LongInt;
						changed=1;
						redraw_world_window();
					}
					break;
				default:
					break;
			}
			ReplyMsg((struct Message *)message);
			break;
		case MENUPICK:
			ReplyMsg((struct Message *)message);
			menu_analysis(code);
			break;
		case RAWKEY:
			ReplyMsg((struct Message *)message);
			key_analysis(code);
			break;
		default:
			ReplyMsg((struct Message *)message);
			break;
	}
}

/******************************************************************************/

void level_analysis(message)
struct IntuiMessage *message;
{
	ULONG message_class;
	USHORT code;

	struct Message *GetMsg();
	struct Gadget *GadgetPtr;

	message_class=message->Class;
	GadgetPtr=(struct Gadget*)message->IAddress;
	code=message->Code;

	switch(message_class)
	{
		case GADGETUP:
			if ((19-LevelProp.VertPot/3449)!=currz)
			{
				currz=19-LevelProp.VertPot/3449;
				redraw_level();
				redraw_cursor();
			}
			break;
		case MOUSEBUTTONS:
			switch(code)
			{
				case SELECTDOWN:
					drawing=1;
					break;
				case SELECTUP:
                                        last_block_x=-1;
                                        last_block_y=-1;
					drawing=0;
					break;
				case MENUDOWN:
					drawing=2;
					break;
				case MENUUP:
                                        last_block_x=-1;
                                        last_block_y=-1;
					drawing=0;
					break;
				default:
					break;
			}
			ReplyMsg((struct Message *)message);
			break;
		case RAWKEY:
			ReplyMsg((struct Message *)message);
			key_analysis(code);
			break;
		default:
			ReplyMsg((struct Message *)message);
			break;
	}
}

/******************************************************************************/

void map_analysis(message)
struct IntuiMessage *message;
{
	ULONG message_class;
	USHORT code;

	struct Message *GetMsg();
	struct Gadget *GadgetPtr;
	USHORT GadgetID;

	message_class=message->Class;
	GadgetPtr=(struct Gadget*)message->IAddress;
	code=message->Code;

	drawing=0;

	switch(message_class)
	{
		case RAWKEY:
			ReplyMsg((struct Message *)message);
			key_analysis(code);
			break;
		case MENUPICK:
			ReplyMsg((struct Message *)message);
			menu_analysis(code);
			break;
		case GADGETUP:
			GadgetID=GadgetPtr->GadgetID;
			switch(GadgetID)
			{
				case 1:
					changed=1;
					break;
				case 2:
					if ((Pl1XInfo.LongInt>MAP_WIDTH-1)||(Pl1XInfo.LongInt<0))
                                        {
						SimpleRequest("Out of range");
						itoa2(0,Pl1XBuffer);
						Pl1XInfo.LongInt=0;
                                                redraw_map_window();
					}
					else
					{
						MapData->pl1x=Pl1XInfo.LongInt;
						changed=1;
						redraw_level();
					}
					break;
				case 3:
					if ((Pl1YInfo.LongInt>MAP_DEPTH-1)||(Pl1YInfo.LongInt<0))
                                        {
						SimpleRequest("Out of range");
						itoa2(0,Pl1YBuffer);
						Pl1YInfo.LongInt=0;
                                                redraw_map_window();
					}
					else
					{
						MapData->pl1y=Pl1YInfo.LongInt;
						changed=1;
						redraw_level();
					}
					break;
				case 4:
					if ((Pl1ZInfo.LongInt>MAP_HEIGHT-1)||(Pl1ZInfo.LongInt<0))
                                        {
						SimpleRequest("Out of range");
						itoa2(0,Pl1ZBuffer);
						Pl1ZInfo.LongInt=0;
                                                redraw_map_window();
					}
					else
					{
						MapData->pl1z=Pl1ZInfo.LongInt;
						changed=1;
						redraw_level();
					}
					break;
				case 5:
					if ((Pl2XInfo.LongInt>MAP_WIDTH-1)||(Pl2XInfo.LongInt<0))
                                        {
						SimpleRequest("Out of range");
						itoa2(0,Pl2XBuffer);
						Pl2XInfo.LongInt=0;
                                                redraw_map_window();
					}
					else
					{
						MapData->pl2x=Pl2XInfo.LongInt;
						changed=1;
						redraw_level();
					}
					break;
				case 6:
					if ((Pl2YInfo.LongInt>MAP_DEPTH-1)||(Pl2YInfo.LongInt<0))
                                        {
						SimpleRequest("Out of range");
						itoa2(0,Pl2YBuffer);
						Pl2YInfo.LongInt=0;
                                                redraw_map_window();
					}
					else
					{
						MapData->pl2y=Pl2YInfo.LongInt;
						changed=1;
						redraw_level();
					}
					break;
				case 7:
					if ((Pl2ZInfo.LongInt>MAP_HEIGHT-1)||(Pl2ZInfo.LongInt<0))
                                        {
						SimpleRequest("Out of range");
						itoa2(0,Pl2ZBuffer);
						Pl2ZInfo.LongInt=0;
                                                redraw_map_window();
					}
					else
					{
						MapData->pl2z=Pl2ZInfo.LongInt;
						changed=1;
						redraw_level();
					}
					break;
				case 8:
					if ((Pl4XInfo.LongInt>MAP_WIDTH-1)||(Pl4XInfo.LongInt<0))
                                        {
						SimpleRequest("Out of range");
						itoa2(0,Pl4XBuffer);
						Pl4XInfo.LongInt=0;
                                                redraw_map_window();
					}
					else
					{
						MapData->pl3x=Pl4XInfo.LongInt;
						changed=1;
						redraw_level();
					}
					break;
				case 9:
					if ((Pl4YInfo.LongInt>MAP_DEPTH-1)||(Pl4YInfo.LongInt<0))
                                        {
						SimpleRequest("Out of range");
						itoa2(0,Pl4YBuffer);
						Pl4YInfo.LongInt=0;
                                                redraw_map_window();
					}
					else
					{
						MapData->pl4y=Pl4YInfo.LongInt;
						changed=1;
						redraw_level();
					}
					break;
				case 10:
					if ((Pl4ZInfo.LongInt>MAP_HEIGHT-1)||(Pl4ZInfo.LongInt<0))
                                        {
						SimpleRequest("Out of range");
						itoa2(0,Pl4ZBuffer);
						Pl4ZInfo.LongInt=0;
                                                redraw_map_window();
					}
					else
					{
						MapData->pl4z=Pl4ZInfo.LongInt;
						changed=1;
						redraw_level();
					}
					break;
				case 11:
					if ((Pl3XInfo.LongInt>MAP_WIDTH-1)||(Pl3XInfo.LongInt<0))
                                        {
						SimpleRequest("Out of range");
						itoa2(0,Pl3XBuffer);
						Pl3XInfo.LongInt=0;
                                                redraw_map_window();
					}
					else
					{
						MapData->pl3x=Pl3XInfo.LongInt;
						changed=1;
						redraw_level();
					}
					break;
				case 12:
					if ((Pl3YInfo.LongInt>MAP_DEPTH-1)||(Pl3YInfo.LongInt<0))
                                        {
						SimpleRequest("Out of range");
						itoa2(0,Pl3YBuffer);
						Pl3YInfo.LongInt=0;
                                                redraw_map_window();
					}
					else
					{
						MapData->pl3y=Pl3YInfo.LongInt;
						changed=1;
						redraw_level();
					}
					break;
				case 13:
					if ((Pl3ZInfo.LongInt>MAP_HEIGHT-1)||(Pl3ZInfo.LongInt<0))
                                        {
						SimpleRequest("Out of range");
						itoa2(0,Pl3ZBuffer);
						Pl3ZInfo.LongInt=0;
                                                redraw_map_window();
					}
					else
					{
						MapData->pl3z=Pl3ZInfo.LongInt;
						changed=1;
						redraw_level();
					}
					break;
				case 14:
					if (WaterMinInfo.LongInt<0)
                                        {
						SimpleRequest("Out of range");
						itoa2(0,WaterMinBuffer);
						WaterMinInfo.LongInt=0;
                                                redraw_map_window();
					}
					else
					{
						MapData->low_water_level=WaterMinInfo.LongInt;
						changed=1;
					}
					break;
				case 15:
					if (WaterMaxInfo.LongInt<0)
                                        {
						SimpleRequest("Out of range");
						itoa2(0,WaterMaxBuffer);
						WaterMaxInfo.LongInt=0;
                                                redraw_map_window();
					}
					else
					{
						MapData->hi_water_level=WaterMaxInfo.LongInt;
						changed=1;
					}
					break;
				case 16:
					if (WaterSpeedInfo.LongInt<0)
                                        {
						SimpleRequest("Out of range");
						itoa2(0,WaterSpeedBuffer);
						WaterSpeedInfo.LongInt=0;
                                                redraw_map_window();
					}
					else
					{
						MapData->water_speed=WaterSpeedInfo.LongInt;
						changed=1;
					}
					break;
				case 18:
					if ((TimeInfo.LongInt<0)||(TimeInfo.LongInt>99))
                                        {
						SimpleRequest("Out of range");
						itoa2(0,TimeBuffer);
						TimeInfo.LongInt=0;
                                                redraw_map_window();
					}
					else
					{
						MapData->time_limit=TimeInfo.LongInt;
						changed=1;
					}
					break;
				case 19:
                                	if (currz>0)
					{
						currz--;
						NewModifyProp(&LevelGadget,LevelWindow,NULL,AUTOKNOB|PROPNEWLOOK|FREEVERT,0,(19-currz)*3449,0,3449,1);
						redraw_level();
					}
					break;
				case 20:
                                	if (currz<(MAP_HEIGHT-1))
					{
						currz++;
						NewModifyProp(&LevelGadget,LevelWindow,NULL,AUTOKNOB|PROPNEWLOOK|FREEVERT,0,65535-(currz*3449),0,3449,1);
						redraw_level();
					}
					break;
				case 21:
					if (current_tool==6) current_tool=0;
					else current_tool=6;
					redraw_tools_window();
					redraw_map_window();
					break;
				case 22:
					if (current_tool==7) current_tool=0;
					else current_tool=7;
					redraw_tools_window();
					redraw_map_window();
					break;
				case 23:
					if (current_tool==8) current_tool=0;
					else current_tool=8;
					redraw_tools_window();
					redraw_map_window();
					break;
				case 24:
					if (current_tool==9) current_tool=0;
					else current_tool=9;
					redraw_tools_window();
					redraw_map_window();
					break;
				default:
					break;
			}
			ReplyMsg((struct Message *)message);
			break;
		default:
			ReplyMsg((struct Message *)message);
			break;
	}
}

/******************************************************************************/

void fill_sky(void)
{
        LONG ix=0,iy=0,iz=0;

	for (iz=pastebz;iz<=pastetz;iz++)
		for (iy=pasteby;iy<=pastety;iy++)
			for (ix=pastebx;ix<=pastetx;ix++)
			{
				mp3(ix,iy,iz)->sky_north=picked_block3.sky_north;
				mp3(ix,iy,iz)->sky_east=picked_block3.sky_east;
				mp3(ix,iy,iz)->sky_south=picked_block3.sky_south;
				mp3(ix,iy,iz)->sky_west=picked_block3.sky_west;
			}
}

/******************************************************************************/

void cell_analysis(message)
struct IntuiMessage *message;
{
	ULONG message_class;
	USHORT code;

	struct Message *GetMsg();
	struct Gadget *GadgetPtr;
	USHORT GadgetID;

	message_class=message->Class;
	GadgetPtr=(struct Gadget*)message->IAddress;
	code=message->Code;

	drawing=0;

	switch(message_class)
	{
		case RAWKEY:
			ReplyMsg((struct Message *)message);
			key_analysis(code);
			break;
		case MENUPICK:
			ReplyMsg((struct Message *)message);
			menu_analysis(code);
			break;
		case GADGETDOWN:
			GadgetID=GadgetPtr->GadgetID;
			switch(GadgetID)
			{
				case 7:
					if (picked_block.pushable_bit)
					{
						draw_gadget_border(CellWindow->RPort,UP,&CellPushableGadget,-1);
						picked_block.pushable_bit=0;
					}
					else
					{
						draw_gadget_border(CellWindow->RPort,DOWN,&CellPushableGadget,-1);
						picked_block.pushable_bit=1;
					}
					break;
				case 8:
					if (picked_block.opaque_bit)
					{
						draw_gadget_border(CellWindow->RPort,UP,&CellOpaqueGadget,-1);
						picked_block.opaque_bit=0;
					}
					else
					{
						draw_gadget_border(CellWindow->RPort,DOWN,&CellOpaqueGadget,-1);
						picked_block.opaque_bit=1;
					}
					break;
				case 11:
					if (picked_block2.flowing_bit)
					{
						draw_gadget_border(CellWindow->RPort,UP,&CellFlowingGadget,-1);
						picked_block2.flowing_bit=0;
					}
					else
					{
						draw_gadget_border(CellWindow->RPort,DOWN,&CellFlowingGadget,-1);
						picked_block2.flowing_bit=1;
					}
					break;
				case 32:
					if (picked_block.invisible_bit)
					{
						draw_gadget_border(CellWindow->RPort,UP,&CellInvisGadget,-1);
						picked_block.invisible_bit=0;
					}
					else
					{
						draw_gadget_border(CellWindow->RPort,DOWN,&CellInvisGadget,-1);
						picked_block.invisible_bit=1;
					}
					break;
				default:
					break;
			}
			ReplyMsg((struct Message *)message);
			break;
		case GADGETUP:
			GadgetID=GadgetPtr->GadgetID;
			switch(GadgetID)
			{
				case 1:
					if (picked_block.block==0) picked_block.block_here_bit=0;
					else picked_block.block--;
					if (picked_block.block==15) picked_block.block=7;
					if ((picked_block.block_here_bit)&&(picked_block.block<2))
						picked_block.opaque_bit=1;
					else
						picked_block.opaque_bit=0;
					if ((picked_block.block_here_bit)&&(picked_block.block==1))
						picked_block.pushable_bit=1;
					else
						picked_block.pushable_bit=0;
					redraw_cell_win();
					break;
				case 2:
					if (picked_block.block_here_bit==0)
						picked_block.block_here_bit=1;
					else if (picked_block.block<MAX_BLOCKS-1)
					{
						picked_block.block++;
						picked_block.block_here_bit=1;
					}
					if (picked_block.block==8) picked_block.block=16;
					if ((picked_block.block_here_bit)&&(picked_block.block<2))
						picked_block.opaque_bit=1;
					else
						picked_block.opaque_bit=0;
					if ((picked_block.block_here_bit)&&(picked_block.block==1))
						picked_block.pushable_bit=1;
					else
						picked_block.pushable_bit=0;
					redraw_cell_win();
					break;
				case 3:
					if (picked_block.floor==0) picked_block.floor_here_bit=0;
					else picked_block.floor--;
					redraw_cell_win();
					break;
				case 4:
					if (picked_block.floor_here_bit==0)
						picked_block.floor_here_bit=1;
					else if (picked_block.floor<MAX_FLOORS-1)
					{
						picked_block.floor++;
						picked_block.floor_here_bit=1;
					}
					redraw_cell_win();
					break;
				case 5:
					if (picked_block.panel==0) picked_block.panel_here_bit=0;
					else picked_block.panel--;
					redraw_cell_win();
					break;
				case 6:
					if (picked_block.panel_here_bit==0)
						picked_block.panel_here_bit=1;
					else if (picked_block.panel<MAX_PANELS-1)
					{
						picked_block.panel++;
						picked_block.panel_here_bit=1;
					}
					redraw_cell_win();
					break;
				case 9:
					if (picked_block.water==0) picked_block.water_here_bit=0;
					else picked_block.water--;
					redraw_cell_win();
					break;
				case 10:
					if (picked_block.water_here_bit==0)
						picked_block.water_here_bit=1;
					else if (picked_block.water<3)
					{
						picked_block.water++;
						picked_block.water_here_bit=1;
					}
					redraw_cell_win();
					break;
				case 12:
					if (picked_block.explosion==0) picked_block.explosion_here_bit=0;
					else picked_block.explosion--;
					redraw_cell_win();
					break;
				case 13:
					if (picked_block.explosion_here_bit==0)
						picked_block.explosion_here_bit=1;
					else if (picked_block.explosion<3)
					{
						picked_block.explosion++;
						picked_block.explosion_here_bit=1;
					}
					redraw_cell_win();
					break;
				case 14:
					if (picked_block.variant>0) picked_block.variant--;
					redraw_cell_win();
					break;
				case 15:
					if (picked_block.variant<31) picked_block.variant++;
					redraw_cell_win();
					break;
				case 16:
					if (picked_block.auxiliary==0) picked_block.aux_here_bit=0;
					else picked_block.auxiliary--;
					if (picked_block.auxiliary==7) picked_block.auxiliary=6;
					redraw_cell_win();
					update_mons_window();
					break;
				case 17:
					if (picked_block.aux_here_bit==0)
						picked_block.aux_here_bit=1;
					else if (picked_block.auxiliary<MAX_AUX-1)
					{
						picked_block.auxiliary++;
						picked_block.aux_here_bit=1;
					}
					if (picked_block.auxiliary==7) picked_block.auxiliary=8;
					redraw_cell_win();
					update_mons_window();
					break;
/*				case 18:
					if (EggContentsInfo.LongInt>255)
					{
						SimpleRequest("Maximum is 255");
						itoa2(0,EggContentsBuffer);
						EggContentsInfo.LongInt=0;
					}
					else
						picked_block2.egg_contents=EggContentsInfo.LongInt;
					break;
*/				case 19:
					if (EggHatchInfo.LongInt>4095)
					{
						SimpleRequest("Maximum is 4095");
						itoa2(0,EggHatchBuffer);
						EggHatchInfo.LongInt=0;
					}
					else
						picked_block2.egg_hatch=EggHatchInfo.LongInt;
					break;
				case 21:
					if (ItemAmmoInfo.LongInt>255)
					{
						SimpleRequest("Maximum is 255");
						itoa2(0,ItemAmmoBuffer);
						ItemAmmoInfo.LongInt=0;
					}
					else
						picked_block3.item_ammo=ItemAmmoInfo.LongInt;
					break;
				case 22:
					if (ItemDamageInfo.LongInt>255)
					{
						SimpleRequest("Maximum is 255");
						itoa2(0,ItemDamageBuffer);
						ItemDamageInfo.LongInt=0;
					}
					else
						picked_block3.item_damage=ItemDamageInfo.LongInt;
					break;
				case 23:
					if (ItemTypeInfo.LongInt>NUM_ITEMS)
					{
						SimpleRequest("Maximum is 113");
						itoa2(0,ItemTypeBuffer);
						ItemTypeInfo.LongInt=0;
					}
					else
						if (ItemTypeInfo.LongInt)
						{
							picked_block.aux_here_bit=1;
							picked_block.auxiliary=item_containers[ItemTypeInfo.LongInt-1];
							picked_block3.item_ammo=item_defaultammo[ItemTypeInfo.LongInt-1];
						}
						picked_block3.item_type=ItemTypeInfo.LongInt;
						redraw_cell_win();
					break;
				case 24:
					if (picked_block3.sky_north==0) picked_block3.sky_north=1;
					else picked_block3.sky_north=0;
					if (picked_block3.sky_north) draw_gadget_border(CellWindow->RPort,DOWN,&CellSkyNorthGadget,-1);
					else draw_gadget_border(CellWindow->RPort,UP,&CellSkyNorthGadget,-1);
					copy_map_cell3(mp3(currx,curry,currz),&picked_block3);
					changed=1;
					break;
				case 25:
					if (picked_block3.sky_east==0) picked_block3.sky_east=1;
					else picked_block3.sky_east=0;
					if (picked_block3.sky_east) draw_gadget_border(CellWindow->RPort,DOWN,&CellSkyEastGadget,-1);
					else draw_gadget_border(CellWindow->RPort,UP,&CellSkyEastGadget,-1);
					copy_map_cell3(mp3(currx,curry,currz),&picked_block3);
					changed=1;
					break;
				case 26:
					if (picked_block3.sky_south==0) picked_block3.sky_south=1;
					else picked_block3.sky_south=0;
					if (picked_block3.sky_south) draw_gadget_border(CellWindow->RPort,DOWN,&CellSkySouthGadget,-1);
					else draw_gadget_border(CellWindow->RPort,UP,&CellSkySouthGadget,-1);
					copy_map_cell3(mp3(currx,curry,currz),&picked_block3);
					changed=1;
					break;
				case 27:
					if (picked_block3.sky_west==0) picked_block3.sky_west=1;
					else picked_block3.sky_west=0;
					if (picked_block3.sky_west) draw_gadget_border(CellWindow->RPort,DOWN,&CellSkyWestGadget,-1);
					else draw_gadget_border(CellWindow->RPort,UP,&CellSkyWestGadget,-1);
					copy_map_cell3(mp3(currx,curry,currz),&picked_block3);
					changed=1;
					break;
				case 28:
					fill_sky();
					redraw_cell_win();
					break;
				case 30:
					if (picked_block3.no_egg==0) picked_block3.no_egg=1;
					else picked_block3.no_egg=0;
					if (picked_block3.no_egg) draw_gadget_border(CellWindow->RPort,DOWN,&CellNoEggGadget,-1);
					else draw_gadget_border(CellWindow->RPort,UP,&CellNoEggGadget,-1);
/*					copy_map_cell3(mp3(currx,curry,currz),&picked_block3);*/
					changed=1;
					break;
				case 31:
					if (picked_block3.no_monster==0) picked_block3.no_monster=1;
					else picked_block3.no_monster=0;
					if (picked_block3.no_monster) draw_gadget_border(CellWindow->RPort,DOWN,&CellNoMonGadget,-1);
					else draw_gadget_border(CellWindow->RPort,UP,&CellNoMonGadget,-1);
/*					copy_map_cell3(mp3(currx,curry,currz),&picked_block3);*/
					changed=1;
					break;
				default:
					break;
			}
			ReplyMsg((struct Message *)message);
			break;
		default:
			ReplyMsg((struct Message *)message);
			break;
	}
}

/******************************************************************************/

void button_analysis(message)
struct IntuiMessage *message;
{
	ULONG message_class;
	USHORT code;

	struct Message *GetMsg();
	struct Gadget *GadgetPtr;
	USHORT GadgetID;

	message_class=message->Class;
	GadgetPtr=(struct Gadget*)message->IAddress;
	code=message->Code;

	switch(message_class)
	{
		case RAWKEY:
			ReplyMsg((struct Message *)message);
			key_analysis(code);
			break;
		case MENUPICK:
			ReplyMsg((struct Message *)message);
			menu_analysis(code);
			break;
		case GADGETDOWN:
			GadgetID=GadgetPtr->GadgetID;
			if ((GadgetID>0)&&(GadgetID<20)) picked_button_action_in=GadgetID-1;
			if ((GadgetID>19)&&(GadgetID<39)) picked_button_action_out=GadgetID-20;
			redraw_button_win();
			ReplyMsg((struct Message *)message);
			break;
		default:
			ReplyMsg((struct Message *)message);
			break;
	}
}

/******************************************************************************/

void lift_analysis(message)
struct IntuiMessage *message;
{
	ULONG message_class;
	USHORT code;

	struct Message *GetMsg();
	struct Gadget *GadgetPtr;
	USHORT GadgetID;

	message_class=message->Class;
	GadgetPtr=(struct Gadget*)message->IAddress;
	code=message->Code;

	switch(message_class)
	{
		case RAWKEY:
			ReplyMsg((struct Message *)message);
			key_analysis(code);
			break;
		case MENUPICK:
			ReplyMsg((struct Message *)message);
			menu_analysis(code);
			break;
		case GADGETDOWN:
			GadgetID=GadgetPtr->GadgetID;
			switch(GadgetID)
			{
                                case 4:
					if (picked_lift.lift_weight) picked_lift.lift_weight=0;
					else picked_lift.lift_weight=1;
					redraw_lift_window();
					break;
				case 5:
					picked_lift.lift_direction=0;
					redraw_lift_window();
					break;
				case 6:
					picked_lift.lift_direction=1;
                                        redraw_lift_window();
                                        break;
				case 7:
					picked_lift.lift_direction=2;
                                        redraw_lift_window();
                                        break;
				case 8:
					picked_lift.lift_up=0;
                                        redraw_lift_window();
                                        break;
				case 10:
					picked_lift.lift_up=2;
                                        redraw_lift_window();
                                        break;
				case 11:
					picked_lift.lift_down=0;
                                        redraw_lift_window();
                                        break;
				case 12:
					picked_lift.lift_down=1;
                                        redraw_lift_window();
                                        break;
				case 14:
					if (picked_lift.lift_automove==1) picked_lift.lift_automove=0;
					else picked_lift.lift_automove=1;
                                        redraw_lift_window();
                                        break;
				case 15:
					if (picked_lift.lift_automove==2) picked_lift.lift_automove=0;
					else picked_lift.lift_automove=2;
                                        redraw_lift_window();
                                        break;
				case 16:
					if (picked_lift.lift_automove==3) picked_lift.lift_automove=0;
					else picked_lift.lift_automove=3;
                                        redraw_lift_window();
                                        break;
				default:
					break;
			}
			ReplyMsg((struct Message *)message);
			break;
		case GADGETUP:
			GadgetID=GadgetPtr->GadgetID;
			switch(GadgetID)
			{
				case 1:
					picked_lift.lift_min_height=Lift1Info.LongInt;
					break;
				case 2:
					picked_lift.lift_max_height=Lift2Info.LongInt;
					break;
				default:
					break;
			}
			ReplyMsg((struct Message *)message);
			break;
		default:
			ReplyMsg((struct Message *)message);
			break;
	}
}

/******************************************************************************/

void door_analysis(message)
struct IntuiMessage *message;
{
	ULONG message_class;
	USHORT code;

	struct Message *GetMsg();
	struct Gadget *GadgetPtr;
	USHORT GadgetID;

	message_class=message->Class;
	GadgetPtr=(struct Gadget*)message->IAddress;
	code=message->Code;

	switch(message_class)
	{
		case RAWKEY:
			ReplyMsg((struct Message *)message);
			key_analysis(code);
			break;
		case MENUPICK:
			ReplyMsg((struct Message *)message);
			menu_analysis(code);
			break;
		case GADGETDOWN:
			GadgetID=GadgetPtr->GadgetID;
			switch(GadgetID)
			{
                                case 3:
					if (picked_door.door_direction>0) picked_door.door_direction=0;
					else picked_door.door_direction=3;
					redraw_door_window();
					break;
                                case 4:
					if (picked_door.door_button_only==-1) picked_door.door_button_only=0;
					else picked_door.door_button_only=-1;
					redraw_door_window();
					break;
				default:
					break;
			}
			ReplyMsg((struct Message *)message);
			break;
		case GADGETUP:
			GadgetID=GadgetPtr->GadgetID;
			switch(GadgetID)
			{
				case 1:
					picked_door.door_delay=Door1Info.LongInt;
					break;
				case 2:
					picked_door.door_key=Door2Info.LongInt;
					break;
				default:
					break;
			}
			ReplyMsg((struct Message *)message);
			break;
		default:
			ReplyMsg((struct Message *)message);
			break;
	}
}

/******************************************************************************/

int set_highlight()
{
	SHORT BorderPairs[10];
	struct Border MyBorder={0,0,1,0,JAM1,5,NULL,NULL};
	LONG tx,ty;

	if (!drawing) return (0);

	MyBorder.XY=BorderPairs;
	MyBorder.FrontPen=0;

	BorderPairs[0]=0;BorderPairs[1]=0;
	BorderPairs[2]=(pastetx-pastebx)*17+17;BorderPairs[3]=0;
	BorderPairs[4]=(pastetx-pastebx)*17+17;BorderPairs[5]=(pastety-pasteby)*17+17;
	BorderPairs[6]=0;BorderPairs[7]=(pastety-pasteby)*17+17;
	BorderPairs[8]=0;BorderPairs[9]=0;

	tx=(ULONG)((LevelWindow->MouseX-4-LEVEL_DISPLAY_X)/17);
	ty=(ULONG)((LevelWindow->MouseY-11-LEVEL_DISPLAY_Y)/17);

	if (highlight_flag==2)
        {
		if ((tx==pastebx)&&(ty==pasteby)&&(currz==pastebz)) return (1);

		if ((pastebx+pasteby+pastebz+pastetx+pastety+pastetz!=0)&&(currz>=pastebz)&&(currz<=pastetz))
			DrawBorder(LevelWindow->RPort,&MyBorder,LEVEL_DISPLAY_X+3+pastebx*17,LEVEL_DISPLAY_Y+10+pasteby*17);

		pastetx=tx;
		pastety=ty;
		pastetz=currz;

		if (pastetx<pastebx) swap(&pastebx,&pastetx);
		if (pastety<pasteby) swap(&pasteby,&pastety);
		if (pastetz<pastebz) swap(&pastebz,&pastetz);

		highlight_flag=0;
		draw_gadget_border(ToolsWindow->RPort,UP,&ToolsHighlightGadget,-1);

		if ((currz>=pastebz)&&(currz<=pastetz))
                {
			MyBorder.FrontPen=2;
			BorderPairs[0]=0;BorderPairs[1]=0;
			BorderPairs[2]=(pastetx-pastebx)*17+17;BorderPairs[3]=0;
			BorderPairs[4]=(pastetx-pastebx)*17+17;BorderPairs[5]=(pastety-pasteby)*17+17;
			BorderPairs[6]=0;BorderPairs[7]=(pastety-pasteby)*17+17;
			BorderPairs[8]=0;BorderPairs[9]=0;
			DrawBorder(LevelWindow->RPort,&MyBorder,LEVEL_DISPLAY_X+3+pastebx*17,LEVEL_DISPLAY_Y+10+pasteby*17);
		}

		return(1);
	}

	if (highlight_flag==1)
        {
		if ((pastebx+pasteby+pastebz+pastetx+pastety+pastetz!=0)&&(currz>=pastebz)&&(currz<=pastetz))
			DrawBorder(LevelWindow->RPort,&MyBorder,LEVEL_DISPLAY_X+3+pastebx*17,LEVEL_DISPLAY_Y+10+pasteby*17);

		pastebx=tx;
		pasteby=ty;
		pastebz=currz;
		pastetx=tx;
		pastety=ty;
		pastetz=currz;

		highlight_flag=2;

		if ((currz>=pastebz)&&(currz<=pastetz))
                {
			MyBorder.FrontPen=2;
			BorderPairs[0]=0;BorderPairs[1]=0;
			BorderPairs[2]=(pastetx-pastebx)*17+17;BorderPairs[3]=0;
			BorderPairs[4]=(pastetx-pastebx)*17+17;BorderPairs[5]=(pastety-pasteby)*17+17;
			BorderPairs[6]=0;BorderPairs[7]=(pastety-pasteby)*17+17;
			BorderPairs[8]=0;BorderPairs[9]=0;
			DrawBorder(LevelWindow->RPort,&MyBorder,LEVEL_DISPLAY_X+3+pastebx*17,LEVEL_DISPLAY_Y+10+pasteby*17);
		}

		return(1);
	}

	return(0);
}

/******************************************************************************/

void main(void)
{
	ULONG LevelSig,CellSig,ToolsSig,MapSig,ButtonSig,LiftSig,DoorSig,WorldSig,InfoSig,MonsSig;
	LONG tcurrx,tcurry;

	open_all();

	LevelSig=1L<<LevelWindow->UserPort->mp_SigBit;
	CellSig=1L<<CellWindow->UserPort->mp_SigBit;
	ToolsSig=1L<<ToolsWindow->UserPort->mp_SigBit;
	MapSig=1L<<MapWindow->UserPort->mp_SigBit;
	ButtonSig=1L<<ButtonWindow->UserPort->mp_SigBit;
	LiftSig=1L<<LiftWindow->UserPort->mp_SigBit;
	DoorSig=1L<<DoorWindow->UserPort->mp_SigBit;
	WorldSig=1L<<WorldWindow->UserPort->mp_SigBit;
	InfoSig=1L<<InfoWindow->UserPort->mp_SigBit;
	MonsSig=1L<<MonsWindow->UserPort->mp_SigBit;

	FOREVER
	{
		if (!set_highlight())
		{
			tcurrx=LevelWindow->MouseX-4-LEVEL_DISPLAY_X;
			tcurry=LevelWindow->MouseY-11-LEVEL_DISPLAY_Y;
			if ((tcurrx>=0)&&(tcurry>=0)&&((tcurrx/17)<MAP_WIDTH)&&((tcurry/17)<MAP_DEPTH)&&(((tcurrx/17)!=last_block_x)||((tcurry/17)!=last_block_y)||(drawing!=last_drawing)))
			{
				tcurrx=tcurrx/17;
				tcurry=tcurry/17;
				switch(drawing)
				{
					case 1:
						switch(current_tool)
						{
							case 1:
								redraw_level_block();
								currx=tcurrx;curry=tcurry;
								redraw_cursor();
								pick_block();
								break;
							case 2:
								redraw_level_block();
								currx=tcurrx;curry=tcurry;
								remove_button();
								remove_lift();
								remove_door();
								if ((add_button()) && (add_lift()) && (add_door()))
								{
									copy_map_cell3(mp3(currx,curry,currz),&picked_block3);
									if ((picked_block.block_here_bit)&&(picked_block.block==6))
										if (!picked_button_target)
										{
											picked_block.block=0;
											picked_block.block_here_bit=0;
											redraw_cell_win();
											drawing=0; current_tool=0;
											last_block_x=-1; last_block_y=-1;
											redraw_tools_window();
											SimpleRequest("No target set!");
										}
										else copy_map_cell3(mp3(currx,curry,currz),(struct map_cell3 *)&picked_button_target);
									if ((picked_block.block_here_bit)&&(picked_block.block==2))
									{
										if (GetLong(&MyLong)) copy_map_cell3(mp3(currx,curry,currz),(struct map_cell3 *)&MyLong.result);
										{ picked_block.block=0; picked_block.block_here_bit=0; redraw_cell_win(); }
									}
									if ((picked_block.block_here_bit)&&(picked_block.block==3))
									{
										MapData->exitx=currx;
										MapData->exity=curry;
										MapData->exitz=currz;
									}
									copy_map_cell1(mp1(currx,curry,currz),&picked_block);
									if ((picked_block.floor_here_bit)&&(picked_block.floor==1)&&(currz>0))
										copy_map_cell1(mp1(currx,curry,currz-1),&stone_block);
									copy_map_cell2(mp2(currx,curry,currz),&picked_block2);
								}
								changed=1;
								redraw_level_block();
								redraw_cursor();
								break;
							case 3:
								redraw_level_block();
								currx=tcurrx;curry=tcurry;
								mp3(currx,curry,currz)->sky_west=picked_block3.sky_west;
								mp3(currx,curry,currz)->sky_south=picked_block3.sky_south;
								mp3(currx,curry,currz)->sky_east=picked_block3.sky_east;
								mp3(currx,curry,currz)->sky_north=picked_block3.sky_north;
								changed=1;
								redraw_cursor();
								break;
							case 4:
								redraw_level_block();
								currx=tcurrx;curry=tcurry;
								picked_button_target=(currx+curry*MAP_DEPTH+currz*FLOOR_SIZE)*4;
								picked_button_target_x=currx;
								picked_button_target_y=curry;
								picked_button_target_z=currz;
								redraw_button_win();
								redraw_level();
								current_tool=0;
								redraw_tools_window();
								redraw_map_window();
								break;
							case 5:
								redraw_level_block();
								currx=tcurrx;curry=tcurry;
								mp1(currx,curry,currz)->water=picked_block.water;
								mp1(currx,curry,currz)->water_here_bit=picked_block.water_here_bit;
								mp2(currx,curry,currz)->flowing_bit=picked_block2.flowing_bit;
								redraw_level_block();
								redraw_cursor();
								break;
							case 6:
								redraw_level_block();
								currx=tcurrx;curry=tcurry;
								MapData->pl1x=currx;
								MapData->pl1y=curry;
								MapData->pl1z=currz;
								current_tool=0;
								redraw_tools_window();
								redraw_map_window();
								redraw_level();
								break;
							case 7:
								redraw_level_block();
								currx=tcurrx;curry=tcurry;
								MapData->pl2x=currx;
								MapData->pl2y=curry;
								MapData->pl2z=currz;
								current_tool=0;
								redraw_tools_window();
								redraw_map_window();
								redraw_level();
								break;
							case 8:
								redraw_level_block();
								currx=tcurrx;curry=tcurry;
								MapData->pl3x=currx;
								MapData->pl3y=curry;
								MapData->pl3z=currz;
								current_tool=0;
								redraw_tools_window();
								redraw_map_window();
								redraw_level();
								break;
							case 9:
								redraw_level_block();
								currx=tcurrx;curry=tcurry;
								MapData->pl4x=currx;
								MapData->pl4y=curry;
								MapData->pl4z=currz;
								current_tool=0;
								redraw_tools_window();
								redraw_map_window();
								redraw_level();
								break;
							default:
								redraw_cursor();
								Wait(LevelSig | CellSig | ToolsSig | MapSig | ButtonSig | LiftSig | DoorSig | WorldSig | InfoSig | MonsSig);
								break;
						}
						break;
				 	case 2:
						redraw_level_block();
						currx=tcurrx;curry=tcurry;
						remove_button();
						remove_lift();
						remove_door();
						copy_map_cell1(mp1(currx,curry,currz),&empty_long);
						redraw_level_block();
						redraw_cursor();
						break;
					default:
						redraw_cursor();
						Wait(LevelSig | CellSig | ToolsSig | MapSig | ButtonSig | LiftSig | DoorSig | WorldSig | InfoSig | MonsSig);
						break;
				}
				last_block_x=currx;
				last_block_y=curry;
				last_drawing=drawing;
			}
		}

		do {
			message=(struct IntuiMessage*)GetMsg(LiftWindow->UserPort);
			if (message) lift_analysis(message);
		} while (message);

		do {
			message=(struct IntuiMessage*)GetMsg(DoorWindow->UserPort);
			if (message) door_analysis(message);
		} while (message);

		do {
			message=(struct IntuiMessage*)GetMsg(ButtonWindow->UserPort);
			if (message) button_analysis(message);
		} while (message);

		do {
			message=(struct IntuiMessage*)GetMsg(CellWindow->UserPort);
			if (message) cell_analysis(message);
		} while (message);

		do {
			message=(struct IntuiMessage*)GetMsg(LevelWindow->UserPort);
			if (message) level_analysis(message);
		} while (message);

		do {
			message=(struct IntuiMessage*)GetMsg(MapWindow->UserPort);
			if (message) map_analysis(message);
		} while (message);

		do {
			message=(struct IntuiMessage*)GetMsg(ToolsWindow->UserPort);
			if (message) tools_analysis(message);
		} while (message);

		do {
			message=(struct IntuiMessage*)GetMsg(WorldWindow->UserPort);
			if (message) world_analysis(message);
		} while (message);

		do {
			message=(struct IntuiMessage*)GetMsg(InfoWindow->UserPort);
			if (message) info_analysis(message);
		} while (message);

		do {
			message=(struct IntuiMessage*)GetMsg(MonsWindow->UserPort);
			if (message) mons_analysis(message);
		} while (message);
	}
}
