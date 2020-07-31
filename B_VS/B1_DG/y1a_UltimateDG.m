%% Initializing
clear
clc


%% Virtual Simulator
%{
We are simulating 32 Diesel Generators every time we run "z1a_UltimateDG",
therefore it should be taken into account when  setting the years to
simulate "years_count".

For example, simulating 1000 years is infact the simulation of 32000 years.
Therefore, treat Matlab with a little "Rahma" (mercy), when trying to
generate a lot of virtual scenarios.

Do it in steps (In the future, another function will be used)

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Back from the future, it is called "z1b_SupremeDG.m
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%}
   
years_count = 100;

%% Virtual Scenario DGerator
tic
Virtual_DG = z1a_UltimateDG(years_count);
toc
