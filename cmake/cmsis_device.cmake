include(FetchContent)

# 配置获取CMSIS-Device-F4
FetchContent_Declare(
  cmsis_device_f4
  GIT_REPOSITORY https://github.com/STMicroelectronics/cmsis-device-f4.git
  GIT_TAG v2.6.11
  GIT_SHALLOW TRUE
  GIT_PROGRESS TRUE
  SOURCE_DIR "${CMAKE_SOURCE_DIR}/Lib/CMSIS_Device_F4")

# 获取内容
FetchContent_MakeAvailable(cmsis_device_f4)
