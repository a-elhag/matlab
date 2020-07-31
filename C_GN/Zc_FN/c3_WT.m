%% Initializing
clear
clc

%% Adding Paths V1
cd ../..
cd B_VS
addpath('B3_WT')

%% Constants
no_repeat   = 5;
qua_year = 10;
years_step  = 1;

%% Virtual Scenario
for k=1:no_repeat
    tic
    WT = z5c_SupremeWT(qua_year);   
    
    cd ..
    cd A_DT/A3_WT
    
    % Saving Data
    X = num2str(k);
    fname = ['WT' X];
    save(fname,'WT')
    
    cd ../..
    cd B_VS
    
    disp(['Running Simulation ' X '/' num2str(no_repeat) ' '])
    toc
    
    disp([' '])
end

%% HouseCleaning
rmpath('B3_WT')
cd ..
cd C_GN/Zc_FN

