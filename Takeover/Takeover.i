********************************************************************************
*
*	Takeover.i
*	Release 2.4
*	Date 3/4/93
*
*	Friendly system takeover
*	Structure definitions
*
*	Copyright © Scott Johnston 1991-93
*	All Rights Reserved Worldwide
*
********************************************************************************

	IFND	TAKEOVER_I

TAKEOVER_I	set	0

	IFND EXEC_TYPES_I
		include "exec/types.i"
	ENDC

	IFND EXEC_LIBRARIES_I
		include "exec/libraries.i"
	ENDC

	IFND DOS_DOSEXTENS_I
		include	dos/dosextens.i
        ENDC

********************************************************************************
* GRAPHICS DATA FILE
********************************************************************************

 STRUCTURE	GraphicsData,0
	STRUCT	gd_languages_image,12600
	STRUCT	gd_contsel_image,576
	STRUCT	gd_contunsel_image,576
	STRUCT	gd_killsys_image,16200
	STRUCT	gd_possel_image,576
	STRUCT	gd_posunsel_image,576
	STRUCT	gd_negsel_image,576
	STRUCT	gd_negunsel_image,576
	STRUCT	gd_running_image,3552
	LABEL	gd_SIZEOF

********************************************************************************
* MISC EQUATES
********************************************************************************

MIN_LIB_VERSION	equ	33
MAX_ERROR_CODES	equ     69
EOL		equ	10

TRUE		equ	1
FALSE		equ     0

********************************************************************************
* LIBRARY :	Takeover
********************************************************************************

 LIBINIT	0
	LIBDEF	_TakeSystem
	LIBDEF	_RestoreSystem
	LIBDEF	_TempTakeSystem
	LIBDEF	_TempRestoreSystem
	LIBDEF	_DOSReadFile
	LIBDEF	_DOSWriteFile

********************************************************************************
* STRUCTURE :   TakeoverBase
* NOTES	:	Must be longword aligned!
********************************************************************************

 STRUCTURE	TakeoverBase,0

;--- private -------------------------------------------------------------------

MAX_HUNKS	equ	4

	ULONG	reloc_chip_base			;\
	ULONG	reloc_other_base		; |
	STRUCT	HunkSourceBase,4*MAX_HUNKS	; |
	STRUCT	HunkDestBase,4*MAX_HUNKS	; |
	STRUCT	HunkSize,4*MAX_HUNKS		; |
	STRUCT	BSSBases,4*MAX_HUNKS		; | variables for
	STRUCT	BSSSize,4*MAX_HUNKS		; | biscuits relocation code
	UWORD	BSSCount			; |
	ULONG	NumberOfSymbolHunks		; |
	STRUCT	HunkType,MAX_HUNKS		; |
	ULONG	ExtSymbolCount			; |
	ULONG	StartPC				; |
	ULONG	NumberOfHunks			;/

;--- memory --------------------------------------------------------------------

	APTR	chip_chunk_address	;address of chip chunk
	APTR	any_chunk_address	;address of any chunk
	APTR	exchip_chunk_address	;address of extra chip chunk
	APTR	exany_chunk_address	;address of extra any chunk
	APTR	temp_chunk_address	;address of temp chunk
	APTR	ramdisk_chunk_address	;address of ram disk chunk
	APTR	chip_mem_address	;address of chip memory
	APTR	any_mem_address		;address of any memory
	APTR	exchip_mem_address	;address of extra chip memory
	APTR	exany_mem_address	;address of extra any memory
	APTR	ramdisk_mem_address	;address of ram disk
	ULONG	graphics_address	;address of graphics data
	ULONG	chip_amount		;amount chip mem allocated (bytes)
	ULONG	any_amount		;amount chip/fast mem allocated (bytes)
	ULONG	exchip_amount		;amount extra chip mem allocated (bytes)
	ULONG	exany_amount		;amount extra chip/fast mem allocated (bytes)
	ULONG	temp_amount		;amount temp chip mem allocated (bytes)
	ULONG	ramdisk_amount		;size of ram disk (bytes)
	ULONG	largest_chip		;largest free chip chunk (before allocation)
	ULONG	largest_any		;largest free any chunk (before allocation)

;--- interrupts ----------------------------------------------------------------

	APTR	ciaa_ta_handler		;hook to exclusive ciaa timer A handler
	APTR	ciaa_tb_handler		;hook to exclusive ciaa timer B handler
	APTR	ciab_ta_handler		;hook to exclusive ciab timer A handler
	APTR	ciab_tb_handler		;hook to exclusive ciab timer B handler
	APTR	int_blitter_handler	;hook to exclusive blitter handler
	APTR	int_ports_server	;hook to ports chained server
	APTR	int_vblank_server	;hook to vblank chained server
	APTR	int_exter_server	;hook to exter chained server
	APTR	int_copper_server	;hook to copper chained server

;--- flags ---------------------------------------------------------------------

FLAGB_SERIAL		equ     0
FLAGB_PARALLEL		equ     1
FLAGB_POTGO		equ     2
FLAGB_CIAA_TA		equ     3
FLAGB_CIAA_TB		equ     4
FLAGB_CIAB_TA		equ     5
FLAGB_CIAB_TB		equ     6
FLAGB_CLOSE_WBENCH	equ     7
FLAGB_AUDIO		equ     8
FLAGB_INT_PORTS		equ     9
FLAGB_INT_VBLANK	equ     10
FLAGB_INT_EXTER		equ     11
FLAGB_INT_COPPER	equ     12
FLAGB_INT_BLITTER	equ     13
FLAGB_FLOPPY		equ     14
FLAGB_KEYBOARD		equ     15

FLAGF_SERIAL		equ	1<<FLAGB_SERIAL
FLAGF_PARALLEL		equ	1<<FLAGB_PARALLEL
FLAGF_POTGO		equ	1<<FLAGB_POTGO
FLAGF_CIAA_TA		equ	1<<FLAGB_CIAA_TA
FLAGF_CIAA_TB		equ	1<<FLAGB_CIAA_TB
FLAGF_CIAB_TA		equ	1<<FLAGB_CIAB_TA
FLAGF_CIAB_TB		equ	1<<FLAGB_CIAB_TB
FLAGF_CLOSE_WBENCH	equ	1<<FLAGB_CLOSE_WBENCH
FLAGF_AUDIO		equ	1<<FLAGB_AUDIO
FLAGF_INT_PORTS		equ	1<<FLAGB_INT_PORTS
FLAGF_INT_VBLANK	equ	1<<FLAGB_INT_VBLANK
FLAGF_INT_EXTER		equ	1<<FLAGB_INT_EXTER
FLAGF_INT_COPPER	equ     1<<FLAGB_INT_COPPER
FLAGF_INT_BLITTER	equ     1<<FLAGB_INT_BLITTER
FLAGF_FLOPPY		equ	1<<FLAGB_FLOPPY
FLAGF_KEYBOARD		equ	1<<FLAGB_KEYBOARD

	UWORD	requested_flags		;resource flags
	UWORD	installed_flags		;resource flags

;--- language chosen -----------------------------------------------------------

ENGLISH		equ	0
FRENCH		equ     1
GERMAN		equ     2
ITALIAN		equ     3
SPANISH		equ     4
	UBYTE   language		;selected language
	UBYTE	pad1

;--- library & resource bases --------------------------------------------------

;	APTR	takeover_base		;takeover.library base
	APTR	graphics_base		;graphics.library base
	ULONG	graphics_version	;version of graphics library
	APTR	intuition_base		;intuition.library base
	ULONG	intuition_version	;version of intuition library
	APTR	dos_base		;dos.library base
	ULONG	dos_version		;version of dos library
	APTR	icon_base		;icon.library base
	ULONG	icon_version		;version of icon library
	APTR	lowlevel_base		;lowlevel.library base
	ULONG	lowlevel_version	;version of lowlevel library
	APTR	nonvolatile_base	;nonvolatile.library base
	ULONG	nonvolatile_version	;version of nonvolatile library
	APTR	misc_base		;misc.resource base
	APTR	potgo_base		;potgo.resource base
	APTR	ciaa_base		;ciaa.resource base
	APTR	ciab_base		;ciab.resource base
	APTR	hardware_base		;address of hardware registers

;--- runtime parameters --------------------------------------------------------

	LONG	param1			;to be placed into register D1
	LONG	param2			;to be placed into register D2
	LONG	param3			;to be placed into register D3
	LONG	param4			;to be placed into register D4

;--- private -------------------------------------------------------------------

	APTR	window_struct		;address of window
	ULONG	stdout_handle		;handle for stdout
	ULONG	stdin_handle		;handle for stdin
	ULONG	console_handle		;handle for console
	APTR	wbench_message		;address of wbench message

NAME_SIZE	equ	160
	STRUCT	code_filename,NAME_SIZE		;filename (must be longword aligned!!!)
	STRUCT	data_filename,NAME_SIZE		;filename (must be longword aligned!!!)
	STRUCT	execute_filename,NAME_SIZE	;filename (must be longword aligned!!!)
	STRUCT	from_filename,NAME_SIZE		;filename (must be longword aligned!!!)

	ULONG	code_unpacked_size	;size of unpacked code file
	ULONG	code_lock		;lock on code file
	APTR	code_dob		;code file disk object
	STRUCT	code_fib,fib_SIZEOF	;code file info block

	APTR	arg_address		;address of cli arguments
	UWORD	arg_length		;length of cli arguments
	UBYTE	arg_info		;flag info required
	UBYTE	arg_relocate		;flag relocate code file
	UBYTE	arg_unpack		;size of unpack buffer
	UBYTE	serial_port		;flag serial port opened
	UBYTE	serial_bits		;flag serial port allocated
	UBYTE	parallel_port		;flag parallel port opened
	UBYTE	parallel_bits		;flag parallel port allocated
	UBYTE	int_ports_priority	;\
	UBYTE	int_vblank_priority	; |
	UBYTE	int_exter_priority      ; | server priorities
	UBYTE	int_copper_priority	;/
	UBYTE	int_blitter_priority	;\
	UBYTE	int_blitter_flag	;flag interrupt was on
	UBYTE	ciaa_ta_priority	; |
	UBYTE	ciaa_tb_priority	; | handler priorities
	UBYTE	ciab_ta_priority	; |
	UBYTE	ciab_tb_priority	;/

	UBYTE	checksum_failed		;flag checksum failed
	ULONG	old_blitter_handler	;old handlers (to be restored on exit)

LANGUAGES_SIZE	equ	160
	STRUCT	languages,LANGUAGES_SIZE;languages supported

;--- default control -----------------------------------------------------------

MOUSE		equ	0
JOYSTICK	equ     1
	UBYTE	default_control		;selected default control
	UBYTE	pad3

DEFAULT_CONTROLS_SIZE	equ	20
	STRUCT	default_controls,DEFAULT_CONTROLS_SIZE;default control

POTGO_BITS	equ	%1111000000000001
	ULONG	potgo_bits		;parallel port bits allocated

	UBYTE	arg_retappwin		;flag to leave window open at runtime
	UBYTE	arg_killsys		;flag to kill system
	ULONG	window_ptr		;old pr_WindowPtr
	ULONG	process			;pointer to my tasks process structure

	ULONG	execution_address	;address to run code

	ULONG	screen_struct		;pointer to screen structure
	ULONG	backwindow_struct	;pointer to window structure

	ULONG	trackmp			;pointer to track mesg port
	ULONG	trackio			;pointer to iorequest

	ULONG	top_chip		;top of chip memory allocated so far
        ULONG	top_any			;top of chip/fast memory allocated so far
	ULONG	bot_chip		;bottom of chip memory allocated so far
        ULONG	bot_any			;bottom of chip/fast memory allocated so far

	APTR	audio_device_mp		;audio device message port
	APTR	audio_device_io		;audio device io request
	APTR	keyboard_device_mp	;keyboard device message port
	APTR	keyboard_device_io	;keyboard device io request

	ULONG	new_cacr		;new cache control register
	ULONG	old_cacr		;old cache control register
	ULONG	changed_cacr		;cache control register mask

	UBYTE	exchip_neccessary	;exchip required to run
	UBYTE	exany_neccessary	;exany required to run
	UBYTE	parallel_neccessary	;parallel required to run
	UBYTE	keyboard_neccessary	;keyboard required to run

;--- processors in system ------------------------------------------------------

	UWORD	processors		;passed as low word of d5

; bit 0 = 68010, also set for 68020
; bit 1 = 68020, also set for 68030
; bit 2 = 68030, also set for 68040
; bit 3 = 68040
; bit 4 = 68881, also set for 68882
; bit 5 = 68882,
; bit 6 = FPU40, set if 68040 FPU
;         This bit is set when a working 68040 FPU is in the system. If this bit
;         is set and both the 68881 and 68882 bits are not set, then the 68040
;         math emulation code has not been loaded and only 68040 FPU instruct-
;         ions are available.  This bit is valid *ONLY* if the 68040 bit is set.
; bit 8 = reserved
; bit 9 = reserved
; bit 10 = private

;--- config info ---------------------------------------------------------------

	UWORD	config			;passed as high word of d5

	BITDEF CNFG,DF0,0		;drive DF0: present
	BITDEF CNFG,DF1,1		;drive DF0: present
	BITDEF CNFG,DF2,2		;drive DF0: present
	BITDEF CNFG,DF3,3		;drive DF0: present

	LABEL	stb_SIZEOF

********************************************************************************
* END OF Takeover.i
********************************************************************************

	ENDC
