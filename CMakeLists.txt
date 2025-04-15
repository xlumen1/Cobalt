cmake_minimum_required(VERSION 3.16)

project(Cobalt VERSION 1.0 LANGUAGES C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

file(GLOB_RECURSE SOURCES src/*.c)

add_executable(Cobalt ${SOURCES})

target_include_directories(Cobalt PRIVATE include)

if (CMAKE_C_COMPILER_ID STREQUAL "GNU" OR CMAKE_C_COMPILER_ID STREQUAL "Clang")
    target_compile_options(Cobalt PRIVATE -Wall -Wextra -Wpedantic)
elseif (CMAKE_C_COMPILER_ID STREQUAL "MSVC")
    target_compile_options(Cobalt PRIVATE /W4)
endif()