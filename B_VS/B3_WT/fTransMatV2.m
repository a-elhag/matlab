%% Initializing
clear
clc

load('2d_TransMat.mat')

%% TransMatV2_WT
TransMatV2_WT = cell(1,4);
for seasons_no=1:4
    for hours_no=1:24
        hours_loc = (hours_no-1)*11;
        hours_1 = 1 + hours_loc;
        hours_2 = 11 + hours_loc;
        
        TransMatV2_WT{1,seasons_no}(hours_1:hours_2,1:11) = cumsum(TransMat_WT{1,seasons_no}(hours_1:hours_2,1:11),2);
    end
end

% This part is to deal with the zero rows, very difficult to deal with!
for seasons_no=1:4
    Temp_C = max(TransMatV2_WT{1,seasons_no}')';
    Temp_D{1,seasons_no} = repmat(Temp_C,1,11);
end

for seasons_no=1:4
    for hours_no=1:264
        if Temp_D{1,seasons_no}(hours_no,1) == 0 
            Temp_D{1,seasons_no}(hours_no,1:11) = 1;
        end
    end
end

for seasons_no=1:4
    TransMatV2_WT{1,seasons_no} = TransMatV2_WT{1,seasons_no}./Temp_D{1,seasons_no};
end

%% HouseCleaning
save 2f_TransMatV2.mat Edges_WT TransMatV2_WT
