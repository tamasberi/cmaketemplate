cmake_minimum_required(VERSION 3.25)

file(READ ${CMAKE_CURRENT_SOURCE_DIR}/product_name.txt product_name)
string(STRIP ${product_name} product_name)

file(READ ${CMAKE_CURRENT_SOURCE_DIR}/product_version.txt product_version)
string(STRIP ${product_version} product_version)

project(${product_name} VERSION ${product_version})

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++${CMAKE_CXX_STANDARD} -Wall -Wextra -Werror -Wpedantic")

if("${CMAKE_BUILD_TYPE}" STREQUAL "Debug")
 set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ftest-coverage -fprofile-arcs -g -O0")
elseif("${CMAKE_BUILD_TYPE}" STREQUAL "Release")
 set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
elseif("${CMAKE_BUILD_TYPE}" STREQUAL "RelWithDebInfo")
 set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -O3")
else()
 message(FATAL_ERROR "Unsupported CMAKE_BUILD_TYPE: ${CMAKE_BUILD_TYPE}")
endif()

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

include(CTest)

add_library(${product_name}Lib SHARED src/library/library.cpp)

add_executable(${product_name} src/executable/main.cpp)
target_link_libraries(${product_name} PUBLIC ${product_name}Lib)
target_include_directories(${product_name} PUBLIC src/library)

add_executable(${product_name}Test test/librarytest.cpp)
target_link_libraries(${product_name}Test PUBLIC ${product_name}Lib gtest)
target_include_directories(${product_name}Test PUBLIC src/library)
add_test(${product_name}Test ${product_name}Test --gtest_output=xml:${CMAKE_BINARY_DIR}/${product_name}-TEST-Report.xml)

include(gcovr)
include(cppcheck)
include(valgrind)
