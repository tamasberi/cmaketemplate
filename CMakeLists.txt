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

include(CTest)

add_library(${product_name}Lib SHARED src/library/library.cpp)

add_executable(${product_name} src/executable/main.cpp)
target_link_libraries(${product_name} PUBLIC ${product_name}Lib)
target_include_directories(${product_name} PUBLIC src/library)

add_executable(${product_name}Test test/librarytest.cpp)
target_link_libraries(${product_name}Test PUBLIC ${product_name}Lib gtest)
target_include_directories(${product_name}Test PUBLIC src/library)
add_test(${product_name}Test ${product_name}Test --gtest_output=xml:${CMAKE_BINARY_DIR}/${product_name}-TEST-Report.xml)

set(GCOVR_NAME gcovr)
find_program(GCOVR_COMMAND ${GCOVR_NAME})
if(EXISTS ${GCOVR_COMMAND})
 execute_process(COMMAND bash "-c" "${GCOVR_COMMAND} --version | head -n 1" WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} OUTPUT_VARIABLE GCOVR_VERSION OUTPUT_STRIP_TRAILING_WHITESPACE)
 message(STATUS "Command ${GCOVR_NAME} found: ${GCOVR_COMMAND} (${GCOVR_VERSION})")
 set(GCOVR_OUTPUT_DIR ${CMAKE_CURRENT_BINARY_DIR}/gcovr)
 set(GCOVR_EXCLUDES -e ${CMAKE_CURRENT_SOURCE_DIR}/src/executable -e ${CMAKE_CURRENT_SOURCE_DIR}/test -e ${CMAKE_CURRENT_BINARY_DIR})
 file(REMOVE_RECURSE ${GCOVR_OUTPUT_DIR})
 file(MAKE_DIRECTORY ${GCOVR_OUTPUT_DIR})
 set(GCOVR_MIN_LINE_COVERAGE 0.0)
 set(GCOVR_MIN_BRANCH_COVERAGE 0.0)
 set(GCOVR_THRESHOLD --fail-under-line ${GCOVR_MIN_LINE_COVERAGE} --fail-under-branch ${GCOVR_MIN_BRANCH_COVERAGE})
 add_custom_target(gcovr COMMAND ${GCOVR_COMMAND} ${GCOVR_EXCLUDES} ${GCOVR_THRESHOLD} --html-details ${GCOVR_OUTPUT_DIR}/coverage.html --xml ${GCOVR_OUTPUT_DIR}/coverage.xml -r ${CMAKE_CURRENT_SOURCE_DIR})
else()
 message(FATAL_ERROR "Command ${GCOVR_NAME} not found.")
endif()
