#!/bin/bash
set -xue

QEMU=qemu-system-riscv64

# new: Path to clang and compiler flags
CC=clang 
CFLAGS="-std=c11 -O2 -g3 -Wall -Wextra --target=riscv64 -ffreestanding -nostdlib -mcmodel=medany"

# new: Build the kernel
$CC $CFLAGS -Wl,-Tkernel.ld -Wl,-Map=kernel.map -o kernel.elf \
    kernel.c

# Start QEMU
$QEMU -machine virt -bios default -nographic -serial mon:stdio --no-reboot \
    -kernel kernel.elf # new: Load the kernel