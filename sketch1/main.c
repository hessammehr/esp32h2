#include <stdint.h>

#define UART0_BASE      0x60000000u
#define UART_FIFO_REG   (UART0_BASE + 0x00u)

static inline void mmio_write32(uint32_t addr, uint32_t v) {
    *(volatile uint32_t *)addr = v;
}

static void delay_cycles(volatile uint32_t cycles) {
    while (cycles--) {
        __asm__ volatile ("nop");
    }
}

// "Best effort" TX: write a byte to FIFO and pause a little so we don't overflow
// if we don't (yet) know the exact FIFO count bits for ESP32-H2 UART.
static void uart0_putc(char c) {
    mmio_write32(UART_FIFO_REG, (uint32_t)(uint8_t)c);
    delay_cycles(2000);
}

static void uart0_puts(const char *s) {
    while (*s) {
        if (*s == '\n') uart0_putc('\r');
        uart0_putc(*s++);
    }
}

int main(void) {
    uart0_puts("\n[ram] hello from bare-metal ESP32-H2 (zig cc)\n");

    // keep alive
    while (1) {
        uart0_puts("[ram] tick\n");
        delay_cycles(2000000);
    }
}