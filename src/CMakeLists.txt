ADD_EXECUTABLE(${PROJECT_NAME} main.cpp)
target_link_libraries(${PROJECT_NAME} adder fmt::fmt nlohmann_json::nlohmann_json) # link library
