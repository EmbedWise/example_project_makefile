# Makefile
#
# Author: "Bob Peters (bob@embedwise.com)"
#
# Description: This is Makefile for an example project program. This
# 	Typing 'make' will create the executable file example.


# Define the directories
IDIR=inc
ODIR=obj
SDIR=src

# define some Makefile variables for the compiler and compiler flags
# to use Makefile variables later in the Makefile: $()
#
#  -g    adds debugging information to the executable file
#  -Wall turn on most compiler warnings
#
# for C define  CC = gcc
CC = gcc
CFLAGS  = -g -Wall -I$(IDIR)

DEPS = example.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = example.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))


# typing 'make' will invoke the "all"
all: example

$(ODIR)/%.o: $(SDIR)/%.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

example: $(OBJ)
	gcc -o $@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ example 