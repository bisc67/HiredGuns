	IFND	TAKEOVERBASE_I
TAKEOVERBASE_I	SET	1

********************************************************************************
*
*	takeoverbase.i
*	Release 1.0
*	Revision 33.00
*	Date 8/8/92
*
*	Definition of takeover.library base structure
*
*	(C) Copyright 1992 Scott Johnston
*	All Rights Reserved Worldwide
*
********************************************************************************

	IFND EXEC_TYPES_I
		include "exec/types.i"
	ENDC

	IFND EXEC_LIBRARIES_I
		include "exec/libraries.i"
	ENDC

********************************************************************************
* Most fields are not to be viewed or modified by user programs.  Use
* extreme caution.

	STRUCTURE takeoverbase,LIB_SIZE
		LABEL TAKEOVERBASE_SIZE

********************************************************************************

	ENDC
