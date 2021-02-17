
#---------------------------------------------------------------------

export ARDUINO_ROOT = /Applications/Arduino.app/Contents/Java/hardware
export EXECUTABLE   = HELLO
BUILD_DIR           = build
SD_CARD             = /Volumes/MAKERBUINO

#---------------------------------------------------------------------

all:
	mkdir -p $(BUILD_DIR)
	cd $(BUILD_DIR); cmake ..; make

clean:
	rm -rf $(BUILD_DIR)

send:
	cp $(BUILD_DIR)/$(EXECUTABLE).HEX $(SD_CARD)
