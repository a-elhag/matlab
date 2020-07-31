%% Initializing
clear
clc

load('2d_TransMat.mat')
load('2e_InitProb.mat')

%% Testing
InitProb = InitProb_WT;
tic
R = rand(1,100000);
for i=1:100000
    A(i) = z1a_init(InitProb,3,10,R(i));
end
toc

histogram(A)

