function test=Age_Specific_Leaf_Physiology_All_SP(Physiology, Mat1, Mat2)
%% Using environmental variables to filter the bad data
ind=find(Physiology(:,Mat1(1))>=28 & Physiology(:,Mat1(1))<=33 & Physiology(:,Mat1(2))<=1.5 &Physiology(:,Mat2(2))>0 & Physiology(:,Mat2(2))<300);
Physiology1=Physiology(ind,:);
clear ind

%% The scenarios for analysis
B=1:length(Physiology1(:,1));
A=find(Physiology1(:,Mat1(3))>0);
C=setdiff(B,A);
Physiology1(C,Mat1(3))=3;

%% case 1: Sun
LE=1;
indA=find(Physiology1(:,Mat1(4))==LE); %% only light constrained
indB=find(Physiology1(:,Mat1(4))==LE & Physiology1(:,Mat1(3))<4); %% QC_control
indC=find(Physiology1(:,Mat1(4))==LE & Physiology1(:,Mat1(3))<3); %% QC_control
indD=find(Physiology1(:,Mat1(4))==LE & Physiology1(:,Mat1(3))<2); %% QC_control

All_SP_Sun.V1=leaf_physiology_display(Physiology1(indA,Mat2), 'All-SP-Sun');
All_SP_Sun.V1.total=length(indA);
clear indA

All_SP_Sun.V2=leaf_physiology_display(Physiology1(indB,Mat2), 'All-SP-Sun-QC-4');
All_SP_Sun.V2.total=length(indB);
clear indB

All_SP_Sun.V3=leaf_physiology_display(Physiology1(indC,Mat2), 'All-SP-Sun-QC-3');
All_SP_Sun.V3.total=length(indC);
clear indC

All_SP_Sun.V4=leaf_physiology_display(Physiology1(indD,Mat2), 'All-SP-Sun-QC-2');
All_SP_Sun.V4.total=length(indD);
clear indD

%% case 2: Shade
LE=0;
indA=find(Physiology1(:,Mat1(4))==LE); %% only light constrained
indB=find(Physiology1(:,Mat1(4))==LE & Physiology1(:,Mat1(3))<4); %% QC_control
indC=find(Physiology1(:,Mat1(4))==LE & Physiology1(:,Mat1(3))<3); %% QC_control
indD=find(Physiology1(:,Mat1(4))==LE & Physiology1(:,Mat1(3))<2); %% QC_control

All_SP_Shade.V1=leaf_physiology_display(Physiology1(indA,Mat2), 'All-SP-Shade');
All_SP_Shade.V1.total=length(indA);
clear indA

All_SP_Shade.V2=leaf_physiology_display(Physiology1(indB,Mat2), 'All-SP-Shade-QC-4');
All_SP_Shade.V2.total=length(indB);
clear indB

All_SP_Shade.V3=leaf_physiology_display(Physiology1(indC,Mat2), 'All-SP-Shade-QC-3');
All_SP_Shade.V3.total=length(indC);
clear indC

All_SP_Shade.V4=leaf_physiology_display(Physiology1(indD,Mat2), 'All-SP-Shade-QC-2');
All_SP_Shade.V4.total=length(indD);
clear indD

%% case 3: All
indA=find(Physiology1(:,Mat1(4))>=0); %% only light constrained
indB=find(Physiology1(:,Mat1(4))>=0 & Physiology1(:,Mat1(3))<4); %% QC_control
indC=find(Physiology1(:,Mat1(4))>=0 & Physiology1(:,Mat1(3))<3); %% QC_control
indD=find(Physiology1(:,Mat1(4))>=0 & Physiology1(:,Mat1(3))<2); %% QC_control

All_SP.V1=leaf_physiology_display(Physiology1(indA,Mat2), 'All-SP');
All_SP.V1.total=length(indA);
clear indA

All_SP.V2=leaf_physiology_display(Physiology1(indB,Mat2), 'All-SP-QC-4');
All_SP.V2.total=length(indB);
clear indB

All_SP.V3=leaf_physiology_display(Physiology1(indC,Mat2), 'All-SP-QC-3');
All_SP.V3.total=length(indC);
clear indC

All_SP.V4=leaf_physiology_display(Physiology1(indD,Mat2), 'All-SP-QC-2');
All_SP.V4.total=length(indD);
clear indD


test.All_SP=All_SP;
test.All_SP_Sun=All_SP_Sun;
test.All_SP_Shade=All_SP_Shade;

