function [Virtual_WT] = z4a_UltimateWT(years_count)

load('B3_WT/2e_InitProb')
load('B3_WT/2f_TransMatV2.mat')

TransMat = TransMatV2_WT;
InitProb = InitProb_WT;

days_max = [89 93 93 90]';
days_max_cum = cumsum(days_max);
hours_idx = days_max_cum*24;
hours_idx = [0; hours_idx];

State_Prev = 1;
Rand = rand(24,years_count*365);
Virtual_WT = zeros(8760,years_count);

Virtual_WT = z2e_markov_all1(TransMat,InitProb,days_max,hours_idx,State_Prev,Rand,years_count);
