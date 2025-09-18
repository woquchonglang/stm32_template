include(FetchContent)

# 配置获取CMSIS-Device-F4
FetchContent_Declare(
  hal
  GIT_REPOSITORY https://github.com/STMicroelectronics/stm32f4xx-hal-driver.git
  GIT_TAG v1.8.5
  GIT_SHALLOW TRUE
  GIT_PROGRESS TRUE
  SOURCE_DIR "${CMAKE_SOURCE_DIR}/Lib/STM32F4xx_HAL_Driver")

# 获取内容
FetchContent_MakeAvailable(hal)
