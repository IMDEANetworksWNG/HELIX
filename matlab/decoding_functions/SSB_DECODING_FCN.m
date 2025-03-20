function [SSB_INFO] = SSB_DECODING_FCN(X_61_44MHz,DEC_PARAM,SIGNAL)
% SSB decoding model

if SIGNAL.FR == 1
    X_7_68MHz = DEC_PARAM.ddc2(X_61_44MHz);
else
    X_7_68MHz = DEC_PARAM.ddc1(X_61_44MHz);
end

%% PSS correlation

%PSS pre-filter
X_7_68MHz_filt = DEC_PARAM.pssFilter(X_7_68MHz);
X_7_68MHz_filt = X_7_68MHz_filt(64:end);

%Correlations against PSS sequences
pssCorr = cell(3,1);
for pssIndex = 1:3
    [pssCorr{pssIndex}] = PSS_CORRELATION_FCN(double(X_7_68MHz_filt),DEC_PARAM.PSS_filter_coeff(:,pssIndex));
    pssCorr{pssIndex} = 2*abs(pssCorr{pssIndex}).^2;
end

%Dynamic Threshold
hardThreshold   = 128*(2^-12)^2;
PSSThreshold_dB = -6;                       % Strength threshold in dBs (0 is least sensitive).
G               = 10^(PSSThreshold_dB/10);  % Threshold scaling factor.
energyFilt      = repmat([0; 1],128,1);

% Multiply PSS energy measurement by 2 since measurement only includes 1 in 2 samples.
energy                             = 2 * filter(energyFilt,1,abs(double(X_7_68MHz_filt)).^2);
threshold                          = G * energy;
threshold(threshold<hardThreshold) = hardThreshold;

if SIGNAL.PLOT_RESULTS
    figure(3), clf;
    subplot(2,1,1);
    plot(pssCorr{1});
    hold on
    plot(pssCorr{2});
    plot(pssCorr{3});
    plot(threshold,'--k');
end

% Find PSS sequences 
pssList     = [];
peakIndices = [];
PSSCorrelation = zeros(length(pssCorr{1}),3);
for pssIndex = 1:3
%     [pssInfo,peakInfo] = pssSearchCore(pssCorr{pssIndex},energy,threshold,pssIndex-1,SIGNAL.SCS);
    [pssInfo,peakInfo] = pssSearchCore(pssCorr{pssIndex},energy,threshold,pssIndex-1,30); %hardcoded to work with 30KHz and 240KHz SCS
%     [pssInfo,peakInfo] = pssSearchCore(pssCorr{pssIndex},energy,threshold,pssIndex-1,240); %hardcoded to work with 30KHz and 240KHz SCS
    PSSCorrelation(:,pssIndex) = pssCorr{pssIndex};
    pssList                    = [pssList pssInfo];      %#ok<AGROW>
    peakIndices                = [peakIndices peakInfo]; %#ok<AGROW>
end

%% CFO Estimation

% load SSB_GRID_FR2.mat
% XX = fftshift(ifft(ssbGrid(:)));
% YY = xcorr(X_7_68MHz,XX);
% plot(real(YY(ceil(end/2):end)));

Nsym = OFDMSymbolLength(256);
cpCorr = cpCorrelation([double(X_7_68MHz)]);
% peakIndices_cpCorr = peakIndices-64; %FR1
peakIndices_cpCorr = peakIndices;

frequencyOffset_EST = zeros(length(pssList),1);
angle_est = zeros(length(pssList),1);
% Estimate fine frequency offset using CP.
for nn = 1:length(pssList)
    % The PSS correlation peak corresponds to the last sample of PSS, therefore add 3*Nsym
    % to find the CP correlation at the last sample of the SS block.
    cpCorrIndex = 3*Nsym + peakIndices_cpCorr(nn);
    angle_est(nn) = angle(cpCorr(cpCorrIndex));
    frequencyOffset_EST(nn) = round(SIGNAL.SCS * 1e3 * angle(cpCorr(cpCorrIndex)) / (2*pi));
%     frequencyOffset_EST(nn) = round(DEC_PARAM.SCS_TEMP * 1e3 * angle(cpCorr(cpCorrIndex)) / (2*pi));
end

%% SSS detection

%tDelta = 61.44e6 / (256 * subcarrierSpacing * 1e3);
SSB_INFO = cell(size(pssList)).';
for PSS_IND = 1:size(pssList,2)
    SSB_INFO{PSS_IND}.NCellID2 = pssList(PSS_IND).NCellID2;
    SSB_INFO{PSS_IND}.pssEnergy = pssList(PSS_IND).pssEnergy;
    SSB_INFO{PSS_IND}.psspeakIndices = peakIndices(PSS_IND);
    SSB_INFO{PSS_IND}.CFO = frequencyOffset_EST(PSS_IND);
    SSB_INFO{PSS_IND}.timingOffset = pssList(PSS_IND).timingOffset;

    pssInfo = pssList(PSS_IND);
    TIMING = peakIndices_cpCorr(PSS_IND)-Nsym;
    NCellID2 = pssInfo.NCellID2;

    [Lsym, Lfft, Lcp] = OFDMSymbolLength(256);
    NgridSize         = 240;

    % Determine time domain indices of ss block.
    ss_BlockIndices = (1:4*Lsym)+TIMING;

    % Extract SS block samples and remove cyclic prefix.
    ss_Block   = X_7_68MHz(ss_BlockIndices);
    ss_Symbols = reshape(ss_Block,Lsym,4);
    ss_fftInput  = ss_Symbols(Lcp+1:Lsym,:);

    % FFT. Divide output by sqrt(Lfft) to preserve the energy
    % between time and frequency domain samples.
    fftOutput = fftshift(fft(ss_fftInput)/sqrt(Lfft),1);
    % fftOutput = (fft(fftInput)/sqrt(Lfft));
    %     
    kStart      = (Lfft - NgridSize)/2;
    ssBlockGrid = fftOutput( kStart+1 : end-kStart, : );
    SSB_INFO{PSS_IND}.pbch_symbols = ssBlockGrid(:,2:end);
    % [sssInfo,sssDiagnostics] = decodeSSS(ssBlockGrid(nrSSSIndices),pssInfo.NCellID2);

    SSS_samples = ssBlockGrid(nrSSSIndices);

    % Set thresholds for SSS detection.
    SSS_hardThreshold = 127 * (2^-12)^2;
    SSS_threshold_dB  = -9;
    SSS_K = 10^(SSS_threshold_dB/10);

    % Generate candidate SSS sequences to correlate against
    Ncandidates = 336;
    candidates  = zeros(127,Ncandidates);

    for c=1:Ncandidates
        candidates(:,c) = nrSSS(3*(c-1)+NCellID2);
    end

        % The SSS reference sequences each have energy of 127.
        % Normalize the result as if the SSS sequences had
        % unit energy.
        correlation = abs(SSS_samples.'*candidates / sqrt(127)).^2;
        SSS_energy      = SSS_samples'*SSS_samples;
        SSS_threshold   = SSS_K * SSS_energy;

        if SSS_threshold < hardThreshold
            SSS_threshold = hardThreshold;
        end

        if SIGNAL.PLOT_RESULTS
            figure(3), subplot(2,1,2);
            plot(correlation), hold on, plot(ones(size(correlation)).*SSS_threshold,'--k');
        end

        [~,kmax] = max(correlation);
        if correlation(kmax) > SSS_threshold
            SSB_INFO{PSS_IND}.NCellID1 = kmax-1;
        else
            SSB_INFO{PSS_IND}.NCellID1 = [];
        end

%         sssInfo.sssCorrelation = correlation(kmax);
%         sssInfo.sssEnergy      = SSS_energy;
    %     sssInfo.sssEnergy      = pssInfo.pssEnergy;
end

SSB_INFO = cell2mat(SSB_INFO);

end %function
%%

function [pssInfo,peakInfo] = pssSearchCore(correlation,energy,threshold,NCellID2,SCS)
    %Search for SSS symbols in the time domain.
    %   timingOffset is optional. If provided, the function will search for a PSS near the specified
    %   offset. If no timingOffset is provided, the function will search for any PSS symbols
    %   and return a list of those detected.
    
    Nfft = 256;
    Lsym = OFDMSymbolLength(Nfft);
    
    % Timing reference.
    tDelta = 61.44e6 / (Nfft * SCS * 1e3);
    tMod   = 61.44e6 * 20e-3;
    tRef   = mod((0:length(correlation)-1)*tDelta,tMod);
    
    pssInfo  = [];
    peakInfo = [];
    
    % Remove 3*Nsym samples from the end of the correlation results, because it will not be possible
    % to estimate the frequency offset or demodulate the SS block of any PSS detected
    % in that part of the signal.
    detectionEnd = length(threshold)-3*Lsym;
    if detectionEnd >= 1
        corr   = correlation(1:detectionEnd,:);
        thresh = threshold(1:detectionEnd);
    end
    
    % Determine where the threshold is exceeded
    exceeds   = corr > thresh;
    survivors = corr .* exceeds;
    
    % Search mode: can return multiple PSS
    exceedingIndices = find(exceeds);
        
    % Keep track of where the search is resumed after each trigger.
    resumeIndex = 1;

    % For each point at which the correlation level exceeds the threshold
    for n=1:length(exceedingIndices)

        triggerIndex = exceedingIndices(n);

        % Only trigger the detector if the resume index has been reached.
        if triggerIndex >= resumeIndex

            % Perform a local search for the peak across 5 samples starting from the trigger point.
            [~,peakSubIndex] = max(survivors(triggerIndex:triggerIndex+4));
            peakIndex        = triggerIndex + peakSubIndex - 1;
            pss.NCellID2     = NCellID2;
            % timing offset: subtract tDelta * (Lsym-1) to get from end of PSS to start of SS block.
            pss.timingOffset   = mod(tRef(peakIndex) - tDelta * (Lsym-1),tMod);
            pss.pssCorrelation = corr(peakIndex);
            pss.pssEnergy      = energy(peakIndex);

            pssInfo  = [pssInfo pss]; %#ok<AGROW>
            peakInfo = [peakInfo peakIndex]; %#ok<AGROW>

            % Move the resume index to prevent further triggering until the search
            % window has been passed.
            resumeIndex = triggerIndex + 5;

        end

    end
    
end

function [Lsym, Lu, Lcp] = OFDMSymbolLength(Nfft)
    %function [Lsym, Lu, Lcp] = OFDMSymbolLength(Nfft)
    %   Returns the number of time domain samples, Lsym, in each
    %   OFDM symbol of the SS block. The useful part, Lu, and
    %   cyclic prefix length, Lcp, can also be returned
    %   optionally.
    
    Lu   = Nfft;
    Lcp  = 144 * Nfft/2048;
    Lsym = Lcp + Lu;
    
end

function y = cpCorrelation(x)
    %cpcorr Cyclic prefix correlation for 5G SS block
    %   Apply the CP correlation technique to the complex input signal, x,
    %   to generate the complex signal, y.
    %   Assumes that the signal is sampled at Fs = 256 * SCS * 1e3 Msps
    %   where SCS is 15 or 30.
    
    [Lsym, Lu, Lcp] = OFDMSymbolLength(256);
    
    % Multiply x by itself delayed by Nu (# useful period) samples and conjugated
    xDelayed  = [zeros(Lu,1); x(1:end-Lu)];
    cpProduct = x .* conj(xDelayed);
    
    % Apply a moving sum filter (moving average without the division) with a window size equal
    % to the CP length.
    cpXCorr = filter(ones(Lcp,1),1,cpProduct);
    
    % Moving sum over 4 OFDM symbols (i.e. the size of the SS block).
    y              = cpXCorr;
    cpXCorrDelayed = cpXCorr;
    for k = 1:3
        cpXCorrDelayed = [zeros(Lsym,1); cpXCorrDelayed(1:end-Lsym)];
        y              = y + cpXCorrDelayed;
    end
    
end
