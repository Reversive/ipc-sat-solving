include makefile.inc


PROCESS_SOURCES=master.c
PROCESS_OBJECTS=$(PROCESS_SOURCES:.c=.o)

SLAVE_SOURCES=slave.c
SLAVE_OBJECTS=$(SLAVE_SOURCES:.c=.o)

VIEW_SOURCES=view.c
VIEW_OBJECTS=$(VIEW_SOURCES:.c=.o)

COMMUNICATION_SOURCES=$(wildcard ../communication/*.c)
COMMUNICATION_OBJECTS=$(COMMUNICATION_SOURCES:.c=.o)

UTILS_SOURCES=../utils.c
UTILS_OBJECTS=$(UTILS_SOURCES:.c=.o)

MASTER_OUT = master
SLAVE_OUT = slave
VIEW_OUT = view


all: $(MASTER_OUT) $(SLAVE_OUT) $(VIEW_OUT) bin_move

$(MASTER_OUT): $(COMMUNICATION_OBJECTS) $(UTILS_OBJECTS) $(PROCESS_OBJECTS)

$(SLAVE_OUT): $(COMMUNICATION_OBJECTS)  $(UTILS_OBJECTS) $(SLAVE_OBJECTS)

$(VIEW_OUT): $(COMMUNICATION_OBJECTS)  $(UTILS_OBJECTS) $(VIEW_OBJECTS)

%.o: %.c
	$(CC) $(CFLAGS) -I./include -c $< -o $@ $(LDFLAGS) 
	mkdir -p bin

bin_move:
	mv $(MASTER_OUT) bin/
	mv $(SLAVE_OUT) bin/
	mv $(VIEW_OUT) ..

clean:
	rm -rf *.o bin/
.PHONY: all clean