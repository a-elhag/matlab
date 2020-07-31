%% Initializing
clear
clc
close all

%% Constant
qua_year = 1;
qua_repeat = 1;
a_Perc = [0.1 0.1 0.9251];

a_Bat = 1;
a_Speed = 0.5;
a_Cha = a_Bat*a_Speed;
a_Eff_cha = 0.975;


%% Loading Data
[DG,PV,WT,LD,EV] = z1_pass(qua_year,qua_repeat);

%% Percentage
[VS00] = z2_perc(a_Perc,DG,PV,WT,LD);

%% Quantity
[EV_driver] = z3a_driver(EV,qua_year);

%% Availablity
[EV_ava] = z3b_ava(EV,EV_driver,qua_year);

%% 1) None
[GV1_none] = z4b_none(EV,EV_ava,EV_driver,qua_year,a_Bat,a_Speed,a_Eff_cha);

%% 0) LOL
VS01_none = VS00 - GV1_none;
[LOL1_none] = z4c_lol(VS01_none,qua_year);

%% 2) DSM
% Setting Up
GV2_dsm = GV1_none;
LD2 = LD(:,1)*3405*a_Perc(3);
[GV2_dsm] = z5e_dsm1(GV2_dsm,LD2,LOL1_none,EV,EV_ava,EV_driver,qua_year,a_Bat,a_Speed,a_Eff_cha);

VS02_dsm = VS00 - GV2_dsm;
[LOL2_dsm] = z4c_lol(VS02_dsm,qua_year);

%% Output
A1 = sum(sum(LOL1_none));
A2 = sum(sum(LOL2_dsm));

%% Plotting
% figure
% stairs(LD2(idx_hr1:idx_hr2,1))
% hold on
% stairs(FV2_dsm)

idx_day = 138;
idx_yr  = 1;

idx_hr1 = (idx_day-1)*24 +1;
idx_hr2 = idx_hr1+23;

B1 = LD2(idx_hr1:idx_hr2,1);
B2 = GV1_none(idx_hr1:idx_hr2,idx_yr);
B3 = GV2_dsm(idx_hr1:idx_hr2,idx_yr);

figure
stairs(B1/max(B1))
hold on
stairs(B2/max(B2))
stairs(B3/max(B3))
legend('LD','None','DSM')



