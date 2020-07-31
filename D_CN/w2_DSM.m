% Simple VS used from 17-32 (1b) is the right one, not (1a)
% EV Folder used from 1-16 (1b) since it it different percentages

% For DSM no_vs from 33-48 (2a)
% EV Folder from 17-32

% For GSM no_vs from 49-64 (3a)
% EV folder from 33-48 (3a)

% (3b) is for GSM being applied
% DELETE WHEN DONE
%% Intializing
clear
clc

load('0_FILEidx.mat')
FolderCurrent = pwd;
cd(FolderCurrent)

FolderSaving = 'C:\Users\a2elhag\OneDrive\Documents\Matlab\1_Research\3. Results';
% cd(FolderSaving)

%% Running the Code
for no_vs=17:17
    
    % Loading Data
    cd(FolderSaving)
    cd(IdxFolder(no_vs,:))
    load('2aMarker.mat')
    cd(FolderCurrent)
    
    load('0_Data_LD.mat')
    V1_LD = Virtual_LD*3405/30; % Change me in both this and z1b_perc
    [V1_None] = z1c_load(no_vs,IdxPercentages(no_vs,:));
    V2_DSM = zeros(8760,10000);
    
    tic
    for no_ev=1:1
        
        disp(['Running Simulation ' num2str(no_vs) ' for EV ' num2str(no_ev) '/400'])
        
        idx_yr1 = (no_ev-1)*25;
        idx_ev_folder = no_vs; % Goes from 1-85 || Each folder is 10,000 years
        [V_EV] = z2a_passev(idx_ev_folder,no_ev);
        [W_nodriv] = z2b_nodriv(V_EV);
        
        
        for no_yr=1:1
            for no_day=1:365
                
                idx_hr1 = (no_day-1)*24+1;
                idx_hr2= idx_hr1+23;
                idx_yr2 = idx_yr1+no_yr;
                
                BreakBin = sum(X0_Marker(idx_hr1:idx_hr2,idx_yr2));
                if BreakBin==0
                    continue
                end
                disp(['Number of Year: ' num2str(no_yr) ' | Number of Day: ' num2str(no_day) ' '])
                
                VS_day_old = -V1_LD(idx_hr1:idx_hr2)';
                for no_driv=1:W_nodriv(no_day,no_yr)
                    Ava = zeros(1,24);
                    Ava(V_EV{no_day,no_yr}(no_driv,1):V_EV{no_day,no_yr}(no_driv,1)+V_EV{no_day,no_yr}(no_driv,2)-1) = 1;
                    
                    SOC_initial = V_EV{no_day,no_yr}(no_driv,3)/100;
                    
                    [VS_day_new] = z5b_SM(Ava,VS_day_old,SOC_initial);
                    VS_day_old = VS_day_new;
                end
                
                V2_DSM(idx_hr1:idx_hr2,idx_yr2) = VS_day_old' + V1_LD(idx_hr1:idx_hr2);
            end
        end
    end
    toc
    
    V2a_DSM = V1_None + V2_DSM;
    
    [Y_LOL_all, Y_ENS_all] = z3a_metrics(V1_None);
    cd(FolderSaving)
    cd(IdxFolder(no_vs,:))
    
    save 2b.mat Y_LOL_all Y_ENS_all
    
end

%% Finish
cd(FolderCurrent);
% clear
