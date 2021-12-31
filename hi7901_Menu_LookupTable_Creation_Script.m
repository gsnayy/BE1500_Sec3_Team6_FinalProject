%% Menu Lookup Table Creation Script                %**Derrick Hornes**%
clear; clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% selectionMatrix index represents selections from 3 levels of menus.
% 
% Manually enter desired function handles into cell indices.
% Enter UDFs as such: selectionMatrix{A,B,C} = @YourUDF;
% Assigned UDF will be called by "UdfHub"
%
% A = first menu selection, B = second menu selection, etc.
%
% Empty indices will be replaced with "Out of Bounds" ERROR dialog window.
% selectionMatrix.mat is saved folder this script is run from.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

selectionMatrix = cell(5,6,8);      %***Set matrix size (Menu sizes)***%
for d1 = 1:size(selectionMatrix,1)
    for d2 = 1:size(selectionMatrix,2)
        for d3 = 1:size(selectionMatrix,3)
            selectionMatrix{d1,d2,d3} = {};
        end
    end
end
clear d1 d2 d3;


%***ROOT MENU INDEX 2***%
    %**LEVEL ONE MENU INDEX 3**%
selectionMatrix{2,3,3} = @hi7901_AgeCapital;
selectionMatrix{2,3,4} = @hi7901_AgeCapital;
selectionMatrix{2,3,5} = @hi7901_AgeCapital;
selectionMatrix{2,3,6} = @hi7901_AgeCapital;
selectionMatrix{2,3,7} = @hi7901_AgeCapital;
selectionMatrix{2,3,8} = @hi7901_AgeCapital;

    %**LEVEL ONE MENU INDEX 4**%
selectionMatrix{2,4,3} = @hi7901_AgeIncome;
selectionMatrix{2,4,4} = @hi7901_AgeIncome;
selectionMatrix{2,4,5} = {};
selectionMatrix{2,4,6} = {};
selectionMatrix{2,4,7} = {};
selectionMatrix{2,4,8} = {};

    %**LEVEL ONE MENU INDEX 5**%
selectionMatrix{2,5,3} = @hi7901_AgeOccupation;
selectionMatrix{2,5,4} = @hi7901_AgeOccupation;
selectionMatrix{2,5,5} = {};
selectionMatrix{2,5,6} = {};
selectionMatrix{2,5,7} = {};
selectionMatrix{2,5,8} = {};

    %**LEVEL ONE MENU INDEX 6**%
selectionMatrix{2,6,3} = @hi7901_AgeHoursPerWeek;
selectionMatrix{2,6,4} = @hi7901_AgeHoursPerWeek;
selectionMatrix{2,6,5} = @hi7901_AgeHoursPerWeek;
selectionMatrix{2,6,6} = @hi7901_AgeHoursPerWeek;
selectionMatrix{2,6,7} = @hi7901_AgeHoursPerWeek;
selectionMatrix{2,6,8} = @hi7901_AgeHoursPerWeek;



%***ROOT MENU INDEX 3***%
    %**LEVEL ONE MENU INDEX 3**%
selectionMatrix{3,3,3} = @hi7901_UnderConstruction;
selectionMatrix{3,3,4} = @hi7901_UnderConstruction;
selectionMatrix{3,3,5} = {};
selectionMatrix{3,3,6} = {};
selectionMatrix{3,3,7} = {};
selectionMatrix{3,3,8} = {};

    %**LEVEL ONE MENU INDEX 4**%
selectionMatrix{3,4,3} = @hi7901_UnderConstruction;
selectionMatrix{3,4,4} = @hi7901_UnderConstruction;
selectionMatrix{3,4,5} = {};
selectionMatrix{3,4,6} = {};
selectionMatrix{3,4,7} = {};
selectionMatrix{3,4,8} = {};

    %**LEVEL ONE MENU INDEX 5**%
selectionMatrix{3,5,3} = @hi7901_UnderConstruction;
selectionMatrix{3,5,4} = @hi7901_UnderConstruction;
selectionMatrix{3,5,5} = {};
selectionMatrix{3,5,6} = {};
selectionMatrix{3,5,7} = {};
selectionMatrix{3,5,8} = {};

    %**LEVEL ONE MENU INDEX 6**%
selectionMatrix{3,6,3} = {};
selectionMatrix{3,6,4} = {};
selectionMatrix{3,6,5} = {};
selectionMatrix{3,6,6} = {};
selectionMatrix{3,6,7} = {};
selectionMatrix{3,6,8} = {};



%***ROOT MENU INDEX 4***%
    %**LEVEL ONE MENU INDEX 3**%
selectionMatrix{4,3,3} = @hf7691_CapitalvsSex;
selectionMatrix{4,3,4} = @hf7691_CapitalvsSex;
selectionMatrix{4,3,5} = {};
selectionMatrix{4,3,6} = {};
selectionMatrix{4,3,7} = {};
selectionMatrix{4,3,8} = {};

    %**LEVEL ONE MENU INDEX 4**%
selectionMatrix{4,4,3} = @hf7691_IncomevsSex;
selectionMatrix{4,4,4} = @hf7691_IncomevsSex;
selectionMatrix{4,4,5} = {};
selectionMatrix{4,4,6} = {};
selectionMatrix{4,4,7} = {};
selectionMatrix{4,4,8} = {};

    %**LEVEL ONE MENU INDEX 5**%
selectionMatrix{4,5,3} = @hf7691_HoursperweekvsSex;
selectionMatrix{4,5,4} = @hf7691_HoursperweekvsSex;
selectionMatrix{4,5,5} = {};
selectionMatrix{4,5,6} = {};
selectionMatrix{4,5,7} = {};
selectionMatrix{4,5,8} = {};

    %**LEVEL ONE MENU INDEX 6**%
selectionMatrix{4,6,3} = {};
selectionMatrix{4,6,4} = {};
selectionMatrix{4,6,5} = {};
selectionMatrix{4,6,6} = {};
selectionMatrix{4,6,7} = {};
selectionMatrix{4,6,8} = {};



%***ROOT MENU INDEX 5***%
    %**LEVEL ONE MENU INDEX 3**%
selectionMatrix{5,3,3} = @hd4803_RacevsIncome;
selectionMatrix{5,3,4} = @hd4803_RacevsIncome;
selectionMatrix{5,3,5} = {};
selectionMatrix{5,3,6} = {};
selectionMatrix{5,3,7} = {};
selectionMatrix{5,3,8} = {};

    %**LEVEL ONE MENU INDEX 4**%
selectionMatrix{5,4,3} = @hd4803_RacevsEducation;
selectionMatrix{5,4,4} = @hd4803_RacevsEducation;
selectionMatrix{5,4,5} = {};
selectionMatrix{5,4,6} = {};
selectionMatrix{5,4,7} = {};
selectionMatrix{5,4,8} = {};

    %**LEVEL ONE MENU INDEX 5**%
selectionMatrix{5,5,3} = @hd4803_RacevsOccupation;
selectionMatrix{5,5,4} = @hd4803_RacevsOccupation;
selectionMatrix{5,5,5} = {};
selectionMatrix{5,5,6} = {};
selectionMatrix{5,5,7} = {};
selectionMatrix{5,5,8} = {};

    %**LEVEL ONE MENU INDEX 6**%
selectionMatrix{5,6,3} = {};
selectionMatrix{5,6,4} = {};
selectionMatrix{5,6,5} = {};
selectionMatrix{5,6,6} = {};
selectionMatrix{5,6,7} = {};
selectionMatrix{5,6,8} = {};


for d1 = 1:size(selectionMatrix,1)
    for d2 = 1:size(selectionMatrix,2)
        for d3 = 1:size(selectionMatrix,3)
            if ~(isa(selectionMatrix{d1,d2,d3},'function_handle'))
                selectionMatrix{d1,d2,d3} = @ErrorMsg;
            end
        end
    end
end
clear d1 d2 d3;

save('selectionMatrix.mat','selectionMatrix');

