%% Initializing
clear
clc

close all

%% Variables
Ava = [zeros(1,5) ones(1,15) zeros(1,4)];
VS_day  = [100 250 50 125 50 200 100 50 60 150 100 225 100 75 50 75 100 100 25 100 75 25 150 100];

SOC_initial = 0.25;

%% Calling Function
[VS_day_new] = z5b_SM(Ava,VS_day,SOC_initial);

%% Plotting
figure

stairs(VS_day_new)
hold on
stairs(VS_day)
legend("VS Day New", 'VS Day')
