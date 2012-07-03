#
# This will make a Windows executable using MinGW
#
# make -f makefile.mingw-dingoo-sdl.mak to create SDL build
#
#

APP_NAME = last-mission-dingoo-sdl

# compiler

CC = gcc

CFLAGS = -Wall -O1 -std=c99 -fms-extensions -D__GCC__ -D__DINGUX__

LFLAGS = -mwindows -lSDL -Wl,--strip-all

# source files

SRC = fmopl.c m_core.c m_aux.c m_snd.c m_demo.c	m_data.c m_gfx_data.c m_snd_data.c m_scr.c
SRC := $(SRC) m_gfx_dingoosdl.c m_snd_sdl.c


INC = $(foreach dir, ., $(wildcard $(dir)/*.h))
OBJ = $(patsubst %.c, %.o, $(SRC))

all : $(APP_NAME).exe

$(APP_NAME).exe : $(OBJ)
	$(CC) $^ $(LFLAGS) -o $@

%.o : %.c $(INC)
	$(CC) -c $(CFLAGS) $< -o $@

clean :
	rm -rf ./*.o $(APP_NAME).exe