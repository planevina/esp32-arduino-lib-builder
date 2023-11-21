# ESP32 Arduino Lib Builder [![ESP32 Arduino Libs CI](https://github.com/espressif/esp32-arduino-lib-builder/actions/workflows/push.yml/badge.svg)](https://github.com/espressif/esp32-arduino-lib-builder/actions/workflows/push.yml)

This repository contains the scripts that produce the libraries included with esp32-arduino.

Tested on Ubuntu (32 and 64 bit), Raspberry Pi and MacOS.

### Build on Ubuntu and Raspberry Pi
```bash
git clone -b release/v2.0.13 https://github.com/esp-arduino-libs/esp32-arduino-lib-builder.git
cd esp32-arduino-lib-builder

// Build all targets
./build.sh

// Build specific targets, e.g. ESP32-S3
./build.sh -t esp32s3
```
