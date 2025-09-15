cmake_minimum_required(VERSION 3.10)
project(ft_otp)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(SRCS 	srcs/main.cpp
			srcs/options.cpp
			srcs/encrypt_key.cpp
)
add_compile_options(-Wall -Wextra -Werror)

add_executable(ft_otp ${SRCS})
find_package(OpenSSL REQUIRED)

target_link_libraries(ft_otp ${OPENSSL_LIBRARIES})
target_include_directories(ft_otp PUBLIC ${OPENSSL_INCLUDE_DIR})