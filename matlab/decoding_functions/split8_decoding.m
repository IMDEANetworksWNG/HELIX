clear, clc;

% This function will have to point to the transmitter samples to validate the data
DEC = CONFIG_5G_DECODER(['/slotFR2_CH1_NRE145']);

% This is the filename of the RX data
folder =['../SPLIT8'];

frame_num=5;

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

%%
for frame_idx= 0:frame_num-1
   DEC_loop=DEC;
   fn=[folder '/Packet_' num2str(frame_idx)];
         
   f=fopen([fn '.bin']);
   try
   XX=double(fread(f,'*int16'));
   catch
      continue;
   end
   fclose(f);

   XX = reshape(XX,4,[]);
   
   I1 = XX(1:2,:);
   I1 = I1(:);
   
   Q1 = XX(3:4,:);
   Q1 = Q1(:);

   IQ_samples = complex(I1,Q1);%./SIGNAL.scaling;
   
   Scaling=2^15;
   rxWaveform=IQ_samples./Scaling;
   
   if enable_plot == true
      figure(1), clf;
      plot(real(rxWaveform));
      hold on
      plot(imag(rxWaveform));
   end
   
   [SSB_INFO] = SSB_DECODING_FCN([rxWaveform' zeros(1,30976-length(rxWaveform))]',DEC_loop,SIGNAL);
   pss_energy = SSB_INFO(1).pssEnergy;
   
   rxGrid = nrOFDMDemodulate(DEC_loop.carrier, rxWaveform);
   
   if size(rxGrid,2) > 14 % single slot
       rxGrid = rxGrid(:,1:14);
   end
   
  
   [K,L,R] = size(rxGrid);
   if (L < DEC_loop.carrier.SymbolsPerSlot)
       rxGrid = cat(2,rxGrid,zeros(K,DEC_loop.carrier.SymbolsPerSlot-L,R));
   end
   

   % Practical channel estimation between the received grid and each transmission
   % layer, using the PDSCH DM-RS for each layer. This channel estimate includes
   % the effect of transmitter precoding
   [estChannelGrid,noiseEst] = nrChannelEstimate(DEC_loop.carrier,rxGrid,DEC_loop.dmrsIndices,DEC_loop.dmrsSymbols,'CDMLengths',DEC_loop.pdsch.DMRS.CDMLengths); 
   
   % Get PDSCH resource elements from the received grid and channel estimate
   [pdschRx,pdschHest] = nrExtractResources(DEC_loop.pdschIndices,rxGrid,estChannelGrid);
   
   
   % Get precoding matrix for next slot
   %newWtx = getPrecodingMatrix(carrier,pdsch,estChannelGridPorts);
   
   % Equalization
   [pdsch,csi] = nrEqualizeMMSE(pdschRx,pdschHest,noiseEst);

 
   % Initialize temporary grid to store equalized symbols
   tempGrid = nrResourceGrid(DEC_loop.carrier,DEC_loop.pdsch.NumLayers);
   
   % Extract PT-RS symbols from received grid and estimated
   % channel grid
   [ptrsRx,ptrsHest,~,~,ptrsHestIndices,ptrsLayerIndices] = nrExtractResources(DEC_loop.ptrsIndices,rxGrid,estChannelGrid,tempGrid);
       
   % Equalize PT-RS symbols and map them to tempGrid
   ptrsEq = nrEqualizeMMSE(ptrsRx,ptrsHest,noiseEst);
   tempGrid(ptrsLayerIndices) = ptrsEq;
   
   % Estimate the residual channel at the PT-RS locations in tempGrid
   cpe = nrChannelEstimate(tempGrid,DEC_loop.ptrsIndices,DEC_loop.ptrsSymbols(1:size(DEC.ptrsIndices)));
   
   % Sum estimates across subcarriers, receive antennas, and layers. 
   % Then, get the CPE by taking the angle of the resultant sum
   cpe = angle(sum(cpe,[1 3 4]));
   
   % Map the equalized PDSCH symbols to tempGrid
   tempGrid(DEC_loop.pdschIndices) = pdsch;
   
   % Correct CPE in each OFDM symbol within the range of reference
   % PT-RS OFDM symbols
   symLoc = DEC_loop.pdschIndicesInfo.PTRSSymbolSet(1)+1:DEC_loop.pdschIndicesInfo.PTRSSymbolSet(end)+1;
   tempGrid(:,symLoc,:) = tempGrid(:,symLoc,:).*exp(-1i*cpe(symLoc));
   
   % Extract PDSCH symbols
   pdsch = tempGrid(DEC_loop.pdschIndices);
   
   DEC_loop.decodeDLSCH.TransportBlockLength = DEC_loop.trBlkSizes;
   
   if enable_plot == true
      figure(2), clf;
      scatter(real(pdsch),imag(pdsch),'.b');
      grid on; xlim([-1.2 1.2]); ylim([-1.2 1.2]);
   end
   
   [dlschLLRs,rxSymbols] = nrPDSCHDecode(DEC_loop.carrier,DEC_loop.pdsch,pdsch,noiseEst);
   [decbits] = DEC_loop.decodeDLSCH(dlschLLRs,DEC_loop.pdsch.Modulation,DEC_loop.pdsch.NumLayers,0);

   SNR = pow2db( ((SSB_INFO.pssEnergy/256) - (noiseEst/2048)) /(noiseEst/2048));

   
   snr(frame_idx+1)=SNR;
   wrong_bits(frame_idx+1)=sum(DEC_loop.trBlk ~= decbits);
   if wrong_bits(frame_idx+1) > 0 
      bad_pkts_ind(frame_idx+1)=1;
      if (threshold && wrong_bits(frame_idx+1) > 10)
         wrong_bits(frame_idx+1)=0;
      end
   end
   total_bits=total_bits+length(decbits);

   if disp_results
         disp(['SNR (SW) = ' num2str(SNR)]);
         disp(['BER = ' num2str(sum(DEC_loop.trBlk ~= decbits)) '/' num2str(length(decbits))]);
   end
end

mean_snr= trimmean(double(snr),20);
disp(['BER = ' num2str(sum(wrong_bits(:))) '/' num2str(total_bits)]);
disp(['Mean SNR = ' num2str(mean_snr) ' dB']);

if save_data
   save([folder '/BER.mat'],"total_bits","bad_pkts_ind","snr","wrong_bits","mean_snr");
end
