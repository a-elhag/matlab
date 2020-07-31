%% Initializing
clear
clc

load('1_Data_WT.mat')

%% WT Output Power
%{
Converting the bins of the WT to power outputs.
%}

Virtual_WT_V2 = z3a_WT(Virtual_WT);
