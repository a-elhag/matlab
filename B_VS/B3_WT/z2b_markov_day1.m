function [State_Hours] = z2b_markov_day1(TransMat,InitProb,seasons_count,State_Prev,Rand)

State_Hours(1,1) = z2a_markov1(TransMat,InitProb,seasons_count,1,State_Prev,Rand(1,1));
for hours_no=2:24
    State_Hours(hours_no,1) = z2a_markov1(TransMat,InitProb,seasons_count,hours_no,State_Hours(hours_no-1),Rand(hours_no,1));
end