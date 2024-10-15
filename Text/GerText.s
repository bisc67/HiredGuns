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

		output	GerText
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

.mesg_001	dc.b	CENTRE,"(!504-%.5?"
		dc.b	ENDPHRASE

.mesg_002	dc.b	" Neues Spiel starten"
		dc.b	ENDPHRASE

.mesg_003	dc.b	"Gespeichertes Spiel fortsetzen"
		dc.b	ENDPHRASE

.mesg_004	dc.b	"Zu Workbench wechseln"
		dc.b	ENDPHRASE

.mesg_005	dc.b	CENTRE,"(CTRL-Q zur RÅckkehr)"
		dc.b	ENDPHRASE

.mesg_006	dc.b	CENTRE,"()2%$ '5.3"
		dc.b	ENDPHRASE

.mesg_007	dc.b	CENTRE,"Ein DMA-Design-Spiel",NEWLINE
		dc.b	CENTRE,"von Scott Johnston",NEWLINE,NEWLINE
		dc.b	CENTRE,"Copyright % Psygnosis 1993-94",NEWLINE
		dc.b	CENTRE,"Alle Rechte vorbehalten",NEWLINE
		dc.b	ENDPHRASE

.mesg_008	dc.b	CENTRE,"Das Spiel kann mit einem",NEWLINE
		dc.b	CENTRE,"Grafikspeicher von 2 MB",NEWLINE
		dc.b	CENTRE,"optimal betrieben werden.",NEWLINE
		dc.b	CENTRE,"Diese Konfiguration bietet",NEWLINE
		dc.b	CENTRE,"410 K fÅr Extrasoundeffekte.",NEWLINE
		dc.b	CENTRE,"",NEWLINE
		dc.b	ENDPHRASE

.mesg_009	dc.b	CENTRE,"Konzept, Design, Programmierung,",NEWLINE
		dc.b	CENTRE,"Editor, Soundeffekte,",NEWLINE
		dc.b	CENTRE,"Icons, Installation auf Festplatte,",NEWLINE
		dc.b	CENTRE,"Startkode u. Hard Work",NEWLINE
		dc.b	ENDPHRASE

.mesg_010	dc.b	CENTRE,"Grafik"
		dc.b	ENDPHRASE

.mesg_011	dc.b	CENTRE,"Originalmusik"
		dc.b	ENDPHRASE

.mesg_012	dc.b	CENTRE,"Hintergrundmaterial"
		dc.b	ENDPHRASE

.mesg_013	dc.b	CENTRE,"Kartendesign"
		dc.b	ENDPHRASE

.mesg_014	dc.b	CENTRE,"Illustration der Spielfiguren"
		dc.b	ENDPHRASE

.mesg_015	dc.b	CENTRE,"Entwicklungssoftware"
		dc.b	ENDPHRASE

.mesg_016	dc.b	CENTRE,"Graphics Tools"
		dc.b	ENDPHRASE

.mesg_017	dc.b	CENTRE,"MED V3.00 Module Player"
		dc.b	ENDPHRASE

.mesg_018	dc.b	CENTRE,"Disk IO & Datenkompression"
		dc.b	ENDPHRASE

.mesg_019	dc.b	CENTRE,"Tea Boy"
		dc.b	ENDPHRASE

.mesg_020	dc.b	CENTRE,"4-Tasten-Joystick-Lesen",NEWLINE
		dc.b	CENTRE,"entwickelt vom Kode von",NEWLINE
		dc.b	ENDPHRASE

.mesg_021	dc.b	CENTRE,"QualitÑtssicherung"
		dc.b	ENDPHRASE

.mesg_022	dc.b	CENTRE,"(willkÅrliche Reihenfolge)"
		dc.b	ENDPHRASE

.mesg_023	dc.b	CENTRE,"Dieses spiel wurde, einschlie·lich",NEWLINE
		dc.b	CENTRE,"Grafik, sound und dokumentation,",NEWLINE
		dc.b	CENTRE,"vollstÑndig auf Commodore Amiga",NEWLINE
		dc.b	CENTRE,"computern programmiert u. produziert.",NEWLINE
		dc.b	ENDPHRASE

.mesg_024	dc.b	CENTRE,"Software-Raubkopien schÑdigen",NEWLINE
		dc.b	CENTRE,"den zukÅnftigen support fÅr Ihren Amiga.",NEWLINE
		dc.b	CENTRE,"Respektieren sie bitte",NEWLINE
		dc.b	CENTRE,"die harte arbeit anderer.",NEWLINE,NEWLINE
		dc.b	CENTRE,"RAUBKOPIEN SIND DIEBSTAHL!",NEWLINE
		dc.b	ENDPHRASE

.mesg_025	dc.b	CENTRE,".%5%3 30)%,"
		dc.b	ENDPHRASE

.mesg_026	dc.b	CENTRE,"Spielart auswÑhlen..."
		dc.b	ENDPHRASE

.mesg_027	dc.b	"Training"
		dc.b	ENDPHRASE

.mesg_028	dc.b	"VollstÑndige operation"
		dc.b	ENDPHRASE

.mesg_029	dc.b	"Kurz-action-spiel"
		dc.b	ENDPHRASE

.mesg_030	dc.b	CENTRE,"Wieviel mitspieler?"
		dc.b	ENDPHRASE

.mesg_031	dc.b	CENTRE,"Ein spieler"
		dc.b	ENDPHRASE

.mesg_032	dc.b	CENTRE,"Zwei spieler"
		dc.b	ENDPHRASE

.mesg_033	dc.b	CENTRE,"Drei spieler"
		dc.b	ENDPHRASE

.mesg_034	dc.b	CENTRE,"Vier spieler"
		dc.b	ENDPHRASE

.mesg_035	dc.b	CENTRE,"; 30)%,%2 !#4)/."
		dc.b	ENDPHRASE

.mesg_036	dc.b	CENTRE,34,"Tiergehege",34
		dc.b	ENDPHRASE

.mesg_037	dc.b	CENTRE,34,"Reaktor",34
		dc.b	ENDPHRASE

.mesg_038	dc.b	CENTRE,34,"Zuchthaus",34
		dc.b	ENDPHRASE

.mesg_039	dc.b	CENTRE,34,"öberleben",34
		dc.b	ENDPHRASE

.mesg_040	dc.b	CENTRE,"NÑchste liste"
		dc.b	ENDPHRASE

.mesg_041	dc.b	CENTRE,"< 30)%,%2 !#4)/."
		dc.b	ENDPHRASE

.mesg_042	dc.b	CENTRE,34,"Garten von Jarrys",34
		dc.b	ENDPHRASE

.mesg_043	dc.b	CENTRE,34,"Lemming-Kriege Nr. 1",34
		dc.b	ENDPHRASE

.mesg_044	dc.b	CENTRE,34,"Stromgenerator",34
		dc.b	ENDPHRASE

.mesg_045	dc.b	CENTRE,34,"Die Anstalt",34
		dc.b	ENDPHRASE

.mesg_046	dc.b	CENTRE,"= 30)%,%2 !#4)/."
		dc.b	ENDPHRASE

.mesg_047	dc.b	CENTRE,34,"Gro·er KÑse",34
		dc.b	ENDPHRASE

.mesg_048	dc.b	CENTRE,34,"Flucht in den Tod",34
		dc.b	ENDPHRASE

.mesg_049	dc.b	CENTRE,34,"Bat-Mobil",34
		dc.b	ENDPHRASE

.mesg_050	dc.b	CENTRE,34,"Buckminster-Park",34
		dc.b	ENDPHRASE

.mesg_051	dc.b	CENTRE,"> 30)%,%2 !#4)/."
		dc.b	ENDPHRASE

.mesg_052	dc.b	CENTRE,34,"Freizeitzentrum",34
		dc.b	ENDPHRASE

.mesg_053	dc.b	CENTRE,34,"Leichenhalle",34
		dc.b	ENDPHRASE

.mesg_054	dc.b	CENTRE,34,"StÑdtische Siedlung",34
		dc.b	ENDPHRASE

.mesg_055	dc.b	CENTRE,34,"Einkaufspassage",34
		dc.b	ENDPHRASE

.mesg_056	dc.b	CENTRE,34,"Lemming-Kriege Nr. 2",34
		dc.b	ENDPHRASE

.mesg_057	dc.b	CENTRE,"42!).).'"
		dc.b	ENDPHRASE

.mesg_058	dc.b	CENTRE,34,"Erkundung",34
		dc.b	ENDPHRASE

.mesg_059	dc.b	CENTRE,34,"Hindernisse",34
		dc.b	ENDPHRASE

.mesg_060	dc.b	CENTRE,34,"Feuerkampf",34
		dc.b	ENDPHRASE

.mesg_061	dc.b	CENTRE,34,"Wurfreichweite",34
		dc.b	ENDPHRASE

.mesg_062	dc.b	CENTRE,34,"Wachdienst",34
		dc.b	ENDPHRASE

.mesg_063	dc.b	CENTRE,"30)%,%2 %).3"
		dc.b	ENDPHRASE

.mesg_064	dc.b	CENTRE,"30)%,%2 :8%)"
		dc.b	ENDPHRASE

.mesg_065	dc.b	CENTRE,"30)%,%2 $2%)"
		dc.b	ENDPHRASE

.mesg_066	dc.b	CENTRE,"30)%,%2 6)%2"
		dc.b	ENDPHRASE

.mesg_067	dc.b	ALIGN,"Joystick 1"
		dc.b	ENDPHRASE

.mesg_068	dc.b	ALIGN,"Joystick 2"
		dc.b	ENDPHRASE

.mesg_069	dc.b	ALIGN,"(Joystick 3)"
		dc.b	ENDPHRASE

.mesg_070	dc.b	ALIGN,"(Joystick 4)"
		dc.b	ENDPHRASE

.mesg_071	dc.b	ALIGN,"Maus 1"
		dc.b	ENDPHRASE

.mesg_072	dc.b	ALIGN,"Maus 2"
		dc.b	ENDPHRASE

.mesg_073	dc.b	ALIGN,"Joypad 1"
		dc.b	ENDPHRASE

.mesg_074	dc.b	ALIGN,"Joypad 2"
		dc.b	ENDPHRASE

.mesg_075	dc.b	ALIGN,"Tastatur 1"
		dc.b	ENDPHRASE

.mesg_076	dc.b	ALIGN,"Tastatur 2"
		dc.b	ENDPHRASE

.mesg_077	dc.b	ALIGN,"Tastatur 3"
		dc.b	ENDPHRASE

.mesg_078	dc.b	ALIGN,"Tastatur 4"
		dc.b	ENDPHRASE

.mesg_079	dc.b	"Dein Team ist komplett"
		dc.b	ENDPHRASE

.mesg_080	dc.b	";  auswahl beenden"
		dc.b	ENDPHRASE

.mesg_081	dc.b	"{  letzte wahl lîschen"
		dc.b	ENDPHRASE

.mesg_082	dc.b	CENTRE,"*** SYSTEMMELDUNG ***"
		dc.b	ENDPHRASE

.mesg_083	dc.b    CENTRE,"Hier warst du schon, willst du weiter forschen?"
		dc.b	ENDPHRASE

.mesg_084	dc.b	"Ja, die Gegend erforschen."
		dc.b	ENDPHRASE

.mesg_085	dc.b	"Nein, nur hinbewegen."
		dc.b	ENDPHRASE

.mesg_086	dc.b	CENTRE,"*** SYSTEMMELDUNG ***"
		dc.b	ENDPHRASE

.mesg_087	dc.b    CENTRE,"Sprung zum angegebenen ort..."
		dc.b	ENDPHRASE

.mesg_088	dc.b	CENTRE,"*** RAUM KOMPROMITTIERT ***"
		dc.b	ENDPHRASE

.mesg_089	dc.b	CENTRE,"*** RAUM NICHT KOMPROMITTIERT ***"
		dc.b	ENDPHRASE

.mesg_090	dc.b	CENTRE,"KEINE DISKETTE GEFUNDEN "
		dc.b	ENDPHRASE

.mesg_091	dc.b	CENTRE,"Bitte diskette in ein laufwerk einlegen.",NEWLINE
		dc.b	CENTRE,"Wenn bereit, eine taste drÅcken.",NEWLINE
		dc.b	ENDPHRASE

.mesg_092	dc.b	CENTRE,"DISKETTE IST VOLL",NEWLINE,NEWLINE
		dc.b	CENTRE,"Zum fortfahren eine taste drÅcken.",NEWLINE
		dc.b	ENDPHRASE

.mesg_093	dc.b	CENTRE,"DISKETTEN-E/A-FEHLER!",NEWLINE
		dc.b	CENTRE,"Das ist keine AmigaDOS-Diskette.",NEWLINE
		dc.b	CENTRE,"Zum neuversuch eine taste drÅcken.",NEWLINE
		dc.b	ENDPHRASE

.mesg_094	dc.b	CENTRE,"DISKETTEN-E/A-FEHLER!",NEWLINE
		dc.b	CENTRE,"Diskettendaten korrupt.",NEWLINE
		dc.b	CENTRE,"Zum Neuversuch eine taste drÅcken.",NEWLINE
		dc.b	ENDPHRASE

.mesg_095	dc.b	CENTRE,"DISKETTE IST SCHREIBGESCHöTZT",NEWLINE
		dc.b	CENTRE,"Schreibschutz deaktivieren.",NEWLINE
		dc.b	CENTRE,"Zum fortfahren eine taste drÅcken.",NEWLINE
		dc.b	ENDPHRASE

.mesg_096	dc.b	CENTRE,"FEHLER AUF DISKETTE "
		dc.b	ENDPHRASE

.mesg_097	dc.b	CENTRE,"Neuversuch, eine taste drÅcken.",NEWLINE
		dc.b	ENDPHRASE

.mesg_098	dc.b	"     DISKETTE "
		dc.b	ENDPHRASE

.mesg_099	dc.b	"     DATEN WERDEN GELADEN",NEWLINE
		dc.b	"     Bitte warten...",NEWLINE
		dc.b	ENDPHRASE

.mesg_100	dc.b	"DISKETTE "
		dc.b	ENDPHRASE

.mesg_101	dc.b	"     DISKETTE "
		dc.b	ENDPHRASE

.mesg_102	dc.b	"     DATEN WERDEN DEKOMPRIMIERT",NEWLINE
		dc.b	"     Bitte warten...",NEWLINE
		dc.b	ENDPHRASE

.mesg_103	dc.b	CENTRE,"*** PAUSE ***"
		dc.b	ENDPHRASE

.mesg_104	dc.b	CENTRE,"HIRED GUNS VORSCHAU"
		dc.b	ENDPHRASE
.mesg_105	dc.b	CENTRE,"HIRED GUNS DEMONSTRATION "
		dc.b	ENDPHRASE

.mesg_106	dc.b	CENTRE,"EIN DMA-DESIGN-SPIEL VON SCOTT JOHNSTON"
		dc.b	ENDPHRASE
.mesg_107	dc.b	CENTRE,"COPYRIGHT PSYGNOSIS 1993-94"
		dc.b	ENDPHRASE

.mesg_108	dc.b	"Konzept, Design,"
		dc.b	ENDPHRASE
.mesg_109	dc.b	"Programmierung,"
		dc.b	ENDPHRASE
.mesg_110	dc.b	"u. Soundeffekte"
		dc.b	ENDPHRASE

.mesg_111	dc.b	"Grafik"
		dc.b	ENDPHRASE

.mesg_112	dc.b	"Originalmusik"
		dc.b	ENDPHRASE
.mesg_113	dc.b	"Hintergrundmaterial"
		dc.b	ENDPHRASE

.mesg_114	dc.b	"Aktuelles Spiel speichern"
		dc.b	ENDPHRASE
.mesg_115	dc.b	"Gespeichertes Spiel laden"
		dc.b	ENDPHRASE
.mesg_116	dc.b	"Beenden (zu Workbench)"
		dc.b	ENDPHRASE
.mesg_117	dc.b	"Standbild ein/aus"
		dc.b	ENDPHRASE
.mesg_118	dc.b	"Bildschirm ein/aus"
		dc.b	ENDPHRASE

.mesg_119	dc.b	"Beenden (zu Workbench)"
		dc.b	ENDPHRASE
.mesg_120	dc.b	"Workbench nach vorn"
		dc.b	ENDPHRASE

.mesg_121	dc.b	"Bildschirm ein/aus"
		dc.b	ENDPHRASE
.mesg_122	dc.b	"Ebene nochmals versuchen"
		dc.b	ENDPHRASE

.mesg_123	dc.b	"Wechseln (zu weltkarte)"
		dc.b	ENDPHRASE
.mesg_124	dc.b	"Wechseln (zu hauptmenÅ)"
		dc.b	ENDPHRASE

.mesg_125	dc.b	CENTRE,"*** Sicherheitskontrolle ***"
		dc.b	ENDPHRASE

.mesg_126	dc.b	CENTRE,"GemÑss vertrag von 2650 erfordert"
		dc.b	ENDPHRASE
.mesg_127	dc.b	CENTRE,"das interstellare recht sicherheitskontrollen"
		dc.b	ENDPHRASE
.mesg_128	dc.b	CENTRE,"in allen bevîlkerungszentren und"
		dc.b	ENDPHRASE
.mesg_129	dc.b	CENTRE,"militÑrischen einrichtungen."
		dc.b	ENDPHRASE

.mesg_266	dc.b	CENTRE,"STERNENKLASSE EINGEBEN"
		dc.b	ENDPHRASE
.mesg_267	dc.b	"."
		dc.b	ENDPHRASE

.mesg_268	dc.b	CENTRE,"ENTFERNUNG ZUM STERN EINGEBEN"
		dc.b	ENDPHRASE
.mesg_269	dc.b	"."
		dc.b	ENDPHRASE

.mesg_270	dc.b	CENTRE,"ANSTIEG DES STERNS EINGEBEN"
		dc.b	ENDPHRASE
.mesg_271	dc.b	"."
		dc.b	ENDPHRASE

.mesg_272	dc.b	CENTRE,"DEKLINATION DES STERNS EINGEBEN"
		dc.b	ENDPHRASE
.mesg_273	dc.b	"."
		dc.b	ENDPHRASE

.mesg_130	dc.b	CENTRE,"MASSE DES STERNS EINGEBEN"
		dc.b	ENDPHRASE
.mesg_131	dc.b	"."
		dc.b	ENDPHRASE

.mesg_132	dc.b	CENTRE,"ANZAHL DER PLANETEN UM DEN STERN EINGEBEN"
		dc.b	ENDPHRASE
.mesg_133	dc.b	"."
		dc.b	ENDPHRASE

.mesg_134	dc.b	"ANTWORT"
		dc.b	ENDPHRASE

.mesg_135	dc.b	CENTRE,"Falsch - neuer versuch"
		dc.b	ENDPHRASE

.mesg_136	dc.b	CENTRE,"*** MELDUNG VON DEN TESSERACT BATTLE SYSTEMS ***"
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

.mesg_144	dc.b	CENTRE,"Missionszeit abgelaufen."
		dc.b	ENDPHRASE
.mesg_145	dc.b	CENTRE,"An alle teilnehmer dieser öbung:"
		dc.b	ENDPHRASE
.mesg_146	dc.b	CENTRE,"Eure zeit in dieser zone ist abgelaufen."
		dc.b	ENDPHRASE
.mesg_147	dc.b	CENTRE,"Die schwache leistung der teilnehmer ergibt"
		dc.b	ENDPHRASE
.mesg_148	dc.b	CENTRE,"die herabstufung der relevanten bÅrgerschaftsdaten."
		dc.b	ENDPHRASE
.mesg_149	dc.b	CENTRE,"T.B.S. nimmt keine antrÑge auf rÅckzahlungen an."
		dc.b	ENDPHRASE
.mesg_150	dc.b	CENTRE,"lebensversicherungen gelten nicht."
		dc.b	ENDPHRASE

.mesg_151	dc.b	CENTRE,"Missionsziel erfÅllt von"
		dc.b	ENDPHRASE
.mesg_152	dc.b	CENTRE,"T.B.S. gratuliert den O. G. und bedauert"
		dc.b	ENDPHRASE
.mesg_153	dc.b	CENTRE,"die weniger erfolgreichen ..."
		dc.b	ENDPHRASE

.mesg_154	dc.b	"BELIEBIGE ANDERE TASTE"
		dc.b	ENDPHRASE
.mesg_155	dc.b	"FORTFAHREN"
		dc.b	ENDPHRASE

.mesg_156	dc.b	CENTRE,"*** SPIEL SPEICHERN ***"
		dc.b	ENDPHRASE
.mesg_157	dc.b	CENTRE,"Wo soll das Spiel"
		dc.b	ENDPHRASE
.mesg_158	dc.b	CENTRE,"gespeichert werden?"
		dc.b	ENDPHRASE
.mesg_159	dc.b	"RAM-DISK"
		dc.b	ENDPHRASE
.mesg_160	dc.b	"Internes diskettenlaufwerk"
		dc.b	ENDPHRASE
.mesg_161	dc.b	"Speichervorgang abbrechen"
		dc.b	ENDPHRASE

.mesg_162	dc.b	"Festplatte"
		dc.b	ENDPHRASE

.mesg_163	dc.b	CENTRE,"*** SPIEL LADEN ***"
		dc.b	ENDPHRASE
.mesg_164	dc.b	CENTRE,"Von wo soll das Spiel"
		dc.b	ENDPHRASE
.mesg_165	dc.b	CENTRE,"geladen werden?"
		dc.b	ENDPHRASE
.mesg_166	dc.b	"Ladevorgang abbrechen"
		dc.b	ENDPHRASE

.mesg_167	dc.b	CENTRE,"Leerdiskette mit entferntem schreibschutz"
		dc.b	ENDPHRASE
.mesg_168	dc.b	CENTRE,"oder HIRED-GUNS-Spielspeicherdiskette"
		dc.b	ENDPHRASE
.mesg_169	dc.b	CENTRE,"in internes laufwerk einlegen."
		dc.b	ENDPHRASE
.mesg_170	dc.b	CENTRE,"(Bei anderen disketten werden alle daten gelîscht!)"
		dc.b	ENDPHRASE
.mesg_171	dc.b	"BELIEBIGE ANDERE TASTE"
		dc.b	ENDPHRASE
.mesg_172	dc.b	"FORTFAHREN"
		dc.b	ENDPHRASE

.mesg_173	dc.b	CENTRE,"HIRED-GUNS-Spielspeicherdiskette"
		dc.b	ENDPHRASE
.mesg_174	dc.b	CENTRE,"in internes laufwerk einlegen."
		dc.b	ENDPHRASE

.mesg_175	dc.b	CENTRE,"*** SPIEL SPEICHERN/LADEN ***"
		dc.b	ENDPHRASE
.mesg_176	dc.b	CENTRE,"Es wurde keine HIRED-GUNS-Spielspeicherdiskette eingelegt."
		dc.b	ENDPHRASE
.mesg_177	dc.b	CENTRE,"Soll diese diskette wirklich formatiert werden?"
		dc.b	ENDPHRASE
.mesg_178	dc.b	CENTRE,"PrÅfen sie nochmals, dass sich keine wichtigen daten auf"
		dc.b	ENDPHRASE
.mesg_179	dc.b	CENTRE,"der diskette befinden, da diese ansonsten verlorengehen."
		dc.b	ENDPHRASE
.mesg_180	dc.b	"FORMATIEREN ABBRECHEN"
		dc.b	ENDPHRASE

.mesg_181	dc.b	CENTRE,"Ein spiel kann in 5 Positionen gespeichert werden."
		dc.b	ENDPHRASE
.mesg_182	dc.b	CENTRE,"DrÅcken sie F1-F5 zur wahl einer position. Sie kînnen eine"
		dc.b	ENDPHRASE
.mesg_183	dc.b	CENTRE,"kurzbeschreibung fÅr jedes gespeicherte spiel eingeben."
		dc.b	ENDPHRASE
.mesg_184	dc.b	CENTRE,"(Durch wÑhlen einer verwendeten position wird"
		dc.b	ENDPHRASE
.mesg_185	dc.b	CENTRE,"das vorher dort gespeicherte Åberschrieben.)"
		dc.b	ENDPHRASE

.mesg_186	dc.b	"Speichervorgang abbrechen"
		dc.b	ENDPHRASE

.mesg_187	dc.b	"POSITION"
		dc.b	ENDPHRASE

.mesg_188	dc.b	"LEER"
		dc.b	ENDPHRASE

.mesg_189	dc.b	CENTRE,"Ein spiel kann von 5 Positionen geladen werden."
		dc.b	ENDPHRASE
.mesg_190	dc.b	CENTRE,"DrÅcken sie F1-F5 zur auswahl einer position."
		dc.b	ENDPHRASE

.mesg_191	dc.b	CENTRE,"Ihr spiel wird gespeichert..."
		dc.b	ENDPHRASE

.mesg_192	dc.b	CENTRE,"Ihr gespeichertes spiel wird geladen..."
		dc.b	ENDPHRASE

.mesg_193	dc.b	CENTRE,"Die grafik wird geladen..."
		dc.b	ENDPHRASE

.mesg_194	dc.b	CENTRE,"Die spieldaten werden geladen..."
		dc.b	ENDPHRASE

.mesg_195	dc.b	CENTRE,"Die soundeffekte werden geladen..."
		dc.b	ENDPHRASE

.mesg_196	dc.b	CENTRE,"Die spielfiguren werden geladen..."
		dc.b	ENDPHRASE

.mesg_197	dc.b	CENTRE,"*** ACHTUNG ***"
		dc.b	ENDPHRASE
.mesg_198	dc.b	CENTRE,"DISKETTENFEHLER"
		dc.b	ENDPHRASE
.mesg_199	dc.b	CENTRE,"Problem mit der diskette im internen laufwerk."
		dc.b	ENDPHRASE
.mesg_200	dc.b	"BITTE NOCHMALS VERSUCHEN"
		dc.b	ENDPHRASE

.mesg_201	dc.b	"BELIEBIGE TASTE"
		dc.b	ENDPHRASE

.mesg_202	dc.b	CENTRE,"Bitte nochmals versuchen."
		dc.b	ENDPHRASE

.mesg_203	dc.b	CENTRE,"DISKETTE WIRD FORMATIERT"
		dc.b	ENDPHRASE
.mesg_204	dc.b	CENTRE,"Es wurde keine HIRED-GUNS-spielspeicherdiskette eingelegt."
		dc.b	ENDPHRASE
.mesg_205	dc.b	CENTRE,"Bitte formatierung der diskette abwarten. Es dauert"
		dc.b	ENDPHRASE
.mesg_206	dc.b	CENTRE,"nicht lange und muss nur einmal erfolgen..."
		dc.b	ENDPHRASE

.mesg_207	dc.b	"Diskette formatieren"
		dc.b	ENDPHRASE

.mesg_208	dc.b	CENTRE,"Problem mit der RAM-DISK."
		dc.b	ENDPHRASE

.mesg_209	dc.b	CENTRE,"Allgemeiner lese-/schreib-fehler."
		dc.b	ENDPHRASE

.mesg_210	dc.b	CENTRE,"Schreibschutz der diskette muss deaktiviert werden!!!!"
		dc.b	ENDPHRASE

.mesg_211	dc.b	CENTRE,"Leerdiskette mit entferntem schreibschutz oder HIRED-GUNS-"
		dc.b	ENDPHRASE
.mesg_212	dc.b	CENTRE,"spielspeicherdiskette in internes laufwerk einlegen."
		dc.b	ENDPHRASE

.mesg_213	dc.b	CENTRE,"Falsche prÅfsumme. Daten sind korrupt"
		dc.b	ENDPHRASE
.mesg_214	dc.b	CENTRE,"oder beschÑdigt."
		dc.b	ENDPHRASE

.mesg_215	dc.b	"BELIEBIGE ANDERE TASTE"
		dc.b	ENDPHRASE
.mesg_216	dc.b	"NEUER VERSUCH"
		dc.b	ENDPHRASE

.mesg_217	dc.b	"GESP. SPIELE LîSCHEN"
		dc.b	ENDPHRASE

.mesg_218	dc.b	CENTRE,"Speichern OK. Keine fehler."
		dc.b	ENDPHRASE

.mesg_219	dc.b	CENTRE,"Laden OK. Keine fehler."
		dc.b	ENDPHRASE

.mesg_220	dc.b	CENTRE,"BITTE DISKETTE "
		dc.b	ENDPHRASE
.mesg_221	dc.b	"IN EIN LAUFWERK EINLEGEN."
		dc.b	ENDPHRASE

.mesg_222	dc.b	CENTRE,"DISKETTE "
		dc.b	ENDPHRASE

.mesg_240	dc.b	" WIRD GESUCHT"
		dc.b	ENDPHRASE

.mesg_223	dc.b	CENTRE,"Ein korrekt gespeichertes spiel muss geladen werden."
		dc.b	ENDPHRASE

.mesg_224	dc.b	CENTRE,"Nicht genÅgend freie SpeicherkapazitÑt fÅr RAM-DISK."
		dc.b	ENDPHRASE

.mesg_225	dc.b	CENTRE,"RAM-DISK ist leer."
		dc.b	ENDPHRASE

.mesg_226	dc.b	CENTRE,"*** MISSION GESCHEITERT ***"
		dc.b	ENDPHRASE
.mesg_227	dc.b	CENTRE,"Die missionsparameter erfordern leider"
		dc.b	ENDPHRASE
.mesg_228	dc.b	CENTRE,"das öberleben aller teammitglieder."
		dc.b	ENDPHRASE
.mesg_229	dc.b	CENTRE,"Passen sie das nÑchste mal da draussen mehr auf!"
		dc.b	ENDPHRASE

.mesg_230	dc.b	"Diese stufe nochmals versuchen"
		dc.b	ENDPHRASE

.mesg_231	dc.b	"HIRED GUNS BEENDEN"
		dc.b	ENDPHRASE

.mesg_232	dc.b	"Zu hauptmenÅ wechseln (Åber todesszene)"
		dc.b	ENDPHRASE

.mesg_233	dc.b	CENTRE,"*** TOD ***"
		dc.b	ENDPHRASE
.mesg_234	dc.b	CENTRE,"Ihr gesamtes team ist umgekommen."
		dc.b	ENDPHRASE
.mesg_235	dc.b	CENTRE,"Ist das ein zeichen schwacher fÅhrung"
		dc.b	ENDPHRASE
.mesg_236	dc.b	CENTRE,"Oder einfach vîllige inkompetenz?"
		dc.b	ENDPHRASE
.mesg_237	dc.b	CENTRE,"Ganz gleich weshalb, sie erhalten"
		dc.b	ENDPHRASE
.mesg_238	dc.b	CENTRE,"noch eine weitere chance..."
		dc.b	ENDPHRASE

.mesg_239	dc.b	"Abbrechen"
		dc.b	ENDPHRASE

.mesg_241	dc.b	"Mensch"
		dc.b	ENDPHRASE

.mesg_242	dc.b	"Mech"
		dc.b	ENDPHRASE

.mesg_243	dc.b	"Golem"
		dc.b	ENDPHRASE

.mesg_244	dc.b	"Humanoid"
		dc.b	ENDPHRASE

.mesg_245	dc.b	"Cyborg"
		dc.b	ENDPHRASE

.mesg_246	dc.b	"MÑnnlich"
		dc.b	ENDPHRASE

.mesg_247	dc.b	"Weiblich"
		dc.b	ENDPHRASE

.mesg_248	dc.b	"N/Z"
		dc.b	ENDPHRASE

.mesg_249	dc.b	"Seemann"
		dc.b	ENDPHRASE

.mesg_250	dc.b	"Killer"
		dc.b	ENDPHRASE

.mesg_251	dc.b	"Kampfdroid"
		dc.b	ENDPHRASE

.mesg_252	dc.b	"FeldÑrztin"
		dc.b	ENDPHRASE

.mesg_253	dc.b	"BÅrger"
		dc.b	ENDPHRASE

.mesg_254	dc.b	"Pilot"
		dc.b	ENDPHRASE

.mesg_255	dc.b	"NDVP-Agent"
		dc.b	ENDPHRASE

.mesg_256	dc.b	"Ingenieur"
		dc.b	ENDPHRASE

.mesg_257	dc.b	"Sklave"
		dc.b	ENDPHRASE

.mesg_258	dc.b	"SchÅtze"
		dc.b	ENDPHRASE

.mesg_259	dc.b	"Infantrist"
		dc.b	ENDPHRASE

.mesg_260	dc.b	"Mehrzweck"
		dc.b	ENDPHRASE

.mesg_261	dc.b	"Pilot"
		dc.b	ENDPHRASE

.mesg_262	dc.b	"Zur RÅckkehr F"
		dc.b	ENDPHRASE
.mesg_263	dc.b	"drÅcken"
		dc.b	ENDPHRASE

.mesg_264	dc.b	CENTRE,"EXTRA-CHIP-RAM VERFÅGBAR",NEWLINE
		dc.b	CENTRE,"Erweiterte Soundeffekte werden geladen.",NEWLINE
		dc.b	CENTRE,"Bitte warten...",NEWLINE
		dc.b	ENDPHRASE

.mesg_265	dc.b	CENTRE,"DEKOMPRESSIONSFEHLER!",NEWLINE
		dc.b	CENTRE,"Software-, speicher- oder diskfehler.",NEWLINE
		dc.b	CENTRE,"Fataler Fehler, bitte neustarten.",NEWLINE
		dc.b	ENDPHRASE

.mesg_274	dc.b	"HauptmenÅ"
		dc.b	ENDPHRASE
