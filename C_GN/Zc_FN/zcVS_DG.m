function [] = zcVS_DG(qua_year,qua_repeat)

%% Adding Paths V1
cd ..
cd B_VS
addpath('B1_DG')

years_step = 1;

%% Virtual Scenario
for k=1:qua_repeat
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
    
    disp(['Running Simulation ' X '/' num2str(qua_repeat) ' '])
    toc
    
    disp([' '])
end

%% HouseCleaning
rmpath('B1_DG')
cd ..
cd C_GN


