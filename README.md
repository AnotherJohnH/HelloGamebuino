# Hello World example for Gamebuino-classic

Example command line build environment for Gamebuino-classic projects.

## How to build

**WARNING:** This git repo has a submodule so `git clone` with `--recurse-submodules`

The build depends on...

+ An install of the Arduino IDE, see [Arduino](https://www.arduino.cc/en/software) (*tested with v1.8.13*)
+ cmake (*at least v3.11.4*)

Before building the file `Makefile` must be edited to contain the
correct path to the '/hardware' directory in the Arduino install.
Also in the `Makefile` update the expected path for the SD card when
mounted.

To build...
```
make
```

To clean away the build directory...
```
make clean
```

To copy to an SD card...
```
make send
```
