KERNEL ?= /lib/modules/$(shell uname -r)/build/

BIN=loader
OBJS=loader.o bpf_load.o hello_bpf.o

CC=clang
CFLAGS=-O2 -Wall -g
LDFLAGS=-lelf -lbpf

INCLUDES += -I$(KERNEL)/arch/$(ARCH)/include/generated/uapi
INCLUDES += -I$(KERNEL)/arch/$(ARCH)/include/generated
INCLUDES += -I$(KERNEL)/arch/$(ARCH)/include
INCLUDES += -I$(KERNEL)/arch/$(ARCH)/include/uapi
INCLUDES += -I$(KERNEL)/include
INCLUDES += -I$(KERNEL)/include/uapi
INCLUDES += -include $(KERNEL)/include/linux/kconfig.h
INCLUDES += -I$(KERNEL)/include/generated/uapi

all: $(BIN)

$(BIN): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS) $(INCLUDES)

$.o: %.c
	$(CC) $(CFLAGS) -c $< $(INCLUDES)

.PHONY: clean
clean:
	rm -f $(BIN) $(OBJS)
