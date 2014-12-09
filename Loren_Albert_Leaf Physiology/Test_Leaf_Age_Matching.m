clc
clear

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% code for Loren to join the data sheet
% Jin Wu, University of Arizona, 2014-December
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

folder='.\';
fn1='master_curve_list_new_v3.csv';
fn2='master_curve_list_new_v2_JW.xlsx';

%% The goal is to match fn2 into fn1 order and assign the leaf age information
[num1 txt1 raw1]=xlsread([folder fn1]);
[num2 txt2 raw2]=xlsread([folder fn2]);

Range=[3:222 227:450];


for i=2:length(raw1(:,15))
    str=raw1(i,15);
    temp=raw2(Range,15);
    if iscellstr(str)
        str1=str{1};
        if str1(1)=='A'
            ind=strmatch(str1, temp,'exact');
            if length(ind)>0
                Output(i,1)=raw2(Range(ind(1)),13); %% Age 
                Output(i,2)=raw2(Range(ind(1)),14); %% Comment
                Output(i,3)=raw2(Range(ind(1)),15); %% ID
                Output(i,4)={length(ind)}; %% number of replicate
                Output(i,5)={'ACI'};
            end
        elseif str1(1)=='L'
            ind=strmatch(str1, temp,'exact');
            if length(ind)>0
                Output(i,1)=raw2(Range(ind(1)),13); %% Age 
                Output(i,2)=raw2(Range(ind(1)),14); %% Comment
                Output(i,3)=raw2(Range(ind(1)),15); %% ID
                Output(i,4)={length(ind)}; %% number of replicate
                Output(i,5)={'LC'};
            end
        end
        
        clear str1
    end
    
    clear str temp
end
