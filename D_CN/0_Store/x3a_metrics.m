%% Intializing
clear
clc

%% Loading Passive Data
idx_vs = 5; % Index goes from 1-100 || Each is 10,000 years
a_Perc = [0.9251 0.1 0.1]; % Order is LD, PV, WT
[V_All] = z1c_load(idx_vs,a_Perc);

%% Metrics
disp('Calculating Metrics')
disp('Estimate Time ~ 5 seconds')

tic
qua_year = size(V_All,2);
Y_LOL = zeros(1,qua_year);
Y_LOLE = zeros(1,qua_year);
Y_ENS = zeros(1,qua_year);
Y_EENS = zeros(1,qua_year);

for no_year=1:qua_year
    V = V_All(:,no_year);
    Y_ENS(1,no_year) = -sum(V(V<0));
    Y_EENS(1,no_year) = mean(Y_ENS(1,1:no_year));
    Y_EENS_sc(1,no_year) = std(Y_EENS(1,1:no_year));
    Y_LOL(1,no_year) = size(V(V<0),1);
    Y_LOLE(1,no_year) = mean(Y_LOL(1,1:no_year));
    Y_LOLE_sc(1,no_year) = std(Y_LOLE(1,1:no_year));
end
toc

disp(' ')

