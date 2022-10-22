ADD_SUBDIRECTORY("${CMAKE_CURRENT_SOURCE_DIR}/Adder") # add subfolder

if(USE_LOCAL_PACKAGES)
  ADD_SUBDIRECTORY("${CMAKE_CURRENT_SOURCE_DIR}/fmt")
  target_include_directories(${PROJECT_NAME} PUBLIC Adder fmt) # don't need to
  # reference path in cpp file.
else()
  target_include_directories(${PROJECT_NAME} PUBLIC Adder) # don't need to
  # reference path in cpp file.
endif(USE_LOCAL_PACKAGES)
