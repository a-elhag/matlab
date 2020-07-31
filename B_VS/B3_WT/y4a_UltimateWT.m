%% Initializing
clear
clc
close all


load('2c_Season.mat')
% load('2e_InitProb')
% load('2f_TransMatV2.mat')

%% Utilizing
years_count=25; % Change me for how much years to simulate
tic
Virtual_WT = z4a_UltimateWT(years_count);
toc

%% Testing
% figure
% histogram(Virtual_WT)
% title('Virtual WT')
% figure
% SeasWT_Tot = [Seas_WT{1,1};Seas_WT{1,2};Seas_WT{1,3};Seas_WT{1,4}];
% histogram(SeasWT_Tot)
% title('Original WT')

%% HouseCleaning
save 1_Data_WT.mat Virtual_WT
