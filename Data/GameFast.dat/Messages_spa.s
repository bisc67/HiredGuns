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

		incdir	3dgame:sources

		include	Hardware.i
		include	Macros.i

********************************************************************************
********************************************************************************
********************************************************************************

START
		dc.w	((bank1-bank0)/2)
		dc.w	bank0-START
		dc.w	((bank2-bank1)/2)
		dc.w	bank1-START
		dc.w	((bank3-bank2)/2)
		dc.w	bank2-START
		dc.w	((bank4-bank3)/2)
		dc.w	bank3-START
		dc.w	((bank5-bank4)/2)
		dc.w	bank4-START
		dc.w	((bank6-bank5)/2)
		dc.w	bank5-START
		dc.w	((bank7-bank6)/2)
		dc.w	bank6-START
		dc.w	((bank8-bank7)/2)
		dc.w	bank7-START
		dc.w	((bank9-bank8)/2)
		dc.w	bank8-START
		dc.w	((bank10-bank9)/2)
		dc.w	bank9-START
		dc.w	((bank11-bank10)/2)
		dc.w	bank10-START
		dc.w	((bank12-bank11)/2)
		dc.w	bank11-START
		dc.w	((bank13-bank12)/2)
		dc.w	bank12-START
		dc.w	((bank14-bank13)/2)
		dc.w	bank13-START
		dc.w	((bank15-bank14)/2)
		dc.w	bank14-START
		dc.w	((bank16-bank15)/2)
		dc.w	bank15-START
		dc.w	((bank17-bank16)/2)
		dc.w	bank16-START
		dc.w	((bank18-bank17)/2)
		dc.w	bank17-START
		dc.w	((bank19-bank18)/2)
		dc.w	bank18-START
		dc.w	((bank20-bank19)/2)
		dc.w	bank19-START
		dc.w	((bank21-bank20)/2)
		dc.w	bank20-START
		dc.w	((bank22-bank21)/2)
		dc.w	bank21-START
		dc.w	((bank23-bank22)/2)
		dc.w	bank22-START
		dc.w	((bank24-bank23)/2)
		dc.w	bank23-START
		dc.w	((bank25-bank24)/2)
		dc.w	bank24-START

		dc.w	mesg1-START
		dc.w	mesg2-START

********************************************************************************

bank0		dc.w	bank0_mesg1-START	;bank 0 : swap player 1
		dc.w	bank0_mesg2-START
		dc.w	bank0_mesg3-START
		dc.w	bank0_mesg4-START
		dc.w	bank0_mesg5-START

bank1		dc.w	bank1_mesg1-START	;bank 1 : swap player 2
		dc.w	bank1_mesg2-START
		dc.w	bank1_mesg3-START
		dc.w	bank1_mesg4-START
		dc.w	bank1_mesg5-START

bank2		dc.w	bank2_mesg1-START	;bank 2 : swap player 3
		dc.w	bank2_mesg2-START
		dc.w	bank2_mesg3-START
		dc.w	bank2_mesg4-START
		dc.w	bank2_mesg5-START

bank3		dc.w	bank3_mesg1-START	;bank 3 : swap player 4
		dc.w	bank3_mesg2-START
		dc.w	bank3_mesg3-START
		dc.w	bank3_mesg4-START
		dc.w	bank3_mesg5-START

bank4		dc.w	bank4_mesg1-START	;bank 4: at random
		dc.w	bank4_mesg2-START
		dc.w	bank4_mesg3-START
		dc.w	bank4_mesg4-START
		dc.w	bank4_mesg5-START
		dc.w	bank4_mesg6-START
		dc.w	bank4_mesg7-START
		dc.w	bank4_mesg8-START
		dc.w	bank4_mesg9-START
		dc.w	bank4_mesg10-START
		dc.w	bank4_mesg11-START
		dc.w	bank4_mesg12-START
		dc.w	bank4_mesg13-START
		dc.w	bank4_mesg14-START
		dc.w	bank4_mesg15-START
		dc.w	bank4_mesg16-START
		dc.w	bank4_mesg17-START
		dc.w	bank4_mesg18-START
		dc.w	bank4_mesg19-START
		dc.w	bank4_mesg20-START
		dc.w	bank4_mesg21-START
		dc.w	bank4_mesg22-START
		dc.w	bank4_mesg23-START
		dc.w	bank4_mesg24-START
		dc.w	bank4_mesg25-START
		dc.w	bank4_mesg26-START
		dc.w	bank4_mesg27-START
		dc.w	bank4_mesg27-START
		dc.w	bank4_mesg28-START
		dc.w	bank4_mesg29-START
		dc.w	bank4_mesg30-START
		dc.w	bank4_mesg31-START
		dc.w	bank4_mesg32-START
		dc.w	bank4_mesg33-START
		dc.w	bank4_mesg34-START

bank5		dc.w	bank5_mesg1-START	;bank 5 : pl1, lightly wounded
		dc.w	bank5_mesg2-START
		dc.w	bank5_mesg3-START

bank6		dc.w	bank6_mesg1-START	;bank 6 : pl1, heavily
		dc.w	bank6_mesg2-START
		dc.w	bank6_mesg3-START

bank7		dc.w	bank7_mesg1-START	;bank 7 : pl1, major wounding
		dc.w	bank7_mesg2-START
		dc.w	bank7_mesg3-START

bank8		dc.w	bank8_mesg1-START	;bank 8 : pl1, dead
		dc.w	bank8_mesg2-START
		dc.w	bank8_mesg3-START

bank9		dc.w	bank9_mesg1-START	;bank 9 : pl2, lightly wounded
		dc.w	bank9_mesg2-START
		dc.w	bank9_mesg3-START

bank10		dc.w	bank10_mesg1-START	;bank 10 : pl2, heavily
		dc.w	bank10_mesg2-START
		dc.w	bank10_mesg3-START

bank11		dc.w	bank11_mesg1-START	;bank 11 : pl2, major wounding
		dc.w	bank11_mesg2-START
		dc.w	bank11_mesg3-START

bank12		dc.w	bank12_mesg1-START	;bank 12 : pl2, dead
		dc.w	bank12_mesg2-START
		dc.w	bank12_mesg3-START

bank13		dc.w	bank13_mesg1-START	;bank 13 : pl3, lightly wounded
		dc.w	bank13_mesg2-START
		dc.w	bank13_mesg3-START

bank14		dc.w	bank14_mesg1-START	;bank 14 : pl3, heavily
		dc.w	bank14_mesg2-START
		dc.w	bank14_mesg3-START

bank15		dc.w	bank15_mesg1-START	;bank 15 : pl3, major wounding
		dc.w	bank15_mesg2-START
		dc.w	bank15_mesg3-START

bank16		dc.w	bank16_mesg1-START	;bank 16 : pl3, dead
		dc.w	bank16_mesg2-START
		dc.w	bank16_mesg3-START

bank17		dc.w	bank17_mesg1-START	;bank 17 : pl4, lightly wounded
		dc.w	bank17_mesg2-START
		dc.w	bank17_mesg3-START

bank18		dc.w	bank18_mesg1-START	;bank 18 : pl4, heavily
		dc.w	bank18_mesg2-START
		dc.w	bank18_mesg3-START

bank19		dc.w	bank19_mesg1-START	;bank 19 : pl4, major wounding
		dc.w	bank19_mesg2-START
		dc.w	bank19_mesg3-START

bank20		dc.w	bank20_mesg1-START	;bank 20 : pl4, dead
		dc.w	bank20_mesg2-START
		dc.w	bank20_mesg3-START

bank21		dc.w	bank21_mesg1-START	;bank 21 : pl1, leader
		dc.w	bank21_mesg2-START
		dc.w	bank21_mesg3-START
		dc.w	bank21_mesg4-START
		dc.w	bank21_mesg5-START

bank22		dc.w	bank22_mesg1-START	;bank 22 : pl2, leader
		dc.w	bank22_mesg2-START
		dc.w	bank22_mesg3-START
		dc.w	bank22_mesg4-START
		dc.w	bank22_mesg5-START

bank23		dc.w	bank23_mesg1-START	;bank 23 : pl3, leader
		dc.w	bank23_mesg2-START
		dc.w	bank23_mesg3-START
		dc.w	bank23_mesg4-START
		dc.w	bank23_mesg5-START

bank24		dc.w	bank24_mesg1-START	;bank 24 : pl4, leader
		dc.w	bank24_mesg2-START
		dc.w	bank24_mesg3-START
		dc.w	bank24_mesg4-START
		dc.w	bank24_mesg5-START
bank25

********************************************************************************

DEFN_MESG	macro
bank\1_mesg\2	dc.l	0
		dc.l	0
		dc.b	\3,0
		even
		endm

		DEFN_MESG 0,1,<"p1 ""¨Me permites?""   ">
		DEFN_MESG 0,2,<"p1 ""Qu¡tate de en medio""   ">
		DEFN_MESG 0,3,<"p1 ""Mu‚vete""   ">
		DEFN_MESG 0,4,<"p1 ""Ap rtate.""   ">
		DEFN_MESG 0,5,<"p1 ""Voy a pasar por en medio.""   ">

		DEFN_MESG 1,1,<"p1 ""¨Me permites?""   ">
		DEFN_MESG 1,2,<"p1 ""Qu¡tate de en medio""   ">
		DEFN_MESG 1,3,<"p1 ""Mu‚vete""   ">
		DEFN_MESG 1,4,<"p1 ""Ap rtate.""   ">
		DEFN_MESG 1,5,<"p1 ""Voy a pasar por en medio.""   ">

		DEFN_MESG 2,1,<"p1 ""¨Me permites?""   ">
		DEFN_MESG 2,2,<"p1 ""Qu¡tate de en medio""   ">
		DEFN_MESG 2,3,<"p1 ""Mu‚vete""   ">
		DEFN_MESG 2,4,<"p1 ""Ap rtate.""   ">
		DEFN_MESG 2,5,<"p1 ""Voy a pasar por en medio.""   ">

		DEFN_MESG 3,1,<"p1 ""¨Me permites?""   ">
		DEFN_MESG 3,2,<"p1 ""Qu¡tate de en medio""   ">
		DEFN_MESG 3,3,<"p1 ""Mu‚vete""   ">
		DEFN_MESG 3,4,<"p1 ""Ap rtate.""   ">
		DEFN_MESG 3,5,<"p1 ""Voy a pasar por en medio.""   ">

		DEFN_MESG 4,1,<"5 ""Espero que el seguro cubra tambi‚n la eventualidad de muerte violenta.""   ">
		DEFN_MESG 4,2,<"5 ""Nunca quise ser mercenario.""   ">
		DEFN_MESG 4,3,<"5 ""Si nos separamos, nos reunimos justo delante del objetivo.""   ">
		DEFN_MESG 4,4,<"5 ""Sin lugar a dudas, ‚sto es distinto del hormig¢n de Nueva Europa.""   ">
		DEFN_MESG 4,5,<"5 ""Recu‚rdame que saque fotos la pr¢xima vez que vengamos aqu¡.""   ">
		DEFN_MESG 4,6,<"5 ""La atm¢sfera est  bien.  El aire no es t¢xico.  Sobreviviremos.""   ">
		DEFN_MESG 4,7,<"5 ""Todav¡a hay mucho que hacer, as¡ que vamos a acabar con esto r pidamente.""   ">
		DEFN_MESG 4,8,<"5 ""La mayor parte de las cosas que encontremos ser n m s grandes que nosotros.""   ">
		DEFN_MESG 4,9,<"5 ""Intentad no meteros en problemas.""   ">
		DEFN_MESG 4,10,<"5 ""Estoy deseando empezar a pegar tiros.""   ">
		DEFN_MESG 4,11,<"5 * SUSPIRO * ""Espero que paguen las horas extra.""   ">
		DEFN_MESG 4,12,<"5 ""Deber¡amos haber tra¡do al resto con nosotros.  No es suficiente con cuatro.""   ">
		DEFN_MESG 4,13,<"5 ""¨Qui‚n trae la cesta de la merienda?""   ">
		DEFN_MESG 4,14,<"5 ""Estad atentos.""   ">
		DEFN_MESG 4,15,<"5 ""Este lugar me pone la carne de gallina.""   ">
		DEFN_MESG 4,16,<"5 ""Estad quietos y alerta.""   ">
		DEFN_MESG 4,17,<"5 ""­Vaya, hombre!""   ">
		DEFN_MESG 4,18,<"5 ""Una vez o¡ hablar de un lugar donde el tiempo era tan imprevisible como ‚ste.""   ">
		DEFN_MESG 4,19,<"5 ""Si lo conseguimos, os invito a una ronda.""   ">
		DEFN_MESG 4,20,<"5 ""¨Las posibilidades que tenemos?  Yo dir¡a que mitad y mitad.""   ">
		DEFN_MESG 4,21,<"5 ""­No hag is tanto ruido!""   ">
		DEFN_MESG 4,22,<"5 ""No os preocup‚is. Est todo controlado.""   ">
		DEFN_MESG 4,23,<"5 ""Hace tanto fr¡o.""   ">
		DEFN_MESG 4,24,<"5 ""Hace demasiado calor.""   ">
		DEFN_MESG 4,25,<"5 ""Tanto correr me est  matando.""   ">
		DEFN_MESG 4,26,<"5 ""Volvamos a la nave y pongamos en ¢rbita este lugar.""   ">
		DEFN_MESG 4,27,<"5 ""Estoy que rabio por una buena pelea.""   ">
		DEFN_MESG 4,28,<"5 ""Si alguien huye ­le costar  muy caro!""   ">
		DEFN_MESG 4,29,<"5 ""El plan consiste en_ hacerlos papilla primero y preguntar despu‚.""   ">
		DEFN_MESG 4,30,<"5 ""¨Qu‚ ha sido eso?""   ">
		DEFN_MESG 4,31,<"5 ""Retrocedamos y reconsideremos la situaci¢n.""   ">
		DEFN_MESG 4,32,<"5 ""La temperatura media supera de la un microclima normal.""   ">
		DEFN_MESG 4,33,<"5 ""Creo que me estoy repitiendo.""   ">
		DEFN_MESG 4,34,<"5 ""No estamos haciendo prisioneros.""   ">


		DEFN_MESG 8,1,<"p1 ""­Me encuentro muy mal!""   ">
		DEFN_MESG 8,2,<"p1 ""­No puedo soportar el dolor!""   ">
		DEFN_MESG 8,3,<"p1 ""­Creo que me he roto algo!""   ">

		DEFN_MESG 7,1,<"p1 ""­Ayudadme!""   ">
		DEFN_MESG 7,2,<"p1 ""­Ayudadme, ser‚is idiotas! ­Estoy herido!""   ">
		DEFN_MESG 7,3,<"p1 ""Dadme un analg‚sico!""   ">

		DEFN_MESG 6,1,<"p1 ""­Me voy a morir!""   ">
		DEFN_MESG 6,2,<"p1 ""­Todos vamos a morirnos!""   ">
		DEFN_MESG 6,3,<"p1 ""­Se acab¢, se acab¢!""   ">

		DEFN_MESG 5,1,<"p1",COL3," *Arrrrggghhhhhh*   ",COL1>
		DEFN_MESG 5,2,<"p1",COL3," *Aaaaaaaiiiiieeee*   ",COL1>
		DEFN_MESG 5,3,<"p1",COL3," *Urrrrgggghhhhhhh*   ",COL1>

		DEFN_MESG 12,1,<"p1 ""­Me encuentro muy mal!""   ">
		DEFN_MESG 12,2,<"p1 ""­No puedo soportar el dolor!""   ">
		DEFN_MESG 12,3,<"p1 ""­Creo que me he roto algo!""   ">

		DEFN_MESG 11,1,<"p1 ""­Ayudadme!""   ">
		DEFN_MESG 11,2,<"p1 ""­Ayudadme, ser‚is idiotas! ­Estoy herido!""   ">
		DEFN_MESG 11,3,<"p1 ""Dadme un analg‚sico!""   ">

		DEFN_MESG 10,1,<"p1 ""­Me voy a morir!""   ">
		DEFN_MESG 10,2,<"p1 ""­Todos vamos a morirnos!""   ">
		DEFN_MESG 10,3,<"p1 ""­Se acab¢, se acab¢!""   ">

		DEFN_MESG 9,1,<"p2",COL3," *Arrrrggghhhhhh*   ",COL1>
		DEFN_MESG 9,2,<"p2",COL3," *Aaaaaaaiiiiieeee*   ",COL1>
		DEFN_MESG 9,3,<"p2",COL3," *Urrrrgggghhhhhhh*   ",COL1>

		DEFN_MESG 16,1,<"p1 ""­Me encuentro muy mal!""   ">
		DEFN_MESG 16,2,<"p1 ""­No puedo soportar el dolor!""   ">
		DEFN_MESG 16,3,<"p1 ""­Creo que me he roto algo!""   ">

		DEFN_MESG 15,1,<"p1 ""­Ayudadme!""   ">
		DEFN_MESG 15,2,<"p1 ""­Ayudadme, ser‚is idiotas! ­Estoy herido!""   ">
		DEFN_MESG 15,3,<"p1 ""Dadme un analg‚sico!""   ">

		DEFN_MESG 14,1,<"p1 ""­Me voy a morir!""   ">
		DEFN_MESG 14,2,<"p1 ""­Todos vamos a morirnos!""   ">
		DEFN_MESG 14,3,<"p1 ""­Se acab¢, se acab¢!""   ">

		DEFN_MESG 13,1,<"p3",COL3," *Arrrrggghhhhhh*   ",COL1>
		DEFN_MESG 13,2,<"p3",COL3," *Aaaaaaaiiiiieeee*   ",COL1>
		DEFN_MESG 13,3,<"p3",COL3," *Urrrrgggghhhhhhh*   ",COL1>

		DEFN_MESG 20,1,<"p1 ""­Me encuentro muy mal!""   ">
		DEFN_MESG 20,2,<"p1 ""­No puedo soportar el dolor!""   ">
		DEFN_MESG 20,3,<"p1 ""­Creo que me he roto algo!""   ">

		DEFN_MESG 19,1,<"p1 ""­Ayudadme!""   ">
		DEFN_MESG 19,2,<"p1 ""­Ayudadme, ser‚is idiotas! ­Estoy herido!""   ">
		DEFN_MESG 19,3,<"p1 ""Dadme un analg‚sico!""   ">

		DEFN_MESG 18,1,<"p1 ""­Me voy a morir!""   ">
		DEFN_MESG 18,2,<"p1 ""­Todos vamos a morirnos!""   ">
		DEFN_MESG 18,3,<"p1 ""­Se acab¢, se acab¢!""   ">

		DEFN_MESG 17,1,<"p4",COL3," *Arrrrggghhhhhh*   ",COL1>
		DEFN_MESG 17,2,<"p4",COL3," *Aaaaaaaiiiiieeee*   ",COL1>
		DEFN_MESG 17,3,<"p4",COL3," *Urrrrgggghhhhhhh*   ",COL1>

		DEFN_MESG 21,1,<"p1 ""­Todo est decidido!""   ">
		DEFN_MESG 21,2,<"p1 ""­S¡gueme!""   ">
		DEFN_MESG 21,3,<"p1 ""­No te separes de m¡!""   ">
		DEFN_MESG 21,4,<"p1 ""­Todos! Seguidme.""   ">
		DEFN_MESG 21,5,<"p1 ""­Estoy al mando as¡ que mu‚vete!""   ">

		DEFN_MESG 22,1,<"p1 ""­Todo est decidido!""   ">
		DEFN_MESG 22,2,<"p1 ""­S¡gueme!""   ">
		DEFN_MESG 22,3,<"p1 ""­No te separes de m¡!""   ">
		DEFN_MESG 22,4,<"p1 ""­Todos! Seguidme.""   ">
		DEFN_MESG 22,5,<"p1 ""­Estoy al mando as¡ que mu‚vete!""   ">

		DEFN_MESG 23,1,<"p1 ""­Todo est decidido!""   ">
		DEFN_MESG 23,2,<"p1 ""­S¡gueme!""   ">
		DEFN_MESG 23,3,<"p1 ""­No te separes de m¡!""   ">
		DEFN_MESG 23,4,<"p1 ""­Todos! Seguidme.""   ">
		DEFN_MESG 23,5,<"p1 ""­Estoy al mando as¡ que mu‚vete!""   ">

		DEFN_MESG 24,1,<"p1 ""­Todo est decidido!""   ">
		DEFN_MESG 24,2,<"p1 ""­S¡gueme!""   ">
		DEFN_MESG 24,3,<"p1 ""­No te separes de m¡!""   ">
		DEFN_MESG 24,4,<"p1 ""­Todos! Seguidme.""   ">
		DEFN_MESG 24,5,<"p1 ""­Estoy al mando as¡ que mu‚vete!""   ">

mesg1		dc.l	0,0
		dc.b	"5 ",34,"La explosi¢n ya est  en marcha, as¡ que s lgamos a toda mecha. ­M¢veos!",34,"   ",0
		even
mesg2		dc.l	0,0
		dc.b	"p1 ""­­­­­SOCORRO!!!!! ­Que me aplastan!""   ",0
		even
