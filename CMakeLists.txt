cmake_minimum_required(VERSION 3.0)
project(MIMORPH_RT)

set(CMAKE_CXX_STANDARD 17)

#[[add_executable(MIMORPH_RT examples/main.cpp
        lib/udp_transport.cpp
        include/udp_transport.h
        lib/cmd_manager.cpp
        include/cmd_manager.h
        lib/streamer.cpp
        include/streamer.h
        lib/radio_control.cpp
        include/radio_control.h
        lib/mimorph.cpp
        include/mimorph.h
        examples/test_xlsx.cpp
)]]

add_library(MIMORPH_RT
        lib/udp_transport.cpp
        include/udp_transport.h
        lib/cmd_manager.cpp
        include/cmd_manager.h
        lib/streamer.cpp
        include/streamer.h
        lib/radio_control.cpp
        include/radio_control.h
        lib/mimorph.cpp
        include/mimorph.h
        include/defines.h
)
add_executable(radio_example examples/radio_example.cpp)

target_link_libraries(radio_example
        MIMORPH_RT)
