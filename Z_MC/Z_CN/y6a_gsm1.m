%% Initializing
clear
clc
close all

%% Constant
qua_year = 1;
qua_repeat = 1;
a_Perc = [0.1 0.1 0.9251];

a_Bat = 5;
a_Speed = 0.34;
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

%% 3) GSM
% Setting Up
GV3_gsm1 = GV1_none;
LD2 = LD(:, 1)*3405*a_Perc(3);
[GV3_gsm1] = z5e_dsm1(GV3_gsm1,VS00,LOL1_none,EV,EV_ava,EV_driver,qua_year,a_Bat,a_Speed,a_Eff_cha);

%% Virtual Scenario
VS01_none = VS00 - GV1_none;
VS03_gsm  = VS00 - GV3_gsm1;

%% Statistics
% LOL
LOL1_none = z4c_lol(VS01_none,1);
LOL3_gsm  = z4c_lol(VS03_gsm,1);

SUM1_none = sum(sum(LOL1_none));
SUM3_gsm  = sum(sum(LOL3_gsm));

% ENS
ENS1_none = abs(sum(VS01_none(VS01_none<0)));
ENS3_gsm  = abs(sum(VS03_gsm(VS03_gsm<0)));

% Percentage
Change_LOL = 100*(SUM1_none-SUM3_gsm)/(SUM1_none);
Change_ENS = 100*(ENS1_none-ENS3_gsm)/(ENS1_none);

%% Plotting 1
% figure
% stairs(LD2(idx_hr1:idx_hr2,1))
% hold on
% stairs(FV2_dsm)

%% Plotting 2

% idx_day = 138;
% idx_yr  = 1;
% 
% idx_hr1 = (idx_day-1)*24 +1;
% idx_hr2 = idx_hr1+23;
% 
% B1 = VS00(idx_hr1:idx_hr2,idx_yr);
% B2 = GV1_none(idx_hr1:idx_hr2,idx_yr);
% B3 = GV3_gsm1(idx_hr1:idx_hr2,idx_yr);
% 
% figure
% stairs(B1/max(B1),'LineWidth',2)
% hold on
% stairs(B2/max(B2),'--')
% stairs(B3/max(B3),'k','LineWidth',1.5)
% legend('VS00','None','DSM')

%% Plotting 3
idx_day = 313;
idx_yr  = 1;

idx_hr1 = (idx_day-1)*24 +1;
idx_hr2 = idx_hr1+23;

B1 = VS01_none(idx_hr1:idx_hr2,idx_yr);
B2 = VS03_gsm(idx_hr1:idx_hr2,idx_yr);

figure
stairs(B1,'k','LineWidth',2)
hold on
stairs(B2,'b','LineWidth',1.5)
legend('BC','GSM')


