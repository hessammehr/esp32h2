ENTRY(_start)

MEMORY
{
  /* Stub flasher is resident at 0x40800000-0x40800e44. */
  RAM (rwx) : ORIGIN = 0x40801000, LENGTH = 256K - 0x1000
}

SECTIONS
{
  .text : {
    KEEP(*(.text.start))
    *(.text .text.*)
    *(.rodata .rodata.*)
  } > RAM

  .data : { *(.data .data.*) } > RAM

  .bss (NOLOAD) : {
    *(.bss .bss.*)
    *(COMMON)
  } > RAM

  . = ORIGIN(RAM) + LENGTH(RAM);
  _stack_top = .;
}