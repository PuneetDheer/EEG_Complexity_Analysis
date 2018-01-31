% CODED BY : PUNEET DHEER (RF)
% DATE : 19-01-2018
% Lempel-Ziv-Welch Compression for EEG analysis
% INPUT: 
% B_T_Series: Binary time series (consist of series 1 and 2 only)

% OUTPUT
% LEN: Length of the Dictionary
% dict: Dictionary containing the strings

function [ LEN,dict] = Compression_v1( B_T_Series )

 
 w =[];
 tic
 dict={};
 %dict = cell(1,length(B_T_Series));
for c = 1: length(B_T_Series)
  NUM = [w B_T_Series(c)];
  j=1;
   
  if isempty(dict)
      dict{1,1} = NUM;
      w = B_T_Series(c);
      len=length(dict);
  else
      while j<=len
       
          if length(NUM)==length(dict{1,j})
              
              if(mean(abs(NUM-dict{1,j}))==0)
                  w=NUM;
                  j=len+1;
              else
                  if j==len
                      dict{1,end+1}=NUM;
                      w = B_T_Series(c);
                  end
                  
                  j=j+1;
              end
              
          elseif j==len
              dict{1,end+1}=NUM;
              w = B_T_Series(c);
              j=j+1;
          
          else
              j=j+1;
          end
          
      end
  len=length(dict); 
  %len=sum(~cellfun(@isempty,dict),2);  
  end
end

%LEN=sum(~cellfun(@isempty,dict),2);
LEN = length(dict);

toc

