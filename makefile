include makefile.inc

SOURCES=$(wildcard *.c)
OBJECTS=$(SOURCES:.c=.o)


SOLVE_OUT = solve
PROCESS_OUT = process

all: $(SOLVE_OUT) $(PROCESS_OUT)

$(SOLVE_OUT): $(OBJECTS)

$(PROCESS_OUT):
	cd process; make all;

%.o: %.c
	$(CC) $(CFLAGS) -I./include -c $< -o $@

clean:
	rm -rf *.o solve  view
	cd process; make clean
	cd communication; rm -rf *.o

.PHONY: all clean process
