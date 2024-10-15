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

		output	SpaText
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

.mesg_001	dc.b	CENTRE,"-%.5 02).#)0!,"
		dc.b	ENDPHRASE

.mesg_002	dc.b	" Comenzar un nuevo juego"
		dc.b	ENDPHRASE

.mesg_003	dc.b	"Continuar un juego archivado"
		dc.b	ENDPHRASE

.mesg_004	dc.b	"Salir a Workbench"
		dc.b	ENDPHRASE

.mesg_005	dc.b	CENTRE,"(Pulsar CTRL-Q para regresar aqu¡)"
		dc.b	ENDPHRASE

.mesg_006	dc.b	CENTRE,"()2%$ '5.3"
		dc.b	ENDPHRASE

.mesg_007	dc.b	CENTRE,"Un juego DMA Design",NEWLINE
		dc.b	CENTRE,"de Scott Johnston",NEWLINE,NEWLINE
		dc.b	CENTRE,"Copyright % Psygnosis 1993-94",NEWLINE
		dc.b	CENTRE,"Todos los derechos reservados",NEWLINE
		dc.b	ENDPHRASE

.mesg_008	dc.b	CENTRE,"Este juego ha sido dise¤ado",NEWLINE
		dc.b	CENTRE,"para un funcionamiento ¢ptimo",NEWLINE
		dc.b	CENTRE,"cuando se use una m quina con",NEWLINE
		dc.b	CENTRE,"2MB de memoria de gr ficos. Esta",NEWLINE
		dc.b	CENTRE,"configuraci¢n tiene asimismo 410K",NEWLINE
		dc.b	CENTRE,"de efectos sonoros adicionales.",NEWLINE
		dc.b	ENDPHRASE

.mesg_009	dc.b	CENTRE,"Concepto, dise¤o, programaci¢n,",NEWLINE
		dc.b	CENTRE,"director, efectos sonoros, iconos,",NEWLINE
		dc.b	CENTRE,"instalaci¢n de disco duro, c¢digo de",NEWLINE
		dc.b	CENTRE,"inicializaci¢n y muchas horas de trabajo",NEWLINE
		dc.b	ENDPHRASE

.mesg_010	dc.b	CENTRE,"Gr ficos"
		dc.b	ENDPHRASE

.mesg_011	dc.b	CENTRE,"M£sica original"
		dc.b	ENDPHRASE

.mesg_012	dc.b	CENTRE,"Material de fondo"
		dc.b	ENDPHRASE

.mesg_013	dc.b	CENTRE,"Dise¤o de mapa"
		dc.b	ENDPHRASE

.mesg_014	dc.b	CENTRE,"Ilustraci¢n de personajes"
		dc.b	ENDPHRASE

.mesg_015	dc.b	CENTRE,"Software de desarrollo"
		dc.b	ENDPHRASE

.mesg_016	dc.b	CENTRE,"Herramientas de gr ficos"
		dc.b	ENDPHRASE

.mesg_017	dc.b	CENTRE,"M¢dulo de jugador MED V3.00"
		dc.b	ENDPHRASE

.mesg_018	dc.b	CENTRE,"Comprensi¢n de datos y E/S de disco"
		dc.b	ENDPHRASE

.mesg_019	dc.b	CENTRE,"Mozo de t‚"
		dc.b	ENDPHRASE

.mesg_020	dc.b	CENTRE,"Lectura de palanca de mandos de 4 botones",NEWLINE
		dc.b	CENTRE,"desarrollado a partir del c¢digo obra de",NEWLINE
		dc.b	ENDPHRASE

.mesg_021	dc.b	CENTRE,"Garant¡a de calidad"
		dc.b	ENDPHRASE

.mesg_022	dc.b	CENTRE,"(sin ning£n orden en particular)"
		dc.b	ENDPHRASE

.mesg_023	dc.b	CENTRE,"Toda la programaci¢n y producci¢n de este",NEWLINE
		dc.b	CENTRE,"juego, incluyendo sonido y documentaci¢n",NEWLINE
		dc.b	CENTRE,"se ha llevado a cabo exclusivamente",NEWLINE
		dc.b	CENTRE,"con ordenadores Commodore Amiga.",NEWLINE
		dc.b	ENDPHRASE

.mesg_024	dc.b	CENTRE,"La pirater¡a del software pone en peligro",NEWLINE
		dc.b	CENTRE,"el posterior servicio t‚cnico y de",NEWLINE
		dc.b	CENTRE,"asistencia de su Amiga. Es su deber respetar el",NEWLINE
		dc.b	CENTRE,"arduo trabajo de otras personas.",NEWLINE,NEWLINE
		dc.b	CENTRE,"­LA PIRATERIA ES UN ROBO!",NEWLINE
		dc.b	ENDPHRASE

.mesg_025	dc.b	CENTRE,".5%6/ *5%'/"
		dc.b	ENDPHRASE

.mesg_026	dc.b	CENTRE,"Seleccionar tipo de juego..."
		dc.b	ENDPHRASE

.mesg_027	dc.b	"Entrenamiento"
		dc.b	ENDPHRASE

.mesg_028	dc.b	"Juego completo de campa¤a"
		dc.b	ENDPHRASE

.mesg_029	dc.b	"Juego breve de acci¢n"
		dc.b	ENDPHRASE

.mesg_030	dc.b	CENTRE,"N£mero de jugadores humanos:"
		dc.b	ENDPHRASE

.mesg_031	dc.b	CENTRE,"Un solo jugador"
		dc.b	ENDPHRASE

.mesg_032	dc.b	CENTRE,"Dos jugadores"
		dc.b	ENDPHRASE

.mesg_033	dc.b	CENTRE,"Tres jugadores"
		dc.b	ENDPHRASE

.mesg_034	dc.b	CENTRE,"Cuatro jugadores"
		dc.b	ENDPHRASE

.mesg_035	dc.b	CENTRE,"!##)/. ; *5'!$/2"
		dc.b	ENDPHRASE

.mesg_036	dc.b	CENTRE,34,"Reserva zool¢gica",34
		dc.b	ENDPHRASE

.mesg_037	dc.b	CENTRE,34,"Reactor",34
		dc.b	ENDPHRASE

.mesg_038	dc.b	CENTRE,34,"Penitenciar¡a",34
		dc.b	ENDPHRASE

.mesg_039	dc.b	CENTRE,34,"Permanecer vivo",34
		dc.b	ENDPHRASE

.mesg_040	dc.b	CENTRE,"Pr¢xima lista"
		dc.b	ENDPHRASE

.mesg_041	dc.b	CENTRE,"!##)/. < *5'!$/2"
		dc.b	ENDPHRASE

.mesg_042	dc.b	CENTRE,34,"Jard¡n de Jarrys",34
		dc.b	ENDPHRASE

.mesg_043	dc.b	CENTRE,34,"Guerras de Lemmings 1",34
		dc.b	ENDPHRASE

.mesg_044	dc.b	CENTRE,34,"Generador de corriente",34
		dc.b	ENDPHRASE

.mesg_045	dc.b	CENTRE,34,"El manicomio",34
		dc.b	ENDPHRASE

.mesg_046	dc.b	CENTRE,"!##)/. = *5'!$/2"
		dc.b	ENDPHRASE

.mesg_047	dc.b	CENTRE,34,"Gran queso",34
		dc.b	ENDPHRASE

.mesg_048	dc.b	CENTRE,34,"Hu¡da a la muerte",34
		dc.b	ENDPHRASE

.mesg_049	dc.b	CENTRE,34,"Murci‚lagos m¢viles",34
		dc.b	ENDPHRASE

.mesg_050	dc.b	CENTRE,34,"Parque de Buckminster",34
		dc.b	ENDPHRASE

.mesg_051	dc.b	CENTRE,"!##)/. > *5'!$/2"
		dc.b	ENDPHRASE

.mesg_052	dc.b	CENTRE,34,"Centro recreativo",34
		dc.b	ENDPHRASE

.mesg_053	dc.b	CENTRE,34,"Edificio de esqu‚letos",34
		dc.b	ENDPHRASE

.mesg_054	dc.b	CENTRE,34,"Centro urbano",34
		dc.b	ENDPHRASE

.mesg_055	dc.b	CENTRE,34,"Centro comercial",34
		dc.b	ENDPHRASE

.mesg_056	dc.b	CENTRE,34,"Guerras de Lemmings 2",34
		dc.b	ENDPHRASE

.mesg_057	dc.b	CENTRE,"%.42%.!-)%.4/"
		dc.b	ENDPHRASE

.mesg_058	dc.b	CENTRE,34,"Exploraci¢n",34
		dc.b	ENDPHRASE

.mesg_059	dc.b	CENTRE,34,"Obst culos",34
		dc.b	ENDPHRASE

.mesg_060	dc.b	CENTRE,34,"Artiller¡a",34
		dc.b	ENDPHRASE

.mesg_061	dc.b	CENTRE,34,"Alcance de lanzamiento",34
		dc.b	ENDPHRASE

.mesg_062	dc.b	CENTRE,34,"Centinela de guardia",34
		dc.b	ENDPHRASE

.mesg_063	dc.b	CENTRE,"*5'!$/2 5./"
		dc.b	ENDPHRASE

.mesg_064	dc.b	CENTRE,"*5'!$/2 $/3"
		dc.b	ENDPHRASE

.mesg_065	dc.b	CENTRE,"*5'!$/2 42%3"
		dc.b	ENDPHRASE

.mesg_066	dc.b	CENTRE,"*5'!$/2 #5!42/"
		dc.b	ENDPHRASE

.mesg_067	dc.b	ALIGN,"Palanca"
		dc.b	ENDPHRASE

.mesg_068	dc.b	ALIGN,"Palanca"
		dc.b	ENDPHRASE

.mesg_069	dc.b	ALIGN,"(Palanca)"
		dc.b	ENDPHRASE

.mesg_070	dc.b	ALIGN,"(Palanca)"
		dc.b	ENDPHRASE

.mesg_071	dc.b	ALIGN,"Rat¢n 1"
		dc.b	ENDPHRASE

.mesg_072	dc.b	ALIGN,"Rat¢n 2"
		dc.b	ENDPHRASE

.mesg_073	dc.b	ALIGN,"Panel de mandos 1"
		dc.b	ENDPHRASE

.mesg_074	dc.b	ALIGN,"Apoyo de mando 2"
		dc.b	ENDPHRASE

.mesg_075	dc.b	ALIGN,"Teclado 1"
		dc.b	ENDPHRASE

.mesg_076	dc.b	ALIGN,"Teclado 2"
		dc.b	ENDPHRASE

.mesg_077	dc.b	ALIGN,"Teclado 3"
		dc.b	ENDPHRASE

.mesg_078	dc.b	ALIGN,"Teclado 4"
		dc.b	ENDPHRASE

.mesg_079	dc.b	"Tu equipo est  completo"
		dc.b	ENDPHRASE

.mesg_080	dc.b	";  fin de selecci¢n"
		dc.b	ENDPHRASE

.mesg_081	dc.b	"{  borrar la £ltima opci¢n"
		dc.b	ENDPHRASE

.mesg_082	dc.b	CENTRE,"*** MENSAJE DEL SISTEMA ***"
		dc.b	ENDPHRASE

.mesg_083	dc.b    CENTRE,"Ya has estado aqu¡, ¨quieres explorarlo otra vez?"
		dc.b	ENDPHRASE

.mesg_084	dc.b	"Si, desep explorarlo."
		dc.b	ENDPHRASE

.mesg_085	dc.b	"No, s¢lo ll‚veme all¡."
		dc.b	ENDPHRASE

.mesg_086	dc.b	CENTRE,"*** MENSAJE DEL SISTEMA ***"
		dc.b	ENDPHRASE

.mesg_087	dc.b    CENTRE,"Buscando el lugar indicado...."
		dc.b	ENDPHRASE

.mesg_088	dc.b	CENTRE,"*** ZONA COMPROMETIDA ***"
		dc.b	ENDPHRASE

.mesg_089	dc.b	CENTRE,"*** LA ZONA NO HA SIDO COMPROMETIDA ***"
		dc.b	ENDPHRASE

.mesg_090	dc.b	CENTRE,"NO SE ENCUENTRA DISCO "
		dc.b	ENDPHRASE

.mesg_091	dc.b	CENTRE,"Introduczca el disco en la unidad.",NEWLINE
		dc.b	CENTRE,"Pulse una tecla cuando est‚ preparado.",NEWLINE
		dc.b	ENDPHRASE

.mesg_092	dc.b	CENTRE,"DISCO LLENO",NEWLINE,NEWLINE
		dc.b	CENTRE,"Pulse una tecla para continuar.",NEWLINE
		dc.b	ENDPHRASE

.mesg_093	dc.b	CENTRE,"­ERROR DE E/S DEL DISCO!",NEWLINE
		dc.b	CENTRE,"No es un disco AmigaDOS.",NEWLINE
		dc.b	CENTRE,"Pulsar una tecla para intentar de nuevo.",NEWLINE
		dc.b	ENDPHRASE

.mesg_094	dc.b	CENTRE,"­ERROR DE E/S DEL DISCO!",NEWLINE
		dc.b	CENTRE,"La informaci¢n del disco est  corrupta.",NEWLINE
		dc.b	CENTRE,"Pulsar una tecla para intentarlo de nuevo.",NEWLINE
		dc.b	ENDPHRASE

.mesg_095	dc.b	CENTRE,"EL DISCO ESTA PROTEGIDO CONTRA ESCRITURA",NEWLINE
		dc.b	CENTRE,"Active la escritura del disco",NEWLINE
		dc.b	CENTRE,"Pulse una tecla para continuar.",NEWLINE
		dc.b	ENDPHRASE

.mesg_096	dc.b	CENTRE,"ERROR DE DISCO "
		dc.b	ENDPHRASE

.mesg_097	dc.b	CENTRE,"Pulse una tecla para reintentar",NEWLINE
		dc.b	ENDPHRASE

.mesg_098	dc.b	"     DISCO "
		dc.b	ENDPHRASE

.mesg_099	dc.b	"     CARGANDO INFORMACION",NEWLINE
		dc.b	"     Espere....",NEWLINE
		dc.b	ENDPHRASE

.mesg_100	dc.b	"BUSCANDO EL DISCO "
		dc.b	ENDPHRASE

.mesg_101	dc.b	"     DISCO "
		dc.b	ENDPHRASE

.mesg_102	dc.b	"     DECOMPRESION DE DATOS",NEWLINE
		dc.b	"     Espere....",NEWLINE
		dc.b	ENDPHRASE

.mesg_103	dc.b	CENTRE,"*** PAUSA DE JUEGO ***"
		dc.b	ENDPHRASE

.mesg_104	dc.b	CENTRE,"PRESENTACION DE HIRED GUNS"
		dc.b	ENDPHRASE
.mesg_105	dc.b	CENTRE,"DEMOSTRACION DE HIRED GUNS"
		dc.b	ENDPHRASE

.mesg_106	dc.b	CENTRE,"UN JUEGO DMA DESIGN OBRA DE SCOTT JOHNSTON"
		dc.b	ENDPHRASE
.mesg_107	dc.b	CENTRE,"COPYRIGHT PSYGNOSIS 1993-94"
		dc.b	ENDPHRASE

.mesg_108	dc.b	"Concepto, dise¤o,"
		dc.b	ENDPHRASE
.mesg_109	dc.b	"programaci¢n,"
		dc.b	ENDPHRASE
.mesg_110	dc.b	"efectos sonoros"
		dc.b	ENDPHRASE

.mesg_111	dc.b	"Gr ficos"
		dc.b	ENDPHRASE

.mesg_112	dc.b	"M£sica original"
		dc.b	ENDPHRASE
.mesg_113	dc.b	"Material de fondo"
		dc.b	ENDPHRASE

.mesg_114	dc.b	"ARCHIVAR JUEGO ACTUAL"
		dc.b	ENDPHRASE
.mesg_115	dc.b	"CARGAR UN JUEGO ARCHIVADO"
		dc.b	ENDPHRASE
.mesg_116	dc.b	"REPETIR ESTE NIVEL"
		dc.b	ENDPHRASE
.mesg_117	dc.b	"FIJAR SECUENCIA SI/NO"
		dc.b	ENDPHRASE
.mesg_118	dc.b	"ESTA PANTALLA ACTIVAR/DESACTIVAR"
		dc.b	ENDPHRASE

.mesg_119	dc.b	"SALIR (A WORKBENCH)"
		dc.b	ENDPHRASE
.mesg_120	dc.b	"WORKBENCH A PARTE DELANTERA"
		dc.b	ENDPHRASE

.mesg_121	dc.b	"ESTA PANTALLA ACTIVAR/DESACTIVAR"
		dc.b	ENDPHRASE
.mesg_122	dc.b	"REPETIR ESTE NIVEL"
		dc.b	ENDPHRASE

.mesg_123	dc.b	"ABANDONAR (A MAPAMUNDI)"
		dc.b	ENDPHRASE
.mesg_124	dc.b	"SALIR (A MENU PRINCIPAL)"
		dc.b	ENDPHRASE

.mesg_125	dc.b	CENTRE,"*** CONTROLES DE SEGURIDAD ***"
		dc.b	ENDPHRASE

.mesg_126	dc.b	CENTRE,"CONFORME EL TRATADO 2650."
		dc.b	ENDPHRASE
.mesg_127	dc.b	CENTRE,"LAS LEYES INTERESTELARES DICTAN QUE DEBEN EFECTUARSE"
		dc.b	ENDPHRASE
.mesg_128	dc.b	CENTRE,"CONTROLES DE SEGURIDAD EN TODOS LOS CENTROS DE POBLACION"
		dc.b	ENDPHRASE
.mesg_129	dc.b	CENTRE,"CIVIL Y ESTABLECIMIENTOS MILITARY ESTABLISHMENTS."
		dc.b	ENDPHRASE

.mesg_266	dc.b	CENTRE,"INTRODUZCA LA CLASE DE ESTRELLA"
		dc.b	ENDPHRASE
.mesg_267	dc.b	"."
		dc.b	ENDPHRASE

.mesg_268	dc.b	CENTRE,"INTRODUZCA LA DISTANCIA HASTA LA ESTRELLA"
		dc.b	ENDPHRASE
.mesg_269	dc.b	"."
		dc.b	ENDPHRASE

.mesg_270	dc.b	CENTRE,"INTRODUZCA LA DECLINACION DE LA ESTRELLA"
		dc.b	ENDPHRASE
.mesg_271	dc.b	"."
		dc.b	ENDPHRASE

.mesg_272	dc.b	CENTRE,"INTRODUZCA EL ASCENSO DE LA ESTRELLA"
		dc.b	ENDPHRASE
.mesg_273	dc.b	"."
		dc.b	ENDPHRASE

.mesg_130	dc.b	CENTRE,"INTRODUZCA LA MASA DE LA ESTRELLA"
		dc.b	ENDPHRASE
.mesg_131	dc.b	"."
		dc.b	ENDPHRASE

.mesg_132	dc.b	CENTRE,"INTRODUZCA EL NUMERO DE PLANETAS CIRCUNDANTES A LAESTRELLA"
		dc.b	ENDPHRASE
.mesg_133	dc.b	"."
		dc.b	ENDPHRASE

.mesg_134	dc.b	"RESPUESTA"
		dc.b	ENDPHRASE

.mesg_135	dc.b	CENTRE,"INCORRECTO: INTENTAR DE NUEVO"
		dc.b	ENDPHRASE

.mesg_136	dc.b	CENTRE,"*** MENSAJE DE SISTEMAS DE BATALLA TESSERACT ***"
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

.mesg_144	dc.b	CENTRE,"TIEMPO DE LA MISION AGOTADO."
		dc.b	ENDPHRASE
.mesg_145	dc.b	CENTRE,"A TODOS LOS PARTICIPANTES EN EL ACTUAL EJERCICIO:"
		dc.b	ENDPHRASE
.mesg_146	dc.b	CENTRE,"EL TIEMPO EN ESTA ZONA SE HA AGOTADO."
		dc.b	ENDPHRASE
.mesg_147	dc.b	CENTRE,"LA MALA ACTUACION DE LOS PARTICIPANTES DARA COMO RESULTADO"
		dc.b	ENDPHRASE
.mesg_148	dc.b	CENTRE,"UN DESCENSO EN LAS MARCAS DE CIUDADANIA PERTINENTES."
		dc.b	ENDPHRASE
.mesg_149	dc.b	CENTRE,"S.B.T. NO ACEPTARA SOLICITUDES DE REEMBOLSO"
		dc.b	ENDPHRASE
.mesg_150	dc.b	CENTRE,"Y TAMPOCO SE PAGAR N LOS SEGUROS DE VIDA."
		dc.b	ENDPHRASE

.mesg_151	dc.b	CENTRE,"OBJETIVO DE LA MISION COMPLETADO POR"
		dc.b	ENDPHRASE
.mesg_152	dc.b	CENTRE,"S.B.T. DESEA FELICITAR A LAS PERSONAS MENCIONADAS Y EXPRESAR"
		dc.b	ENDPHRASE
.mesg_153	dc.b	CENTRE,"SUS CONDOLENCIAS A LOS DEM S PARTICIPANTES...."
		dc.b	ENDPHRASE

.mesg_154	dc.b	"PULSE CUALQUIER OTRA TECLA"
		dc.b	ENDPHRASE
.mesg_155	dc.b	"CONTINUAR"
		dc.b	ENDPHRASE

.mesg_156	dc.b	CENTRE,"*** ARCHIVAR JUEGO ***"
		dc.b	ENDPHRASE
.mesg_157	dc.b	CENTRE,"¨DONDE DESEA"
		dc.b	ENDPHRASE
.mesg_158	dc.b	CENTRE,"ARCHIVAR EL JUEGO?"
		dc.b	ENDPHRASE
.mesg_159	dc.b	"DISCO RAM"
		dc.b	ENDPHRASE
.mesg_160	dc.b	"UNIDAD DE DISQUETES INTERNA"
		dc.b	ENDPHRASE
.mesg_161	dc.b	"ABANDONAR ARCHIVADO"
		dc.b	ENDPHRASE

.mesg_162	dc.b	"DISCO DURO"
		dc.b	ENDPHRASE

.mesg_163	dc.b	CENTRE,"*** CARGAR JUEGO ***"
		dc.b	ENDPHRASE
.mesg_164	dc.b	CENTRE,"¨DONDE DESEA"
		dc.b	ENDPHRASE
.mesg_165	dc.b	CENTRE,"CARGAR EL JUEGO?"
		dc.b	ENDPHRASE
.mesg_166	dc.b	"ABANDONAR LA CARGA"
		dc.b	ENDPHRASE

.mesg_167	dc.b	CENTRE,"INTRODUZCA EN LA UNIDAD INTERNA UN DISCO VACIO"
		dc.b	ENDPHRASE
.mesg_168	dc.b	CENTRE,"EN EL QUE SE PUEDA GRABAR O UNDISCO DE JUEGO ARCHIVADO."
		dc.b	ENDPHRASE
.mesg_169	dc.b	CENTRE,"(­EN CASO DE INTRODUCIR UN DISCO DE JUEGO ARCHIVADO"
		dc.b	ENDPHRASE
.mesg_170	dc.b	CENTRE,"DE HIRED GUNS SE BORRARA TODA LA INFORMACION DEL MISMO!)"
		dc.b	ENDPHRASE
.mesg_171	dc.b	"PULSE CUALQUIER OTRA TECLA"
		dc.b	ENDPHRASE
.mesg_172	dc.b	"CONTINUAR"
		dc.b	ENDPHRASE

.mesg_173	dc.b	CENTRE,"INTRODUZCA UN DISCO DE JUEGO DE HIRED GUNS"
		dc.b	ENDPHRASE
.mesg_174	dc.b	CENTRE,"EN LA UNIDAD INTERNA."
		dc.b	ENDPHRASE

.mesg_175	dc.b	CENTRE,"*** ARCHIVAR/CARGAR JUEGO ***"
		dc.b	ENDPHRASE
.mesg_176	dc.b	CENTRE,"ESTE DISCO NO ES UN DISCO DE JUEGO ARCHIVADO DE"
		dc.b	ENDPHRASE
.mesg_177	dc.b	CENTRE,"HIRED GUNS. ¨ESTA SEGURO DE QUE DESEA FORMATEARlO?"
		dc.b	ENDPHRASE
.mesg_178	dc.b	CENTRE,"CERCI¢RESE DE QUE DICHO DISCO NO CONTIENE NINGUNA INFORMACION"
		dc.b	ENDPHRASE
.mesg_179	dc.b	CENTRE,"DE IMPORTANCIA, YA QUE SE PERDERA TODA LA INFORMACION."
		dc.b	ENDPHRASE
.mesg_180	dc.b	"ABANDONAR FORMATEO"
		dc.b	ENDPHRASE

.mesg_181	dc.b	CENTRE,"EXISTEN 5 POSICIONES PARA ARCHIVAR UN JUEGO."
		dc.b	ENDPHRASE
.mesg_182	dc.b	CENTRE,"PULSE F1-F5 PARA SELECCIONAR UNA POSICION. PUEDE INTRODUCIR UNA"
		dc.b	ENDPHRASE
.mesg_183	dc.b	CENTRE,"BREVE DESCRIPCION QUE LE AYUDE A IDENTIFICAR CADA JUEGO ARCHIVADO."
		dc.b	ENDPHRASE
.mesg_184	dc.b	CENTRE,"(AL SELECCIONAR UNA POSICION UTILIZADA"
		dc.b	ENDPHRASE
.mesg_185	dc.b	CENTRE,"SOBREESCRIBIRA LA INFORMACION EXISTENTE.)"
		dc.b	ENDPHRASE

.mesg_186	dc.b	"ABANDONAR ARCHIVADO"
		dc.b	ENDPHRASE

.mesg_187	dc.b	"POSICION"
		dc.b	ENDPHRASE

.mesg_188	dc.b	"VACIA"
		dc.b	ENDPHRASE

.mesg_189	dc.b	CENTRE,"EXISTEN 5 POSICIONES DESDE LAS QUE SE PUEDE CARGAR UN JUEGO."
		dc.b	ENDPHRASE
.mesg_190	dc.b	CENTRE,"PULSE F1-F5 PARA SELECCIONAR UNA POSICION."
		dc.b	ENDPHRASE

.mesg_191	dc.b	CENTRE,"ARCHIVANDO EL JUEGO...."
		dc.b	ENDPHRASE

.mesg_192	dc.b	CENTRE,"CARGANDO EL JUEGO ARCHIVADO...."
		dc.b	ENDPHRASE

.mesg_193	dc.b	CENTRE,"CARGANDO GRAFICOS...."
		dc.b	ENDPHRASE

.mesg_194	dc.b	CENTRE,"CARGANDO INFORMACION DEL JUEGO..."
		dc.b	ENDPHRASE

.mesg_195	dc.b	CENTRE,"CARGANDO EFECTOS SONOROS..."
		dc.b	ENDPHRASE

.mesg_196	dc.b	CENTRE,"CARGANDO PERSONAJES..."
		dc.b	ENDPHRASE

.mesg_197	dc.b	CENTRE,"*** ADVERTENCIA ***"
		dc.b	ENDPHRASE
.mesg_198	dc.b	CENTRE,"ERROR DE DISCO"
		dc.b	ENDPHRASE
.mesg_199	dc.b	CENTRE,"EXISTE UN PROBLEMA DE DISCO EN LA UNIDAD INTERNA."
		dc.b	ENDPHRASE
.mesg_200	dc.b	"REPETIR"
		dc.b	ENDPHRASE

.mesg_201	dc.b	"CUALQUIER TECLA"
		dc.b	ENDPHRASE

.mesg_202	dc.b	CENTRE,"EXISTE UN PROBLEMA DE DISCO DURO."
		dc.b	ENDPHRASE

.mesg_203	dc.b	CENTRE,"FORMATEADO DEL DISCO"
		dc.b	ENDPHRASE
.mesg_204	dc.b	CENTRE,"ESTE DISCO NO ES UN DISCO DE JUEGO ARCHIVADO DE"
		dc.b	ENDPHRASE
.mesg_205	dc.b	CENTRE,"HIRED GUNS. ESPERE A QUE SE FORMATEE EL DISCO, OPERACION"
		dc.b	ENDPHRASE
.mesg_206	dc.b	CENTRE,"BREVE Y NECESARIA UNA SOLA VEZ..."
		dc.b	ENDPHRASE

.mesg_207	dc.b	"FORMAT DISK"
		dc.b	ENDPHRASE

.mesg_208	dc.b	CENTRE,"EXISTE UN PROBLEMA DE RAM DEL DISCO."
		dc.b	ENDPHRASE

.mesg_209	dc.b	CENTRE,"ERROR GENERAL DE ESCRITURA/LECTURA."
		dc.b	ENDPHRASE

.mesg_210	dc.b	CENTRE,"­EL DISCO DEBE ESTAR EN LA MODALIDAD DE ESCRITURA!"
		dc.b	ENDPHRASE

.mesg_211	dc.b	CENTRE,"TIENE QUE INTRODUCIR UN DISCO EN BLANCO DE ESCRITURA"
		dc.b	ENDPHRASE
.mesg_212	dc.b	CENTRE,"O UN DISCO DE JUEGO ARCHIVADO EXISTENTE EN LA UNIDAD INTERNA."
		dc.b	ENDPHRASE

.mesg_213	dc.b	CENTRE,"FALLO DEL TOTAL DE SUMA. SIGNIFICA QUE LA INFORMACION"
		dc.b	ENDPHRASE
.mesg_214	dc.b	CENTRE,"HA SIDO ALTERADA O MANIPULADA."
		dc.b	ENDPHRASE

.mesg_215	dc.b	"PULSE CUALQUIER OTRA TECLA"
		dc.b	ENDPHRASE
.mesg_216	dc.b	"INTENTAR DE NUEVO"
		dc.b	ENDPHRASE

.mesg_217	dc.b	"BORRAR JUEGOS ARCHIVADOS"
		dc.b	ENDPHRASE

.mesg_218	dc.b	CENTRE,"ARCHIVADO, CORRECTO. NO HAY ERRORES."
		dc.b	ENDPHRASE

.mesg_219	dc.b	CENTRE,"CARGA, CORRECTA. NO HAY ERRORES."
		dc.b	ENDPHRASE

.mesg_220	dc.b	CENTRE,"INTRODUZCA DISCO "
		dc.b	ENDPHRASE
.mesg_221	dc.b	"EN CUALQUIER UNIDAD."
		dc.b	ENDPHRASE

.mesg_222	dc.b	CENTRE,"BUSCANDO DISCO "
		dc.b	ENDPHRASE

.mesg_240	dc.b	""
		dc.b	ENDPHRASE

.mesg_223	dc.b	CENTRE,"HAY QUE CARGAR UN JUEGO ARCHIVADO QUE SEA VALIDO."
		dc.b	ENDPHRASE

.mesg_224	dc.b	CENTRE,"NO HAY SUFICIENTE MEMORIA PARA EL DISCO RAM."
		dc.b	ENDPHRASE

.mesg_225	dc.b	CENTRE,"EL DISCO RAM ESTA VACIO."
		dc.b	ENDPHRASE

.mesg_226	dc.b	CENTRE,"*** FRACASO DE LA MISION ***"
		dc.b	ENDPHRASE
.mesg_227	dc.b	CENTRE,"DESGRACIADAMENTE LOS PARAMETROS DE LA MISION"
		dc.b	ENDPHRASE
.mesg_228	dc.b	CENTRE,"EXIGEN QUE TODOS LOS MIEMBROS DEL EQUIPO SOBREVIVAN."
		dc.b	ENDPHRASE
.mesg_229	dc.b	CENTRE,"­PROCURE TENER MAS CUIDADO LA PROXIMA VEZ!"
		dc.b	ENDPHRASE

.mesg_230	dc.b	"REPETIR ESTE NIVEL"
		dc.b	ENDPHRASE

.mesg_231	dc.b	"SALIR DE HIRED GUNS"
		dc.b	ENDPHRASE

.mesg_232	dc.b	"SALIR A MENU PRINCIPAL"
		dc.b	ENDPHRASE

.mesg_233	dc.b	CENTRE,"*** MUERTE ***"
		dc.b	ENDPHRASE
.mesg_234	dc.b	CENTRE,"HA SIDO ANIQUILADO EL EQUIPO AL COMPLETO."
		dc.b	ENDPHRASE
.mesg_235	dc.b	CENTRE,"¨PODRIA SER SE¥AL DE UN MAL LIDERAZGO,"
		dc.b	ENDPHRASE
.mesg_236	dc.b	CENTRE,"O TAL VEZ TOTAL INCOMPETENCIA?"
		dc.b	ENDPHRASE
.mesg_237	dc.b	CENTRE,"SEA CUAL SEA LA RAZON, TIENE LA SUERTE"
		dc.b	ENDPHRASE
.mesg_238	dc.b	CENTRE,"DE GOZAR DE OTRA OPORTUNIDAD..."
		dc.b	ENDPHRASE

.mesg_239	dc.b	"ABORT"
		dc.b	ENDPHRASE

.mesg_241	dc.b	"Humano"
		dc.b	ENDPHRASE

.mesg_242	dc.b	"Androide"
		dc.b	ENDPHRASE

.mesg_243	dc.b	"Golem"
		dc.b	ENDPHRASE

.mesg_244	dc.b	"Androide"
		dc.b	ENDPHRASE

.mesg_245	dc.b	"Androide"
		dc.b	ENDPHRASE

.mesg_246	dc.b	"Var¢n"
		dc.b	ENDPHRASE

.mesg_247	dc.b	"Hembra"
		dc.b	ENDPHRASE

.mesg_248	dc.b	"N/A"
		dc.b	ENDPHRASE

.mesg_249	dc.b	"Marino"
		dc.b	ENDPHRASE

.mesg_250	dc.b	"Asesino"
		dc.b	ENDPHRASE

.mesg_251	dc.b	"Androide"
		dc.b	ENDPHRASE

.mesg_252	dc.b	"M‚dico"
		dc.b	ENDPHRASE

.mesg_253	dc.b	"Ciudadano"
		dc.b	ENDPHRASE

.mesg_254	dc.b	"Piloto"
		dc.b	ENDPHRASE

.mesg_255	dc.b	"Agente"
		dc.b	ENDPHRASE

.mesg_256	dc.b	"Ingeniero"
		dc.b	ENDPHRASE

.mesg_257	dc.b	"Esclavo"
		dc.b	ENDPHRASE

.mesg_258	dc.b	"Tirador"
		dc.b	ENDPHRASE

.mesg_259	dc.b	"Soldado de caballer¡a"
		dc.b	ENDPHRASE

.mesg_260	dc.b	"Multiprop¢sito"
		dc.b	ENDPHRASE

.mesg_261	dc.b	"Piloto"
		dc.b	ENDPHRASE

.mesg_262	dc.b	"PULSAR F"
		dc.b	ENDPHRASE
.mesg_263	dc.b	"PARA REGRESAR"
		dc.b	ENDPHRASE

.mesg_264	dc.b	CENTRE,"CHIP DE RAM ADICIONAL DISPONIBLE",NEWLINE
		dc.b	CENTRE,"Cargando efectos sonoros intensificados",NEWLINE
		dc.b	CENTRE,"Espere....",NEWLINE
		dc.b	ENDPHRASE

.mesg_265	dc.b	CENTRE,"­ERROR DE DESCOMPRESI¢N!",NEWLINE
		dc.b	CENTRE,"Fallo del software, memoria o disco.",NEWLINE
		dc.b	CENTRE,"Se trata de un error grave, reinicialice el sistema.",NEWLINE
		dc.b	ENDPHRASE

.mesg_274	dc.b	"Menu Principal"
		dc.b	ENDPHRASE
