clear, clc;

% This function will have to point to the transmitter samples to validate the data
DEC = CONFIG_5G_DECODER(['/slotFR2_CH1_NRE145']);

% This is the filename of the RX data
folder =['../SPLIT7_2x'];


frame_num=20;

threshold=false;
enable_plot =true;
save_data=false;
disp_results=true;

SIGNAL.FR=2;
SIGNAL.SCS=240;
SIGNAL.PLOT_RESULTS=false;

%%

wrong_bits=zeros(frame_num,1);
snr=zeros(frame_num,1);
bad_pkts_ind=zeros(frame_num,1);
total_bits=0;
%%
load ./SSB_DECODING/HBF_64.mat
DEC.ddc1 = dsp.FilterCascade(dsp.Delay(6),hb0a,hb0b,hb0c);
DEC.ddc2 = dsp.FilterCascade(hb1,hb2,hb3);
clear hb0a hb0b hb0c hb1 hb2 hb3 ad gd transient

%load PSS PRE_FILTER
load ./SSB_DECODING/PSS_PRE_FILTER.mat
DEC.pssFilter = pssFilter;

%PSS search
load ./SSB_DECODING/PSS_filter_coeff.mat
DEC.PSS_filter_coeff = PSS_filter_coeff;

for frame_idx= 0:frame_num-1
    DEC_loop=DEC;
    fn=[folder '/Packet_' num2str(frame_idx)];
             
    
    f=fopen([fn '.bin']);
    XX=double(fread(f,'*int16'));
    fclose(f);
    
    XX = reshape(XX,4,[]);
    
    I1 = XX(1:2,:);
    I1 = I1(:);
    
    Q1 = XX(3:4,:);
    Q1 = Q1(:);
    
    
    IQ_samples = complex(I1,Q1);%./SIGNAL.scaling;
    
    Scaling=2^10;
    
    rxWaveform=IQ_samples./Scaling;
    
    rxGrid1 = reshape(rxWaveform,[DEC.numSC,DEC.carrier.SymbolsPerSlot]);
    rxGrid = rxGrid1;
    
    noiseEst = 1e-4;
    %%
    [K,L,R] = size(rxGrid);
    if (L < DEC.carrier.SymbolsPerSlot)
        rxGrid = cat(2,rxGrid,zeros(K,DEC.carrier.SymbolsPerSlot-L,R));
    end
    
    %%
    % Practical channel estimation between the received grid and each transmission
    % layer, using the PDSCH DM-RS for each layer. This channel estimate includes
    % the effect of transmitter precoding
    [estChannelGrid,noiseEst] = nrChannelEstimate(DEC.carrier,rxGrid,DEC.dmrsIndices,DEC.dmrsSymbols,'CDMLengths',DEC.pdsch.DMRS.CDMLengths); 
    
    % Get PDSCH resource elements from the received grid and channel estimate
    [pdschRx,pdschHest] = nrExtractResources(DEC.pdschIndices,rxGrid,estChannelGrid);
    
    
    % Get precoding matrix for next slot
    %newWtx = getPrecodingMatrix(carrier,pdsch,estChannelGridPorts);
    
    % Equalization
    [pdsch,csi] = nrEqualizeMMSE(pdschRx,pdschHest,noiseEst);
    
    %%
    % Initialize temporary grid to store equalized symbols
    tempGrid = nrResourceGrid(DEC.carrier,DEC.pdsch.NumLayers);
    
    % Extract PT-RS symbols from received grid and estimated
    % channel grid
    [ptrsRx,ptrsHest,~,~,ptrsHestIndices,ptrsLayerIndices] = nrExtractResources(DEC.ptrsIndices,rxGrid,estChannelGrid,tempGrid);
        
    % Equalize PT-RS symbols and map them to tempGrid
    ptrsEq = nrEqualizeMMSE(ptrsRx,ptrsHest,noiseEst);
    tempGrid(ptrsLayerIndices) = ptrsEq;
    
    % Estimate the residual channel at the PT-RS locations in tempGrid
    cpe = nrChannelEstimate(tempGrid,DEC_loop.ptrsIndices,DEC_loop.ptrsSymbols(1:size(DEC.ptrsIndices)));
    
    % Sum estimates across subcarriers, receive antennas, and layers. 
    % Then, get the CPE by taking the angle of the resultant sum
    cpe = angle(sum(cpe,[1 3 4]));
    
    % Map the equalized PDSCH symbols to tempGrid
    tempGrid(DEC.pdschIndices) = pdsch;
    
    % Correct CPE in each OFDM symbol within the range of reference
    % PT-RS OFDM symbols
    symLoc = DEC.pdschIndicesInfo.PTRSSymbolSet(1)+1:DEC.pdschIndicesInfo.PTRSSymbolSet(end)+1;
    tempGrid(:,symLoc,:) = tempGrid(:,symLoc,:).*exp(-1i*cpe(symLoc));
    
    % Extract PDSCH symbols
    pdsch = tempGrid(DEC.pdschIndices);
    
    %%
    
    DEC.decodeDLSCH.TransportBlockLength = DEC.trBlkSizes;
    
    if enable_plot
        figure(1), clf;
        scatter(real(pdsch),imag(pdsch),'.b');
        grid on; xlim([-1.2 1.2]); ylim([-1.2 1.2]);
    end
    
    
    %%
    
    [dlschLLRs,rxSymbols] = nrPDSCHDecode(DEC.carrier,DEC.pdsch,pdsch,noiseEst);
    
    
    %%
    % Decode the DL-SCH transport channel
    
    [decbits] = DEC.decodeDLSCH(dlschLLRs,DEC.pdsch.Modulation,DEC.pdsch.NumLayers,0);
    
    disp(['BER = ' num2str(sum(DEC.trBlk ~= decbits)) '/' num2str(length(decbits))]);
end