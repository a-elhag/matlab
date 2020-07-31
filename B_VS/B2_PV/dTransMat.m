%% Initializing
clear
clc

load('2c_Season.mat')
%% ????
[Edges,~] = size(Edges_PV);

%% TransMat_PV
TransMat_PV = cell(1,4);
for seasons_no=1:4
    TransMat_PV{1,seasons_no} = zeros(Edges*24,Edges);
end

for seasons_no=1:4
    for hours_no=1:size(Seas_PV{1,seasons_no},1)-1
        hour_count = rem(hours_no-1,24);
        hour_count = hour_count*Edges;
        
        i = Seas_PV{1,seasons_no}(hours_no,1);
        j = Seas_PV{1,seasons_no}(hours_no+1,1);
        
        TransMat_PV{1,seasons_no}(i+hour_count,j) = TransMat_PV{1,seasons_no}(i+hour_count,j) +1;
    end
end

%% HouseCleaning
save 2d_TransMat.mat Edges_PV TransMat_PV 
