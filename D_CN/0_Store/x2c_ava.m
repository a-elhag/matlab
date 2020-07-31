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

%% Number of Drivers in Every Day
[W_nodriv] = z2b_nodriv(V_EV);

%% Availablity Converted to Binary
disp('Manipulating the EV Data...')
tic
W_ava = cell(365,24);

for no_days=1:365
    for no_years=1:25
        W_ava{no_days,no_years} = zeros(W_nodriv(no_days,no_years),24);
        for no_driver=1:W_nodriv(no_days,no_years)
            W_ava{no_days,no_years}(no_driver,V_EV{no_days,no_years}(no_driver,1):V_EV{no_days,no_years}(no_driver,1)+V_EV{no_days,no_years}(no_driver,2)-1) =1;
        end
    end
end
toc

