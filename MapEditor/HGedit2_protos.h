/* Prototypes for functions defined in
HGedit2.c
 */

extern struct IntuitionBase * IntuitionBase;

extern struct DosBase * DOSBase;

extern struct GfxBase * GfxBase;

extern struct IntuiMessage * message;

extern struct ReqBase * ReqBase;

extern struct Process * HGeditProcess;

extern struct Window * OldWindowPtr;

extern struct map * MapData;

extern struct map * PasteBuffer;

extern USHORT * Blocks;

extern struct map_cell1 empty_long;

extern struct map_cell2 empty_long2;

extern struct map_cell3 empty_long3;

extern UWORD * worldimagemem;

extern UWORD * monsimagemem;

extern struct locn * worldmem;

extern struct text chiptexts[36];

extern struct text * chiptextsmem;

extern int os_version;

extern char map_fbuf[30];

extern char panel_fbuf[30];

extern char horiz_fbuf[30];

extern char text_fbuf[30];

extern char convers_fbuf[30];

extern char info_fbuf[30];

extern char map_dbuf[130];

extern char panel_dbuf[130];

extern char horiz_dbuf[130];

extern char text_dbuf[130];

extern char convers_dbuf[130];

extern char info_dbuf[130];

extern int cur_mons;

extern char map_nbuf[160];

extern char convers_nbuf[160];

extern char info_nbuf[160];

extern char floor_names[6][9];

extern char block_names[33][9];

extern char panel_names[5][9];

extern char aux_names[17][9];

extern short item_containers[114];

extern short item_defaultammo[114];

extern char item_names[115][14];

extern UWORD HGeditScreenPens[12];

extern struct Rectangle my_dclip;

extern struct TagItem HGeditScreenTags[7];

extern struct TagItem HGeditWindowTags[2];

extern struct Screen * HGeditScreen;

extern struct ExtNewScreen HGeditNewScreen;

extern struct IntuiText MenuQuitText;

extern struct MenuItem MenuQuit;

extern struct IntuiText MenuIsoText;

extern struct MenuItem MenuIso;

extern struct IntuiText MenuUseText;

extern struct MenuItem MenuUse;

extern struct IntuiText MenuSaveText;

extern struct MenuItem MenuSave;

extern struct IntuiText MenuSaveItText;

extern struct MenuItem MenuSaveIt;

extern struct IntuiText MenuLoadDataText;

extern struct MenuItem MenuLoadData;

extern struct IntuiText MenuExportInfoText;

extern struct MenuItem MenuExportInfoData;

extern struct IntuiText MenuExportConverText;

extern struct MenuItem MenuExportConverData;

extern struct IntuiText MenuExportText;

extern struct MenuItem MenuExportData;

extern struct IntuiText MenuLoadHorizonText;

extern struct MenuItem MenuLoadHorizonData;

extern struct IntuiText MenuLoadTextText;

extern struct MenuItem MenuLoadTextData;

extern struct IntuiText MenuLoadPicturesText;

extern struct MenuItem MenuLoadPictures;

extern struct IntuiText MenuLoadText;

extern struct MenuItem MenuLoad;

extern struct IntuiText MenuHelpText;

extern struct MenuItem MenuHelp;

extern struct IntuiText MenuNewText;

extern struct MenuItem MenuNew;

extern struct Menu MenuProject;

extern struct IntuiText CellLeftText;

extern struct IntuiText CellRightText;

extern struct IntuiText CellNoMonText;

extern struct Gadget CellNoMonGadget;

extern struct IntuiText CellNoEggText;

extern struct Gadget CellNoEggGadget;

extern struct IntuiText CellFillSkyText;

extern struct Gadget CellFillSkyGadget;

extern struct IntuiText CellSkyWestText;

extern struct Gadget CellSkyWestGadget;

extern struct IntuiText CellSkySouthText;

extern struct Gadget CellSkySouthGadget;

extern struct IntuiText CellSkyEastText;

extern struct Gadget CellSkyEastGadget;

extern struct IntuiText CellSkyNorthText;

extern struct Gadget CellSkyNorthGadget;

extern char ItemTypeBuffer[5];

extern char ItemTypeUndoBuffer[5];

extern struct StringInfo ItemTypeInfo;

extern struct Gadget ItemTypeGadget;

extern char ItemDamageBuffer[5];

extern char ItemDamageUndoBuffer[5];

extern struct StringInfo ItemDamageInfo;

extern struct Gadget ItemDamageGadget;

extern char ItemAmmoBuffer[5];

extern char ItemAmmoUndoBuffer[5];

extern struct StringInfo ItemAmmoInfo;

extern struct Gadget ItemAmmoGadget;

extern char EggHatchBuffer[6];

extern char EggHatchUndoBuffer[6];

extern struct StringInfo EggHatchInfo;

extern struct Gadget EggHatchGadget;

extern struct Gadget CellAuxRightGadget;

extern struct Gadget CellAuxLeftGadget;

extern struct IntuiText CellFlowingText;

extern struct Gadget CellFlowingGadget;

extern struct Gadget CellWaterRightGadget;

extern struct Gadget CellWaterLeftGadget;

extern struct IntuiText CellOpaqueText;

extern struct Gadget CellOpaqueGadget;

extern struct IntuiText CellInvisText;

extern struct Gadget CellInvisGadget;

extern struct IntuiText CellPushableText;

extern struct Gadget CellPushableGadget;

extern struct Gadget CellPanelRightGadget;

extern struct Gadget CellPanelLeftGadget;

extern struct Gadget CellFloorRightGadget;

extern struct Gadget CellFloorLeftGadget;

extern struct Gadget CellBlockRightGadget;

extern struct Gadget CellBlockLeftGadget;

extern struct Window * CellWindow;

extern struct ExtNewWindow CellNewWindow;

extern struct IntuiText Button38Text;

extern struct Gadget Button38Gadget;

extern struct IntuiText Button37Text;

extern struct Gadget Button37Gadget;

extern struct IntuiText Button36Text;

extern struct Gadget Button36Gadget;

extern struct IntuiText Button35Text;

extern struct Gadget Button35Gadget;

extern struct IntuiText Button34Text;

extern struct Gadget Button34Gadget;

extern struct IntuiText Button33Text;

extern struct Gadget Button33Gadget;

extern struct IntuiText Button32Text;

extern struct Gadget Button32Gadget;

extern struct IntuiText Button31Text;

extern struct Gadget Button31Gadget;

extern struct IntuiText Button30Text;

extern struct Gadget Button30Gadget;

extern struct IntuiText Button29Text;

extern struct Gadget Button29Gadget;

extern struct IntuiText Button28Text;

extern struct Gadget Button28Gadget;

extern struct IntuiText Button27Text;

extern struct Gadget Button27Gadget;

extern struct IntuiText Button26Text;

extern struct Gadget Button26Gadget;

extern struct IntuiText Button25Text;

extern struct Gadget Button25Gadget;

extern struct IntuiText Button24Text;

extern struct Gadget Button24Gadget;

extern struct IntuiText Button23Text;

extern struct Gadget Button23Gadget;

extern struct IntuiText Button22Text;

extern struct Gadget Button22Gadget;

extern struct IntuiText Button21Text;

extern struct Gadget Button21Gadget;

extern struct IntuiText Button20Text;

extern struct Gadget Button20Gadget;

extern struct IntuiText Button19Text;

extern struct Gadget Button19Gadget;

extern struct IntuiText Button18Text;

extern struct Gadget Button18Gadget;

extern struct IntuiText Button17Text;

extern struct Gadget Button17Gadget;

extern struct IntuiText Button16Text;

extern struct Gadget Button16Gadget;

extern struct IntuiText Button15Text;

extern struct Gadget Button15Gadget;

extern struct IntuiText Button14Text;

extern struct Gadget Button14Gadget;

extern struct IntuiText Button13Text;

extern struct Gadget Button13Gadget;

extern struct IntuiText Button12Text;

extern struct Gadget Button12Gadget;

extern struct IntuiText Button11Text;

extern struct Gadget Button11Gadget;

extern struct IntuiText Button10Text;

extern struct Gadget Button10Gadget;

extern struct IntuiText Button9Text;

extern struct Gadget Button9Gadget;

extern struct IntuiText Button8Text;

extern struct Gadget Button8Gadget;

extern struct IntuiText Button7Text;

extern struct Gadget Button7Gadget;

extern struct IntuiText Button6Text;

extern struct Gadget Button6Gadget;

extern struct IntuiText Button5Text;

extern struct Gadget Button5Gadget;

extern struct IntuiText Button4Text;

extern struct Gadget Button4Gadget;

extern struct IntuiText Button3Text;

extern struct Gadget Button3Gadget;

extern struct IntuiText Button2Text;

extern struct Gadget Button2Gadget;

extern struct IntuiText Button1Text;

extern struct Gadget Button1Gadget;

extern struct Window * ButtonWindow;

extern struct ExtNewWindow ButtonNewWindow;

extern struct IntuiText Lift16Text;

extern struct Gadget Lift16Gadget;

extern struct IntuiText Lift15Text;

extern struct Gadget Lift15Gadget;

extern struct IntuiText Lift14Text;

extern struct Gadget Lift14Gadget;

extern struct IntuiText Lift12Text;

extern struct Gadget Lift12Gadget;

extern struct IntuiText Lift11Text;

extern struct Gadget Lift11Gadget;

extern struct IntuiText Lift10Text;

extern struct Gadget Lift10Gadget;

extern struct IntuiText Lift8Text;

extern struct Gadget Lift8Gadget;

extern struct IntuiText Lift7Text;

extern struct Gadget Lift7Gadget;

extern struct IntuiText Lift6Text;

extern struct Gadget Lift6Gadget;

extern struct IntuiText Lift5Text;

extern struct Gadget Lift5Gadget;

extern struct IntuiText Lift4Text;

extern struct Gadget Lift4Gadget;

extern char Lift2Buffer[5];

extern char Lift2UndoBuffer[5];

extern struct StringInfo Lift2Info;

extern struct Gadget Lift2Gadget;

extern char Lift1Buffer[5];

extern char Lift1UndoBuffer[5];

extern struct StringInfo Lift1Info;

extern struct Gadget Lift1Gadget;

extern struct Window * LiftWindow;

extern struct ExtNewWindow LiftNewWindow;

extern struct IntuiText Door4Text;

extern struct Gadget Door4Gadget;

extern struct IntuiText Door3Text;

extern struct Gadget Door3Gadget;

extern char Door2Buffer[5];

extern char Door2UndoBuffer[5];

extern struct StringInfo Door2Info;

extern struct Gadget Door2Gadget;

extern char Door1Buffer[5];

extern char Door1UndoBuffer[5];

extern struct StringInfo Door1Info;

extern struct Gadget Door1Gadget;

extern struct Window * DoorWindow;

extern struct ExtNewWindow DoorNewWindow;

extern struct Image an_image;

extern struct Gadget LevelHitGadget;

extern ULONG pastebx;

extern ULONG pasteby;

extern ULONG pastebz;

extern ULONG pastetx;

extern ULONG pastety;

extern ULONG pastetz;

extern ULONG currz;

extern LONG currx;

extern LONG curry;

extern LONG last_block_x;

extern LONG last_block_y;

extern int changed;

extern int drawing;

extern int last_drawing;

extern int button_dest_mode;

extern struct button * picked_button;

extern int picked_button_num;

extern ULONG picked_button_target;

extern int picked_button_target_x;

extern int picked_button_target_y;

extern int picked_button_target_z;

extern UBYTE picked_button_action_in;

extern UBYTE picked_button_action_out;

extern struct map_cell1 stone_block;

extern struct map_cell1 picked_block;

extern struct map_cell2 picked_block2;

extern struct map_cell3 picked_block3;

extern struct map_cell1 * mem_posn1;

extern struct map_cell2 * mem_posn2;

extern struct map_cell3 * mem_posn3;

extern struct lift picked_lift;

extern struct door picked_door;

extern struct Image LevelImage;

extern struct PropInfo LevelProp;

extern struct Gadget LevelGadget;

extern struct Window * LevelWindow;

extern struct ExtNewWindow LevelNewWindow;

extern struct Window * InfoWindow;

extern struct ExtNewWindow InfoNewWindow;

extern struct Gadget MonsStr4Gadget;

extern struct Gadget MonsStr3Gadget;

extern struct Gadget MonsStr2Gadget;

extern struct Gadget MonsStr1Gadget;

extern struct Gadget MonsLoad20Gadget;

extern struct Gadget MonsLoad19Gadget;

extern struct Gadget MonsLoad18Gadget;

extern struct Gadget MonsLoad17Gadget;

extern struct Gadget MonsLoad16Gadget;

extern struct Gadget MonsLoad15Gadget;

extern struct Gadget MonsLoad14Gadget;

extern struct Gadget MonsLoad13Gadget;

extern struct Gadget MonsLoad12Gadget;

extern struct Gadget MonsLoad11Gadget;

extern struct Gadget MonsLoad10Gadget;

extern struct Gadget MonsLoad9Gadget;

extern struct Gadget MonsLoad8Gadget;

extern struct Gadget MonsLoad7Gadget;

extern struct Gadget MonsLoad6Gadget;

extern struct Gadget MonsLoad5Gadget;

extern struct Gadget MonsLoad4Gadget;

extern struct Gadget MonsLoad3Gadget;

extern struct Gadget MonsLoad2Gadget;

extern struct Gadget MonsLoad1Gadget;

extern struct Gadget Mons20Gadget;

extern struct Gadget Mons19Gadget;

extern struct Gadget Mons18Gadget;

extern struct Gadget Mons17Gadget;

extern struct Gadget Mons16Gadget;

extern struct Gadget Mons15Gadget;

extern struct Gadget Mons14Gadget;

extern struct Gadget Mons13Gadget;

extern struct Gadget Mons12Gadget;

extern struct Gadget Mons11Gadget;

extern struct Gadget Mons10Gadget;

extern struct Gadget Mons9Gadget;

extern struct Gadget Mons8Gadget;

extern struct Gadget Mons7Gadget;

extern struct Gadget Mons6Gadget;

extern struct Gadget Mons5Gadget;

extern struct Gadget Mons4Gadget;

extern struct Gadget Mons3Gadget;

extern struct Gadget Mons2Gadget;

extern struct Gadget Mons1Gadget;

extern struct Window * MonsWindow;

extern struct ExtNewWindow MonsNewWindow;

extern char World26Buffer[5];

extern char World26UndoBuffer[5];

extern struct StringInfo World26Info;

extern struct Gadget World26Gadget;

extern char World25Buffer[5];

extern char World25UndoBuffer[5];

extern struct StringInfo World25Info;

extern struct Gadget World25Gadget;

extern char World24Buffer[5];

extern char World24UndoBuffer[5];

extern struct StringInfo World24Info;

extern struct Gadget World24Gadget;

extern char World23Buffer[5];

extern char World23UndoBuffer[5];

extern struct StringInfo World23Info;

extern struct Gadget World23Gadget;

extern char World22Buffer[65];

extern char World22UndoBuffer[65];

extern struct StringInfo World22Info;

extern struct Gadget World22Gadget;

extern char World21Buffer[65];

extern char World21UndoBuffer[65];

extern struct StringInfo World21Info;

extern struct Gadget World21Gadget;

extern char World20Buffer[65];

extern char World20UndoBuffer[65];

extern struct StringInfo World20Info;

extern struct Gadget World20Gadget;

extern char World19Buffer[65];

extern char World19UndoBuffer[65];

extern struct StringInfo World19Info;

extern struct Gadget World19Gadget;

extern char World18Buffer[65];

extern char World18UndoBuffer[65];

extern struct StringInfo World18Info;

extern struct Gadget World18Gadget;

extern char World17Buffer[65];

extern char World17UndoBuffer[65];

extern struct StringInfo World17Info;

extern struct Gadget World17Gadget;

extern char World16Buffer[65];

extern char World16UndoBuffer[65];

extern struct StringInfo World16Info;

extern struct Gadget World16Gadget;

extern char World15Buffer[50];

extern char World15UndoBuffer[50];

extern struct StringInfo World15Info;

extern struct Gadget World15Gadget;

extern char World14bBuffer[5];

extern char World14bUndoBuffer[5];

extern struct StringInfo World14bInfo;

extern struct IntuiText World14bText;

extern struct Gadget World14bGadget;

extern char World14Buffer[5];

extern char World14UndoBuffer[5];

extern struct StringInfo World14Info;

extern struct IntuiText World14Text;

extern struct Gadget World14Gadget;

extern char World13Buffer[5];

extern char World13UndoBuffer[5];

extern struct StringInfo World13Info;

extern struct IntuiText World13Text;

extern struct Gadget World13Gadget;

extern char World10Buffer[5];

extern char World10UndoBuffer[5];

extern struct StringInfo World10Info;

extern struct IntuiText World10Text;

extern struct Gadget World10Gadget;

extern char World9Buffer[5];

extern char World9UndoBuffer[5];

extern struct StringInfo World9Info;

extern struct IntuiText World9Text;

extern struct Gadget World9Gadget;

extern char World8Buffer[5];

extern char World8UndoBuffer[5];

extern struct StringInfo World8Info;

extern struct IntuiText World8Text;

extern struct Gadget World8Gadget;

extern char World7Buffer[5];

extern char World7UndoBuffer[5];

extern struct StringInfo World7Info;

extern struct IntuiText World7Text;

extern struct Gadget World7Gadget;

extern char World6Buffer[5];

extern char World6UndoBuffer[5];

extern struct StringInfo World6Info;

extern struct IntuiText World6Text;

extern struct Gadget World6Gadget;

extern struct Gadget World5Gadget;

extern struct IntuiText World4Text;

extern struct Gadget World4Gadget;

extern struct IntuiText World3Text;

extern struct Gadget World3Gadget;

extern struct IntuiText World2Text;

extern struct Gadget World2Gadget;

extern struct IntuiText World1Text;

extern struct Gadget World1Gadget;

extern struct Window * WorldWindow;

extern struct ExtNewWindow WorldNewWindow;

extern struct IntuiText ToolsHighlightText;

extern struct Gadget ToolsHighlightGadget;

extern struct IntuiText ToolsCutText;

extern struct Gadget ToolsCutGadget;

extern struct IntuiText ToolsCopyText;

extern struct Gadget ToolsCopyGadget;

extern struct IntuiText ToolsPasteText;

extern struct Gadget ToolsPasteGadget;

extern struct IntuiText ToolsFillText;

extern struct Gadget ToolsFillGadget;

extern struct IntuiText ToolsSetWaterText;

extern struct Gadget ToolsSetWaterGadget;

extern struct IntuiText ToolsSetTargtText;

extern struct Gadget ToolsSetTargtGadget;

extern struct IntuiText ToolsSetBlockText;

extern struct Gadget ToolsSetBlockGadget;

extern struct IntuiText ToolsSetAllText;

extern struct Gadget ToolsSetAllGadget;

extern struct IntuiText ToolsPickText;

extern struct Gadget ToolsPickGadget;

extern int current_tool;

extern int highlight_flag;

extern struct Window * ToolsWindow;

extern struct ExtNewWindow ToolsNewWindow;

extern struct IntuiText LevelDownText;

extern struct IntuiText LevelUpText;

extern struct IntuiText LevelPl4Text;

extern struct Gadget LevelPl4Gadget;

extern struct IntuiText LevelPl3Text;

extern struct Gadget LevelPl3Gadget;

extern struct IntuiText LevelPl2Text;

extern struct Gadget LevelPl2Gadget;

extern struct IntuiText LevelPl1Text;

extern struct Gadget LevelPl1Gadget;

extern char TimeBuffer[4];

extern char TimeUndoBuffer[4];

extern struct StringInfo TimeInfo;

extern struct Gadget TimeGadget;

extern char WaterSpeedBuffer[4];

extern char WaterSpeedUndoBuffer[4];

extern struct StringInfo WaterSpeedInfo;

extern struct Gadget WaterSpeedGadget;

extern char WaterMaxBuffer[4];

extern char WaterMaxUndoBuffer[4];

extern struct StringInfo WaterMaxInfo;

extern struct Gadget WaterMaxGadget;

extern char WaterMinBuffer[4];

extern char WaterMinUndoBuffer[4];

extern struct StringInfo WaterMinInfo;

extern struct Gadget WaterMinGadget;

extern char Pl3ZBuffer[4];

extern char Pl3ZUndoBuffer[4];

extern struct StringInfo Pl3ZInfo;

extern struct Gadget Pl3ZGadget;

extern char Pl3YBuffer[4];

extern char Pl3YUndoBuffer[4];

extern struct StringInfo Pl3YInfo;

extern struct Gadget Pl3YGadget;

extern char Pl3XBuffer[4];

extern char Pl3XUndoBuffer[4];

extern struct StringInfo Pl3XInfo;

extern struct Gadget Pl3XGadget;

extern char Pl4ZBuffer[4];

extern char Pl4ZUndoBuffer[4];

extern struct StringInfo Pl4ZInfo;

extern struct Gadget Pl4ZGadget;

extern char Pl4YBuffer[4];

extern char Pl4YUndoBuffer[4];

extern struct StringInfo Pl4YInfo;

extern struct Gadget Pl4YGadget;

extern char Pl4XBuffer[4];

extern char Pl4XUndoBuffer[4];

extern struct StringInfo Pl4XInfo;

extern struct Gadget Pl4XGadget;

extern char Pl2ZBuffer[4];

extern char Pl2ZUndoBuffer[4];

extern struct StringInfo Pl2ZInfo;

extern struct Gadget Pl2ZGadget;

extern char Pl2YBuffer[4];

extern char Pl2YUndoBuffer[4];

extern struct StringInfo Pl2YInfo;

extern struct Gadget Pl2YGadget;

extern char Pl2XBuffer[4];

extern char Pl2XUndoBuffer[4];

extern struct StringInfo Pl2XInfo;

extern struct Gadget Pl2XGadget;

extern char Pl1ZBuffer[4];

extern char Pl1ZUndoBuffer[4];

extern struct StringInfo Pl1ZInfo;

extern struct Gadget Pl1ZGadget;

extern char Pl1YBuffer[4];

extern char Pl1YUndoBuffer[4];

extern struct StringInfo Pl1YInfo;

extern struct Gadget Pl1YGadget;

extern char Pl1XBuffer[4];

extern char Pl1XUndoBuffer[4];

extern struct StringInfo Pl1XInfo;

extern struct Gadget Pl1XGadget;

extern char MapNameBuffer[121];

extern char MapNameUndoBuffer[121];

extern struct StringInfo MapNameInfo;

extern struct Gadget MapNameGadget;

extern struct Window * MapWindow;

extern struct ExtNewWindow MapNewWindow;

extern struct GetLongStruct MyLong;

extern struct GetLongStruct MyLong2;

struct map_cell1 * mp1(ULONG x,
                       ULONG y,
                       ULONG z);

struct map_cell2 * mp2(ULONG x,
                       ULONG y,
                       ULONG z);

struct map_cell3 * mp3(ULONG x,
                       ULONG y,
                       ULONG z);

struct map_cell1 * pb1(ULONG x,
                       ULONG y,
                       ULONG z);

struct map_cell2 * pb2(ULONG x,
                       ULONG y,
                       ULONG z);

struct map_cell3 * pb3(ULONG x,
                       ULONG y,
                       ULONG z);

extern struct FileRequester ReqFileStruct;

extern char ReqFilename[30];

extern char ReqDirectoryName[130];

extern char fname[160];

int file_request(char * title);

void reverse(register char * string,
             register int length);

void itoa2(register ULONG num,
           register char * dest);

void itoa3(register ULONG num,
           register char * dest);

void strcpy2(register char * dest,
             register char * source,
             register int max);

extern struct IntuiText some_text;

void draw_text(struct RastPort * port,
               SHORT x,
               SHORT y,
               UBYTE penA,
               UBYTE penB,
               char * text);

void copy_map_cell1(struct map_cell1 * destination,
                    struct map_cell1 * source);

void copy_map_cell2(struct map_cell2 * destination,
                    struct map_cell2 * source);

void copy_map_cell3(struct map_cell3 * destination,
                    struct map_cell3 * source);

void draw_border(struct RastPort * Port,
                 register int direction,
                 register SHORT x,
                 register SHORT y,
                 register SHORT width,
                 register SHORT height,

register SHORT colour);

void draw_gadget_border(struct RastPort * port,
                        register int direction,
                        struct Gadget * gadget,
                        register SHORT colour);

void redraw_button_win(void);

void redraw_cell_win(void);

extern char level_title[24];

void redraw_cursor(void);

void redraw_level_block(void);

