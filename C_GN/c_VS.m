%% Initializing
clear
clc

addpath('Zc_FN')

%% Constants
qua_year   = 2;
qua_repeat = 3;

%% Virtual Scenario
zcVS_DG(qua_year,qua_repeat)
zcVS_PV(qua_year,qua_repeat)
zcVS_WT(qua_year,qua_repeat)
zcVS_EV(qua_year,qua_repeat)

%% Closing Up
rmpath('Zc_FN')