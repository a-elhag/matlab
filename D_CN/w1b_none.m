% Simple VS used from 17-32 (1b) is the right one, not (1a)
% EV Folder used from 1-16 (1b) since it it different percentages

% For DSM no_vs from 33-48 (2a)
% EV Folder from 17-32

% For GSM no_vs from 49-64 (3a)
% EV folder from 33-48 (3a)

%% Intializing
clear
clc

load('0_FILEidx.mat')
FolderCurrent = pwd;
cd(FolderCurrent)

FolderSaving = 'C:\Users\a2elhag\OneDrive\Documents\Matlab\1_Research\3. Results';
% cd(FolderSaving)

%% Running the Code
% Charger Characteristics
a_Bat = 0.1;
a_Speed = 0.25;
a_Cha = a_Bat*a_Speed;


for no_vs=45:48
    cd(FolderCurrent)
    [V1_None] = z1c_load(no_vs,IdxPercentages(no_vs-32,:));
    
    tic
    for no_ev=1:400
        
        disp(['Running Simulation ' num2str(no_vs) ' for EV ' num2str(no_ev) '/400'])
        
        idx_year = (no_ev-1)*25;
        idx_ev_folder = no_vs-16; % Goes from 1-85 || Each folder is 10,000 years
        [V_EV] = z2a_passev(idx_ev_folder,no_ev);
        [W_nodriv] = z2b_nodriv(V_EV);
        
        % Control Strategy 1: None
        [X1_none] = z4a_none(V_EV, W_nodriv,a_Bat,a_Speed,a_Cha);
        V1_None(:,idx_year+1:idx_year+25) = V1_None(:,idx_year+1:idx_year+25) - X1_none;
        
    end
    toc
    
    X0_Marker = V1_None;
    X0_Marker(X0_Marker>0) = 0;
    X0_Marker(X0_Marker<0) = 1;
    
    [Y_LOL_all, Y_ENS_all] = z3a_metrics(V1_None);
    
    cd(FolderSaving)
    cd(IdxFolder(no_vs-16,:))
    save 2a.mat Y_LOL_all Y_ENS_all
    save 2aMarker.mat X0_Marker
end

%% Finish
cd(FolderCurrent);
