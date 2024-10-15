/******************************************************************************/

Options Results
Address "SI2R1"

SetLoadFormat "'IFF Interleaved Bitmap'"
SetLoadFile "3Dgame:Data/Front.dat/CursorCD32.ilbm"

SetSaveFormat "'Amiga Sprite'"
SetSaveFile "3Dgame:Data/Front.dat/CursorCD32.hws"

Load

Save Clip 0   0   32 22
Save Clip 32  0   32 22 Append
Save Clip 64  0   32 22 Append
Save Clip 96  0   32 22 Append
Save Clip 128 0   32 22 Append
Save Clip 160 0   32 22 Append
Save Clip 192 0   32 22 Append
Save Clip 224 0   32 22 Append

Exit
