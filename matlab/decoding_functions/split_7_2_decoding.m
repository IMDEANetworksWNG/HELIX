clear, clc;

% This function will have to point to the transmitter samples to validate the data
DEC = CONFIG_5G_DECODER(['/slotFR2_CH1_NRE145']);

% This is the filename of the RX data
folder =['SPLIT6'];

%%
fn=[folder '/Packet_4'];
f=fopen([fn '.bin']);
XX=double(fread(f,'*int16'));
fclose(f);

XX = reshape(XX,4,[]);

I1 = XX(1:2,:);
I1 = I1(:);

Q1 = XX(3:4,:);
Q1 = Q1(:);

validFlag = mod(Q1,2);
%XX = XX(validFlag==1);

IQ_samples = complex(I1(validFlag==1),Q1(validFlag==1));%./SIGNAL.scaling;

Scaling=2^14;

pdsch=IQ_samples./Scaling;
noiseEst = 1e-4;
%%

DEC.decodeDLSCH.TransportBlockLength = DEC.trBlkSizes;
figure(1), clf;
scatter(real(pdsch),imag(pdsch),'.b');
grid on; xlim([-1.2 1.2]); ylim([-1.2 1.2]);

%%

[dlschLLRs,rxSymbols] = nrPDSCHDecode(DEC.carrier,DEC.pdsch,pdsch,noiseEst);


%%
[decbits] = DEC.decodeDLSCH(dlschLLRs,DEC.pdsch.Modulation,DEC.pdsch.NumLayers,0);

disp(['BER = ' num2str(sum(DEC.trBlk ~= decbits)) '/' num2str(length(decbits))]);
