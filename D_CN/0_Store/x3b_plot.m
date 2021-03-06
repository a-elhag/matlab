%% Intializing
clear
clc

close all

%% Loading Passive Data
idx_vs = 5; % Index goes from 1-100 || Each is 10,000 years
a_Perc = [0.9251 0.1 0.1]; % Order is LD, PV, WT
[V_All] = z1c_load(idx_vs,a_Perc);

%% Metrics
[Y_LOLE,Y_LOLE_sc,Y_EENS,Y_EENS_sc] = z3a_metrics(V_All);

%% Plotting
figure
subplot(2,1,1)
plot(Y_LOLE)
title('LOLE')
xlabel('Simulations (Years)')
ylabel('Hours per Year')
subplot(2,1,2)
plot(Y_LOLE_sc)
title('LOLE Standard Deviation')
xlabel('Simulations (Years)')
ylabel('Hours per Year')

figure
subplot(2,1,1)
plot(Y_EENS)
title('EENS')
xlabel('Simulations (Years)')
ylabel('Hours per Year')
subplot(2,1,2)
plot(Y_EENS_sc)
title('EENS Standard Deviation')
xlabel('Simulations (Years)')
ylabel('Hours per Year')