
# Adding the custom valgrind target.
set(VALGRIND_NAME valgrind)
find_program(VALGRIND_COMMAND ${VALGRIND_NAME})
if(EXISTS ${VALGRIND_COMMAND})
 execute_process(COMMAND ${VALGRIND_COMMAND} --version WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} OUTPUT_VARIABLE VALGRIND_VERSION OUTPUT_STRIP_TRAILING_WHITESPACE)
 message(STATUS "Command ${VALGRIND_NAME} found: ${VALGRIND_COMMAND} (${VALGRIND_VERSION})")
 set(MEMORYCHECK_COMMAND ${VALGRIND_COMMAND})
 set(MEMORYCHECK_COMMAND_OPTIONS "--error-exitcode=1 --leak-check=full --read-var-info=yes --show-leak-kinds=all --track-origins=yes --gen-suppressions=all --verbose")
 add_custom_target(valgrind COMMAND ${CMAKE_CTEST_COMMAND} --force-new-ctest-process --test-action memcheck)
else()
 message(FATAL_ERROR "Command ${VALGRIND_NAME} not found.")
endif()
