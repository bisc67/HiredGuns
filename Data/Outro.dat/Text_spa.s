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
		dc.b	ABSPOS,100>>8,100&$ff,90>>8,90&$ff,CENTRE,"CON SU CONOCIMIENTO DEL SISTEMA ESTELAR"
		dc.b	ABSPOS,100>>8,100&$ff,100>>8,100&$ff,CENTRE,"Y DE SUS HABITANTES, SUMADO A SU HABILIDAD"
		dc.b	ABSPOS,100>>8,100&$ff,110>>8,110&$ff,CENTRE," COMO NARRADOR, CLAVIUS DECIDIO COMENZAR A"
		dc.b	ABSPOS,100>>8,100&$ff,120>>8,120&$ff,CENTRE,"ESCRIBIR LA DEFINITIVA HISTORIA DE LUYTEN."
		dc.b	ENDTEXT

cheule		dc.b	SETPEN,2
		dc.b	ABSPOS,100>>8,100&$ff,50>>8,50&$ff,CENTRE,"CHEULE SIEMPRE TUVO SUS OBJETIVOS QUE DIFERIAN"
		dc.b	ABSPOS,100>>8,100&$ff,60>>8,60&$ff,CENTRE,"DE LAS PRIORIDADES DEL EQUIPO. INTENTO ORGANIZAR"
		dc.b	ABSPOS,100>>8,100&$ff,70>>8,70&$ff,CENTRE,"UN VIAJE DE VUELTA A LA TIERRA CON SUS PROPIOS"
		dc.b	ABSPOS,100>>8,100&$ff,80>>8,80&$ff,CENTRE,"MEDIOS: TAREA TREMENDAMENTE DIFICIL. CUALQUIERA"
		dc.b	ABSPOS,100>>8,100&$ff,90>>8,90&$ff,CENTRE,"QUE FUESE SU MISION PERSONAL, PARA ELLA ERA LO"
		dc.b	ABSPOS,100>>8,100&$ff,100>>8,100&$ff,CENTRE,"BASTANTE IMPORTANTE COMO PARA DEDICARLE CUATRO A�OS"
		dc.b	ABSPOS,100>>8,100&$ff,110>>8,110&$ff,CENTRE,"DE VIAJE. LE PREGUNTARON DIRECTAMENTE DE QU�"
		dc.b	ABSPOS,100>>8,100&$ff,120>>8,120&$ff,CENTRE,"SE TRATABA PERO SIGUIO SIN CONTESTAR. LA EXPRESION"
		dc.b	ABSPOS,100>>8,100&$ff,130>>8,130&$ff,CENTRE,"DE SU ROSTRO SUGERIA QUE TODO EL SISTEMA"
		dc.b	ABSPOS,100>>8,100&$ff,140>>8,140&$ff,CENTRE,"ESTELAR LO SABRIA PRONTO."
		dc.b	ENDTEXT

cim		dc.b	SETPEN,2
		dc.b	ABSPOS,100>>8,100&$ff,85>>8,85&$ff,CENTRE,"CIM PERMANECIO CON EL EQUIPO MUCHOS A�OS Y LE"
		dc.b	ABSPOS,100>>8,100&$ff,95>>8,95&$ff,CENTRE,"ASCENDIERON UNA Y OTRA VEZ HASTA EL PUNTO DE QUE LLEGO"
		dc.b	ABSPOS,100>>8,100&$ff,105>>8,105&$ff,CENTRE,"A CONSIDERARSE SUPERIOR A ELLOS. HACIENDO USO DE SU "
		dc.b	ABSPOS,100>>8,100&$ff,115>>8,115&$ff,CENTRE,"NUEVO ESTADO COMO INDIVIDUO DECIDIO ABANDONAR EL"
		dc.b	ABSPOS,100>>8,100&$ff,125>>8,125&$ff,CENTRE,"EQUIPO DEFINITIVAMENTE. POCO DESPU�S SE LE PERDIO LA PISTA."
		dc.b	ENDTEXT

desverger	dc.b	SETPEN,2
		dc.b	ABSPOS,100>>8,100&$ff,75>>8,75&$ff,CENTRE,"AUNQUE DESVERGER CONTINUABA YENDO A NUEVAS MISIONES,"
		dc.b	ABSPOS,100>>8,100&$ff,85>>8,85&$ff,CENTRE,"VOLVIO A EJERCER DE MATON."
		dc.b	ABSPOS,100>>8,100&$ff,95>>8,95&$ff,CENTRE,"POCO A POCO SE HIZO MAS Y MAS FAMOSO HASTA QUE"
		dc.b	ABSPOS,100>>8,100&$ff,105>>8,105&$ff,CENTRE,"FUE MAS C�LEBRE INCLUSO QUE RORIAN, PARA SU"
		dc.b	ABSPOS,100>>8,100&$ff,115>>8,115&$ff,CENTRE,"PLENA SATISFACION. CON EL PESO DE TAL INFAMIA"
		dc.b	ABSPOS,100>>8,100&$ff,125>>8,125&$ff,CENTRE,"CONSIDERO QUE SUS OBLIGACIONES"
		dc.b	ABSPOS,100>>8,100&$ff,135>>8,135&$ff,CENTRE,"CON RORIAN DEBIAN TERMINAR."
		dc.b	ENDTEXT

adele		dc.b	SETPEN,2
		dc.b	ABSPOS,100>>8,100&$ff,60>>8,60&$ff,CENTRE,"CON LA AYUDA DE ALGUNOS CONTACTOS, ADELE"
		dc.b	ABSPOS,100>>8,100&$ff,70>>8,70&$ff,CENTRE,"ADOPTO UNA NUEVA IDENTIDAD E INTENTO LLEVAR"
		dc.b	ABSPOS,100>>8,100&$ff,80>>8,80&$ff,CENTRE,"UNA VIDA NORMAL."
		dc.b	ABSPOS,100>>8,100&$ff,90>>8,90&$ff,CENTRE,"LOS SUBSIDIOS MUNICIPALES NO PODIAN COMPETIR"
		dc.b	ABSPOS,100>>8,100&$ff,100>>8,100&$ff,CENTRE,"CON LAS GANANCIAS FRUTO DE ACTIVIDADES ILEGALES."
		dc.b	ABSPOS,100>>8,100&$ff,110>>8,110&$ff,CENTRE,"ADELE COMENZO A OFRECER SU PERICIA EN TEMAS DE"
		dc.b	ABSPOS,100>>8,100&$ff,120>>8,120&$ff,CENTRE,"SISTEMAS DE SEGURIDAD A TODO EL QUE PAGASE SUS SERVICIOS."
		dc.b	ABSPOS,100>>8,100&$ff,130>>8,130&$ff,CENTRE,"INDEPENDIENTEMENTE DE QUE QUISIERAN MEJORAR LOS SISTEMAS"
		dc.b	ABSPOS,100>>8,100&$ff,140>>8,140&$ff,CENTRE,"O BIEN INFILTRARLOS, NO IMPORTABA,"
		dc.b	ABSPOS,100>>8,100&$ff,150>>8,150&$ff,CENTRE,"PAGABAN IGUAL."
		dc.b	ENDTEXT

miyriel		dc.b	SETPEN,2
		dc.b	ABSPOS,100>>8,100&$ff,75>>8,75&$ff,CENTRE,"EL TRABAJO DE MERCENARIO PRONTO"
		dc.b	ABSPOS,100>>8,100&$ff,85>>8,85&$ff,CENTRE,"PERDIO SU ENCANTO PARA MIYRIEL. SE ABURRIO Y"
		dc.b	ABSPOS,100>>8,100&$ff,95>>8,95&$ff,CENTRE,"FUE EN BUSCA DE OTRAS EXPERIENCIAS. SOLIA REPETIR"
		dc.b	ABSPOS,100>>8,100&$ff,105>>8,105&$ff,CENTRE,"QUE LA VIDA NO ERA LO SUFICIENTEMENTE INTERESANTE,"
		dc.b	ABSPOS,100>>8,100&$ff,115>>8,115&$ff,CENTRE,"PERO TODO EL SISTEMA ESTELAR IBA A EXPERIMENTAR UN CAMBIO"
		dc.b	ABSPOS,100>>8,100&$ff,125>>8,125&$ff,CENTRE,"DE TAL CALIBRE A FINALES DE LA D�CADA QUE LA MANTENDRIA"
		dc.b	ABSPOS,100>>8,100&$ff,135>>8,135&$ff,CENTRE,"EN VILO MIENTRAS DURASE PODRIA ESTAR ABURRIDA. AL MENOS MIENTRAS DURASE"
		dc.b	ENDTEXT

rorian		dc.b	SETPEN,2
		dc.b	ABSPOS,100>>8,100&$ff,80>>8,80&$ff,CENTRE,"RORIAN SE MANTUVO AL MARGEN TRAS LA MISION DE"
		dc.b	ABSPOS,100>>8,100&$ff,90>>8,90&$ff,CENTRE,"GRAVEYARD Y PIDIO A LOS DEMAS QUE HICIESEN LO"
		dc.b	ABSPOS,100>>8,100&$ff,100>>8,100&$ff,CENTRE,"MISMO. LE TOMARON LA PALABRA, PERO LO INTERPRETARON"
		dc.b	ABSPOS,100>>8,100&$ff,110>>8,110&$ff,CENTRE,"DE DISTINTAS FORMAS. REGRESO A NUEVA EUROPA IMPULSADO POR"
		dc.b	ABSPOS,100>>8,100&$ff,120>>8,120&$ff,CENTRE,"EL DESEO DE VOLVER A VER SU CIUDAD NATAL. ERA"
		dc.b	ABSPOS,100>>8,100&$ff,130>>8,130&$ff,CENTRE,"COMPLETAMENTE DISTINTA A COMO �L LA RECORDABA."
		dc.b	ENDTEXT

jenillee	dc.b	SETPEN,2
		dc.b	ABSPOS,100>>8,100&$ff,85>>8,85&$ff,CENTRE,"NINGUN CONSULTORIO M�DICO CONTRATARIA A JENILLEE"
		dc.b	ABSPOS,100>>8,100&$ff,95>>8,95&$ff,CENTRE,"DEBIDO A SU RELACION CON EL EQUIPO,"
		dc.b	ABSPOS,100>>8,100&$ff,105>>8,105&$ff,CENTRE,"QUE ELLA ERA INCAPAZ DE OCULTAR. CON CIERTA"
		dc.b	ABSPOS,100>>8,100&$ff,115>>8,115&$ff,CENTRE,"DESGANA TERMINO ACEPTANDO QUE SE QUEDARIA SIEMPRE"
		dc.b	ABSPOS,100>>8,100&$ff,125>>8,125&$ff,CENTRE,"CON ELLOS."
		dc.b	ENDTEXT

kiurcher	dc.b	SETPEN,2
		dc.b	ABSPOS,100>>8,100&$ff,70>>8,70&$ff,CENTRE,"KIURCHER NUNCA ENCONTRO LA FORMA DE VIDA QUE"
		dc.b	ABSPOS,100>>8,100&$ff,80>>8,80&$ff,CENTRE,"TANTO ANHELABA. A�O TRAS A�O SE VOLVIO"
		dc.b	ABSPOS,100>>8,100&$ff,90>>8,90&$ff,CENTRE,"MAS Y MAS SUPERSTICIOSO, HASTA EL PUNTO"
		dc.b	ABSPOS,100>>8,100&$ff,100>>8,100&$ff,CENTRE,"DE DESCUBRIR UNA PROFECIA QUE ANUNCIABA LA HORA Y"
		dc.b	ABSPOS,100>>8,100&$ff,110>>8,110&$ff,CENTRE,"LUGAR EXACTOS DE SU MUERTE. AUNQUE SE"
		dc.b	ABSPOS,100>>8,100&$ff,120>>8,120&$ff,CENTRE,"TRATABA DE UN FALSO PROFETA, SIGUIO CREY�NDOLO"
		dc.b	ABSPOS,100>>8,100&$ff,130>>8,130&$ff,CENTRE,"EN LA TEORIA Y SU COMPORTAMIENTO SE VOLVIO"
		dc.b	ABSPOS,100>>8,100&$ff,140>>8,140&$ff,CENTRE,"AUN MAS ANORMAL."
		dc.b	ENDTEXT

bonden		dc.b	SETPEN,2
		dc.b	ABSPOS,100>>8,100&$ff,50>>8,50&$ff,CENTRE,"BONDEN DECIDIO QUEDARSE EN GRAVEYARD. SOLO"
		dc.b	ABSPOS,100>>8,100&$ff,60>>8,60&$ff,CENTRE,"EXPLORARON UN CONTINENTE DE LOS SIETE QUE CONFIGURAN GRAVEYARD."
		dc.b	ABSPOS,100>>8,100&$ff,70>>8,70&$ff,CENTRE,"CREYO QUE LA INFLUENCIA DEL GOBIERNO NO SE"
		dc.b	ABSPOS,100>>8,100&$ff,80>>8,80&$ff,CENTRE,"EXTENDERIA AL OTRO LADO DEL PLANETA. SE SABIA QUE JARED"
		dc.b	ABSPOS,100>>8,100&$ff,90>>8,90&$ff,CENTRE,"RHINE VIVIA EN LA PARTE MAS ALEJADA"
		dc.b	ABSPOS,100>>8,100&$ff,100>>8,100&$ff,CENTRE,"DE GRAVEYARD, ASI QUE BONDEN LE BUSCO YA QUE"
		dc.b	ABSPOS,100>>8,100&$ff,110>>8,110&$ff,CENTRE,"PROBABLEMENTE ERA LA MAXIMA AUTORIDAD VIVIENTE SOBRE"
		dc.b	ABSPOS,100>>8,100&$ff,120>>8,120&$ff,CENTRE,"LOS APARATOS CONOCIDOS COMO AMP-PSI. JARED DEMOSTRO SER"
		dc.b	ABSPOS,100>>8,100&$ff,130>>8,130&$ff,CENTRE,"DE GRAN AYUDA Y CUANDO MURIO DE ANCIANO EN"
		dc.b	ABSPOS,100>>8,100&$ff,140>>8,140&$ff,CENTRE,"2723, CONTINUO CON SU TRABAJO."
		dc.b	ABSPOS,100>>8,100&$ff,150>>8,150&$ff,CENTRE,"NO OBSTANTE, JAMAS DESCUBRIO EL ORIGEN"
		dc.b	ABSPOS,100>>8,100&$ff,160>>8,160&$ff,CENTRE,"DE ESTOS DISPOSITIVOS."
		dc.b	ENDTEXT

katrina		dc.b	SETPEN,2
		dc.b	ABSPOS,100>>8,100&$ff,75>>8,75&$ff,CENTRE,"KATRINA SE SEPARO DEL EQUIPO DURANTE UN PAR DE A�OS"
		dc.b	ABSPOS,100>>8,100&$ff,85>>8,85&$ff,CENTRE,"PARA PODER ENCONTRAR SU VERDADERA"
		dc.b	ABSPOS,100>>8,100&$ff,95>>8,95&$ff,CENTRE,"IDENTIDAD. DURANTE EL CURSO DE SU"
		dc.b	ABSPOS,100>>8,100&$ff,105>>8,105&$ff,CENTRE,"INVESTIGACION AVERIGUO QUIEN"
		dc.b	ABSPOS,100>>8,100&$ff,115>>8,115&$ff,CENTRE,"ERA ELLA REALMENTE: UNA REPORTERA DE GUERRA LLAMADA ALICIA"
		dc.b	ABSPOS,100>>8,100&$ff,125>>8,125&$ff,CENTRE,"MORREL Y DESCUBRIO ALGO SOBRE SU PASADO"
		dc.b	ABSPOS,100>>8,100&$ff,135>>8,135&$ff,CENTRE,"COMO REPORTERA QUE ERA INCLUSO MAS ASOMBROSO...."
		dc.b	ENDTEXT

cim_lite	dc.b	SETPEN,2
		dc.b	ABSPOS,100>>8,100&$ff,75>>8,75&$ff,CENTRE,"CIM-LITE FUE PASANDO POR DISTINTOS DUE�OS QUE"
		dc.b	ABSPOS,100>>8,100&$ff,85>>8,85&$ff,CENTRE,"LO FUERON MODIFICANDO. CON EL"
		dc.b	ABSPOS,100>>8,100&$ff,95>>8,95&$ff,CENTRE,"PASO DEL TIEMPO, ACABO POR NO PARECERSE AL DISE�O ORIGINAL. FINALMENTE"
		dc.b	ABSPOS,100>>8,100&$ff,105>>8,105&$ff,CENTRE,"FUE DESTRUIDO EN UNA GUERRA FUTURA AUN"
		dc.b	ABSPOS,100>>8,100&$ff,115>>8,115&$ff,CENTRE,"MAS TREMENDA QUE LA DE LUYTEN Y"
		dc.b	ABSPOS,100>>8,100&$ff,125>>8,125&$ff,CENTRE,"LAICALLE."
		dc.b	ABSPOS,100>>8,100&$ff,135>>8,135&$ff,CENTRE,""
		dc.b	ENDTEXT
