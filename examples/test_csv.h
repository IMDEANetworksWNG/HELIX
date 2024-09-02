//
// Created by imdea on 03/06/2024.
//

#ifndef MIMORPH_RT_TEST_CSV_H
#define MIMORPH_RT_TEST_CSV_H
#include <string>



struct block_addr{
    std::string addr;
    std::string block_name;
};

struct list_of_addresses{
    block_addr stream_manager;
    block_addr udp_stack;
    block_addr eth_dma;
};


#endif //MIMORPH_RT_TEST_CSV_H
