function test=species_specific_leaf_physiology_display(Physiology, SPArray, SPID, flag, Mat1, Mat2, flexibility, LE)
%% Physiology-- Include all the physiology parameters
%% SPArray--the matrix of the species list
%% SPID--the target species ID
%% flag--the indicator of including light environment or not
%% Mat1--Environmental variables for quality control
%% Mat2--Age and Physiology Parameters
%% Flexibility--define how strict for the quality control


%% The Index for Mat1
% 1--Leaf T; 2--Leaf T std; 3--QC-code; 4--Light Environment

%% The Index for Mat2
% 1--Leaf Age; 2--Vcmax; 3--Jmax; 4--TPU; 5--Dark Respiration

%% About Flexibility
% 1--Very strict, QC=1, Sun=1, Shade=0; 2--QC<=2, Sun=1, Shade=0; 3--QC<=3,
% Sun=1, Shade=0; 4--QC<=2, Sun>=0.5, Shade=0 or QC<=2, Sun=1, Shade<=0.5;
% LE control

if length(SPID)>1 %% Display all the species
    Str1='All-SP';
    if flag==1 %% Display all the species
        Str1=[Str1 '-NLE'];
       if flexibility==1
           ind=find(Physiology(:,Mat1(1))>=28 & Physiology(:,Mat1(1))<=33 & Physiology(:,Mat1(2))<=1.5 &Physiology(:,Mat2(2))>0 & Physiology(:,Mat2(2))<400 & Physiology(:,Mat1(3))<2);
       elseif flexibility==2
           ind=find(Physiology(:,Mat1(1))>=28 & Physiology(:,Mat1(1))<=33 & Physiology(:,Mat1(2))<=1.5 &Physiology(:,Mat2(2))>0 & Physiology(:,Mat2(2))<400 & Physiology(:,Mat1(3))<3);
       elseif flexibility==3
           ind=find(Physiology(:,Mat1(1))>=28 & Physiology(:,Mat1(1))<=33 & Physiology(:,Mat1(2))<=1.5 &Physiology(:,Mat2(2))>0 & Physiology(:,Mat2(2))<400 & Physiology(:,Mat1(3))<4 );
       elseif flexibility==4
           ind=find(Physiology(:,Mat1(1))>=28 & Physiology(:,Mat1(1))<=33 & Physiology(:,Mat1(2))<=1.5 &Physiology(:,Mat2(2))>0 & Physiology(:,Mat2(2))<400 & Physiology(:,Mat1(3))<3);
       end
        
    else %% separate the species into different light environment
       if LE==1
           Str1=[Str1 '-Sun'];
       else
           Str1=[Str1 '-Shade'];
       end
       
       if flexibility==1
           ind=find(Physiology(:,Mat1(1))>=28 & Physiology(:,Mat1(1))<=33 & Physiology(:,Mat1(2))<=1.5 &Physiology(:,Mat2(2))>0 & Physiology(:,Mat2(2))<400 & Physiology(:,Mat1(3))<2 & Physiology(:, Mat1(4))==LE);
       elseif flexibility==2
           ind=find(Physiology(:,Mat1(1))>=28 & Physiology(:,Mat1(1))<=33 & Physiology(:,Mat1(2))<=1.5 &Physiology(:,Mat2(2))>0 & Physiology(:,Mat2(2))<400 & Physiology(:,Mat1(3))<3 & Physiology(:, Mat1(4))==LE);
       elseif flexibility==3
           ind=find(Physiology(:,Mat1(1))>=28 & Physiology(:,Mat1(1))<=33 & Physiology(:,Mat1(2))<=1.5 &Physiology(:,Mat2(2))>0 & Physiology(:,Mat2(2))<400 & Physiology(:,Mat1(3))<4 & Physiology(:, Mat1(4))==LE);
       elseif flexibility==4
           ind=find(Physiology(:,Mat1(1))>=28 & Physiology(:,Mat1(1))<=33 & Physiology(:,Mat1(2))<=1.5 &Physiology(:,Mat2(2))>0 & Physiology(:,Mat2(2))<400 & Physiology(:,Mat1(3))<3 & (Physiology(:, Mat1(4))==LE | Physiology(:, Mat1(4))==0.5));
       end 
    end
    
    Physiology2=Physiology(ind,Mat2);
else
    Str1=SPID{1};
    ind1=strmatch(SPID{1},SPArray,'exact');
    Physiology1=Physiology(ind1,:);
    if flag==1
        Str1=[Str1 '-NLE'];
        
        if flexibility==1
           ind=find(Physiology(:,Mat1(1))>=28 & Physiology(:,Mat1(1))<=33 & Physiology(:,Mat1(2))<=1.5 &Physiology(:,Mat2(2))>0 & Physiology(:,Mat2(2))<400 & Physiology(:,Mat1(3))<2);
       elseif flexibility==2
           ind=find(Physiology(:,Mat1(1))>=28 & Physiology(:,Mat1(1))<=33 & Physiology(:,Mat1(2))<=1.5 &Physiology(:,Mat2(2))>0 & Physiology(:,Mat2(2))<400 & Physiology(:,Mat1(3))<3);
       elseif flexibility==3
           ind=find(Physiology(:,Mat1(1))>=28 & Physiology(:,Mat1(1))<=33 & Physiology(:,Mat1(2))<=1.5 &Physiology(:,Mat2(2))>0 & Physiology(:,Mat2(2))<400 & Physiology(:,Mat1(3))<4 );
       elseif flexibility==4
           ind=find(Physiology(:,Mat1(1))>=28 & Physiology(:,Mat1(1))<=33 & Physiology(:,Mat1(2))<=1.5 &Physiology(:,Mat2(2))>0 & Physiology(:,Mat2(2))<400 & Physiology(:,Mat1(3))<3);
       end
    else
        if LE==1
           Str1=[Str1 '-Sun'];
       else
           Str1=[Str1 '-Shade'];
        end
       
        if flexibility==1
           ind=find(Physiology1(:,Mat1(1))>=28 & Physiology1(:,Mat1(1))<=33 & Physiology1(:,Mat1(2))<=1.5 &Physiology1(:,Mat2(2))>0 & Physiology1(:,Mat2(2))<400 & Physiology1(:,Mat1(3))<2 & Physiology1(:, Mat1(4))==LE);
       elseif flexibility==2
           ind=find(Physiology1(:,Mat1(1))>=28 & Physiology1(:,Mat1(1))<=33 & Physiology1(:,Mat1(2))<=1.5 &Physiology1(:,Mat2(2))>0 & Physiology1(:,Mat2(2))<400 & Physiology1(:,Mat1(3))<3 & Physiology1(:, Mat1(4))==LE);
       elseif flexibility==3
           ind=find(Physiology1(:,Mat1(1))>=28 & Physiology1(:,Mat1(1))<=33 & Physiology1(:,Mat1(2))<=1.5 &Physiology1(:,Mat2(2))>0 & Physiology1(:,Mat2(2))<400 & Physiology1(:,Mat1(3))<4 & Physiology1(:, Mat1(4))==LE);
       elseif flexibility==4
           ind=find(Physiology1(:,Mat1(1))>=28 & Physiology1(:,Mat1(1))<=33 & Physiology1(:,Mat1(2))<=1.5 &Physiology1(:,Mat2(2))>0 & Physiology1(:,Mat2(2))<400 & Physiology1(:,Mat1(3))<3 & (Physiology1(:, Mat1(4))==LE | Physiology(:, Mat1(4))==0.5));
       end  
    end
    Physiology2=Physiology1(ind,Mat2);    
end


if length(ind)>0
    Str=[Str1 '-QC-' num2str(flexibility)];
    test=leaf_physiology_display(Physiology2, Str);
else 
    test=0;
end

