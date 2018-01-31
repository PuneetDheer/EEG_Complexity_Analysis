% CODED BY : PUNEET DHEER (RF)
% DATE : 19-01-2018
% Lempel-Ziv-Welch Compression for EEG analysis
% INPUT: 
% B_T_Series: Binary time series (consist of series 1 and 2 only)

% OUTPUT
% LEN: Length of the Dictionary
% dict: Dictionary containing the strings

function [ LEN,dict] = Compression_v2( B_T_Series )

 
 w =[];
 tic
 dict={};
 %dict = cell(1,length(B_T_Series));
for c = 1: length(B_T_Series)
  NUM = [w B_T_Series(c)];
  NUM = strrep(mat2str(NUM),' ', ',');
     
  if isempty(dict)
      dict{1,1} = NUM;
      w = B_T_Series(c);
      len=length(dict);
  else
           
          if ismember(NUM,dict)
              
              w = str2num(NUM);
          else
              dict{1,end+1}=NUM;
              w = B_T_Series(c);
          end
              
  end
end

%LEN=sum(~cellfun(@isempty,dict),2);
LEN = length(dict);

toc

