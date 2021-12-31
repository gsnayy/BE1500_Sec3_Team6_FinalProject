function exit = hi7901_LevelOne(root)               %**Derrick Hornes**%

levelOneMenu = 0;

switch root
    case 2              %%%%% AGE %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        levelOneList = {'EXIT','BACK','Net Capital','Income',...
            'Occupation','Hours per Week'};

        while (levelOneMenu ~= 2)
        [levelOneMenu, ~] = listdlg('PromptString',...
            'Please select second category.','SelectionMode',...
            'single','ListString',levelOneList);

            switch levelOneMenu
                case 2              %Set exit to zero to go back...
                    exit = 0;       %only one loop
                case 3
                    levelOneMenu = hi7901_LevelTwo(root,3);
                case 4
                    levelOneMenu = hi7901_LevelTwo(root,4);
                case 5
                    levelOneMenu = hi7901_LevelTwo(root,5);
                case 6
                    levelOneMenu = hi7901_LevelTwo(root,6);
            end
            if levelOneMenu == 1    %Exit before reaching menu again
                exit = 1;
                return;
            end
        end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 3              %%%%% EDUCATION %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        levelOneList = {'EXIT','BACK','Race','Hours per Week','Income'};

        while (levelOneMenu ~= 2)
        [levelOneMenu, ~] = listdlg('PromptString',...
            'Please select second category.','SelectionMode',...
            'single','ListString',levelOneList);

            switch levelOneMenu
                case 2              %Set exit to zero to go back...
                    exit = 0;       %only one loop
                case 3
                    levelOneMenu = hi7901_LevelTwo(root,3);
                case 4
                    levelOneMenu = hi7901_LevelTwo(root,4);
                case 5
                    levelOneMenu = hi7901_LevelTwo(root,5);
            end
            if levelOneMenu == 1    %Exit before reaching menu again
                exit = 1;
                return;
            end
        end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 4              %%%%% SEX %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        levelOneList = {'EXIT','BACK','Net Capital','Income','Hours per Week'};

        while (levelOneMenu ~= 2)
        [levelOneMenu, ~] = listdlg('PromptString',...
            'Please select second category.','SelectionMode',...
            'single','ListString',levelOneList);

            switch levelOneMenu
                case 2              %Set exit to zero to go back...
                    exit = 0;       %only one loop
                case 3
                    levelOneMenu = hi7901_LevelTwo(root,3);
                case 4
                    levelOneMenu = hi7901_LevelTwo(root,4);
                case 5
                    levelOneMenu = hi7901_LevelTwo(root,5);
            end
            if levelOneMenu == 1    %Exit before reaching menu again
                exit = 1;
                return;
            end
        end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 5              %%%%% RACE %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        levelOneList = {'EXIT','BACK','Income','Education','Occupation'};

        while (levelOneMenu ~= 2)
        [levelOneMenu, ~] = listdlg('PromptString',...
            'Please select second category.','SelectionMode',...
            'single','ListString',levelOneList);

            switch levelOneMenu
                case 2              %Set exit to zero to go back...
                    exit = 0;       %only one loop
                case 3
                    levelOneMenu = hi7901_LevelTwo(root,3);
                case 4
                    levelOneMenu = hi7901_LevelTwo(root,4);
                case 5
                    levelOneMenu = hi7901_LevelTwo(root,5);
            end
            if levelOneMenu == 1    %Exit before reaching menu again
                exit = 1;
                return;
            end
        end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
end