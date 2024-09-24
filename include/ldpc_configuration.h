//
// Created by imdea on 23/09/2024.
//

#ifndef MIMORPH_RT_LDPC_CONFIGURATION_H
#define MIMORPH_RT_LDPC_CONFIGURATION_H

#include "cmd_manager.h"
/*
   INFO contains the following fields:
   CRC - CRC polynomial selection ('16' or '24A')
   L   - Number of CRC bits (16 or 24)
   BGN - LDPC base graph selection (1 or 2)
   C   - Number of code blocks
   Lcb - Number of parity bits per code block (0 or 24)
   F   - Number of <NULL> filler bits per code block
   Zc  - Lifting size selection
   K   - Number of bits per code block after CBS
   N   - Number of bits per code block after LDPC coding

 */

struct CBSInfo {
    int C;               // Number of code block segments
    int CBZ;             // Number of bits in each code block (excluding CB-CRC bits and filler bits)
    int Lcb;             // Number of parity bits in each code block
    int F;               // Number of filler bits in each code block
    int K;               // Number of bits in each code block (including CB-CRC bits and filler bits)
    int Zc;              // Selected lifting size
    std::vector<int> Z;  // Full lifting size set
};

struct BGNInfo {
    std::string CRC; // CRC polynomial
    int L;           // Number of parity bits
    int BGN;         // Base graph number
    int B;           // Payload size after CRC attachment
};



struct LDPCInfo {
    uint16_t Zc;
    uint16_t Kd;
    uint16_t F;
    uint16_t C;
    std::vector<int> E;
    uint16_t N;
    uint16_t K;
    uint16_t modOrder;
    uint16_t maxIter;
    uint16_t bgn;
};

/*
class ldpc_configuration {

};
*/

LDPCInfo get_LDPC_config(int tbs, float TargetCodeRate, int nLLRs, int modOrder);

#endif //MIMORPH_RT_LDPC_CONFIGURATION_H
