%% Intializing
clear
clc

close all
%% Loading Passive Data
idx_vs = 5; % Index goes from 1-100 || Each is 10,000 years
a_Perc = [0.9251 0.1 0.1]; % Order is LD, PV, WT
[V_All] = z1c_load(idx_vs,a_Perc);

V1_None = V_All;

%% Applying Control Strategy

disp('Applying Control Strategy #1')
disp('(Estimated Time ~  3000 seconds or 50 minutes)')
tic
for no_ev=1:1
    idx_year = (no_ev-1)*25;
    
    % idx_ev = 300; % Goes from 1-400 || Each is 25 years
    idx_ev_folder = 50; % Goes from 1-85 || Each folder is 10,000 years
    
    % The actual EV Data
    [V_EV] = z2a_passev(idx_ev_folder,no_ev);
    % Number of Drivers in Every Day
    [W_nodriv] = z2b_nodriv(V_EV);
    % Charger Characteristics
    a_Bat = 0.1;
    a_Speed = 0.25;
    a_Cha = a_Bat*a_Speed;
    
    % Control Strategy 1: None       
    [X1_none] = z4a_none(V_EV, W_nodriv,a_Bat,a_Speed,a_Cha);
    V1_None(:,idx_year+1:idx_year+25) = V1_None(:,idx_year+1:idx_year+25) - X1_none;
end
toc
disp(' ')

%% Marker
X0_Marker = V1_None;
X0_Marker(X0_Marker>0) = 0;
X0_Marker(X0_Marker<0) = 1;
A = sum(X0_Marker);

%% Metrics
[Y_LOLE,Y_LOLE_sc,Y_EENS,Y_EENS_sc] = z3a_metrics(V1_None(:,1:100*25));

%% Plotting
z3b_plot(Y_LOLE,Y_LOLE_sc,Y_EENS,Y_EENS_sc);
