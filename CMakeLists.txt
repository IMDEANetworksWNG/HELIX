cmake_minimum_required(VERSION 3.0)
project(HELIX)

set(CMAKE_CXX_STANDARD 17)

add_library(HELIX
        lib/udp_transport.cpp
        include/udp_transport.h
        lib/cmd_manager.cpp
        include/cmd_manager.h
        lib/streamer.cpp
        include/streamer.h
        lib/radio_control.cpp
        include/radio_control.h
        lib/helix.cpp
        include/helix.h
        include/defines.h
        lib/dpdk.cpp
        include/ldpc_configuration.h
        lib/ldpc_configuration.cpp
)

add_executable(sinewave_example
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
        HELIX)

target_link_libraries(microbenchmark
        HELIX)

target_link_libraries(throughput_experiments_tx
        HELIX)

target_link_libraries(throughput_experiments_rx
        HELIX)


add_executable(latency_node_a examples/measure_latency_tx.cpp
        examples/helpers.cpp
        examples/helpers.h)

add_executable(latency_node_b examples/measure_latency_rx.cpp
        examples/helpers.cpp
        examples/helpers.h)

target_link_libraries(latency_node_a
        HELIX)

target_link_libraries(latency_node_b
        HELIX)
add_executable(sensing_app examples/sensing_app.cpp
        examples/helpers.cpp
        examples/helpers.h
)

target_link_libraries(sensing_app
        HELIX)
add_executable(loopback examples/loopback_test.cpp
        examples/helpers.cpp
        examples/helpers.h
)
target_link_libraries(loopback
        HELIX)

add_executable(hw_accel_exp examples/hw_accel.cpp        examples/helpers.cpp
        examples/helpers.h
)

target_link_libraries(hw_accel_exp
        HELIX)