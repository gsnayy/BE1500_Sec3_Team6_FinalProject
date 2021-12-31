function exit = hi7901_AgeCapital(selection)        %**Derrick Hornes**%
exit = 0;
%% Load and Extract Data
% clear; clc; close all;     %##DEBUG##%
% load ('adult.mat');        %##DEBUG##%
 global adult;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Create Individual Age Arrays (for potential usage)
netCap = adult.capital_gain-adult.capital_loss;
ageFullList = {'17','18','19','20','21','22','23','24','25','26','27',...
    '28','29','30','31','32','33','34','35','36','37','38','39','40',...
    '41','42','43','44','45','46','47','48','49','50','51','52','53',...
    '54','55','56','57','58','59','60','61','62','63','64','65','66',...
    '67','68','69','70','71','72','73','74','75','76','77','78','79',...
    '80','81','82','83','84','85','86','87','88','89','90'}';
ageFull = min(adult.age):max(adult.age);
fnlwgtFull = zeros(length(ageFull),1);
averageFull = zeros(length(ageFull),1);
for i = 1:length(averageFull)           %age/fnlwgt/average arrays
    fnlwgtFull(i) = sum(adult.fnlwgt(adult.age == i+16));
    averageFull(i) = sum((netCap(adult.age == i+16))...
        .*adult.fnlwgt(adult.age == i+16))/fnlwgtFull(i);
    if isnan(averageFull(i))
        averageFull(i) = 0;     %Set null values to 0
    end
end
clear i;


%% Create Age Range Table

age = categorical({'17-20';'21-30';'31-40';...  
    '41-50';'51-60';'61-70';'71-80';'81-90'});
fnlwgt = zeros(8,1);
net_capital = zeros(8,1);

fnlwgt(1) = sum(adult.fnlwgt((adult.age >= 17)&(adult.age <= 20)));
net_capital(1) = sum(netCap((adult.age >= 17)&(adult.age <= 20)));
for idx = 1:length(age)-1
    rangePos = [(idx*10)+11, (idx*10)+20];      %Relate age to idx
    net_capital(idx+1) = sum(netCap((adult.age >= rangePos(1))&(adult.age <= rangePos(2)))...
        .*adult.fnlwgt((adult.age >= rangePos(1))&(adult.age <= rangePos(2))));
    fnlwgt(idx+1) = sum(adult.fnlwgt((adult.age >= rangePos(1))&(adult.age <= rangePos(2))));
end
ageCapTable = table(age, fnlwgt, net_capital);
clear rangePos fnlwgt net_capital;


%% Store Averages

average = zeros(length(age), 1);
average(1) = sum(ageCapTable.net_capital(1)/ageCapTable.fnlwgt(1));
for idx = 1:length(age)-1
    average(idx+1) = sum(ageCapTable.net_capital(idx+1)/ageCapTable.fnlwgt(idx+1));
end                 %Calculate average for each age
ageAverage = table(age, average);
clear idx count average;


%% Visual Representation

%selection = 8;     %##DEBUG##%

switch selection
    case 3          %##PIE GRAPH##%
        figure('Name','Age-Capital Pie Graph','NumberTitle','off');
        pie(ageAverage.average/sum(ageAverage.average),...
            {'17-20';'21-30';'31-40';'41-50';'51-60';'61-70';'71-80';'81-90'});
        title('Average Capital Gains Ratio vs. Age')
    case 4          %##BAR GRAPH##%
        figure('Name','Age-Capital Bar Graph','NumberTitle','off');
        bar(age,ageAverage.average/sum(ageAverage.average))
        title('Average Capital Gains Ratio vs. Age')
        xlabel('Age')
        ylabel('Average Capital Gains Ratio')
    case 5          %##BUBBLE CLOUD##%
        figure('Name','Age-Capital Bubble Cloud','NumberTitle','off');
        bubblecloud(ageAverage,'average','age')
        title('Average Capital Gains vs. Age')
    case 6          %##SCATTER PLOT##%
        figure('Name','Age-Capital Scatter Plot','NumberTitle','off');
        hold on
        scatter(ageFull,averageFull)
        plot(ageFull,hi7901_FitLine(ageFull,averageFull,3),'r')
        title('Average Capital Gains vs. Age')
        xlabel('Age')
        ylabel('Average Capital Gains ')
        legend('Actual','Trend','location','best')
        hold off
    case 7          %##BUBBLE CHART##%
        figure('Name','Age-Capital Bubble Chart','NumberTitle','off');
        bubblechart(adult.age,netCap,adult.fnlwgt)
        title('Average Capital Gains vs. Age')
        xlabel('Age')
        ylabel('Average Capital Gains')
    case 8          %##LINE PLOT##%
        figure('Name','Age-Capital Line Plot','NumberTitle','off');
        hold on
        plot(ageFull,averageFull,'b')
        plot(ageFull,hi7901_FitLine(ageFull,averageFull,1),'r')
        title('Average Capital Gains vs. Age')
        xlabel('Age')
        ylabel('Average Capital Gains Ratio')
        legend('Actual','Trend','location','best')
        hold off
end
end