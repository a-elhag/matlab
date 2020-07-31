%% Initializing
clear
clc

%% Constant
qua_year = 5;
qua_repeat = 1;
a_Perc = [0.1 0.1 0.9251];

a_Bat = 10;
a_Speed = 0.2;

%% Loading Data
[DG,PV,WT,LD,EV] = z1_pass(qua_year,qua_repeat);

%% Percentage
[VS_00] = z2_perc(a_Perc,DG,PV,WT,LD);

%% Quantity
[EV_driver] = z3a_driver(EV,qua_year);

%% Availablity
[EV_ava] = z3b_ava(EV,EV_driver,qua_year);

%% 2) DSM
% Setting Up
idx_yr = 1;
idx_day = 1;
idx_driver = 2;

idx_hr1 = (idx_day-1)*24 + 1;
idx_hr2 = idx_hr1 + 23;

a_Cha = a_Bat*a_Speed;
a_Eff_cha = 0.975;

% Running
SM = LD(idx_hr1:idx_hr2,idx_yr)';
SM = SM*3405*a_Perc(3);

[SM_Out] = z5c_dsm1(SM,EV_ava{idx_day,idx_yr}(idx_driver,:),EV{idx_day,idx_yr}(idx_driver,3),a_Bat,a_Speed,a_Eff_cha);




