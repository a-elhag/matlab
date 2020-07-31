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

idx_hr1 = (idx_day-1)*24 + 1;
idx_hr2 = idx_hr1 + 23;

a_Eff_cha = 0.975;

SM_BC = LD(idx_hr1:idx_hr2,idx_yr)';
SM_BC = SM_BC*3405*a_Perc(3);
FV2_dsm = SM_BC;

% Running
tic
for no_driver=1:EV_driver(idx_day,idx_yr)
    
    EnergyReq = ((100-EV{idx_day,idx_yr}(no_driver,3))/100)*a_Bat;
    EnergyAva = EV{idx_day,idx_yr}(no_driver,2)*a_Cha;
    SOC_initial = EV{idx_day,idx_yr}(no_driver,3);
    
    if EnergyReq>EnergyAva
        SOC_initial = (1-EnergyAva/a_Bat)*100;
    end
    [FV2_dsm] = z5c_dsm1(FV2_dsm,EV_ava{idx_day,idx_yr}(no_driver,:),SOC_initial,a_Bat,a_Speed,a_Eff_cha); 

end
toc

%% Plotting
% figure
% stairs(SM_BC)
% hold on
% stairs(FV2_dsm)


