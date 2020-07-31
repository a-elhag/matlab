%% Initializing
clear
clc
% close all

%% Availability
Ava = [100 100 100 -5 -10 100 100 100 100 100 -50 -200 -20 10 10 15 ones(1,8)*10];

%% EV Constants
SOC_initial = 0.25;
a_Bat   = 100;
a_Speed = .34;
a_Cha   = a_Bat*a_Speed;

a_Eff_cha = 0.975;
a_Eff_dis = 0.975;

%% Objective Function
for k=1:24
    f(k) = -Ava(k)/a_Eff_cha;
end

for k=25:48
    f(k) = Ava(k-24)*a_Eff_dis;
end

for k=49:72
    f(k) = 0;
end

%% Equality Constraints
Aeq(1,:) = [1/a_Bat zeros(1,23) -1/a_Bat zeros(1,23) -1 zeros(1,23)];
beq(1) = -SOC_initial;

for m=2:24
    Aeq(m,m)    = 1/a_Bat;     % Pcharge
    Aeq(m,m+24) = -1/a_Bat;    % Pdischarge
    Aeq(m,m+47) = 1;           % SOC(t-1)
    Aeq(m,m+48) = -1;          % SOC(t)
    
    beq(m,1)      = 0;           % Zero!
end

Aeq(25,:) = [zeros(1,71) 1];
beq(25)   = 1;


%% Boundaries
lb = [zeros(1,48) 0.1*ones(1,24)]; % Minimum State of Charge
ub = [a_Cha*ones(1,48) ones(1,24)];

%% Optimization
tic
[z,x1,x2,x3]= linprog(f,[],[],Aeq,beq,lb,ub);
toc

Pcha = z(1:24);
Pdis = z(25:48);
SOC  = z(49:72);

for m=1:24
    Ava_new(m) = Ava(m) - Pcha(m)/a_Eff_cha + Pdis(m)*a_Eff_dis;
end

ENS_old = sum(Ava(Ava<0));
ENS_new = sum(Ava_new(Ava_new<0));

%% Plotting
subplot(3,1,1)
stairs(SOC,'r','LineWidth',1.5)
title('SOC')
xlabel('hours')
ylabel('SOC')
xlim([1 24])

subplot(3,1,2)
stairs(Pcha/a_Bat-Pdis/a_Bat,'LineWidth',1.5)
hline = refline([0 0]);
hline.LineStyle = '--';
hline.Color = 'k';
title('Pcha')
xlabel('hours')
ylabel('Pcha')
xlim([1 24])

subplot(3,1,3)
stairs(Ava,'k','LineWidth',1.5)
hold on
stairs(Ava_new,'m','LineWidth',1.5)
hold off
legend('Old','New')
title('Available Old & New')
xlabel('hours')
ylabel('SOC')
xlim([1 24])



% subplot(4,1,4)
% stairs(Pdis/a_Bat,'g','LineWidth',1.5)
% title('Pdis')
% xlabel('hours')
% ylabel('Pdis')
% xlim([1 24])

