%% Initializing
clear
clc

%% Virtual Scenarios
years_count=10; % Change me for how much years to simulate
tic
Virtual_PV_V1 = z4a_UltimatePV(years_count);
toc

%% Reversing the Binning Action
% Virtual_PV_V2 = z3a_PV(Virtual_PV_V1);
