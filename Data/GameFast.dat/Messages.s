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

		DEFN_MESG 0,1,<"p1 ""Excuse me.""   ">
		DEFN_MESG 0,2,<"p1 ""Get outa my way!""   ">
		DEFN_MESG 0,3,<"p1 ""Move!""   ">
		DEFN_MESG 0,4,<"p1 ""Step aside.""   ">
		DEFN_MESG 0,5,<"p1 ""I'm coming through.""   ">

		DEFN_MESG 1,1,<"p2 ""Excuse me.""   ">
		DEFN_MESG 1,2,<"p2 ""Get outa my way!""   ">
		DEFN_MESG 1,3,<"p2 ""Move!""   ">
		DEFN_MESG 1,4,<"p2 ""Step aside.""   ">
		DEFN_MESG 1,5,<"p2 ""I'm coming through.""   ">

		DEFN_MESG 2,1,<"p3 ""Excuse me.""   ">
		DEFN_MESG 2,2,<"p3 ""Get out of my way!""   ">
		DEFN_MESG 2,3,<"p3 ""Move!""   ">
		DEFN_MESG 2,4,<"p3 ""Step aside.""   ">
		DEFN_MESG 2,5,<"p3 ""I'm coming through.""   ">

		DEFN_MESG 3,1,<"p4 ""Excuse me.""   ">
		DEFN_MESG 3,2,<"p4 ""Get out of my way!""   ">
		DEFN_MESG 3,3,<"p4 ""Move!""   ">
		DEFN_MESG 3,4,<"p4 ""Step aside.""   ">
		DEFN_MESG 3,5,<"p4 ""I'm coming through.""   ">

		DEFN_MESG 4,1,<"5 ""I hope we're insured against violent death.""   ">
		DEFN_MESG 4,2,<"5 ""I never wanted to be a mercenary.""   ">
		DEFN_MESG 4,3,<"5 ""If we get separated, rendezvous just ahead of the target site.""   ">
		DEFN_MESG 4,4,<"5 ""This certainly makes a change from the dull concrete of New Europe.""   ">
		DEFN_MESG 4,5,<"5 ""Remind me to take some holiday snaps next time we're here.""   ">
		DEFN_MESG 4,6,<"5 ""Atmosphere's fine.  Nothing toxic in the air.  We'll live.""   ">
		DEFN_MESG 4,7,<"5 ""There's a lot of ground to cover, so let's make this quick.""   ">
		DEFN_MESG 4,8,<"5 ""Most of the things we'll find will be larger than we are.""   ">
		DEFN_MESG 4,9,<"5 ""Try and keep out of trouble.""   ">
		DEFN_MESG 4,10,<"5 ""I've got an itchy trigger finger.""   ">
		DEFN_MESG 4,11,<"5 * SIGH * ""I hope I'm still getting my overtime after all this.""   ">
		DEFN_MESG 4,12,<"5 ""We should have brought everybody along.  Four isn't nearly enough.""   ">
		DEFN_MESG 4,13,<"5 ""Who brought the picnic hamper?""   ">
		DEFN_MESG 4,14,<"5 ""Stay sharp.""   ">
		DEFN_MESG 4,15,<"5 ""This place gives me the creeps.""   ">
		DEFN_MESG 4,16,<"5 ""Stay frosty and alert.""   ">
		DEFN_MESG 4,17,<"5 ""What a stink!""   ">
		DEFN_MESG 4,18,<"5 ""I once heard of a place on Earth where the weather was as unpredictable as this.""   ">
		DEFN_MESG 4,19,<"5 ""If we make it through this - the drinks are on me.""   ">
		DEFN_MESG 4,20,<"5 ""Our chances? Fifty fifty I'd say.""   ">
		DEFN_MESG 4,21,<"5 ""Stop making so much noise!""   ">
		DEFN_MESG 4,22,<"5 ""Don't worry. I'm in control.""   ">
		DEFN_MESG 4,23,<"5 ""Its so cold.""   ">
		DEFN_MESG 4,24,<"5 ""Its too hot.""   ">
		DEFN_MESG 4,25,<"5 ""All this running about is killing me.""   ">
		DEFN_MESG 4,26,<"5 ""Lets go back to the dropship and nuke this site from orbit.""   ">
		DEFN_MESG 4,27,<"5 ""I'm itching for a good fight.""   ">
		DEFN_MESG 4,28,<"5 ""If anyone runs away - there will be hell to pay!""   ">
		DEFN_MESG 4,29,<"5 ""The trick is.... to blast them first and then ask questions later.""   ">
		DEFN_MESG 4,30,<"5 ""What was that?""   ">
		DEFN_MESG 4,31,<"5 ""Lets back off and reassess the situation.""   ">
		DEFN_MESG 4,32,<"5 ""Mean temperature is above micro-clime norm.""   ">
		DEFN_MESG 4,33,<"5 ""I feel like I'm repeating myself.""   ">
		DEFN_MESG 4,34,<"5 ""Were not taking any prisoners.""   ">

		DEFN_MESG 8,1,<"p1 ""I feel really bad!""   ">
		DEFN_MESG 8,2,<"p1 ""I can't stand the pain!""   ">
		DEFN_MESG 8,3,<"p1 ""I think I've broken something!""   ">

		DEFN_MESG 7,1,<"p1 ""Help me!""   ">
		DEFN_MESG 7,2,<"p1 ""Help me, you idiots! I'm wounded!""   ">
		DEFN_MESG 7,3,<"p1 ""Give me an analgesic!""   ">

		DEFN_MESG 6,1,<"p1 ""I'm going to die!""   ">
		DEFN_MESG 6,2,<"p1 ""Were all going to die!""   ">
		DEFN_MESG 6,3,<"p1 ""Game over man! Game over!""   ">

		DEFN_MESG 5,1,<"p1",COL3," *Arrrrggghhhhhh*   ",COL1>
		DEFN_MESG 5,2,<"p1",COL3," *Aaaaaaaiiiiieeee*   ",COL1>
		DEFN_MESG 5,3,<"p1",COL3," *Urrrrgggghhhhhhh*   ",COL1>

		DEFN_MESG 12,1,<"p2 ""I feel really bad!""   ">
		DEFN_MESG 12,2,<"p2 ""I can't stand the pain!""   ">
		DEFN_MESG 12,3,<"p2 ""I think I've broken something!""   ">

		DEFN_MESG 11,1,<"p2 ""Help me!""   ">
		DEFN_MESG 11,2,<"p2 ""Help me, you idiots! I'm wounded!""   ">
		DEFN_MESG 11,3,<"p2 ""Give me an analgesic!""   ">

		DEFN_MESG 10,1,<"p2 ""I'm going to die!""   ">
		DEFN_MESG 10,2,<"p2 ""Were all going to die!""   ">
		DEFN_MESG 10,3,<"p2 ""Game over man! Game over!""   ">

		DEFN_MESG 9,1,<"p2",COL3," *Arrrrggghhhhhh*   ",COL1>
		DEFN_MESG 9,2,<"p2",COL3," *Aaaaaaaiiiiieeee*   ",COL1>
		DEFN_MESG 9,3,<"p2",COL3," *Urrrrgggghhhhhhh*   ",COL1>

		DEFN_MESG 16,1,<"p3 ""I feel really bad!""   ">
		DEFN_MESG 16,2,<"p3 ""I can't stand the pain!""   ">
		DEFN_MESG 16,3,<"p3 ""I think I've broken something!""   ">

		DEFN_MESG 15,1,<"p3 ""Help me!""   ">
		DEFN_MESG 15,2,<"p3 ""Help me, you idiots! I'm wounded!""   ">
		DEFN_MESG 15,3,<"p3 ""Give me an analgesic!""   ">

		DEFN_MESG 14,1,<"p3 ""I'm going to die!""   ">
		DEFN_MESG 14,2,<"p3 ""Were all going to die!""   ">
		DEFN_MESG 14,3,<"p3 ""Game over man! Game over!""   ">

		DEFN_MESG 13,1,<"p3",COL3," *Arrrrggghhhhhh*   ",COL1>
		DEFN_MESG 13,2,<"p3",COL3," *Aaaaaaaiiiiieeee*   ",COL1>
		DEFN_MESG 13,3,<"p3",COL3," *Urrrrgggghhhhhhh*   ",COL1>

		DEFN_MESG 20,1,<"p4 ""I feel really bad!""   ">
		DEFN_MESG 20,2,<"p4 ""I can't stand the pain!""   ">
		DEFN_MESG 20,3,<"p4 ""I think I've broken something!""   ">

		DEFN_MESG 19,1,<"p4 ""Help me!""   ">
		DEFN_MESG 19,2,<"p4 ""Help me, you idiots! I'm wounded!""   ">
		DEFN_MESG 19,3,<"p4 ""Give me an analgesic!""   ">

		DEFN_MESG 18,1,<"p4 ""I'm going to die!""   ">
		DEFN_MESG 18,2,<"p4 ""Were all going to die!""   ">
		DEFN_MESG 18,3,<"p4 ""Game over man! Game over!""   ">

		DEFN_MESG 17,1,<"p4",COL3," *Arrrrggghhhhhh*   ",COL1>
		DEFN_MESG 17,2,<"p4",COL3," *Aaaaaaaiiiiieeee*   ",COL1>
		DEFN_MESG 17,3,<"p4",COL3," *Urrrrgggghhhhhhh*   ",COL1>

		DEFN_MESG 21,1,<"p1 ""Follow me!""   ">
		DEFN_MESG 21,2,<"p1 ""Stay close to me!""   ">
		DEFN_MESG 21,3,<"p1 ""Everybody! Follow me.""   ">
		DEFN_MESG 21,4,<"p1 ""I'm in command so move it!""   ">
		DEFN_MESG 21,5,<"p1 ""I'll lead you through this.""   ">

		DEFN_MESG 22,1,<"p2 ""Follow me!""   ">
		DEFN_MESG 22,2,<"p2 ""Stay close to me!""   ">
		DEFN_MESG 22,3,<"p2 ""Everybody! Follow me.""   ">
		DEFN_MESG 22,4,<"p2 ""I'm in command so move it!""   ">
		DEFN_MESG 22,5,<"p2 ""I'll lead you through this.""   ">

		DEFN_MESG 23,1,<"p3 ""Follow me!""   ">
		DEFN_MESG 23,2,<"p3 ""Stay close to me!""   ">
		DEFN_MESG 23,3,<"p3 ""Everybody! Follow me.""   ">
		DEFN_MESG 23,4,<"p3 ""I'm in command so move it!""   ">
		DEFN_MESG 23,5,<"p3 ""I'll lead you through this.""   ">

		DEFN_MESG 24,1,<"p4 ""Follow me!""   ">
		DEFN_MESG 24,2,<"p4 ""Stay close to me!""   ">
		DEFN_MESG 24,3,<"p4 ""Everybody! Follow me.""   ">
		DEFN_MESG 24,4,<"p4 ""I'm in command so move it!""   ">
		DEFN_MESG 24,5,<"p4 ""I'll lead you through this.""   ">

mesg1		dc.l	0,0
		dc.b	"5 ",34,"Thats the explosion rigged, now lets get the hell out of here. Move it!",34,"   ",0
		even
mesg2		dc.l	0,0
		dc.b	"p1 ""HELP!!!!! I'm being squashed!""   ",0
		even

		ds.b	316
