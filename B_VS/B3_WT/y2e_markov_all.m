%% Initializing
clear
clc
close all

load('2c_Season.mat')
load('2e_InitProb')
load('2f_TransMatV2.mat')

%% Testing
TransMat = TransMatV2_WT;
InitProb = InitProb_WT;

days_max = [89 93 93 90]';
days_max_cum = cumsum(days_max);
hours_idx = days_max_cum*24;
hours_idx = [0; hours_idx];

State_Prev = 1;
years_count = 10;
Rand = rand(24,years_count*365);
Virtual = zeros(8760,years_count);

tic
Virtual = z2e_markov_all(TransMat,InitProb,days_max,hours_idx,State_Prev,Rand,years_count);
toc

figure
histogram(Virtual)
title('Virtual')
figure
Seas = [Seas_WT{1,1};Seas_WT{1,2};Seas_WT{1,3};Seas_WT{1,4}];
histogram(Seas)
title('Original')