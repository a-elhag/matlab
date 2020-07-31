%% Initializing
clear
clc
close all

load('2c_Season.mat')
load('2e_InitProb.mat')
load('2f_TransMatV2.mat')

Edges = size(Edges_PV,1);


%% Testing
% Reshape
TransMat = TransMatV2_PV;
InitProb = InitProb_PV;
seasons_count = 2;

days_max = [89 93 93 90]';
State_Prev = 2;
Rand = rand(24,days_max(seasons_count));

State_Season = z2c_markov_seas(TransMat,InitProb,seasons_count,days_max(seasons_count),State_Prev,Rand,Edges);

figure
histogram(State_Season)
title('Virtual Scenarios')
figure
histogram(Seas_PV{1,seasons_count})
title('Original Data')
