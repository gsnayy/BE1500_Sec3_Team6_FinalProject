function exit = hf7691_IncomevsSex(X)
global adult;
income=adult.income;
sex=adult.sex;


explode={};
labels={'<=50k','>50k'}; 
fprintf('select input 3 for male and female income pie charts,\nselect input 4 for male and female income histogram cart\n')
 
if X==3
       adult((adult.sex=='Male'),:); 
       pie(adult.income(adult.sex=='Male'),explode); %male pie chart vs. income
       title('Annual Male Income')
       figure
       adult((adult.sex=='Female'),:);
       pie(adult.income(adult.sex=='Female'),explode); %female pie chart vs.income
       title('Annual Female Income')
elseif X==4
    histogram(adult.income(adult.sex=='Male'));
       xlabel('Annual Income')
       ylabel('Number of people')
       title('Annual Male Income')
       figure
       histogram(adult.income(adult.sex=='Female'));
       xlabel('Annual Income')
       ylabel('Number of people')
       title('Annual Female Income')
end
   exit=0;
end



