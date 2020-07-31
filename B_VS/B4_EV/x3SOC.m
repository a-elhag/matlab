%% Initializing
clear
clc

%%
% I kept this here to point ot the fact that the SOC calculation is embeded
% into zd2_dura/x2Dura

a1 = 5;
a2 = normrnd(40,20,[a1,1]);
a2(a2>90) = 90;
a2(a2<10) = 10;
