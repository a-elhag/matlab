%% Initializing
clear
clc

%% Available
Ava = [10 10 50 -5 -10 30 5 10 10 10 -50 -30 -20 10 10 15 10 10 60 10 10 10 10 10];

%% Characteristics
SOC_initial = 0.25;

a_Bat   = 100;
a_Speed = .34;
a_Cha   = a_Bat*a_Speed;

a_Eff_cha = 0.975;

%% Constraints
Aeq(1,:) = [1/a_Bat zeros(1,23) -1 zeros(1,23)];
beq(1) = -SOC_initial;

for m=2:24
    Aeq(m,m)    = 1/a_Bat;     % Pcharge
    Aeq(m,m+23) = 1;           % SOC(t-1)
    Aeq(m,m+24) = -1;          % SOC(t)
    
    beq(m,1)      = 0;           % Zero!
end

Aeq(25,:) = [zeros(1,47) 1];
beq(25)   = 1;

lb = [zeros(1,24) 0.1*ones(1,24)]; % Minimum State of Charge
ub = [a_Cha*ones(1,24) ones(1,24)];

Cons.Aeq = Aeq; Cons.beq=beq; Cons.lb = lb; Cons.ub = ub;

%% Objective Function
obj = [-ones(1,24)/a_Eff_cha zeros(1,24)];
[z] = zd2_g2v(Ava,SOC_initial,obj,Cons);

%% Plotting
Pcha = z(1:24);
SOC  = z(25:48);

for m=1:24
    Ava_new(m) = Ava(m) - Pcha(m)/a_Eff_cha;
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
stairs(Pcha/a_Bat,'LineWidth',1.5)
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
