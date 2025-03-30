
# Setting the C++ standars as well as all warnings.
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++${CMAKE_CXX_STANDARD} -Wall -Wextra -Werror -Wpedantic")

# Setting further flags for the different build types.
if("${CMAKE_BUILD_TYPE}" STREQUAL "Debug")
 set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ftest-coverage -fprofile-arcs -g -O0")
elseif("${CMAKE_BUILD_TYPE}" STREQUAL "Release")
 set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
elseif("${CMAKE_BUILD_TYPE}" STREQUAL "RelWithDebInfo")
 set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -O3")
else()
 message(FATAL_ERROR "Unsupported CMAKE_BUILD_TYPE: ${CMAKE_BUILD_TYPE}")
endif()
