include(FetchContent)

FetchContent_Declare(
  Catch2
  GIT_REPOSITORY https://github.com/catchorg/Catch2.git
  GIT_TAG v3.8.1 # or a later release
  GIT_SHALLOW TRUE
  GIT_PROGRESS TRUE
  SOURCE_DIR "${CMAKE_SOURCE_DIR}/Lib/catch2")

FetchContent_MakeAvailable(Catch2)

# add_executable(tests test.cpp) target_link_libraries(tests PRIVATE
# Catch2::Catch2WithMain)
