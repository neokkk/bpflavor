KERNEL ?= /lib/modules/$(shell uname -r)/build/

BIN=loader
OBJS=loader.o bpf_load.o

CC=clang
CFLAGS=-O2 -Wall -g
LDFLAGS=-lelf -lbpf

all: $(BIN)
	clang -O2 -target bpf -c hello_bpf.c -o hello_bpf.o

$(BIN): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS) $(INCLUDES)

%.o: %.c
	$(CC) $(CFLAGS) -c $< $(INCLUDES)

.PHONY: clean
clean:
	rm -f $(BIN) $(OBJS)
