% The goal of this is to simply reduce the RAM,
% V_LD, V_DG, V_PV and V_WT are redudant ater z1b_perc

%% Initializing
clear
clc

%% Loading Passive Data
idx_vs = 1; % Index goes from 1-100 || Each is 10,000 years
[V_LD, V_DG, V_PV, V_WT] = z1a_pass(idx_vs);

%% Percentage
a_Perc = [0.9251 0.1 0.1];
[V_All] =  z1b_perc(a_Perc,V_LD,V_DG,V_PV,V_WT);
