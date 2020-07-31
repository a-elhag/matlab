%% Initializing
clear
clc

%% Characteristics
SOC_initial = 0.25;

a_Bat   = 100;
a_Speed = .34;
a_Cha   = a_Bat*a_Speed;

a_Eff_cha = 0.975;

%% Available
Ava = [10 10 50 -5 -10 30 5 10 10 10 -50 -30 -20 10 10 15 10 10 60 10 10 10 10 10];

%% Objective Function
[obj,Cons] = zd2a_cons(a_Bat,a_Speed,a_Eff_cha);
tic
[Pcha,SOC] = zd2a_g2v(Ava,SOC_initial,obj,Cons);
toc

%% Plotting
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
