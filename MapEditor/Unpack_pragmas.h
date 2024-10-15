/*******************************************************************************
*
*	Unpack_pragmas.h
*	Release x.x
*	Revision 1.00
*	Date 24/10/92
*
*	Registerised parameters for SASC 6.0
*
*	(C) Copyright 1991,1992 by Rob Northen Computing
*	This revision (C) Copyright 1991,1992 by Scott Johnston
*	All Rights Reserved Worldwide
*
*******************************************************************************/

#ifndef	UNPACK_PRAGMAS_H
#define UNPACK_PRAGMAS_H

#ifndef EXEC_TYPES_H
#include <exec/types.h>
#endif

extern ULONG __asm unpack(register __a0 APTR source, register __a1 APTR dest);

#endif

