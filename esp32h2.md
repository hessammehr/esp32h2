# ESP32-H2-Zero (Waveshare) Quick Reference

## Core Specs
- **SoC:** ESP32-H2FH4S — RISC-V 32-bit single-core @ 96MHz
- **Flash:** 4MB (built-in)
- **Wireless:** BLE 5, IEEE 802.15.4 (Zigbee 3.0, Thread), Bluetooth Mesh
- **Antenna:** 2.4GHz ceramic, on-module
- **LDO:** ME6217C33M5G, 800mA max
- **USB:** Type-C (programming/debug)
- **LED:** WS2812 RGB on **GPIO8**
- **Dimensions:** 18.00 × 23.50 mm, 2.54mm pitch, castellated pads
- **Dev frameworks:** ESP-IDF, Arduino IDE

## Pinout

### Left side (top to bottom)
| Pad | GPIO | Functions |
|-----|------|-----------|
| 5V  | —    | 5V power rail |
| GND | —    | Ground |
| 3V3 | —    | 3.3V power rail |
| 0   | GPIO0  | FSPIQ, PWM |
| 1   | GPIO1  | ADC1_CH0, FSPICS0, PWM |
| 2   | GPIO2  | ADC1_CH1, FSPIWP, MTMS, PWM |
| 3   | GPIO3  | ADC1_CH2, FSPIHD, MTDO, PWM |
| 4   | GPIO4  | ADC1_CH3, FSPICLK, MTCK, PWM |
| 5   | GPIO5  | ADC1_CH4, FSPID, MTDI, PWM |

### Right side (top to bottom)
| Pad | GPIO | Functions |
|-----|------|-----------|
| TX  | GPIO24 | FSPICS2, UOTXD |
| RX  | GPIO23 | FSPICS1, UORXD |
| 25  | GPIO25 | FSPICS3 |
| 22  | GPIO22 | — |
| 14  | GPIO14 | XTAL_32K_N |
| 13  | GPIO13 | XTAL_32K_P |
| 12  | GPIO12 | — |
| 11  | GPIO11 | ZCD1 |
| 10  | GPIO10 | ZCD2 |

### Back side
| Pad | GPIO | Functions |
|-----|------|-----------|
| 27  | GPIO27 | FSPICS5, USB_D+, PWM |
| 26  | GPIO26 | FSPICS4, USB_D-, PWM |
| 9   | GPIO9  | BOOT (strapping pin) |
| 8   | GPIO8  | LOG, WS2812, PWM |

## ADC Channels
| Channel | GPIO |
|---------|------|
| ADC1_CH0 | GPIO1 |
| ADC1_CH1 | GPIO2 |
| ADC1_CH2 | GPIO3 |
| ADC1_CH3 | GPIO4 |
| ADC1_CH4 | GPIO5 |

## SPI (FSPI)
| Signal | GPIO |
|--------|------|
| FSPIQ (MISO) | GPIO0 |
| FSPICS0 | GPIO1 |
| FSPIWP | GPIO2 |
| FSPIHD | GPIO3 |
| FSPICLK | GPIO4 |
| FSPID (MOSI) | GPIO5 |
| FSPICS1 | GPIO23 |
| FSPICS2 | GPIO24 |
| FSPICS3 | GPIO25 |
| FSPICS4 | GPIO26 |
| FSPICS5 | GPIO27 |

## UART
| Signal | GPIO |
|--------|------|
| UOTXD (TX) | GPIO24 |
| UORXD (RX) | GPIO23 |

## JTAG
| Signal | GPIO |
|--------|------|
| MTMS | GPIO2 |
| MTDO | GPIO3 |
| MTCK | GPIO4 |
| MTDI | GPIO5 |

## USB (native)
| Signal | GPIO |
|--------|------|
| USB_D+ | GPIO27 |
| USB_D- | GPIO26 |

## Buttons
- **RST** — Reset
- **BOOT** — Hold + press RST to enter download mode (GPIO9)

## Board Components (numbered on silkscreen)
1. ESP32-H2FH4S module
2. WS2812 RGB LED
3. ME6217C33M5G LDO
4. 2.4G ceramic antenna
5. BOOT button
6. RST button
7. USB Type-C connector
8. Castellated pads (back)

## Notes
- All GPIO pins support PWM output
- GPIO9 is a strapping pin (BOOT); avoid driving at boot
- GPIO13/14 can be used for 32.768kHz crystal (XTAL_32K)
- GPIO10/11: zero-crossing detection (ZCD1/ZCD2)
- Castellated edges allow direct soldering to carrier boards

## Resources
- Wiki: https://www.waveshare.com/wiki/ESP32-H2-Zero
