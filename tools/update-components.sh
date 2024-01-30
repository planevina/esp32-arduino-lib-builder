#/bin/bash

source ./tools/config.sh

#
# CLONE/UPDATE TINYUSB
#
echo "Updating TinyUSB..."
TINYUSB_REPO_URL="https://github.com/hathach/tinyusb.git"
TINYUSB_REPO_DIR="$AR_COMPS/arduino_tinyusb/tinyusb"
TINYUSB_REPO_COMMIT="0877a486c"
if [ ! -d "$TINYUSB_REPO_DIR" ]; then
    git clone "$TINYUSB_REPO_URL" "$TINYUSB_REPO_DIR"
	git -C "$TINYUSB_REPO_DIR" checkout --recurse-submodules ${TINYUSB_REPO_COMMIT} && \
    git -C "$TINYUSB_REPO_DIR" submodule update --init --recursive
else
	git -C "$TINYUSB_REPO_DIR" fetch && \
	git -C "$TINYUSB_REPO_DIR" checkout --recurse-submodules ${TINYUSB_REPO_COMMIT} && \
    git -C "$TINYUSB_REPO_DIR" submodule update --init --recursive
fi

# #
# # CLONE/UPDATE esp32-camera
# #
# echo "Updating esp32-camera..."
# CAMERA_REPO_URL="https://github.com/espressif/esp32-camera.git"
# CAMERA_REPO_DIR="$AR_COMPS/espressif__esp32-camera"
# CAMERA_REPO_COMMIT="dba8da9898928d9808d57a0b0cdcde9f130ed8fe"
# if [ ! -d "$CAMERA_REPO_DIR" ]; then
#     git clone "$CAMERA_REPO_URL" "$CAMERA_REPO_DIR"
# 	git -C "$CAMERA_REPO_DIR" checkout --recurse-submodules ${CAMERA_REPO_COMMIT} && \
#     git -C "$CAMERA_REPO_DIR" submodule update --init --recursive
# else
# 	git -C "$CAMERA_REPO_DIR" fetch && \
# 	git -C "$CAMERA_REPO_DIR" checkout --recurse-submodules ${CAMERA_REPO_COMMIT} && \
#     git -C "$CAMERA_REPO_DIR" submodule update --init --recursive
# fi

# #
# # CLONE/UPDATE esp-dl
# #
# echo "Updating esp-dl..."
# CAMERA_REPO_URL="https://github.com/espressif/esp-dl.git"
# CAMERA_REPO_DIR="$AR_COMPS/espressif__esp-dl"
# CAMERA_REPO_COMMIT="79034eeb6a98e5dd896c1bf8e87403d562460078"
# if [ ! -d "$CAMERA_REPO_DIR" ]; then
#     git clone "$CAMERA_REPO_URL" "$CAMERA_REPO_DIR"
# 	git -C "$CAMERA_REPO_DIR" checkout --recurse-submodules ${CAMERA_REPO_COMMIT} && \
#     git -C "$CAMERA_REPO_DIR" submodule update --init --recursive
# else
# 	git -C "$CAMERA_REPO_DIR" fetch && \
# 	git -C "$CAMERA_REPO_DIR" checkout --recurse-submodules ${CAMERA_REPO_COMMIT} && \
#     git -C "$CAMERA_REPO_DIR" submodule update --init --recursive
# fi

if [ $? -ne 0 ]; then exit 1; fi
