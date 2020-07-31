%% Initializing
clear
clc

%% Adding Paths V1
cd ../..
cd B_VS
addpath('B2_PV')

%% Constants
no_repeat   = 10;
qua_year = 10;
years_step  = 1;

%% Virtual Scenario
for k=1:no_repeat
    tic
    PV = z5b_SupremePV(qua_year);   
    
    cd ..
    cd A_DT/A2_PV
    
    % Saving Data
    X = num2str(k);
    fname = ['PV' X];
    save(fname,'PV')
    
    cd ../..
    cd B_VS
    
    disp(['Running Simulation ' X '/' num2str(no_repeat) ' '])
    toc
    
    disp([' '])
end

%% HouseCleaning
rmpath('B2_PV')
cd ..
cd C_GN/Zc_FN

