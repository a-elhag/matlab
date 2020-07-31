%% Initializing
clear
clc

%% Variables
Ava = [zeros(1,5) ones(1,15) zeros(1,4)];
VS_day  = [100 250 50 125 50 200 100 50 60 150 100 225 100 75 50 75 100 100 25 100 75 25 150 100];

SOC_initial = 0.25;

%% Calling Function
[Pcha] = z5a_SM(Ava,VS_day,SOC_initial);

%% Plotting
figure

stairs(Pcha)
hold on
stairs(VS_day.*Ava)
legend("Pcha", 'VS Day')
