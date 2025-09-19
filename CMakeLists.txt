cmake_minimum_required(VERSION 3.22)

#
# This file is generated only once, and is not re-generated if converter is
# called multiple times.
#
# User is free to modify the file as much as necessary
#

# Setup compiler settings
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS ON)

# Define the build type
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "Debug")
endif()

# Set the project name
set(CMAKE_PROJECT_NAME test)

# Include toolchain file
set(FETCHCONTENT_QUIET OFF)
set(FETCHCONTENT_BASE_DIR ${CMAKE_SOURCE_DIR}/.deps)
set(FETCHCONTENT_UPDATES_DISCONNECTED ON)

include("cmake/gcc-arm-none-eabi.cmake")

# Enable compile command to ease indexing with e.g. clangd
set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)

# Core project settings
project(${CMAKE_PROJECT_NAME})
message("Build type: " ${CMAKE_BUILD_TYPE})

# include("cmake/etl.cmake") include("cmake/catch2.cmake")
include("cmake/freertos.cmake")
include("cmake/systemview.cmake")
include("cmake/cmsis_device.cmake")
include("cmake/hal.cmake")
include("cmake/cmsis5.cmake")

# include("cmake/gtest.cmake")

execute_process(
  COMMAND ${CMAKE_SOURCE_DIR}/script/hal.sh
  RESULT_VARIABLE hal_result
  OUTPUT_VARIABLE hal_output
  ERROR_VARIABLE hal_error
  WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/script)

if(NOT hal_result EQUAL 0)
  message(WARNING "hal.sh执行失败: ${hal_error}")
else()
  message(STATUS "hal.sh执行成功: ${hal_output}")
endif()

# Enable CMake support for ASM and C languages
enable_language(C CXX ASM)

add_compile_options(-Wno-unused-parameter)

# Create an executable object type
add_executable(${CMAKE_PROJECT_NAME})

# Add STM32CubeMX generated sources
add_subdirectory(cmake/stm32cubemx)
add_subdirectory(Src)

# Link directories setup
target_link_directories(
  ${CMAKE_PROJECT_NAME} PRIVATE # Add user defined library search paths
)

# Add sources to executable
target_sources(${CMAKE_PROJECT_NAME} PRIVATE main.cpp # Add user sources here
)

target_include_directories(
  ${CMAKE_PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
)

target_compile_definitions(
  ${CMAKE_PROJECT_NAME} PRIVATE
)

target_link_libraries(
  ${CMAKE_PROJECT_NAME} freertos_kernel App
)
