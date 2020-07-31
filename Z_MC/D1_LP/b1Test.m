%% Initializing
clear
clc

close all

%% Constants
a_Bat = 100;
a_Speed = 0.34;
a_Cha = a_Bat*a_Speed;

a_Cha_eff = 0.975;
a_Dis_eff = 0.975;

%% Variables
Ava = [zeros(1,5) ones(1,15) zeros(1,4)];
VS_BC  = [100 250 50 -125 50 200 100 50 -60 150 100 225 -100 75 50 75 100 -100 25 100 75 25 -150 100];

SOC_initial = 0.25;

%% Setting Up
a_size = sum(Ava==0)+25;
Aeq = zeros(a_size,72);
beq = zeros(a_size,1);

Aeq(1,1) = 1/a_Bat; Aeq(1,25) = -1/a_Bat; Aeq(1,49) = -1; beq(1,1) = -SOC_initial;

for no_hour=2:24
    Aeq(no_hour,no_hour) = 1/a_Bat;
    Aeq(no_hour,no_hour+24) = -1/a_Bat;
    Aeq(no_hour,no_hour+47) = 1;
    Aeq(no_hour,no_hour+48) = -1;
end

Aeq(25,72) = 1; beq(25,1)=1;

for no_hour=1:24
    if Ava(1,no_hour) == 0
        Aeq(no_hour,no_hour) = 1;
        Aeq(no_hour,no_hour+24) = 1;
    end
end

lb(1,1:24) = 0;
lb(1,25:48) = 0;
lb(1,49:72) = 0.1;

ub(1,1:24) = a_Cha;
ub(1,25:48) = a_Cha;
ub(1,49:72) = 1;


%% Objective Function
f(1,1:24) = -Ava.*VS_BC/a_Cha_eff;
f(1,25:48) = Ava.*VS_BC*a_Dis_eff;
f(1,49:72) = 0;

%% Linear Programming
options = optimoptions('linprog','Display','none');
z = linprog(f,[],[],Aeq,beq,lb,ub,[],options);

%% Output
Pcha = z(1:24,1);
Pdis = z(25:48,1);

Pdel = (Pcha-Pdis);
SOC = z(49:72,1);

VS_AD = VS_BC - Pcha'/a_Cha_eff + Pdis'*a_Dis_eff;

%% Plot
figure
% stairs(Pdel,'k','LineWidth',1.5)
stairs(Ava.*VS_AD,'k','LineWidth',2)
hold on
stairs(Ava.*VS_BC,'r','LineWidth',1.5)
legend('VS AD','VS BC')





