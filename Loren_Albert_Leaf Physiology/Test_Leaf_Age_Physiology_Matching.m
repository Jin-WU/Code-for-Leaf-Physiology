clc
clear

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% code for Loren to join the data sheet
% Jin Wu, University of Arizona, 2014-December
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

folder='.\Physiology Data from Loren\';
fn1='master_curve_list_v4.csv';
fn2='Physiology_Variable_Master_Sheet_mac combined.csv';
fn3='Env_Variable_Master_Sheet_mac.csv';

[num1 txt1 raw1]=xlsread([folder fn1]);
[num2 txt2 raw2]=xlsread([folder fn2]);
[num3 txt3 raw3]=xlsread([folder fn3]);

n2=length(raw2(:,1));
Range2=[3:n2];

n3=length(raw3(:,1));
Range3=[3:n3];

temp2=raw2(Range2,1);
temp3=raw3(Range3,1);

for i=3:length(raw1(:,1))
    a=raw1(i,15);
    a1=a{1};
    a2=[a1(1:end-4) '.csv'];
    
    ind2=strmatch(a2, temp2,'exact');
    ind3=strmatch(a2, temp3,'exact');
    
    if length(ind2)>0
       Output2(i,1:length(raw2(1,:)))=raw2(Range2(ind2(1)),:);
       Output2(i,1)=a;
    end
    
    if length(ind2)>0
       Output3(i,1:length(raw3(1,:)))=raw3(Range3(ind3(1)),:);
       Output3(i,1)=a;
    end
   
    clear a a1 a2 ind2 ind3 
end
