%% Initializing
clear
clc
close all


load('2c_Season.mat')
% load('2e_InitProb')
% load('2f_TransMatV2.mat')

%% Utilizing
years_count=100; % Change me for how much years to simulate
tic
Virtual_PV = z4a_UltimatePV(years_count);
toc

%% Testing
% figure
% histogram(Virtual_PV)
% title('Virtual PV')
% figure
% SeasPV_Tot = [Seas_PV{1,1};Seas_PV{1,2};Seas_PV{1,3};Seas_PV{1,4}];
% histogram(SeasPV_Tot)
% title('Original PV')

%% HouseCleaning
save 1_Data_PV.mat Virtual_PV
