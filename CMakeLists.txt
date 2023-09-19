cmake_minimum_required(VERSION 3.0)
project(MyProject)

# Find Clang++
find_program(CLANGPP clang++)
if(NOT CLANGPP)
  message(FATAL_ERROR "clang++ not found")
endif()

# Run .sh script
execute_process(
  COMMAND bash "${CMAKE_CURRENT_SOURCE_DIR}/Nexus_Release_v1/DO_NOT_RUN_YET.sh"
  RESULT_VARIABLE VERIFY_RESULT
)
if(VERIFY_RESULT)
  message(FATAL_ERROR "Verification failed")
endif()

# Compile main.cpp
add_executable(MyProject Nexus_Release_v1/src/test/main.cpp)
target_compile_options(MyProject PRIVATE -Wall -Wextra -pedantic)
target_link_libraries(MyProject PRIVATE pthread)

# Set output directory
set_target_properties(MyProject PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/output)
