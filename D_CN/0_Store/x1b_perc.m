%% Initializing
clear
clc

%% Loading LD,DG,PV,WT
% Index goes from 1-100 || Each is 10,000 years
idx_vs=1;
[V_LD,V_DG,V_PV,V_WT] = z1a_pass(idx_vs);

%% Percentage
a_Perc = [0.9251 0.1 0.1];

V_LD = V_LD*3405*a_Perc(1);
V_PV = V_PV*3405*a_Perc(2);
V_WT = V_WT*3405*a_Perc(3);

VS_All = V_DG + V_PV + V_WT - V_LD;