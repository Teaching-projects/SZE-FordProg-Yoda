cmake_minimum_required(VERSION 2.8)

project(yoda)

set(src "src/main.cpp")
set(inc "include/yoda/ll1_parser.hpp")

add_executable(${PROJECT_NAME} ${src} ${inc})

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src ${CMAKE_CURRENT_SOURCE_DIR}/include)