#-------------------------------------------------------------------------------
# Check for ARDUINO_ROOT

if(NOT DEFINED ENV{ARDUINO_ROOT})
   message(FATAL_ERROR "Envionment variable ARDUINO_ROOT must be defined and point to the 'hardware' directory.")
endif()

set(ARDUINO_ROOT $ENV{ARDUINO_ROOT})

#-------------------------------------------------------------------------------
# Configure compilation and linking

set(CMAKE_SYSTEM_NAME Generic)

include_directories(Gamebuino-Classic)
include_directories("${ARDUINO_ROOT}/arduino/avr/cores/arduino")
include_directories("${ARDUINO_ROOT}/arduino/avr/variants/standard")
include_directories("${ARDUINO_ROOT}/arduino/avr/libraries/SPI/src")
include_directories("${ARDUINO_ROOT}/tools/avr/avr/include")

set(CMAKE_BUILD_TYPE Release)

set(CMAKE_C_FLAGS_RELEASE   "-g -Os -w \
                             -fpermissive -fno-exceptions -ffunction-sections \
                             -fdata-sections -fno-threadsafe-statics \
                             -Wno-error=narrowing -MMD -mmcu=atmega328p \
                             -DF_CPU=16000000L -DARDUINO=10813 \
                             -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR")

set(CMAKE_CXX_FLAGS_RELEASE "-std=gnu++11 ${CMAKE_C_FLAGS_RELEASE}")

set(bin_prefix              "${ARDUINO_ROOT}/tools/avr/bin/avr-")

set(CMAKE_ASM_COMPILER      ${bin_prefix}as)
set(CMAKE_C_COMPILER        ${bin_prefix}gcc)
set(CMAKE_CXX_COMPILER      ${bin_prefix}g++)
set(CMAKE_AR                ${bin_prefix}ar)
set(CMAKE_RANLIB            ${bin_prefix}ranlib)
set(CMAKE_OBJCOPY           ${bin_prefix}objcopy)
set(CMAKE_OBJDUMP           ${bin_prefix}objdump)
set(CMAKE_SIZE              ${bin_prefix}size)

set(ld_flags "-w -Os -g -Wl,--gc-sections -mmcu=atmega328p")

set(CMAKE_CXX_LINK_EXECUTABLE
    "${bin_prefix}g++ ${ld_flags} <OBJECTS> -o <TARGET>.elf <LINK_LIBRARIES>; \
     ${CMAKE_OBJCOPY} -O ihex -j .eeprom --set-section-flags=.eeprom=alloc,load --no-change-warnings --change-section-lma .eeprom=0 \
                     <TARGET>.elf <TARGET>.eep; \
     ${CMAKE_OBJCOPY} -O ihex -R .eeprom <TARGET>.elf <TARGET>.hex; \
     ${CMAKE_SIZE} <TARGET>.elf")

#-------------------------------------------------------------------------------
# Build libarduino.a and libgamebuino.a libraries

add_library(arduino
            ${ARDUINO_ROOT}/arduino/avr/cores/arduino/main.cpp
            ${ARDUINO_ROOT}/arduino/avr/cores/arduino/CDC.cpp
            ${ARDUINO_ROOT}/arduino/avr/cores/arduino/HardwareSerial.cpp
            ${ARDUINO_ROOT}/arduino/avr/cores/arduino/HardwareSerial0.cpp
            ${ARDUINO_ROOT}/arduino/avr/cores/arduino/HardwareSerial1.cpp
            ${ARDUINO_ROOT}/arduino/avr/cores/arduino/HardwareSerial2.cpp
            ${ARDUINO_ROOT}/arduino/avr/cores/arduino/HardwareSerial3.cpp
            ${ARDUINO_ROOT}/arduino/avr/cores/arduino/IPAddress.cpp
            ${ARDUINO_ROOT}/arduino/avr/cores/arduino/PluggableUSB.cpp
            ${ARDUINO_ROOT}/arduino/avr/cores/arduino/Print.cpp
            ${ARDUINO_ROOT}/arduino/avr/cores/arduino/Stream.cpp
            ${ARDUINO_ROOT}/arduino/avr/cores/arduino/Tone.cpp
            ${ARDUINO_ROOT}/arduino/avr/cores/arduino/USBCore.cpp
            ${ARDUINO_ROOT}/arduino/avr/cores/arduino/WInterrupts.c
            ${ARDUINO_ROOT}/arduino/avr/cores/arduino/WMath.cpp
            ${ARDUINO_ROOT}/arduino/avr/cores/arduino/WString.cpp
            ${ARDUINO_ROOT}/arduino/avr/cores/arduino/abi.cpp
            ${ARDUINO_ROOT}/arduino/avr/cores/arduino/hooks.c
            ${ARDUINO_ROOT}/arduino/avr/cores/arduino/new.cpp
            ${ARDUINO_ROOT}/arduino/avr/cores/arduino/wiring.c
            ${ARDUINO_ROOT}/arduino/avr/cores/arduino/wiring_analog.c
            ${ARDUINO_ROOT}/arduino/avr/cores/arduino/wiring_digital.c
            ${ARDUINO_ROOT}/arduino/avr/cores/arduino/wiring_pulse.c
            ${ARDUINO_ROOT}/arduino/avr/cores/arduino/wiring_shift.c
            ${ARDUINO_ROOT}/arduino/avr/libraries/SPI/src/SPI.cpp)

add_library(gamebuino
            Gamebuino-Classic/Gamebuino.cpp
            Gamebuino-Classic/utility/font3x5.c
            Gamebuino-Classic/utility/settings.c
            Gamebuino-Classic/utility/font5x7.c
            Gamebuino-Classic/utility/font3x3.c
            Gamebuino-Classic/utility/Buttons.cpp
            Gamebuino-Classic/utility/Display.cpp
            Gamebuino-Classic/utility/Sound.cpp
            Gamebuino-Classic/utility/Battery.cpp
            Gamebuino-Classic/utility/Backlight.cpp)

link_libraries(gamebuino arduino m)
