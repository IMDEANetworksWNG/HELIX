#ifndef HELIX_LDPC_CONFIGURATION_H
#define HELIX_LDPC_CONFIGURATION_H

#include "cmd_manager.h"
#include <vector> // Make sure this is included, needed for std::vector in structs

/**
 * @struct cbs_info
 * @brief Structure to store code block segmentation information for LDPC encoding.
 */
struct cbs_info {
    /** @brief Number of code block segments. */
    int C;
    /** @brief Number of bits in each code block (excluding CB-CRC bits and filler bits).  This field is not actually used in the code. */
    int CBZ;
    /** @brief Number of parity bits in each code block.  This field is not actually used in the code. */
    int Lcb;
    /** @brief Number of filler bits in each code block. */
    int F;
    /** @brief Number of bits in each code block (including CB-CRC bits and filler bits). */
    int K;
    /** @brief Selected lifting size. */
    int Zc;
    /** @brief Full lifting size set.  This field is not actually used in the code. */
    std::vector<int> Z;
};

/**
 * @struct bgn_info
 * @brief Structure to store base graph number information for LDPC encoding.
 */
struct bgn_info {
    /** @brief CRC polynomial. */
    std::string CRC;
    /** @brief Number of parity bits. */
    int L;
    /** @brief Base graph number. */
    int BGN;
    /** @brief Payload size after CRC attachment. */
    int B;
};

/**
 * @struct ldpc_regs
 * @brief Structure to store register values for configuring the LDPC decoder IP core.
 */
struct ldpc_regs{
    /** @brief Kdm1 register value. */
    uint16_t Kdm1=0;
    /** @brief Em1 register values for each code block. */
    std::vector<uint16_t> Em1;
    /** @brief E_F1 register value. */
    uint32_t E_F1=0;
    /** @brief E_F2 register value. */
    uint32_t E_F2=0;
    /** @brief E_L1 register value. */
    uint32_t E_L1=0;
    /** @brief E_L2 register value. */
    uint32_t E_L2=0;
    /** @brief E_jump1 register value. */
    uint16_t E_jump1=0;
    /** @brief E_jump2 register value. */
    uint16_t E_jump2=0;
    /** @brief nPunctured register value. */
    uint16_t nPunctured=0;
    /** @brief lastPunctured register value. */
    uint16_t lastPunctured=0;
    /** @brief Fm1 register value. */
    uint16_t Fm1=0;
    /** @brief lastFillers register value. */
    uint16_t lastFillers=0;
    /** @brief nZeros register values for each code block. */
    std::vector<uint16_t> nZeros;
    /** @brief lastZeros register value. */
    uint32_t lastZeros=0;
    /** @brief LDPC control register value. */
    uint64_t ldpc_ctrl_regs=0;
    /** @brief CM1 register value. */
    uint16_t CM1=0;
    /** @brief F_R register value. */
    uint16_t F_R=0;
};

/**
 * @struct ldpc_info
 * @brief Structure to store LDPC encoding information.
 */
struct ldpc_info {
    /** @brief Lifting size. */
    uint16_t Zc;
    /** @brief Number of information bits after code block segmentation, excluding filler bits */
    uint16_t Kd;
    /** @brief Number of filler bits. */
    uint16_t F;
    /** @brief Number of code block segments. */
    uint16_t C;
    /** @brief Number of encoded bits for each code block segment */
    std::vector<int> E;
    /** @brief Number of bits per code block after LDPC coding. */
    uint16_t N;
    /** @brief Number of bits per code block after CBS. */
    uint16_t K;
    /** @brief Modulation order. */
    uint16_t modOrder;
    /** @brief Maximum number of LDPC decoding iterations. */
    uint16_t maxIter;
    /** @brief Number of samples per cycle. */
    uint16_t bgn;
    /** @brief Number of samples per cycle. */
    uint16_t ssr;
    /** @brief LDPC registers configuration. */
    ldpc_regs regs;
};

/**
 * @brief Calculates and returns the LDPC configuration based on the provided parameters.
 *
 * @param tbs             Transport block size.
 * @param TargetCodeRate  Target code rate.
 * @param nLLRs           Number of LLRs (Log-Likelihood Ratios).
 * @param modOrder        Modulation order.
 * @return              The LDPC configuration information.
 */
ldpc_info get_LDPC_config(int tbs, float TargetCodeRate, int nLLRs, int modOrder);

#endif //HELIX_LDPC_CONFIGURATION_H