
cmake_minimum_required(VERSION 3.11.4)

include(gamebuino.cmake)

project(GamebuinoExample LANGUAGES C CXX)

add_executable(HELLO hello.cpp ${GB_SRC})

