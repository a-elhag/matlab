%% Initializing
clear
clc
close all

load('2c_Season.mat')
load('2e_InitProb.mat')
load('2f_TransMatV2.mat')

%% Testing

TransMat = TransMatV2_WT;
InitProb = InitProb_WT;

days_max = [89 93 93 90]';
days_max_cum = cumsum(days_max);
hours_idx = days_max_cum*24;
hours_idx = [0; hours_idx];

State_Prev = 2;
Rand = rand(24,365);

State_Year = z2d_markov_year(TransMat,InitProb,days_max,hours_idx,State_Prev,Rand);

figure
histogram(State_Year)
title('Virtual Scenarios')
figure
Seas = [Seas_WT{1,1};Seas_WT{1,2};Seas_WT{1,3};Seas_WT{1,4}];
histogram(Seas)
title('Original')
