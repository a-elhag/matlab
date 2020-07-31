function [State_Year] = z2d_markov_year(TransMat,InitProb,days_max,hours_idx,State_Prev,Rand,Edges)

B = hours_idx/24;
A1 = 1; A2 = 2136;
B1 = 1; B2 = 89;

State_Year(A1:A2,1) = z2c_markov_seas(TransMat,InitProb,1,days_max(1),State_Prev,Rand(1:24,B1:B2),Edges);

for seasons_no=2:4
    A1 = hours_idx(seasons_no)+1;
    A2 = hours_idx(seasons_no+1);
    B1 = B(seasons_no)+1;
    B2 = B(seasons_no+1);
    
    State_Year(A1:A2,1) = z2c_markov_seas(TransMat,InitProb,seasons_no,days_max(seasons_no),State_Year(A1-1,1),Rand(1:24,B1:B2),Edges);
end
