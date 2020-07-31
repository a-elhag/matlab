%% Initializing
clear
clc

load('2b_Edges.mat')

%% Seasons
% Season 1 (Winter): Dec21-Mar19 || (89 Days)
% Season 2 (Spring): Mar20-Jun20 || (93 Days)
% Season 3 (Summer): Jun21-Sep21 || (93 Days)
% Season 4 (Autumn): Sep22-Dec20 || (90 Days)

S1_D1 = 8760 - 264 + 1;
S1_D2 = 1872;
S2_D1 = 1872 + 1;
S2_D2 = 1872 + 93*24;
S3_D1 = 4104 + 1;
S3_D2 = 4104 + 93*24;
S4_D1 = 6336 +1;
S4_D2 = 6336 + 90*24;

S1 = S1_D2 + (8760-S1_D1+1);
S2 = S2_D2 - S2_D1 + 1;
S3 = S3_D2 - S3_D1 + 1;
S4 = S4_D2 - S4_D1 + 1;

%% Split_S1
Seas_PV_S1 = [];
for years_no=1:6
    Seas_PV_S1 = [Seas_PV_S1; PowEdg_PV(S1_D1:8760,years_no); PowEdg_PV(1:S1_D2,years_no)];
end

%% Split_S2
Seas_PV_S2 = [];
for years_no=1:6
    Seas_PV_S2 = [Seas_PV_S2; PowEdg_PV(S2_D1:S2_D2,years_no)];
end

%% Split_S3
Seas_PV_S3 = [];
for years_no=1:6
    Seas_PV_S3 = [Seas_PV_S3; PowEdg_PV(S3_D1:S3_D2,years_no)];
end

%% Split_S4
Seas_PV_S4 = [];
for years_no=1:6
    Seas_PV_S4 = [Seas_PV_S4; PowEdg_PV(S4_D1:S4_D2,years_no)];
end

%% Combination
Seas_PV = cell(1,4);
Seas_PV{1,1} = Seas_PV_S1;
Seas_PV{1,2} = Seas_PV_S2;
Seas_PV{1,3} = Seas_PV_S3;
Seas_PV{1,4} = Seas_PV_S4;

%% HouseCleaning
save 2c_Season.mat Edges_PV Seas_PV  
