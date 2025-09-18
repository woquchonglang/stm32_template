include(FetchContent)

# FetchContent_Declare( STM32CubeF4 URL
# https://github.com/STMicroelectronics/STM32CubeF4/archive/refs/tags/v1.28.3.tar.gz
# URL_HASH
# SHA256=c4d121386fc1b0d6566c4ae9e08af14b24eea089250a0e86ff341dcf7ddb256e
# DOWNLOAD_EXTRACT_TIMESTAMP TRUE SOURCE_DIR
# "${CMAKE_SOURCE_DIR}/Lib/STM32CubeF4")

FetchContent_Declare(
  STM32CubeF4
  GIT_REPOSITORY https://github.com/STMicroelectronics/STM32CubeF4.git
  GIT_TAG v1.28.3
  GIT_SHALLOW TRUE
  GIT_PROGRESS TRUE
  SOURCE_DIR "${CMAKE_SOURCE_DIR}/Lib/STM32Cube")

FetchContent_MakeAvailable(STM32CubeF4)
