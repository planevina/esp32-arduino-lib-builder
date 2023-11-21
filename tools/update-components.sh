#/bin/bash

source ./tools/config.sh

AR_REPO_COMMIT="447f6db6"
CAMERA_REPO_URL="https://github.com/espressif/esp32-camera.git"
CAMERA_REPO_COMMIT="e689c3b"
DL_REPO_URL="https://github.com/espressif/esp-dl.git"
DL_REPO_COMMIT="0632d24"
RMAKER_REPO_URL="https://github.com/espressif/esp-rainmaker.git"
RMAKER_REPO_COMMIT="b001a86"
INSIGHTS_REPO_URL="https://github.com/espressif/esp-insights.git"
DSP_REPO_URL="https://github.com/espressif/esp-dsp.git"
DSP_REPO_COMMIT="8997ed9"
LITTLEFS_REPO_URL="https://github.com/joltwallet/esp_littlefs.git"
LITTLEFS_REPO_COMMIT="9eeac09"
TINYUSB_REPO_URL="https://github.com/hathach/tinyusb.git"
TINYUSB_REPO_COMMIT="39a64334a"

#
# CLONE/UPDATE ARDUINO
#
echo "Updating ESP32 Arduino..."
if [ ! -d "$AR_COMPS/arduino" ]; then
	git clone $AR_REPO_URL "$AR_COMPS/arduino" && \
	git -C "$AR_COMPS/arduino" checkout --recurse-submodules ${AR_REPO_COMMIT} && \
	git -C "$AR_COMPS/arduino" submodule update --init --recursive
else
	git -C "$AR_COMPS/arduino" checkout --recurse-submodules ${AR_REPO_COMMIT} && \
	git -C "$AR_COMPS/arduino" submodule update --init --recursive
fi
if [ $? -ne 0 ]; then exit 1; fi

#
# CLONE/UPDATE ESP32-CAMERA
#
echo "Updating ESP32 Camera..."
if [ ! -d "$AR_COMPS/esp32-camera" ]; then
	git clone $CAMERA_REPO_URL "$AR_COMPS/esp32-camera" && \
	git -C "$AR_COMPS/esp32-camera" checkout --recurse-submodules ${CAMERA_REPO_COMMIT} && \
	git -C "$AR_COMPS/esp32-camera" submodule update --init --recursive
else
	git -C "$AR_COMPS/esp32-camera" checkout --recurse-submodules ${CAMERA_REPO_COMMIT} && \
	git -C "$AR_COMPS/esp32-camera" submodule update --init --recursive
fi
#this is a temp measure to fix build issue
# if [ -f "$AR_COMPS/esp32-camera/idf_component.yml" ]; then
# 	rm -rf "$AR_COMPS/esp32-camera/idf_component.yml"
# fi
if [ $? -ne 0 ]; then exit 1; fi

#
# CLONE/UPDATE ESP-DL
#
echo "Updating ESP-DL..."
if [ ! -d "$AR_COMPS/esp-dl" ]; then
	git clone $DL_REPO_URL "$AR_COMPS/esp-dl" && \
	git -C "$AR_COMPS/esp-dl" checkout --recurse-submodules ${DL_REPO_COMMIT} && \
	git -C "$AR_COMPS/esp-dl" submodule update --init --recursive
else
	git -C "$AR_COMPS/esp-dl" checkout --recurse-submodules ${DL_REPO_COMMIT} && \
	git -C "$AR_COMPS/esp-dl" submodule update --init --recursive
fi
if [ $? -ne 0 ]; then exit 1; fi

#
# CLONE/UPDATE ESP-LITTLEFS
#
echo "Updating ESP-LITTLEFS..."
if [ ! -d "$AR_COMPS/esp_littlefs" ]; then
	git clone $LITTLEFS_REPO_URL "$AR_COMPS/esp_littlefs" && \
	git -C "$AR_COMPS/esp_littlefs" checkout --recurse-submodules ${LITTLEFS_REPO_COMMIT} && \
	git -C "$AR_COMPS/esp_littlefs" submodule update --init --recursive
else
	git -C "$AR_COMPS/esp_littlefs" checkout --recurse-submodules ${LITTLEFS_REPO_COMMIT} && \
	git -C "$AR_COMPS/esp_littlefs" submodule update --init --recursive
fi
if [ $? -ne 0 ]; then exit 1; fi

#
# CLONE/UPDATE ESP-RAINMAKER
#
echo "Updating ESP-RainMaker..."
if [ ! -d "$AR_COMPS/esp-rainmaker" ]; then
    git clone $RMAKER_REPO_URL "$AR_COMPS/esp-rainmaker" && \
	git -C "$AR_COMPS/esp-rainmaker" checkout --recurse-submodules ${RMAKER_REPO_COMMIT} && \
	git -C "$AR_COMPS/esp-rainmaker" submodule update --init --recursive
else
	git -C "$AR_COMPS/esp-rainmaker" checkout --recurse-submodules ${RMAKER_REPO_COMMIT} && \
	git -C "$AR_COMPS/esp-rainmaker" submodule update --init --recursive
fi
if [ $? -ne 0 ]; then exit 1; fi

#
# CLONE/UPDATE ESP-INSIGHTS
#
# echo "Updating ESP-Insights..."
# if [ ! -d "$AR_COMPS/esp-insights" ]; then
#     git clone $INSIGHTS_REPO_URL "$AR_COMPS/esp-insights" && \
#     git -C "$AR_COMPS/esp-insights" submodule update --init --recursive
# else
# 	git -C "$AR_COMPS/esp-insights" fetch && \
# 	git -C "$AR_COMPS/esp-insights" pull --ff-only && \
#     git -C "$AR_COMPS/esp-insights" submodule update --init --recursive
# fi
# if [ $? -ne 0 ]; then exit 1; fi

#
# CLONE/UPDATE ESP-DSP
#
echo "Updating ESP-DSP..."
if [ ! -d "$AR_COMPS/espressif__esp-dsp" ]; then
	git clone $DSP_REPO_URL "$AR_COMPS/espressif__esp-dsp" && \
	git -C "$AR_COMPS/espressif__esp-dsp" checkout --recurse-submodules ${DSP_REPO_COMMIT} && \
	git -C "$AR_COMPS/espressif__esp-dsp" submodule update --init --recursive
else
	git -C "$AR_COMPS/espressif__esp-dsp" checkout --recurse-submodules ${DSP_REPO_COMMIT} && \
	git -C "$AR_COMPS/espressif__esp-dsp" submodule update --init --recursive
fi
if [ $? -ne 0 ]; then exit 1; fi

#
# CLONE/UPDATE TINYUSB
#
echo "Updating TinyUSB..."
if [ ! -d "$AR_COMPS/arduino_tinyusb/tinyusb" ]; then
	git clone $TINYUSB_REPO_URL "$AR_COMPS/arduino_tinyusb/tinyusb" && \
	git -C "$AR_COMPS/arduino_tinyusb/tinyusb" checkout --recurse-submodules ${TINYUSB_REPO_COMMIT} && \
	git -C "$AR_COMPS/arduino_tinyusb/tinyusb" submodule update --init --recursive
else
	git -C "$AR_COMPS/arduino_tinyusb/tinyusb" checkout --recurse-submodules ${TINYUSB_REPO_COMMIT} && \
	git -C "$AR_COMPS/arduino_tinyusb/tinyusb" submodule update --init --recursive
fi
if [ $? -ne 0 ]; then exit 1; fi

