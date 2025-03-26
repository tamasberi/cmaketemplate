cmake_minimum_required(VERSION 3.25)

file(READ ${CMAKE_CURRENT_SOURCE_DIR}/product_name.txt product_name)
string(STRIP ${product_name} product_name)

file(READ ${CMAKE_CURRENT_SOURCE_DIR}/product_version.txt product_version)
string(STRIP ${product_version} product_version)

project(${product_name} VERSION ${product_version})

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++20 -Wall -Wextra -Werror -Wpedantic")

if("${CMAKE_BUILD_TYPE}" STREQUAL "Debug")
 set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ftest-coverage -fprofile-arcs -g -O0")
elseif("${CMAKE_BUILD_TYPE}" STREQUAL "Release")
 set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
elseif("${CMAKE_BUILD_TYPE}" STREQUAL "RelWithDebInfo")
 set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -O3")
else()
 message(FATAL_ERROR "Unsupported CMAKE_BUILD_TYPE: ${CMAKE_BUILD_TYPE}")
endif()

add_library(${product_name}Lib SHARED src/library.cpp)

add_executable(${product_name} src/main.cpp)
target_link_libraries(${product_name} PUBLIC ${product_name}Lib)
