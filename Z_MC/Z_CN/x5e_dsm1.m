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

for no_year=1:1
    for no_day=1:365
        if LOL1_none(no_day,no_year)==0
            continue
        end
        
        idx_hr1 = (no_day-1)*24 + 1;
        idx_hr2 = idx_hr1 + 23;
        FV2_dsm = LD2(idx_hr1:idx_hr2,1)';
        
        tic
        [FV2_dsm] = z5d_dsm1(FV2_dsm,EV{no_day,no_year},EV_ava{no_day,no_year},EV_driver(no_day,no_year),a_Bat,a_Speed,a_Eff_cha);
        GV2_dsm(idx_hr1:idx_hr2,no_year) = FV2_dsm' - LD2(idx_hr1:idx_hr2,1);
        
        disp(['Number of Year: ', num2str(no_year), '      Number of Day: ', num2str(no_day)]);
        toc
    end
end

VS02_dsm = VS00 - GV2_dsm;
[LOL2_dsm] = z4c_lol(VS02_dsm,qua_year);

%% Plotting
% figure
% stairs(LD2(idx_hr1:idx_hr2,1))
% hold on
% stairs(FV2_dsm)

figure
stairs(GV1_none(25:48,1))
hold on
stairs(GV2_dsm(25:48,1))
legend('None','DSM')

figure
stairs(VS_01_none(25:48,1))
hold on
stairs(VS_02_dsm(25:48,1))
legend('None','DSM')

