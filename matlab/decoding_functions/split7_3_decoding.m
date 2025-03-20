clear, clc;

% This function will have to point to the transmitter samples to validate the data
DEC = CONFIG_5G_DECODER(['./' rate '/slotFR2_CH1_NRE145']);

% This is the filename of the RX data
folder =['../SPLIT7_3'];

fn=[folder '/Packet_4'];

%%
f=fopen([fn '.bin']);
XX=double(fread(f,'*int16'));
fclose(f);

XX=XX(1:(floor(length(XX)/4)*4));

XX = reshape(XX,4,[]);

I1 = XX(1:2,:);
I1 = I1(:);

Q1 = XX(3:4,:);
Q1 = Q1(:);

validFlag = mod(Q1,2);
XX_comp = complex(I1(validFlag==1),Q1(validFlag==1));

dlschLLRs = [real(XX_comp),imag(XX_comp)].';
dlschLLRs = dlschLLRs(:);

Scaling=2^13;

dlschLLRs=dlschLLRs./Scaling;
noiseEst = 1e-4;
%%
DEC.decodeDLSCH.TransportBlockLength = DEC.trBlkSizes;

%%

[decbits] = DEC.decodeDLSCH(dlschLLRs,DEC.pdsch.Modulation,DEC.pdsch.NumLayers,0);

disp(['BER = ' num2str(sum(DEC.trBlk ~= decbits)) '/' num2str(numel(DEC.trBlk))]);
