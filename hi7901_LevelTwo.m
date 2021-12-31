function exit = hi7901_LevelTwo(root,levelOne)      %**Derrick Hornes**%

levelTwoMenu = 0;
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    %%%%% SELECTION CHECK %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
switch root                 %Graph selection depends on data selected
    case (2)    %%AGE%%
        switch levelOne
            case (3)    %%CAPITAL%%
                graphGroup = 6;
            case (4)    %%INCOME%%
                graphGroup = 2;
            case (5)    %%OCCUPATION%%
                graphGroup = 5;
            case (6)    %%HOURS/WEEK%%
                graphGroup = 6;
        end
    case (3)    %%EDUCATION%%
        switch levelOne
            case (3)    %%RACE%%
                graphGroup = 2;
            case (4)    %%HOURS/WEEK%%
                graphGroup = 2;
            case (5)    %%INCOME%%
                graphGroup = 2;
        end
    case (4)    %%SEX%%
        switch levelOne
            case (3)    %%CAPITAL%%
                graphGroup = 4;
            case (4)    %%INCOME%%
                graphGroup = 4;
            case (5)    %%HOURS/WEEK%%
                graphGroup = 4;
        end
    case (5)    %%RACE%%
        switch levelOne
            case (3)    %%INCOME%%
                graphGroup = 3;
            case (4)    %%EDUCATION%%
                graphGroup = 3;
            case (5)    %%OCCUPATION%%
                graphGroup = 3;
        end
end

%%
switch graphGroup
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 2              %%%%% PIE / BAR %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        levelTwoList = {'EXIT','BACK','Pie Chart','Bar Graph'};

        while (levelTwoMenu ~= 2)
            [levelTwoMenu, ~] = listdlg('PromptString',...
                'Please select visual representation.','SelectionMode',...
                'single','ListString',levelTwoList);

            switch levelTwoMenu
                case 2              %Set exit to zero to go back...
                    exit = 0;       %only one loop
                case 3
                    levelTwoMenu = hi7901_UdfHub(root,levelOne,3);
                case 4
                    levelTwoMenu = hi7901_UdfHub(root,levelOne,4);
            end
            if levelTwoMenu == 1    %Exit before reaching menu again
                exit = 1;
                return;
            end
        end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 3              %%%%% PIE / SWARM %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        levelTwoList = {'EXIT','BACK','Pie Chart','Swarm Chart'};

        while (levelTwoMenu ~= 2)
            [levelTwoMenu, ~] = listdlg('PromptString',...
                'Please select visual representation.','SelectionMode',...
                'single','ListString',levelTwoList);

            switch levelTwoMenu
                case 2              %Set exit to zero to go back...
                    exit = 0;       %only one loop
                case 3
                    levelTwoMenu = hi7901_UdfHub(root,levelOne,3);
                case 4
                    levelTwoMenu = hi7901_UdfHub(root,levelOne,4);
            end
            if levelTwoMenu == 1    %Exit before reaching menu again
                exit = 1;
                return;
            end
        end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 4              %%%%% PIE / HISTOGRAM %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        levelTwoList = {'EXIT','BACK','Pie Chart','Histogram'};

        while (levelTwoMenu ~= 2)
            [levelTwoMenu, ~] = listdlg('PromptString',...
                'Please select visual representation.','SelectionMode',...
                'single','ListString',levelTwoList);

            switch levelTwoMenu
                case 2              %Set exit to zero to go back...
                    exit = 0;       %only one loop
                case 3
                    levelTwoMenu = hi7901_UdfHub(root,levelOne,3);
                case 4
                    levelTwoMenu = hi7901_UdfHub(root,levelOne,4);
            end
            if levelTwoMenu == 1    %Exit before reaching menu again
                exit = 1;
                return;
            end
        end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 5              %%%% HEATMAP / TABLE %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        levelTwoList = {'EXIT','BACK','Heat Map','Table'};

        while (levelTwoMenu ~= 2)
            [levelTwoMenu, ~] = listdlg('PromptString',...
                'Please select visual representation.','SelectionMode',...
                'single','ListString',levelTwoList);

            switch levelTwoMenu
                case 2              %Set exit to zero to go back...
                    exit = 0;       %only one loop
                case 3
                    levelTwoMenu = hi7901_UdfHub(root,levelOne,3);
                case 4
                    levelTwoMenu = hi7901_UdfHub(root,levelOne,4);
            end
            if levelTwoMenu == 1    %Exit before reaching menu again
                exit = 1;
                return;
            end
        end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 6 % PIE / BAR / BUBBLE CLOUD / SCATTER PLOT / BUBBLE CHART / PLOT 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        levelTwoList = {'EXIT','BACK','Pie Chart','Bar Graph',...
            'Bubble Cloud','Scatter Plot','Bubble Chart','Line Plot'};

        while (levelTwoMenu ~= 2)
            [levelTwoMenu, ~] = listdlg('PromptString',...
                'Please select visual representation.','SelectionMode',...
                'single','ListString',levelTwoList);

            switch levelTwoMenu
                case 2              %Set exit to zero to go back...
                    exit = 0;       %only one loop
                case 3
                    levelTwoMenu = hi7901_UdfHub(root,levelOne,3);
                case 4
                    levelTwoMenu = hi7901_UdfHub(root,levelOne,4);
                case 5
                    levelTwoMenu = hi7901_UdfHub(root,levelOne,5);
                case 6
                    levelTwoMenu = hi7901_UdfHub(root,levelOne,6);
                case 7
                    levelTwoMenu = hi7901_UdfHub(root,levelOne,7);
                case 8
                    levelTwoMenu = hi7901_UdfHub(root,levelOne,8);
            end
            if levelTwoMenu == 1    %Exit before reaching menu again
                exit = 1;
                return;
            end
        end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
end