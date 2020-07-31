%% Initializing
clear
clc

load('0dKupr.mat')
load('0eArrivals.mat')

%% ReChristening
ArrDay = E_WDay;
ArrEnd = E_WEnd;

DuraDay = D_WDay;
DuraEnd = D_WEnd;

%% Kupr #2
ArrDay{1,1}(83,:) = [];
ArrDay{1,1}(82,:) = [];
ArrDay{1,1}(36,:) = [];
ArrDay{1,1}(1,:) = [];

ArrDay{1,2}(30,:) = [];

ArrDay{1,3}(59,:) = [];
ArrDay{1,3}(58,:) = [];
ArrDay{1,3}(46,:) = [];
ArrDay{1,3}(16,:) = [];

ArrDay{1,4}(51,:) = [];
ArrDay{1,4}(26,:) = [];
ArrDay{1,4}(6,:) = [];

ArrEnd{1,1}(1,:) = [];

%% Housecleaning
save 0fKupr2.mat ArrDay ArrEnd DuraDay DuraEnd



