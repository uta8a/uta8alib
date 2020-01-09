message(STATUS "Building Unit Tests...")
cmake_minimum_required(VERSION 3.10 FATAL_ERROR)
message("dir: ${CMAKE_CURRENT_LIST_DIR}")
include_directories(
    ${CMAKE_CURRENT_LIST_DIR}/../../Catch2/single_include
    ${CMAKE_CURRENT_LIST_DIR}/../../src/cpp/include
)
add_library(test_main ${CMAKE_CURRENT_LIST_DIR}/main.cpp)

enable_testing()

set(main, main.cpp)

file(GLOB srcs RELATIVE ${CMAKE_CURRENT_LIST_DIR} **/main.cpp)
foreach(src ${srcs})
    get_filename_component(test_name_1 "${src}/.." ABSOLUTE)
    get_filename_component(test_name "${test_name_1}" NAME)
    # message("name: ${test_name}")
    # message("src: ${src}")
    add_executable(${test_name} main ${src})
    add_test(NAME ${test_name} COMMAND ${test_name})
endforeach()
