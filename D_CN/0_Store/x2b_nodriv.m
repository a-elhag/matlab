%% Intializing
clear
clc

%% Loading Passive Data
idx_vs = 5; % Index goes from 1-100 || Each is 10,000 years
a_Perc = [0.9251 0.1 0.1]; % Order is LD, PV, WT
[V_All] = z1c_load(idx_vs,a_Perc);

%% Loading EV Data
idx_ev = 300; % Goes from 1-400 || Each is 25 years
idx_ev_folder = 50; % Goes from 1-85 || Each folder is 10,000 years
[V_EV] = z2a_passev(idx_ev_folder,idx_ev);

%% Number of Driver
W_nodriv = zeros(365,25);

for no_year=1:25
    for no_day=1:365
        W_nodriv(no_day,no_year)= size(V_EV{no_day,no_year},1);
    end
end