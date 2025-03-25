cmake_minimum_required(VERSION 3.25)

file(READ ${CMAKE_CURRENT_SOURCE_DIR}/product_name.txt product_name)
string(STRIP ${product_name} product_name)

file(READ ${CMAKE_CURRENT_SOURCE_DIR}/product_version.txt product_version)
string(STRIP ${product_version} product_version)

project(${product_name} VERSION ${product_version})

add_library(${product_name}Lib SHARED src/library.cpp)

add_executable(${product_name} src/main.cpp)
target_link_libraries(${product_name} PUBLIC ${product_name}Lib)
