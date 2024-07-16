#include "bpf_load.h"
#include <linux/bpf.h>
#include <stdio.h>

int main(int argc, char **argv) {
  if (load_bpf_file("hello_bpf.o") != 0) {
    printf("Fail to load BPF program\n");
    return 1;
  }

  read_trace_pipe();

  return 0;
}
