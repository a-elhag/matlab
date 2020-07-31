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

%% Naming the Variable
Idx1 = [ ...
    '4a_EV01',
    '4a_EV02',
    '4a_EV03',
    '4a_EV04',
    '4a_EV05',
    '4a_EV06',
    '4a_EV07',
    '4a_EV08',
    '4a_EV09',
    '4a_EV10',
    '4a_EV11',
    '4a_EV12',
    
    '4b_EV01',
    '4b_EV02',
    '4b_EV03',
    '4b_EV04',
    '4b_EV05',
    '4b_EV06',
    '4b_EV07',
    '4b_EV08',
    '4b_EV09',
    '4b_EV10',
    '4b_EV11',
    
    '4c_EV01',
    '4c_EV02',
    '4c_EV03',
    '4c_EV04',
    '4c_EV05',
    '4c_EV06',
    '4c_EV07',
    '4c_EV08',
    '4c_EV09',
    '4c_EV10',
    
    '4d_EV01',
    '4d_EV02',
    '4d_EV03',
    '4d_EV04',
    '4d_EV05',
    '4d_EV06',
    '4d_EV07',
    '4d_EV08',
    '4d_EV09',
    '4d_EV10',
    
    '4e_EV01',
    '4e_EV02',
    '4e_EV03',
    '4e_EV04',
    '4e_EV05',
    '4e_EV06',
    '4e_EV07',
    '4e_EV08',
    
    '4f_EV01',
    '4f_EV02',
    '4f_EV03',
    '4f_EV04',
    '4f_EV05',
    '4f_EV06',
    '4f_EV07',
    '4f_EV08',
    
    '4g_EV01',
    '4g_EV02',
    '4g_EV03',
    '4g_EV04',
    '4g_EV05',
    '4g_EV06',
    '4g_EV07',
    '4g_EV08',
    
    '4h_EV01',
    '4h_EV02',
    '4h_EV03',
    '4h_EV04',
    '4h_EV05',
    '4h_EV06',
    '4h_EV07',
    '4h_EV08',
    
    '4i_EV01',
    '4i_EV02',
    '4i_EV03',
    '4i_EV04',
    '4i_EV05',
    '4i_EV06',
    
    '4j_EV01',
    '4j_EV02',
    '4j_EV03',
    '4j_EV04',
    ];

Idx2 = [zeros(12,1); 400*ones(11,1); 800*ones(10,1); 1200*ones(10,1); 1600*ones(8,1); 2000*ones(8,1); 2400*ones(8,1); 2800*ones(8,1); 3200*ones(6,1); 3600*ones(4,1)];

% %% EV Data
% display('Loading the EV Data...')
% cd(Idx(2,:))
%
% tic
% fname = ['EV' X '.mat'];
% V_EV = zeros(8760,1000);
% V_EV = load(fname);
% V_EV = V_EV.EV;
% toc
%
% cd ..
%
%% Returning to Folder
cd(FolderDir)
