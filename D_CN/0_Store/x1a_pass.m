%% Initializing
clear
clc

%% Simulating Years
idx_data = 1;
X = num2str(idx_data);

%% Initial Folder
DataDir = 'C:\Users\a2elhag\Documents\DATA';
FolderDir = pwd;

%% Going to Data Directory
cd(DataDir)

%% LD Data
load('0_Data_LD.mat')
V_LD = repmat(Virtual_LD,1,1000);

%% DG Data
display('Loading the DG Data...')
cd('1_DG')

tic
fname = ['DG' X '.mat'];
V_DG = zeros(8760,1000);
V_DG = load(fname);
toc

cd ..

%% PV Data
display('Loading the PV Data...')
cd('2_PV')

tic
fname = ['PV' X '.mat'];
V_PV = zeros(8760,1000);
V_PV = load(fname);
toc

cd ..

%% WT Data
display('Loading the WT Data...')
cd('3_WT')

tic
fname = ['WT' X '.mat'];
V_WT = zeros(8760,1000);
V_WT = load(fname);
toc

cd ..

%% Returning to Folder
cd(FolderDir)
