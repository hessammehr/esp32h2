# What is this repo for/about?
I'm a bit over Arduino, its minute-long compile times and massive binaries. I also don't want to wholesale adopt IDF. This repo is about building increasingly interesting projects for the ESP32H2, ideally converging towards a Matter over Thread appliance/controller using just the datasheet and maybe a vendor blobs or two. Let's see how far we can get.

## Hardware
I'm using the nice ESP32H2 Mini (aka ESP32-H2-Zero) board from Waveshare.

![board](https://www.waveshare.com/w/upload/4/4f/ESP32-H2-Zero-details-inter.jpg)

## Current sketches
* `sketch1`: Hello world over UART0 (not USB serial)

## Future sketches
* Control WS2812 RGB LED