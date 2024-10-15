VERNUM =	"1.0"
VERTYPE =	"HgIntro"

################################################################################
### AMIGA ######################################################################
################################################################################

AM_TARGET=	3dgame:test/hiredgunscd32/HiredGunsIntro

AM_OBJS=	source:amiforgames/distribution/lib/ami_amiga.o \
		intro.o

AM_CC =		sc
AM_CCOPTS =     Def VERNUM=$(VERNUM) Def VERTYPE=$(VERTYPE) \
		IDIR=source:framework/amiga \
		IDIR=source:framework/generic
AM_LINK =	slink
AM_LINKOPTS =	smallcode smalldata addsym noicons

################################################################################

amiga :		$(AM_TARGET)

$(AM_TARGET) :	$(AM_OBJS)
		$(AM_LINK) from $(AM_OBJS) to $(AM_TARGET) $(AM_LINKOPTS)

intro.o :	Intro.c \
		SCoptions
		$(AM_CC) Intro.c $(AM_CCOPTS)
