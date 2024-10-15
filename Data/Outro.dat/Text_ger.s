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
************************** (C) Scott Johnston 1990/91/92 ***********************
********************************************************************************

		opt 	o+,ow-

		incdir	source:hiredguns/sources
		include	macros.i

start
		dc.l	clavius-start
		dc.l	cheule-start
		dc.l	cim-start
		dc.l	desverger-start
		dc.l	adele-start
		dc.l	miyriel-start
		dc.l	rorian-start
		dc.l	jenillee-start
		dc.l	kiurcher-start
		dc.l	bonden-start
		dc.l	katrina-start
		dc.l	cim_lite-start

;-------------------------------------------------------------------------------

clavius		dc.b	SETPEN,2
		dc.b	ABSPOS,100>>8,100&$ff,90>>8,90&$ff,CENTRE,"Angesichts seiner umfassenden Kenntnisse des"
		dc.b	ABSPOS,100>>8,100&$ff,100>>8,100&$ff,CENTRE,"Sternensystems und Seiner Bewohner kam Clavius"
		dc.b	ABSPOS,100>>8,100&$ff,110>>8,110&$ff,CENTRE,"zu dem Schluss, dass es Zeit war, die end-"
		dc.b	ABSPOS,100>>8,100&$ff,120>>8,120&$ff,CENTRE,"gltige Geschichte des LUYten niederzuschrieben."
		dc.b	ENDTEXT

cheule		dc.b	SETPEN,2
		dc.b	ABSPOS,100>>8,100&$ff,50>>8,50&$ff,CENTRE,"CHEULE hatte immer ihren plan fr sich, und der"
		dc.b	ABSPOS,100>>8,100&$ff,60>>8,60&$ff,CENTRE,"unterschied sich stark von den PRIORIT„ten des Teams."
		dc.b	ABSPOS,100>>8,100&$ff,70>>8,70&$ff,CENTRE,"Sie versuchte mit eigenen Ressourcen eine Rckreise"
		dc.b	ABSPOS,100>>8,100&$ff,80>>8,80&$ff,CENTRE,"zur Erde zu organisieren - eine schwierige Aufgabe."
		dc.b	ABSPOS,100>>8,100&$ff,90>>8,90&$ff,CENTRE,"Was auch ihr PERS”nlicheS ZIEL WAr, ES war IHR"
		dc.b	ABSPOS,100>>8,100&$ff,100>>8,100&$ff,CENTRE,"wichtig genug, um vier JAHRE auf der Reise zu"
		dc.b	ABSPOS,100>>8,100&$ff,110>>8,110&$ff,CENTRE,"verbringen. Als direkt danach gefragt wurde, gab"
		dc.b	ABSPOS,100>>8,100&$ff,120>>8,120&$ff,CENTRE,"sie keine Antwort. Aber aus ihrem Gesichts war"
		dc.b	ABSPOS,100>>8,100&$ff,130>>8,130&$ff,CENTRE,"abzulesen, dass es das ganze Sternensystem"
		dc.b	ABSPOS,100>>8,100&$ff,140>>8,140&$ff,CENTRE,"nur zu bald erfahren wrde."
		dc.b	ENDTEXT

cim		dc.b	SETPEN,2
		dc.b	ABSPOS,100>>8,100&$ff,85>>8,85&$ff,CENTRE,"CIM blieb viele Jahre beim TEAM und entwickelte"
		dc.b	ABSPOS,100>>8,100&$ff,95>>8,95&$ff,CENTRE,"sich best„ndig bis zu dem Punkt weiter, wo er"
		dc.b	ABSPOS,100>>8,100&$ff,105>>8,105&$ff,CENTRE,"sich seiner bewusst wurde. Seinen neuen Status"
		dc.b	ABSPOS,100>>8,100&$ff,115>>8,115&$ff,CENTRE,"als INDIVIDUum nutzend, entschied er sich, das Team"
		dc.b	ABSPOS,100>>8,100&$ff,125>>8,125&$ff,CENTRE,"zu verlassen. Bald darauf verlor man seine Spur."
		dc.b	ENDTEXT

desverger	dc.b	SETPEN,2
		dc.b	ABSPOS,100>>8,100&$ff,75>>8,75&$ff,CENTRE,"Obwohl DESVERGER an neuen MISSIONen teilnahm, ging"
		dc.b	ABSPOS,100>>8,100&$ff,85>>8,85&$ff,CENTRE,"er zwischendurch weiter dem Killergewerbe nach."
		dc.b	ABSPOS,100>>8,100&$ff,95>>8,95&$ff,CENTRE,"Nach und nach wurde er bekannt, bis man ihn selbst"
		dc.b	ABSPOS,100>>8,100&$ff,105>>8,105&$ff,CENTRE,"besser kannte als RORIAN, und das bereitete ihm"
		dc.b	ABSPOS,100>>8,100&$ff,115>>8,115&$ff,CENTRE,"grosses Vergngen. Mit dieser Niedertracht unter"
		dc.b	ABSPOS,100>>8,100&$ff,125>>8,125&$ff,CENTRE,"seinem Grtel betrachtete er seine pflichten"
		dc.b	ABSPOS,100>>8,100&$ff,135>>8,135&$ff,CENTRE,"gegenber RORIAN fr beendet."
		dc.b	ENDTEXT

adele		dc.b	SETPEN,2
		dc.b	ABSPOS,100>>8,100&$ff,60>>8,60&$ff,CENTRE,"Mit Hilfe einiger Kontaktpersonen beschaffte"
		dc.b	ABSPOS,100>>8,100&$ff,70>>8,70&$ff,CENTRE,"sich Adele eine neue IDENTIT„t, um ein normales"
		dc.b	ABSPOS,100>>8,100&$ff,80>>8,80&$ff,CENTRE,"Leben zu fhren. Die Anziehungskraft der Gelder,"
		dc.b	ABSPOS,100>>8,100&$ff,90>>8,90&$ff,CENTRE,"die sie von der Stadt erhielt, verblasste bald"
		dc.b	ABSPOS,100>>8,100&$ff,100>>8,100&$ff,CENTRE,"gegenber den M”glichkeiten illegaler Einknfte."
		dc.b	ABSPOS,100>>8,100&$ff,110>>8,110&$ff,CENTRE,"ADELE verkaufte ihre Fachkenntnis ber"
		dc.b	ABSPOS,100>>8,100&$ff,120>>8,120&$ff,CENTRE,"SicherheitsSYSTEMe an jeden, der zahlen konnte."
		dc.b	ABSPOS,100>>8,100&$ff,130>>8,130&$ff,CENTRE,"Geld blieb Geld, ob es nun fr h”here Sicherheit"
		dc.b	ABSPOS,100>>8,100&$ff,140>>8,140&$ff,CENTRE,"oder das Unwirksammachen von Sicherheitsmassnahmen"
		dc.b	ABSPOS,100>>8,100&$ff,150>>8,150&$ff,CENTRE,"gezahlt wurde."
		dc.b	ENDTEXT

miyriel		dc.b	SETPEN,2
		dc.b	ABSPOS,100>>8,100&$ff,75>>8,75&$ff,CENTRE,"Das S™ldnerdasein verlor bald seine AttraktivitŽt"
		dc.b	ABSPOS,100>>8,100&$ff,85>>8,85&$ff,CENTRE,"fR MIYRIEL. Sie war gelangweilt und suchte nach"
		dc.b	ABSPOS,100>>8,100&$ff,95>>8,95&$ff,CENTRE,"st„rkerern Erfahrungen. OFT sagte sie, das Leben"
		dc.b	ABSPOS,100>>8,100&$ff,105>>8,105&$ff,CENTRE,"sei nicht aufregend genug. Doch sollte bis zum"
		dc.b	ABSPOS,100>>8,100&$ff,115>>8,115&$ff,CENTRE,"Ende des Jahrzehnts das gesamte Sternensystem ein"
		dc.b	ABSPOS,100>>8,100&$ff,125>>8,125&$ff,CENTRE,"Trauma erleben, das selbst MIYRIEL beeindruckte."
		dc.b	ABSPOS,100>>8,100&$ff,135>>8,135&$ff,CENTRE,"Und dieses Trauma ging so schnell nicht zu Ende."
		dc.b	ENDTEXT

rorian		dc.b	SETPEN,2
		dc.b	ABSPOS,100>>8,100&$ff,80>>8,80&$ff,CENTRE,"RORIAN hielt sich nach der Graveyard-mission"
		dc.b	ABSPOS,100>>8,100&$ff,90>>8,90&$ff,CENTRE,"ziemlich zurck. Alle anderen sollten das"
		dc.b	ABSPOS,100>>8,100&$ff,100>>8,100&$ff,CENTRE,"Gleiche tun. Man nahm ihn, in unterschiedlichem"
		dc.b	ABSPOS,100>>8,100&$ff,110>>8,110&$ff,CENTRE,"Mass beim Wort. Er kehrte nach New europe mit dem"
		dc.b	ABSPOS,100>>8,100&$ff,120>>8,120&$ff,CENTRE,"Wunsch zurck, seine Heimatstadt wiederzusehen."
		dc.b	ABSPOS,100>>8,100&$ff,130>>8,130&$ff,CENTRE,"Er hatte sie ganz anders in Erinnerung."
		dc.b	ENDTEXT

jenillee	dc.b	SETPEN,2
		dc.b	ABSPOS,100>>8,100&$ff,85>>8,85&$ff,CENTRE,"Wegen ihrer Verbindungen zum Team, die"
		dc.b	ABSPOS,100>>8,100&$ff,95>>8,95&$ff,CENTRE,"JENILLEE nicht verbergen konnte, wrde sie"
		dc.b	ABSPOS,100>>8,100&$ff,105>>8,105&$ff,CENTRE,"in keiner Praxis einen Job bekommen. Mit einem"
		dc.b	ABSPOS,100>>8,100&$ff,115>>8,115&$ff,CENTRE,"gewissen Unbehagen akzeptierte sie, dass"
		dc.b	ABSPOS,100>>8,100&$ff,125>>8,125&$ff,CENTRE,"sie immer zum Team geh”ren wrde."
		dc.b	ENDTEXT

kiurcher	dc.b	SETPEN,2
		dc.b	ABSPOS,100>>8,100&$ff,70>>8,70&$ff,CENTRE,"KIURCHER konnte nie die Lebenserweiterung finden,"
		dc.b	ABSPOS,100>>8,100&$ff,80>>8,80&$ff,CENTRE,"nach der er so sehr suchte. In den Folgejahren"
		dc.b	ABSPOS,100>>8,100&$ff,90>>8,90&$ff,CENTRE,"wurde er immer abergl„ubischer. Der Gipfel war"
		dc.b	ABSPOS,100>>8,100&$ff,100>>8,100&$ff,CENTRE,"die Vorhersage des genauen Orts und der genauen"
		dc.b	ABSPOS,100>>8,100&$ff,110>>8,110&$ff,CENTRE,"Zeit seines Todes. Obwohl der Prophet nicht echt"
		dc.b	ABSPOS,100>>8,100&$ff,120>>8,120&$ff,CENTRE,"war, glaubt er stillschweigend daran, und sein"
		dc.b	ABSPOS,100>>8,100&$ff,130>>8,130&$ff,CENTRE,"Verhalten wurde immer sonderbarer."
		dc.b	ABSPOS,100>>8,100&$ff,140>>8,140&$ff,CENTRE,""
		dc.b	ENDTEXT

bonden		dc.b	SETPEN,2
		dc.b	ABSPOS,100>>8,100&$ff,50>>8,50&$ff,CENTRE,"BONDEN entschloss sich, auf dem Graveyard zu"
		dc.b	ABSPOS,100>>8,100&$ff,60>>8,60&$ff,CENTRE,"bleiben. Sie erforschten nur einen von sieben"
		dc.b	ABSPOS,100>>8,100&$ff,70>>8,70&$ff,CENTRE,"Kontinenten. Er meinte, die Regierung h„tte"
		dc.b	ABSPOS,100>>8,100&$ff,80>>8,80&$ff,CENTRE,"nur auf dieser Seite des PLANETen Einfluss."
		dc.b	ABSPOS,100>>8,100&$ff,90>>8,90&$ff,CENTRE,"JARED RHINE sollte auf der anderen Seite des"
		dc.b	ABSPOS,100>>8,100&$ff,100>>8,100&$ff,CENTRE,"GRAVEYARD leben, deshalb suchte BONDEN nach ihm,"
		dc.b	ABSPOS,100>>8,100&$ff,110>>8,110&$ff,CENTRE,"denn er war die gr”sste lebende AUTORIT„t auf"
		dc.b	ABSPOS,100>>8,100&$ff,120>>8,120&$ff,CENTRE,"dem Gebiet der PsionenVerst„rker. JARED erwies"
		dc.b	ABSPOS,100>>8,100&$ff,130>>8,130&$ff,CENTRE,"sich als „usserst ntzlich, und als er 2723 in"
		dc.b	ABSPOS,100>>8,100&$ff,140>>8,140&$ff,CENTRE,"hohem Alter starb, konnte BONDEN seine Arbeit"
		dc.b	ABSPOS,100>>8,100&$ff,150>>8,150&$ff,CENTRE,"fortsetzen. Der Ursprung der Verst„rker blieb"
		dc.b	ABSPOS,100>>8,100&$ff,160>>8,160&$ff,CENTRE,"ihm aber fr immer verborgen."
		dc.b	ENDTEXT

katrina		dc.b	SETPEN,2
		dc.b	ABSPOS,100>>8,100&$ff,75>>8,75&$ff,CENTRE,"KATRINA verliess das Team fr ein paar Jahre,"
		dc.b	ABSPOS,100>>8,100&$ff,85>>8,85&$ff,CENTRE,"um ihre wahre Identit„t zu suchen. Bei ihren"
		dc.b	ABSPOS,100>>8,100&$ff,95>>8,95&$ff,CENTRE,"Nachforschungen fand sie wirklich heraus, wer"
		dc.b	ABSPOS,100>>8,100&$ff,105>>8,105&$ff,CENTRE,"sie eigentlich war: eine Feldreporterin namens"
		dc.b	ABSPOS,100>>8,100&$ff,115>>8,115&$ff,CENTRE,"ALICIA Morrel, und dann entdeckte sie etwas ber"
		dc.b	ABSPOS,100>>8,100&$ff,125>>8,125&$ff,CENTRE,"ihre Vergangenheit als Reporterin, was noch"
		dc.b	ABSPOS,100>>8,100&$ff,135>>8,135&$ff,CENTRE,"viel erstaunlicher war ..."
		dc.b	ENDTEXT

cim_lite	dc.b	SETPEN,2
		dc.b	ABSPOS,100>>8,100&$ff,75>>8,75&$ff,CENTRE,"CIM-LITE hatte viele Eigentmer und wurde"
		dc.b	ABSPOS,100>>8,100&$ff,85>>8,85&$ff,CENTRE,"dabei jedesmal ein wenig modifiziert. Mit"
		dc.b	ABSPOS,100>>8,100&$ff,95>>8,95&$ff,CENTRE,"der Zeit hatte er nichts mehr mit seinem"
		dc.b	ABSPOS,100>>8,100&$ff,105>>8,105&$ff,CENTRE,"ORIGINALDESIGN gemeinsam. Schliesslich"
		dc.b	ABSPOS,100>>8,100&$ff,115>>8,115&$ff,CENTRE,"wurde er in einem sp„teren Krieg zerst”rt,"
		dc.b	ABSPOS,100>>8,100&$ff,125>>8,125&$ff,CENTRE,"der noch gr”sser als der zwischen LUYTEN"
		dc.b	ABSPOS,100>>8,100&$ff,135>>8,135&$ff,CENTRE,"und LAICALLE war."
		dc.b	ENDTEXT
