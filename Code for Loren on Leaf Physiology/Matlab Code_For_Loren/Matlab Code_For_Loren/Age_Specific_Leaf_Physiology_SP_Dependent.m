function test=Age_Specific_Leaf_Physiology_SP_Dependent(Physiology, Mat1, Mat2, SPArray)
%% The scenarios for analysis
B=1:length(Physiology(:,1));
A=find(Physiology(:,Mat1(3))>0);
C=setdiff(B,A);
Physiology(C,Mat1(3))=3;

%% Using environmental variables to filter the bad data
ind=find(Physiology(:,Mat1(1))>=28 & Physiology(:,Mat1(1))<=33 & Physiology(:,Mat1(2))<=1.5 &Physiology(:,Mat2(2))>0 & Physiology(:,Mat2(2))<300 & Physiology(:,Mat1(3))<4);
Physiology1=Physiology(ind,:);

SPArray1=SPArray(ind);
UID=unique(SPArray1);

clear ind

count=0;
for i=1:length(UID)
    Str1=UID{i};
    ind=strmatch(Str1,SPArray1);
    Physiology2=Physiology1(ind,:);
    
    ind1=find(Physiology2(:,Mat1(4))==1 | Physiology2(:,Mat1(4))==0.5);
    ind2=find(Physiology2(:,Mat1(4))==0 | Physiology2(:,Mat1(4))==0.5);
    
    if length(ind1)>0
        count=count+1; 
        Output(count,1)=length(ind1);
        temp=leaf_physiology_display(Physiology2(ind1,Mat2),  [Str1 '-Sun']);
        Phy_summary(count,1:10)=temp.Output(1,:);
        Phy_summary(count,11:20)=temp.Output(2,:);
        Phy_summary(count,21:30)=temp.Output(3,:);
        
        txt_summary(count,1)={[Str1 '-Sun']};
        clear temp
    end
    
    if length(ind2)>0
        count=count+1; 
        Output(count,1)=length(ind2);
        temp=leaf_physiology_display(Physiology2(ind2,Mat2),  [Str1 '-Shade']);
        Phy_summary(count,1:10)=temp.Output(1,:);
        Phy_summary(count,11:20)=temp.Output(2,:);
        Phy_summary(count,21:30)=temp.Output(3,:);
        
        txt_summary(count,1)={[Str1 '-Shade']};
        clear temp
    end
    
    
    clear ind ind1 ind2 Str1 Physiology2
end

test.Output=Output;
test.txt_summary=txt_summary;
test.Phy_summary=Phy_summary;

