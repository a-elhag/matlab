%% Initializing
clear
clc
close all

load('2e_InitProb.mat')
load('2f_TransMatV2.mat')

%% Testing
TransMat = TransMatV2_WT;
InitProb = InitProb_WT;
seasons_count = 3;
State_Prev = 2;
Rand = rand(24,1);

State_Hours = z2b_markov_day(TransMat,InitProb,seasons_count,State_Prev,Rand);

bar(State_Hours)
