#!/bin/bash
set -xue

QEMU=qemu-system-riscv64

# Path to clang and compiler flags
# mcmodel compiler flag to setup medium-any code model.
CC=clang 
CFLAGS="-std=c11 -O2 -g3 -Wall -Wextra --target=riscv64 -ffreestanding -nostdlib -mcmodel=medany"

# Build the kernel
$CC $CFLAGS -Wl,-Tkernel.ld -Wl,-Map=kernel.map -o kernel.elf \
    kernel.c

# Start QEMU
$QEMU -machine virt -bios default -nographic -serial mon:stdio --no-reboot \
    -kernel kernel.elf #Load the kernel