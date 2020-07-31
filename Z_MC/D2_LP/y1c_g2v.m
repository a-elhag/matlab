%% Initializing
clear
clc

%% Characteristics
a_Bat   = 100;
a_Speed = .34;
a_Cha   = a_Bat*a_Speed;

a_Eff_cha = 0.975;
[obj,Cons] = zd2a_cons(a_Bat,a_Speed,a_Eff_cha);

%% Variables
Ava_BC = [10 10 50 -5 -10 30 5 10 10 10 -50 -30 -20 10 10 15 10 10 60 10 10 10 10 10];
SOC_initial = 0.25;

%% Objective Function
tic
[Pcha,SOC] = zd2a_g2v(Ava_BC,SOC_initial,obj,Cons);
toc

%% Plotting
Ava_AD = Ava_BC - Pcha/a_Eff_cha;

ENS_BC = sum(Ava_BC(Ava_BC<0));
ENS_AD = sum(Ava_AD(Ava_AD<0));

zd2c_plot(SOC,Pcha,[],a_Bat,Ava_BC,Ava_AD)
