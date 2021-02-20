#---------------------------------------------------------------------

# Value of EXECUTABLE should match executable name used in CMakeLists.txt
EXECUTABLE = HELLO

# XXX Edit path below for your system
SD_CARD    = /Volumes/MAKERBUINO

# If avr-gcc is already on $PATH then the following will not be
# necessary. If not then edit the path below for your system
# and uncomment the two lines
# ARDUINO_ROOT = /Applications/Arduino.app/Contents/Java/hardware
# export PATH := $(PATH):$(ARDUINO_ROOT)/tools/avr/bin

#---------------------------------------------------------------------

BUILD_DIR = build

all:
	mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR); cmake ..; make

clean:
	rm -rf $(BUILD_DIR)

send:
	cp $(BUILD_DIR)/$(EXECUTABLE).HEX $(SD_CARD)
