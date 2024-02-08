cmake_minimum_required(VERSION 3.10)

project(adder LANGUAGES CXX VERSION 0.1.0)

add_library(${PROJECT_NAME} SHARED
  "${CMAKE_CURRENT_SOURCE_DIR}/adder.cpp" # library files
)

# CPACK stuff
# set(CPACK_DEB_COMPONENT_INSTALL ON)
# set(CPACK_GENERATOR "DEB")
# set(CPACK_DEBIAN_PACKAGE_MAINTAINER "James Leslie")

install(TARGETS ${PROJECT_NAME}
  DESTINATION "bin"
  COMPONENT CORE
)
