function [] = zcVS_PV(qua_year,qua_repeat)

%% Adding Paths V1
cd ..
cd B_VS
addpath('B2_PV')


%% Virtual Scenario
for k=1:qua_repeat
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
    
    disp(['Running Simulation ' X '/' num2str(qua_repeat) ' '])
    toc
    
    disp([' '])
end

%% HouseCleaning
rmpath('B2_PV')
cd ..
cd C_GN



