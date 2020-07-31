% Notes: Simple VS used from 1-16
%% Intializing
clear
clc

load('0_FILEidx.mat')
FolderCurrent = pwd;
cd(FolderCurrent)

FolderSaving = 'C:\Users\a2elhag\OneDrive\Documents\Matlab\1_Research\3. Results';
% cd(FolderSaving)

%% Running the Code
for no_vs=1:16
    disp(['Running Simulation ' num2str(no_vs) ' '])
    cd(FolderCurrent)
    
    [V_All] = z1c_load(no_vs,IdxPercentages(no_vs,:));
    [Y_LOL_all, Y_ENS_all] = z3a_metrics(V_All);
    
    
    cd(FolderSaving)
    cd(IdxFolder(no_vs,:))
    
    save 0a.mat Y_LOL_all Y_ENS_all
    
    disp([' '])
end

%% Finish
cd(FolderCurrent);
