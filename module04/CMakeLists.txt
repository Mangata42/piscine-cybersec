cmake_minimum_required(VERSION 3.10)

project(Stockholm C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

include_directories(inc)

file(GLOB SOURCES "src/*.c")

find_package(OpenSSL REQUIRED)

add_executable(stockholm ${SOURCES})

target_link_libraries(stockholm OpenSSL::Crypto)
target_include_directories(stockholm PRIVATE ${OPENSSL_INCLUDE_DIR})