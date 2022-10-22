CMAKE_MINIMUM_REQUIRED(VERSION 3.11)

PROJECT(TEST LANGUAGES CXX)


if(USE_LOCAL_PACKAGES)
  find_package(nlohmann_json REQUIRED)
else()
  include(FetchContent)
  FetchContent_Declare(
    nlohmann
    GIT_REPOSITORY https://github.com/nlohmann/json.git
    GIT_TAG a3e6e26dc83a726b292f5be0492fcc408663ce55
    GIT_SHALLOW TRUE)
  FetchContent_MakeAvailable(nlohmann)
endif(USE_LOCAL_PACKAGES)

ADD_SUBDIRECTORY(src)
ADD_SUBDIRECTORY(lib) # add subfolder
