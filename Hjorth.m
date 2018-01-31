% CODED BY : PUNEET DHEER
% DATE : 11-01-2018
% Reference:
% [1] https://doi.org/10.1016/0013-4694(70)90143-4
% INPUT:
% data = multichannel each column is a channel
% Ws = window size in sample point
% Lp = Shifting the window by Lp sample point

function [Activity, Mobility, Complexity]=Hjorth(data,Ws,Lp)

Lw=1;
Z=Ws;

windows=ceil((length(data)-Ws+1)/Lp); 

for i=1:windows
    
    fprintf('T_Windows: %d \n',i);
    
    window_data=data(Lw:Z,:); %windowed data
    
    %mean POWER
    Activity(i,:) = var(window_data);
    
    %mean FREQUENCY
    %This parameter is proportional to a standard deviation of the power spectrum
    Mobility(i,:) = std(diff(window_data))./std(window_data); 
    
    %represents the change in frequency
    Complexity(i,:) = (std(diff(diff(window_data)))./std(diff(window_data)))./(std(diff(window_data))./std(window_data));
    
    
    Lw=Lw+Lp;
    Z=Z+Lp;
        
    
end


end
