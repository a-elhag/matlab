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

EV2 = EV{idx_day,idx_yr};
EV2_ava = EV_ava{idx_day,idx_yr};
EV2_driver = EV_driver(idx_day,idx_yr);

SM = LD(idx_hr1:idx_hr2,idx_yr)';
SM = SM*3405*a_Perc(3);
SM = SM.*EV2_ava(idx_driver,:);

SOC_initial = EV2(idx_driver,3)/100;
a_Cha = a_Bat*a_Speed;
a_Eff_cha = 0.975;

% Constants
[Optim] = z5a_dsm1(a_Bat,a_Speed,a_Eff_cha);

% Adding Stuff
Optim.beq(1) = -SOC_initial;
Optim.obj(1,1:24) = Optim.obj(1,1:24).*SM;

% Solving
[z]= linprog(Optim.obj,[],[],Optim.Aeq,Optim.beq,Optim.lb,Optim.ub,[],Optim.options);

z_Pcha = z(1:24);
z_SOC  = z(25:48);

for m=1:24
    SM_new(m) = SM(m) - z_Pcha(m)/a_Eff_cha;
end



