# Makefile for ITA TOOLBOX #6 rm

MAKE = make

AS = HAS060
ASFLAGS = -m 68000 -i $(INCLUDE)
LD = hlk
LDFLAGS = -x
CV = -CV -r
CP = cp
RM = -rm -f

INCLUDE = ../01-fish/include

DESTDIR   = A:/usr/ita
BACKUPDIR = B:/rm/1.4
RELEASE_ARCHIVE = RM14
RELEASE_FILES = MANIFEST README ../NOTICE ../DIRECTORY ../HUPAIR CHANGES rm.1 rm.x

EXTLIB = ../01-fish/lib/ita.l

###

PROGRAM = rm.x

###

.PHONY: all clean clobber install release backup

.TERMINAL: *.h *.s

%.r : %.x
	$(CV) $<

%.x : %.o $(EXTLIB)
	$(LD) $(LDFLAGS) $^

%.o : %.s
	$(AS) $(ASFLAGS) $<

###

all:: $(PROGRAM)

clean::

clobber:: clean
	$(RM) *.bak *.$$* *.o *.x

###

$(PROGRAM:.x=.o) : $(INCLUDE)/doscall.h $(INCLUDE)/chrcode.h

$(EXTLIB)::
	cd $(@D); $(MAKE) $(@F)

include ../Makefile.sub

###
