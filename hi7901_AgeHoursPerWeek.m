function exit = hi7901_AgeHoursPerWeek(selection)   %**Derrick Hornes**%
exit = 0;
%% Load and Extract Data
%clear; clc; close all;     %##DEBUG##%
%load ('adult.mat');        %##DEBUG##%
global adult;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Create Individual Age Hour/Wk Arrays (for potential usage)
ageFullList = {'17','18','19','20','21','22','23','24','25','26','27',...
    '28','29','30','31','32','33','34','35','36','37','38','39','40',...
    '41','42','43','44','45','46','47','48','49','50','51','52','53',...
    '54','55','56','57','58','59','60','61','62','63','64','65','66',...
    '67','68','69','70','71','72','73','74','75','76','77','78','79',...
    '80','81','82','83','84','85','86','87','88','89','90'}';
ageFull = min(adult.age):max(adult.age);
fnlwgtFull = zeros(length(ageFull),1);
averageFull = zeros(length(ageFull),1);
for i = 1:length(averageFull)
    fnlwgtFull(i) = sum(adult.fnlwgt(adult.age == i+16));
    averageFull(i) = sum(adult.hours_per_week(adult.age == i+16)...
        .*adult.fnlwgt(adult.age == i+16))/fnlwgtFull(i);
    if isnan(averageFull(i))
        averageFull(i) = 0;
    end
end
clear i;


%% Create Age Range Table

age = categorical({'17-20';'21-30';'31-40';...  
    '41-50';'51-60';'61-70';'71-80';'81-90'});
fnlwgt = zeros(8,1);
hours_per_week = zeros(8,1);

fnlwgt(1) = sum(adult.fnlwgt((adult.age >= 17)&(adult.age <= 20)));
hours_per_week(1) = sum(adult.hours_per_week((adult.age >= 17)&(adult.age <= 20))...
    .*adult.fnlwgt((adult.age >= 17)&(adult.age <= 20)));
for idx = 1:length(age)-1
    rangePos = [(idx*10)+11, (idx*10)+20];      %Relate age to idx
    hours_per_week(idx+1) = sum(adult.hours_per_week((adult.age >= rangePos(1))&(adult.age <= rangePos(2)))...
        .*adult.fnlwgt((adult.age >= rangePos(1))&(adult.age <= rangePos(2))));
    fnlwgt(idx+1) = sum(adult.fnlwgt((adult.age >= rangePos(1))&(adult.age <= rangePos(2))));
end
ageHoursTable = table(age, fnlwgt, hours_per_week);
clear rangePos fnlwgt hours_per_week;


%% Store Averages

average = zeros(length(age), 1);
average(1) = sum(ageHoursTable.hours_per_week(1)/ageHoursTable.fnlwgt(1));
for idx = 1:length(age)-1
    average(idx+1) = sum(ageHoursTable.hours_per_week(idx+1)/ageHoursTable.fnlwgt(idx+1));
end                 %Calculate average for each age
ageAverage = table(age, average);
clear idx count average;


%% Visual Representation

%selection = 3;     %##DEBUG##%

switch selection
    case 3              %##PIE CHART##%
        figure('Name','Age-Hours/Wk Pie Graph','NumberTitle','off');
        pie(ageAverage.average,{'17-20';'21-30';'31-40';...
            '41-50';'51-60';'61-70';'71-80';'81-90'});
        title('Average Hours per Week vs. Age')
    case 4              %##BAR GRAPH##%
        figure('Name','Age-Hours/Wk Bar Graph','NumberTitle','off');
        bar(age,ageAverage.average)
        title('Average Hours per Week vs. Age')
        xlabel('Age')
        ylabel('Average Hours per Week')
    case 5              %##BUBBLE CLOUD##%
        figure('Name','Age-Hours/Wk Bubble Cloud','NumberTitle','off');
        bubblecloud(ageAverage, 'average','age')
        title('Average Hours per Week vs. Age')
    case 6              %##SCATTER PLOT##%
        figure('Name','Age-Hours/Wk Scatter Plot','NumberTitle','off');
        hold on
        scatter(ageFull,averageFull)
        plot(ageFull,hi7901_FitLine(ageFull,averageFull,3),'r')
        title('Average Hours per Week vs. Age')
        xlabel('Age')
        ylabel('Average Hours per Week')
        legend('Actual','Trend','location','best')
        hold off
    case 7              %##BUBBLE CHART##%
        figure('Name','Age-Hours/Wk Bubble Chart','NumberTitle','off');
        bubblechart(adult.age,adult.hours_per_week,adult.fnlwgt)
        title('Average Hours per Week vs. Age')
        xlabel('Age')
        ylabel('Average Hours per Week')
    case 8              %##LINE PLOT##%
        figure('Name','Age-Hours/Wk Line Plot','NumberTitle','off');
        hold on
        plot(ageFull,averageFull,'b')
        plot(ageFull,hi7901_FitLine(ageFull,averageFull,2),'r')
        title('Average Hours per Week vs. Age')
        xlabel('Age')
        ylabel('Average Hours per Week')
        legend('Actual','Trend','location','best')
        hold off
end
end