file(GLOB_RECURSE SOURCES CMAKE_CONFIGURE_DEPENDS "AppManager.cpp")

add_library(App ${SOURCES})

target_include_directories(App PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

target_link_libraries(App PRIVATE freertos_kernel)

