%% Initializing
clear
clc 

load('2a_SetUp.mat')

%% Wind_Edges
% Cut_In Speed  = 4m/s;
% Rated Speed   = 16m/s;
% Cut_Out Speed = 25m/s;

Edges_WT = [0 4:1.5:16 25 100];
PowEdg_WT = discretize(Wind_Yr,Edges_WT);

%% Testing WT
% Edges_WT_Rev = [linspace(0,1,9) 1 0];
% Reverse_WT = Edges_WT_Rev(PowEdg_WT);

%% HouseCleaning
% save 2b_Edges.mat Edges_WT PowEdg_WT
