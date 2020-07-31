%% Initializing
clear
clc

%% Virtual Scenarios
years_count=1; % Change me for how much years to simulate
tic
Virtual_WT_V1 = z4a_UltimateWT(years_count);
toc

%% Reversing the Binning Action
Virtual_WT_V2 = z3a_WT1(Virtual_WT_V1);
