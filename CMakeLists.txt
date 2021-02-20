
# Not tested but probably ok on older versions
cmake_minimum_required(VERSION 3.11.4)

include(gamebuino.cmake)

project(LANGUAGES C CXX)

add_executable(HELLO hello.cpp ${GB_SRC})

