%% Initializing
clear
clc 

load('2a_SetUp.mat')

%% Reshape
Power_PV_RS = reshape(Power_PV,[8760*6,1]);
% Power_PV_2 = reshape(Power_PV_RS,[8760,6]);
Kufr = [zeros(1e5,1); ones(1e5,1)];
Power_PV_RS1 = cat(1,Power_PV_RS,Kufr);

%% Kmeans
rng(100) % For repeatability in terms of random number generation
[PowEdg_PV_Kufr,Edges_PV] = kmeans(Power_PV_RS1,20);
PowEdg_PV = PowEdg_PV_Kufr(1:8760*6,1);

%% Reverse
P2 = Edges_PV(PowEdg_PV);
PowEdg_PV = reshape(PowEdg_PV,[8760,6]);
MSE  = sum(sum((Power_PV_RS-P2).^2))

%% PV_Edges
% OLD!
% Edges_PV = [0 0.001 0.1:0.1:1];
% PowEdg_PV = discretize(Power_PV,Edges_PV);

%% Wind_Edges
% Cut_In Speed  = 4m/s;
% Rated Speed   = 16m/s;
% Cut_Out Speed = 25m/s;

% Edges_WT = [0 4:1.5:16 25 100];
% PowEdg_WT = discretize(Wind_Yr,Edges_WT);

% %% Testing PV
% Edges_PV_Rev = [linspace(0,1,11)];
% Reverse_PV = Edges_PV_Rev(PowEdg_PV);
% 
% %% Testing WT
% Edges_WT_Rev = [linspace(0,1,9) 1 0];
% Reverse_WT = Edges_WT_Rev(PowEdg_WT);

%% HouseCleaning
save 2b_Edges.mat Edges_PV PowEdg_PV
