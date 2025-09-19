include(FetchContent)

# reference to https://kb.segger.com/FreeRTOS_with_SystemView
FetchContent_Declare(
  RTT
  GIT_REPOSITORY https://github.com/SEGGERMicro/RTT.git
  GIT_TAG main
  GIT_SHALLOW TRUE
  GIT_PROGRESS TRUE
  SOURCE_DIR "${CMAKE_SOURCE_DIR}/Lib/RTT")

FetchContent_Declare(
  systemview
  GIT_REPOSITORY https://github.com/SEGGERMicro/SystemView.git
  GIT_TAG main
  GIT_SHALLOW TRUE
  GIT_PROGRESS TRUE
  SOURCE_DIR "${CMAKE_SOURCE_DIR}/Lib/systemview")

FetchContent_MakeAvailable(RTT systemview)

file(GLOB_RECURSE SOURCES CMAKE_CONFIGURE_DEPENDS 
  "${CMAKE_SOURCE_DIR}/Lib/RTT/RTT/*.c"
  "${CMAKE_SOURCE_DIR}/Lib/RTT/RTT/*.S"
  "${CMAKE_SOURCE_DIR}/Lib/RTT/Syscalls/SEGGER_RTT_Syscalls_GCC.c"
  "${CMAKE_SOURCE_DIR}/Lib/systemview/SYSVIEW/SEGGER_SYSVIEW.c")

add_library(segger STATIC ${SOURCES})

target_include_directories(segger PUBLIC
  "${CMAKE_SOURCE_DIR}/Lib/RTT/Config"
  "${CMAKE_SOURCE_DIR}/Lib/RTT/RTT"
  "${CMAKE_SOURCE_DIR}/Lib/systemview/Config"
  "${CMAKE_SOURCE_DIR}/Lib/systemview/SEGGER"
  "${CMAKE_SOURCE_DIR}/Lib/systemview/SYSVIEW")
