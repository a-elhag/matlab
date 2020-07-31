%% Initializing
clear
clc

load('2d_TransMat.mat')


%% ????
[Edges,~] = size(Edges_PV);

%% TransMatV2_PV
TransMatV2_PV = cell(1,4);
Temp_B = cell(1,4);

for seasons_no=1:4
    for hours_no=1:24
        hours_loc = (hours_no-1)*Edges;
        hours_1 = 1 + hours_loc;
        hours_2 = Edges + hours_loc;
        
        TransMatV2_PV{1,seasons_no}(hours_1:hours_2,1:Edges) = cumsum(TransMat_PV{1,seasons_no}(hours_1:hours_2,1:Edges),2);
    end
end

% This part is to deal with the zero rows, very difficult to deal with!
for seasons_no=1:4
    Temp_A = max(TransMatV2_PV{1,seasons_no}')';
    Temp_B{1,seasons_no} = repmat(Temp_A,1,Edges);
end

for seasons_no=1:4
    for hours_no=1:264
        if Temp_B{1,seasons_no}(hours_no,1) == 0 
            Temp_B{1,seasons_no}(hours_no,1:Edges) = 1;
        end
    end
end

for seasons_no=1:4
    TransMatV2_PV{1,seasons_no} = TransMatV2_PV{1,seasons_no}./Temp_B{1,seasons_no};
end

%% HouseCleaning
save 2f_TransMatV2.mat Edges_PV TransMatV2_PV 
