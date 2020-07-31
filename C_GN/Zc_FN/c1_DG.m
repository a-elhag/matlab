%% Initializing
clear
clc

%% Adding Paths V1
cd ../..
cd B_VS
addpath('B1_DG')

%% Constants
no_repeat   = 10;
qua_year = 10;
years_step  = 1;

%% Virtual Scenario
for k=1:no_repeat
    tic
    DG = z5a_SupremeDG(qua_year,years_step);
    
    
    cd ..
    cd A_DT/A1_DG
    
    % Saving Data
    X = num2str(k);
    fname = ['DG' X];
    save(fname,'DG')
    
    cd ../..
    cd B_VS
    
    disp(['Running Simulation ' X '/' num2str(no_repeat) ' '])
    toc
    
    disp([' '])
end

%% HouseCleaning
rmpath('B1_DG')
cd ..
cd C_GN/Zc_FN

