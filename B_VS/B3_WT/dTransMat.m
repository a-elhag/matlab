%% Initializing
clear
clc

load('2c_Season.mat')

%% TransMat_WT
TransMat_WT = cell(1,4);
for seasons_no=1:4
    TransMat_WT{1,seasons_no} = zeros(11*24,11);
end

for seasons_no=1:4
    for hours_no=1:size(Seas_WT{1,seasons_no},1)-1
        hour_count = rem(hours_no-1,24);
        hour_count = hour_count*11;
        
        i = Seas_WT{1,seasons_no}(hours_no,1);
        j = Seas_WT{1,seasons_no}(hours_no+1,1);
        
        TransMat_WT{1,seasons_no}(i+hour_count,j) = TransMat_WT{1,seasons_no}(i+hour_count,j) +1;
    end
end

%% HouseCleaning
save 2d_TransMat.mat Edges_WT TransMat_WT