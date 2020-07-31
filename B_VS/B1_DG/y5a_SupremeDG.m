%% Initializing
clear
clc

%% How to use
%{

This is a really easy to use function:

The first input is the number of years that is desired to be simulated.
The second input is the step_size of accessing the formula.

For example:
z1b_SupremeDG(10000,1000)

This means that we want 10,000 years to be simulated in steps of 1000
years.
The function z1a_UltimateDG will DGerate 1000 virtual years and the function
z1b_SupremeDG will collate the data and then run z1a_UltimateDG 9 more
times
%}

%% Testing
tic
Virtual_DG = z5a_SupremeDG(100,10);
toc

%% HouseCleaning
save 1_Data_DG.mat Virtual_DG
