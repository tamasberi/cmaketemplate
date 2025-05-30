
# Adding the custom cppcheck target.
set(CPPCHECK_NAME cppcheck)
find_program(CPPCHECK_COMMAND ${CPPCHECK_NAME})
if(EXISTS ${CPPCHECK_COMMAND})
 execute_process(COMMAND ${CPPCHECK_COMMAND} --version WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} OUTPUT_VARIABLE CPPCHECK_VERSION OUTPUT_STRIP_TRAILING_WHITESPACE)
 message(STATUS "Command ${CPPCHECK_NAME} found: ${CPPCHECK_COMMAND} (${CPPCHECK_VERSION})")
 set(cppcheck_in -I${CMAKE_CURRENT_SOURCE_DIR}/src/library -I${CMAKE_CURRENT_SOURCE_DIR}/src/executable -I${CMAKE_CURRENT_SOURCE_DIR}/test)
 set(cppcheck_ex -i${CMAKE_CURRENT_BINARY_DIR}/..)
 set(cppcheck_ss --suppress=missingIncludeSystem)
 add_custom_target(cppcheck COMMAND ${CPPCHECK_COMMAND} --enable=all --error-exitcode=2 --inline-suppr --std=c++${CMAKE_CXX_STANDARD} -q ${cppcheck_in} ${cppcheck_ex} ${cppcheck_ss} ${CMAKE_CURRENT_SOURCE_DIR} 2>${CMAKE_CURRENT_BINARY_DIR}/cppcheck.log)
else()
 message(FATAL_ERROR "Command ${CPPCHECK_NAME} not found.")
endif()
