cmake_minimum_required(VERSION 3.10)
project(totp)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(SRCS 	srcs/main.cpp
			srcs/options.cpp
			srcs/encrypt_key.cpp
)

add_executable(totp ${SRCS})
find_package(OpenSSL REQUIRED)

target_link_libraries(totp ${OPENSSL_LIBRARIES})
target_include_directories(totp PUBLIC ${OPENSSL_INCLUDE_DIR})