function [Virtual_PV] = z4a_UltimatePV(years_count)

load('B2_PV/2e_InitProb')
load('B2_PV/2f_TransMatV2.mat')

Edges = size(Edges_PV,1);

TransMat = TransMatV2_PV;
InitProb = InitProb_PV;

days_max = [89 93 93 90]';
days_max_cum = cumsum(days_max);
hours_idx = days_max_cum*24;
hours_idx = [0; hours_idx];

State_Prev = 1;
Rand = rand(24,years_count*365);
Virtual_PV = zeros(8760,years_count);

Virtual_PV = z2e_markov_all(TransMat,InitProb,days_max,hours_idx,State_Prev,Rand,years_count,Edges);
