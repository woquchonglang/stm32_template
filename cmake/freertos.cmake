include(FetchContent)

# if(CMAKE_SYSTEM_NAME STREQUAL "Linux") if(POLICY CMP0135) # Controls
# timestamps of the extracted contents # (DOWNLOAD_EXTRACT_TIMESTAMP)
# cmake_policy(SET CMP0135 NEW) endif()
#
# # This sample requires GCC 6.0 or later if(NOT CMAKE_COMPILER_IS_GNUCXX OR
# CMAKE_CXX_COMPILER_VERSION VERSION_LESS 6.0) return() endif()
#
# include(FetchContent)
#
# # Select FreeRTOS port set(FREERTOS_PORT "GCC_POSIX")
#
# # Select FreeRTOS heap set(FREERTOS_HEAP "4")
#
# # Add the freertos_config for FreeRTOS-Kernel
# add_subdirectory(freertos_config)
#
# # Download FreeRTOS-Kernel sources FetchContent_Declare( freertos_kernel URL
# https://github.com/FreeRTOS/FreeRTOS-Kernel/archive/refs/tags/V11.1.0.tar.gz
# URL_HASH
# SHA256=0e21928b3bcc4f9bcaf7333fb1c8c0299d97e2ec9e13e3faa2c5a7ac8a3bc573)
#
# FetchContent_MakeAvailable(freertos_kernel)
#
# Describe our executable add_executable(FreeRTOS main.cpp)
# target_link_libraries(FreeRTOS freertos_kernel freertos_config plog::plog)

# Important!!! There is no standard way to know if the code is compiled for
# FreeRTOS. So we define __FREERTOS__ macro. target_compile_definitions(FreeRTOS
# PUBLIC __FREERTOS__) endif()
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# FetchContent_Declare( FreeRTOS GIT_REPOSITORY
# https://github.com/FreeRTOS/FreeRTOS-Kernel.git GIT_TAG V11.2.0 GIT_SHALLOW
# TRUE GIT_PROGRESS TRUE SOURCE_DIR ${CMAKE_SOURCE_DIR}/Lib/FreeRTOS)

FetchContent_Declare(
  FreeRTOS
  URL https://github.com/FreeRTOS/FreeRTOS-Kernel/archive/refs/tags/V11.2.0.tar.gz
  URL_HASH
    SHA256=e148d3a442ac7652c998e0a932c4cc2a3c6abff66a3a0a96a7678c0cd092d41c
  DOWNLOAD_EXTRACT_TIMESTAMP TRUE SOURCE_DIR ${CMAKE_SOURCE_DIR}/Lib/FreeRTOS)

add_library(freertos_config INTERFACE)

# Set path to folder containing FreeRTOSConfig.h
target_include_directories(freertos_config
                           INTERFACE "${CMAKE_SOURCE_DIR}/Config/include")

target_compile_definitions(freertos_config INTERFACE projCOVERAGE_TEST=0)

set(FREERTOS_HEAP
    "4"
    CACHE STRING "" FORCE)

# Select the native compile PORT
set(FREERTOS_PORT
    "GCC_ARM_CM4F"
    CACHE STRING "" FORCE)

FetchContent_MakeAvailable(FreeRTOS)
