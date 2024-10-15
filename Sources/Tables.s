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

********************************************************************************
********************************* Views Format *********************************
********************************************************************************
w		equ	MAP_WIDTH	;map width
d		equ	MAP_DEPTH	;map depth
a		equ	w*d		;map floor area
xxxx		equ     -1

		even

	IFD	CD32

view_offsets					;actual, back, left, right
			dc.l	0,-1*4,2*4,-1*4
			dc.l	4,-1*4,3*4,-1*4
			dc.l	1,-1*4,4*4,-1*4
			dc.l	3,-1*4,4*4,-1*4
			dc.l	2,-1*4,-1*4,-1*4
			dc.l	46,-1*4,7*4,-1*4
			dc.l	50,-1*4,8*4,-1*4
			dc.l	47,-1*4,9*4,-1*4
			dc.l	49,-1*4,9*4,-1*4
			dc.l	48,-1*4,-1*4,-1*4
			dc.l	21,-1*4,12*4,-1*4
			dc.l	27,-1*4,13*4,-1*4
			dc.l	22,-1*4,14*4,5*4
			dc.l	26,-1*4,15*4,6*4
			dc.l	23,-1*4,16*4,7*4
			dc.l	25,-1*4,16*4,8*4
			dc.l	24,-1*4,-1*4,9*4
			dc.l	5,0*4,19*4,-1*4
			dc.l	9,1*4,20*4,-1*4
			dc.l	6,2*4,21*4,-1*4
			dc.l	8,3*4,21*4,-1*4
			dc.l	7,4*4,-1*4,-1*4
			dc.l	51,5*4,24*4,-1*4
			dc.l	55,6*4,25*4,-1*4
			dc.l	52,7*4,26*4,-1*4
			dc.l	54,8*4,26*4,-1*4
			dc.l	53,9*4,-1*4,-1*4
			dc.l	28,10*4,29*4,-1*4
			dc.l	34,11*4,30*4,-1*4
			dc.l	29,12*4,31*4,22*4
			dc.l	33,13*4,32*4,23*4
			dc.l	30,14*4,33*4,24*4
			dc.l	32,15*4,33*4,25*4
			dc.l	31,16*4,-1*4,26*4
			dc.l	10,17*4,36*4,-1*4
			dc.l	14,18*4,37*4,-1*4
			dc.l	11,19*4,38*4,-1*4
			dc.l	13,20*4,38*4,-1*4
			dc.l	12,21*4,-1*4,-1*4
			dc.l	56,22*4,41*4,-1*4
			dc.l	60,23*4,42*4,-1*4
			dc.l	57,24*4,43*4,-1*4
			dc.l	59,25*4,43*4,-1*4
			dc.l	58,26*4,-1*4,-1*4
			dc.l	35,29*4,46*4,39*4
			dc.l	39,30*4,47*4,40*4
			dc.l	36,31*4,48*4,41*4
			dc.l	38,32*4,48*4,42*4
			dc.l	37,33*4,-1*4,43*4
			dc.l	15,36*4,51*4,-1*4
			dc.l	17,37*4,51*4,-1*4
			dc.l	16,38*4,-1*4,-1*4
			dc.l	61,41*4,54*4,-1*4
			dc.l	63,42*4,54*4,-1*4
			dc.l	62,43*4,-1*4,-1*4
			dc.l	40,46*4,57*4,52*4
			dc.l	42,47*4,57*4,53*4
			dc.l	41,48*4,-1*4,54*4
			dc.l	18,49*4,60*4,-1*4
			dc.l	20,50*4,60*4,-1*4
			dc.l	19,51*4,-1*4,-1*4
			dc.l	64,52*4,63*4,-1*4
			dc.l	66,53*4,63*4,-1*4
			dc.l	65,54*4,-1*4,-1*4
			dc.l	43,55*4,66*4,61*4
			dc.l	45,56*4,66*4,62*4
			dc.l	44,57*4,-1*4,63*4

			even
	ELSEIF

view_offsets	dc.l	0,4,1,3,2,46,50,47,49,48,21,27,22,26,23,25,24
		dc.l	5,9,6,8,7,51,55,52,54,53,28,34,29,33,30,32,31
		dc.l	10,14,11,13,12,56,60,57,59,58,35,39,36,38,37
		dc.l	15,17,16,61,63,62,40,42,41
		dc.l	18,20,19,64,66,65,43,45,44

	ENDC

map_offsets	dc.w    (-2*w-4)*4,-4*16,-2*16
		dc.w	(-2*w-3)*4,-3*16,-2*16
		dc.w	(-2*w-2)*4,-2*16,-2*16
		dc.w	(-2*w-1)*4,-1*16,-2*16
		dc.w	(-2*w)*4,0,-2*16
		dc.w	(-2*w+1)*4,16,-2*16
		dc.w	(-2*w+2)*4,2*16,-2*16
		dc.w	(-2*w+3)*4,3*16,-2*16
		dc.w	(-2*w+4)*4,4*16,-2*16
		dc.w    (-1*w-4)*4,-4*16,-1*16
		dc.w	(-1*w-3)*4,-3*16,-1*16
		dc.w	(-1*w-2)*4,-2*16,-1*16
		dc.w	(-1*w-1)*4,-1*16,-1*16
		dc.w	(-1*w)*4,0,-1*16
		dc.w	(-1*w+1)*4,16,-1*16
		dc.w	(-1*w+2)*4,2*16,-1*16
		dc.w	(-1*w+3)*4,3*16,-1*16
		dc.w	(-1*w+4)*4,4*16,-1*16
		dc.w    -4*4,-4*16,0
		dc.w	-3*4,-3*16,0
		dc.w	-2*4,-2*16,0
		dc.w	-1*4,-1*16,0
		dc.w	0,0,0
		dc.w	1*4,16,0
		dc.w	2*4,2*16,0
		dc.w	3*4,3*16,0
		dc.w	4*4,4*16,0
		dc.w    (1*w-4)*4,-4*16,16
		dc.w	(1*w-3)*4,-3*16,16
		dc.w	(1*w-2)*4,-2*16,16
		dc.w	(1*w-1)*4,-1*16,16
		dc.w	(1*w)*4,0,16
		dc.w	(1*w+1)*4,16,16
		dc.w	(1*w+2)*4,2*16,16
		dc.w	(1*w+3)*4,3*16,16
		dc.w	(1*w+4)*4,4*16,16
		dc.w    (2*w-4)*4,-4*16,2*16
		dc.w	(2*w-3)*4,-3*16,2*16
		dc.w	(2*w-2)*4,-2*16,2*16
		dc.w	(2*w-1)*4,-1*16,2*16
		dc.w	(2*w)*4,0,2*16
		dc.w	(2*w+1)*4,16,2*16
		dc.w	(2*w+2)*4,2*16,2*16
		dc.w	(2*w+3)*4,3*16,2*16
		dc.w	(2*w+4)*4,4*16,2*16

block_removal	dc.w	55*4,57*4,xxxx,xxxx, 17*4,19*4,29*4,31*4, 46*4,36*4,xxxx,xxxx, 64*4,57*4,xxxx,xxxx
		dc.w	55*4,19*4,31*4,xxxx, 17*4,02*4,12*4,xxxx, 55*4,57*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;0

		dc.w	56*4,57*4,xxxx,xxxx, 18*4,20*4,30*4,32*4, 47*4,37*4,xxxx,xxxx, 65*4,57*4,xxxx,xxxx
		dc.w	56*4,20*4,32*4,xxxx, 18*4,03*4,13*4,xxxx, 56*4,57*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;1

		dc.w	57*4,xxxx,xxxx,xxxx, 46*4,48*4,36*4,38*4, 19*4,21*4,31*4,33*4, 19*4,04*4,14*4,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;2

		dc.w	57*4,xxxx,xxxx,xxxx, 47*4,48*4,37*4,38*4, 21*4,20*4,33*4,32*4, 20*4,04*4,15*4,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;3

		dc.w	57*4,xxxx,xxxx,xxxx, 48*4,38*4,xxxx,xxxx, 33*4,21*4,xxxx,xxxx, 21*4,16*4,xxxx,xxxx
		dc.w	33*4,38*4,xxxx,xxxx, 48*4,51*4,xxxx,xxxx, 21*4,48*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;4

		dc.w	55*4,57*4,xxxx,xxxx, 22*4,24*4,29*4,31*4, 46*4,41*4,xxxx,xxxx, 64*4,57*4,xxxx,xxxx
		dc.w	55*4,24*4,31*4,xxxx, 22*4,07*4,12*4,xxxx, 55*4,57*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;5

		dc.w	56*4,57*4,xxxx,xxxx, 23*4,25*4,30*4,32*4, 47*4,42*4,xxxx,xxxx, 65*4,57*4,xxxx,xxxx
		dc.w	56*4,25*4,32*4,xxxx, 23*4,08*4,13*4,xxxx, 56*4,57*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;6

		dc.w	57*4,xxxx,xxxx,xxxx, 46*4,48*4,41*4,43*4, 24*4,26*4,31*4,33*4, 24*4,09*4,14*4,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;7

		dc.w	57*4,xxxx,xxxx,xxxx, 47*4,48*4,42*4,43*4, 26*4,25*4,33*4,32*4, 25*4,09*4,15*4,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;8

		dc.w	57*4,xxxx,xxxx,xxxx, 48*4,43*4,xxxx,xxxx, 33*4,26*4,xxxx,xxxx, 26*4,16*4,xxxx,xxxx
		dc.w	33*4,43*4,xxxx,xxxx, 48*4,54*4,xxxx,xxxx, 26*4,48*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;9

		dc.w	29*4,xxxx,xxxx,xxxx, 44*4,46*4,xxxx,xxxx, 55*4,xxxx,xxxx,xxxx, 64*4,57*4,xxxx,xxxx
		dc.w	46*4,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;10

		dc.w	30*4,xxxx,xxxx,xxxx, 45*4,47*4,xxxx,xxxx, 56*4,xxxx,xxxx,xxxx, 65*4,57*4,xxxx,xxxx
		dc.w	47*4,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;11

		dc.w	29*4,31*4,xxxx,xxxx, 46*4,xxxx,xxxx,xxxx, 55*4,xxxx,xxxx,xxxx, 64*4,57*4,xxxx,xxxx
		dc.w	64*4,31*4,xxxx,xxxx, 29*4,14*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;12

		dc.w	30*4,32*4,xxxx,xxxx, 47*4,xxxx,xxxx,xxxx, 56*4,xxxx,xxxx,xxxx, 65*4,57*4,xxxx,xxxx
		dc.w	65*4,32*4,xxxx,xxxx, 30*4,15*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;13

		dc.w	31*4,33*4,xxxx,xxxx, 46*4,48*4,xxxx,xxxx, 57*4,xxxx,xxxx,xxxx, 31*4,16*4,xxxx,xxxx
		dc.w	46*4,33*4,xxxx,xxxx, 55*4,48*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;14

		dc.w	32*4,33*4,xxxx,xxxx, 47*4,48*4,xxxx,xxxx, 57*4,xxxx,xxxx,xxxx, 32*4,16*4,xxxx,xxxx
		dc.w	33*4,47*4,xxxx,xxxx, 48*4,56*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;15

		dc.w	33*4,xxxx,xxxx,xxxx, 48*4,xxxx,xxxx,xxxx, 57*4,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;16

		dc.w	36*4,46*4,xxxx,xxxx, 55*4,49*4,xxxx,xxxx, 55*4,36*4,xxxx,xxxx, 64*4,55*4,xxxx,xxxx
		dc.w	64*4,57*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;17

		dc.w	37*4,47*4,xxxx,xxxx, 56*4,50*4,xxxx,xxxx, 56*4,37*4,xxxx,xxxx, 65*4,56*4,xxxx,xxxx
		dc.w	65*4,57*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;18

		dc.w	36*4,38*4,46*4,48*4, 64*4,57*4,60*4,xxxx, 64*4,57*4,51*4,49*4, 64*4,57*4,36*4,38*4
		dc.w	49*4,51*4,55*4,57*4, 64*4,57*4,51*4,58*4, 36*4,21*4,31*4,xxxx, xxxx,xxxx,xxxx,xxxx	;19

		dc.w	38*4,37*4,48*4,47*4, 65*4,57*4,60*4,xxxx, 65*4,57*4,51*4,50*4, 65*4,57*4,38*4,37*4
		dc.w	50*4,51*4,56*4,57*4, 65*4,57*4,51*4,59*4, 37*4,21*4,32*4,xxxx, xxxx,xxxx,xxxx,xxxx	;20

		dc.w	38*4,48*4,xxxx,xxxx, 51*4,57*4,xxxx,xxxx, 60*4,57*4,xxxx,xxxx, 51*4,48*4,xxxx,xxxx
		dc.w	38*4,57*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;21

		dc.w	41*4,46*4,xxxx,xxxx, 55*4,52*4,xxxx,xxxx, 55*4,41*4,xxxx,xxxx, 64*4,55*4,xxxx,xxxx
		dc.w	64*4,57*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;22

		dc.w	42*4,47*4,xxxx,xxxx, 56*4,53*4,xxxx,xxxx, 56*4,42*4,xxxx,xxxx, 65*4,56*4,xxxx,xxxx
		dc.w	65*4,57*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;23

		dc.w	41*4,43*4,46*4,48*4, 64*4,57*4,63*4,xxxx, 64*4,57*4,54*4,52*4, 64*4,57*4,41*4,43*4
		dc.w	52*4,54*4,55*4,57*4, 64*4,57*4,54*4,61*4, 41*4,26*4,31*4,xxxx, xxxx,xxxx,xxxx,xxxx	;24

		dc.w	41*4,42*4,47*4,48*4, 65*4,57*4,63*4,xxxx, 65*4,57*4,54*4,53*4, 65*4,57*4,42*4,43*4
		dc.w	53*4,54*4,56*4,57*4, 65*4,57*4,54*4,62*4, 42*4,26*4,32*4,xxxx, xxxx,xxxx,xxxx,xxxx	;25

		dc.w	43*4,48*4,xxxx,xxxx, 54*4,57*4,xxxx,xxxx, 63*4,57*4,xxxx,xxxx, 54*4,48*4,xxxx,xxxx
		dc.w	43*4,57*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;26

		dc.w	44*4,xxxx,xxxx,xxxx, 46*4,xxxx,xxxx,xxxx, 55*4,xxxx,xxxx,xxxx, 64*4,xxxx,xxxx,xxxx
		dc.w	29*4,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;27

		dc.w	45*4,xxxx,xxxx,xxxx, 47*4,xxxx,xxxx,xxxx, 56*4,xxxx,xxxx,xxxx, 65*4,xxxx,xxxx,xxxx
		dc.w	30*4,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;28

		dc.w	46*4,xxxx,xxxx,xxxx, 55*4,xxxx,xxxx,xxxx, 64*4,57*4,xxxx,xxxx, 44*4,31*4,xxxx,xxxx
		dc.w	64*4,31*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;29

		dc.w	47*4,xxxx,xxxx,xxxx, 56*4,xxxx,xxxx,xxxx, 65*4,57*4,xxxx,xxxx, 45*4,32*4,xxxx,xxxx
		dc.w	65*4,32*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;30

		dc.w	64*4,57*4,xxxx,xxxx, 57*4,46*4,xxxx,xxxx, 46*4,48*4,xxxx,xxxx, 48*4,55*4,xxxx,xxxx
		dc.w	46*4,33*4,xxxx,xxxx, 55*4,57*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;31

		dc.w	65*4,57*4,xxxx,xxxx, 57*4,47*4,xxxx,xxxx, 47*4,48*4,xxxx,xxxx, 48*4,56*4,xxxx,xxxx
		dc.w	47*4,33*4,xxxx,xxxx, 57*4,56*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;32

		dc.w	57*4,xxxx,xxxx,xxxx, 48*4,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;33

		dc.w	64*4,xxxx,xxxx,xxxx, 49*4,55*4,xxxx,xxxx, 36*4,46*4,xxxx,xxxx, 36*4,44*4,xxxx,xxxx
		dc.w	36*4,55*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;34

		dc.w	65*4,xxxx,xxxx,xxxx, 50*4,56*4,xxxx,xxxx, 37*4,47*4,xxxx,xxxx, 37*4,45*4,xxxx,xxxx
		dc.w	37*4,56*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;35

		dc.w	49*4,51*4,55*4,57*4, 49*4,46*4,38*4,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;36

		dc.w	50*4,51*4,56*4,57*4, 50*4,47*4,38*4,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;37

		dc.w	60*4,57*4,xxxx,xxxx, 51*4,57*4,xxxx,xxxx, 51*4,48*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;38

		dc.w	64*4,xxxx,xxxx,xxxx, 52*4,55*4,xxxx,xxxx, 41*4,46*4,xxxx,xxxx, 41*4,44*4,xxxx,xxxx
		dc.w	41*4,55*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;39

		dc.w	65*4,xxxx,xxxx,xxxx, 53*4,56*4,xxxx,xxxx, 42*4,47*4,xxxx,xxxx, 42*4,45*4,xxxx,xxxx
		dc.w	42*4,56*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;40

		dc.w	52*4,54*4,55*4,57*4, 52*4,46*4,43*4,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;41

		dc.w	54*4,53*4,57*4,56*4, 53*4,47*4,43*4,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;42

		dc.w	63*4,57*4,xxxx,xxxx, 54*4,57*4,xxxx,xxxx, 54*4,48*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;43

		dc.w	55*4,xxxx,xxxx,xxxx, 46*4,xxxx,xxxx,xxxx, 57*4,64*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;44

		dc.w	56*4,xxxx,xxxx,xxxx, 47*4,xxxx,xxxx,xxxx, 57*4,65*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;45

		dc.w	64*4,57*4,xxxx,xxxx, 55*4,57*4,xxxx,xxxx, 55*4,48*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;46

		dc.w	65*4,57*4,xxxx,xxxx, 56*4,57*4,xxxx,xxxx, 56*4,48*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;47

		dc.w	57*4,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;48

		dc.w	55*4,58*4,51*4,xxxx, 64*4,57*4,51*4,xxxx, 60*4,57*4,64*4,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;49

		dc.w	56*4,59*4,51*4,xxxx, 65*4,57*4,51*4,xxxx, 60*4,57*4,65*4,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;50

		dc.w	60*4,57*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;51

		dc.w	55*4,61*4,54*4,xxxx, 64*4,57*4,54*4,xxxx, 63*4,57*4,64*4,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;52

		dc.w	56*4,62*4,54*4,xxxx, 65*4,57*4,54*4,xxxx, 63*4,57*4,65*4,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;53

		dc.w	63*4,57*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;54

		dc.w	64*4,57*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;55

		dc.w	65*4,57*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;56

		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;57

		dc.w	60*4,64*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;58

		dc.w	60*4,65*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;59

		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;60

		dc.w	63*4,64*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;61

		dc.w	63*4,65*4,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;62

		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;63

		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;64

		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;65

		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx
		dc.w	xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx, xxxx,xxxx,xxxx,xxxx	;66

descan_north	dc.w    -1,-1,-1,-1,-1
		dc.w    -1,-1,-1,-1,-1
		dc.w	(-4*w-3)*4,(-4*w+3)*4,(-4*w-2)*4,(-4*w+2)*4,(-4*w-1)*4,(-4*w+1)*4,(-4*w)*4
		dc.w    -1,-1,-1,-1,-1
		dc.w    -1,-1,-1,-1,-1
		dc.w	(-3*w-3)*4,(-3*w+3)*4,(-3*w-2)*4,(-3*w+2)*4,(-3*w-1)*4,(-3*w+1)*4,(-3*w)*4
		dc.w    -1,-1,-1,-1,-1
		dc.w    -1,-1,-1,-1,-1
		dc.w	(-2*w-2)*4,(-2*w+2)*4,(-2*w-1)*4,(-2*w+1)*4,(-2*w)*4
		dc.w    -1,-1,-1
		dc.w    -1,-1,-1
		dc.w	(-1*w-1)*4,(-1*w+1)*4,(-1*w)*4
		dc.w    -1,-1,-1
		dc.w    -1,-1,-1
		dc.w	-1*4,1*4,0

descan_south	dc.w    -1,-1,-1,-1,-1
		dc.w    -1,-1,-1,-1,-1
		dc.w	(4*w+3)*4,(4*w-3)*4,(4*w+2)*4,(4*w-2)*4,(4*w+1)*4,(4*w-1)*4,(4*w)*4
		dc.w    -1,-1,-1,-1,-1
		dc.w    -1,-1,-1,-1,-1
		dc.w	(3*w+3)*4,(3*w-3)*4,(3*w+2)*4,(3*w-2)*4,(3*w+1)*4,(3*w-1)*4,(3*w)*4
		dc.w    -1,-1,-1,-1,-1
		dc.w    -1,-1,-1,-1,-1
		dc.w	(2*w+2)*4,(2*w-2)*4,(2*w+1)*4,(2*w-1)*4,(2*w)*4
		dc.w    -1,-1,-1
		dc.w    -1,-1,-1
		dc.w	(1*w+1)*4,(1*w-1)*4,(1*w)*4
		dc.w    -1,-1,-1
		dc.w    -1,-1,-1
		dc.w	1*4,-1*4,0

descan_east	dc.w    -1,-1,-1,-1,-1
		dc.w    -1,-1,-1,-1,-1
		dc.w	(4-3*w)*4,(4+3*w)*4,(4-2*w)*4,(4+2*w)*4,(4-1*w)*4,(4+1*w)*4,4*4
		dc.w    -1,-1,-1,-1,-1
		dc.w    -1,-1,-1,-1,-1
		dc.w	(3-3*w)*4,(3+3*w)*4,(3-2*w)*4,(3+2*w)*4,(3-1*w)*4,(3+1*w)*4,3*4
		dc.w    -1,-1,-1,-1,-1
		dc.w    -1,-1,-1,-1,-1
		dc.w	(2-2*w)*4,(2+2*w)*4,(2-1*w)*4,(2+1*w)*4,2*4
		dc.w    -1,-1,-1
		dc.w    -1,-1,-1
		dc.w	(1-1*w)*4,(1+1*w)*4,1*4
		dc.w    -1,-1,-1
		dc.w    -1,-1,-1
		dc.w	(-1*w)*4,(1*w)*4,0

descan_west	dc.w    -1,-1,-1,-1,-1
		dc.w    -1,-1,-1,-1,-1
		dc.w	(-4+3*w)*4,(-4-3*w)*4,(-4+2*w)*4,(-4-2*w)*4,(-4+1*w)*4,(-4-1*w)*4,-4*4
		dc.w    -1,-1,-1,-1,-1
		dc.w    -1,-1,-1,-1,-1
		dc.w	(-3+3*w)*4,(-3-3*w)*4,(-3+2*w)*4,(-3-2*w)*4,(-3+1*w)*4,(-3-1*w)*4,-3*4
		dc.w    -1,-1,-1,-1,-1
		dc.w    -1,-1,-1,-1,-1
		dc.w	(-2+2*w)*4,(-2-2*w)*4,(-2+1*w)*4,(-2-1*w)*4,-2*4
		dc.w    -1,-1,-1
		dc.w    -1,-1,-1
		dc.w	(-1+1*w)*4,(-1-1*w)*4,-1*4
		dc.w    -1,-1,-1
		dc.w    -1,-1,-1
		dc.w	(1*w)*4,(-1*w)*4,0

north		dc.l	(1*a-4*w-2)*4,(1*a-4*w+2)*4,(1*a-4*w-1)*4,(1*a-4*w+1)*4,(1*a-4*w)*4
		dc.l	(-1*a-4*w-2)*4,(-1*a-4*w+2)*4,(-1*a-4*w-1)*4,(-1*a-4*w+1)*4,(-1*a-4*w)*4
		dc.l	(-4*w-3)*4,(-4*w+3)*4,(-4*w-2)*4,(-4*w+2)*4,(-4*w-1)*4,(-4*w+1)*4,(-4*w)*4

		dc.l	(1*a-3*w-2)*4,(1*a-3*w+2)*4,(1*a-3*w-1)*4,(1*a-3*w+1)*4,(1*a-3*w)*4
		dc.l	(-1*a-3*w-2)*4,(-1*a-3*w+2)*4,(-1*a-3*w-1)*4,(-1*a-3*w+1)*4,(-1*a-3*w)*4
		dc.l	(-3*w-3)*4,(-3*w+3)*4,(-3*w-2)*4,(-3*w+2)*4,(-3*w-1)*4,(-3*w+1)*4,(-3*w)*4

		dc.l	(1*a-2*w-2)*4,(1*a-2*w+2)*4,(1*a-2*w-1)*4,(1*a-2*w+1)*4,(1*a-2*w)*4
		dc.l	(-1*a-2*w-2)*4,(-1*a-2*w+2)*4,(-1*a-2*w-1)*4,(-1*a-2*w+1)*4,(-1*a-2*w)*4
		dc.l	(-2*w-2)*4,(-2*w+2)*4,(-2*w-1)*4,(-2*w+1)*4,(-2*w)*4

		dc.l	(1*a-1*w-1)*4,(1*a-1*w+1)*4,(1*a-1*w)*4
		dc.l	(-1*a-1*w-1)*4,(-1*a-1*w+1)*4,(-1*a-1*w)*4
		dc.l	(-1*w-1)*4,(-1*w+1)*4,(-1*w)*4

		dc.l	(1*a-1)*4,(1*a+1)*4,(1*a)*4
		dc.l	(-1*a-1)*4,(-1*a+1)*4,(-1*a)*4
		dc.l	(-1)*4,(+1)*4,(0)*4

east		dc.l	(1*a-2*w+4)*4,(1*a+2*w+4)*4,(1*a-1*w+4)*4,(1*a+1*w+4)*4,(1*a+4)*4
		dc.l	(-1*a-2*w+4)*4,(-1*a+2*w+4)*4,(-1*a-1*w+4)*4,(-1*a+1*w+4)*4,(-1*a+4)*4
		dc.l	(-3*w+4)*4,(+3*w+4)*4,(-2*w+4)*4,(+2*w+4)*4,(-1*w+4)*4,(+1*w+4)*4,(+4)*4

		dc.l	(1*a-2*w+3)*4,(1*a+2*w+3)*4,(1*a-1*w+3)*4,(1*a+1*w+3)*4,(1*a+3)*4
		dc.l	(-1*a-2*w+3)*4,(-1*a+2*w+3)*4,(-1*a-1*w+3)*4,(-1*a+1*w+3)*4,(-1*a+3)*4
		dc.l	(-3*w+3)*4,(+3*w+3)*4,(-2*w+3)*4,(+2*w+3)*4,(-1*w+3)*4,(+1*w+3)*4,(+3)*4

		dc.l	(1*a-2*w+2)*4,(1*a+2*w+2)*4,(1*a-1*w+2)*4,(1*a+1*w+2)*4,(1*a+2)*4
		dc.l	(-1*a-2*w+2)*4,(-1*a+2*w+2)*4,(-1*a-1*w+2)*4,(-1*a+1*w+2)*4,(-1*a+2)*4
		dc.l	(-2*w+2)*4,(+2*w+2)*4,(-1*w+2)*4,(+1*w+2)*4,(+2)*4

		dc.l	(1*a-1*w+1)*4,(1*a+1*w+1)*4,(1*a+1)*4
		dc.l	(-1*a-1*w+1)*4,(-1*a+1*w+1)*4,(-1*a+1)*4
		dc.l	(-1*w+1)*4,(+1*w+1)*4,(+1)*4

		dc.l	(1*a-1*w)*4,(1*a+1*w)*4,(1*a)*4
		dc.l	(-1*a-1*w)*4,(-1*a+1*w)*4,(-1*a)*4
		dc.l	(-1*w)*4,(+1*w)*4,(0*w)*4

south		dc.l	(1*a+4*w+2)*4,(1*a+4*w-2)*4,(1*a+4*w+1)*4,(1*a+4*w-1)*4,(1*a+4*w)*4
		dc.l	(-1*a+4*w+2)*4,(-1*a+4*w-2)*4,(-1*a+4*w+1)*4,(-1*a+4*w-1)*4,(-1*a+4*w)*4
		dc.l	(+4*w+3)*4,(+4*w-3)*4,(+4*w+2)*4,(+4*w-2)*4,(+4*w+1)*4,(+4*w-1)*4,(+4*w)*4

		dc.l	(1*a+3*w+2)*4,(1*a+3*w-2)*4,(1*a+3*w+1)*4,(1*a+3*w-1)*4,(1*a+3*w)*4
		dc.l	(-1*a+3*w+2)*4,(-1*a+3*w-2)*4,(-1*a+3*w+1)*4,(-1*a+3*w-1)*4,(-1*a+3*w)*4
		dc.l	(+3*w+3)*4,(+3*w-3)*4,(+3*w+2)*4,(+3*w-2)*4,(+3*w+1)*4,(+3*w-1)*4,(+3*w)*4

		dc.l	(1*a+2*w+2)*4,(1*a+2*w-2)*4,(1*a+2*w+1)*4,(1*a+2*w-1)*4,(1*a+2*w)*4
		dc.l	(-1*a+2*w+2)*4,(-1*a+2*w-2)*4,(-1*a+2*w+1)*4,(-1*a+2*w-1)*4,(-1*a+2*w)*4
		dc.l	(+2*w+2)*4,(+2*w-2)*4,(+2*w+1)*4,(+2*w-1)*4,(+2*w)*4

		dc.l	(1*a+1*w+1)*4,(1*a+1*w-1)*4,(1*a+1*w)*4
		dc.l	(-1*a+1*w+1)*4,(-1*a+1*w-1)*4,(-1*a+1*w)*4
		dc.l	(+1*w+1)*4,(+1*w-1)*4,(+1*w)*4

		dc.l	(1*a+1)*4,(1*a-1)*4,(1*a)*4
		dc.l	(-1*a+1)*4,(-1*a-1)*4,(-1*a)*4
		dc.l	(+1)*4,(-1)*4,(0)*4

west		dc.l	(1*a+2*w-4)*4,(1*a-2*w-4)*4,(1*a+1*w-4)*4,(1*a-1*w-4)*4,(1*a-4)*4
		dc.l	(-1*a+2*w-4)*4,(-1*a-2*w-4)*4,(-1*a+1*w-4)*4,(-1*a-1*w-4)*4,(-1*a-4)*4
		dc.l	(+3*w-4)*4,(-3*w-4)*4,(+2*w-4)*4,(-2*w-4)*4,(+1*w-4)*4,(-1*w-4)*4,(-4)*4

		dc.l	(1*a+2*w-3)*4,(1*a-2*w-3)*4,(1*a+1*w-3)*4,(1*a-1*w-3)*4,(1*a-3)*4
		dc.l	(-1*a+2*w-3)*4,(-1*a-2*w-3)*4,(-1*a+1*w-3)*4,(-1*a-1*w-3)*4,(-1*a-3)*4
		dc.l	(+3*w-3)*4,(-3*w-3)*4,(+2*w-3)*4,(-2*w-3)*4,(+1*w-3)*4,(-1*w-3)*4,(-3)*4

		dc.l	(1*a+2*w-2)*4,(1*a-2*w-2)*4,(1*a+1*w-2)*4,(1*a-1*w-2)*4,(1*a-2)*4
		dc.l	(-1*a+2*w-2)*4,(-1*a-2*w-2)*4,(-1*a+1*w-2)*4,(-1*a-1*w-2)*4,(-1*a-2)*4
		dc.l	(+2*w-2)*4,(-2*w-2)*4,(+1*w-2)*4,(-1*w-2)*4,(-2)*4

		dc.l	(1*a+1*w-1)*4,(1*a-1*w-1)*4,(1*a-1)*4
		dc.l	(-1*a+1*w-1)*4,(-1*a-1*w-1)*4,(-1*a-1)*4
		dc.l	(+1*w-1)*4,(-1*w-1)*4,(-1)*4

		dc.l	(1*a+1*w)*4,(1*a-1*w)*4,(1*a)*4
		dc.l	(-1*a+1*w)*4,(-1*a-1*w)*4,(-1*a)*4
		dc.l	(+1*w)*4,(-1*w)*4,(0*w)*4

audio_dist
		dc.b	63,58,53,47,42,37,32,26,21,16,11,5
		dc.b	58,56,51,46,41,36,31,26,21,15,10,5
		dc.b	53,51,48,44,40,35,30,25,20,15,9,4
		dc.b	47,46,44,41,37,32,28,23,18,13,8,3
		dc.b	42,41,40,37,33,29,25,21,16,11,6,2
		dc.b	37,36,35,32,29,26,22,18,13,9,4,0
		dc.b	32,31,30,28,25,22,18,15,11,6,2,0
		dc.b	26,26,25,23,21,18,15,11,7,3,0,0
		dc.b	21,21,20,18,16,13,11,7,4,0,0,0
		dc.b	16,15,15,13,11,9,6,3,0,0,0,0
		dc.b	11,10,9,8,6,4,2,0,0,0,0,0
		dc.b	5,5,4,3,2,0,0,0,0,0,0,0
		dc.b	58,56,51,46,41,36,31,26,21,15,10,5
		dc.b	56,54,50,46,41,36,31,26,20,15,10,5
		dc.b	51,50,47,43,39,34,29,24,19,14,9,4
		dc.b	46,46,43,40,36,32,27,23,18,13,8,3
		dc.b	41,41,39,36,33,29,25,20,16,11,6,1
		dc.b	36,36,34,32,29,26,22,18,13,9,4,0
		dc.b	31,31,29,27,25,22,18,14,10,6,2,0
		dc.b	26,26,24,23,20,18,14,11,7,3,0,0
		dc.b	21,20,19,18,16,13,10,7,3,0,0,0
		dc.b	15,15,14,13,11,9,6,3,0,0,0,0
		dc.b	10,10,9,8,6,4,2,0,0,0,0,0
		dc.b	5,5,4,3,1,0,0,0,0,0,0,0
		dc.b	53,51,48,44,40,35,30,25,20,15,9,4
		dc.b	51,50,47,43,39,34,29,24,19,14,9,4
		dc.b	48,47,45,41,37,33,28,23,18,13,8,3
		dc.b	44,43,41,38,35,31,26,22,17,12,7,2
		dc.b	40,39,37,35,32,28,24,19,15,10,5,1
		dc.b	35,34,33,31,28,24,21,17,12,8,3,0
		dc.b	30,29,28,26,24,21,17,13,9,5,1,0
		dc.b	25,24,23,22,19,17,13,10,6,2,0,0
		dc.b	20,19,18,17,15,12,9,6,3,0,0,0
		dc.b	15,14,13,12,10,8,5,2,0,0,0,0
		dc.b	9,9,8,7,5,3,1,0,0,0,0,0
		dc.b	4,4,3,2,1,0,0,0,0,0,0,0
		dc.b	47,46,44,41,37,32,28,23,18,13,8,3
		dc.b	46,46,43,40,36,32,27,23,18,13,8,3
		dc.b	44,43,41,38,35,31,26,22,17,12,7,2
		dc.b	41,40,38,36,32,29,24,20,15,11,6,1
		dc.b	37,36,35,32,29,26,22,18,13,9,4,0
		dc.b	32,32,31,29,26,23,19,15,11,7,2,0
		dc.b	28,27,26,24,22,19,16,12,8,4,0,0
		dc.b	23,23,22,20,18,15,12,9,5,1,0,0
		dc.b	18,18,17,15,13,11,8,5,2,0,0,0
		dc.b	13,13,12,11,9,7,4,1,0,0,0,0
		dc.b	8,8,7,6,4,2,0,0,0,0,0,0
		dc.b	3,3,2,1,0,0,0,0,0,0,0,0
		dc.b	42,41,40,37,33,29,25,21,16,11,6,2
		dc.b	41,41,39,36,33,29,25,20,16,11,6,1
		dc.b	40,39,37,35,32,28,24,19,15,10,5,1
		dc.b	37,36,35,32,29,26,22,18,13,9,4,0
		dc.b	33,33,32,29,27,23,20,16,12,7,3,0
		dc.b	29,29,28,26,23,20,17,13,9,5,1,0
		dc.b	25,25,24,22,20,17,14,10,6,2,0,0
		dc.b	21,20,19,18,16,13,10,7,3,0,0,0
		dc.b	16,16,15,13,12,9,6,3,0,0,0,0
		dc.b	11,11,10,9,7,5,2,0,0,0,0,0
		dc.b	6,6,5,4,3,1,0,0,0,0,0,0
		dc.b	2,1,1,0,0,0,0,0,0,0,0,0
		dc.b	37,36,35,32,29,26,22,18,13,9,4,0
		dc.b	36,36,34,32,29,26,22,18,13,9,4,0
		dc.b	35,34,33,31,28,24,21,17,12,8,3,0
		dc.b	32,32,31,29,26,23,19,15,11,7,2,0
		dc.b	29,29,28,26,23,20,17,13,9,5,1,0
		dc.b	26,26,24,23,20,18,14,11,7,3,0,0
		dc.b	22,22,21,19,17,14,11,8,4,0,0,0
		dc.b	18,18,17,15,13,11,8,5,1,0,0,0
		dc.b	13,13,12,11,9,7,4,1,0,0,0,0
		dc.b	9,9,8,7,5,3,0,0,0,0,0,0
		dc.b	4,4,3,2,1,0,0,0,0,0,0,0
		dc.b	0,0,0,0,0,0,0,0,0,0,0,0
		dc.b	32,31,30,28,25,22,18,15,11,6,2,0
		dc.b	31,31,29,27,25,22,18,14,10,6,2,0
		dc.b	30,29,28,26,24,21,17,13,9,5,1,0
		dc.b	28,27,26,24,22,19,16,12,8,4,0,0
		dc.b	25,25,24,22,20,17,14,10,6,2,0,0
		dc.b	22,22,21,19,17,14,11,8,4,0,0,0
		dc.b	18,18,17,16,14,11,8,5,2,0,0,0
		dc.b	15,14,13,12,10,8,5,2,0,0,0,0
		dc.b	11,10,9,8,6,4,2,0,0,0,0,0
		dc.b	6,6,5,4,2,0,0,0,0,0,0,0
		dc.b	2,2,1,0,0,0,0,0,0,0,0,0
		dc.b	0,0,0,0,0,0,0,0,0,0,0,0
		dc.b	26,26,25,23,21,18,15,11,7,3,0,0
		dc.b	26,26,24,23,20,18,14,11,7,3,0,0
		dc.b	25,24,23,22,19,17,13,10,6,2,0,0
		dc.b	23,23,22,20,18,15,12,9,5,1,0,0
		dc.b	21,20,19,18,16,13,10,7,3,0,0,0
		dc.b	18,18,17,15,13,11,8,5,1,0,0,0
		dc.b	15,14,13,12,10,8,5,2,0,0,0,0
		dc.b	11,11,10,9,7,5,2,0,0,0,0,0
		dc.b	7,7,6,5,3,1,0,0,0,0,0,0
		dc.b	3,3,2,1,0,0,0,0,0,0,0,0
		dc.b	0,0,0,0,0,0,0,0,0,0,0,0
		dc.b	0,0,0,0,0,0,0,0,0,0,0,0
		dc.b	21,21,20,18,16,13,11,7,4,0,0,0
		dc.b	21,20,19,18,16,13,10,7,3,0,0,0
		dc.b	20,19,18,17,15,12,9,6,3,0,0,0
		dc.b	18,18,17,15,13,11,8,5,2,0,0,0
		dc.b	16,16,15,13,12,9,6,3,0,0,0,0
		dc.b	13,13,12,11,9,7,4,1,0,0,0,0
		dc.b	11,10,9,8,6,4,2,0,0,0,0,0
		dc.b	7,7,6,5,3,1,0,0,0,0,0,0
		dc.b	4,3,3,2,0,0,0,0,0,0,0,0
		dc.b	0,0,0,0,0,0,0,0,0,0,0,0
		dc.b	0,0,0,0,0,0,0,0,0,0,0,0
		dc.b	0,0,0,0,0,0,0,0,0,0,0,0
		dc.b	16,15,15,13,11,9,6,3,0,0,0,0
		dc.b	15,15,14,13,11,9,6,3,0,0,0,0
		dc.b	15,14,13,12,10,8,5,2,0,0,0,0
		dc.b	13,13,12,11,9,7,4,1,0,0,0,0
		dc.b	11,11,10,9,7,5,2,0,0,0,0,0
		dc.b	9,9,8,7,5,3,0,0,0,0,0,0
		dc.b	6,6,5,4,2,0,0,0,0,0,0,0
		dc.b	3,3,2,1,0,0,0,0,0,0,0,0
		dc.b	0,0,0,0,0,0,0,0,0,0,0,0
		dc.b	0,0,0,0,0,0,0,0,0,0,0,0
		dc.b	0,0,0,0,0,0,0,0,0,0,0,0
		dc.b	0,0,0,0,0,0,0,0,0,0,0,0
		dc.b	11,10,9,8,6,4,2,0,0,0,0,0
		dc.b	10,10,9,8,6,4,2,0,0,0,0,0
		dc.b	9,9,8,7,5,3,1,0,0,0,0,0
		dc.b	8,8,7,6,4,2,0,0,0,0,0,0
		dc.b	6,6,5,4,3,1,0,0,0,0,0,0
		dc.b	4,4,3,2,1,0,0,0,0,0,0,0
		dc.b	2,2,1,0,0,0,0,0,0,0,0,0
		dc.b	0,0,0,0,0,0,0,0,0,0,0,0
		dc.b	0,0,0,0,0,0,0,0,0,0,0,0
		dc.b	0,0,0,0,0,0,0,0,0,0,0,0
		dc.b	0,0,0,0,0,0,0,0,0,0,0,0
		dc.b	0,0,0,0,0,0,0,0,0,0,0,0
		dc.b	5,5,4,3,2,0,0,0,0,0,0,0
		dc.b	5,5,4,3,1,0,0,0,0,0,0,0
		dc.b	4,4,3,2,1,0,0,0,0,0,0,0
		dc.b	3,3,2,1,0,0,0,0,0,0,0,0
		dc.b	2,1,1,0,0,0,0,0,0,0,0,0
		dc.b	0,0,0,0,0,0,0,0,0,0,0,0
		dc.b	0,0,0,0,0,0,0,0,0,0,0,0
		dc.b	0,0,0,0,0,0,0,0,0,0,0,0
		dc.b	0,0,0,0,0,0,0,0,0,0,0,0
		dc.b	0,0,0,0,0,0,0,0,0,0,0,0
		dc.b	0,0,0,0,0,0,0,0,0,0,0,0
		dc.b	0,0,0,0,0,0,0,0,0,0,0,0
