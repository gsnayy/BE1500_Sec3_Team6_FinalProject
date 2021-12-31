function exit = hi7901_AgeIncome(selection)         %**Derrick Hornes**%
exit = 0;
%% Load and Extract Data
% clear; clc; close all;     %##DEBUG##%
% load ('adult.mat');        %##DEBUG##%
 global adult;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Create Individual Age Arrays (for potential usage)
ageFullList = {'17','18','19','20','21','22','23','24','25','26','27',...
    '28','29','30','31','32','33','34','35','36','37','38','39','40',...
    '41','42','43','44','45','46','47','48','49','50','51','52','53',...
    '54','55','56','57','58','59','60','61','62','63','64','65','66',...
    '67','68','69','70','71','72','73','74','75','76','77','78','79',...
    '80','81','82','83','84','85','86','87','88','89','90'}';
ageFull = min(adult.age):max(adult.age);
fnlwgtFull = zeros(length(ageFull),1);
below_50k_Full = zeros(length(ageFull),1);
above_50k_Full = zeros(length(ageFull),1);
for i = 1:length(ageFull)                   %age/fnlwgt/<=50k/>50k arrays
    fnlwgtFull(i) = sum(adult.fnlwgt(adult.age == i+16));
    below_50k_Full(i) = sum(adult.fnlwgt((adult.age == i+16)...
        &(adult.income == '<=50K')));
    above_50k_Full(i) = sum(adult.fnlwgt((adult.age == i+16)...
        &(adult.income == '>50K')));
end
clear i;


%% Create Age Range Table

age = categorical({'17-20';'21-30';'31-40';...  
    '41-50';'51-60';'61-70';'71-80';'81-90'});
fnlwgt = zeros(8,1);
below_50k = zeros(8,1);
above_50k = zeros(8,1);

fnlwgt(1) = sum(adult.fnlwgt((adult.age >= 17)&(adult.age <= 20)));
below_50k(1) = sum(adult.fnlwgt((adult.age >= 17)&...
        (adult.age <= 20)&(adult.income == '<=50K')));
above_50k(1) = sum(adult.fnlwgt((adult.age >= 17)&...
        (adult.age <= 20)&(adult.income == '>50K')));
for idx = 1:length(age)-1
    rangePos = [(idx*10)+11, (idx*10)+20];      %Relate age to idx
    below_50k(idx+1) = sum(adult.fnlwgt((adult.age >= rangePos(1))&...
        (adult.age <= rangePos(2))&(adult.income == '<=50K')));
    above_50k(idx+1) = sum(adult.fnlwgt((adult.age >= rangePos(1))&...
        (adult.age <= rangePos(2))&(adult.income == '>50K')));
    fnlwgt(idx+1) = sum(adult.fnlwgt((adult.age >= rangePos(1))&(adult.age <= rangePos(2))));
end
ageIncomeTable = table(age, fnlwgt, below_50k, above_50k);
clear rangePos fnlwgt below_50k above_50k;


%% Visual Representation

% selection = 3;      %##DEBUG##%

switch selection
    case 3              %##PIE CHART##%
        f = figure('Name','Age-Income Pie Graph','NumberTitle','off');
        f.Position = [500,500,800,400];
        subplot(1,2,1)
        pie(ageIncomeTable.below_50k,{'17-20';'21-30';'31-40';...
            '41-50';'51-60';'61-70';'71-80';'81-90'})
        title('<= 50K')
        subplot(1,2,2)
        pie(ageIncomeTable.above_50k,{'17-20';'21-30';'31-40';...
            '41-50';'51-60';'61-70';'71-80';'81-90'})
        title('> 50K')
        sgtitle('Income vs. Age')
        clear f;
    case 4              %##BAR GRAPH##%
        figure('Name','Age-Income Bar Graph','NumberTitle','off');
        b = bar(age,[ageIncomeTable.below_50k./ageIncomeTable.fnlwgt.*100,...
            ageIncomeTable.above_50k./ageIncomeTable.fnlwgt.*100]);
        title('Income vs. Age')
        xlabel('Age')
        ylabel('Population (%)')
        legend('<= 50K','> 50K','location','north')
        text(b(1).XEndPoints,b(1).YEndPoints,string(b(1).YData),...
            'HorizontalAlignment','center','VerticalAlignment','bottom')
        text(b(2).XEndPoints,b(2).YEndPoints,string(b(2).YData),...
            'HorizontalAlignment','center','VerticalAlignment','bottom')
        clear b;
end
end    