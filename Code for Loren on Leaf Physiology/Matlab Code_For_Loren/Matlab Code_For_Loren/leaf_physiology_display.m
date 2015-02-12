function test=leaf_physiology_display(physiology,  Str)
%% Physiology data here: 2 dimensions of matrix
%% 1--Leaf Age Index; 2--Vcmax; 3--Jmax, 4--TPU, 5--Dark Respiration
y=physiology;

ind_age=find(y(:,1)>0);

folder='.\Physiology_Age\';
if length(ind_age)>0
%     y_Y=y(y(:,1)==1,:); %% Young Leaves
%     y_M=y(y(:,1)==2,:); %% Mature Leaves
%     y_O=y(y(:,1)==3,:); %% Old Leaves
%     
    %% Vcmax
    figure('color','white');
    boxplot(y(:,2),y(:,1));
    set(gca,'fontsize',14);
    xlabel('Leaf Age','fontsize',16);
    ylabel('Vcmax','fontsize',16);
    
    ymin=min(y(:,2));
    ymax=max(y(:,2));
    axis([0 4 ymin-0.1*(ymax-ymin) ymax+0.1*(ymax-ymin)+1e-6*ymin]);
    title(Str,'fontsize',16);
    
    saveas(1,[folder Str '-Vcmax']);
    saveas(1,[folder Str '-Vcmax' '.tif']);
    close(1);
    
    %% Jmax
    figure('color','white');
    boxplot(y(:,3),y(:,1));
    set(gca,'fontsize',14);
    xlabel('Leaf Age','fontsize',16);
    ylabel('Jmax','fontsize',16);
    
    ymin=min(y(:,3));
    ymax=max(y(:,3));
    axis([0 4 ymin-0.1*(ymax-ymin) ymax+0.1*(ymax-ymin)+1e-6*ymin]);
    title(Str,'fontsize',16);
    
    saveas(1,[folder Str '-Jmax']);
    saveas(1,[folder Str '-Jmax' '.tif']);
    close(1);
    
    
    %% TPU
    figure('color','white');
    boxplot(y(:,4),y(:,1));
    set(gca,'fontsize',14);
    xlabel('Leaf Age','fontsize',16);
    ylabel('TPU','fontsize',16);
    
    ymin=min(y(:,4));
    ymax=max(y(:,4));
    axis([0 4 ymin-0.1*(ymax-ymin) ymax+0.1*(ymax-ymin)+1e-6*ymin]);
    title(Str,'fontsize',16);
    
    saveas(1,[folder Str '-TPU']);
    saveas(1,[folder Str '-TPU' '.tif']);
    close(1);
    
    
    %% Dark Respiration
    figure('color','white');
    boxplot(y(:,5),y(:,1));
    set(gca,'fontsize',14);
    xlabel('Leaf Age','fontsize',16);
    ylabel('Respiration','fontsize',16);
    
    ymin=min(y(:,5));
    ymax=max(y(:,5));
    axis([0 4 ymin-0.1*(ymax-ymin) ymax+0.1*(ymax-ymin)+1e-6*ymin+1e-6*ymin]);
    title(Str,'fontsize',16);
    
    saveas(1,[folder Str '-Respiration']);
    saveas(1,[folder Str '-Respiration' '.tif']);
    close(1);  
    
end



if length(ind_age)>0
    y_Y=y(y(:,1)==1,:); %% Young Leaves
    y_M=y(y(:,1)==2,:); %% Mature Leaves
    y_O=y(y(:,1)==3,:); %% Old Leaves
    
    if length(y_Y(:,1))>0
        Output(1,1)=1;
        Output(1,2)=length(y_Y(:,1));
        Output(1,3)=mean(y_Y(:,2));
        Output(1,4)=std(y_Y(:,2));
        Output(1,5)=mean(y_Y(:,3));
        Output(1,6)=std(y_Y(:,3));
        Output(1,7)=mean(y_Y(:,4));
        Output(1,8)=std(y_Y(:,4));
        Output(1,9)=mean(y_Y(:,5));
        Output(1,10)=std(y_Y(:,5));
    else
        Output(1,1:10)=0;
    end

    if length(y_M(:,1))>0
        Output(2,1)=2;
        Output(2,2)=length(y_M(:,1));
        Output(2,3)=mean(y_M(:,2));
        Output(2,4)=std(y_M(:,2));
        Output(2,5)=mean(y_M(:,3));
        Output(2,6)=std(y_M(:,3));
        Output(2,7)=mean(y_M(:,4));
        Output(2,8)=std(y_M(:,4));
        Output(2,9)=mean(y_M(:,5));
        Output(2,10)=std(y_M(:,5)); 
    else
        Output(2,1:10)=0; 
    end
    
    if length(y_O(:,1))>0
        Output(3,1)=3;
        Output(3,2)=length(y_O(:,1));
        Output(3,3)=mean(y_O(:,2));
        Output(3,4)=std(y_O(:,2));
        Output(3,5)=mean(y_O(:,3));
        Output(3,6)=std(y_O(:,3));
        Output(3,7)=mean(y_O(:,4));
        Output(3,8)=std(y_O(:,4));
        Output(3,9)=mean(y_O(:,5));
        Output(3,10)=std(y_O(:,5));
    else
       Output(3,1:10)=0;  
    end
else
    Output(1:3,1:10)=0;
end

test.Output=Output;
Note(1)={'Age'};
Note(2)={'#obs'};
Note(3)={'mean-Vcmax'};
Note(4)={'std-Vcmax'};
Note(5)={'mean-Jmax'};
Note(6)={'std-Jmax'};
Note(7)={'mean-TPU'};
Note(8)={'std-TPU'};
Note(9)={'mean-Respiration'};
Note(10)={'std-Respiration'};

test.Note=Note;





