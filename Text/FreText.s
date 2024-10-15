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
**************************** � Scott Johnston 1990-93 **************************
********************************************************************************

		output	FreText
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

.mesg_002	dc.b	" Commencer un nouveau jeu"
		dc.b	ENDPHRASE

.mesg_003	dc.b	"Continuer un jeu enregistr�"
		dc.b	ENDPHRASE

.mesg_004	dc.b	"Quitter vers Workbench"
		dc.b	ENDPHRASE

.mesg_005	dc.b	CENTRE,"(Appuyez sur CTRL-Q pour revenir ici)"
		dc.b	ENDPHRASE

.mesg_006	dc.b	CENTRE,"()2%$ '5.3"
		dc.b	ENDPHRASE

.mesg_007	dc.b	CENTRE,"Un jeu DMA Design",NEWLINE
		dc.b	CENTRE,"de Scott Johnston",NEWLINE,NEWLINE
		dc.b	CENTRE,"Copyright % Psygnosis 1993-94",NEWLINE
		dc.b	CENTRE,"Tous droits r�serv�s",NEWLINE
		dc.b	ENDPHRASE

.mesg_008	dc.b	CENTRE,"Ce jeu a �t� con�u pour donner",NEWLINE
		dc.b	CENTRE,"les meilleurs r�sultats sur",NEWLINE
		dc.b	CENTRE,"machines avec 2 Mo de m�moire",NEWLINE
		dc.b	CENTRE,"graphique. Cette configuration",NEWLINE
		dc.b	CENTRE,"b�n�ficie de 410 Ko d'effets",NEWLINE
		dc.b	CENTRE," sonores suppl�mentaires.",NEWLINE
		dc.b	ENDPHRASE

.mesg_009	dc.b	CENTRE,"Conception, cr�ation,",NEWLINE
		dc.b	CENTRE,"programmation, effets sonores,",NEWLINE
		dc.b	CENTRE,"installation sur disque dur, code de",NEWLINE
		dc.b	CENTRE,"d�marrage et essentiel du projet :",NEWLINE
		dc.b	ENDPHRASE

.mesg_010	dc.b	CENTRE,"Graphiques :"
		dc.b	ENDPHRASE

.mesg_011	dc.b	CENTRE,"Musique originale :"
		dc.b	ENDPHRASE

.mesg_012	dc.b	CENTRE,"Documentation :"
		dc.b	ENDPHRASE

.mesg_013	dc.b	CENTRE,"Cr�ation de la carte :"
		dc.b	ENDPHRASE

.mesg_014	dc.b	CENTRE,"Illustration des personnages :"
		dc.b	ENDPHRASE

.mesg_015	dc.b	CENTRE,"Logiciel de conception :"
		dc.b	ENDPHRASE

.mesg_016	dc.b	CENTRE,"Outils graphiques :"
		dc.b	ENDPHRASE

.mesg_017	dc.b	CENTRE,"MED V3.00 Module Player"
		dc.b	ENDPHRASE

.mesg_018	dc.b	CENTRE,"E-S disque et compression des donn�es :"
		dc.b	ENDPHRASE

.mesg_019	dc.b	CENTRE,"Homme � tout faire :"
		dc.b	ENDPHRASE

.mesg_020	dc.b	CENTRE,"Lecture joystick 4 boutons",NEWLINE
		dc.b	CENTRE,"mise au point � partir du code de :",NEWLINE
		dc.b	ENDPHRASE

.mesg_021	dc.b	CENTRE,"Assurance qualit� :"
		dc.b	ENDPHRASE

.mesg_022	dc.b	CENTRE,"(dans le d�sordre)"
		dc.b	ENDPHRASE

.mesg_023	dc.b	CENTRE,"Ce jeu, ses graphiques, ses effets",NEWLINE
		dc.b	CENTRE,"sonores et sa documentation ont",NEWLINE
		dc.b	CENTRE,"�t� enti�rement programm�s et produits",NEWLINE
		dc.b	CENTRE,"sur ordinateurs Commodore Amiga.",NEWLINE
		dc.b	ENDPHRASE

.mesg_024	dc.b	CENTRE,"Le piratage de jeu compromet",NEWLINE
		dc.b	CENTRE,"gravement l'avenir de la cr�ation",NEWLINE
		dc.b	CENTRE,"d'Amiga. Il est de votre responsabilit�",NEWLINE
		dc.b	CENTRE,"de respecter le travail d'autrui.",NEWLINE,NEWLINE
		dc.b	CENTRE,"LE PIRATAGE EST UN DELIT !",NEWLINE
		dc.b	ENDPHRASE

.mesg_025	dc.b	CENTRE,"./56%!5 *%5"
		dc.b	ENDPHRASE

.mesg_026	dc.b	CENTRE,"S�lectionner type de jeu...."
		dc.b	ENDPHRASE

.mesg_027	dc.b	"Entra�nement"
		dc.b	ENDPHRASE

.mesg_028	dc.b	"Campagne enti�re"
		dc.b	ENDPHRASE

.mesg_029	dc.b	"Action br�ve"
		dc.b	ENDPHRASE

.mesg_030	dc.b	CENTRE,"Combien de joueurs humains ?"
		dc.b	ENDPHRASE

.mesg_031	dc.b	CENTRE,"1 joueur"
		dc.b	ENDPHRASE

.mesg_032	dc.b	CENTRE,"2 joueurs"
		dc.b	ENDPHRASE

.mesg_033	dc.b	CENTRE,"3 joueurs"
		dc.b	ENDPHRASE

.mesg_034	dc.b	CENTRE,"4 joueurs"
		dc.b	ENDPHRASE

.mesg_035	dc.b	CENTRE,"!#4)/. ! 5."
		dc.b	ENDPHRASE

.mesg_036	dc.b	CENTRE,34,"R�serve animale",34
		dc.b	ENDPHRASE

.mesg_037	dc.b	CENTRE,34,"R�acteur",34
		dc.b	ENDPHRASE

.mesg_038	dc.b	CENTRE,34,"P�nitencier",34
		dc.b	ENDPHRASE

.mesg_039	dc.b	CENTRE,34,"Survivre",34
		dc.b	ENDPHRASE

.mesg_040	dc.b	CENTRE,"Liste suivante"
		dc.b	ENDPHRASE

.mesg_041	dc.b	CENTRE,"!#4)/. ! $%58"
		dc.b	ENDPHRASE

.mesg_042	dc.b	CENTRE,34,"Jardin de Jarrys",34
		dc.b	ENDPHRASE

.mesg_043	dc.b	CENTRE,34,"Guerres des Lemmings 1",34
		dc.b	ENDPHRASE

.mesg_044	dc.b	CENTRE,34,"G�n�rateur",34
		dc.b	ENDPHRASE

.mesg_045	dc.b	CENTRE,34,"Asile",34
		dc.b	ENDPHRASE

.mesg_046	dc.b	CENTRE,"!#4)/. ! 42/)3"
		dc.b	ENDPHRASE

.mesg_047	dc.b	CENTRE,ALIGN,34,"Gruy�re",34
		dc.b	ENDPHRASE

.mesg_048	dc.b	CENTRE,34,"Fuite vers la mort",34
		dc.b	ENDPHRASE

.mesg_049	dc.b	CENTRE,34,"Bat Mobile",34
		dc.b	ENDPHRASE

.mesg_050	dc.b	CENTRE,34,"Buckminster Park",34
		dc.b	ENDPHRASE

.mesg_051	dc.b	CENTRE,"!#4)/. ! 15!42%"
		dc.b	ENDPHRASE

.mesg_052	dc.b	CENTRE,34,"Centre de loisirs",34
		dc.b	ENDPHRASE

.mesg_053	dc.b	CENTRE,34,"Salle des squelettes",34
		dc.b	ENDPHRASE

.mesg_054	dc.b	CENTRE,34,"Urbanisation",34
		dc.b	ENDPHRASE

.mesg_055	dc.b	CENTRE,34,"Galerie commerciale",34
		dc.b	ENDPHRASE

.mesg_056	dc.b	CENTRE,34,"Guerres des Lemmings 2",34
		dc.b	ENDPHRASE

.mesg_057	dc.b	CENTRE,"%.42!).%-%.4"
		dc.b	ENDPHRASE

.mesg_058	dc.b	CENTRE,34,"Exploration",34
		dc.b	ENDPHRASE

.mesg_059	dc.b	CENTRE,34,"Obstacles",34
		dc.b	ENDPHRASE

.mesg_060	dc.b	CENTRE,34,"Combat du feu",34
		dc.b	ENDPHRASE

.mesg_061	dc.b	CENTRE,34,"Lancement de grenades",34
		dc.b	ENDPHRASE

.mesg_062	dc.b	CENTRE,34,"En faction",34
		dc.b	ENDPHRASE

.mesg_063	dc.b	CENTRE,"*/5%52 ;"
		dc.b	ENDPHRASE

.mesg_064	dc.b	CENTRE,"*/5%52 <"
		dc.b	ENDPHRASE

.mesg_065	dc.b	CENTRE,"*/5%52 ="
		dc.b	ENDPHRASE

.mesg_066	dc.b	CENTRE,"*/5%52 >"
		dc.b	ENDPHRASE

.mesg_067	dc.b	ALIGN,"Joystick 1"
		dc.b	ENDPHRASE

.mesg_068	dc.b	ALIGN,"Joystick 2"
		dc.b	ENDPHRASE

.mesg_069	dc.b	ALIGN,"(Joystick 3)"
		dc.b	ENDPHRASE

.mesg_070	dc.b	ALIGN,"(Joystick 4)"
		dc.b	ENDPHRASE

.mesg_071	dc.b	" ",ALIGN,"Souris 1"
		dc.b	ENDPHRASE

.mesg_072	dc.b	" ",ALIGN,"Souris 2"
		dc.b	ENDPHRASE

.mesg_073	dc.b	" ",ALIGN,"Pav�-D 1"
		dc.b	ENDPHRASE

.mesg_074	dc.b	" ",ALIGN,"Pav�-D 2"
		dc.b	ENDPHRASE

.mesg_075	dc.b	" ",ALIGN,"Clavier 1"
		dc.b	ENDPHRASE

.mesg_076	dc.b	" ",ALIGN,"Clavier 2"
		dc.b	ENDPHRASE

.mesg_077	dc.b	" ",ALIGN,"Clavier 3"
		dc.b	ENDPHRASE

.mesg_078	dc.b	" ",ALIGN,"Clavier 4"
		dc.b	ENDPHRASE

.mesg_079	dc.b	"Votre �quipe est au complet"
		dc.b	ENDPHRASE

.mesg_080	dc.b	";  fin de la s�lection"
		dc.b	ENDPHRASE

.mesg_081	dc.b	"{  effacez le dernier choix"
		dc.b	ENDPHRASE

.mesg_082	dc.b	CENTRE,"*** MESSAGE DU SYSTEME ***"
		dc.b	ENDPHRASE

.mesg_083	dc.b    CENTRE,"Vous avez d�j� explor� cet endroit. Voulez-vous recommencer ?"
		dc.b	ENDPHRASE

.mesg_084	dc.b	"Oui, explorer cet endroit."
		dc.b	ENDPHRASE

.mesg_085	dc.b	"Non, juste traverser."
		dc.b	ENDPHRASE

.mesg_086	dc.b	CENTRE,"*** MESSAGE DU SYSTEME ***"
		dc.b	ENDPHRASE

.mesg_087	dc.b    CENTRE,"Vers l'endroit indiqu�..."
		dc.b	ENDPHRASE

.mesg_088	dc.b	CENTRE,"*** R�GION COMPROMISE ***"
		dc.b	ENDPHRASE

.mesg_089	dc.b	CENTRE,"*** R�GION NON COMPROMISE ***"
		dc.b	ENDPHRASE

.mesg_090	dc.b	CENTRE,"DISQUETTE INTROUVABLE #"
		dc.b	ENDPHRASE

.mesg_091	dc.b	CENTRE,"Ins�rez la disquette dans l'un des lecteurs.",NEWLINE
		dc.b	CENTRE,"Ensuite, appuyez sur une touche.",NEWLINE
		dc.b	ENDPHRASE

.mesg_092	dc.b	CENTRE,"DISQUETTE PLEINE",NEWLINE,NEWLINE
		dc.b	CENTRE,"Appuyez sur une touche pour continuer.",NEWLINE
		dc.b	ENDPHRASE

.mesg_093	dc.b	CENTRE,"ERREUR E/S DE DISQUETTE !",NEWLINE
		dc.b	CENTRE,"Ce n'est pas une disquette AmigaDOS.",NEWLINE
		dc.b	CENTRE,"Appuyez sur une touche pour essayer de nouveau.",NEWLINE
		dc.b	ENDPHRASE

.mesg_094	dc.b	CENTRE,"ERREUR E/S DE DISQUETTE !",NEWLINE
		dc.b	CENTRE,"Donn�es de disque erron�es.",NEWLINE
		dc.b	CENTRE,"Appuyez sur une touche pour essayer de nouveau.",NEWLINE
		dc.b	ENDPHRASE

.mesg_095	dc.b	CENTRE,"DISQUETTE PROT�G�E EN �CRITURE",NEWLINE
		dc.b	CENTRE,"Corrigez l'erreur",NEWLINE
		dc.b	CENTRE,"Appuyez sur une touche pour continuer.",NEWLINE
		dc.b	ENDPHRASE

.mesg_096	dc.b	CENTRE,"ERREUR DE DISQUETTE #"
		dc.b	ENDPHRASE

.mesg_097	dc.b	CENTRE,"Appuyez sur une touche pour essayer de nouveau.",NEWLINE
		dc.b	ENDPHRASE

.mesg_098	dc.b	"     DISQUETTE #"
		dc.b	ENDPHRASE

.mesg_099	dc.b	"     CHARGEMENT DES DONN�ES EN COURS",NEWLINE
		dc.b	"     Veuillez patienter....",NEWLINE
		dc.b	ENDPHRASE

.mesg_100	dc.b	"RECHERCHE DE LA DISQUETTE #"
		dc.b	ENDPHRASE

.mesg_101	dc.b	"     DISQUETTE #"
		dc.b	ENDPHRASE

.mesg_102	dc.b	"     DECOMPRESSION DES DONN�ES",NEWLINE
		dc.b	"     Veuillez patienter.......",NEWLINE
		dc.b	ENDPHRASE

.mesg_103	dc.b	CENTRE,"*** PAUSE ***"
		dc.b	ENDPHRASE

.mesg_104	dc.b	CENTRE,"APERCU HIRED GUNS"
		dc.b	ENDPHRASE
.mesg_105	dc.b	CENTRE,"DEMONSTRATION HIRED GUNS"
		dc.b	ENDPHRASE

.mesg_106	dc.b	CENTRE,"UN JEU DMA DESIGN DE SCOTT JOHNSTON"
		dc.b	ENDPHRASE
.mesg_107	dc.b	CENTRE,"COPYRIGHT PSYGNOSIS 1993-94"
		dc.b	ENDPHRASE

.mesg_108	dc.b	"Conception,"
		dc.b	ENDPHRASE
.mesg_109	dc.b	"programmation,"
		dc.b	ENDPHRASE
.mesg_110	dc.b	"effets sonores"
		dc.b	ENDPHRASE

.mesg_111	dc.b	"Graphiques"
		dc.b	ENDPHRASE

.mesg_112	dc.b	"Musique originale"
		dc.b	ENDPHRASE
.mesg_113	dc.b	"Documentation"
		dc.b	ENDPHRASE

.mesg_114	dc.b	"ENREGISTRER LE JEU EN COURS"
		dc.b	ENDPHRASE
.mesg_115	dc.b	"CHARGER UN JEU ENREGISTR�"
		dc.b	ENDPHRASE
.mesg_116	dc.b	"R�ESSAYER CE NIVEAU"
		dc.b	ENDPHRASE
.mesg_117	dc.b	"ARRET IMAGE ON/OFF"
		dc.b	ENDPHRASE
.mesg_118	dc.b	"CET �CRAN ON/OFF"
		dc.b	ENDPHRASE

.mesg_119	dc.b	"QUITTER (VERS WORKBENCH)"
		dc.b	ENDPHRASE
.mesg_120	dc.b	"WORKBENCH EN AVANT"
		dc.b	ENDPHRASE

.mesg_121	dc.b	"CET �CRAN ON/OFF"
		dc.b	ENDPHRASE
.mesg_122	dc.b	"R�ESSAYER CE NIVEAU"
		dc.b	ENDPHRASE

.mesg_123	dc.b	"ABANDONNER (VERS CARTE SATELLITE)"
		dc.b	ENDPHRASE
.mesg_124	dc.b	"QUITTER (VERS MENU PRINCIPAL)"
		dc.b	ENDPHRASE

.mesg_125	dc.b	CENTRE,"*** CONTROLE DE S�CURIT� ***"
		dc.b	ENDPHRASE

.mesg_126	dc.b	CENTRE,"LA LOI INTERSTELLAIRE IMPOSE DES"
		dc.b	ENDPHRASE
.mesg_127	dc.b	CENTRE,"CONTROL�E DE S�CURIT� DANS TOUS"
		dc.b	ENDPHRASE
.mesg_128	dc.b	CENTRE,"LES CENTRES CIVILS ET LES"
		dc.b	ENDPHRASE
.mesg_129	dc.b	CENTRE,"�TABLISSEMENTS MILITAIRES."
		dc.b	ENDPHRASE

.mesg_266	dc.b	CENTRE,"ENTREZ LE TYPE DE L'ETOILE"
		dc.b	ENDPHRASE
.mesg_267	dc.b    "."
		dc.b	ENDPHRASE

.mesg_268	dc.b	CENTRE,"ENTREZ LA DISTANCE JUSQU'A L'ETOILE"
		dc.b	ENDPHRASE
.mesg_269	dc.b	"."
		dc.b	ENDPHRASE

.mesg_270	dc.b	CENTRE,"ENTREZ LA DECLINAISON DE L'ETOILE"
		dc.b	ENDPHRASE
.mesg_271	dc.b	"."
		dc.b	ENDPHRASE

.mesg_272	dc.b	CENTRE,"ENTREZ L'ASCENSION DE L'ETOILE"
		dc.b	ENDPHRASE
.mesg_273	dc.b	"."
		dc.b	ENDPHRASE

.mesg_130	dc.b	CENTRE,""
		dc.b	ENDPHRASE
.mesg_131	dc.b	"."
		dc.b	ENDPHRASE

.mesg_132	dc.b	CENTRE,"ENTREZ LE NOMBRE DE PLANETES AUTOUR DE L'ETOILE"
		dc.b	ENDPHRASE
.mesg_133	dc.b	"."
		dc.b	ENDPHRASE

.mesg_134	dc.b	"REPONSE"
		dc.b	ENDPHRASE

.mesg_135	dc.b	CENTRE,"INCORRECT - ESSAYEZ DU NOUVEAU"
		dc.b	ENDPHRASE

.mesg_136	dc.b	CENTRE,"*** MESSAGE DE TESSERACT BATTLE SYSTEMS ***"
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

.mesg_144	dc.b	CENTRE,"D�LAI DE LA MISSION EXPIR�."
		dc.b	ENDPHRASE
.mesg_145	dc.b	CENTRE,"QUE TOUS LES PARTICIPANTS DE L'EXERCICE EN COURS"
		dc.b	ENDPHRASE
.mesg_146	dc.b	CENTRE,"SACHENT QUE LE TEMPS IMPARTI DANS CETTE ZONE VIENT"
		dc.b	ENDPHRASE
.mesg_147	dc.b	CENTRE,"D'EXPIRER. LA MAUVAISE PERFORMANCE DES PARTICIPANTS"
		dc.b	ENDPHRASE
.mesg_148	dc.b	CENTRE,"ENTRAINE LE D�CLASSEMENT DES R�SULTATS DE CITOYENNET�"
		dc.b	ENDPHRASE
.mesg_149	dc.b	CENTRE,"CORRESPONDANTS. T.B.S. D�CLINE TOUTE DEMANDE DE"
		dc.b	ENDPHRASE
.mesg_150	dc.b	CENTRE,"REMBOURSEMENT ET TOUT VERSEMENT D'ASSURANCE VIE."
		dc.b	ENDPHRASE

.mesg_151	dc.b	CENTRE,"OBJECTIF DE LA MISSION ATTEINT PAR"
		dc.b	ENDPHRASE
.mesg_152	dc.b	CENTRE,"T.B.S. VOUS F�LICITE ET PR�SENTE SES"
		dc.b	ENDPHRASE
.mesg_153	dc.b	CENTRE,"SINCERES REGRETS AUX AUTRES PARTICIPANTS...."
		dc.b	ENDPHRASE

.mesg_154	dc.b	"UNE AUTRE TOUCHE"
		dc.b	ENDPHRASE
.mesg_155	dc.b	"CONTINUER"
		dc.b	ENDPHRASE

.mesg_156	dc.b	CENTRE,"*** ENREGISTRER JEU ***"
		dc.b	ENDPHRASE
.mesg_157	dc.b	CENTRE,"OU VOULEZ-VOUS"
		dc.b	ENDPHRASE
.mesg_158	dc.b	CENTRE,"ENREGISTRER LE JEU ?"
		dc.b	ENDPHRASE
.mesg_159	dc.b	"RAM"
		dc.b	ENDPHRASE
.mesg_160	dc.b	"DISQUETTE"
		dc.b	ENDPHRASE
.mesg_161	dc.b	"ABANDONNER ENREGISTREMENT"
		dc.b	ENDPHRASE

.mesg_162	dc.b	"DIQUE DUR"
		dc.b	ENDPHRASE

.mesg_163	dc.b	CENTRE,"*** CHARGER JEU ***"
		dc.b	ENDPHRASE
.mesg_164	dc.b	CENTRE,"D'OU VOULEZ-VOUS"
		dc.b	ENDPHRASE
.mesg_165	dc.b	CENTRE,"CHARGER LE JEU ?"
		dc.b	ENDPHRASE
.mesg_166	dc.b	"ABANDONNER CHARGEMENT"
		dc.b	ENDPHRASE

.mesg_167	dc.b	CENTRE,"INS�REZ UNE DISQUETTE NON PROT�G�E EN �CRITURE OU UNE DISQUETTE"
		dc.b	ENDPHRASE
.mesg_168	dc.b	CENTRE,"DE SAUVEGARDE HIRED GUNS EXISTANTE DANS LE LECTEUR. (SI VOUS"
		dc.b	ENDPHRASE
.mesg_169	dc.b	CENTRE,"INS�REZ UNE DISQUETTE AUTRE QU'UNE DISQUETTE DE SAUVEGARDE"
		dc.b	ENDPHRASE
.mesg_170	dc.b	CENTRE,"HIRED GUNS, TOUTES LES DONN�ES QUI S'Y TROUVENT SERONT EFFAC�ES !)"
		dc.b	ENDPHRASE
.mesg_171	dc.b	"UNE AUTRE TOUCHE"
		dc.b	ENDPHRASE
.mesg_172	dc.b	"CONTINUER"
		dc.b	ENDPHRASE

.mesg_173	dc.b	CENTRE,"INS�REZ UNE DISQUETTE DE SAUVEGARDE"
		dc.b	ENDPHRASE
.mesg_174	dc.b	CENTRE,"HIRED GUNS DANS LE LECTEUR."
		dc.b	ENDPHRASE

.mesg_175	dc.b	CENTRE,"*** ENREGISTRER/CHARGER JEU ***"
		dc.b	ENDPHRASE
.mesg_176	dc.b	CENTRE,"LA DISQUETTE INS�R�E N'EST PAS UNE DISQUETTE DE SAUVEGARDE"
		dc.b	ENDPHRASE
.mesg_177	dc.b	CENTRE,"HIRED GUNS. VOULEZ-VOUS FORMATER CETTE DISQUETTE ? ASSUREZ-"
		dc.b	ENDPHRASE
.mesg_178	dc.b	CENTRE,"VOUS QU'ELLE NE CONTIENNE PAS DES INFORMATIONS IMPORTANTES,"
		dc.b	ENDPHRASE
.mesg_179	dc.b	CENTRE,"CAR TOUTES LES DONN�ES QUI S'Y TROUVENT SERONT EFFAC�ES."
		dc.b	ENDPHRASE
.mesg_180	dc.b	"ABANDONNER LE FORMATAGE"
		dc.b	ENDPHRASE

.mesg_181	dc.b	CENTRE,"LE JEU PEUT S'ENREGISTRER EN 5 ENDROITS DIFF�RENTS."
		dc.b	ENDPHRASE
.mesg_182	dc.b	CENTRE,"APPUYEZ SUR F1-F5 POUR EN S�LECTIONNER UN. VOUS POUVEZ"
		dc.b	ENDPHRASE
.mesg_183	dc.b	CENTRE,"ENTRER UNE COURTE DESCRIPTION POUR FACILITER L'IDENTIFICATION"
		dc.b	ENDPHRASE
.mesg_184	dc.b	CENTRE,"DE CHAQUE JEU ENREGISTR�. (SI VOUS S�LECTIONNEZ UN ENDROIT"
		dc.b	ENDPHRASE
.mesg_185	dc.b	CENTRE,"D�JA OCCUP�, CE QUI S'Y TROUVE SERA EFFAC�.)"
		dc.b	ENDPHRASE

.mesg_186	dc.b	"ABANDONNER ENREGISTREMENT"
		dc.b	ENDPHRASE

.mesg_187	dc.b	"POSITION"
		dc.b	ENDPHRASE

.mesg_188	dc.b	"VIDE"
		dc.b	ENDPHRASE

.mesg_189	dc.b	CENTRE,"VOUS POUVEZ CHARGER LE JEU A PARTIR DE 5 POSITIONS."
		dc.b	ENDPHRASE
.mesg_190	dc.b	CENTRE,"APPUYEZ SUR F1-F5 POUR EN S�LECTIONNER UNE."
		dc.b	ENDPHRASE

.mesg_191	dc.b	CENTRE,"ENREGISTREMENT EN COURS...."
		dc.b	ENDPHRASE

.mesg_192	dc.b	CENTRE,"CHARGEMENT EN COURS...."
		dc.b	ENDPHRASE

.mesg_193	dc.b	CENTRE,"CHARGEMENT DES GRAPHIQUES...."
		dc.b	ENDPHRASE

.mesg_194	dc.b	CENTRE,"CHARGEMENT DES DONN�ES DU JEU...."
		dc.b	ENDPHRASE

.mesg_195	dc.b	CENTRE,"CHARGEMENT DES EFFETS SONORES...."
		dc.b	ENDPHRASE

.mesg_196	dc.b	CENTRE,"CHARGEMENT DES PERSONNAGES...."
		dc.b	ENDPHRASE

.mesg_197	dc.b	CENTRE,"*** ATTENTION ***"
		dc.b	ENDPHRASE
.mesg_198	dc.b	CENTRE,"ERREUR DE DISQUETTE"
		dc.b	ENDPHRASE
.mesg_199	dc.b	CENTRE,"PROBLEME DE DISQUETTE DANS LE LECTEUR."
		dc.b	ENDPHRASE
.mesg_200	dc.b	"ESSAYEZ DE NOUVEAU"
		dc.b	ENDPHRASE

.mesg_201	dc.b	"UNE TOUCHE"
		dc.b	ENDPHRASE

.mesg_202	dc.b	CENTRE,"PROBLEME AVEC LE DISQUE DUR."
		dc.b	ENDPHRASE

.mesg_203	dc.b	CENTRE,"FORMATAGE EN COURS"
		dc.b	ENDPHRASE
.mesg_204	dc.b	CENTRE,"CETTE DISQUETTE N'EST PAS UNE DISQUETTE DE SAUVEGARDE"
		dc.b	ENDPHRASE
.mesg_205	dc.b	CENTRE,"HIRED GUNS.ATTENDEZ QU'ELLE SOIT FORMAT�E."
		dc.b	ENDPHRASE
.mesg_206	dc.b	CENTRE,"CE NE SERA PAS LONG ET N'AURA LIEU QU'UNE FOIS...."
		dc.b	ENDPHRASE

.mesg_207	dc.b	"FORMATER LA DISQUETTE"
		dc.b	ENDPHRASE

.mesg_208	dc.b	CENTRE,"PROBLEME DE RAM."
		dc.b	ENDPHRASE

.mesg_209	dc.b	CENTRE,"LECTURE G�N�RALE/ERREUR D'�CRITURE."
		dc.b	ENDPHRASE

.mesg_210	dc.b	CENTRE,"LA DISQUETTE NE DOIT PAS ETRE PROT�G�E EN �CRITURE !!!!"
		dc.b	ENDPHRASE

.mesg_211	dc.b	CENTRE,"VOUS DEVEZ INS�RER UNE DISQUETTE NON PROT�G�E EN �CRITURE"
		dc.b	ENDPHRASE
.mesg_212	dc.b	CENTRE,"OU UNE DISQUETTE DE SAUVEGARDE DU JEU DANS LE LECTEUR."
		dc.b	ENDPHRASE

.mesg_213	dc.b	CENTRE,"CHECKSUM A �CHOU�. LES DONN�ES"
		dc.b	ENDPHRASE
.mesg_214	dc.b	CENTRE,"ONT �T� ALT�R�ES OU TRAFIQU�ES."
		dc.b	ENDPHRASE

.mesg_215	dc.b	"UNE AUTRE TOUCHE"
		dc.b	ENDPHRASE
.mesg_216	dc.b	"ESSAYEZ DE NOUVEAU"
		dc.b	ENDPHRASE

.mesg_217	dc.b	"EFFACER LES JEUX ENREGISTRES"
		dc.b	ENDPHRASE

.mesg_218	dc.b	CENTRE,"ENREGISTREMENT OK. AUCUNE ERREUR."
		dc.b	ENDPHRASE

.mesg_219	dc.b	CENTRE,"CHARGEMENT OK. AUCUNE ERREUR."
		dc.b	ENDPHRASE

.mesg_220	dc.b	CENTRE,"INS�REZ LA DISQUETTE #"
		dc.b	ENDPHRASE
.mesg_221	dc.b	"DANS L'UN DES LECTEURS."
		dc.b	ENDPHRASE

.mesg_222	dc.b	CENTRE,"RECHERCHE DISQUETTE #"
		dc.b	ENDPHRASE

.mesg_240	dc.b	""
		dc.b	ENDPHRASE

.mesg_223	dc.b	CENTRE,"CHARGER UN JEU ENREGISTR� VALIDE."
		dc.b	ENDPHRASE

.mesg_224	dc.b	CENTRE,"M�MOIRE INSUFFISANTE."
		dc.b	ENDPHRASE

.mesg_225	dc.b	CENTRE,"ZONE DISQUE EN M�MOIRE VIDE."
		dc.b	ENDPHRASE

.mesg_226	dc.b	CENTRE,"*** MISSION �CHOU�E ***"
		dc.b	ENDPHRASE
.mesg_227	dc.b	CENTRE,"LES CRITERES DE LA MISSION N�CESSITENT"
		dc.b	ENDPHRASE
.mesg_228	dc.b	CENTRE,"LA SURVIE DE TOUS LES �QUIPIERS."
		dc.b	ENDPHRASE
.mesg_229	dc.b	CENTRE,"SOYEZ PLUS PRUDENT LA PROCHAINE FOIS !"
		dc.b	ENDPHRASE

.mesg_230	dc.b	"RETENTER CE NIVEAU"
		dc.b	ENDPHRASE

.mesg_231	dc.b	"QUITTER HIRED GUNS"
		dc.b	ENDPHRASE

.mesg_232	dc.b	"QUITTER VERS MENU PRINCIPAL"
		dc.b	ENDPHRASE

.mesg_233	dc.b	CENTRE,"*** MORT ***"
		dc.b	ENDPHRASE
.mesg_234	dc.b	CENTRE,"L'�QUIPE ENTIERE EST EXTERMIN�E."
		dc.b	ENDPHRASE
.mesg_235	dc.b	CENTRE,"EST-CE LE SIGNE D'UNE FAIBLESSE DE COMMANDEMENT,"
		dc.b	ENDPHRASE
.mesg_236	dc.b	CENTRE,"OU D'UNE TOTALE INCOMP�TENCE ?"
		dc.b	ENDPHRASE
.mesg_237	dc.b	CENTRE,"QUELLE QU'EN SOIT LA RAISON, VOUS"
		dc.b	ENDPHRASE
.mesg_238	dc.b	CENTRE,"B�N�FICIEZ D'UNE AUTRE CHANCE...."
		dc.b	ENDPHRASE

.mesg_239	dc.b	"ABANDONNER"
		dc.b	ENDPHRASE

.mesg_241	dc.b	"Humain"
		dc.b	ENDPHRASE

.mesg_242	dc.b	"Machine"
		dc.b	ENDPHRASE

.mesg_243	dc.b	"Golem"
		dc.b	ENDPHRASE

.mesg_244	dc.b	"Humano�de"
		dc.b	ENDPHRASE

.mesg_245	dc.b	"Cyborg"
		dc.b	ENDPHRASE

.mesg_246	dc.b	"M�le"
		dc.b	ENDPHRASE

.mesg_247	dc.b	"Femelle"
		dc.b	ENDPHRASE

.mesg_248	dc.b	"Autre"
		dc.b	ENDPHRASE

.mesg_249	dc.b	"Marin"
		dc.b	ENDPHRASE

.mesg_250	dc.b	"Assassin"
		dc.b	ENDPHRASE

.mesg_251	dc.b	"Andro�de"
		dc.b	ENDPHRASE

.mesg_252	dc.b	"M�decin"
		dc.b	ENDPHRASE

.mesg_253	dc.b	"Citoyen"
		dc.b	ENDPHRASE

.mesg_254	dc.b	"Pilote"
		dc.b	ENDPHRASE

.mesg_255	dc.b	"Agent UPBI"
		dc.b	ENDPHRASE

.mesg_256	dc.b	"Ing�nieur"
		dc.b	ENDPHRASE

.mesg_257	dc.b	"Esclave"
		dc.b	ENDPHRASE

.mesg_258	dc.b	"Tireur d'�lite"
		dc.b	ENDPHRASE

.mesg_259	dc.b	"Soldat"
		dc.b	ENDPHRASE

.mesg_260	dc.b	"Polyvalent"
		dc.b	ENDPHRASE

.mesg_261	dc.b	"Pilote"
		dc.b	ENDPHRASE

.mesg_262	dc.b	"APPUYEZ SUR F"
		dc.b	ENDPHRASE
.mesg_263	dc.b	"POUR RETOURNER AU JEU"
		dc.b	ENDPHRASE

.mesg_264	dc.b	CENTRE,"M�MOIRE SUPPL�MENTAIRE DISPONIBLE",NEWLINE
		dc.b	CENTRE,"Chargement d'effets sonores am�lior�s.",NEWLINE
		dc.b	CENTRE,"Veuillez patienter....",NEWLINE
		dc.b	ENDPHRASE

.mesg_265	dc.b	CENTRE,"ERREUR DE D�COMPRESSION !",NEWLINE
		dc.b	CENTRE,"Erreur de logiciel, de m�moire ou de disque.",NEWLINE
		dc.b	CENTRE,"Erreur fatale ! R�initialisez.",NEWLINE
		dc.b	ENDPHRASE

		dc.b	" "

.mesg_274	dc.b	"Menu Principal"
		dc.b	ENDPHRASE
