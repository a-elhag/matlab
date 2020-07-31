% Note, if you want to display times uncomment them!

function [V_LD,V_DG,V_PV,V_WT] = z1a_pass(idx_data)

%% Simulating Years
X = num2str(idx_data);

%% Initial Folder
DataDir = 'C:\Users\a2elhag\Documents\DATA';
FolderDir = pwd;

%% Going to Data Directory
cd(DataDir)

%% LD Data
load('0_Data_LD.mat')
V_LD = repmat(Virtual_LD,1,10000);

%% DG Data
% display('Loading the DG Data...')
cd('1_DG')

% tic
fname = ['DG' X '.mat'];
V_DG = zeros(8760,1000);
V_DG = load(fname);
V_DG = V_DG.DG;
% toc

cd ..

%% PV Data
% display('Loading the PV Data...')
cd('2_PV')

% tic
fname = ['PV' X '.mat'];
V_PV = load(fname);
V_PV = V_PV.PV;
% toc

cd ..

%% WT Data
% display('Loading the WT Data...')
cd('3_WT')

% tic
fname = ['WT' X '.mat'];
V_WT = load(fname);
V_WT = V_WT.WT;
% toc

cd ..

%% Returning to Folder
cd(FolderDir)
