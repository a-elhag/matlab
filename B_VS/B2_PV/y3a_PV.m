%% Initializing
clear
clc

load('1_Data_PV.mat')

%% PV Output Power
%{
Converting the bins of the PV to power outputs.
%}

Virtual_PV_V2 = z3a_PV(Virtual_PV_V1);
