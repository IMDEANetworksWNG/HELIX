clear, clc;

% This function will have to point to the transmitter samples to validate the data
DEC = CONFIG_5G_DECODER(['/slotFR2_CH1_NRE145']);

% This is the filename of the RX data
folder =['SPLIT6'];

frame_num=5;

save_data=false;

SIGNAL.FR=2;
SIGNAL.SCS=240;
SIGNAL.PLOT_RESULTS=false;

%%
wrong_bits=zeros(frame_num,1);
snr=zeros(frame_num,1);
bad_pkts_ind=zeros(frame_num,1);
packet_not_detected=0;

for frame_idx= 0:frame_num-1
%for frame_idx= 0
   fn=[folder '/Packet_' num2str(frame_idx)];
   
   try
      f=fopen([fn '.bin']);
      XX=double(fread(f,'*uint16'));
      fclose(f);
   catch
      packet_not_detected=packet_not_detected+1;
      continue
   end
   bits = int2bit(XX,16,false);

   packetLength = DEC.nInfoBits * DEC.nCodewords; 

   info = nrDLSCHInfo(DEC.trBlkSizes,DEC.decodeDLSCH.TargetCodeRate);
   decoded = reshape(bits,info.K,info.C); 
   desegmented = nrCodeBlockDesegmentLDPC(decoded,info.BGN,DEC.trBlkSizes+info.L);
   [decbits,blkErr] = nrCRCDecode(desegmented,info.CRC);


%    disp(['SNR (SW) = ' num2str(SNR)]);
%    snr(frame_idx+1)=SNR;
   wrong_bits(frame_idx+1)=sum(DEC.trBlk ~= decbits);
   disp(['BER = ' num2str(sum(DEC.trBlk ~= decbits)) '/' num2str(length(decbits))]);
   if wrong_bits(frame_idx+1) > 0
      bad_pkts_ind(frame_idx+1)=1;
   end
   
end

fn=[folder '/SNR_values' ];
      
f=fopen([fn '.bin']);
XX=double(fread(f,'*double'));
fclose(f);

frame_num=frame_num-packet_not_detected;

pssEnergy = fi(0,1,25,11);
pssEnergy.int = XX(1:frame_num)*power(2,16);
noiseEst = fi(0,1,32,31);
noiseEst.int = XX(frame_num+1:end)*power(2,31);
power_ratio=((double(pssEnergy)/256) - (double(noiseEst)/2048) ) ./ ((double(noiseEst)/2048));
snr=pow2db(power_ratio(power_ratio> 0));


mean_snr= trimmean(double(snr),20);


total_bits=length(DEC.trBlk)*(frame_num);

disp(['BER = ' num2str(sum(wrong_bits(:))) '/' num2str(total_bits)]);
disp(['Mean SNR = ' num2str(mean_snr) ' dB']);

if save_data
   save([folder '/BER.mat'],"total_bits","bad_pkts_ind","snr","wrong_bits","mean_snr");
end