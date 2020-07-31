%% Initializing
clear
clc

load('2d_TransMat')

%% Bad Guy Monologue
%{
The rows of the tranisition matrix add up to the number of times the event occured!
Therefore, we can reconstruct a PDF of the states using the sum of the
rows, and then yada yada. Initial Probability Matrix.
%}

%% Initial Probability for WT
InitProb_WT = cell(1,4);
for seasons_no=1:4
    A_Temp{1,seasons_no} = cumsum(TransMat_WT{1,seasons_no},2);
    InitProb_WT{1,seasons_no} = A_Temp{1,seasons_no}(:,11);
end

for seasons_no=1:4
    for hours_no=1:24
        hours_loc = (hours_no-1)*11;
        hours_1 = 1 + hours_loc;
        hours_2 = 11 + hours_loc;
        
        states_max = sum(InitProb_WT{1,seasons_no}(hours_1:hours_2,1));
        InitProb_WT{1,seasons_no}(hours_1:hours_2,1) = InitProb_WT{1,seasons_no}(hours_1:hours_2,1)/states_max;
    end
end

for seasons_no=1:4
    for hours_no=1:24
        hours_loc = (hours_no-1)*11;
        hours_1 = 1 + hours_loc;
        hours_2 = 11 + hours_loc;
        
        InitProb_WT{1,seasons_no}(hours_1:hours_2,1) = cumsum(InitProb_WT{1,seasons_no}(hours_1:hours_2,1));
    end
end

%% HouseCleaning
save 2e_InitProb.mat InitProb_WT
