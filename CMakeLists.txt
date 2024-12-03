cmake_minimum_required(VERSION 3.0)
project(MIMORPH_RT)

set(CMAKE_CXX_STANDARD 17)

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
        lib/dpdk.cpp
        include/ldpc_configuration.h
        lib/ldpc_configuration.cpp
)
add_executable(radio_example examples/radio_example.cpp
        lib/ldpc_configuration.cpp
        include/ldpc_configuration.h
        examples/helpers.h
        examples/helpers.cpp)

add_executable(sinewave_example examples/sinewave_example.cpp
        examples/helpers.h
        examples/helpers.cpp)

add_executable(throughput_experiments_tx examples/throughput_experiment_tx.cpp
        examples/helpers.cpp
        examples/helpers.h)

add_executable(throughput_experiments_rx examples/throughput_experiment_rx.cpp
        examples/helpers.cpp
        examples/helpers.h)

add_executable(microbenchmark examples/microbenchmark_exp.cpp
        examples/helpers.cpp
        examples/helpers.h)

target_link_libraries(sinewave_example
        MIMORPH_RT)

target_link_libraries(microbenchmark
        MIMORPH_RT)

target_link_libraries(throughput_experiments_tx
        MIMORPH_RT)

target_link_libraries(throughput_experiments_rx
        MIMORPH_RT)


target_link_libraries(radio_example
        MIMORPH_RT)
add_executable(latency examples/measure_latency_rx.cpp
        examples/helpers.cpp
        examples/helpers.h)
target_link_libraries(latency
        MIMORPH_RT)
add_executable(sensing_app examples/sensing_app.cpp
        examples/helpers.cpp
        examples/helpers.h
)

target_link_libraries(sensing_app
        MIMORPH_RT)
