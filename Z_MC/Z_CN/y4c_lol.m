%% Initializing
clear
clc
close all

%% Constant
qua_year = 5;
qua_repeat = 1;
a_Perc = [0.1 0.1 0.9251];

a_Bat = 10;
a_Speed = 0.2;
a_Cha = a_Bat*a_Speed;
a_Eff_cha = 0.975;

%% Loading Data
[DG,PV,WT,LD,EV] = z1_pass(qua_year,qua_repeat);

%% Percentage
[VS_00] = z2_perc(a_Perc,DG,PV,WT,LD);

%% Quantity
[EV_driver] = z3a_driver(EV,qua_year);

%% Availablity
[EV_ava] = z3b_ava(EV,EV_driver,qua_year);

%% 1) None
[GV1_none] = z4b_none(EV,EV_ava,EV_driver,qua_year,a_Bat,a_Speed,a_Eff_cha);

%% 0) LOL
VS_01_none = VS_00 - GV1_none;
[LOL_idx] = z4c_lol(VS_01_none,qua_year);


