CMAKE_MINIMUM_REQUIRED(VERSION 3.11)

PROJECT(cmake-practice LANGUAGES CXX VERSION 0.0.1)

add_subdirectory(main)
add_subdirectory(lib)

set(CPACK_DEB_COMPONENT_INSTALL ON)
set(CPACK_GENERATOR "DEB")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "James Leslie")
set(CPACK_DEB_COMPONENTS_GROUPING ONE_PER_GROUP)

include(CPack)

cpack_add_component_group(core_group)


message("components: ${CPACK_COMPONENTS_ALL}")
