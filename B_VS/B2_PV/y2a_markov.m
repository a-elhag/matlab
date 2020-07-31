%% Initializing
clear
clc

load('2e_InitProb.mat')
load('2f_TransMatV2.mat')

Edges = size(Edges_PV,1);

%% All
TransMat = TransMatV2_PV;
InitProb = InitProb_PV;

seasons_count=2;
hours_count=10;
State_Prev = 1;

tic
R = rand(1,1);
for i=1:1
    State_Next(i) = z2a_markov(TransMat,InitProb,seasons_count,hours_count,State_Prev,R(i),Edges);
end
toc
% histogram(State_Next)

