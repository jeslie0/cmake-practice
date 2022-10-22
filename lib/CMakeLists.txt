ADD_SUBDIRECTORY("${CMAKE_CURRENT_SOURCE_DIR}/Adder") # add subfolder
ADD_SUBDIRECTORY("${CMAKE_CURRENT_SOURCE_DIR}/fmt")

target_include_directories(${PROJECT_NAME} PUBLIC Adder fmt) # don't need to
# reference path in cpp file.
