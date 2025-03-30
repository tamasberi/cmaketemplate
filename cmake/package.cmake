
# Setting the type of the installation package.
if(NOT CPACK_GENERATOR)
 set(CPACK_GENERATOR "DEB")
 message(STATUS "Variable CPACK_GENERATOR not set, using default: ${CPACK_GENERATOR}")
else()
 message(STATUS "Using CPACK_GENERATOR: ${CPACK_GENERATOR}")
endif()

# Setting the .deb dependencies (just a dummy to avoid warnings).
if(NOT CPACK_DEBIAN_PACKAGE_DEPENDS)
 set(CPACK_DEBIAN_PACKAGE_DEPENDS "libc6")
 message(STATUS "Variable CPACK_DEBIAN_PACKAGE_DEPENDS not set, using default: ${CPACK_DEBIAN_PACKAGE_DEPENDS}")
else()
 message(STATUS "Using CPACK_DEBIAN_PACKAGE_DEPENDS: ${CPACK_DEBIAN_PACKAGE_DEPENDS}")
endif()

# Setting the .deb package maintainer.
if(NOT CPACK_DEBIAN_PACKAGE_MAINTAINER)
 set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Tamas Beri <tamas.beri@gmail.com>")
 message(STATUS "Variable CPACK_DEBIAN_PACKAGE_MAINTAINER not set, using default: ${CPACK_DEBIAN_PACKAGE_MAINTAINER}")
else()
 message(STATUS "Using CPACK_DEBIAN_PACKAGE_MAINTAINER: ${CPACK_DEBIAN_PACKAGE_MAINTAINER}")
endif()

# Setting the name of the .deb file.
if(NOT CPACK_PACKAGE_FILE_NAME)
 set(CPACK_PACKAGE_FILE_NAME ${CMAKE_PROJECT_NAME}-${CMAKE_PROJECT_VERSION})
 message(STATUS "Variable CPACK_PACKAGE_FILE_NAME not set, using default: ${CPACK_PACKAGE_FILE_NAME}")
else()
 message(STATUS "Using CPACK_PACKAGE_FILE_NAME: ${CPACK_PACKAGE_FILE_NAME}")
endif()
