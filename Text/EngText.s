********************************************************************************
********************************************************************************
********************************************************************************
*                                                                              *
*          ##\ ##\##\#####\ ##### #####     #### /## /##/#####  /####          *
*          ## \## ## ##\ ## ##\   ##  ##   ##  ## ##  ## ## /##/##  ##         *
*          ##  ## ## ##  ## ##    ##  ##   ##     ##  ## ##  ## ##             *
*          ###### ## #####  ####  ##  ##   ##     ##  ## ##  ##  ####          *
*          ##  ## ## ##  ## ##    ##  ##   ##  ## ##  ## ##  ##     ##         *
*          ## /## ## ##  ## ##/   ##  ##   ##  ##\##  ## ##  ##\## \##         *
*          ##/ ##/##/##/ ##/##### #####     ##### \#### \## \## \####          *
*                                                                              *
********************************************************************************
**************************** © Scott Johnston 1990-93 **************************
********************************************************************************

		output	EngText
		include	macros.i

DEFMESG		MACRO
		dc.w	.mesg\@-phrasebook
		ENDM

phrasebook
	REPT    274
		DEFMESG	mesgnum
	ENDR

********************************************************************************
********************************************************************************
********************************************************************************

.mesg_001	dc.b	CENTRE,"-!). -%.5"
		dc.b	ENDPHRASE

.mesg_002	dc.b	"Start a new game"
		dc.b	ENDPHRASE

.mesg_003	dc.b	"Continue a saved game"
		dc.b	ENDPHRASE

.mesg_004	dc.b	"Exit to Workbench"
		dc.b	ENDPHRASE

.mesg_005	dc.b	CENTRE,"(Press CTRL-Q to return here)"
		dc.b	ENDPHRASE

.mesg_006	dc.b	CENTRE,"()2%$ '5.3"
		dc.b	ENDPHRASE

.mesg_007	dc.b	CENTRE,"A DMA Design game",NEWLINE
		dc.b	CENTRE,"By Scott Johnston",NEWLINE,NEWLINE
		dc.b	CENTRE,"Copyright % Psygnosis 1993-94",NEWLINE
		dc.b	CENTRE,"All Rights Reserved",NEWLINE
		dc.b	ENDPHRASE

.mesg_008	dc.b	CENTRE,"This game has been designed",NEWLINE
		dc.b	CENTRE,"for optimum performance when",NEWLINE
		dc.b	CENTRE,"running on machines with 2MB",NEWLINE
		dc.b	CENTRE,"of graphics memory. This",NEWLINE
		dc.b	CENTRE,"configuration benefits from",NEWLINE
		dc.b	CENTRE,"410K of extra sound effects.",NEWLINE
		dc.b	ENDPHRASE

.mesg_009	dc.b	CENTRE,"Concept, Design, Programming,",NEWLINE
		dc.b	CENTRE,"Editor, Sound Effects,",NEWLINE
		dc.b	CENTRE,"Icons, HD installation,",NEWLINE
		dc.b	CENTRE,"Startup Code & Hard Work",NEWLINE
		dc.b	ENDPHRASE

.mesg_010	dc.b	CENTRE,"Graphics"
		dc.b	ENDPHRASE

.mesg_011	dc.b	CENTRE,"Original Music"
		dc.b	ENDPHRASE

.mesg_012	dc.b	CENTRE,"Background Material"
		dc.b	ENDPHRASE

.mesg_013	dc.b	CENTRE,"Map Design"
		dc.b	ENDPHRASE

.mesg_014	dc.b	CENTRE,"Character Illustrations"
		dc.b	ENDPHRASE

.mesg_015	dc.b	CENTRE,"Development Software"
		dc.b	ENDPHRASE

.mesg_016	dc.b	CENTRE,"Graphics Tools"
		dc.b	ENDPHRASE

.mesg_017	dc.b	CENTRE,"MED V3.00 Module Player"
		dc.b	ENDPHRASE

.mesg_018	dc.b	CENTRE,"Disk IO & Data Compression"
		dc.b	ENDPHRASE

.mesg_019	dc.b	CENTRE,"Tea Boy"
		dc.b	ENDPHRASE

.mesg_020	dc.b	CENTRE,"4-button joystick reading",NEWLINE
		dc.b	CENTRE,"developed from code by",NEWLINE
		dc.b	ENDPHRASE

.mesg_021	dc.b	CENTRE,"Quality Assurance"
		dc.b	ENDPHRASE

.mesg_022	dc.b	CENTRE,"(in no particular order)"
		dc.b	ENDPHRASE

.mesg_023	dc.b	CENTRE,"This game, including its graphics,",NEWLINE
		dc.b	CENTRE,"sound and documentation were",NEWLINE
		dc.b	CENTRE,"entirely programmed and produced",NEWLINE
		dc.b	CENTRE,"on Commodore Amiga computers.",NEWLINE
		dc.b	ENDPHRASE

.mesg_024	dc.b	CENTRE,"Software Piracy jeopardises",NEWLINE
		dc.b	CENTRE,"future support for your Amiga",NEWLINE
		dc.b	CENTRE,"It is your responsibility to",NEWLINE
		dc.b	CENTRE,"respect other peoples hard work.",NEWLINE,NEWLINE
		dc.b	CENTRE,"PIRACY IS THEFT !",NEWLINE
		dc.b	ENDPHRASE

.mesg_025	dc.b	CENTRE,".%7 '!-%"
		dc.b	ENDPHRASE

.mesg_026	dc.b	CENTRE,"Select game type...."
		dc.b	ENDPHRASE

.mesg_027	dc.b	"Training"
		dc.b	ENDPHRASE

.mesg_028	dc.b	"Full campaign game"
		dc.b	ENDPHRASE

.mesg_029	dc.b	"Short action game"
		dc.b	ENDPHRASE

.mesg_030	dc.b	CENTRE,"How many human players ?"
		dc.b	ENDPHRASE

.mesg_031	dc.b	CENTRE,"Single player"
		dc.b	ENDPHRASE

.mesg_032	dc.b	CENTRE,"Two players"
		dc.b	ENDPHRASE

.mesg_033	dc.b	CENTRE,"Three players"
		dc.b	ENDPHRASE

.mesg_034	dc.b	CENTRE,"Four players"
		dc.b	ENDPHRASE

.mesg_035	dc.b	CENTRE,"3).',% 0, !",35,"4)/."
		dc.b	ENDPHRASE

.mesg_036	dc.b	CENTRE,34,"Animal Enclosure",34
		dc.b	ENDPHRASE

.mesg_037	dc.b	CENTRE,34,"Reactor",34
		dc.b	ENDPHRASE

.mesg_038	dc.b	CENTRE,34,"Penitentiary",34
		dc.b	ENDPHRASE

.mesg_039	dc.b	CENTRE,34,"Staying Alive",34
		dc.b	ENDPHRASE

.mesg_040	dc.b	CENTRE,"Next List"
		dc.b	ENDPHRASE

.mesg_041	dc.b	CENTRE,"47/ 0, !",35,"4)/."
		dc.b	ENDPHRASE

.mesg_042	dc.b	CENTRE,34,"Garden of Jarrys",34
		dc.b	ENDPHRASE

.mesg_043	dc.b	CENTRE,34,"Lemming Wars #1",34
		dc.b	ENDPHRASE

.mesg_044	dc.b	CENTRE,34,"Power Generator",34
		dc.b	ENDPHRASE

.mesg_045	dc.b	CENTRE,34,"The Asylum",34
		dc.b	ENDPHRASE

.mesg_046	dc.b	CENTRE,"4(2%% 0, !",35,"4)/."
		dc.b	ENDPHRASE

.mesg_047	dc.b	CENTRE,34,"Big Cheese",34
		dc.b	ENDPHRASE

.mesg_048	dc.b	CENTRE,34,"Escape To Death",34
		dc.b	ENDPHRASE

.mesg_049	dc.b	CENTRE,34,"Bat Mobile",34
		dc.b	ENDPHRASE

.mesg_050	dc.b	CENTRE,34,"Buckminster Park",34
		dc.b	ENDPHRASE

.mesg_051	dc.b	CENTRE,"&/52 0, !",35,"4)/."
		dc.b	ENDPHRASE

.mesg_052	dc.b	CENTRE,34,"Leisure Centre",34
		dc.b	ENDPHRASE

.mesg_053	dc.b	CENTRE,34,"Skeletal Hall",34
		dc.b	ENDPHRASE

.mesg_054	dc.b	CENTRE,34,"Urban Development",34
		dc.b	ENDPHRASE

.mesg_055	dc.b	CENTRE,34,"Shopping Mall",34
		dc.b	ENDPHRASE

.mesg_056	dc.b	CENTRE,34,"Lemming Wars #2",34
		dc.b	ENDPHRASE

.mesg_057	dc.b	CENTRE,"42!).).'"
		dc.b	ENDPHRASE

.mesg_058	dc.b	CENTRE,34,"Exploration",34
		dc.b	ENDPHRASE

.mesg_059	dc.b	CENTRE,34,"Obstacles",34
		dc.b	ENDPHRASE

.mesg_060	dc.b	CENTRE,34,"Fire Fight",34
		dc.b	ENDPHRASE

.mesg_061	dc.b	CENTRE,34,"Throwing Range",34
		dc.b	ENDPHRASE

.mesg_062	dc.b	CENTRE,34,"Sentry Duty",34
		dc.b	ENDPHRASE

.mesg_063	dc.b	CENTRE,"0,!9%2 /.%"
		dc.b	ENDPHRASE

.mesg_064	dc.b	CENTRE,"0,!9%2 47/"
		dc.b	ENDPHRASE

.mesg_065	dc.b	CENTRE,"0,!9%2 4(2%%"
		dc.b	ENDPHRASE

.mesg_066	dc.b	CENTRE,"0,!9%2 &/52"
		dc.b	ENDPHRASE

.mesg_067	dc.b	ALIGN,"Joystick 1"
		dc.b	ENDPHRASE

.mesg_068	dc.b	ALIGN,"Joystick 2"
		dc.b	ENDPHRASE

.mesg_069	dc.b	ALIGN,"(Joystick 3)"
		dc.b	ENDPHRASE

.mesg_070	dc.b	ALIGN,"(Joystick 4)"
		dc.b	ENDPHRASE

.mesg_071	dc.b	ALIGN,"Mouse 1"
		dc.b	ENDPHRASE

.mesg_072	dc.b	ALIGN,"Mouse 2"
		dc.b	ENDPHRASE

.mesg_073	dc.b	ALIGN,"Gamepad 1"
		dc.b	ENDPHRASE

.mesg_074	dc.b	ALIGN,"Gamepad 2"
		dc.b	ENDPHRASE

.mesg_075	dc.b	ALIGN,"Keyboard 1"
		dc.b	ENDPHRASE

.mesg_076	dc.b	ALIGN,"Keyboard 2"
		dc.b	ENDPHRASE

.mesg_077	dc.b	ALIGN,"Keyboard 3"
		dc.b	ENDPHRASE

.mesg_078	dc.b	ALIGN,"Keyboard 4"
		dc.b	ENDPHRASE

.mesg_079	dc.b	"Your team is complete"
		dc.b	ENDPHRASE

.mesg_080	dc.b	";  end selection"
		dc.b	ENDPHRASE

.mesg_081	dc.b	"{  erase last choice"
		dc.b	ENDPHRASE

.mesg_082	dc.b	CENTRE,"*** SYSTEM MESSAGE ***"
		dc.b	ENDPHRASE

.mesg_083	dc.b    CENTRE,"You have been here already, do you wish to explore again?"
		dc.b	ENDPHRASE

.mesg_084	dc.b	"Yes, explore the location."
		dc.b	ENDPHRASE

.mesg_085	dc.b	"No, just move there."
		dc.b	ENDPHRASE

.mesg_086	dc.b	CENTRE,"*** SYSTEM MESSAGE ***"
		dc.b	ENDPHRASE

.mesg_087	dc.b    CENTRE,"Moving to indicated location...."
		dc.b	ENDPHRASE

.mesg_088	dc.b	CENTRE,"*** AREA COMPROMISED ***"
		dc.b	ENDPHRASE

.mesg_089	dc.b	CENTRE,"*** AREA HAS NOT BEEN COMPROMISED ***"
		dc.b	ENDPHRASE

.mesg_090	dc.b	CENTRE,"COULD NOT FIND DISK #"
		dc.b	ENDPHRASE

.mesg_091	dc.b	CENTRE,"Please insert disk into any drive.",NEWLINE
		dc.b	CENTRE,"Press a key when ready.",NEWLINE
		dc.b	ENDPHRASE

.mesg_092	dc.b	CENTRE,"DISK FULL",NEWLINE,NEWLINE
		dc.b	CENTRE,"Press a key to continue.",NEWLINE
		dc.b	ENDPHRASE

.mesg_093	dc.b	CENTRE,"DISK IO ERROR!",NEWLINE
		dc.b	CENTRE,"Not an AmigaDOS disk.",NEWLINE
		dc.b	CENTRE,"Press a key to try again.",NEWLINE
		dc.b	ENDPHRASE

.mesg_094	dc.b	CENTRE,"DISK IO ERROR!",NEWLINE
		dc.b	CENTRE,"Disk data is corrupted.",NEWLINE
		dc.b	CENTRE,"Press a key to try again.",NEWLINE
		dc.b	ENDPHRASE

.mesg_095	dc.b	CENTRE,"DISK IS WRITE PROTECTED",NEWLINE
		dc.b	CENTRE,"Write enable disk then",NEWLINE
		dc.b	CENTRE,"Press a key to continue.",NEWLINE
		dc.b	ENDPHRASE

.mesg_096	dc.b	CENTRE,"ERROR ON DISK #"
		dc.b	ENDPHRASE

.mesg_097	dc.b	CENTRE,"Press a key to retry.",NEWLINE
		dc.b	ENDPHRASE

.mesg_098	dc.b	"     DISK #"
		dc.b	ENDPHRASE

.mesg_099	dc.b	"     LOADING DATA",NEWLINE
		dc.b	"     Please wait....",NEWLINE
		dc.b	ENDPHRASE

.mesg_100	dc.b	"SEARCHING FOR DISK #"
		dc.b	ENDPHRASE

.mesg_101	dc.b	"     DISK #"
		dc.b	ENDPHRASE

.mesg_102	dc.b	"     DECOMPRESSING DATA",NEWLINE
		dc.b	"     Please wait....",NEWLINE
		dc.b	ENDPHRASE

.mesg_103		dc.b	CENTRE,"*** GAME PAUSED ***"
		dc.b	ENDPHRASE

.mesg_104	dc.b	CENTRE,"HIRED GUNS PREVIEW"
		dc.b	ENDPHRASE
.mesg_105	dc.b	CENTRE,"HIRED GUNS DEMONSTRATION "
		dc.b	ENDPHRASE

.mesg_106	dc.b	CENTRE,"A DMA DESIGN GAME BY SCOTT JOHNSTON"
		dc.b	ENDPHRASE
.mesg_107	dc.b	CENTRE,"COPYRIGHT PSYGNOSIS 1993-94"
		dc.b	ENDPHRASE

.mesg_108	dc.b	"CONCEPT, DESIGN,"
		dc.b	ENDPHRASE
.mesg_109	dc.b	"PROGRAMMING, MAPS,"
		dc.b	ENDPHRASE
.mesg_110	dc.b	"EDITOR & SFX"
		dc.b	ENDPHRASE

.mesg_111	dc.b	"GRAPHICS"
		dc.b	ENDPHRASE

.mesg_112	dc.b	"ORIGINAL MUSIC"
		dc.b	ENDPHRASE
.mesg_113	dc.b	"BACKGROUND STORY"
		dc.b	ENDPHRASE

.mesg_114	dc.b	"SAVE CURRENT GAME"
		dc.b	ENDPHRASE
.mesg_115	dc.b	"LOAD A SAVED GAME"
		dc.b	ENDPHRASE
.mesg_116	dc.b	"RETRY THIS LEVEL"
		dc.b	ENDPHRASE
.mesg_117	dc.b	"FREEZE FRAME ON/OFF"
		dc.b	ENDPHRASE
.mesg_118	dc.b	"THIS SCREEN ON/OFF"
		dc.b	ENDPHRASE

.mesg_119	dc.b	"EXIT (TO WORKBENCH)"
		dc.b	ENDPHRASE
.mesg_120	dc.b	"WORKBENCH TO FRONT"
		dc.b	ENDPHRASE

.mesg_121	dc.b	"THIS SCREEN ON/OFF"
		dc.b	ENDPHRASE
.mesg_122	dc.b	"RETRY THIS LEVEL"
		dc.b	ENDPHRASE

.mesg_123	dc.b	"ABORT (TO WORLDMAP)"
		dc.b	ENDPHRASE
.mesg_124	dc.b	"QUIT  (TO MAIN MENU)"
		dc.b	ENDPHRASE

.mesg_125	dc.b	CENTRE,"*** SECURITY CHECK ***"
		dc.b	ENDPHRASE

.mesg_126	dc.b	CENTRE,"AS REQUIRED BY THE 2650 TREATY."
		dc.b	ENDPHRASE
.mesg_127	dc.b	CENTRE,"INTERSTELLAR LAW DICTATES THAT SECURITY CHECKS"
		dc.b	ENDPHRASE
.mesg_128	dc.b	CENTRE,"BE CARRIED OUT AT ALL POPULATION CENTRES AND"
		dc.b	ENDPHRASE
.mesg_129	dc.b	CENTRE,"MILITARY ESTABLISHMENTS."
		dc.b	ENDPHRASE

.mesg_266	dc.b	CENTRE,"PLEASE ENTER THE CLASS OF STAR"
		dc.b	ENDPHRASE
.mesg_267	dc.b	"."
		dc.b	ENDPHRASE

.mesg_268	dc.b	CENTRE,"PLEASE ENTER THE DISTANCE TO STAR"
		dc.b	ENDPHRASE
.mesg_269	dc.b	"."
		dc.b	ENDPHRASE

.mesg_270	dc.b	CENTRE,"PLEASE ENTER THE DECLINATION OF STAR"
		dc.b	ENDPHRASE
.mesg_271	dc.b	"."
		dc.b	ENDPHRASE

.mesg_272	dc.b	CENTRE,"PLEASE ENTER THE ASCENSION OF STAR"
		dc.b	ENDPHRASE
.mesg_273	dc.b	"."
		dc.b	ENDPHRASE

.mesg_130	dc.b	CENTRE,"PLEASE ENTER THE MASS OF STAR"
		dc.b	ENDPHRASE
.mesg_131	dc.b	"."
		dc.b	ENDPHRASE

.mesg_132	dc.b	CENTRE,"PLEASE ENTER THE NUMBER OF PLANETS AROUND STAR"
		dc.b	ENDPHRASE
.mesg_133	dc.b	"."
		dc.b	ENDPHRASE

.mesg_134	dc.b	"ANSWER"
		dc.b	ENDPHRASE

.mesg_135	dc.b	CENTRE,"INCORRECT - TRY AGAIN"
		dc.b	ENDPHRASE

.mesg_136	dc.b	CENTRE,"*** MESSAGE FROM TESSERACT BATTLE SYSTEMS ***"
		dc.b	ENDPHRASE
.mesg_137	dc.b	CENTRE,"T.B.S. WOULD LIKE TO CONGRATULATE YOU AND YOUR TEAM"
		dc.b	ENDPHRASE
.mesg_138	dc.b	CENTRE,"(YOURSELF, CHEULE SIYGESS, JENILLEE FREYMON AND YOUR"
		dc.b	ENDPHRASE
.mesg_139	dc.b	CENTRE,"MECHANOID) ON THE SUCCESSFUL COMPLETION OF YOUR OBJECTIVE."
		dc.b	ENDPHRASE
.mesg_140	dc.b	CENTRE,"IT IS NORMAL PROCEDURE TO UPGRADE YOUR CITZENSHIP RECORDS"
		dc.b	ENDPHRASE
.mesg_141	dc.b	CENTRE,"TO REFLECT YOUR ATTAINMENT. UNFORTUNATLY YOUR RECORDS"
		dc.b	ENDPHRASE
.mesg_142	dc.b	CENTRE,"ARE NOT IN ORDER - PROCEED DIRECTLY TO T.B.S. HQ FOR"
		dc.b	ENDPHRASE
.mesg_143	dc.b	CENTRE,"DE-BRIEFING AND DISCIPLINARY MEASURES...."
		dc.b	ENDPHRASE

.mesg_144	dc.b	CENTRE,"MISSION TIME EXPIRED."
		dc.b	ENDPHRASE
.mesg_145	dc.b	CENTRE,"ALL PARTICIPANTS IN THE CURRENT EXERCISE PLEASE"
		dc.b	ENDPHRASE
.mesg_146	dc.b	CENTRE,"NOTE THAT YOUR TIME IN THIS ZONE HAS EXPIRED."
		dc.b	ENDPHRASE
.mesg_147	dc.b	CENTRE,"THE POOR PERFORMANCE OF THE PARTICIPANTS WILL RESULT"
		dc.b	ENDPHRASE
.mesg_148	dc.b	CENTRE,"IN THE RELEVANT CITIZENSHIP RECORDS BEING DOWNGRADED."
		dc.b	ENDPHRASE
.mesg_149	dc.b	CENTRE,"T.B.S. WILL ACCEPT NO APPLICATIONS FOR REFUNDS"
		dc.b	ENDPHRASE
.mesg_150	dc.b	CENTRE,"NOR WILL LIFE ASSURANCE BE HONOURED."
		dc.b	ENDPHRASE

.mesg_151	dc.b	CENTRE,"MISSION OBJECTIVE COMPLETED BY"
		dc.b	ENDPHRASE
.mesg_152	dc.b	CENTRE,"T.B.S. WISH TO CONGRATULATE THE ABOVE AND EXPRESS"
		dc.b	ENDPHRASE
.mesg_153	dc.b	CENTRE,"THEIR CONDOLENCES TO THE LESSER PARTICIPANTS...."
		dc.b	ENDPHRASE

.mesg_154	dc.b	"ANY OTHER KEY"
		dc.b	ENDPHRASE
.mesg_155	dc.b	"CONTINUE"
		dc.b	ENDPHRASE

.mesg_156	dc.b	CENTRE,"*** SAVE GAME ***"
		dc.b	ENDPHRASE
.mesg_157	dc.b	CENTRE,"WHICH DEVICE DO YOU WISH"
		dc.b	ENDPHRASE
.mesg_158	dc.b	CENTRE,"TO SAVE YOUR GAME TO ?"
		dc.b	ENDPHRASE
.mesg_159	dc.b	"RAM DISK"
		dc.b	ENDPHRASE
.mesg_160	dc.b	"INTERNAL FLOPPY DRIVE"
		dc.b	ENDPHRASE
.mesg_161	dc.b	"ABORT SAVE"
		dc.b	ENDPHRASE

.mesg_162	dc.b	"HARD DISK"
		dc.b	ENDPHRASE

.mesg_163	dc.b	CENTRE,"*** LOAD GAME ***"
		dc.b	ENDPHRASE
.mesg_164	dc.b	CENTRE,"WHICH DEVICE DO YOU WISH"
		dc.b	ENDPHRASE
.mesg_165	dc.b	CENTRE,"TO LOAD YOUR GAME FROM ?"
		dc.b	ENDPHRASE
.mesg_166	dc.b	"ABORT LOADING"
		dc.b	ENDPHRASE

.mesg_167	dc.b	CENTRE,"INSERT A WRITE-ENABLED BLANK DISK OR AN"
		dc.b	ENDPHRASE
.mesg_168	dc.b	CENTRE,"EXISTING SAVED GAME DISK INTO THE INTERNAL DRIVE."
		dc.b	ENDPHRASE
.mesg_169	dc.b	CENTRE,"( IF YOU INSERT A DISK THAT IS NOT A HIRED GUNS SAVED"
		dc.b	ENDPHRASE
.mesg_170	dc.b	CENTRE,"GAME DISK THEN ANY DATA ON THAT DISK WILL BE DELETED ! )"
		dc.b	ENDPHRASE
.mesg_171	dc.b	"ANY OTHER KEY"
		dc.b	ENDPHRASE
.mesg_172	dc.b	"CONTINUE"
		dc.b	ENDPHRASE

.mesg_173	dc.b	CENTRE,"INSERT A HIRED GUNS SAVED GAME DISK"
		dc.b	ENDPHRASE
.mesg_174	dc.b	CENTRE,"INTO THE INTERNAL DRIVE."
		dc.b	ENDPHRASE

.mesg_175	dc.b	CENTRE,"*** SAVE/LOAD GAME ***"
		dc.b	ENDPHRASE
.mesg_176	dc.b	CENTRE,"THE DISK FOUND IS A NOT AN EXISTING HIRED GUNS SAVED GAME"
		dc.b	ENDPHRASE
.mesg_177	dc.b	CENTRE,"DISK. ARE YOU SURE THAT YOU WANT TO FORMAT THIS DISK ?"
		dc.b	ENDPHRASE
.mesg_178	dc.b	CENTRE,"PLEASE DOUBLE CHECK THAT YOU HAVE NOTHING IMPORTANT ON THE"
		dc.b	ENDPHRASE
.mesg_179	dc.b	CENTRE,"DISK SINCE ALL DATA ON THE DISK WILL BE LOST."
		dc.b	ENDPHRASE
.mesg_180	dc.b	"ABORT FORMAT"
		dc.b	ENDPHRASE

.mesg_181	dc.b	CENTRE,"THERE ARE 5 POSITIONS IN WHICH YOU CAN SAVE A GAME."
		dc.b	ENDPHRASE
.mesg_182	dc.b	CENTRE,"PRESS F1-F5 TO SELECT A POSITION. YOU CAN ENTER A SHORT"
		dc.b	ENDPHRASE
.mesg_183	dc.b	CENTRE,"DESCRIPTION TO HELP IDENTIFY EACH SAVED GAME."
		dc.b	ENDPHRASE
.mesg_184	dc.b	CENTRE,"( SELECTING A USED POSITION WILL OVERWRITE"
		dc.b	ENDPHRASE
.mesg_185	dc.b	CENTRE,"WHATEVER WAS THERE BEFORE. )"
		dc.b	ENDPHRASE

.mesg_186	dc.b	"ABORT SAVE"
		dc.b	ENDPHRASE

.mesg_187	dc.b	"POSITION"
		dc.b	ENDPHRASE

.mesg_188	dc.b	"EMPTY"
		dc.b	ENDPHRASE

.mesg_189	dc.b	CENTRE,"THERE ARE 5 POSITIONS FROM WHICH YOU CAN LOAD A GAME."
		dc.b	ENDPHRASE
.mesg_190	dc.b	CENTRE,"PRESS F1-F5 TO SELECT A POSITION."
		dc.b	ENDPHRASE

.mesg_191	dc.b	CENTRE,"SAVING YOUR GAME...."
		dc.b	ENDPHRASE

.mesg_192	dc.b	CENTRE,"LOADING YOUR SAVED GAME...."
		dc.b	ENDPHRASE

.mesg_193	dc.b	CENTRE,"LOADING GRAPHICS...."
		dc.b	ENDPHRASE

.mesg_194	dc.b	CENTRE,"LOADING GAME DATA...."
		dc.b	ENDPHRASE

.mesg_195	dc.b	CENTRE,"LOADING SOUND EFFECTS...."
		dc.b	ENDPHRASE

.mesg_196	dc.b	CENTRE,"LOADING CHARACTERS...."
		dc.b	ENDPHRASE

.mesg_197	dc.b	CENTRE,"*** WARNING ***"
		dc.b	ENDPHRASE
.mesg_198	dc.b	CENTRE,"DISK ERROR"
		dc.b	ENDPHRASE
.mesg_199	dc.b	CENTRE,"THERE IS A PROBLEM WITH THE DISK IN THE INTERNAL DRIVE."
		dc.b	ENDPHRASE
.mesg_200	dc.b	"RETRY"
		dc.b	ENDPHRASE

.mesg_201	dc.b	"ANY KEY"
		dc.b	ENDPHRASE

.mesg_202	dc.b	CENTRE,"THERE IS A PROBLEM WITH THE HARD DISK."
		dc.b	ENDPHRASE

.mesg_203	dc.b	CENTRE,"FORMATTING DISK"
		dc.b	ENDPHRASE
.mesg_204	dc.b	CENTRE,"THE DISK FOUND IS A NOT AN EXISTING HIRED GUNS SAVED GAME"
		dc.b	ENDPHRASE
.mesg_205	dc.b	CENTRE,"DISK. PLEASE WAIT FOR THE DISK TO BE FORMATTED, THIS WILL"
		dc.b	ENDPHRASE
.mesg_206	dc.b	CENTRE,"NOT TAKE LONG AND NEED ONLY BE DONE ONCE...."
		dc.b	ENDPHRASE

.mesg_207	dc.b	"FORMAT DISK"
		dc.b	ENDPHRASE

.mesg_208	dc.b	CENTRE,"THERE IS A PROBLEM WITH THE RAM DISK."
		dc.b	ENDPHRASE

.mesg_209	dc.b	CENTRE,"GENERAL READ/WRITE ERROR."
		dc.b	ENDPHRASE

.mesg_210	dc.b	CENTRE,"DISK MUST BE WRITE-ENABLED!!!!"
		dc.b	ENDPHRASE

.mesg_211	dc.b	CENTRE,"YOU MUST INSERT A WRITE-ENABLED BLANK DISK OR"
		dc.b	ENDPHRASE
.mesg_212	dc.b	CENTRE,"AN EXISTING SAVED GAME DISK INTO THE INTERNAL DRIVE."
		dc.b	ENDPHRASE

.mesg_213	dc.b	CENTRE,"CHECKSUM FAILED. THIS MEANS THAT THE DATA"
		dc.b	ENDPHRASE
.mesg_214	dc.b	CENTRE,"HAS BEEN CORRUPTED OR TAMPERED WITH."
		dc.b	ENDPHRASE

.mesg_215	dc.b	"ANY OTHER KEY"
		dc.b	ENDPHRASE
.mesg_216	dc.b	"TRY AGAIN"
		dc.b	ENDPHRASE

.mesg_217	dc.b	"DELETE SAVES"
		dc.b	ENDPHRASE

.mesg_218	dc.b	CENTRE,"SAVED OK. NO ERRORS."
		dc.b	ENDPHRASE

.mesg_219	dc.b	CENTRE,"LOADED OK. NO ERRORS."
		dc.b	ENDPHRASE

.mesg_220	dc.b	CENTRE,"PLEASE INSERT DISK #"
		dc.b	ENDPHRASE
.mesg_221	dc.b	"INTO ANY DRIVE."
		dc.b	ENDPHRASE

.mesg_222	dc.b	CENTRE,"SEARCHING FOR DISK #"
		dc.b	ENDPHRASE

.mesg_240	dc.b	""
		dc.b	ENDPHRASE

.mesg_223	dc.b	CENTRE,"A VALID SAVED GAME MUST BE LOADED."
		dc.b	ENDPHRASE

.mesg_224	dc.b	CENTRE,"NOT ENOUGH FREE MEMORY FOR RAM DISK."
		dc.b	ENDPHRASE

.mesg_225	dc.b	CENTRE,"RAM DISK IS EMPTY."
		dc.b	ENDPHRASE

.mesg_226	dc.b	CENTRE,"*** MISSION FAILED ***"
		dc.b	ENDPHRASE
.mesg_227	dc.b	CENTRE,"UNFORTUNATLY THE MISSION PARAMETERS"
		dc.b	ENDPHRASE
.mesg_228	dc.b	CENTRE,"REQUIRE THE SURVIVAL OF ALL TEAM MEMBERS."
		dc.b	ENDPHRASE
.mesg_229	dc.b	CENTRE,"BE MORE CAREFUL OUT THERE NEXT TIME!"
		dc.b	ENDPHRASE

.mesg_230	dc.b	"RETRY THIS LEVEL"
		dc.b	ENDPHRASE

.mesg_231	dc.b	"EXIT HIRED GUNS"
		dc.b	ENDPHRASE

.mesg_232	dc.b	"QUIT TO MAIN MENU (VIA DEATH SEQUENCE)"
		dc.b	ENDPHRASE

.mesg_233	dc.b	CENTRE,"*** DEATH ***"
		dc.b	ENDPHRASE
.mesg_234	dc.b	CENTRE,"YOUR ENTIRE TEAM HAS BEEN SLAUGHTERED."
		dc.b	ENDPHRASE
.mesg_235	dc.b	CENTRE,"COULD THIS BE A SIGN OF POOR LEADERSHIP,"
		dc.b	ENDPHRASE
.mesg_236	dc.b	CENTRE," OR PERHAPS JUST TOTAL INCOMPETENCE ?"
		dc.b	ENDPHRASE
.mesg_237	dc.b	CENTRE,"WHATEVER THE REASON YOU ARE FORTUNATE"
		dc.b	ENDPHRASE
.mesg_238	dc.b	CENTRE," ENOUGH TO HAVE ANOTHER CHANCE...."
		dc.b	ENDPHRASE

.mesg_239	dc.b	"ABORT"
		dc.b	ENDPHRASE

.mesg_241	dc.b	"Human"
		dc.b	ENDPHRASE

.mesg_242	dc.b	"Mech"
		dc.b	ENDPHRASE

.mesg_243	dc.b	"Golem"
		dc.b	ENDPHRASE

.mesg_244	dc.b	"Humanoid"
		dc.b	ENDPHRASE

.mesg_245	dc.b	"Cyborg"
		dc.b	ENDPHRASE

.mesg_246	dc.b	"Male"
		dc.b	ENDPHRASE

.mesg_247	dc.b	"Female"
		dc.b	ENDPHRASE

.mesg_248	dc.b	"N/A"
		dc.b	ENDPHRASE

.mesg_249	dc.b	"Marine"
		dc.b	ENDPHRASE

.mesg_250	dc.b	"Assassin"
		dc.b	ENDPHRASE

.mesg_251	dc.b	"Combat Droid"
		dc.b	ENDPHRASE

.mesg_252	dc.b	"Medic"
		dc.b	ENDPHRASE

.mesg_253	dc.b	"Citizen"
		dc.b	ENDPHRASE

.mesg_254	dc.b	"Pilot"
		dc.b	ENDPHRASE

.mesg_255	dc.b	"UPBI agent"
		dc.b	ENDPHRASE

.mesg_256	dc.b	"Engineer"
		dc.b	ENDPHRASE

.mesg_257	dc.b	"Slave"
		dc.b	ENDPHRASE

.mesg_258	dc.b	"Marksman"
		dc.b	ENDPHRASE

.mesg_259	dc.b	"Trooper"
		dc.b	ENDPHRASE

.mesg_260	dc.b	"Multipurpose"
		dc.b	ENDPHRASE

.mesg_261	dc.b	"Pilot"
		dc.b	ENDPHRASE

.mesg_262	dc.b	"PRESS F"
		dc.b	ENDPHRASE
.mesg_263	dc.b	"TO RETURN"
		dc.b	ENDPHRASE

.mesg_264	dc.b	CENTRE,"EXTRA CHIP RAM AVAILABLE",NEWLINE
		dc.b	CENTRE,"Loading enhanced sound effects.",NEWLINE
		dc.b	CENTRE,"Please wait....",NEWLINE
		dc.b	ENDPHRASE

.mesg_265	dc.b	CENTRE,"DECOMPRESS ERROR !",NEWLINE
		dc.b	CENTRE,"Software, memory or disk fault.",NEWLINE
		dc.b	CENTRE,"This is a fatal error, please reset.",NEWLINE
		dc.b	ENDPHRASE

.mesg_274	dc.b	"Main Menu"
		dc.b	ENDPHRASE
