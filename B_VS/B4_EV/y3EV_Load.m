%% Initializing
clear
clc

%% Constants
years_count = 2;
parks_count = 1;

%% Virtual Scenarios
Arr = zd1b_arr(years_count,parks_count);
Dura = zd2_dura(Arr,years_count);
EV_Load = zd3_load(Dura);