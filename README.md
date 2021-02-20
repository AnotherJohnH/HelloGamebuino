# Hello World example for Gamebuino-classic

Example command line build environment for Gamebuino-classic projects
without needing the Arduino IDE when using Linux or MacOS.

## How to build

### Source checkout

This git repo uses submodules, so to clone a copy use...

```
git clone --recurse-submodules https://github.com/AnotherJohnH/HelloGamebuino.git
```

### Build Dependencies

+ gcc-avr
+ libc-avr
+ cmake (*at least v3.11.4*)

### Build configuration

1) The `gcc-avr` and `libc-avr` dependencies can be satisfied by an install of
the [Arduino](https://www.arduino.cc/en/software) IDE. If this
approach is taken then the `ARDUINO_ROOT` path needs to be set in [Makefile](https://github.com/AnotherJohnH/HelloGamebuino/blob/main/Makefile)
so that `$(ARDUINO_ROOT)/tools/avr/bin` can be added to `$PATH`.

2) The [Makefile](https://github.com/AnotherJohnH/HelloGamebuino/blob/main/Makefile) should also be edited to contain the expected path for the SD
card when mounted.

### Build commands

To build `HELLO.HEX` from `hello.cpp`...
```
make
```

To clean away the build directory...
```
make clean
```

To copy `HELLO.HEX` to an SD card...
```
make send
```

## Customizing for a new project

+ In [Makefile](https://github.com/AnotherJohnH/HelloGamebuino/blob/main/Makefile) change `<NAME>` in the line `EXECUTABLE = <NAME>`
+ In [CMakeLists.txt](https://github.com/AnotherJohnH/HelloGamebuino/blob/main/CMakeLists.txt) change `<NAME>` and `<source>` in the line `add_executable(<NAME> <source> ${GB_SRC})`

**NOTE**: In an attempt to make C/C++ easier to use the Arduino IDE supports `.ino` files. These are
similar to normal C/C++ files but are pre-processed to auto-generate the declarations that would normally
be necessary when splitting a project across multiple source files. `.ino` files are not supported by this
build framework so `.cpp`, `.c` and `.h` files must be used and will be treated in the normal way.

## Further information

See the [Wiki](https://github.com/AnotherJohnH/HelloGamebuino/wiki)
