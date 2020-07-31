%% Intializing
clear
clc

load('PEV_model_hr.mat')

%% Joining
Logic_All_hr = [Logic1_hr; Logic11_hr; Logic36_hr; Logic89_hr; Logic710_hr; Logic801_hr];

%% House_Cleaning
save 0aJoinVar.mat Logic_All_hr