% CODED BY : PUNEET DHEER (RF)
% DATE : 19-01-2018
% Lempel-Ziv-Welch Compression windowed analysis
% INPUT: 
% X: EEG data (column-wise data)
% Ws: window size in sample
% Lp: Leave point (shift the window by Lp sample point)

% OUTPUT
% Norm_LZc: Normalized Lempel-ziv-w complexity [0 1]
% where 0 represent less complex(less random) and 1 represent maximum complexity(more random)

function [Norm_LZc]= Lzc(X,Ws,Lp)

Lw=1;
Z=Ws;
tic
X1=X;
tic
windows=ceil((length(X1)-Ws+1)/Lp); 
%figure
for iii=1:windows
    iii
    X = zscore(X1(Lw:Z,:));
    B_T_S = Binarized_time_series( X );
    [raw_LEN,raw_d] = Compression_v1( B_T_S );
    
    shuffle_B_T_S=B_T_S(randperm(length(B_T_S)));
    [ran_LEN,ran_d] = Compression_v1( shuffle_B_T_S );
    
    Norm_LZc(iii) = raw_LEN/ran_LEN;
    
    Lw=Lw+Lp;
    Z=Z+Lp;
end
toc