#include "common.c"

/******************************************************************************/

struct IntuitionBase *IntuitionBase;
struct DosBase *DOSBase;
struct GfxBase *GfxBase;
struct IntuiMessage *message;
struct ReqBase *ReqBase;
struct Process *HGeditProcess;
struct Window *OldWindowPtr;
struct map *MapData;
struct map *PasteBuffer;
USHORT *Blocks;
struct map_cell1 empty_long;
struct map_cell2 empty_long2;
struct map_cell3 empty_long3;
UWORD *worldimagemem;
UWORD *monsimagemem;
struct locn *worldmem;
struct text chiptexts[36];
struct text *chiptextsmem;
int os_version;
char map_fbuf[FCHARS];
char panel_fbuf[FCHARS];
char horiz_fbuf[FCHARS];
char text_fbuf[FCHARS];
char convers_fbuf[FCHARS];
char info_fbuf[FCHARS];
char map_dbuf[DSIZE];
char panel_dbuf[DSIZE];
char horiz_dbuf[DSIZE];
char text_dbuf[DSIZE];
char convers_dbuf[DSIZE];
char info_dbuf[DSIZE];
int cur_mons=-1;
char map_nbuf[DSIZE+FCHARS];
char convers_nbuf[DSIZE+FCHARS];
char info_nbuf[DSIZE+FCHARS];

char floor_names[6][9]={
	"  None  ",
	" Grass  ",
	" Button ",
	"  Lift  ",
	" Puddle ",
	" Light  " };

char block_names[33][9]={
	"  None  ",
	" Stone  ",
	"  Push  ",
	"Ft Boost",
	"  Exit  ",
	"  Tree  ",
	"Barrier ",
	"Teleport",
	"Hydraulc",
	"   --   ",
	"   --   ",
	"   --   ",
	"   --   ",
	"   --   ",
	"   --   ",
	"   --   ",
	"   --   ",
	"Stairs N",
	"Stairs E",
	"Stairs S",
	"Stairs W",
	"Doors NS",
	"Doors EW",
	"   --   ",
	"   --   ",
	"   --   ",
	"   --   ",
	"   --   ",
	"   --   ",
	"   --   ",
	"   --   ",
	"   --   ",
	"   --   " };

char panel_names[5][9]={
	"  None  ",
	"  Text  ",
	"Butn in ",
	"Butn out",
	"   --   " };

char aux_names[17][9]={
	"  None  ",
	"Monster ",
	"Egg Open",
	" Cont 1 ",
	" Cont 2 ",
	" Cont 3 ",
	" Cont 4 ",
	" Cont 5 ",
	"   --   ",
	"Stairs N",
	"Stairs E",
	"Stairs S",
	"Stairs W",
	"Frame NS",
	"Frame EW",
	" Dead 1 ",
	" Dead 2 " };

#define CONT_SPECIAL 2
#define CONT_CONSUMABLE 3
#define CONT_PSIONIC 4
#define CONT_SMALLCRATE 5
#define CONT_BIGCRATE 6

short item_containers[NUM_ITEMS]={
	CONT_BIGCRATE,
	CONT_BIGCRATE,
	CONT_BIGCRATE,
	CONT_BIGCRATE,
	CONT_BIGCRATE,
	CONT_BIGCRATE,
	CONT_BIGCRATE,
	CONT_BIGCRATE,
	CONT_SMALLCRATE,
	CONT_SMALLCRATE,

	CONT_SMALLCRATE,
	CONT_BIGCRATE,
	CONT_BIGCRATE,
	CONT_BIGCRATE,
	CONT_BIGCRATE,
	CONT_SMALLCRATE,
	CONT_BIGCRATE,
	CONT_SMALLCRATE,
	CONT_SMALLCRATE,
	CONT_SMALLCRATE,

	CONT_SMALLCRATE,
	CONT_SMALLCRATE,
	CONT_SMALLCRATE,
	CONT_SMALLCRATE,
	CONT_BIGCRATE,
	CONT_BIGCRATE,
	CONT_SMALLCRATE,
	CONT_BIGCRATE,
	CONT_BIGCRATE,
	CONT_BIGCRATE,

	CONT_SMALLCRATE,
	CONT_SMALLCRATE,
	CONT_BIGCRATE,
	CONT_SMALLCRATE,
	CONT_SMALLCRATE,
	CONT_SMALLCRATE,
	CONT_SMALLCRATE,
	CONT_BIGCRATE,
	CONT_SMALLCRATE,
	CONT_SMALLCRATE,

	CONT_SMALLCRATE,
	CONT_SMALLCRATE,
	CONT_SMALLCRATE,
	CONT_SMALLCRATE,
	CONT_SMALLCRATE,
	CONT_SMALLCRATE,
	CONT_SMALLCRATE,
	CONT_SMALLCRATE,
	CONT_SMALLCRATE,
	CONT_SMALLCRATE,

	CONT_SMALLCRATE,
	CONT_BIGCRATE,
	CONT_SMALLCRATE,
	CONT_CONSUMABLE,
	CONT_CONSUMABLE,
	CONT_CONSUMABLE,
	CONT_CONSUMABLE,
	CONT_CONSUMABLE,
	CONT_CONSUMABLE,
	CONT_CONSUMABLE,

	CONT_CONSUMABLE,
	CONT_CONSUMABLE,
	CONT_CONSUMABLE,
	CONT_CONSUMABLE,
	CONT_CONSUMABLE,
	CONT_CONSUMABLE,
	CONT_BIGCRATE,
	CONT_BIGCRATE,
	CONT_BIGCRATE,
	CONT_CONSUMABLE,

	CONT_SPECIAL,
	CONT_SPECIAL,
	CONT_SPECIAL,
	CONT_SPECIAL,
	CONT_SPECIAL,
	CONT_SPECIAL,
	CONT_SPECIAL,
	CONT_SPECIAL,
	CONT_SPECIAL,
	CONT_SPECIAL,

	CONT_SPECIAL,
	CONT_PSIONIC,
	CONT_PSIONIC,
	CONT_PSIONIC,
	CONT_PSIONIC,
	CONT_PSIONIC,
	CONT_PSIONIC,
	CONT_PSIONIC,
	CONT_PSIONIC,
	CONT_PSIONIC,

	CONT_PSIONIC,
	CONT_PSIONIC,
	CONT_PSIONIC,
	CONT_PSIONIC,
	CONT_PSIONIC,
	CONT_PSIONIC,
	CONT_PSIONIC,
	CONT_PSIONIC,
	CONT_PSIONIC,
	CONT_PSIONIC,

	CONT_PSIONIC,
	CONT_PSIONIC,
	CONT_PSIONIC,
	CONT_PSIONIC,
	CONT_PSIONIC,
	CONT_PSIONIC,
	CONT_PSIONIC,
	CONT_PSIONIC,
	CONT_PSIONIC,
	CONT_PSIONIC,

	CONT_SMALLCRATE,
	CONT_SMALLCRATE,
	CONT_SMALLCRATE,
	CONT_CONSUMABLE };

short item_defaultammo[NUM_ITEMS]={
	1,
	1,
	200,
	250,
	100,
	100,
	54,
	40,
	40,
	54,

	54,
	200,
	128,
	54,
	16,
	6,
	2,
	64,
	50,
	32,

	50,
	0,
	255,
	20,
	65,
	3,
	6,
	36,
	1,
	3,

	0,
	0,
	3,
	0,
	0,
	1,
	1,
	250,
	150,
	250,

	40,
	20,
	40,
	20,
	90,
	50,
	150,
	64,
	50,
	100,

	200,
	0,
	255,
	0,
	0,
	0,
	0,
	0,
	0,
	0,

	0,
	0,
	0,
	0,
	0,
	0,
	1,
	1,
	1,
	0,

	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,

	0,
	20,
	15,
	10,
	5,
	5,
	5,
	5,
	3,
	3,

	3,
	4,
	3,
	5,
	10,
	6,
	3,
	2,
	5,
	5,

	20,
	15,
	10,
	3,
	5,
	5,
	3,
	3,
	10,
	3,

	0,
	0,
	0,
	0 };

char item_names[NUM_ITEMS+1][14]={
	"Empty        ",
	"Disruptor Cnn",
	"Rckt Launcher",
	"Laser Cannon ",
	"Munt Machgun ",
	"Hand Laser   ",
	"Beam Rifle   ",
	"Imperial Auto",
	"Flamer       ",
	"Flamer Junior",

	"Super Covert ",
	"Silent Auto  ",
	"Mini Gun     ",
	"Auto Gun     ",
	"Sniper Rifle ",
	"Bore Rifle   ",
	"S&W 29       ",
	"Shotgun      ",
	"UPBI 38      ",
	"Blaster 52   ",

	"Bore Hand Gun",
	"Sonic Stunner",
	"Small Remains",
	"Banana       ",
	"EMF Stunner  ",
	"Assault Rifle",
	"Grnd Launcher",
	"Grenades     ",
	"Sub-M. Gun   ",
	"Fusion Bomb 1",

	"Sentry uniD  ",
	"Brick        ",
	"Broken Bottle",
	"Sentry multiD",
	"Prox. Mine   ",
	"Prox. Mine2  ",
	"Disrupt Chrge",
	"Rocket       ",
	".44 AET      ",
	".44 THV      ",

	"9mm AET      ",
	"Flamer Refill",
	"Flmr UX Refil",
	"Flmr Jr Refil",
	"Flr Jr UX Rfl",
	"Expl Slug    ",
	"Rifled Slug  ",
	"9mm THV      ",
	".38 Glaser   ",
	"1kA Cell     ",

	"3kA Cell     ",
	"6kA Cell     ",
	"Large Remains",
	"Banana Pieces",
	"Baguette     ",
	"Cheese       ",
	"Bottle       ",
	"Apple        ",
	"Chicken      ",
	"Loaf         ",

	"Flask        ",
	"Std Rations 1",
	"Std Rations 2",
	"Std Rations 3",
	"Medical Pack ",
	"Immunisation ",
	"Repair Kit   ",
	"Fusion Bomb 2",
	"Fusion Bomb 3",
	"Fusion Bomb 4",

	"Unused       ",
	"Common Key   ",
	"Orante Key   ",
	"Cvilian Wafer",
	"Urestrd Wafer",
	"Employe Wafer",
	"Officrs Wafer",
	"Unused       ",
	"Unused       ",
	"DTS          ",

	"Unused       ",
	"Unused       ",
	"PSI fireball ",
	"PSI inferno  ",
	"PSI blast    ",
	"PSI devastate",
	"PSI firesheld",
	"PSI shield   ",
	"PSI granite  ",
	"PSI titanium ",

	"PSI wall     ",
	"PSI banish wl",
	"PSI bridge   ",
	"Unused       ",
	"PSI feather  ",
	"PSI sonic    ",
	"PSI shock    ",
	"PSI gills    ",
	"PSI part wavs",
	"PSI qeunch   ",

	"PSI wtr tight",
	"PSI electrify",
	"PSI lightning",
	"PSI fry      ",
	"PSI farsight ",
	"PSI teleport ",
	"Unused       ",
	"PSI cure psn ",
	"PSI heal     ",
	"PSI transmute",

	"PSI miracle  ",
	"Medum Remains",
	"Mine Armmed  ",
	"Mine2 Armmed ",
	"Nuts         " };

/******************************************************************************/

UWORD HGeditScreenPens[12]=
{
	0,				/* DETAILPEN, compatible Intuition rendering pens */
	1,				/* BLOCKPEN, compatible Intuition rendering pens */
	1,				/* TEXTPEN, text on background */
	2,				/* SHINEPEN,bright edge on 3D objects */
	1,				/* SHADOWPEN, dark edge on 3D objects */
	3,				/* FILLPEN, active-window/selected-gadget fill */
	1,				/* FILLTEXTPEN, text over FILLPEN */
	0,				/* BACKGROUNDPEN, always color 0 */
	2,				/* HIGHLIGHTTEXTPEN, special color text, on background */
	1,				/* BARDETAILPEN, text/detail in screen-bar/menus */
	2,				/* BARBLOCKPEN, screen-bar/menus fill */
	1				/* BARTRIMPEN, trim under menu-bar */
};

struct Rectangle my_dclip=
{
	0,0,
	640,512
};

#define SA_Interleaved	(SA_Dummy + 0x0022)
struct TagItem HGeditScreenTags[]=
{
	{SA_Pens,(ULONG)&HGeditScreenPens},
	{SA_PubName,(ULONG)"HGedit"},
	{SA_DClip,(ULONG)&my_dclip},
	{SA_AutoScroll,TRUE},
	{SA_Behind,TRUE},
	{SA_Interleaved,TRUE},
	{TAG_END,0}
};

#define WA_NewLookMenus		(WA_Dummy + 0x30)
struct TagItem HGeditWindowTags[]=
{
	{WA_NewLookMenus,0},
	{TAG_END,0}
};

struct Screen *HGeditScreen;
struct ExtNewScreen HGeditNewScreen=
{
	0,0,				/* top left x,y */
	640,512,			/* width, height */
	3,				/* depth */
	0,1,				/* detail pen, block pen */
	HIRES|LACE,			/* viewmodes */
	PUBLICSCREEN |			/* type */
	SCREENBEHIND |
	NS_EXTENDED,
	NULL,				/* font */
	(STRPTR)"HGedit by Scott Johnston 26/11/93, Copyright © DMA Design 1991-93",
	NULL,				/* gadgets */
	NULL,				/* custom bitmap */
	HGeditScreenTags,		/* tag item */
};

/******************************************************************************/

struct IntuiText MenuQuitText={0,1,JAM2,1,1,NULL,(UBYTE*)"Quit",NULL,};
struct MenuItem MenuQuit=
{
	NULL,				/* next item */
	1,115,				/* top left x,y */
	118,10,				/* width, height */
	ITEMTEXT |			/* flags */
	ITEMENABLED |
	COMMSEQ |
	HIGHCOMP,
	0,				/* mutual exclude */
	&MenuQuitText,			/* item fill */
	NULL,				/* select fill */
	(UBYTE)'Q',			/* command */
	NULL,				/* subitem */
	0				/* next select */
};
struct IntuiText MenuIsoText={0,1,JAM2,1,1,NULL,(UBYTE*)"Display",NULL,};
struct MenuItem MenuIso=
{
	&MenuQuit,				/* next item */
	1,100,				/* top left x,y */
	118,10,				/* width, height */
	ITEMTEXT |			/* flags */
	ITEMENABLED |
	COMMSEQ |
	HIGHCOMP,
	0,				/* mutual exclude */
	&MenuIsoText,			/* item fill */
	NULL,				/* select fill */
	(UBYTE)'D',			/* command */
	NULL,				/* subitem */
	0				/* next select */
};
struct IntuiText MenuUseText={0,1,JAM2,1,1,NULL,(UBYTE*)"Use Map",NULL,};
struct MenuItem MenuUse=
{
	&MenuIso,				/* next item */
	1,90,				/* top left x,y */
	118,10,				/* width, height */
	ITEMTEXT |			/* flags */
	ITEMENABLED |
	COMMSEQ |
	HIGHCOMP,
	0,				/* mutual exclude */
	&MenuUseText,			/* item fill */
	NULL,				/* select fill */
	(UBYTE)'U',			/* command */
	NULL,				/* subitem */
	0				/* next select */
};
struct IntuiText MenuSaveText={0,1,JAM2,1,1,NULL,(UBYTE*)"Save as...",NULL,};
struct MenuItem MenuSave=
{
	&MenuUse,			/* next item */
	1,75,				/* top left x,y */
	118,10,				/* width, height */
	ITEMTEXT |                      /* flags */
	ITEMENABLED |
	HIGHCOMP,
	0,                              /* mutual exclude */
	&MenuSaveText,			/* item fill */
	NULL,                           /* select fill */
	NULL,				/* command */
	NULL,				/* subitem */
	0                               /* next select */
};
struct IntuiText MenuSaveItText={0,1,JAM2,1,1,NULL,(UBYTE*)"Save",NULL,};
struct MenuItem MenuSaveIt=
{
	&MenuSave,			/* next item */
	1,65,				/* top left x,y */
	118,10,				/* width, height */
	ITEMTEXT |			/* flags */
	COMMSEQ |
	HIGHCOMP,
	0,                              /* mutual exclude */
	&MenuSaveItText,		/* item fill */
	NULL,                           /* select fill */
	(UBYTE)'S',			/* command */
	NULL,                           /* subitem */
	0                               /* next select */
};
struct IntuiText MenuLoadDataText={0,1,JAM2,1,1,NULL,(UBYTE*)"Load...",NULL,};
struct MenuItem MenuLoadData=
{
	&MenuSaveIt,			/* next item */
	1,55,				/* top left x,y */
	118,10,				/* width, height */
	ITEMTEXT |                      /* flags */
	ITEMENABLED |
	COMMSEQ |
	HIGHCOMP,
	0,                              /* mutual exclude */
	&MenuLoadDataText,		/* item fill */
	NULL,                           /* select fill */
	(UBYTE)'L',			/* command */
	NULL,				/* subitem */
	0                               /* next select */
};


struct IntuiText MenuExportInfoText={0,1,JAM2,1,1,NULL,(UBYTE*)"Information...",NULL,};
struct MenuItem MenuExportInfoData=
{
	NULL,				/* next item */
	50,10,				/* top left x,y */
	146,10,				/* width, height */
	ITEMTEXT |                      /* flags */
	ITEMENABLED |
	HIGHCOMP,
	0,                              /* mutual exclude */
	&MenuExportInfoText,		/* item fill */
	NULL,                           /* select fill */
	NULL,				/* command */
	NULL,				/* subitem */
	0                               /* next select */
};
struct IntuiText MenuExportConverText={0,1,JAM2,1,1,NULL,(UBYTE*)"Conversations...",NULL,};
struct MenuItem MenuExportConverData=
{
	&MenuExportInfoData,		/* next item */
	50,0,				/* top left x,y */
	146,10,				/* width, height */
	ITEMTEXT |                      /* flags */
	ITEMENABLED |
	HIGHCOMP,
	0,                              /* mutual exclude */
	&MenuExportConverText,		/* item fill */
	NULL,                           /* select fill */
	NULL,				/* command */
	NULL,				/* subitem */
	0                               /* next select */
};
struct IntuiText MenuExportText={0,1,JAM2,1,1,NULL,(UBYTE*)"Export       »",NULL,};
struct MenuItem MenuExportData=
{
	&MenuLoadData,			/* next item */
	1,40,				/* top left x,y */
	118,10,				/* width, height */
	ITEMTEXT |                      /* flags */
	ITEMENABLED |
	HIGHCOMP,
	0,                              /* mutual exclude */
	&MenuExportText,			/* item fill */
	NULL,                           /* select fill */
	NULL,				/* command */
	&MenuExportConverData,		/* subitem */
	0                               /* next select */
};



struct IntuiText MenuLoadHorizonText={0,1,JAM2,1,1,NULL,(UBYTE*)"Horizons...",NULL,};
struct MenuItem MenuLoadHorizonData=
{
	NULL,				/* next item */
	50,20,				/* top left x,y */
	146,10,				/* width, height */
	ITEMTEXT |                      /* flags */
	ITEMENABLED |
	HIGHCOMP,
	0,                              /* mutual exclude */
	&MenuLoadHorizonText,		/* item fill */
	NULL,                           /* select fill */
	NULL,				/* command */
	NULL,				/* subitem */
	0                               /* next select */
};
struct IntuiText MenuLoadTextText={0,1,JAM2,1,1,NULL,(UBYTE*)"Conversations...",NULL,};
struct MenuItem MenuLoadTextData=
{
	&MenuLoadHorizonData,		/* next item */
	50,10,				/* top left x,y */
	146,10,				/* width, height */
	ITEMTEXT |                      /* flags */
	ITEMENABLED |
	HIGHCOMP,
	0,                              /* mutual exclude */
	&MenuLoadTextText,		/* item fill */
	NULL,                           /* select fill */
	NULL,				/* command */
	NULL,				/* subitem */
	0                               /* next select */
};
struct IntuiText MenuLoadPicturesText={0,1,JAM2,1,1,NULL,(UBYTE*)"Panels...",NULL,};
struct MenuItem MenuLoadPictures=
{
	&MenuLoadTextData,		/* next item */
	50,0,				/* top left x,y */
	146,10,				/* width, height */
	ITEMTEXT |                      /* flags */
	ITEMENABLED |
	HIGHCOMP,
	0,                              /* mutual exclude */
	&MenuLoadPicturesText,			/* item fill */
	NULL,                           /* select fill */
	NULL,				/* command */
	NULL,				/* subitem */
	0                               /* next select */
};
struct IntuiText MenuLoadText={0,1,JAM2,1,1,NULL,(UBYTE*)"Import       »",NULL,};
struct MenuItem MenuLoad=
{
	&MenuExportData,		/* next item */
	1,30,				/* top left x,y */
	118,10,				/* width, height */
	ITEMTEXT |                      /* flags */
	ITEMENABLED |
	HIGHCOMP,
	0,                              /* mutual exclude */
	&MenuLoadText,			/* item fill */
	NULL,                           /* select fill */
	NULL,				/* command */
	&MenuLoadPictures,		/* subitem */
	0                               /* next select */
};
struct IntuiText MenuHelpText={0,1,JAM2,1,1,NULL,(UBYTE*)"Help",NULL,};
struct MenuItem MenuHelp=
{
	&MenuLoad,			/* next item */
	1,15,				/* top left x,y */
	118,10,				/* width, height */
	ITEMTEXT |                      /* flags */
	ITEMENABLED |
	HIGHCOMP,
	0,                              /* mutual exclude */
	&MenuHelpText,			/* item fill */
	NULL,                           /* select fill */
	NULL,				/* command */
	NULL,                           /* subitem */
	0                               /* next select */
};
struct IntuiText MenuNewText={0,1,JAM2,1,1,NULL,(UBYTE*)"New",NULL,};
struct MenuItem MenuNew=
{
	&MenuHelp,			/* next item */
	1,0,				/* top left x,y */
	118,10,				/* width, height */
	ITEMTEXT |                      /* flags */
	ITEMENABLED |
	COMMSEQ |
	HIGHCOMP,
	0,                              /* mutual exclude */
	&MenuNewText,			/* item fill */
	NULL,                           /* select fill */
	(UBYTE)'X',			/* command */
	NULL,                           /* subitem */
	0                               /* next select */
};
struct Menu MenuProject=
{
	NULL,				/* next menu */
	10,0,				/* top left x,y */
	118,10,				/* width, height */
	MENUENABLED,			/* flags */
	(UBYTE*)"Project",		/* menu name */
	&MenuNew			/* first item */
};

/******************************************************************************/

struct IntuiText CellLeftText={1,0,JAM2,6,3,NULL,(UBYTE*)"<",NULL,};
struct IntuiText CellRightText={1,0,JAM2,6,3,NULL,(UBYTE*)">",NULL,};

struct IntuiText CellNoMonText={1,5,JAM2,6,3,NULL,(UBYTE*)"Block Monst",NULL,};
struct Gadget CellNoMonGadget=
{
	NULL,				/* next gadget */
	4+9,245-37+16-33,		/* top left x,y */
	66+34,13,			/* width, height */
	GADGHNONE,			/* flags */
	RELVERIFY,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&CellNoMonText,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	31,				/* gadget id */
	NULL,				/* user data */
};
struct IntuiText CellNoEggText={1,5,JAM2,14,3,NULL,(UBYTE*)"Erase Egg",NULL,};
struct Gadget CellNoEggGadget=
{
	&CellNoMonGadget,		/* next gadget */
	4+9+68+34,245-37+16-33,		/* top left x,y */
	66+34,13,			/* width, height */
	GADGHNONE,			/* flags */
	RELVERIFY,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&CellNoEggText,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	30,				/* gadget id */
	NULL,				/* user data */
};
struct IntuiText CellFillSkyText={1,0,JAM2,40,3,NULL,(UBYTE*)"Fill Sky",NULL,};
struct Gadget CellFillSkyGadget=
{
	&CellNoEggGadget,		/* next gadget */
	4+6+48+16,245-35+23,		/* top left x,y */
	13+72+59,13,			/* width, height */
	GADGHCOMP,			/* flags */
	RELVERIFY,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&CellFillSkyText,		/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	28,				/* gadget id */
	NULL,				/* user data */
};
struct IntuiText CellSkyWestText={1,0,JAM2,5,5,NULL,(UBYTE*)"W",NULL,};
struct Gadget CellSkyWestGadget=
{
	&CellFillSkyGadget,		/* next gadget */
	4+6,245-35+16,			/* top left x,y */
	17,17,				/* width, height */
	GADGHNONE,			/* flags */
	RELVERIFY,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&CellSkyWestText,		/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	27,				/* gadget id */
	NULL,				/* user data */
};
struct IntuiText CellSkySouthText={1,0,JAM2,5,5,NULL,(UBYTE*)"S",NULL,};
struct Gadget CellSkySouthGadget=
{
	&CellSkyWestGadget,		/* next gadget */
	4+6+19,245-35+32-1,		/* top left x,y */
	17,17,				/* width, height */
	GADGHNONE,			/* flags */
	RELVERIFY,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&CellSkySouthText,		/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	26,				/* gadget id */
	NULL,				/* user data */
};
struct IntuiText CellSkyEastText={1,0,JAM2,5,5,NULL,(UBYTE*)"E",NULL,};
struct Gadget CellSkyEastGadget=
{
	&CellSkySouthGadget,		/* next gadget */
	4+6+38,245-35+16,		/* top left x,y */
	17,17,				/* width, height */
	GADGHNONE,			/* flags */
	RELVERIFY,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&CellSkyEastText,		/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	25,				/* gadget id */
	NULL,				/* user data */
};
struct IntuiText CellSkyNorthText={1,0,JAM2,5,5,NULL,(UBYTE*)"N",NULL,};
struct Gadget CellSkyNorthGadget=
{
	&CellSkyEastGadget,		/* next gadget */
	4+6+19,245-35+1,		/* top left x,y */
	17,17,				/* width, height */
	GADGHNONE,			/* flags */
	RELVERIFY,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&CellSkyNorthText,		/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	24,				/* gadget id */
	NULL,				/* user data */
};
char ItemTypeBuffer[5];
char ItemTypeUndoBuffer[5];
struct StringInfo ItemTypeInfo=
{
	ItemTypeBuffer,			/* buffer */
	ItemTypeUndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        4,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	4,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget ItemTypeGadget=
{
	&CellSkyNorthGadget,		/* next gadget */
	4+172,266,			/* top left x,y */
	32,13,				/* width, height */
	GADGHCOMP,			/* flags */
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&ItemTypeInfo,		/* special info */
	23,				/* gadget id */
	NULL,				/* user data */
};
char ItemDamageBuffer[5];
char ItemDamageUndoBuffer[5];
struct StringInfo ItemDamageInfo=
{
	ItemDamageBuffer,		/* buffer */
	ItemDamageUndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        4,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	4,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget ItemDamageGadget=
{
	&ItemTypeGadget,		/* next gadget */
	4+172,282,			/* top left x,y */
	32,13,				/* width, height */
	GADGHCOMP,			/* flags */
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&ItemDamageInfo,	/* special info */
	22,				/* gadget id */
	NULL,				/* user data */
};
char ItemAmmoBuffer[5];
char ItemAmmoUndoBuffer[5];
struct StringInfo ItemAmmoInfo=
{
	ItemAmmoBuffer,			/* buffer */
	ItemAmmoUndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        4,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	4,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget ItemAmmoGadget=
{
	&ItemDamageGadget,		/* next gadget */
	4+172,298,			/* top left x,y */
	32,13,				/* width, height */
	GADGHCOMP,			/* flags */
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&ItemAmmoInfo,		/* special info */
	21,				/* gadget id */
	NULL,				/* user data */
};
char EggHatchBuffer[6];
char EggHatchUndoBuffer[6];
struct StringInfo EggHatchInfo=
{
	EggHatchBuffer,			/* buffer */
	EggHatchUndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        5,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	5,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget EggHatchGadget=
{
	&ItemAmmoGadget,		/* next gadget */
	4+172,226-16-33,		/* top left x,y */
	32,13,				/* width, height */
	GADGHCOMP,			/* flags */
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&EggHatchInfo,		/* special info */
	19,				/* gadget id */
	NULL,				/* user data */
};
struct Gadget CellAuxRightGadget=
{
	&EggHatchGadget,		/* next gadget */
	4+191,183-33,			/* top left x,y */
	20,13,				/* width, height */
	GADGHCOMP,			/* flags */
	RELVERIFY,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&CellRightText,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	17,				/* gadget id */
	NULL,				/* user data */
};
struct Gadget CellAuxLeftGadget=
{

	&CellAuxRightGadget,		/* next gadget */
	4+10+78,183-33,			/* top left x,y */
	20,13,				/* width, height */
	GADGHCOMP,			/* flags */
	RELVERIFY,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&CellLeftText,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	16,				/* gadget id */
	NULL,				/* user data */
};
struct IntuiText CellFlowingText={1,5,JAM2,16+8,3,NULL,(UBYTE*)"Tidal Water Flowing",NULL,};
struct Gadget CellFlowingGadget=
{
	&CellAuxLeftGadget,		/* next gadget */
	13,125,				/* top left x,y */
	66+28+12*9,13,			/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&CellFlowingText,		/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	11,				/* gadget id */
	NULL,				/* user data */
};
struct Gadget CellWaterRightGadget=
{
	&CellFlowingGadget,		/* next gadget */
	4+191,11+18+125-44,		/* top left x,y */
	20,13,				/* width, height */
	GADGHCOMP,			/* flags */
	RELVERIFY,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&CellRightText,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	10,				/* gadget id */
	NULL,				/* user data */
};
struct Gadget CellWaterLeftGadget=
{

	&CellWaterRightGadget,		/* next gadget */
	4+10+78,11+18+125-44,		/* top left x,y */
	20,13,				/* width, height */
	GADGHCOMP,			/* flags */
	RELVERIFY,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&CellLeftText,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	9,				/* gadget id */
	NULL,				/* user data */
};
struct IntuiText CellOpaqueText={1,5,JAM2,10,3,NULL,(UBYTE*)"Opaque",NULL,};
struct Gadget CellOpaqueGadget=
{
	&CellWaterLeftGadget,		/* next gadget */
	4+9+68+68,11+17+16-10,		/* top left x,y */
	34+32,13,			/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&CellOpaqueText,		/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	8,				/* gadget id */
	NULL,				/* user data */
};
struct IntuiText CellInvisText={1,5,JAM2,10,3,NULL,(UBYTE*)"Invisble",NULL,};
struct Gadget CellInvisGadget=
{

	&CellOpaqueGadget,		/* next gadget */
	4+9+34+18,11+17+16-10,		/* top left x,y */
	34+18+30,13,			/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&CellInvisText,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	32,				/* gadget id */
	NULL,				/* user data */
};
struct IntuiText CellPushableText={1,5,JAM2,10,3,NULL,(UBYTE*)"Push",NULL,};
struct Gadget CellPushableGadget=
{

	&CellInvisGadget,		/* next gadget */
	4+9,11+17+16-10,		/* top left x,y */
	34+16,13,			/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&CellPushableText,		/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	7,				/* gadget id */
	NULL,				/* user data */
};
struct Gadget CellPanelRightGadget=
{
	&CellPushableGadget,		/* next gadget */
	4+191,11+18+90-34,		/* top left x,y */
	20,13,				/* width, height */
	GADGHCOMP,			/* flags */
	RELVERIFY,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&CellRightText,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	6,				/* gadget id */
	NULL,				/* user data */
};
struct Gadget CellPanelLeftGadget=
{

	&CellPanelRightGadget,		/* next gadget */
	4+10+78,11+18+90-34,		/* top left x,y */
	20,13,				/* width, height */
	GADGHCOMP,			/* flags */
	RELVERIFY,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&CellLeftText,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	5,				/* gadget id */
	NULL,				/* user data */
};
struct Gadget CellFloorRightGadget=
{
	&CellPanelLeftGadget,		/* next gadget */
	4+191,11+18+55-24,		/* top left x,y */
	20,13,				/* width, height */
	GADGHCOMP,			/* flags */
	RELVERIFY,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&CellRightText,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	4,				/* gadget id */
	NULL,				/* user data */
};
struct Gadget CellFloorLeftGadget=
{

	&CellFloorRightGadget,		/* next gadget */
	4+10+78,11+18+55-24,		/* top left x,y */
	20,13,				/* width, height */
	GADGHCOMP,			/* flags */
	RELVERIFY,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&CellLeftText,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	3,				/* gadget id */
	NULL,				/* user data */
};
struct Gadget CellBlockRightGadget=
{
	&CellFloorLeftGadget,		/* next gadget */
	4+191,11+18-10,			/* top left x,y */
	20,13,				/* width, height */
	GADGHCOMP,			/* flags */
	RELVERIFY,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&CellRightText,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	2,				/* gadget id */
	NULL,				/* user data */
};
struct Gadget CellBlockLeftGadget=
{

	&CellBlockRightGadget,		/* next gadget */
	4+10+78,11+18-10,		/* top left x,y */
	20,13,				/* width, height */
	GADGHCOMP,			/* flags */
	RELVERIFY,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&CellLeftText,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	1,				/* gadget id */
	NULL,				/* user data */
};
struct Window *CellWindow;
struct ExtNewWindow CellNewWindow=
{
	412,194,			/* top left x,y */
	228,318,			/* width, height */
	0,1,				/* detail pen, block pen */
	GADGETDOWN |			/* IDCMP flags */
	RAWKEY |
	MENUPICK |
	GADGETUP,
	SMART_REFRESH |			/* flags */
        WINDOWDEPTH,
	&CellBlockLeftGadget,		/* first gadget */
	NULL,				/* check mark */
	(UBYTE*)"Cell",
	NULL,				/* screen */
	NULL,				/* bitmap */
	201,105,			/* minimum width, height */
	201,105,			/* maximum width, height */
	CUSTOMSCREEN,			/* type */
	HGeditWindowTags,              /* tag item */
};

/******************************************************************************/

struct IntuiText Button38Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Unlock Door",NULL,};
struct Gadget Button38Gadget=
{

	NULL,				/* next gadget */
	4+114,12+14*19,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button38Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	38,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button37Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Unlock Door",NULL,};
struct Gadget Button37Gadget=
{

	&Button38Gadget,		/* next gadget */
	4+5,12+14*19,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button37Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	19,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button36Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Lock Door",NULL,};
struct Gadget Button36Gadget=
{

	&Button37Gadget,		/* next gadget */
	4+114,12+14*18,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button36Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	37,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button35Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Lock Door",NULL,};
struct Gadget Button35Gadget=
{

	&Button36Gadget,		/* next gadget */
	4+5,12+14*18,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button35Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	18,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button34Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Toggle Door",NULL,};
struct Gadget Button34Gadget=
{

	&Button35Gadget,		/* next gadget */
	4+114,12+14*17,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button34Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	36,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button33Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Toggle Door",NULL,};
struct Gadget Button33Gadget=
{

	&Button34Gadget,		/* next gadget */
	4+5,12+14*17,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button33Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	17,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button32Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Close Door",NULL,};
struct Gadget Button32Gadget=
{

	&Button33Gadget,		/* next gadget */
	4+114,12+14*16,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button32Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	35,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button31Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Close Door",NULL,};
struct Gadget Button31Gadget=
{

	&Button32Gadget,		/* next gadget */
	4+5,12+14*16,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button31Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	16,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button30Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Open Door",NULL,};
struct Gadget Button30Gadget=
{

	&Button31Gadget,		/* next gadget */
	4+114,12+14*15,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button30Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	34,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button29Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Open Door",NULL,};
struct Gadget Button29Gadget=
{

	&Button30Gadget,		/* next gadget */
	4+5,12+14*15,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button29Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	15,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button28Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Unused",NULL,};
struct Gadget Button28Gadget=
{

	&Button29Gadget,		/* next gadget */
	4+114,12+14*14,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button28Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	33,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button27Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Unused",NULL,};
struct Gadget Button27Gadget=
{

	&Button28Gadget,		/* next gadget */
	4+5,12+14*14,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button27Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	14,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button26Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Toggle Lift",NULL,};
struct Gadget Button26Gadget=
{

	&Button27Gadget,		/* next gadget */
	4+114,12+14*13,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button26Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	32,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button25Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Toggle Lift",NULL,};
struct Gadget Button25Gadget=
{

	&Button26Gadget,		/* next gadget */
	4+5,12+14*13,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button25Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	13,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button24Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Stop Lift",NULL,};
struct Gadget Button24Gadget=
{

	&Button25Gadget,		/* next gadget */
	4+114,12+14*12,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button24Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	31,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button23Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Stop Lift",NULL,};
struct Gadget Button23Gadget=
{

	&Button24Gadget,		/* next gadget */
	4+5,12+14*12,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button23Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	12,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button22Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Lift Down",NULL,};
struct Gadget Button22Gadget=
{

	&Button23Gadget,		/* next gadget */
	4+114,12+14*11,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button22Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	30,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button21Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Lift Down",NULL,};
struct Gadget Button21Gadget=
{

	&Button22Gadget,		/* next gadget */
	4+5,12+14*11,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button21Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	11,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button20Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Lift Up",NULL,};
struct Gadget Button20Gadget=
{

	&Button21Gadget,		/* next gadget */
	4+114,12+14*10,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button20Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	29,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button19Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Lift Up",NULL,};
struct Gadget Button19Gadget=
{

	&Button20Gadget,		/* next gadget */
	4+5,12+14*10,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button19Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	10,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button18Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Unused",NULL,};
struct Gadget Button18Gadget=
{

	&Button19Gadget,		/* next gadget */
	4+114,12+14*9,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button18Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	28,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button17Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Unused",NULL,};
struct Gadget Button17Gadget=
{

	&Button18Gadget,		/* next gadget */
	4+5,12+14*9,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button17Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	9,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button16Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Hatch Egg",NULL,};
struct Gadget Button16Gadget=
{

	&Button17Gadget,		/* next gadget */
	4+114,12+14*8,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button16Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	27,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button15Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Hatch Egg",NULL,};
struct Gadget Button15Gadget=
{

	&Button16Gadget,		/* next gadget */
	4+5,12+14*8,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button15Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	8,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button14Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Toggle Block",NULL,};
struct Gadget Button14Gadget=
{

	&Button15Gadget,		/* next gadget */
	4+114,12+14*7,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button14Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	26,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button13Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Toggle Block",NULL,};
struct Gadget Button13Gadget=
{

	&Button14Gadget,		/* next gadget */
	4+5,12+14*7,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button13Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	7,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button12Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Block Off",NULL,};
struct Gadget Button12Gadget=
{

	&Button13Gadget,		/* next gadget */
	4+114,12+14*6,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button12Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	25,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button11Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Block Off",NULL,};
struct Gadget Button11Gadget=
{

	&Button12Gadget,		/* next gadget */
	4+5,12+14*6,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button11Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	6,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button10Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Block On",NULL,};
struct Gadget Button10Gadget=
{

	&Button11Gadget,		/* next gadget */
	4+114,12+14*5,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button10Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	24,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button9Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Block On",NULL,};
struct Gadget Button9Gadget=
{

	&Button10Gadget,		/* next gadget */
	4+5,12+14*5,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button9Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	5,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button8Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Toggle Floor",NULL,};
struct Gadget Button8Gadget=
{

	&Button9Gadget,			/* next gadget */
	4+114,12+14*4,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button8Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	23,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button7Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Toggle Floor",NULL,};
struct Gadget Button7Gadget=
{

	&Button8Gadget,			/* next gadget */
	4+5,12+14*4,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button7Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	4,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button6Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Floor Off",NULL,};
struct Gadget Button6Gadget=
{

	&Button7Gadget,			/* next gadget */
	4+114,12+14*3,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button6Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	22,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button5Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Floor Off",NULL,};
struct Gadget Button5Gadget=
{

	&Button6Gadget,			/* next gadget */
	4+5,12+14*3,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button5Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	3,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button4Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Floor On",NULL,};
struct Gadget Button4Gadget=
{

	&Button5Gadget,			/* next gadget */
	4+114,12+14*2,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button4Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	21,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button3Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Floor On",NULL,};
struct Gadget Button3Gadget=
{

	&Button4Gadget,			/* next gadget */
	4+5,12+14*2,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button3Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	2,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button2Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Nothing",NULL,};
struct Gadget Button2Gadget=
{

	&Button3Gadget,			/* next gadget */
	4+114,12+14,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button2Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	20,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Button1Text={1,0,JAM2,3,2,NULL,(UBYTE*)"Nothing",NULL,};
struct Gadget Button1Gadget=
{

	&Button2Gadget,			/* next gadget */
	4+5,12+14,			/* top left x,y */
	99,10,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Button1Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	1,				/* gadget id */
	NULL,				/* user data */
};

struct Window *ButtonWindow;
struct ExtNewWindow ButtonNewWindow=
{
	412,194,			/* top left x,y */
	228,318,			/* width, height */
	0,1,				/* detail pen, block pen */
	GADGETDOWN |			/* IDCMP flags */
	RAWKEY |
	MENUPICK,
	SMART_REFRESH |			/* flags */
        WINDOWDEPTH,
	&Button1Gadget,			/* first gadget */
	NULL,				/* check mark */
	(UBYTE*)"Button",
	NULL,				/* screen */
	NULL,				/* bitmap */
	201,105,			/* minimum width, height */
	201,105,			/* maximum width, height */
	CUSTOMSCREEN,			/* type */
	HGeditWindowTags,              /* tag item */
};

/******************************************************************************/

struct IntuiText Lift16Text={1,5,JAM2,8+8,3,NULL,(UBYTE*)"Both",NULL,};
struct Gadget Lift16Gadget=
{
	NULL,				/* next gadget */
	4+140,11+90-12,			/* top left x,y */
	65,13,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Lift16Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	16,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Lift15Text={1,5,JAM2,25-12+8,3,NULL,(UBYTE*)"Top",NULL,};
struct Gadget Lift15Gadget=
{
	&Lift16Gadget,			/* next gadget */
	4+75,11+90-12,			/* top left x,y */
	65,13,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Lift15Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	15,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Lift14Text={1,5,JAM2,8,3,NULL,(UBYTE*)"Bottom",NULL,};
struct Gadget Lift14Gadget=
{
	&Lift15Gadget,			/* next gadget */
	4+10,11+90-12,			/* top left x,y */
	65,13,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Lift14Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	14,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Lift12Text={1,5,JAM2,25,3,NULL,(UBYTE*)"Up",NULL,};
struct Gadget Lift12Gadget=
{
	&Lift14Gadget,			/* next gadget */
	4+75+32,11+180-12,			/* top left x,y */
	65,13,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Lift12Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	12,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Lift11Text={1,5,JAM2,16,3,NULL,(UBYTE*)"Stop",NULL,};
struct Gadget Lift11Gadget=
{
	&Lift12Gadget,			/* next gadget */
	4+10+32,11+180-12,			/* top left x,y */
	65,13,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Lift11Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	11,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Lift10Text={1,5,JAM2,16,3,NULL,(UBYTE*)"Down",NULL,};
struct Gadget Lift10Gadget=
{
	&Lift11Gadget,			/* next gadget */
	4+75+32,11+150-12,			/* top left x,y */
	65,13,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Lift10Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	10,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Lift8Text={1,5,JAM2,16,3,NULL,(UBYTE*)"Stop",NULL,};
struct Gadget Lift8Gadget=
{
	&Lift10Gadget,			/* next gadget */
	4+10+32,11+150-12,			/* top left x,y */
	65,13,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Lift8Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	8,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Lift7Text={1,5,JAM2,16,3,NULL,(UBYTE*)"Down",NULL,};
struct Gadget Lift7Gadget=
{
	&Lift8Gadget,			/* next gadget */
	4+140,11+120-12,			/* top left x,y */
	65,13,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Lift7Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	7,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Lift6Text={1,5,JAM2,25,3,NULL,(UBYTE*)"Up",NULL,};
struct Gadget Lift6Gadget=
{
	&Lift7Gadget,			/* next gadget */
	4+75,11+120-12,			/* top left x,y */
	65,13,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Lift6Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	6,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Lift5Text={1,5,JAM2,16,3,NULL,(UBYTE*)"Stop",NULL,};
struct Gadget Lift5Gadget=
{
	&Lift6Gadget,			/* next gadget */
	4+10,11+120-12,			/* top left x,y */
	65,13,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Lift5Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	5,				/* gadget id */
	NULL,				/* user data */
};

struct IntuiText Lift4Text={1,5,JAM2,13,3,NULL,(UBYTE*)"Carry",NULL,};
struct Gadget Lift4Gadget=
{
	&Lift5Gadget,			/* next gadget */
	4+75,11+60-12,			/* top left x,y */
	65,13,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Lift4Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	4,				/* gadget id */
	NULL,				/* user data */
};

char Lift2Buffer[5];
char Lift2UndoBuffer[5];
struct StringInfo Lift2Info=
{
	Lift2Buffer,			/* buffer */
	Lift2UndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        4,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	4,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget Lift2Gadget=
{
	&Lift4Gadget,			/* next gadget */
	4+130,11+30-2,			/* top left x,y */
	32,13,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&Lift2Info,		/* special info */
	2,				/* gadget id */
	NULL,				/* user data */
};

char Lift1Buffer[5];
char Lift1UndoBuffer[5];
struct StringInfo Lift1Info=
{
	Lift1Buffer,			/* buffer */
	Lift1UndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        4,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	4,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget Lift1Gadget=
{
	&Lift2Gadget,			/* next gadget */
	4+130,11+10-2,			/* top left x,y */
	32,13,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&Lift1Info,		/* special info */
	1,				/* gadget id */
	NULL,				/* user data */
};

struct Window *LiftWindow;
struct ExtNewWindow LiftNewWindow=
{
	412,194,			/* top left x,y */
	228,318,			/* width, height */
	0,1,				/* detail pen, block pen */
	GADGETDOWN |
	GADGETUP |			/* IDCMP flags */
	RAWKEY |
	MENUPICK,
	SMART_REFRESH |			/* flags */
        WINDOWDEPTH,
	&Lift1Gadget,			/* first gadget */
	NULL,				/* check mark */
	(UBYTE*)"Lift",
	NULL,				/* screen */
	NULL,				/* bitmap */
	201,105,			/* minimum width, height */
	201,105,			/* maximum width, height */
	CUSTOMSCREEN,			/* type */
	HGeditWindowTags,              /* tag item */
};

/******************************************************************************/

struct IntuiText Door4Text={1,5,JAM2,13,3,NULL,(UBYTE*)"Button",NULL,};
struct Gadget Door4Gadget=
{
	NULL,				/* next gadget */
	4+75-4+47,11+50,		/* top left x,y */
	65+8,13,			/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Door4Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	4,				/* gadget id */
	NULL,				/* user data */
};
struct IntuiText Door3Text={1,5,JAM2,13,3,NULL,(UBYTE*)"Locked",NULL,};
struct Gadget Door3Gadget=
{
	&Door4Gadget,			/* next gadget */
	4+75-4-47,11+50,		/* top left x,y */
	65+8,13,			/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&Door3Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	3,				/* gadget id */
	NULL,				/* user data */
};
char Door2Buffer[5];
char Door2UndoBuffer[5];
struct StringInfo Door2Info=
{
	Door2Buffer,			/* buffer */
	Door2UndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        4,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	4,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget Door2Gadget=
{
	&Door3Gadget,			/* next gadget */
	4+130,11+30,			/* top left x,y */
	32,13,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&Door2Info,		/* special info */
	2,				/* gadget id */
	NULL,				/* user data */
};

char Door1Buffer[5];
char Door1UndoBuffer[5];
struct StringInfo Door1Info=
{
	Door1Buffer,			/* buffer */
	Door1UndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        4,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	4,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget Door1Gadget=
{
	&Door2Gadget,			/* next gadget */
	4+130,11+10,			/* top left x,y */
	32,13,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&Door1Info,		/* special info */
	1,				/* gadget id */
	NULL,				/* user data */
};

struct Window *DoorWindow;
struct ExtNewWindow DoorNewWindow=
{
	412,194,			/* top left x,y */
	228,318,			/* width, height */
	0,1,				/* detail pen, block pen */
	GADGETDOWN |
	GADGETUP |			/* IDCMP flags */
	RAWKEY |
	MENUPICK,
	SMART_REFRESH |			/* flags */
        WINDOWDEPTH,
	&Door1Gadget,			/* first gadget */
	NULL,				/* check mark */
	(UBYTE*)"Door",
	NULL,				/* screen */
	NULL,				/* bitmap */
	201,105,			/* minimum width, height */
	201,105,			/* maximum width, height */
	CUSTOMSCREEN,			/* type */
	HGeditWindowTags,              /* tag item */
};

/******************************************************************************/

struct Image an_image=
{
	0,0,				/* top left x,y */
	16,16,				/* width, height */
	3,				/* depth */
	NULL,				/* image data */
	7,				/* plane pick */
	0,				/* plane on, off */
        NULL,				/* next image */
};

struct Gadget LevelHitGadget=
{
	NULL,				/* next gadget */
	4,11,				/* top left x,y */
	MAP_WIDTH*16,MAP_DEPTH*16,	/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
	RELVERIFY,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	1,				/* gadget id */
	NULL,				/* user data */
};

ULONG pastebx=0;
ULONG pasteby=0;
ULONG pastebz=0;
ULONG pastetx=0;
ULONG pastety=0;
ULONG pastetz=0;
ULONG currz=0;
LONG currx=0,curry=0;
LONG last_block_x=-1,last_block_y=-1;
int changed=0;
int drawing=0,last_drawing=0;
int button_dest_mode=0;
struct button *picked_button;
int picked_button_num;
ULONG picked_button_target=0;
int picked_button_target_x,picked_button_target_y,picked_button_target_z;
UBYTE picked_button_action_in;
UBYTE picked_button_action_out;
struct map_cell1 stone_block={
	0,
	0,
	0,
	0,
	0,
        0,
	0,
	0,0,1,0,0,0,0,1,0 };
struct map_cell1 picked_block;
struct map_cell2 picked_block2;
struct map_cell3 picked_block3;
struct map_cell1 *mem_posn1;
struct map_cell2 *mem_posn2;
struct map_cell3 *mem_posn3;
struct lift picked_lift;
struct door picked_door;

struct Image LevelImage=
{
	0,0,				/* top left x,y */
	0,0,				/* width, height */
	0,				/* depth */
	0,				/* image data */
	0,				/* plane pick */
	0,				/* plane on, off */
        0,				/* next image */
};

struct PropInfo LevelProp=
{
	AUTOKNOB |			/* flags */
	PROPNEWLOOK |
	FREEVERT,
	0,				/* horiz pot */
	0,				/* vert pot */
	0,				/* horiz body */
	3449,				/* vert body */
	NULL,				/* cwidth */
	NULL,				/* cheight */
	NULL,				/* hpotres */
	NULL,				/* vpotres */
	NULL,				/* left border */
	NULL,				/* top border */
};

struct Gadget LevelGadget=
{
	NULL,				/* next gadget */
	412-16,12,			/* top left x,y */
	11,17*23-1,			/* width, height */
	GADGHCOMP,			/* flags */
	RELVERIFY,
	PROPGADGET,			/* gadget type */
	&LevelImage,			/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	&LevelProp,			/* special info */
	1,				/* gadget id */
	NULL,				/* user data */
};

struct Window *LevelWindow;
struct ExtNewWindow LevelNewWindow=
{
	0,100,				/* top left x,y */
	412,412,			/* width, height */
	0,1,				/* detail pen, block pen */
	MOUSEBUTTONS |			/* IDCMP flags */
	IDCMP_ACTIVEWINDOW |
	IDCMP_INACTIVEWINDOW |
	GADGETUP |
	RAWKEY,
	SMART_REFRESH |			/* flags */
        WINDOWDEPTH |
	RMBTRAP,
	&LevelGadget,			/* first gadget */
	NULL,				/* check mark */
	(UBYTE*)"Level",
	NULL,				/* screen */
	NULL,				/* bitmap */
	114,59,				/* minimum width, height */
	640,512,			/* maximum width, height */
	CUSTOMSCREEN,			/* type */
	HGeditWindowTags,              /* tag item */
};

/******************************************************************************/

struct Window *InfoWindow;
struct ExtNewWindow InfoNewWindow=
{
	0,100,				/* top left x,y */
	412,412,			/* width, height */
	0,1,				/* detail pen, block pen */
	MENUPICK |
	RAWKEY |
	MOUSEBUTTONS,
	SMART_REFRESH |			/* flags */
        WINDOWDEPTH,
	NULL,				/* first gadget */
	NULL,				/* check mark */
	(STRPTR)"Text Panels",
	NULL,				/* screen */
	NULL,				/* bitmap */
	114,59,				/* minimum width, height */
	640,256,			/* maximum width, height */
	CUSTOMSCREEN,			/* type */
	HGeditWindowTags,              /* tag item */
};

/******************************************************************************/

struct Gadget MonsStr4Gadget=
{
	NULL,				/* next gadget */
	47+2,336+22+12*3,		/* top left x,y */
	319-4,11,			/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	44,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget MonsStr3Gadget=
{
	&MonsStr4Gadget,		/* next gadget */
	47+2,336+22+12*2,		/* top left x,y */
	319-4,11,			/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	43,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget MonsStr2Gadget=
{
	&MonsStr3Gadget,		/* next gadget */
	47+2,336+22+12*1,		/* top left x,y */
	319-4,11,			/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	42,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget MonsStr1Gadget=
{
	&MonsStr2Gadget,		/* next gadget */
	47+2,336+22+12*0,		/* top left x,y */
	319-4,11,			/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	41,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget MonsLoad20Gadget=
{
	&MonsStr1Gadget,		/* next gadget */
	47+24+4*64,13+65+3*80,		/* top left x,y */
	38,12,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	40,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget MonsLoad19Gadget=
{
	&MonsLoad20Gadget,		/* next gadget */
	47+24+3*64,13+65+3*80,		/* top left x,y */
	38,12,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	39,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget MonsLoad18Gadget=
{
	&MonsLoad19Gadget,		/* next gadget */
	47+24+2*64,13+65+3*80,		/* top left x,y */
	38,12,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	38,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget MonsLoad17Gadget=
{
	&MonsLoad18Gadget,		/* next gadget */
	47+24+1*64,13+65+3*80,		/* top left x,y */
	38,12,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	37,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget MonsLoad16Gadget=
{
	&MonsLoad17Gadget,		/* next gadget */
	47+24+0*64,13+65+3*80,		/* top left x,y */
	38,12,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	36,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget MonsLoad15Gadget=
{
	&MonsLoad16Gadget,		/* next gadget */
	47+24+4*64,13+65+2*80,		/* top left x,y */
	38,12,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	35,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget MonsLoad14Gadget=
{
	&MonsLoad15Gadget,		/* next gadget */
	47+24+3*64,13+65+2*80,		/* top left x,y */
	38,12,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	34,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget MonsLoad13Gadget=
{
	&MonsLoad14Gadget,		/* next gadget */
	47+24+2*64,13+65+2*80,		/* top left x,y */
	38,12,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	33,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget MonsLoad12Gadget=
{
	&MonsLoad13Gadget,		/* next gadget */
	47+24+1*64,13+65+2*80,		/* top left x,y */
	38,12,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	32,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget MonsLoad11Gadget=
{
	&MonsLoad12Gadget,		/* next gadget */
	47+24+0*64,13+65+2*80,		/* top left x,y */
	38,12,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	31,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget MonsLoad10Gadget=
{
	&MonsLoad11Gadget,		/* next gadget */
	47+24+4*64,13+65+1*80,		/* top left x,y */
	38,12,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	30,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget MonsLoad9Gadget=
{
	&MonsLoad10Gadget,		/* next gadget */
	47+24+3*64,13+65+1*80,		/* top left x,y */
	38,12,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	29,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget MonsLoad8Gadget=
{
	&MonsLoad9Gadget,		/* next gadget */
	47+24+2*64,13+65+1*80,		/* top left x,y */
	38,12,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	28,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget MonsLoad7Gadget=
{
	&MonsLoad8Gadget,		/* next gadget */
	47+24+1*64,13+65+1*80,		/* top left x,y */
	38,12,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	27,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget MonsLoad6Gadget=
{
	&MonsLoad7Gadget,		/* next gadget */
	47+24+0*64,13+65+1*80,		/* top left x,y */
	38,12,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	26,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget MonsLoad5Gadget=
{
	&MonsLoad6Gadget,		/* next gadget */
	47+24+4*64,13+65+0*80,		/* top left x,y */
	38,12,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	25,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget MonsLoad4Gadget=
{
	&MonsLoad5Gadget,		/* next gadget */
	47+24+3*64,13+65+0*80,		/* top left x,y */
	38,12,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	24,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget MonsLoad3Gadget=
{
	&MonsLoad4Gadget,		/* next gadget */
	47+24+2*64,13+65+0*80,		/* top left x,y */
	38,12,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	23,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget MonsLoad2Gadget=
{
	&MonsLoad3Gadget,		/* next gadget */
	47+24+1*64,13+65+0*80,		/* top left x,y */
	38,12,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	22,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget MonsLoad1Gadget=
{
	&MonsLoad2Gadget,		/* next gadget */
	47+24+0*64,13+65+0*80,		/* top left x,y */
	38,12,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	21,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget Mons20Gadget=
{
	&MonsLoad1Gadget,		/* next gadget */
	47+4*64,13+3*80,		/* top left x,y */
	64,64,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	20,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget Mons19Gadget=
{
	&Mons20Gadget,			/* next gadget */
	47+3*64,13+3*80,		/* top left x,y */
	64,64,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	19,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget Mons18Gadget=
{
	&Mons19Gadget,			/* next gadget */
	47+2*64,13+3*80,		/* top left x,y */
	64,64,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	18,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget Mons17Gadget=
{
	&Mons18Gadget,			/* next gadget */
	47+1*64,13+3*80,		/* top left x,y */
	64,64,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	17,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget Mons16Gadget=
{
	&Mons17Gadget,			/* next gadget */
	47+0*64,13+3*80,		/* top left x,y */
	64,64,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	16,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget Mons15Gadget=
{
	&Mons16Gadget,			/* next gadget */
	47+4*64,13+2*80,		/* top left x,y */
	64,64,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	15,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget Mons14Gadget=
{
	&Mons15Gadget,			/* next gadget */
	47+3*64,13+2*80,		/* top left x,y */
	64,64,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	14,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget Mons13Gadget=
{
	&Mons14Gadget,			/* next gadget */
	47+2*64,13+2*80,		/* top left x,y */
	64,64,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	13,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget Mons12Gadget=
{
	&Mons13Gadget,			/* next gadget */
	47+1*64,13+2*80,		/* top left x,y */
	64,64,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	12,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget Mons11Gadget=
{
	&Mons12Gadget,			/* next gadget */
	47+0*64,13+2*80,		/* top left x,y */
	64,64,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	11,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget Mons10Gadget=
{
	&Mons11Gadget,			/* next gadget */
	47+4*64,13+1*80,		/* top left x,y */
	64,64,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	10,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget Mons9Gadget=
{
	&Mons10Gadget,			/* next gadget */
	47+3*64,13+1*80,		/* top left x,y */
	64,64,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	9,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget Mons8Gadget=
{
	&Mons9Gadget,			/* next gadget */
	47+2*64,13+1*80,		/* top left x,y */
	64,64,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	8,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget Mons7Gadget=
{
	&Mons8Gadget,			/* next gadget */
	47+1*64,13+1*80,		/* top left x,y */
	64,64,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	7,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget Mons6Gadget=
{
	&Mons7Gadget,			/* next gadget */
	47+0*64,13+1*80,		/* top left x,y */
	64,64,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	6,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget Mons5Gadget=
{
	&Mons6Gadget,			/* next gadget */
	47+4*64,13+0*80,		/* top left x,y */
	64,64,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	5,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget Mons4Gadget=
{
	&Mons5Gadget,			/* next gadget */
	47+3*64,13+0*80,		/* top left x,y */
	64,64,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	4,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget Mons3Gadget=
{
	&Mons4Gadget,			/* next gadget */
	47+2*64,13+0*80,		/* top left x,y */
	64,64,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	3,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget Mons2Gadget=
{
	&Mons3Gadget,			/* next gadget */
	47+1*64,13+0*80,		/* top left x,y */
	64,64,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	2,				/* gadget id */
	NULL,				/* user data */
};

struct Gadget Mons1Gadget=
{
	&Mons2Gadget,			/* next gadget */
	47+0*64,13+0*80,		/* top left x,y */
	64,64,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	1,				/* gadget id */
	NULL,				/* user data */
};

struct Window *MonsWindow;
struct ExtNewWindow MonsNewWindow=
{
	0,100,				/* top left x,y */
	412,412,			/* width, height */
	0,1,				/* detail pen, block pen */
	MENUPICK |
	RAWKEY |
	GADGETDOWN,
	SMART_REFRESH |			/* flags */
        WINDOWDEPTH,
	&Mons1Gadget,			/* first gadget */
	NULL,				/* check mark */
	(STRPTR)"Monsters",
	NULL,				/* screen */
	NULL,				/* bitmap */
	114,59,				/* minimum width, height */
	640,256,			/* maximum width, height */
	CUSTOMSCREEN,			/* type */
	HGeditWindowTags,              /* tag item */
};

/******************************************************************************/

char World26Buffer[5];
char World26UndoBuffer[5];
struct StringInfo World26Info=
{
	World26Buffer,			/* buffer */
	World26UndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        3,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	3,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget World26Gadget=
{
	NULL,				/* next gadget */
	17+126+192,50+290+6*8,		/* top left x,y */
	32,13,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&World26Info,		/* special info */
	26,				/* gadget id */
	NULL,				/* user data */
};
char World25Buffer[5];
char World25UndoBuffer[5];
struct StringInfo World25Info=
{
	World25Buffer,			/* buffer */
	World25UndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        3,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	3,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget World25Gadget=
{
	&World26Gadget,			/* next gadget */
	17+126+128,50+290+6*8,		/* top left x,y */
	32,13,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&World25Info,		/* special info */
	25,				/* gadget id */
	NULL,				/* user data */
};
char World24Buffer[5];
char World24UndoBuffer[5];
struct StringInfo World24Info=
{
	World24Buffer,			/* buffer */
	World24UndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        3,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	3,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget World24Gadget=
{
	&World25Gadget,			/* next gadget */
	17+126+64,50+290+6*8,		/* top left x,y */
	32,13,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&World24Info,		/* special info */
	24,				/* gadget id */
	NULL,				/* user data */
};
char World23Buffer[5];
char World23UndoBuffer[5];
struct StringInfo World23Info=
{
	World23Buffer,			/* buffer */
	World23UndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        3,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	3,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget World23Gadget=
{
	&World24Gadget,			/* next gadget */
	126+17,50+290+6*8,			/* top left x,y */
	32,13,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&World23Info,		/* special info */
	23,				/* gadget id */
	NULL,				/* user data */
};

char World22Buffer[65];
char World22UndoBuffer[65];
struct StringInfo World22Info=
{
	World22Buffer,			/* buffer */
	World22UndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        61,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	61,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget World22Gadget=
{
	&World23Gadget,			/* next gadget */
	17,20+290+6*8,			/* top left x,y */
	46*8,13,			/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY,			/* activation */
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&World22Info,		/* special info */
	22,				/* gadget id */
	NULL,				/* user data */
};
char World21Buffer[65];
char World21UndoBuffer[65];
struct StringInfo World21Info=
{
	World21Buffer,			/* buffer */
	World21UndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        61,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	61,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget World21Gadget=
{
	&World22Gadget,			/* next gadget */
	17,20+280+6*8,				/* top left x,y */
	46*8,13,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY,			/* activation */
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&World21Info,		/* special info */
	21,				/* gadget id */
	NULL,				/* user data */
};
char World20Buffer[65];
char World20UndoBuffer[65];
struct StringInfo World20Info=
{
	World20Buffer,			/* buffer */
	World20UndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        61,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	61,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget World20Gadget=
{
	&World21Gadget,			/* next gadget */
	17,20+270+6*8,				/* top left x,y */
	46*8,13,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY,			/* activation */
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&World20Info,		/* special info */
	20,				/* gadget id */
	NULL,				/* user data */
};
char World19Buffer[65];
char World19UndoBuffer[65];
struct StringInfo World19Info=
{
	World19Buffer,			/* buffer */
	World19UndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        61,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	61,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget World19Gadget=
{
	&World20Gadget,			/* next gadget */
	17,20+260+6*8,			/* top left x,y */
	46*8,13,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY,			/* activation */
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&World19Info,		/* special info */
	19,				/* gadget id */
	NULL,				/* user data */
};
char World18Buffer[65];
char World18UndoBuffer[65];
struct StringInfo World18Info=
{
	World18Buffer,			/* buffer */
	World18UndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        61,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	61,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget World18Gadget=
{
	&World19Gadget,			/* next gadget */
	17,290,				/* top left x,y */
	46*8,13,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY,			/* activation */
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&World18Info,		/* special info */
	18,				/* gadget id */
	NULL,				/* user data */
};
char World17Buffer[65];
char World17UndoBuffer[65];
struct StringInfo World17Info=
{
	World17Buffer,			/* buffer */
	World17UndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        61,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	61,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget World17Gadget=
{
	&World18Gadget,			/* next gadget */
	17,280,				/* top left x,y */
	46*8,13,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY,			/* activation */
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&World17Info,		/* special info */
	17,				/* gadget id */
	NULL,				/* user data */
};
char World16Buffer[65];
char World16UndoBuffer[65];
struct StringInfo World16Info=
{
	World16Buffer,			/* buffer */
	World16UndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        61,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	61,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget World16Gadget=
{
	&World17Gadget,			/* next gadget */
	17,270,				/* top left x,y */
	46*8,13,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY,			/* activation */
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&World16Info,		/* special info */
	16,				/* gadget id */
	NULL,				/* user data */
};
char World15Buffer[50];
char World15UndoBuffer[50];
struct StringInfo World15Info=
{
	World15Buffer,			/* buffer */
	World15UndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        46,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	46,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget World15Gadget=
{
	&World16Gadget,			/* next gadget */
	17,260,				/* top left x,y */
	46*8,13,			/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY,			/* activation */
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&World15Info,		/* special info */
	15,				/* gadget id */
	NULL,				/* user data */
};




char World14bBuffer[5];
char World14bUndoBuffer[5];
struct StringInfo World14bInfo=
{
	World14bBuffer,			/* buffer */
	World14bUndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        3,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	3,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct IntuiText World14bText={1,0,JAM2,-(4*8)-32,1,NULL,(UBYTE*)"Players",NULL,};
struct Gadget World14bGadget=
{
	&World15Gadget,			/* next gadget */
	12+275+50+16,205,			/* top left x,y */
	32,13,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&World14bText,			/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&World14bInfo,		/* special info */
	27,				/* gadget id */
	NULL,				/* user data */
};
char World14Buffer[5];
char World14UndoBuffer[5];
struct StringInfo World14Info=
{
	World14Buffer,			/* buffer */
	World14UndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        3,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	3,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct IntuiText World14Text={1,0,JAM2,-(4*8)-32,1,NULL,(UBYTE*)"Style",NULL,};
struct Gadget World14Gadget=
{
	&World14bGadget,			/* next gadget */
	12+275+50+16,185,			/* top left x,y */
	32,13,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&World14Text,			/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&World14Info,		/* special info */
	14,				/* gadget id */
	NULL,				/* user data */
};
char World13Buffer[5];
char World13UndoBuffer[5];
struct StringInfo World13Info=
{
	World13Buffer,			/* buffer */
	World13UndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        3,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	3,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct IntuiText World13Text={1,0,JAM2,-(4*8)-32,1,NULL,(UBYTE*)"Sky",NULL,};
struct Gadget World13Gadget=
{
	&World14Gadget,			/* next gadget */
	12+275+50+16,165,			/* top left x,y */
	32,13,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&World13Text,			/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&World13Info,		/* special info */
	13,				/* gadget id */
	NULL,				/* user data */
};
char World10Buffer[5];
char World10UndoBuffer[5];
struct StringInfo World10Info=
{
	World10Buffer,			/* buffer */
	World10UndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        3,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	3,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct IntuiText World10Text={1,0,JAM2,-(4*8)-32,1,NULL,(UBYTE*)"Atmos",NULL,};
struct Gadget World10Gadget=
{
	&World13Gadget,			/* next gadget */
	12+275+50+16,145,			/* top left x,y */
	32,13,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&World10Text,			/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&World10Info,		/* special info */
	10,				/* gadget id */
	NULL,				/* user data */
};
char World9Buffer[5];
char World9UndoBuffer[5];
struct StringInfo World9Info=
{
	World9Buffer,			/* buffer */
	World9UndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        3,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	3,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct IntuiText World9Text={1,0,JAM2,-(4*8)-32,1,NULL,(UBYTE*)"Music",NULL,};
struct Gadget World9Gadget=
{
	&World10Gadget,			/* next gadget */
	12+275+50+16,125,			/* top left x,y */
	32,13,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&World9Text,			/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&World9Info,		/* special info */
	9,				/* gadget id */
	NULL,				/* user data */
};
char World8Buffer[5];
char World8UndoBuffer[5];
struct StringInfo World8Info=
{
	World8Buffer,			/* buffer */
	World8UndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        3,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	3,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct IntuiText World8Text={1,0,JAM2,-(4*8)-32,1,NULL,(UBYTE*)"Picture",NULL,};
struct Gadget World8Gadget=
{
	&World9Gadget,			/* next gadget */
	12+275+50+16,105,			/* top left x,y */
	32,13,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&World8Text,			/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&World8Info,		/* special info */
	8,				/* gadget id */
	NULL,				/* user data */
};
char World7Buffer[5];
char World7UndoBuffer[5];
struct StringInfo World7Info=
{
	World7Buffer,			/* buffer */
	World7UndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        3,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	3,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct IntuiText World7Text={1,0,JAM2,-(4*8)-32,1,NULL,(UBYTE*)"File",NULL,};
struct Gadget World7Gadget=
{
	&World8Gadget,			/* next gadget */
	12+275+50+16,85,			/* top left x,y */
	32,13,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&World7Text,			/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&World7Info,		/* special info */
	7,				/* gadget id */
	NULL,				/* user data */
};
char World6Buffer[5];
char World6UndoBuffer[5];
struct StringInfo World6Info=
{
	World6Buffer,			/* buffer */
	World6UndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        3,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	3,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct IntuiText World6Text={1,0,JAM2,-(4*8)-32,1,NULL,(UBYTE*)"Disk",NULL,};
struct Gadget World6Gadget=
{
	&World7Gadget,			/* next gadget */
	12+275+50+16,65,			/* top left x,y */
	32,13,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&World6Text,			/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&World6Info,		/* special info */
	6,				/* gadget id */
	NULL,				/* user data */
};
struct Gadget World5Gadget=
{
	&World6Gadget,			/* next gadget */
	15+4+2,25+4+2,			/* top left x,y */
	240,192,			/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	5,				/* gadget id */
	NULL,				/* user data */
};
struct IntuiText World4Text={1,5,JAM2,16,3,NULL,(UBYTE*)"End",NULL,};
struct Gadget World4Gadget=
{
	&World5Gadget,			/* next gadget */
	275+66,40,			/* top left x,y */
	32+24,13,			/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&World4Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	4,				/* gadget id */
	NULL,				/* user data */
};
struct IntuiText World3Text={1,5,JAM2,4+8,3,NULL,(UBYTE*)"Start",NULL,};
struct Gadget World3Gadget=
{
	&World4Gadget,			/* next gadget */
	275,40,				/* top left x,y */
	48+16,13,			/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&World3Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	3,				/* gadget id */
	NULL,				/* user data */
};
struct IntuiText World2Text={1,5,JAM2,4,3,NULL,(UBYTE*)"Action",NULL,};
struct Gadget World2Gadget=
{
	&World3Gadget,			/* next gadget */
	275+66,25,			/* top left x,y */
	40+16,13,			/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&World2Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	2,				/* gadget id */
	NULL,				/* user data */
};
struct IntuiText World1Text={1,5,JAM2,8,3,NULL,(UBYTE*)"Normal",NULL,};
struct Gadget World1Gadget=
{
	&World2Gadget,			/* next gadget */
	275,25,				/* top left x,y */
	64,13,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&World1Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	1,				/* gadget id */
	NULL,				/* user data */
};

struct Window *WorldWindow;
struct ExtNewWindow WorldNewWindow=
{
	0,100,				/* top left x,y */
	412,412,			/* width, height */
	0,1,				/* detail pen, block pen */
	IDCMP_GADGETDOWN |		/* IDCMP flags */
	IDCMP_GADGETUP |
	RAWKEY |
	IDCMP_MENUPICK,
	SMART_REFRESH |			/* flags */
        WINDOWDEPTH,
	&World1Gadget,			/* first gadget */
	NULL,				/* check mark */
	(UBYTE*)"World",
	NULL,				/* screen */
	NULL,				/* bitmap */
	114,59,				/* minimum width, height */
	640,512,			/* maximum width, height */
	CUSTOMSCREEN,			/* type */
	HGeditWindowTags,              /* tag item */
};

/******************************************************************************/

struct IntuiText ToolsHighlightText={1,0,JAM2,15,3,NULL,(UBYTE*)"Highlight",NULL,};
struct Gadget ToolsHighlightGadget=
{
	NULL,				/* next gadget */
	12+102,11+5,			/* top left x,y */
	101,13,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&ToolsHighlightText,		/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	10,				/* gadget id */
	NULL,				/* user data */
};
struct IntuiText ToolsCutText={1,0,JAM2,38,3,NULL,(UBYTE*)"Cut",NULL,};
struct Gadget ToolsCutGadget=
{
	&ToolsHighlightGadget,		/* next gadget */
	12+102,11+11+11,		/* top left x,y */
	101,13,				/* width, height */
	GADGHCOMP,			/* flags */
	GADGIMMEDIATE |			/* activation */
 	RELVERIFY,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&ToolsCutText,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	9,				/* gadget id */
	NULL,				/* user data */
};
struct IntuiText ToolsCopyText={1,0,JAM2,34,3,NULL,(UBYTE*)"Copy",NULL,};
struct Gadget ToolsCopyGadget=
{
	&ToolsCutGadget,		/* next gadget */
	12+102,11+11+25,		/* top left x,y */
	101,13,				/* width, height */
	GADGHCOMP,			/* flags */
	GADGIMMEDIATE |			/* activation */
 	RELVERIFY,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&ToolsCopyText,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	8,				/* gadget id */
	NULL,				/* user data */
};
struct IntuiText ToolsPasteText={1,0,JAM2,30,3,NULL,(UBYTE*)"Paste",NULL,};
struct Gadget ToolsPasteGadget=
{
	&ToolsCopyGadget,		/* next gadget */
	12+102,11+11+39,		/* top left x,y */
	101,13,				/* width, height */
	GADGHCOMP,			/* flags */
	GADGIMMEDIATE |			/* activation */
 	RELVERIFY,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&ToolsPasteText,		/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	7,				/* gadget id */
	NULL,				/* user data */
};
struct IntuiText ToolsFillText={1,0,JAM2,34,3,NULL,(UBYTE*)"Fill",NULL,};
struct Gadget ToolsFillGadget=
{
	&ToolsPasteGadget,		/* next gadget */
	12+102,11+11+53,		/* top left x,y */
	101,13,				/* width, height */
	GADGHCOMP,			/* flags */
	GADGIMMEDIATE |			/* activation */
 	RELVERIFY,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&ToolsFillText,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	6,				/* gadget id */
	NULL,				/* user data */
};
struct IntuiText ToolsSetWaterText={1,0,JAM2,8,3,NULL,(UBYTE*)"Set Water",NULL,};
struct Gadget ToolsSetWaterGadget=
{
	&ToolsFillGadget,		/* next gadget */
	7+4,11+11+39,			/* top left x,y */
	91,13,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&ToolsSetWaterText,		/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	5,				/* gadget id */
	NULL,				/* user data */
};
struct IntuiText ToolsSetTargtText={1,0,JAM2,8,3,NULL,(UBYTE*)"Set Targt",NULL,};
struct Gadget ToolsSetTargtGadget=
{
	&ToolsSetWaterGadget,		/* next gadget */
	7+4,11+11+53,			/* top left x,y */
	91,13,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&ToolsSetTargtText,		/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	4,				/* gadget id */
	NULL,				/* user data */
};
struct IntuiText ToolsSetBlockText={1,0,JAM2,16,3,NULL,(UBYTE*)"Set Sky",NULL,};
struct Gadget ToolsSetBlockGadget=
{
	&ToolsSetTargtGadget,		/* next gadget */
	7+4,11+11+25,			/* top left x,y */
	91,13,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
	TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&ToolsSetBlockText,		/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	3,				/* gadget id */
	NULL,				/* user data */
};
struct IntuiText ToolsSetAllText={1,0,JAM2,16,3,NULL,(UBYTE*)"Set All",NULL,};
struct Gadget ToolsSetAllGadget=
{
	&ToolsSetBlockGadget,		/* next gadget */
	7+4,11+11+11,			/* top left x,y */
	91,13,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&ToolsSetAllText,		/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	2,				/* gadget id */
	NULL,				/* user data */
};
struct IntuiText ToolsPickText={1,0,JAM2,28,3,NULL,(UBYTE*)"Pick",NULL,};
struct Gadget ToolsPickGadget=
{
	&ToolsSetAllGadget,		/* next gadget */
	7+4,11+5,			/* top left x,y */
	91,13,				/* width, height */
	GADGHNONE,			/* flags */
	GADGIMMEDIATE |			/* activation */
        TOGGLESELECT,
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&ToolsPickText,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	1,				/* gadget id */
	NULL,				/* user data */
};

int current_tool=0;
int highlight_flag=0;

struct Window *ToolsWindow;
struct ExtNewWindow ToolsNewWindow=
{
	412,100,			/* top left x,y */
	228,94,				/* width, height */
	0,1,				/* detail pen, block pen */
	GADGETDOWN |			/* IDCMP flags */
	RAWKEY |
	MENUPICK |
	GADGETUP,
	SMART_REFRESH,			/* flags */
	&ToolsPickGadget,		/* first gadget */
	NULL,				/* check mark */
	(STRPTR)"Tools",
	NULL,				/* screen */
	NULL,				/* bitmap */
	114,59,				/* minimum width, height */
	640,256,			/* maximum width, height */
	CUSTOMSCREEN,			/* type */
	HGeditWindowTags,              /* tag item */
};

/******************************************************************************/

struct IntuiText LevelDownText={1,0,JAM2,7,4,NULL,(UBYTE*)"<",NULL,};
struct IntuiText LevelUpText={1,0,JAM2,7,4,NULL,(UBYTE*)">",NULL,};

struct IntuiText LevelPl4Text={1,5,JAM2,3,3,NULL,(UBYTE*)"Set",NULL,};
struct Gadget LevelPl4Gadget=
{
	NULL,				/* next gadget */
	4+211+40-2,11+56-1,		/* top left x,y */
	13+64-6*8,13,			/* width, height */
	GADGHNONE,			/* flags */
	RELVERIFY,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&LevelPl4Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	24,				/* gadget id */
	NULL,				/* user data */
};
struct IntuiText LevelPl3Text={1,5,JAM2,3,3,NULL,(UBYTE*)"Set",NULL,};
struct Gadget LevelPl3Gadget=
{
	&LevelPl4Gadget,		/* next gadget */
	4+211+40-2,11+37-1,		/* top left x,y */
	13+64-6*8,13,			/* width, height */
	GADGHNONE,			/* flags */
	RELVERIFY,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&LevelPl3Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	23,				/* gadget id */
	NULL,				/* user data */
};
struct IntuiText LevelPl2Text={1,5,JAM2,3,3,NULL,(UBYTE*)"Set",NULL,};
struct Gadget LevelPl2Gadget=
{
	&LevelPl3Gadget,		/* next gadget */
	4+13+40-2,11+56-1,		/* top left x,y */
	13+64-6*8,13,			/* width, height */
	GADGHNONE,			/* flags */
	RELVERIFY,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&LevelPl2Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	22,				/* gadget id */
	NULL,				/* user data */
};
struct IntuiText LevelPl1Text={1,5,JAM2,3,3,NULL,(UBYTE*)"Set",NULL,};
struct Gadget LevelPl1Gadget=
{
	&LevelPl2Gadget,		/* next gadget */
	4+13+40-2,11+37-1,		/* top left x,y */
	13+64-6*8,13,			/* width, height */
	GADGHNONE,			/* flags */
	RELVERIFY,			/* activation */
	BOOLGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	&LevelPl1Text,			/* gadget text */
	NULL,				/* mutual exclude */
	NULL,				/* special info */
	21,				/* gadget id */
	NULL,				/* user data */
};
char TimeBuffer[4];
char TimeUndoBuffer[4];
struct StringInfo TimeInfo=
{
	TimeBuffer,			/* buffer */
	TimeUndoBuffer,			/* undo buffer */
	0,				/* buffer position */
        3,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	3,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget TimeGadget=
{
	&LevelPl1Gadget,		/* next gadget */
	4+420+1+24+147,11+12,		/* top left x,y */
	100-48-16,13,			/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&TimeInfo,		/* special info */
	18,				/* gadget id */
	NULL,				/* user data */
};
char WaterSpeedBuffer[4];
char WaterSpeedUndoBuffer[4];
struct StringInfo WaterSpeedInfo=
{
	WaterSpeedBuffer,		/* buffer */
	WaterSpeedUndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        3,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	3,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget WaterSpeedGadget=
{
	&TimeGadget,			/* next gadget */
	4+83+6+375+16,46+22,		/* top left x,y */
	24,10,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&WaterSpeedInfo,	/* special info */
	16,				/* gadget id */
	NULL,				/* user data */
};
char WaterMaxBuffer[4];
char WaterMaxUndoBuffer[4];
struct StringInfo WaterMaxInfo=
{
	WaterMaxBuffer,			/* buffer */
	WaterMaxUndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        3,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	3,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget WaterMaxGadget=
{
	&WaterSpeedGadget,		/* next gadget */
	4+83+6+503,46+22,		/* top left x,y */
	24,10,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&WaterMaxInfo,		/* special info */
	15,				/* gadget id */
	NULL,				/* user data */
};
char WaterMinBuffer[4];
char WaterMinUndoBuffer[4];
struct StringInfo WaterMinInfo=
{
	WaterMinBuffer,			/* buffer */
	WaterMinUndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        3,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	3,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget WaterMinGadget=
{
	&WaterMaxGadget,		/* next gadget */
	4+83+6+503,46+3,		/* top left x,y */
	24,10,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&WaterMinInfo,		/* special info */
	14,				/* gadget id */
	NULL,				/* user data */
};
char Pl3ZBuffer[4];
char Pl3ZUndoBuffer[4];
struct StringInfo Pl3ZInfo=
{
	Pl3ZBuffer,			/* buffer */
	Pl3ZUndoBuffer,			/* undo buffer */
	0,				/* buffer position */
        3,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	3,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget Pl3ZGadget=
{
	&WaterMinGadget,		/* next gadget */
	4+83+6+282,46+3,		/* top left x,y */
	24,10,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&Pl3ZInfo,		/* special info */
	13,				/* gadget id */
	NULL,				/* user data */
};
char Pl3YBuffer[4];
char Pl3YUndoBuffer[4];
struct StringInfo Pl3YInfo=
{
	Pl3YBuffer,			/* buffer */
	Pl3YUndoBuffer,			/* undo buffer */
	0,				/* buffer position */
        3,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	3,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget Pl3YGadget=
{
	&Pl3ZGadget,			/* next gadget */
	4+83+6+241,46+3,		/* top left x,y */
	24,10,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&Pl3YInfo,		/* special info */
	12,				/* gadget id */
	NULL,				/* user data */
};
char Pl3XBuffer[4];
char Pl3XUndoBuffer[4];
struct StringInfo Pl3XInfo=
{
	Pl3XBuffer,			/* buffer */
	Pl3XUndoBuffer,			/* undo buffer */
	0,				/* buffer position */
        3,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	3,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget Pl3XGadget=
{
	&Pl3YGadget,			/* next gadget */
	4+83+6+200,46+3,		/* top left x,y */
	24,10,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&Pl3XInfo,		/* special info */
	11,				/* gadget id */
	NULL,				/* user data */
};
char Pl4ZBuffer[4];
char Pl4ZUndoBuffer[4];
struct StringInfo Pl4ZInfo=
{
	Pl4ZBuffer,			/* buffer */
	Pl4ZUndoBuffer,			/* undo buffer */
	0,				/* buffer position */
        3,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	3,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget Pl4ZGadget=
{
	&Pl3XGadget,			/* next gadget */
	4+83+6+282,46+22,		/* top left x,y */
	24,10,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&Pl4ZInfo,		/* special info */
	10,				/* gadget id */
	NULL,				/* user data */
};
char Pl4YBuffer[4];
char Pl4YUndoBuffer[4];
struct StringInfo Pl4YInfo=
{
	Pl4YBuffer,			/* buffer */
	Pl4YUndoBuffer,			/* undo buffer */
	0,				/* buffer position */
        3,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	3,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget Pl4YGadget=
{
	&Pl4ZGadget,			/* next gadget */
	4+83+6+241,46+22,		/* top left x,y */
	24,10,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&Pl4YInfo,		/* special info */
	9,				/* gadget id */
	NULL,				/* user data */
};
char Pl4XBuffer[4];
char Pl4XUndoBuffer[4];
struct StringInfo Pl4XInfo=
{
	Pl4XBuffer,			/* buffer */
	Pl4XUndoBuffer,			/* undo buffer */
	0,				/* buffer position */
        3,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	3,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget Pl4XGadget=
{
	&Pl4YGadget,			/* next gadget */
	4+83+6+200,46+22,		/* top left x,y */
	24,10,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&Pl4XInfo,		/* special info */
	8,				/* gadget id */
	NULL,				/* user data */
};
char Pl2ZBuffer[4];
char Pl2ZUndoBuffer[4];
struct StringInfo Pl2ZInfo=
{
	Pl2ZBuffer,			/* buffer */
	Pl2ZUndoBuffer,			/* undo buffer */
	0,				/* buffer position */
        3,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	3,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget Pl2ZGadget=
{
	&Pl4XGadget,			/* next gadget */
	4+83+6+82,46+22,		/* top left x,y */
	24,10,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&Pl2ZInfo,		/* special info */
	7,				/* gadget id */
	NULL,				/* user data */
};
char Pl2YBuffer[4];
char Pl2YUndoBuffer[4];
struct StringInfo Pl2YInfo=
{
	Pl2YBuffer,			/* buffer */
	Pl2YUndoBuffer,			/* undo buffer */
	0,				/* buffer position */
        3,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	3,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget Pl2YGadget=
{
	&Pl2ZGadget,			/* next gadget */
	4+83+6+41,46+22,		/* top left x,y */
	24,10,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&Pl2YInfo,		/* special info */
	6,				/* gadget id */
	NULL,				/* user data */
};
char Pl2XBuffer[4];
char Pl2XUndoBuffer[4];
struct StringInfo Pl2XInfo=
{
	Pl2XBuffer,			/* buffer */
	Pl2XUndoBuffer,			/* undo buffer */
	0,				/* buffer position */
        3,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	3,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget Pl2XGadget=
{
	&Pl2YGadget,			/* next gadget */
	4+83+6,46+22,			/* top left x,y */
	24,10,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&Pl2XInfo,		/* special info */
	5,				/* gadget id */
	NULL,				/* user data */
};
char Pl1ZBuffer[4];
char Pl1ZUndoBuffer[4];
struct StringInfo Pl1ZInfo=
{
	Pl1ZBuffer,			/* buffer */
	Pl1ZUndoBuffer,			/* undo buffer */
	0,				/* buffer position */
        3,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	3,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget Pl1ZGadget=
{
	&Pl2XGadget,			/* next gadget */
	4+83+6+82,46+3,			/* top left x,y */
	24,10,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&Pl1ZInfo,		/* special info */
	4,				/* gadget id */
	NULL,				/* user data */
};
char Pl1YBuffer[4];
char Pl1YUndoBuffer[4];
struct StringInfo Pl1YInfo=
{
	Pl1YBuffer,			/* buffer */
	Pl1YUndoBuffer,			/* undo buffer */
	0,				/* buffer position */
        3,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	3,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget Pl1YGadget=
{
	&Pl1ZGadget,			/* next gadget */
	4+83+6+41,46+3,			/* top left x,y */
	24,10,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&Pl1YInfo,		/* special info */
	3,				/* gadget id */
	NULL,				/* user data */
};
char Pl1XBuffer[4];
char Pl1XUndoBuffer[4];
struct StringInfo Pl1XInfo=
{
	Pl1XBuffer,			/* buffer */
	Pl1XUndoBuffer,			/* undo buffer */
	0,				/* buffer position */
        3,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	3,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget Pl1XGadget=
{
	&Pl1YGadget,			/* next gadget */
	4+83+6,46+3,			/* top left x,y */
	24,10,				/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY |			/* activation */
	LONGINT,
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&Pl1XInfo,		/* special info */
	2,				/* gadget id */
	NULL,				/* user data */
};
char MapNameBuffer[121];
char MapNameUndoBuffer[121];
struct StringInfo MapNameInfo=
{
	MapNameBuffer,			/* buffer */
	MapNameUndoBuffer,		/* undo buffer */
	0,				/* buffer position */
        119,				/* string size */
	0,				/* display position */
	0,				/* undo position */
	0,				/* num chars */
	119,				/* display counter */
	0,0,				/* c left, c top */
	NULL,				/* LayerPtr */
	0,				/* LongInt */
	NULL,				/* alt key map */
};
struct Gadget MapNameGadget=
{
	&Pl1XGadget,			/* next gadget */
	4+61,11+12,			/* top left x,y */
	256+144,13,			/* width, height */
	GADGHCOMP |			/* flags */
	GFLG_TABCYCLE,
	RELVERIFY,			/* activation */
	STRGADGET,			/* gadget type */
	NULL,				/* gadget render */
	NULL,				/* select render */
	NULL,				/* gadget text */
	NULL,				/* mutual exclude */
	(ULONG*)&MapNameInfo,		/* special info */
	1,				/* gadget id */
	NULL,				/* user data */
};
struct Window *MapWindow;
struct ExtNewWindow MapNewWindow=
{
	0,11,				/* top left x,y */
	640,89,				/* width, height */
	0,1,				/* detail pen, block pen */
	MENUPICK |
	RAWKEY |
	GADGETUP,
	SMART_REFRESH |			/* flags */
	ACTIVATE,
	&MapNameGadget,			/* first gadget */
	NULL,				/* check mark */
	(STRPTR)"Map",
	NULL,				/* screen */
	NULL,				/* bitmap */
	114,59,				/* minimum width, height */
	640,256,			/* maximum width, height */
	CUSTOMSCREEN,			/* type */
	HGeditWindowTags,              /* tag item */
};

/******************************************************************************/

struct GetLongStruct MyLong=
{
	"Fitness Boost",		/* title */
	(LONG)0,			/* default value */
	(LONG)0,			/* minimum */
	(LONG)65535,			/* maximum */
	(LONG)0,			/* result */
	NULL,				/* pointer to window */
	(WORD)0,			/* version (must be zero) */
	GLNODEFAULTM,			/* Some, uh flags */
	(LONG)0,			/* leave zero */
};

struct GetLongStruct MyLong2=
{
	"Psi Effect",			/* title */
	(LONG)0,			/* default value */
	(LONG)0,			/* minimum */
	(LONG)65535,			/* maximum */
	(LONG)0,			/* result */
	NULL,				/* pointer to window */
	(WORD)0,			/* version (must be zero) */
	GLNODEFAULTM,			/* Some, uh flags */
	(LONG)0,			/* leave zero */
};

/******************************************************************************/

struct map_cell1 *mp1(x,y,z)
ULONG x,y,z;
{
	return ((struct map_cell1*)((ULONG)(&MapData->map_part1)+z*FLOOR_SIZE*4+y*MAP_WIDTH*4+x*4));
}

/******************************************************************************/

struct map_cell2 *mp2(x,y,z)
ULONG x,y,z;
{
	return ((struct map_cell2*)((ULONG)(&MapData->map_part2)+z*FLOOR_SIZE*4+y*MAP_WIDTH*4+x*4));
}

/******************************************************************************/

struct map_cell3 *mp3(x,y,z)
ULONG x,y,z;
{
	return ((struct map_cell3*)((ULONG)(&MapData->map_part3)+z*FLOOR_SIZE*4+y*MAP_WIDTH*4+x*4));
}

/******************************************************************************/

struct map_cell1 *pb1(x,y,z)
ULONG x,y,z;
{
	return ((struct map_cell1*)((ULONG)(&PasteBuffer->map_part1)+z*FLOOR_SIZE*4+y*MAP_WIDTH*4+x*4));
}

/******************************************************************************/

struct map_cell2 *pb2(x,y,z)
ULONG x,y,z;
{
	return ((struct map_cell2*)((ULONG)(&PasteBuffer->map_part2)+z*FLOOR_SIZE*4+y*MAP_WIDTH*4+x*4));
}

/******************************************************************************/

struct map_cell3 *pb3(x,y,z)
ULONG x,y,z;
{
	return ((struct map_cell3*)((ULONG)(&PasteBuffer->map_part3)+z*FLOOR_SIZE*4+y*MAP_WIDTH*4+x*4));
}

/******************************************************************************/

struct FileRequester ReqFileStruct;
char ReqFilename[FCHARS];
char ReqDirectoryName[DSIZE]="";
char fname[DSIZE+FCHARS];

int file_request(title)
char *title;
{
	fname[0]=0;
	ReqFileStruct.Title=title;		/* initialise pathname */
	ReqFileStruct.PathName=fname;		/* initialise pathname */
	ReqFileStruct.Dir=ReqDirectoryName;
	ReqFileStruct.File=ReqFilename;
	ReqFileStruct.Flags=FRQCACHINGM;	/* directory cache on */
	ReqFileStruct.dirnamescolor=2;		/* some colours */
	ReqFileStruct.devicenamescolor=2;
	ReqFileStruct.detailcolor=1;
	ReqFileStruct.blockcolor=3;
	ReqFileStruct.gadgettextcolor=2;
	ReqFileStruct.textmessagecolor=1;
	ReqFileStruct.stringnamecolor=1;
	ReqFileStruct.stringgadgetcolor=1;
	ReqFileStruct.boxbordercolor=3;
	ReqFileStruct.gadgetboxcolor=1;

	if (FileRequester(&ReqFileStruct))
		return(1);
	else
		return(0);
}

/******************************************************************************/

void reverse(string,length)
register char *string;
register int length;
{
	register int c,i;
	for (i=0;i<length;i++,length--)
        {
		c=string[i];
		string[i]=string[length];
		string[length]=c;
	}
}

/******************************************************************************/

void itoa2(num,dest)
register ULONG num;
register char *dest;
{
	register int i=0;
	register int sign=FALSE;

	if (num<0)
	{
		sign=TRUE;
		num=-num;
	}
	do dest[i++]=num%10+'0'; while (num/=10);
	dest[i]=0;
	reverse(dest,i-1);
}

/******************************************************************************/

void itoa3(num,dest)
register ULONG num;
register char *dest;
{
	register int i=0;
	register int sign=FALSE;

	if (num<0)
	{
		sign=TRUE;
		num=-num;
	}
	do dest[i++]=num%10+'0'; while (num/=10);
	reverse(dest,i-1);
}

/******************************************************************************/

void strcpy2(dest,source,max)
register char *dest,*source;
register int max;
{
	while ((*source) && (max-->0)) *dest++=*source++;
}

/******************************************************************************/

struct IntuiText some_text={0,0,JAM2,0,0,NULL,0,NULL};

void draw_text(port,x,y,penA,penB,text)
struct RastPort *port;
SHORT x,y;
UBYTE penA,penB;
char *text;
{
        some_text.FrontPen=penA;
        some_text.BackPen=penB;
        some_text.IText=text;
	PrintIText(port,&some_text,x,y);
}

/******************************************************************************/

void copy_map_cell1(destination,source)
struct map_cell1 *destination,*source;
{
	destination->auxiliary=source->auxiliary;
	destination->variant=source->variant;
	destination->explosion=source->explosion;
	destination->panel=source->panel;
	destination->water=source->water;
	destination->block=source->block;
	destination->floor=source->floor;
	destination->pushable_bit=source->pushable_bit;
	destination->invisible_bit=source->invisible_bit;
	destination->opaque_bit=source->opaque_bit;
	destination->aux_here_bit=source->aux_here_bit;
	destination->explosion_here_bit=source->explosion_here_bit;
	destination->panel_here_bit=source->panel_here_bit;
	destination->water_here_bit=source->water_here_bit;
	destination->block_here_bit=source->block_here_bit;
	destination->floor_here_bit=source->floor_here_bit;
}

/******************************************************************************/

void copy_map_cell2(destination,source)
struct map_cell2 *destination,*source;
{
	destination->egg_hatch=source->egg_hatch;
	destination->egg_contents=source->egg_contents;
	destination->flowing_bit=source->flowing_bit;
	destination->qmark_here_bit=source->qmark_here_bit;
	destination->pl4_seen=source->pl4_seen;
	destination->pl3_seen=source->pl3_seen;
	destination->pl2_seen=source->pl2_seen;
	destination->pl1_seen=source->pl1_seen;
	destination->block_2d=source->block_2d;
}

/******************************************************************************/

void copy_map_cell3(destination,source)
struct map_cell3 *destination,*source;
{
	destination->light=source->light;
	destination->no_monster=source->no_monster;
	destination->no_egg=source->no_egg;
	destination->sky_west=source->sky_west;
	destination->sky_south=source->sky_south;
	destination->sky_east=source->sky_east;
	destination->sky_north=source->sky_north;
	destination->item_ammo=source->item_ammo;
	destination->item_damage=source->item_damage;
	destination->item_type=source->item_type;
}

/******************************************************************************/

void draw_border(Port,direction,x,y,width,height,colour)
struct RastPort *Port;
register int direction;
register SHORT x,y,width,height,colour;

#define UP 0
#define DOWN 1
#define BOTH 2
#define NONE -1

{
	SHORT BorderPairs[6];
	struct Border MyBorder={0,0,1,0,JAM1,3,NULL,NULL};

	MyBorder.XY=BorderPairs;

	if (colour>=0)
	{
		SetAPen(Port,colour);
		RectFill(Port,x,y,x+width,y+height);
	}

	switch(direction)
	{
		case UP:
		{
			MyBorder.FrontPen=2;
			BorderPairs[0]=0;BorderPairs[1]=height;
			BorderPairs[2]=0;BorderPairs[3]=0;
			BorderPairs[4]=width-1;BorderPairs[5]=0;
			DrawBorder(Port,&MyBorder,x,y);
			MyBorder.FrontPen=1;
			BorderPairs[0]=width;BorderPairs[1]=0;
			BorderPairs[2]=width;BorderPairs[3]=height;
			BorderPairs[4]=1;BorderPairs[5]=height;
			DrawBorder(Port,&MyBorder,x,y);
			break;
		}
		case DOWN:
		{
			MyBorder.FrontPen=1;
			BorderPairs[0]=0;BorderPairs[1]=height;
			BorderPairs[2]=0;BorderPairs[3]=0;
			BorderPairs[4]=width-1;BorderPairs[5]=0;
			DrawBorder(Port,&MyBorder,x,y);
			MyBorder.FrontPen=2;
			BorderPairs[0]=width;BorderPairs[1]=0;
			BorderPairs[2]=width;BorderPairs[3]=height;
			BorderPairs[4]=1;BorderPairs[5]=height;
			DrawBorder(Port,&MyBorder,x,y);
			break;
		}
		case BOTH:
		{
			MyBorder.FrontPen=2;
			BorderPairs[0]=0;BorderPairs[1]=height+2;
			BorderPairs[2]=0;BorderPairs[3]=0;
			BorderPairs[4]=width+2;BorderPairs[5]=0;
			DrawBorder(Port,&MyBorder,x-1,y-1);
			MyBorder.FrontPen=1;
			BorderPairs[0]=width+2;BorderPairs[1]=0;
			BorderPairs[2]=width+2;BorderPairs[3]=height+2;
			BorderPairs[4]=2;BorderPairs[5]=height+2;
			DrawBorder(Port,&MyBorder,x-1,y-1);

			MyBorder.FrontPen=1;
			BorderPairs[0]=0;BorderPairs[1]=height;
			BorderPairs[2]=0;BorderPairs[3]=0;
			BorderPairs[4]=width;BorderPairs[5]=0;
			DrawBorder(Port,&MyBorder,x,y);
			MyBorder.FrontPen=2;
			BorderPairs[0]=width;BorderPairs[1]=0;
			BorderPairs[2]=width;BorderPairs[3]=height;
			BorderPairs[4]=1;BorderPairs[5]=height;
			DrawBorder(Port,&MyBorder,x,y);
			break;
		}
	}
}

/******************************************************************************/

void draw_gadget_border(port,direction,gadget,colour)
struct RastPort *port;
register int direction;
struct Gadget *gadget;
register SHORT colour;
{
	SHORT x,y,w,h;

	x=gadget->LeftEdge;
	y=gadget->TopEdge;
	w=(gadget->Width)-1;
	h=(gadget->Height)-1;

	if (direction==BOTH)
	{
		x-=2;
		y-=2;
		w+=4;
	}

	draw_border(port,direction,x,y,w,h,colour);
}

/******************************************************************************/
void redraw_button_win()
{
/*	char some_text[25];
	strcpy(some_text,"Target X=   Y=   Z=  ");
	itoa3(picked_button_target_x,&some_text[9]);
	itoa3(picked_button_target_y,&some_text[14]);
	itoa3(picked_button_target_z,&some_text[19]);
	draw_text(ButtonWindow->RPort,4+54-24-4,14+14*20+4,1,0,some_text);
*/
	if (picked_button_action_in==0) draw_border(ButtonWindow->RPort,DOWN,4+4,11+14,101,12,-1);
        else draw_border(ButtonWindow->RPort,UP,4+4,11+14,101,12,-1);
	if (picked_button_action_out==0) draw_border(ButtonWindow->RPort,DOWN,4+113,11+14,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+113,11+14,101,12,-1);

	if (picked_button_action_in==1) draw_border(ButtonWindow->RPort,DOWN,4+4,11+14+14*1,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+4,11+14+14*1,101,12,-1);
	if (picked_button_action_out==1) draw_border(ButtonWindow->RPort,DOWN,4+113,11+14+14*1,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+113,11+14+14*1,101,12,-1);

	if (picked_button_action_in==2) draw_border(ButtonWindow->RPort,DOWN,4+4,11+14+14*2,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+4,11+14+14*2,101,12,-1);
	if (picked_button_action_out==2) draw_border(ButtonWindow->RPort,DOWN,4+113,11+14+14*2,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+113,11+14+14*2,101,12,-1);

	if (picked_button_action_in==3) draw_border(ButtonWindow->RPort,DOWN,4+4,11+14+14*3,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+4,11+14+14*3,101,12,-1);
	if (picked_button_action_out==3) draw_border(ButtonWindow->RPort,DOWN,4+113,11+14+14*3,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+113,11+14+14*3,101,12,-1);

	if (picked_button_action_in==4) draw_border(ButtonWindow->RPort,DOWN,4+4,11+14+14*4,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+4,11+14+14*4,101,12,-1);
	if (picked_button_action_out==4) draw_border(ButtonWindow->RPort,DOWN,4+113,11+14+14*4,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+113,11+14+14*4,101,12,-1);

	if (picked_button_action_in==5) draw_border(ButtonWindow->RPort,DOWN,4+4,11+14+14*5,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+4,11+14+14*5,101,12,-1);
	if (picked_button_action_out==5) draw_border(ButtonWindow->RPort,DOWN,4+113,11+14+14*5,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+113,11+14+14*5,101,12,-1);

	if (picked_button_action_in==6) draw_border(ButtonWindow->RPort,DOWN,4+4,11+14+14*6,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+4,11+14+14*6,101,12,-1);
	if (picked_button_action_out==6) draw_border(ButtonWindow->RPort,DOWN,4+113,11+14+14*6,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+113,11+14+14*6,101,12,-1);

	if (picked_button_action_in==7) draw_border(ButtonWindow->RPort,DOWN,4+4,11+14+14*7,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+4,11+14+14*7,101,12,-1);
	if (picked_button_action_out==7) draw_border(ButtonWindow->RPort,DOWN,4+113,11+14+14*7,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+113,11+14+14*7,101,12,-1);

	if (picked_button_action_in==8) draw_border(ButtonWindow->RPort,DOWN,4+4,11+14+14*8,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+4,11+14+14*8,101,12,-1);
	if (picked_button_action_out==8) draw_border(ButtonWindow->RPort,DOWN,4+113,11+14+14*8,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+113,11+14+14*8,101,12,-1);

	if (picked_button_action_in==9) draw_border(ButtonWindow->RPort,DOWN,4+4,11+14+14*9,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+4,11+14+14*9,101,12,-1);
	if (picked_button_action_out==9) draw_border(ButtonWindow->RPort,DOWN,4+113,11+14+14*9,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+113,11+14+14*9,101,12,-1);

	if (picked_button_action_in==10) draw_border(ButtonWindow->RPort,DOWN,4+4,11+14+14*10,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+4,11+14+14*10,101,12,-1);
	if (picked_button_action_out==10) draw_border(ButtonWindow->RPort,DOWN,4+113,11+14+14*10,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+113,11+14+14*10,101,12,-1);

	if (picked_button_action_in==11) draw_border(ButtonWindow->RPort,DOWN,4+4,11+14+14*11,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+4,11+14+14*11,101,12,-1);
	if (picked_button_action_out==11) draw_border(ButtonWindow->RPort,DOWN,4+113,11+14+14*11,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+113,11+14+14*11,101,12,-1);

	if (picked_button_action_in==12) draw_border(ButtonWindow->RPort,DOWN,4+4,11+14+14*12,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+4,11+14+14*12,101,12,-1);
	if (picked_button_action_out==12) draw_border(ButtonWindow->RPort,DOWN,4+113,11+14+14*12,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+113,11+14+14*12,101,12,-1);

	if (picked_button_action_in==13) draw_border(ButtonWindow->RPort,DOWN,4+4,11+14+14*13,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+4,11+14+14*13,101,12,-1);
	if (picked_button_action_out==13) draw_border(ButtonWindow->RPort,DOWN,4+113,11+14+14*13,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+113,11+14+14*13,101,12,-1);

	if (picked_button_action_in==14) draw_border(ButtonWindow->RPort,DOWN,4+4,11+14+14*14,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+4,11+14+14*14,101,12,-1);
	if (picked_button_action_out==14) draw_border(ButtonWindow->RPort,DOWN,4+113,11+14+14*14,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+113,11+14+14*14,101,12,-1);

	if (picked_button_action_in==15) draw_border(ButtonWindow->RPort,DOWN,4+4,11+14+14*15,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+4,11+14+14*15,101,12,-1);
	if (picked_button_action_out==15) draw_border(ButtonWindow->RPort,DOWN,4+113,11+14+14*15,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+113,11+14+14*15,101,12,-1);

	if (picked_button_action_in==16) draw_border(ButtonWindow->RPort,DOWN,4+4,11+14+14*16,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+4,11+14+14*16,101,12,-1);
	if (picked_button_action_out==16) draw_border(ButtonWindow->RPort,DOWN,4+113,11+14+14*16,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+113,11+14+14*16,101,12,-1);

	if (picked_button_action_in==17) draw_border(ButtonWindow->RPort,DOWN,4+4,11+14+14*17,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+4,11+14+14*17,101,12,-1);
	if (picked_button_action_out==17) draw_border(ButtonWindow->RPort,DOWN,4+113,11+14+14*17,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+113,11+14+14*17,101,12,-1);

	if (picked_button_action_in==18) draw_border(ButtonWindow->RPort,DOWN,4+4,11+14+14*18,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+4,11+14+14*18,101,12,-1);
	if (picked_button_action_out==18) draw_border(ButtonWindow->RPort,DOWN,4+113,11+14+14*18,101,12,-1);
	else draw_border(ButtonWindow->RPort,UP,4+113,11+14+14*18,101,12,-1);
}

/******************************************************************************/
void redraw_cell_win()
{
	register block_num;
	char some_text[12];

	block_num=0;
	if (picked_block.block_here_bit) block_num=picked_block.block+1;
	draw_text(CellWindow->RPort,4+28+90,11+21-10,1,4,(char *)&block_names[block_num]);

	block_num=0;
	if (picked_block.floor_here_bit)
	{
		if ( (picked_block.block_here_bit) && (picked_block.block==0) && (picked_block.floor==3) )
			block_num=5;
		else
			block_num=picked_block.floor+1;
	}
	draw_text(CellWindow->RPort,4+28+90,11+17+58-23,1,4,(char *)&floor_names[block_num]);

	block_num=0;
	if (picked_block.panel_here_bit) block_num=picked_block.panel+1;
	draw_text(CellWindow->RPort,4+28+90,11+17+93-33,1,4,(char *)&panel_names[block_num]);

	update_tpanels_window();

	if (picked_block.water_here_bit)
	{
		strcpy(some_text,"         ");
		itoa3(picked_block.water,&some_text[4]);
		draw_text(CellWindow->RPort,4+28+86,11+17+128-43,1,4,some_text);
	}
	else
		draw_text(CellWindow->RPort,4+28+90,11+17+128-43,1,4,"  None  ");

	if (picked_block.pushable_bit) draw_gadget_border(CellWindow->RPort,DOWN,&CellPushableGadget,-1);
	else draw_gadget_border(CellWindow->RPort,UP,&CellPushableGadget,-1);

	if (picked_block.invisible_bit) draw_gadget_border(CellWindow->RPort,DOWN,&CellInvisGadget,-1);
	else draw_gadget_border(CellWindow->RPort,UP,&CellInvisGadget,-1);

	if (picked_block.opaque_bit) draw_gadget_border(CellWindow->RPort,DOWN,&CellOpaqueGadget,-1);
	else draw_gadget_border(CellWindow->RPort,UP,&CellOpaqueGadget,-1);

	if (picked_block2.flowing_bit) draw_gadget_border(CellWindow->RPort,DOWN,&CellFlowingGadget,-1);
	else draw_gadget_border(CellWindow->RPort,UP,&CellFlowingGadget,-1);

	block_num=0;
	if (picked_block.aux_here_bit) block_num=picked_block.auxiliary+1;
	draw_text(CellWindow->RPort,4+28+90,186-33,1,4,(char *)&aux_names[block_num]);

	itoa2(picked_block2.egg_hatch,EggHatchBuffer);
	EggHatchInfo.LongInt=picked_block2.egg_hatch;

	if ((picked_block.block_here_bit)&&((picked_block.block==6)||(picked_block.block==2)))
	{
		itoa2(0,ItemAmmoBuffer);
		ItemAmmoInfo.LongInt=0;

		itoa2(0,ItemDamageBuffer);
		ItemDamageInfo.LongInt=0;

		itoa2(0,ItemTypeBuffer);
		ItemTypeInfo.LongInt=0;
		draw_text(CellWindow->RPort,4+11+40,267,1,5,(char *)&item_names[0]);
	}
        else
	{
		itoa2(picked_block3.item_ammo,ItemAmmoBuffer);
		ItemAmmoInfo.LongInt=picked_block3.item_ammo;

		itoa2(picked_block3.item_damage,ItemDamageBuffer);
		ItemDamageInfo.LongInt=picked_block3.item_damage;

		itoa2(picked_block3.item_type,ItemTypeBuffer);
		ItemTypeInfo.LongInt=picked_block3.item_type;
		draw_text(CellWindow->RPort,4+11+40,267,1,5,(char *)&item_names[picked_block3.item_type]);
	}

	if (picked_block3.sky_north) draw_gadget_border(CellWindow->RPort,DOWN,&CellSkyNorthGadget,-1);
	else draw_gadget_border(CellWindow->RPort,UP,&CellSkyNorthGadget,-1);

	if (picked_block3.sky_east) draw_gadget_border(CellWindow->RPort,DOWN,&CellSkyEastGadget,-1);
	else draw_gadget_border(CellWindow->RPort,UP,&CellSkyEastGadget,-1);

	if (picked_block3.sky_south) draw_gadget_border(CellWindow->RPort,DOWN,&CellSkySouthGadget,-1);
	else draw_gadget_border(CellWindow->RPort,UP,&CellSkySouthGadget,-1);

	if (picked_block3.sky_west) draw_gadget_border(CellWindow->RPort,DOWN,&CellSkyWestGadget,-1);
	else draw_gadget_border(CellWindow->RPort,UP,&CellSkyWestGadget,-1);

	if (picked_block3.no_egg) draw_gadget_border(CellWindow->RPort,DOWN,&CellNoEggGadget,-1);
	else draw_gadget_border(CellWindow->RPort,UP,&CellNoEggGadget,-1);

	if (picked_block3.no_monster) draw_gadget_border(CellWindow->RPort,DOWN,&CellNoMonGadget,-1);
	else draw_gadget_border(CellWindow->RPort,UP,&CellNoMonGadget,-1);

	RefreshGList(&EggHatchGadget,CellWindow,NULL,4);
}

/******************************************************************************/

char level_title[24];

void redraw_cursor()
{
	SHORT BorderPairs[10];
	struct Border MyBorder={0,0,1,0,JAM1,5,NULL,NULL};

	MyBorder.XY=BorderPairs;
	MyBorder.FrontPen=7;

	BorderPairs[0]=0;BorderPairs[1]=0;
	BorderPairs[2]=15;BorderPairs[3]=0;
	BorderPairs[4]=15;BorderPairs[5]=15;
	BorderPairs[6]=0;BorderPairs[7]=15;
	BorderPairs[8]=0;BorderPairs[9]=0;
	DrawBorder(LevelWindow->RPort,&MyBorder,LEVEL_DISPLAY_X+4+currx*17,LEVEL_DISPLAY_Y+11+curry*17);

	if ((pastebx+pasteby+pastebz+pastetx+pastety+pastetz!=0)&&(currz>=pastebz)&&(currz<=pastetz))
	{
		MyBorder.FrontPen=2;

		BorderPairs[0]=0;BorderPairs[1]=0;
		BorderPairs[2]=(pastetx-pastebx)*17+17;BorderPairs[3]=0;
		BorderPairs[4]=(pastetx-pastebx)*17+17;BorderPairs[5]=(pastety-pasteby)*17+17;
		BorderPairs[6]=0;BorderPairs[7]=(pastety-pasteby)*17+17;
		BorderPairs[8]=0;BorderPairs[9]=0;
		DrawBorder(LevelWindow->RPort,&MyBorder,LEVEL_DISPLAY_X+3+pastebx*17,LEVEL_DISPLAY_Y+10+pasteby*17);
	}

	sprintf(level_title,"Level X=%2d Y=%2d Z=%2d",currx,curry,currz);
	SetWindowTitles(LevelWindow,level_title,(UBYTE *)-1);
}

/******************************************************************************/
void redraw_level_block()
{
	register USHORT block_num=0;
	struct map_cell1 *curr_block,*curr_blockd;
	struct map_cell2 *curr_block2;

	if ((currx==Pl1XInfo.LongInt)&&(curry==Pl1YInfo.LongInt)&&(currz==Pl1ZInfo.LongInt)) block_num=1320;
	if ((currx==Pl2XInfo.LongInt)&&(curry==Pl2YInfo.LongInt)&&(currz==Pl2ZInfo.LongInt)) block_num=1321;
	if ((currx==Pl3XInfo.LongInt)&&(curry==Pl3YInfo.LongInt)&&(currz==Pl3ZInfo.LongInt)) block_num=1322;
	if ((currx==Pl4XInfo.LongInt)&&(curry==Pl4YInfo.LongInt)&&(currz==Pl4ZInfo.LongInt)) block_num=1323;
	if ((currx==picked_button_target_x)&&(curry==picked_button_target_y)&&(currz==picked_button_target_z)&&(picked_button_target)) block_num=1328;

	if (block_num==0)
	{
		curr_block=mp1(currx,curry,currz);
		curr_block2=mp2(currx,curry,currz);

		if (curr_block->floor_here_bit) block_num=block_num+(curr_block->floor+1)*33;
		if (curr_block->block_here_bit) block_num=block_num+curr_block->block+1;
		if (curr_block->aux_here_bit) block_num=block_num+660;
		if (curr_block->panel_here_bit) block_num=block_num+165;
		if (curr_block2->flowing_bit) block_num=block_num+330;
		if ((currz>0)&&(block_num==0))
		{
			curr_blockd=mp1(currx,curry,currz-1);
			if ((curr_blockd->block_here_bit)&&(curr_blockd->block==0)) block_num=1325;
		}
		if ((curr_block->opaque_bit)&&(curr_block->block_here_bit==0)) block_num=1324;
	}

        an_image.ImageData=Blocks+(block_num*48);
	DrawImage(LevelWindow->RPort,&an_image,LEVEL_DISPLAY_X+4+currx*17,LEVEL_DISPLAY_Y+11+curry*17);
}
