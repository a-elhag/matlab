function [] = zVS_EV(qua_year,qua_repeat)

%% Adding Paths V1
cd ..
cd B_VS
addpath('B4_EV')


%% Virtual Scenario
for k=1:qua_repeat
    tic
    Arr = zd1_arr(qua_year);
    EV  = zd2_dura(Arr,qua_year);
     
    
    cd ..
    cd A_DT/A4_EV
    
    % Saving Data
    X = num2str(k);
    fname = ['EV' X];
    save(fname,'EV')
    
    cd ../..
    cd B_VS
    
    disp(['Running Simulation ' X '/' num2str(qua_repeat) ' '])
    toc
    
    disp([' '])
end

%% HouseCleaning
rmpath('B4_EV')
cd ..
cd C_GN


