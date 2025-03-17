file(READ ${CMAKE_CURRENT_SOURCE_DIR}/product_name.txt product_name)
string(STRIP ${product_name} product_name)

file(READ ${CMAKE_CURRENT_SOURCE_DIR}/product_version.txt product_version)
string(STRIP ${product_version} product_version)

project(${product_name} VERSION ${product_version})
