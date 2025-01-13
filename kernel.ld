/* This is a linker script for our kernel
   It defines the memory layout for our kernel exxecutable
 
 
   Entry point of kernel is the boot function*/

ENTRY(boot)


SECTIONS {
    /* Our base address */
    . = 0x80200000;

    /* Memory allocation for code of the program. */
    .text :{
        KEEP(*(.text.boot));
        *(.text .text.*);
    }

    /* Memory allocation for read only data. */
    .rodata : ALIGN(4) {
        *(.rodata .rodata.*);
    }

    /* Memory allocation for read and write data. */
    .data : ALIGN(4) {
        *(.data .data.*);
    }

    /* Memory allocation for read and write initialized to zero */
    .bss : ALIGN(4) {
        __bss = .;
        *(.bss .bss.* .sbss .sbss.*);
        __bss_end = .;
    }

    . = ALIGN(4);
    . += 128 * 1024; /* 128KB */
    __stack_top = .;
}