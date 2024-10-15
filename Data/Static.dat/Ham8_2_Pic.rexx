/******************************************************************************/

Arg input_file output_file

Options Results
Address "SI2R1"

SetLoadFormat "'IFF Interleaved Bitmap'"
SetLoadFile input_file

SetSaveFormat "'RAW Planar'"
SetSaveFile output_file

Load
Save			/* Save bitmap */
SavePalette 8 APPEND	/* Append 8 bits-per-gun palette (64 colours for ham8) */

KillLoader
KillSaver

Exit
