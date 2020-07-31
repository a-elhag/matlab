%% Introduction
%This is a script to set up our data such that it can be used
clear
clc

load('0aJoinVar.mat')

%% zb1_arrive
[Arrivals] = zb1_arrive(Logic_All_hr);

%% zb2_org
[Logic1Day] = zb2_dura(Logic_All_hr,Arrivals);

%% zb3_columnsofzeros
[Logic1Day] = zb3_columnsofzeros(Logic1Day);
[Arrivals]  = zb3_columnsofzeros(Arrivals);

%% zb4_endorday
[Logic2Week, Logic3W_End, Logic3W_Day] = zb4_week(Logic1Day);

%% zb5_season
[Logic4Seas_Week]  = zb5_season(Logic2Week);
[Logic5Seas_W_End] = zb5_season(Logic3W_End);
[Logic5Seas_W_Day] = zb5_season(Logic3W_Day);

%% House_Cleaning
save ('0bSetUp.mat')
