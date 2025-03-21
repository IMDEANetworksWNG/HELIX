%GET Decoder Parameters from Tx file

function [DEC] = CONFIG_5G_DECODER(TX_FILE)

load Dmrs_Ptrs_Ssb_symbs.mat

TX_INFO = load([TX_FILE '.mat']);
DEC.simParameters = TX_INFO.simParameters;
DEC.trBlk = TX_INFO.trBlk;
DEC.carrier = DEC.simParameters.Carrier;
DEC.pdsch = DEC.simParameters.PDSCH;
[DEC.pdschIndices,DEC.pdschIndicesInfo] = nrPDSCHIndices(DEC.carrier,DEC.pdsch);
%DEC.ptrsSymbols = nrPDSCHPTRS(DEC.carrier,DEC.pdsch);
DEC.ptrsSymbols = ptrsSymbols;
DEC.ptrsIndices = nrPDSCHPTRSIndices(DEC.carrier,DEC.pdsch);
DEC.dmrsSymbols = nrPDSCHDMRS(DEC.carrier,DEC.pdsch);
DEC.dmrsIndices = nrPDSCHDMRSIndices(DEC.carrier,DEC.pdsch);
DEC.pdschextra = DEC.simParameters.PDSCHExtension;
DEC.trBlkSizes = nrTBS(DEC.pdsch.Modulation,DEC.pdsch.NumLayers,numel(DEC.pdsch.PRBSet),DEC.pdschIndicesInfo.NREPerPRB,DEC.pdschextra.TargetCodeRate,DEC.pdschextra.XOverhead);

% Create DL-SCH decoder system object to perform transport channel decoding
% Use layered belief propagation for LDPC decoding, with half the number of
% iterations as compared to the default for belief propagation decoding
DEC.simParameters.PDSCHExtension.LDPCDecodingAlgorithm = 'Normalized min-sum'; %'Layered belief propagation';
DEC.simParameters.PDSCHExtension.MaximumLDPCIterationCount = 10;
DEC.decodeDLSCH = nrDLSCHDecoder;
DEC.decodeDLSCH.TargetCodeRate = DEC.simParameters.PDSCHExtension.TargetCodeRate;
DEC.decodeDLSCH.LDPCDecodingAlgorithm = DEC.simParameters.PDSCHExtension.LDPCDecodingAlgorithm;
DEC.decodeDLSCH.MaximumLDPCIterationCount = DEC.simParameters.PDSCHExtension.MaximumLDPCIterationCount;

DEC.wtx = 1; % No precoding matrix 

DEC.numSC = DEC.carrier.NSizeGrid*12;
DEC.nInfoBits = TX_INFO.FPGA_INFO.IP_LDPC.K;
DEC.nCodewords = TX_INFO.FPGA_INFO.IP_LDPC.C;
DEC.FPGA_INFO = TX_INFO.FPGA_INFO;

end