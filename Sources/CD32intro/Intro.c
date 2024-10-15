/*
**  intro.c
**
**  Copyright © Scott Johnston, All Rights Reserved.
*/

/* --- Headers -------------------------------------------------------------- */

#include <ami/all.h>
#include <clib/ami/all_protos.h>

/* --- Required for framework startup --------------------------------------- */

struct AmiStartup ProgramStartup=
{
	"HgIntro",						/* Name of program */
	VERNUM,							/* Version of program */
	VERTYPE,						/* Type of version (i.e. development) */
	"Copyright © Scott Johnston, All Rights Reserved.",	/* Copyright notice */
	1050000,						/* Graphics memory pool required */
	160000,							/* Audio memory pool required */
	400000							/* Data memory pool required */
};




/* ========================================================================== */
/* === Main Code ============================================================ */
/* ========================================================================== */

void ShowPicture(STRPTR file)
{
	struct Chunk *MyCmap;
	struct Chunk *MyIlbm;

	MyIlbm=LoadIFF(file);
	MyCmap=FindChunk(MyIlbm,ID_ILBM,ID_CMAP);
	DrawILBM(MyIlbm);
	WaitForInput(HCI_MOUSE);
	SetPalette2Cmap(MyCmap,0);
	SwapBuffer();
	UnloadIFF(MyIlbm);
}

void Start(void)
{
	struct Chunk *MyCmap;
	struct Chunk *MyIlbm;
	APTR MyModule;

	OpenDisplay(DISPLAY_MODE_640x400_256);

	MyModule=LoadMED("Intro/Intro.mod");

	MyIlbm=LoadIFF("Intro/1.ilbm");
	MyCmap=FindChunk(MyIlbm,ID_ILBM,ID_CMAP);
	DrawILBM(MyIlbm);
	SwapBuffer();
	PlayMED(MyModule);
	FadePalette2Cmap(MyCmap,32,32,32);
	UnloadIFF(MyIlbm);

	MyIlbm=LoadIFF("Intro/3.ilbm");
	MyCmap=FindChunk(MyIlbm,ID_ILBM,ID_CMAP);
	DrawILBM(MyIlbm);
	WaitForInput(HCI_MOUSE);
	FadePalette2Colour(0,0,0,128,64,64);
	SwapBuffer();
	SetPalette2Cmap(MyCmap,0);
	UnloadIFF(MyIlbm);

	ShowPicture("Intro/4.ilbm");
	ShowPicture("Intro/5.ilbm");
	ShowPicture("Intro/6.ilbm");
	ShowPicture("Intro/7.ilbm");
	ShowPicture("Intro/7_2.ilbm");
	ShowPicture("Intro/8.ilbm");
	ShowPicture("Intro/9.ilbm");
	ShowPicture("Intro/11.ilbm");
	ShowPicture("Intro/12.ilbm");
	ShowPicture("Intro/12_2.ilbm");
	ShowPicture("Intro/10.ilbm");
	ShowPicture("Intro/10_2.ilbm");
	ShowPicture("Intro/10_3.ilbm");

	MyIlbm=LoadIFF("Intro/Title.ilbm");
	MyCmap=FindChunk(MyIlbm,ID_ILBM,ID_CMAP);
	WaitForInput(HCI_MOUSE);
	FadePalette2Colour(0,0,0,64,64,64);

	OpenDisplay(DISPLAY_MODE_1280x400_HAM8);

	DrawILBM(MyIlbm);
	SetPalette2Cmap(MyCmap,0);
	SwapBuffer();
	UnloadIFF(MyIlbm);

	WaitForInput(HCI_MOUSE);

	StopMED();
	UnloadMED(MyModule);
}
