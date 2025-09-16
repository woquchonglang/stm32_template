# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "/home/yjy/Documents/code/stm/test/build/Lib/FreeRTOS")
  file(MAKE_DIRECTORY "/home/yjy/Documents/code/stm/test/build/Lib/FreeRTOS")
endif()
file(MAKE_DIRECTORY
  "/home/yjy/Documents/code/stm/test/build/_deps/freertos-build"
  "/home/yjy/Documents/code/stm/test/build/_deps/freertos-subbuild/freertos-populate-prefix"
  "/home/yjy/Documents/code/stm/test/build/_deps/freertos-subbuild/freertos-populate-prefix/tmp"
  "/home/yjy/Documents/code/stm/test/build/_deps/freertos-subbuild/freertos-populate-prefix/src/freertos-populate-stamp"
  "/home/yjy/Documents/code/stm/test/build/_deps/freertos-subbuild/freertos-populate-prefix/src"
  "/home/yjy/Documents/code/stm/test/build/_deps/freertos-subbuild/freertos-populate-prefix/src/freertos-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/yjy/Documents/code/stm/test/build/_deps/freertos-subbuild/freertos-populate-prefix/src/freertos-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/yjy/Documents/code/stm/test/build/_deps/freertos-subbuild/freertos-populate-prefix/src/freertos-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
