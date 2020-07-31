function [State_Season_Reshape] = z2c_markov_seas1(TransMat,InitProb,seasons_count,days_max,State_Prev,Rand)

% Season 1 (Winter): Dec21-Mar19 || (89 Days)
% Season 2 (Spring): Mar20-Jun20 || (93 Days)
% Season 3 (Summer): Jun21-Sep21 || (93 Days)
% Season 4 (Autumn): Sep22-Dec20 || (90 Days)


State_Season(1:24,1) = z2b_markov_day1(TransMat,InitProb,seasons_count,State_Prev,Rand(1:24,1));

for days_no=2:days_max
    State_Prev = State_Season(24,days_no-1);
    State_Season(1:24,days_no) = z2b_markov_day1(TransMat,InitProb,seasons_count,State_Prev,Rand(1:24,days_no));
end


State_Season_Reshape = reshape(State_Season,days_max*24,1);