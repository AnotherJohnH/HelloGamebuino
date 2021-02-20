# Hello World example for Gamebuino-classic

Example command line build environment for Gamebuino-classic projects.

Requires an install of the Arduino IDE but allows command line building
of projects without using the IDE on UNIX based OSes like Linux or MacOS.

## How to build

This git repo uses submodules e.g. to clone a copy use..

```
git clone --recurse-submodules https://github.com/AnotherJohnH/HelloGamebuino.git
```

The build depends on...

+ An install of the Arduino IDE, see [Arduino](https://www.arduino.cc/en/software) (*tested with v1.8.13*)
+ cmake (*at least v3.11.4*)

Before building the file `Makefile` must be edited to contain the
correct path to the '/hardware' directory in the Arduino install.
Also in the `Makefile` update the expected path for the SD card when
mounted.

To build `HELLO.HEX` from `hello.cpp` ...
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

+ In `Makefile`      - change `<NAME>` in the line `EXECUTABLE = <NAME>`
+ In `CMakeLits.txt` - change `<NAME>` and `<source>` in the line `add_executable(<NAME> <source> ${GB_SRC})`

**NOTE**: In an attempt to make C/C++ easier to use the Arduino IDE supports `.ino` files. These are
similar to normal C/C++ files but are pre-processed to auto-generate the declarations that would normally
be necessary when splitting a project across multiple source files.

`.ino` files are not supported by this build framework so `.cpp`, `.c` and `.h` files must be used and will
be treated in the normal way.

## Further information

See the [Wiki](https://github.com/AnotherJohnH/HelloGamebuino/wiki)
