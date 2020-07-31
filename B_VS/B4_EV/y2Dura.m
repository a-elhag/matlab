%% Initializing
clear
clc

%% The format of Dura
%{
Dura{no_day,no_year}(driver_no,1) == Duration of Stay
Dura{no_day,no_year}(driver_no,2) == Time of Arrival
Dura{no_day,no_year}(driver_no,3) == SOC
%}

%% Constants
years_count=2;

%% Simulating
Arr = zd1_arr(years_count);

tic
Dura = zd2_dura(Arr,years_count);
toc