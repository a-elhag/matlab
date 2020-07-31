function [Virtual] = z2e_markov_all1(TransMat,InitProb,days_max,hours_idx,State_Prev,Rand,years_count)

A1 = 1;
A2 = 365;

Virtual(1:8760,1) = z2d_markov_year1(TransMat,InitProb,days_max,hours_idx,State_Prev,Rand(1:24,A1:A2));

for years_no = 2:years_count
    A1 = (years_no-1)*365+1;
    A2 = years_no*365;
    Virtual(1:8760,years_no) = z2d_markov_year1(TransMat,InitProb,days_max,hours_idx,Virtual(8760,years_no-1),Rand(1:24,A1:A2)); 
end