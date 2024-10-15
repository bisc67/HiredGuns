start		output	3dgame:test/hiredgunscd32/styles/Style03.gfx
		opt 	o+,ow-

		dc.l	grass-start
		dc.l    0
		dc.l	lift-start
		dc.l	puddle-start
		dc.l	light-start
		dc.l	stone-start
		dc.l	push-start
		dc.l	field-start
		dc.l	field-start
		dc.l	tree-start
		dc.l	field-start
		dc.l	field-start
		dc.l	hydraulic-start
		dc.l	mon1front-start
		dc.l	mon1left-start
		dc.l	mon1right-start
		dc.l	mon1back-start
		dc.l	mon2front-start
		dc.l	mon2left-start
		dc.l	mon2right-start
		dc.l	mon2back-start
                dc.l	stairs2out-start
                dc.l	stairs2right-start
                dc.l	stairs2left-start
                dc.l	stairs2in-start
                dc.l	door1front-start
                dc.l	door1side-start
                dc.l    0
                dc.l    0
		dc.l	text-start
		dc.l	butin-start
		dc.l	butout-start
		dc.l	eggclosed-start
		dc.l	eggopen-start
		dc.l	container1-start
		dc.l	container2-start
		dc.l	container3-start
		dc.l	container4-start
		dc.l	container5-start
		dc.l    0
                dc.l	stairs1out-start
                dc.l	stairs1right-start
                dc.l	stairs1left-start
                dc.l	stairs1in-start
                dc.l	door1openfront-start
		dc.l	door1openside-start
		dc.l	monster1dead-start
		dc.l	monster2dead-start
		dc.l	mapblocks-start

*******************************************************************************

mon1front	ds.b	3556
mon1left	ds.b	3556
mon1right	ds.b	3556
mon1back	ds.b	3556
mon2front	ds.b	3556
mon2left	ds.b	3556
mon2right	ds.b	3556
mon2back	ds.b	3556

monster1dead	ds.b	2486
monster2dead	ds.b	2486

grass		incbin	3Dgame:graphics/style4/raw/grass.bin
lift		incbin	3Dgame:graphics/misc/raw/lift.bin
puddle		incbin	3Dgame:graphics/misc/raw/puddle.bin
light		incbin	3Dgame:graphics/style4/raw/light.bin
stone		incbin	3Dgame:graphics/style4/raw/stone.bin
push		incbin	3Dgame:graphics/misc/raw/push.bin
tree		incbin	3Dgame:graphics/style4/raw/tree1.bin
field		incbin	3Dgame:graphics/misc/raw/field.bin
hydraulic	incbin	3Dgame:graphics/misc/raw/hydraulic.bin
stairs2out	incbin	3Dgame:graphics/style4/raw/stairs2out.bin
stairs2right	incbin	3Dgame:graphics/style4/raw/stairs2right.bin
stairs2left	incbin	3Dgame:graphics/style4/raw/stairs2left.bin
stairs2in	incbin	3Dgame:graphics/style4/raw/stairs2in.bin

door1front	incbin	3Dgame:graphics/style4/raw/door1front.bin
door1side	incbin	3Dgame:graphics/style4/raw/door1side.bin

text		incbin	3Dgame:graphics/misc/raw/PanelText.bin
butin		incbin	3Dgame:graphics/style3/raw/PanelButIn.bin
butout		incbin	3Dgame:graphics/style3/raw/PanelButOut.bin
eggclosed	incbin	3Dgame:graphics/misc/raw/EggClosed.bin
eggopen		incbin	3Dgame:graphics/misc/raw/EggOpen.bin
container1	incbin	3Dgame:graphics/misc/raw/Container1.bin
container2	incbin	3Dgame:graphics/misc/raw/Container2.bin
container3	incbin	3Dgame:graphics/misc/raw/Container3.bin
container4	incbin	3Dgame:graphics/misc/raw/Container4.bin
container5	incbin	3Dgame:graphics/misc/raw/Container5.bin
stairs1out	incbin	3Dgame:graphics/style4/raw/stairs1out.bin
stairs1right	incbin	3Dgame:graphics/style4/raw/stairs1right.bin
stairs1left	incbin	3Dgame:graphics/style4/raw/stairs1left.bin
stairs1in	incbin	3Dgame:graphics/style4/raw/stairs1in.bin
door1openfront	incbin	3Dgame:graphics/style4/raw/door1openfront.bin
door1openside	incbin	3Dgame:graphics/style4/raw/door1openside.bin

mapblocks	incbin	3Dgame:graphics/style4/raw/MapBlocks.bin

		end
