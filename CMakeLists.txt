cmake_minimum_required(VERSION 3.25)

file(READ ${CMAKE_CURRENT_SOURCE_DIR}/product_name.txt product_name)
string(STRIP ${product_name} product_name)

file(READ ${CMAKE_CURRENT_SOURCE_DIR}/product_version.txt product_version)
string(STRIP ${product_version} product_version)

project(${product_name} VERSION ${product_version})

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

include(buildconf)

include(CTest)
include(GNUInstallDirs)

add_library(${PROJECT_NAME}Lib SHARED src/library/library.cpp)

add_executable(${PROJECT_NAME} src/executable/main.cpp)
target_link_libraries(${PROJECT_NAME} PUBLIC ${PROJECT_NAME}Lib)
target_include_directories(${PROJECT_NAME} PUBLIC src/library)

add_executable(${PROJECT_NAME}Test test/librarytest.cpp)
target_link_libraries(${PROJECT_NAME}Test PUBLIC ${PROJECT_NAME}Lib gtest)
target_include_directories(${PROJECT_NAME}Test PUBLIC src/library)
add_test(${PROJECT_NAME}Test ${PROJECT_NAME}Test --gtest_output=xml:${CMAKE_BINARY_DIR}/${PROJECT_NAME}-TEST-Report.xml)

install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
install(TARGETS ${PROJECT_NAME}Lib LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

include(gcovr)
include(cppcheck)
include(valgrind)
include(package)
include(doxygen)

include(CPack)
