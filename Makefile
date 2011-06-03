
.PHONY: all brainfuck c binary clean test

all: brainfuck c binary

brainfuck: pfuck.0.b pfuck.-1.b

c: pfuck.0.c pfuck.-1.c

binary: pfuck.0 pfuck.-1

test: all
	$(MAKE) -C test/

clean:
	rm -f pfuck.0.b pfuck.0.c pfuck.0 pfuck.-1.b pfuck.-1.c pfuck.-1
	$(MAKE) -C test/ clean

pfuck.-1.b: PEBBLEFLAGS += -e -1
pfuck.-1.c: PEBBLEFLAGS += -e -1
pfuck.0.b: PEBBLEFLAGS += -e 0
pfuck.0.c: PEBBLEFLAGS += -e 0

pfuck.%.b: pfuck.bfm
	$(PEBBLE) $(PEBBLEFLAGS) -o $@ -f $<

pfuck.%.c: pfuck.bfm
	$(PEBBLE) $(PEBBLEFLAGS) -o $@ -f $< -lang c

pfuck.%:: pfuck.%.c
	$(CC) $(CFLAGS) -o $@ $<
