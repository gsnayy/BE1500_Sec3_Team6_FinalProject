%% Main Script (Census Data)                        %**Derrick Hornes**%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% https://archive.ics.uci.edu/ml/datasets/Census+Income %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clc; close all
global adult
load ('adult.mat');

icon = imread('hands.jpg');
uiwait(msgbox('Let us compare census data!','Census Visualizer',...
    'custom',icon));


rootMenu = 0;
rootList = {'EXIT','Age','Education','Sex','Race'};

while rootMenu ~= 1         %Root level menu
    [rootMenu, ~] = listdlg('PromptString','Please select a category.',...
        'SelectionMode','single','ListString',rootList);
    switch rootMenu
        case 2
            rootMenu = hi7901_LevelOne(2);	%Pass selection to next menu, and
        case 3                              %assign exit value to current menu
            rootMenu = hi7901_LevelOne(3);	%selection, in case user wants to
        case 4                              %exit script
            rootMenu = hi7901_LevelOne(4);
        case 5
            rootMenu = hi7901_LevelOne(5);
    end
end


