
# Setting the minimum CMake version.
cmake_minimum_required(VERSION 3.25)

# Reading and stripping the product/project name from the given file.
file(READ ${CMAKE_CURRENT_SOURCE_DIR}/product_name.txt product_name)
string(STRIP ${product_name} product_name)

# Reading and stripping the product/project version from the given file.
file(READ ${CMAKE_CURRENT_SOURCE_DIR}/product_version.txt product_version)
string(STRIP ${product_version} product_version)

# Defining the project. From now on, the ${CMAKE_PROJECT_NAME} version can be used.
project(${product_name} VERSION ${product_version} LANGUAGES CXX)

# To be able to find custom .cmake files.
set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# Build configuration.
include(buildconf)

# Testing capabilities (test target).
include(CTest)

# Constants for the install commands.
include(GNUInstallDirs)

# The library target as a shared object.
add_library(${CMAKE_PROJECT_NAME}Lib SHARED src/library/library.cpp)

# The executable target using the shared library.
add_executable(${CMAKE_PROJECT_NAME} src/executable/main.cpp)
target_link_libraries(${CMAKE_PROJECT_NAME} PUBLIC ${CMAKE_PROJECT_NAME}Lib)
target_include_directories(${CMAKE_PROJECT_NAME} PUBLIC src/library)

# The test executable also using the shared library.
add_executable(${CMAKE_PROJECT_NAME}Test test/librarytest.cpp)
target_link_libraries(${CMAKE_PROJECT_NAME}Test PUBLIC ${CMAKE_PROJECT_NAME}Lib gtest)
target_include_directories(${CMAKE_PROJECT_NAME}Test PUBLIC src/library)
add_test(${CMAKE_PROJECT_NAME}Test ${CMAKE_PROJECT_NAME}Test --gtest_output=xml:${CMAKE_BINARY_DIR}/${CMAKE_PROJECT_NAME}-TEST-Report.xml)

# The install commands for the package target.
install(TARGETS ${CMAKE_PROJECT_NAME} RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
install(TARGETS ${CMAKE_PROJECT_NAME}Lib LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

# Custom targets.
include(gcovr)
include(cppcheck)
include(valgrind)
include(package)
include(doxygen)

# For the package target.
include(CPack)
