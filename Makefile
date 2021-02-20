#---------------------------------------------------------------------
# Edit paths below for your system

export ARDUINO_ROOT = /Applications/Arduino.app/Contents/Java/hardware
SD_CARD             = /Volumes/MAKERBUINO

# Value of EXECUTABLE should match executable name used in CMakeLists.txt
EXECUTABLE = HELLO
BUILD_DIR  = build

#---------------------------------------------------------------------

all:
	mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR); cmake ..; make

clean:
	rm -rf $(BUILD_DIR)

send:
	cp $(BUILD_DIR)/$(EXECUTABLE).HEX $(SD_CARD)
