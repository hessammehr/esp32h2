SHELL := /bin/bash

.PHONY: all clean dump flash

PROJECT := sketch1
BUILD   := build

CC      := zig cc
OBJDUMP := zig objdump

CFLAGS  := -target riscv32-freestanding-none \
           -mcpu=generic_rv32+i+m+a+c  \
		   -fno-sanitize=all -fno-stack-protector \
           -ffreestanding -fno-builtin \
           -O2 \
           -Wall -Wextra -Werror

LDFLAGS := -nostdlib -Wl,-T,linker.ld

SRCS := start.S main.c
OBJS := $(addprefix $(BUILD)/,$(SRCS:.c=.o))
OBJS := $(OBJS:.S=.o)

all: $(BUILD)/$(PROJECT).elf

$(BUILD):
	mkdir -p $(BUILD)

$(BUILD)/%.o: %.c | $(BUILD)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD)/%.o: %.S | $(BUILD)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD)/$(PROJECT).elf: $(OBJS) linker.ld
	$(CC) $(CFLAGS) $(OBJS) -o $@ $(LDFLAGS)

dump: $(BUILD)/$(PROJECT).elf
	$(OBJDUMP) -d $(BUILD)/$(PROJECT).elf | less

$(BUILD)/%.bin: $(BUILD)/%.elf
	esptool --chip esp32h2 elf2image -o $@ $<

flash: $(BUILD)/$(PROJECT).bin
	esptool --chip esp32h2 -p /dev/tty.usbmodem3101 load-ram $<

clean:
	rm -rf $(BUILD)
