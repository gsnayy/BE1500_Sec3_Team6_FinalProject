function exit = hi7901_AgeOccupation(selection)     %**Derrick Hornes**%
exit = 0;
%% Load and Extract Data
% clear; clc; close all;     %##DEBUG##%
% load ('adult.mat');        %##DEBUG##%
 global adult;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Create Individual Age Arrays (for potential usage)
age = {'17','18','19','20','21','22','23','24','25','26','27',...
    '28','29','30','31','32','33','34','35','36','37','38','39','40',...
    '41','42','43','44','45','46','47','48','49','50','51','52','53',...
    '54','55','56','57','58','59','60','61','62','63','64','65','66',...
    '67','68','69','70','71','72','73','74','75','76','77','78','79',...
    '80','81','82','83','84','85','86','87','88','89','90'}';
occupations = {'Tech-support';'Craft-repair';'Other-service';...
    'Sales';'Exec-managerial';'Prof-specialty';'Handlers-cleaners';...
    'Machine-op-inspect';'Adm-clerical';'Farming-fishing';...
    'Transport-moving';'Priv-house-serv';'Protective-serv';...
    'Armed-Forces';'?'};
ageFull = min(adult.age):max(adult.age);
common_occupation = cell(length(ageFull),1);
occupationPop = zeros(15,1);
occupationFull = cell(length(age),3);
for i = 1:length(ageFull)
    for j = 1:15        %age/occupation table/common occupation cell array
        occupationPop(j) = sum(adult.fnlwgt((adult.age == i+16)&...
            (adult.occupation == occupations(j))));
    end
    if sum(occupationPop) == 0      %Set to ? if 0 fnlwgt
        common_occupation{i} = '?';
    else
    common_occupation{i} = occupations(occupationPop == max(occupationPop(1:14)));
    end
    occupationFull(i,1:3) = {age{i},...
        table(occupations,occupationPop),common_occupation{i}};
end
clear i j occupationPop common_occupation;

%% Create Age Range Table

age_range = categorical({'17-20';'21-30';'31-40';...  
    '41-50';'51-60';'61-70';'71-80';'81-90'});

%Initialize Values
%%%%%%%%%%%%%%%%%%%
total_fnlwgt = zeros(8,1);
occupation_fnlwgt = zeros(8,1);
common_occupation = categorical({'?';'?';'?';'?';'?';'?';'?';'?'});
total_fnlwgt(1) = sum(adult.fnlwgt((adult.age >= 17)&(adult.age <= 20)));
tempOccPop = zeros(length(occupations),1);

for idx = 1:4
    tempOccPop = tempOccPop + table2array(occupationFull{idx,2}(:,2));
end
occupation_fnlwgt(1) = max(tempOccPop(1:14));
common_occupation(1) = occupations{tempOccPop == occupation_fnlwgt(1)};
%%%%%%%%%%%%%%%%%%%

for idx = 1:length(age_range)-1
    rangePos = [(idx*10)+11, (idx*10)+20];  %relate age range to idx
    total_fnlwgt(idx+1) = sum(adult.fnlwgt...
        ((adult.age >= rangePos(1))&(adult.age <= rangePos(2))));
    tempOccPop(:,1) = 0;    %clear temp var
    for ageI = 1:10
        tempOccPop = tempOccPop +...    %Index in 1-10 intervals
           table2array(occupationFull{(((idx-1)*10)+ageI+4),2}(:,2));
    end
    occupation_fnlwgt(idx+1) = max(tempOccPop(1:14));
    common_occupation(idx+1) = occupations(tempOccPop == occupation_fnlwgt(idx+1));
end
ageOccupationTable = table(age_range,total_fnlwgt,occupation_fnlwgt,common_occupation);
clear idx ageI rangePos tempOccPop total_fnlwgt occupation_fnlwgt common_occupation;


%% Visual Representation

% selection = 4;      %##DEBUG##%

switch selection
    case 3              %##HEAT MAP##%
        figure('Name','Age-Occupation Heatmap','NumberTitle','off');
        heatmap(adult,'occupation','age','colorVariable',...
            'fnlwgt','ColorMethod','sum');
        title('Population')
    case 4              %##TABLES##%
        ageSel = 0;
        while ageSel ~= 2
            [ageSel, ~] = listdlg('PromptString',...
                    'Please select Age.','SelectionMode',...
                    'single','ListString',{'EXIT','BACK',age{:},'Condensed'});
            switch ageSel
                case 1      %Leave switch case
                case 2
                    exit = 0;
                case 77
                    disp(ageOccupationTable)
                otherwise
                    disp(occupationFull{ageSel-2,1})
                    disp(occupationFull{ageSel-2,2})
                    fprintf('\n')
            end
            if ageSel == 1
                exit = 1;
                return;
            end
        end
end
end    