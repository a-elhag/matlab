%% Initializing
clear
clc

load('1_Data_Orig.mat')

%% Wind
for years_no=1:10
   day1 = 1 + 8760*(years_no-1);
   day2 = 8760*years_no;
   Wind_Yr(:,years_no) = Wind(day1:day2);
end

%% HouseCleaning
save 2a_SetUp.mat Wind_Yr