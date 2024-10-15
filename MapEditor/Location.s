;script assemble
;devpac3-2.0:devpac/genam >ram:errors.txt ram:test.s
;script after
;work:c/strip ram:test 32 6
;copy ram:test 3dgame:mapeditor/Location.dat
;script end

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

		output	ram:test
		opt 	o+,ow-

		incdir	source:hiredguns/sources

		include	Macros.i

********************************************************************************

		dc.w	84,12		;x,y position
		dc.w	10,10		;hit box width, height
		dc.w	0		;0=norm, 1=possible start, 2=rendevous, 3=end
		dc.b	ABSPOS,10>>8,10&$ff,3>>8,3&$ff,CENTRE
		dc.b	"More detailed description here.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
		dc.b	ABSPOS,10>>8,10&$ff,12>>8,12&$ff,CENTRE
		dc.b	"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
		dc.b	ABSPOS,10>>8,10&$ff,21>>8,21&$ff,CENTRE
		dc.b	"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
		dc.b	ABSPOS,10>>8,10&$ff,30>>8,30&$ff,CENTRE
		dc.b	"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
		dc.b	ENDTEXT
		dc.b	ABSPOS,10>>8,10&$ff,5>>8,5&$ff,CENTRE
		dc.b	"LAT 04.98]  LGN 38.33]  ALT 00034[  {|{}{||{}"
		dc.b	ABSPOS,60>>8,60&$ff,15>>8,15&$ff,CENTRE
		dc.b    "LOG ENTRY 491. Artificial Island. Approximate dimensions are"
		dc.b	ABSPOS,60>>8,60&$ff,25>>8,25&$ff,CENTRE
		dc.b	"3 by 5 km. Preliminary probe indicates dropzone suitability."
		dc.b	ABSPOS,60>>8,60&$ff,35>>8,35&$ff,CENTRE
		dc.b	"WARNING infra red source 54m below mean sea level. END.~~~~~"
		dc.b	ENDTEXT
		dc.b	4		;disk number 4-5
		dc.b	1		;map number
                dc.b	1		;picture number
                dc.b	3		;music number
		dc.b	0		;background sfx
		dc.b	8		;monster type 1
		dc.b	8		;monster type 2
		dc.b	2		;sky
		dc.b	0		;style
		dc.w	2		;destination 1  0=end of destinations
		dc.w	5		;destination 2
		dc.w	0		;destination 3
		dc.w	0		;destination 4

		end
