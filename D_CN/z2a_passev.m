% If you want to display the time it takes to load the EVs (about 1.5
% seconds) just uncomment those parts of the code
function [V_EV] = z2a_passev(idx_folder, idx_data)

load('0_EVidx.mat')

%% Simulating Years
idx_data = idx_data + Idx2(idx_folder);
X = num2str(idx_data);

%% Initial Folder
DataDir = 'C:\Users\a2elhag\Documents\DATA';
FolderDir = pwd;

%% Going to Data Directory
cd(DataDir)

%% EV Data
% display('Loading the EV Data...')
cd(Idx1(idx_folder,:))

% tic
fname = ['EV' X '.mat'];
V_EV = zeros(8760,1000);
V_EV = load(fname);
V_EV = V_EV.EV;
% toc

cd ..

%% Returning to Folder
cd(FolderDir)
