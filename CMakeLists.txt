CMAKE_MINIMUM_REQUIRED(VERSION 3.10)

PROJECT(TEST)

ADD_EXECUTABLE(${PROJECT_NAME} main.cpp)

ADD_SUBDIRECTORY("${CMAKE_CURRENT_SOURCE_DIR}/Adder") # add subfolder
ADD_SUBDIRECTORY("${CMAKE_CURRENT_SOURCE_DIR}/fmt")

target_include_directories(${PROJECT_NAME} PUBLIC Adder fmt) # don't need to
# reference path in cpp file.

# target_link_directories(${PROJECT_NAME} PRIVATE Adder) # Where to find library??


target_link_libraries(${PROJECT_NAME} adder fmt) # link library
