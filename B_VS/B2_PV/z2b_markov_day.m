function [State_Hours] = z2b_markov_day(TransMat,InitProb,seasons_count,State_Prev,Rand,Edges)

State_Hours(1,1) = z2a_markov(TransMat,InitProb,seasons_count,1,State_Prev,Rand(1,1),Edges);
for hours_no=2:24
    State_Hours(hours_no,1) = z2a_markov(TransMat,InitProb,seasons_count,hours_no,State_Hours(hours_no-1),Rand(hours_no,1),Edges);
end