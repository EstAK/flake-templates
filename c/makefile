##
# Blank C project
#
# @file
# @version 0.1

CC = gcc

CFLAGS = -Wall -Wextra -Werror -Wnonnull
LFLAGS = -Iinclude/

SRCS = $(shell find . -name "*.c" ! -name "main.c")
OBJS = $(SRCS:.c=.o)


.PHONY: debug release clean

debug: CFLAGS += -g -O1
debug: main

release: CFLAGS += -O2
release: main

main: src/main.c $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^ $(LFLAGS)

src/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@ $(LFLAGS)

clean:
	rm main $(OBJS)

# end
