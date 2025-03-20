function [correlation] = PSS_CORRELATION_FCN(x,q)
%PSS_CORRELATION Summary of this function goes here
%   Detailed explanation goes here

L = length(q);

% Split the correlation into two parts; one for each half
% of the PSS sequence in time.
partA    = filter(q(1:(L/2)),1,x);
xDelayed = [zeros(L/2,1); x(1:end-(L/2))];
partB    = filter(q((L/2)+1:end),1,xDelayed);

% Combine the two parts to give the overall correlation.
% Multiply PSS correlation by 2 since measurement only includes 1 in 2 samples.

correlation = (partA + partB);
% correlation = 2 * abs(partA + partB).^2;

end

