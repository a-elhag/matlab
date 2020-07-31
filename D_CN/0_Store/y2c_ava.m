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

% The actual EV Data
[V_EV] = z2a_passev(idx_ev_folder,idx_ev);

% Number of Drivers in Every Day
[W_nodriv] = z2b_nodriv(V_EV);

% Availablity Converted to Binary
[W_ava] = z2c_ava(V_EV,W_nodriv);