function [] = zcVS_WT(qua_year,qua_repeat)

%% Adding Paths V1
cd ..
cd B_VS
addpath('B3_WT')

%% Virtual Scenario
for k=1:qua_repeat
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
    
    disp(['Running Simulation ' X '/' num2str(qua_repeat) ' '])
    toc
    
    disp([' '])
end

%% HouseCleaning
rmpath('B3_WT')
cd ..
cd C_GN


