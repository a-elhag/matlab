%% Initializing
clear
clc

%% Loading EV
idx_folder = 50; % Goes from 1-85 || Each has 10,000 years
idx_data = 1; % Goes from 1-400 || Each is 25 years

[EV] = z2a_passev(idx_folder,idx_data);