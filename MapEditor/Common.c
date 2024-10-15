#include <intuition/intuition.h>
#include <intuition/intuitionbase.h>
#include <exec/libraries.h>
#include <graphics/view.h>
#include <dos/dosextens.h>
#include <dos/dos.h>
#include <exec/memory.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include <protos/dos_protos.h>
#include <protos/exec_protos.h>
#include <protos/intuition_protos.h>
#include <protos/graphics_protos.h>
#include <pragmas/dos_pragmas.h>
#include <pragmas/exec_pragmas.h>
#include <pragmas/intuition_pragmas.h>
#include <pragmas/graphics_pragmas.h>

#include "hgedit1_protos.h"
#include "hgedit2_protos.h"
#include "hgedit3_protos.h"
#include "unpack_protos.h"

#include "unpack_pragmas.h"

#include "lib:reqlib/req.h"
#include "lib:reqlib/reqbase.h"

#include "3dgame:mapeditor/HGmapStructure.h"

#define EOL 10

#define NUM_ITEMS 114
#define UP 0
#define DOWN 1
#define BOTH 2
#define NONE -1
#define LEVEL_DISPLAY_X 1
#define LEVEL_DISPLAY_Y 1

#define NUM_BLOCKS 32
#define NUM_FLOORS 4
#define NUM_PANELS 4
#define NUM_AUX 16

#define MAX_BLOCKS 22
#define MAX_FLOORS 4
#define MAX_PANELS 3
#define MAX_AUX 16
