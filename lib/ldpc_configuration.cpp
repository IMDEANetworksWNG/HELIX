//
// Created by imdea on 23/09/2024.
//

#include "../include/ldpc_configuration.h"
#include <cmath>
#include <algorithm>


BGNInfo getBGNInfo(int A, double R) {
    BGNInfo info;
    int L;
    int bgn;

    // LDPC base graph selection
    if (A <= 292 || (A <= 3824 && R <= 0.67) || R <= 0.25) {
        bgn = 2;
    } else {
        bgn = 1;
    }

    // Get transport block size after CRC attachment
    if (A > 3824) {
        L = 24;
        info.CRC = "24A";
    } else {
        L = 16;
        info.CRC = "16";
    }

    // Get the length of transport block after CRC attachment
    int B = A + L;

    // Fill the remaining fields
    info.L = L;
    info.BGN = bgn;
    info.B = B;

    return info;
}

// Helper function to find the minimum value in a list greater than or equal to Kd
int findMinZc(const std::vector<int>& Zlist, int Kb, int Kd) {
    for (int z : Zlist) {
        if (Kb * z >= Kd) {
            return z;
        }
    }
    return -1;  // Error case (shouldn't happen if logic is correct)
}

// Function to get CBS information
CBSInfo getCBSInfo(int B, int bgn) {
    CBSInfo info;
    int Kcb, L, C, Bd, cbz, Kd, Kb, Zc, K;

    // Get the maximum code block size based on BGN
    if (bgn == 1) {
        Kcb = 8448;
    } else {
        Kcb = 3840;
    }

    // Determine the number of code blocks and length of CB-CRC coded block
    if (B <= Kcb) {
        L = 0;
        C = 1;
        Bd = B;
    } else {
        L = 24;  // Length of the CRC bits attached to each code block
        C = std::ceil(static_cast<double>(B) / (Kcb - L));
        Bd = B + C * L;
    }

    // Obtain the number of bits per code block (excluding CB-CRC bits)
    cbz = std::ceil(static_cast<double>(B) / C);

    // Get number of bits in each code block (excluding filler bits)
    Kd = std::ceil(static_cast<double>(Bd) / C);

    // Find the minimum value of Z in all sets of lifting sizes in 38.212 Table 5.3.2-1
    if (bgn == 1) {
        Kb = 22;
    } else {
        if (B > 640) {
            Kb = 10;
        } else if (B > 560) {
            Kb = 9;
        } else if (B > 192) {
            Kb = 8;
        } else {
            Kb = 6;
        }
    }

    // Full lifting size set according to the 38.212 standard
    std::vector<int> Zlist = {2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 36, 40, 44, 48, 52, 56, 60, 64,
                              72, 80, 88, 96, 104, 112, 120, 128, 144, 160, 176, 192, 208, 224, 240, 256, 288, 320, 352, 384};

    Zc = findMinZc(Zlist, Kb, Kd);

    // Get number of bits (including filler bits) to be input to the LDPC encoder
    if (bgn == 1) {
        K = 22 * Zc;
    } else {
        K = 10 * Zc;
    }

    // Fill the info structure with the result
    info.C = C;                 // Number of code block segments
    //info.CBZ = cbz;             // Number of bits in each code block (excluding CB-CRC bits)
    //info.Lcb = L;               // Number of parity bits in each code block
    info.F = K - Kd;            // Number of filler bits in each code block
    info.K = K;                 // Number of bits in each code block (including CB-CRC bits and filler bits)
    info.Zc = Zc;               // Selected lifting size
    //info.Z = Zlist;             // Full lifting size set

    return info;
}

// Function to get SCH information
LDPCInfo getSCHInfo(int tbs, double tcr) {
    LDPCInfo info;

    // Input validation
    if (tbs < 0) {
        throw std::invalid_argument("TBS must be a non-negative integer.");
    }
    if (tcr <= 0 || tcr >= 1) {
        throw std::invalid_argument("TCR must be between 0 and 1.");
    }

    // Get base graph number and CRC information
    BGNInfo bgInfo = getBGNInfo(tbs, tcr);

    // Get code block segment information
    CBSInfo cbInfo = getCBSInfo(bgInfo.B, bgInfo.BGN);

    // Get number of bits (including filler bits) to be encoded by LDPC encoder
    int N;
    if (bgInfo.BGN == 1) {
        N = 66 * cbInfo.Zc;
    } else {
        N = 50 * cbInfo.Zc;
    }

    // Combine information into the output structure
    //info.CRC = bgInfo.CRC;       // CRC polynomial
    info.bgn = bgInfo.BGN;       // Base graph number
    info.C = cbInfo.C;           // Number of code block segments
    //info.Lcb = cbInfo.Lcb;       // Number of parity bits per code block
    info.F = cbInfo.F;           // Number of filler bits per code block
    info.Zc = cbInfo.Zc;         // Selected lifting size
    info.K = cbInfo.K;           // Number of bits per code block after CBS
    info.N = N;                  // Number of bits per code block after LDPC coding
    info.Kd = info.K-info.Zc*2-info.F;

    // Modify the output fields if tbs is empty or zero
    if (tbs == 0) {
        //info.L = 0;
        info.F = 0;
        info.Zc = 2;
        info.K = 0;
        info.N = 0;
    }
    return info;
}

std::vector<double> cbsRateRecover(const std::vector<double>& in, const LDPCInfo& cbsinfo, int k0, int Ncb, int Qm) {
    // Perform bit de-interleaving according to TS 38.212 5.4.2.2
    int E = in.size();
    std::vector<double> interleaved(E);

    for (int i = 0; i < E; ++i) {
        interleaved[i] = in[i / Qm + (i % Qm) * (E / Qm)];
    }

    // Puncture systematic bits
    int K = cbsinfo.K - 2 * cbsinfo.Zc;
    int Kd = K - cbsinfo.F; // Exclude fillers

    // Reverse bit selection according to TS 38.212 5.4.2.1
    int k = 0;
    int j = 0;
    std::vector<int> indices(E);

    while (k < E) {
        int idx = (k0 + j) % Ncb;
        if (!(idx >= Kd && idx < K)) { // Avoid filler bits
            indices[k] = idx;
            ++k;
        }
        ++j;
    }

    // Recover circular buffer
    std::vector<double> out(cbsinfo.N, 0.0);

    // Filler bits are treated as Inf in the soft bits
    for (int i = Kd; i < K; ++i) {
        out[i] = std::numeric_limits<double>::infinity();
    }

    // Apply soft values to the circular buffer
    for (int n = 0; n < E; ++n) {
        out[indices[n]] += interleaved[n];
    }

    return out;
}

// Main function to perform LDPC rate recovery
 std::vector<int> nrRateRecoverLDPC(
        const std::vector<double>& in,
        int trblklen,
        double R,
        int rv,
        int Qm,
        int nlayers,
        int numCB = -1,
        int Nref = -1
) {
    // Input validation
    if (trblklen <= 0 || R <= 0 || R >= 1 || (rv < 0 || rv > 3) || nlayers < 1 || nlayers > 4) {
        throw std::invalid_argument("Invalid input arguments");
    }

    // Output empty if input is empty or trblklen is 0
    if (in.empty() || trblklen == 0) {
        return { {}, {} };
    }

    // Get base graph and code block segmentation parameters
    LDPCInfo cbsinfo = getSCHInfo(trblklen, R);
    int bgn = cbsinfo.bgn;
    int Zc = cbsinfo.Zc;
    int N = cbsinfo.N;

    // Determine the number of scheduled code block segments
    int C = (numCB > 0 && numCB <= cbsinfo.C) ? numCB : cbsinfo.C;

    // Determine the code block soft buffer size
    int Ncb = (Nref > 0) ? std::min(N, Nref) : N;

    // Get starting position in circular buffer
    int k0 = 0;
    if (bgn == 1) {
        if (rv == 1) k0 = std::floor(17.0 * Ncb / N) * Zc;
        else if (rv == 2) k0 = std::floor(33.0 * Ncb / N) * Zc;
        else if (rv == 3) k0 = std::floor(56.0 * Ncb / N) * Zc;
    } else {
        if (rv == 1) k0 = std::floor(13.0 * Ncb / N) * Zc;
        else if (rv == 2) k0 = std::floor(25.0 * Ncb / N) * Zc;
        else if (rv == 3) k0 = std::floor(43.0 * Ncb / N) * Zc;
    }

    // Perform rate recovery for each code block segment
    int G = in.size();
    int gIdx = 0;
    std::vector<std::vector<double>> out(C, std::vector<double>(N, 0.0));
    std::vector<int> E_out(C, 0);

    for (int r = 0; r < C; ++r) {
        int E = (r <= C - G / (nlayers * Qm) % C - 1) ? nlayers * Qm * std::floor(G / (nlayers * Qm * C))
                                                      : nlayers * Qm * std::ceil(G / (nlayers * Qm * C));

        std::vector<double> deconcatenated;
        if (G < E) {
            // Pad with zeros if G is less than E
            deconcatenated = in;
            deconcatenated.resize(E, 0.0);
        } else {
            deconcatenated = std::vector<double>(in.begin() + gIdx, in.begin() + gIdx + E);
        }
        gIdx += E;

        // Perform rate recovery for each code block segment
        out[r] = cbsRateRecover(deconcatenated, cbsinfo, k0, Ncb, Qm);
        E_out[r] = E;
    }

    return  E_out ;
}




LDPCInfo get_LDPC_config(int tbs, float TargetCodeRate, int nLLRs, int modOrder) {
    LDPCInfo ldpc_config;

    if ((TargetCodeRate > 539.0/1024.0 && TargetCodeRate < 552.0/1024.0) || TargetCodeRate < 316.0/1024.0) {
        std::cerr << "FPGA_IP: LDPC TargetCodeRate must be greater than 316/1024, excluding from 539/1024 to 552/1024\n";
    }

    ldpc_config = getSCHInfo(tbs,TargetCodeRate);

    if (ldpc_config.bgn > 1) {
        std::cerr << "FPGA_IP: LDPC only supports base graph 1\n";
    }

    if (ldpc_config.F == 0) {
        std::cerr << "FPGA_IP: LDPC does not consider a zero fillers case\n";
    }

    std::vector<double> in(nLLRs);
    for (int i = 0; i < nLLRs; ++i) {
        in[i] = i + 1;
    }

    ldpc_config.E = nrRateRecoverLDPC(in, tbs, TargetCodeRate, 0, modOrder, 1);

    ldpc_config.modOrder = modOrder;
    ldpc_config.maxIter = 10;
    uint8_t SSR=16;

    std::vector<int> Kd_tranf(ldpc_config.C);
    std::vector<int> lastKd(ldpc_config.C);
    std::vector<int> E_tranf(ldpc_config.C);
    std::vector<int> lastE(ldpc_config.C);
    std::vector<int> rF1(ldpc_config.C);
    std::vector<int> rL1(ldpc_config.C);
    std::vector<int> rF2(ldpc_config.C);
    std::vector<int> rL2(ldpc_config.C);
    std::vector<int> jump1(ldpc_config.C);
    std::vector<int> jump2(ldpc_config.C);

    // Checking if the number of zeros is valid
    if (ldpc_config.N - ldpc_config.E[0] - ldpc_config.F < SSR + 1) {
        std::cerr << "FPGA_IP: LDPC at the moment didn't consider codeword without zeros.";
    }

    // Determine Kd_tranf, lastKd and F_R
    int F_R;
    if (ldpc_config.Kd < ldpc_config.E[0] / ldpc_config.modOrder) {
        Kd_tranf.assign(ldpc_config.C, std::ceil(ldpc_config.Kd / static_cast<double>(SSR)));
        lastKd.assign(ldpc_config.C, ldpc_config.Kd % SSR == 0 ? SSR : ldpc_config.Kd % SSR);
        F_R = 1;
    } else {
        Kd_tranf.assign(ldpc_config.C, std::ceil((ldpc_config.Kd - ldpc_config.E[0] / ldpc_config.modOrder) / static_cast<double>(SSR)));
        lastKd.assign(ldpc_config.C, (ldpc_config.Kd - ldpc_config.E[0] / ldpc_config.modOrder) % SSR == 0 ? SSR : (ldpc_config.Kd - ldpc_config.E[0] / ldpc_config.modOrder) % SSR);
        F_R = 0;
    }

    // Calculate E_tranf and lastE
    for (int i = 0; i < ldpc_config.C; i++) {
        E_tranf[i] = std::ceil(ldpc_config.E[i] / static_cast<double>(SSR * ldpc_config.modOrder));
        lastE[i] = (ldpc_config.E[i] / ldpc_config.modOrder) % SSR == 0 ? SSR : (ldpc_config.E[i] / ldpc_config.modOrder) % SSR;
    }

    // Set initial rF1 for first iteration
    rF1[0] = SSR;

    // Iterate over each code block
    for (int ii = 0; ii < ldpc_config.C; ii++) {
        // Last1 computation
        if (rF1[ii] == SSR) {
            rL1[ii] = lastKd[ii];
            jump2[ii] = 0;
        } else if (rF1[ii] == lastKd[ii]) {
            rL1[ii] = SSR;
            jump2[ii] = 1;
        } else if (lastKd[ii] > rF1[ii]) {
            rL1[ii] = lastKd[ii] - rF1[ii];
            jump2[ii] = 0;
        } else if (lastKd[ii] < rF1[ii]) {
            rL1[ii] = lastKd[ii] - rF1[ii] + SSR;
            jump2[ii] = 1;
        } else {
            throw std::runtime_error("Case not considered!");
        }

        // First2 computation
        rF2[ii] = rL1[ii] == SSR ? SSR : SSR - rL1[ii];

        // Last2 computation
        if (rF1[ii] == SSR) {
            rL2[ii] = lastE[ii];
            jump1[ii] = 0;
        } else if (rF1[ii] == lastE[ii]) {
            rL2[ii] = SSR;
            jump1[ii] = 1;
        } else if (lastE[ii] > rF1[ii]) {
            rL2[ii] = lastE[ii] - rF1[ii];
            jump1[ii] = 0;
        } else if (lastE[ii] < rF1[ii]) {
            rL2[ii] = lastE[ii] - rF1[ii] + SSR;
            jump1[ii] = 1;
        } else {
            throw std::runtime_error("Case not considered!");
        }

        // Update rF1 for next iteration
        if (ii < ldpc_config.C - 1) {
            rF1[ii + 1] = rL2[ii] == SSR ? SSR : SSR - rL2[ii];
        }
    }

    // Calculate punctured, fillers, and zeros values
    int lastPunctured = 2 * ldpc_config.Zc % SSR == 0 ? SSR : 2 * ldpc_config.Zc % SSR;
    int lastFillers = ldpc_config.F % SSR == 0 ? SSR : ldpc_config.F % SSR;
    int lastZeros = (ldpc_config.N - ldpc_config.E[0] - ldpc_config.F) % SSR == 0 ? SSR : (ldpc_config.N - ldpc_config.E[0] - ldpc_config.F) % SSR;

    // Check if N is a multiple of SSR
    if (ldpc_config.N % SSR != 0) {
        std::cerr <<"FPGA_IP: LDPC N is not a multiplier or SSR factor.";
    }


    return ldpc_config;
}