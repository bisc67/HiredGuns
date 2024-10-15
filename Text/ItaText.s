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

		output	ItaText
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

.mesg_001	dc.b	CENTRE,"-%.5 02).#)0!,%"
		dc.b	ENDPHRASE

.mesg_002	dc.b	" Avvia un nuovo gioco"
		dc.b	ENDPHRASE

.mesg_003	dc.b	"Continua un gioco salvato"
		dc.b	ENDPHRASE

.mesg_004	dc.b	"Esci al Workbench"
		dc.b	ENDPHRASE

.mesg_005	dc.b	CENTRE,"(Premi CTRL-Q per tornare qui)"
		dc.b	ENDPHRASE

.mesg_006	dc.b	CENTRE,"()2%$ '5.3"
		dc.b	ENDPHRASE

.mesg_007	dc.b	CENTRE,"E' un gioco DMA Design",NEWLINE
		dc.b	CENTRE,"Di Scott Johnston",NEWLINE,NEWLINE
		dc.b	CENTRE,"Copyright % Psygnosis 1993-94",NEWLINE
		dc.b	CENTRE,"Tutti i diritti riservati",NEWLINE
		dc.b	ENDPHRASE

.mesg_008	dc.b	CENTRE,"Questo gioco gira in modo",NEWLINE
		dc.b	CENTRE,"ottimale su macchine con 2 MB",NEWLINE
		dc.b	CENTRE,"di memoria grafica. Tale",NEWLINE
		dc.b	CENTRE,"configurazione beneficia di",NEWLINE
		dc.b	CENTRE,"410K di effetti sonori extra.",NEWLINE
		dc.b	CENTRE,"",NEWLINE
		dc.b	ENDPHRASE

.mesg_009	dc.b	CENTRE,"Ideazione, programmazione,",NEWLINE
		dc.b	CENTRE,"progetto, editore, effetti",NEWLINE
		dc.b	CENTRE,"sonori, icone, installazione HD,",NEWLINE
		dc.b	CENTRE,"codice d'avvio e duro lavoro:",NEWLINE
		dc.b	ENDPHRASE

.mesg_010	dc.b	CENTRE,"Grafica"
		dc.b	ENDPHRASE

.mesg_011	dc.b	CENTRE,"Musica originale"
		dc.b	ENDPHRASE

.mesg_012	dc.b	CENTRE,"Materiale di sfondo"
		dc.b	ENDPHRASE

.mesg_013	dc.b	CENTRE,"Disegno della mappa"
		dc.b	ENDPHRASE

.mesg_014	dc.b	CENTRE,"Illustrazioni dei personaggi"
		dc.b	ENDPHRASE

.mesg_015	dc.b	CENTRE,"Software di sviluppo"
		dc.b	ENDPHRASE

.mesg_016	dc.b	CENTRE,"Materiali grafici"
		dc.b	ENDPHRASE

.mesg_017	dc.b	CENTRE,"MED V3.00 Module Player"
		dc.b	ENDPHRASE

.mesg_018	dc.b	CENTRE,"I/O del disco e compressione dati"
		dc.b	ENDPHRASE

.mesg_019	dc.b	CENTRE,"Ragazzo del tä"
		dc.b	ENDPHRASE

.mesg_020	dc.b	CENTRE,"Lettura joystick a 4",NEWLINE
		dc.b	CENTRE," pulsanti decodificata da",NEWLINE
		dc.b	ENDPHRASE

.mesg_021	dc.b	CENTRE,"Garanzia di qualitÖ"
		dc.b	ENDPHRASE

.mesg_022	dc.b	CENTRE,"(in ordine casuale)"
		dc.b	ENDPHRASE

.mesg_023	dc.b	CENTRE,"Questo gioco (grafica, suono e",NEWLINE
		dc.b	CENTRE,"documentazione inclusi) ä stato",NEWLINE
		dc.b	CENTRE,"programmato e prodotto interamente",NEWLINE
		dc.b	CENTRE,"su computer Commodore Amiga.",NEWLINE
		dc.b	ENDPHRASE

.mesg_024	dc.b	CENTRE,"La pirateria del software minaccia",NEWLINE
		dc.b	CENTRE,"l'assistenza futura per il tuo Amiga.",NEWLINE
		dc.b	CENTRE,"Rispetta dunque il duro lavoro di",NEWLINE
		dc.b	CENTRE,"altre persone.",NEWLINE,NEWLINE
		dc.b	CENTRE,"LA PIRATERIA E UN FURTO!",NEWLINE
		dc.b	ENDPHRASE

.mesg_025	dc.b	CENTRE,".5/6/ ')/#/"
		dc.b	ENDPHRASE

.mesg_026	dc.b	CENTRE,"Seleziona il tipo di gioco...."
		dc.b	ENDPHRASE

.mesg_027	dc.b	"Addestramento"
		dc.b	ENDPHRASE

.mesg_028	dc.b	"Campagna intera"
		dc.b	ENDPHRASE

.mesg_029	dc.b	"Gioco ridotto"
		dc.b	ENDPHRASE

.mesg_030	dc.b	CENTRE,"Quanti giocatori umani?"
		dc.b	ENDPHRASE

.mesg_031	dc.b	CENTRE,"1 giocatore"
		dc.b	ENDPHRASE

.mesg_032	dc.b	CENTRE,"2 giocatori"
		dc.b	ENDPHRASE

.mesg_033	dc.b	CENTRE,"3 giocatori"
		dc.b	ENDPHRASE

.mesg_034	dc.b	CENTRE,"4 giocatori"
		dc.b	ENDPHRASE

.mesg_035	dc.b	CENTRE,"!:)/.% 0%2 ; '#"
		dc.b	ENDPHRASE

.mesg_036	dc.b	CENTRE,34,"Riserva di caccia",34
		dc.b	ENDPHRASE

.mesg_037	dc.b	CENTRE,34,"Reattore nucleare",34
		dc.b	ENDPHRASE

.mesg_038	dc.b	CENTRE,34,"Penitenziario",34
		dc.b	ENDPHRASE

.mesg_039	dc.b	CENTRE,34,"Sopravvivenza",34
		dc.b	ENDPHRASE

.mesg_040	dc.b	CENTRE,"Prossima lista"
		dc.b	ENDPHRASE

.mesg_041	dc.b	CENTRE,"!:)/.% 0%2 < '#"
		dc.b	ENDPHRASE

.mesg_042	dc.b	CENTRE,34,"Giardino di Jarry",34
		dc.b	ENDPHRASE

.mesg_043	dc.b	CENTRE,34,"Lemminguerre 1",34
		dc.b	ENDPHRASE

.mesg_044	dc.b	CENTRE,34,"Centrale",34
		dc.b	ENDPHRASE

.mesg_045	dc.b	CENTRE,34,"Manicomio",34
		dc.b	ENDPHRASE

.mesg_046	dc.b	CENTRE,"!:)/.% 0%2 = '#"
		dc.b	ENDPHRASE

.mesg_047	dc.b	CENTRE,34,"Formaggione",34
		dc.b	ENDPHRASE

.mesg_048	dc.b	CENTRE,34,"Fuga per la morte",34
		dc.b	ENDPHRASE

.mesg_049	dc.b	CENTRE,34,"Pipistrelliland",34
		dc.b	ENDPHRASE

.mesg_050	dc.b	CENTRE,34,"Parco delle Fascine",34
		dc.b	ENDPHRASE

.mesg_051	dc.b	CENTRE,"!:)/.% 0%2 > '#"
		dc.b	ENDPHRASE

.mesg_052	dc.b	CENTRE,34,"Centro divertimenti",34
		dc.b	ENDPHRASE

.mesg_053	dc.b	CENTRE,34,"Sala macabra",34
		dc.b	ENDPHRASE

.mesg_054	dc.b	CENTRE,34,"Agglomerato urbano",34
		dc.b	ENDPHRASE

.mesg_055	dc.b	CENTRE,34,"Centro commerciale",34
		dc.b	ENDPHRASE

.mesg_056	dc.b	CENTRE,34,"Lemminguerre 2",34
		dc.b	ENDPHRASE

.mesg_057	dc.b	CENTRE,"!$$%342!-%.4/"
		dc.b	ENDPHRASE

.mesg_058	dc.b	CENTRE,34,"Esplorazione",34
		dc.b	ENDPHRASE

.mesg_059	dc.b	CENTRE,34,"Ostacoli",34
		dc.b	ENDPHRASE

.mesg_060	dc.b	CENTRE,34,"Tempesta di fuoco",34
		dc.b	ENDPHRASE

.mesg_061	dc.b	CENTRE,34,"Portata di tiro",34
		dc.b	ENDPHRASE

.mesg_062	dc.b	CENTRE,34,"Turno di guardia",34
		dc.b	ENDPHRASE

.mesg_063	dc.b	CENTRE,"')/#!4/2% ;"
		dc.b	ENDPHRASE

.mesg_064	dc.b	CENTRE,"')/#!4/2% <"
		dc.b	ENDPHRASE

.mesg_065	dc.b	CENTRE,"')/#!4/2% ="
		dc.b	ENDPHRASE

.mesg_066	dc.b	CENTRE,"')/#!4/2% >"
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

.mesg_073	dc.b	ALIGN,"Joypad 1"
		dc.b	ENDPHRASE

.mesg_074	dc.b	ALIGN,"Joypad 2"
		dc.b	ENDPHRASE

.mesg_075	dc.b	ALIGN,"Tastiera 1"
		dc.b	ENDPHRASE

.mesg_076	dc.b	ALIGN,"Tastiera 2"
		dc.b	ENDPHRASE

.mesg_077	dc.b	ALIGN,"Tastiera 3"
		dc.b	ENDPHRASE

.mesg_078	dc.b	ALIGN,"Tastiera 4"
		dc.b	ENDPHRASE

.mesg_079	dc.b	"La squadra ä al completo"
		dc.b	ENDPHRASE

.mesg_080	dc.b	";  Fine della selezione"
		dc.b	ENDPHRASE

.mesg_081	dc.b	"{  Cancella l'ultima selezione"
		dc.b	ENDPHRASE

.mesg_082	dc.b	CENTRE,"*** MESSAGGIO DEL SISTEMA ***"
		dc.b	ENDPHRASE

.mesg_083	dc.b    CENTRE,"Sei giÖ stato qui. Vuoi esplorare di nuovo?"
		dc.b	ENDPHRASE

.mesg_084	dc.b	"Sç, esplora il luogo."
		dc.b	ENDPHRASE

.mesg_085	dc.b	"No, recatici soltanto."
		dc.b	ENDPHRASE

.mesg_086	dc.b	CENTRE,"*** MESSAGGIO DEL SISTEMA ***"
		dc.b	ENDPHRASE

.mesg_087	dc.b    CENTRE,"Trasferimento al luogo indicato...."
		dc.b	ENDPHRASE

.mesg_088	dc.b	CENTRE,"*** AREA COMPROMESSA ***"
		dc.b	ENDPHRASE

.mesg_089	dc.b	CENTRE,"*** AREA NON COMPROMESSA ***"
		dc.b	ENDPHRASE

.mesg_090	dc.b	CENTRE,"DISCO NON TROVATO #"
		dc.b	ENDPHRASE

.mesg_091	dc.b	CENTRE,"Inserisci il disco in una unitÖ.",NEWLINE
		dc.b	CENTRE,"Quando sei pronto, premi un tasto.",NEWLINE
		dc.b	ENDPHRASE

.mesg_092	dc.b	CENTRE,"DISCO PIENO",NEWLINE,NEWLINE
		dc.b	CENTRE,"Per continuare premi un tasto.",NEWLINE
		dc.b	ENDPHRASE

.mesg_093	dc.b	CENTRE,"ERRORE DI I/O DEL DISCO!",NEWLINE
		dc.b	CENTRE,"Non ä un disco AmigaDOS.",NEWLINE
		dc.b	CENTRE,"Premi un tasto per riprovare.",NEWLINE
		dc.b	ENDPHRASE

.mesg_094	dc.b	CENTRE,"ERRORE DI I/O DEL DISCO!",NEWLINE
		dc.b	CENTRE,"I dati sul disco sono corrotti.",NEWLINE
		dc.b	CENTRE,"Premi un tasto per riprovare.",NEWLINE
		dc.b	ENDPHRASE

.mesg_095	dc.b	CENTRE,"DISCO PROTETTO DALLA SCRITTURA",NEWLINE
		dc.b	CENTRE,"Togli la protezione dalla scrittura,",NEWLINE
		dc.b	CENTRE,"poi premi un tasto per continuare.",NEWLINE
		dc.b	ENDPHRASE

.mesg_096	dc.b	CENTRE,"ERRORE SUL DISCO #"
		dc.b	ENDPHRASE

.mesg_097	dc.b	CENTRE,"Premi un tasto per riprovare.",NEWLINE
		dc.b	ENDPHRASE

.mesg_098	dc.b	"     DISCO #"
		dc.b	ENDPHRASE

.mesg_099	dc.b	"     DATI DI CARICAMENTO",NEWLINE
		dc.b	"     Attendere....",NEWLINE
		dc.b	ENDPHRASE

.mesg_100	dc.b	"RICERCA DEL DISCO #"
		dc.b	ENDPHRASE

.mesg_101	dc.b	"     DISCO #"
		dc.b	ENDPHRASE

.mesg_102	dc.b	"     DECOMPRESSIONE DEI DATI",NEWLINE
		dc.b	"     Attendere....",NEWLINE
		dc.b	ENDPHRASE

.mesg_103	dc.b	CENTRE,"*** GIOCO IN PAUSA ***"
		dc.b	ENDPHRASE

.mesg_104	dc.b	CENTRE,"ANTEPRIMA DI HIRED GUNS"
		dc.b	ENDPHRASE
.mesg_105	dc.b	CENTRE,"DIMOSTRAZIONE DI HIRED GUNS"
		dc.b	ENDPHRASE

.mesg_106	dc.b	CENTRE,"UN GIOCO DMA DESIGN DI SCOTT JOHNSTON"
		dc.b	ENDPHRASE
.mesg_107	dc.b	CENTRE,"COPYRIGHT PSYGNOSIS 1993-94"
		dc.b	ENDPHRASE

.mesg_108	dc.b	"Ideazione,"
		dc.b	ENDPHRASE
.mesg_109	dc.b	"programmazione,"
		dc.b	ENDPHRASE
.mesg_110	dc.b	"effetti sonori"
		dc.b	ENDPHRASE

.mesg_111	dc.b	"Grafica"
		dc.b	ENDPHRASE

.mesg_112	dc.b	"Musica originale"
		dc.b	ENDPHRASE
.mesg_113	dc.b	"Materiale di sfondo"
		dc.b	ENDPHRASE

.mesg_114	dc.b	"SALVA IL GIOCO ATTUALE"
		dc.b	ENDPHRASE
.mesg_115	dc.b	"CARICA UN GIOCO SALVATO"
		dc.b	ENDPHRASE
.mesg_116	dc.b	"RITENTA QUESTO LIVELLO"
		dc.b	ENDPHRASE
.mesg_117	dc.b	"BLOCCA IMMAGINE ON/OFF"
		dc.b	ENDPHRASE
.mesg_118	dc.b	"QUESTO SCHERMO ON/OFF"
		dc.b	ENDPHRASE

.mesg_119	dc.b	"ESCI (AL WORKBENCH)"
		dc.b	ENDPHRASE
.mesg_120	dc.b	"WORKBENCH IN PRIMO PIANO"
		dc.b	ENDPHRASE

.mesg_121	dc.b	"QUESTO SCHERMO ON/OFF"
		dc.b	ENDPHRASE
.mesg_122	dc.b	"RITENTA QUESTO LIVELLO"
		dc.b	ENDPHRASE

.mesg_123	dc.b	"ANNULLA (VAI ALLA MAPPA)"
		dc.b	ENDPHRASE
.mesg_124	dc.b	"ESCI (AL MENU PRINCIPALE)"
		dc.b	ENDPHRASE

.mesg_125	dc.b	CENTRE,"*** CONTROLLO DI SICUREZZA ***"
		dc.b	ENDPHRASE

.mesg_126	dc.b	CENTRE,"AS REQUIRED BY THE 2650 TREATY. IN BASE AL"
		dc.b	ENDPHRASE
.mesg_127	dc.b	CENTRE,"TRATTATO DEL 2650 LA LEGGE INTERSTELLARE"
		dc.b	ENDPHRASE
.mesg_128	dc.b	CENTRE,"ORDINA L'ESECUZIONE DI CONTROLLI DI SICUREZZA"
		dc.b	ENDPHRASE
.mesg_129	dc.b	CENTRE,"IN TUTTI I CENTRI POPOLATI E NELLE AREE MILITARI."
		dc.b	ENDPHRASE

.mesg_266	dc.b	CENTRE,"DIGITARE LA CLASSE DELLA STELLA"
		dc.b	ENDPHRASE
.mesg_267	dc.b	"."
		dc.b	ENDPHRASE

.mesg_268	dc.b	CENTRE,"DIGITARE LA DECLINAZIONE DELLA STELLA"
		dc.b	ENDPHRASE
.mesg_269	dc.b	"."
		dc.b	ENDPHRASE

.mesg_270	dc.b	CENTRE,"DIGITARE L'ASCENSIONE DELLA STELLA"
		dc.b	ENDPHRASE
.mesg_271	dc.b	"."
		dc.b	ENDPHRASE

.mesg_272	dc.b	CENTRE,"DIGITARE LA DISTANZA ALLA STELLA"
		dc.b	ENDPHRASE
.mesg_273	dc.b	"."
		dc.b	ENDPHRASE

.mesg_130	dc.b	CENTRE,"DIGITARE LA MASSA DELLA STELLA"
		dc.b	ENDPHRASE
.mesg_131	dc.b	"."
		dc.b	ENDPHRASE

.mesg_132	dc.b	CENTRE,"DIGITARE IL NUMERO DI PIANETI INTORNO ALLA STELLA"
		dc.b	ENDPHRASE
.mesg_133	dc.b	"."
		dc.b	ENDPHRASE

.mesg_134	dc.b	"RISPOSTA"
		dc.b	ENDPHRASE

.mesg_135	dc.b	CENTRE,"SBAGLIATO - RITENTA"
		dc.b	ENDPHRASE

.mesg_136	dc.b	CENTRE,"*** MESSAGGIO DALLA TESSERACT BATTLE SYSTEMS ***"
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

.mesg_144	dc.b	CENTRE,"TEMPO PER LA MISSIONE SCADUTO."
		dc.b	ENDPHRASE
.mesg_145	dc.b	CENTRE,"PER I PARTECIPANTI ALL'ESERCITAZIONE ATTUALE"
		dc.b	ENDPHRASE
.mesg_146	dc.b	CENTRE,"E SCADUTO IL TEMPO IN QUESTA ZONA. PER LE"
		dc.b	ENDPHRASE
.mesg_147	dc.b	CENTRE,"SCARSE PRESTAZIONI VERRANNO DEGRADATI GLI"
		dc.b	ENDPHRASE
.mesg_148	dc.b	CENTRE,"IMPORTANTI VERBALI DI CITTADINANZA. LA T.B.S."
		dc.b	ENDPHRASE
.mesg_149	dc.b	CENTRE,"NON CONCEDE RIMBORSI Nê ONORA L'ASSICURAZIONE"
		dc.b	ENDPHRASE
.mesg_150	dc.b	CENTRE,"SULLA VITA."
		dc.b	ENDPHRASE

.mesg_151	dc.b	CENTRE,"MISSIONE PORTATA A TERMINE DA"
		dc.b	ENDPHRASE
.mesg_152	dc.b	CENTRE,"LA T.B.S. SI CONGRATULA CON IL VINCITORE E SI"
		dc.b	ENDPHRASE
.mesg_153	dc.b	CENTRE,"RAMMARICA PER GLI ALTRI PARTECIPANTI...."
		dc.b	ENDPHRASE

.mesg_154	dc.b	"PREMI UN TASTO"
		dc.b	ENDPHRASE
.mesg_155	dc.b	"PER CONTINUARE"
		dc.b	ENDPHRASE

.mesg_156	dc.b	CENTRE,"*** SALVA GIOCO ***"
		dc.b	ENDPHRASE
.mesg_157	dc.b	CENTRE,"SU QUALE DISPOSITIVO"
		dc.b	ENDPHRASE
.mesg_158	dc.b	CENTRE,"VUOI SALVARLO?"
		dc.b	ENDPHRASE
.mesg_159	dc.b	"DISCO RAM"
		dc.b	ENDPHRASE
.mesg_160	dc.b	"UNITA FLOPPY INTERNA"
		dc.b	ENDPHRASE
.mesg_161	dc.b	"ANNULLA SALVATAGGIO"
		dc.b	ENDPHRASE

.mesg_162	dc.b	"HARD DISK"
		dc.b	ENDPHRASE

.mesg_163	dc.b	CENTRE,"*** CARICA GIOCO ***"
		dc.b	ENDPHRASE
.mesg_164	dc.b	CENTRE,"DA QUALE DISPOSITIVO"
		dc.b	ENDPHRASE
.mesg_165	dc.b	CENTRE," VUOI CARICARLO?"
		dc.b	ENDPHRASE
.mesg_166	dc.b	"ANNULLA CARICAMENTO"
		dc.b	ENDPHRASE

.mesg_167	dc.b	CENTRE,"INSERISCI NELL'UNITA INTERNA UN DISCO VUOTO NON PROTETTO"
		dc.b	ENDPHRASE
.mesg_168	dc.b	CENTRE,"DA SCRITTURA O UN DISCO DI GIOCHI SALVATI ESISTENTE."
		dc.b	ENDPHRASE
.mesg_169	dc.b	CENTRE,"SE NON E IL DISCO CONTENENTE I GIOCHI SALVATI DI HIRED GUNS,"
		dc.b	ENDPHRASE
.mesg_170	dc.b	CENTRE,"I DATI SUL DISCO VERRANNO CANCELLATI!"
		dc.b	ENDPHRASE
.mesg_171	dc.b	"PREMI UN TASTO"
		dc.b	ENDPHRASE
.mesg_172	dc.b	"PER CONTINUARE"
		dc.b	ENDPHRASE

.mesg_173	dc.b	CENTRE,"INSERICI NELL'UNITA INTERNA UN DISCO"
		dc.b	ENDPHRASE
.mesg_174	dc.b	CENTRE,"DI GIOCHI SALVATI DI HIRED GUNS."
		dc.b	ENDPHRASE

.mesg_175	dc.b	CENTRE,"*** SALVA/CARICA GIOCO ***"
		dc.b	ENDPHRASE
.mesg_176	dc.b	CENTRE,"IL DISCO NON CONTIENE GIOCHI SALVATI DI HIRED GUNS."
		dc.b	ENDPHRASE
.mesg_177	dc.b	CENTRE,"SEI SICURO DI VOLERLO FORMATTARE?"
		dc.b	ENDPHRASE
.mesg_178	dc.b	CENTRE,"CONTROLLA CHE NON CONTENGA DATI IMPORTANTI"
		dc.b	ENDPHRASE
.mesg_179	dc.b	CENTRE,"PRIMA CHE VENGANO CANCELLATI."
		dc.b	ENDPHRASE
.mesg_180	dc.b	"ABBANDONA FORMATTAZIONE"
		dc.b	ENDPHRASE

.mesg_181	dc.b	CENTRE,"PUOI SALVARE IL GIOCO IN 5 POSIZIONI."
		dc.b	ENDPHRASE
.mesg_182	dc.b	CENTRE,"PREMI F1-F5 PER SELEZIONARNE UNA. PUOI DIGITARE UNA BREVE"
		dc.b	ENDPHRASE
.mesg_183	dc.b	CENTRE,"DESCRIZIONE PER IDENTIFICARE OGNI GIOCO SALVATO."
		dc.b	ENDPHRASE
.mesg_184	dc.b	CENTRE,"SELEZIONANDO UNA POSIZIONE USATA,"
		dc.b	ENDPHRASE
.mesg_185	dc.b	CENTRE,"NE VERRANNO SOVRASCRITTI I DATI."
		dc.b	ENDPHRASE

.mesg_186	dc.b	"ANNULLA SALVATAGGIO"
		dc.b	ENDPHRASE

.mesg_187	dc.b	"POSIZIONE"
		dc.b	ENDPHRASE

.mesg_188	dc.b	"VUOTO"
		dc.b	ENDPHRASE

.mesg_189	dc.b	CENTRE,"PUOI CARICARE UN GIOCO DA 5 POSIZIONI."
		dc.b	ENDPHRASE
.mesg_190	dc.b	CENTRE,"PREMI F1-F5 PER SELEZIONARNE UNA."
		dc.b	ENDPHRASE

.mesg_191	dc.b	CENTRE,"SALVATAGGIO GIOCO...."
		dc.b	ENDPHRASE

.mesg_192	dc.b	CENTRE,"CARICAMENTO GIOCO SALVATO...."
		dc.b	ENDPHRASE

.mesg_193	dc.b	CENTRE,"CARICAMENTO GRAFICA...."
		dc.b	ENDPHRASE

.mesg_194	dc.b	CENTRE,"CARICAMENTO DATI DI GIOCO...."
		dc.b	ENDPHRASE

.mesg_195	dc.b	CENTRE,"CARICAMENTO EFFETTI SONORI...."
		dc.b	ENDPHRASE

.mesg_196	dc.b	CENTRE,"CARICAMENTO PERSONAGGI...."
		dc.b	ENDPHRASE

.mesg_197	dc.b	CENTRE,"*** AVVERTENZA ***"
		dc.b	ENDPHRASE
.mesg_198	dc.b	CENTRE,"ERRORE DI DISCO."
		dc.b	ENDPHRASE
.mesg_199	dc.b	CENTRE,"IL DISCO NELL'UNITA INTERNA HA UN PROBLEMA."
		dc.b	ENDPHRASE
.mesg_200	dc.b	"RIPROVA."
		dc.b	ENDPHRASE

.mesg_201	dc.b	"UN TASTO QUALSIASI"
		dc.b	ENDPHRASE

.mesg_202	dc.b	CENTRE,"L'HARD DISK HA UN PROBLEMA."
		dc.b	ENDPHRASE

.mesg_203	dc.b	CENTRE,"FORMATTAZIONE DISCO"
		dc.b	ENDPHRASE
.mesg_204	dc.b	CENTRE,"IL DISCO NON CONTIENE GIOCHI SALVATI DI HIRED GUNS."
		dc.b	ENDPHRASE
.mesg_205	dc.b	CENTRE,"ATTENDERE LA FINE DELLA FORMATTAZIONE."
		dc.b	ENDPHRASE
.mesg_206	dc.b	CENTRE,"L'OPERAZIONE SARA BREVE E NON VERRA RIPETUTA...."
		dc.b	ENDPHRASE

.mesg_207	dc.b	"FORMATTA DISCO"
		dc.b	ENDPHRASE

.mesg_208	dc.b	CENTRE,"C'E' UN PROBLEMA COL DISCO RAM."
		dc.b	ENDPHRASE

.mesg_209	dc.b	CENTRE,"ERRORE GENERICO DI LETTURA/SCRITTURA."
		dc.b	ENDPHRASE

.mesg_210	dc.b	CENTRE,"IL DISCO DEVE ESSERE ABILITATO PER LA SCRITTURA!!!!"
		dc.b	ENDPHRASE

.mesg_211	dc.b	CENTRE,"DEVI INSERIRE NELL'UNITA INTERNA UN DISCO VUOTO NON"
		dc.b	ENDPHRASE
.mesg_212	dc.b	CENTRE,"PROTETTO DA SCRITTURA O UN DISCO DI GIOCHI SALVATI."
		dc.b	ENDPHRASE

.mesg_213	dc.b	CENTRE,"CHECKSUM FALLITO: DATI CORROTTI O MANOMESSI."
		dc.b	ENDPHRASE
.mesg_214	dc.b	CENTRE,""
		dc.b	ENDPHRASE

.mesg_215	dc.b	"PREMI UN TASTO"
		dc.b	ENDPHRASE
.mesg_216	dc.b	"RITENTA"
		dc.b	ENDPHRASE

.mesg_217	dc.b	"CANCELLA GIOCHI SALVATI"
		dc.b	ENDPHRASE

.mesg_218	dc.b	CENTRE,"SALVATAGGIO OK. NESSUN ERRORE."
		dc.b	ENDPHRASE

.mesg_219	dc.b	CENTRE,"CARICAMENTO OK. NESSUN ERRORE."
		dc.b	ENDPHRASE

.mesg_220	dc.b	CENTRE,"INSERISCI IL DISCO "
		dc.b	ENDPHRASE
.mesg_221	dc.b	"IN UNA UNITA."
		dc.b	ENDPHRASE

.mesg_222	dc.b	CENTRE,"RICERCA DEL DISCO "
		dc.b	ENDPHRASE

.mesg_240	dc.b	""
		dc.b	ENDPHRASE

.mesg_223	dc.b	CENTRE,"DEVI CARICARE UN GIOCO SALVATO VALIDO."
		dc.b	ENDPHRASE

.mesg_224	dc.b	CENTRE,"MEMORIA LIBERA INSUFFICIENTE PER IL DISCO RAM."
		dc.b	ENDPHRASE

.mesg_225	dc.b	CENTRE,"IL DISCO RAM E VUOTO."
		dc.b	ENDPHRASE

.mesg_226	dc.b	CENTRE,"*** MISSIONE FALLITA ***"
		dc.b	ENDPHRASE
.mesg_227	dc.b	CENTRE,"PURTROPPO I PARAMETRI DELLA MISSIONE RICHIEDONO"
		dc.b	ENDPHRASE
.mesg_228	dc.b	CENTRE,"LA SOPRAVVIVENZA DI TUTTI I MEMBRI DELLA SQUADRA."
		dc.b	ENDPHRASE
.mesg_229	dc.b	CENTRE,"FAI MAGGIORE ATTENZIONE LA PROSSIMA VOLTA!"
		dc.b	ENDPHRASE

.mesg_230	dc.b	"RITENTA QUESTO LIVELLO"
		dc.b	ENDPHRASE

.mesg_231	dc.b	"USCITA DA HIRED GUNS"
		dc.b	ENDPHRASE

.mesg_232	dc.b	"ESCI AL MENU PRINCIPALE"
		dc.b	ENDPHRASE

.mesg_233	dc.b	CENTRE,"*** MORTE ***"
		dc.b	ENDPHRASE
.mesg_234	dc.b	CENTRE,"TUTTA LA TUA SQUADRA E STATA MASSACRATA."
		dc.b	ENDPHRASE
.mesg_235	dc.b	CENTRE,"SARA UN SEGNO DI SCARSA LEADERSHIP"
		dc.b	ENDPHRASE
.mesg_236	dc.b	CENTRE,"O D'INCOMPETENZA TOTALE?"
		dc.b	ENDPHRASE
.mesg_237	dc.b	CENTRE,"IN OGNI CASO, HAI LA FORTUNA"
		dc.b	ENDPHRASE
.mesg_238	dc.b	CENTRE,"DI AVERE UN'ALTRA POSSIBILITA...."
		dc.b	ENDPHRASE

.mesg_239	dc.b	"ANNULLA"
		dc.b	ENDPHRASE

.mesg_241	dc.b	"Humano"
		dc.b	ENDPHRASE

.mesg_242	dc.b	"Meccanoide"
		dc.b	ENDPHRASE

.mesg_243	dc.b	"Golem"
		dc.b	ENDPHRASE

.mesg_244	dc.b	"Umanoide"
		dc.b	ENDPHRASE

.mesg_245	dc.b	"Automa"
		dc.b	ENDPHRASE

.mesg_246	dc.b	"Maschio"
		dc.b	ENDPHRASE

.mesg_247	dc.b	"Femmina"
		dc.b	ENDPHRASE

.mesg_248	dc.b	"N/D"
		dc.b	ENDPHRASE

.mesg_249	dc.b	"Marinaio"
		dc.b	ENDPHRASE

.mesg_250	dc.b	"Killer"
		dc.b	ENDPHRASE

.mesg_251	dc.b	"Droide"
		dc.b	ENDPHRASE

.mesg_252	dc.b	"Medico"
		dc.b	ENDPHRASE

.mesg_253	dc.b	"Cittadino"
		dc.b	ENDPHRASE

.mesg_254	dc.b	"Pilota"
		dc.b	ENDPHRASE

.mesg_255	dc.b	"Agente UIPU"
		dc.b	ENDPHRASE

.mesg_256	dc.b	"Ingegnere"
		dc.b	ENDPHRASE

.mesg_257	dc.b	"Schiavo"
		dc.b	ENDPHRASE

.mesg_258	dc.b	"Tiratore scelto"
		dc.b	ENDPHRASE

.mesg_259	dc.b	"Cavalleggero"
		dc.b	ENDPHRASE

.mesg_260	dc.b	"Tuttofare"
		dc.b	ENDPHRASE

.mesg_261	dc.b	"Pilota"
		dc.b	ENDPHRASE

.mesg_262	dc.b	"PREMI F"
		dc.b	ENDPHRASE
.mesg_263	dc.b	"PER TORNARE AL GIOCO"
		dc.b	ENDPHRASE

.mesg_264	dc.b	CENTRE,"RAM EXTRA DISPONIBILE",NEWLINE
		dc.b	CENTRE,"Caricamento effetti sonori migliorati.",NEWLINE
		dc.b	CENTRE,"Attendere....",NEWLINE
		dc.b	ENDPHRASE

.mesg_265	dc.b	CENTRE,"ERRORE DI DECOMPRESSIONE!",NEWLINE
		dc.b	CENTRE,"Errore di software, di memoria o di disco.",NEWLINE
		dc.b	CENTRE,"E un errore fatale: risetta il computer.",NEWLINE
		dc.b	ENDPHRASE

.mesg_274	dc.b	"Menu Principale"
		dc.b	ENDPHRASE
