function [Virtual_DG] = z5a_SupremeDG(years_count,step_size)

%% Idiot Proof
%{
This part of the code is if someone tries to use a step size that doesn't
evenly divide years_count
%}

Iter_no = floor(years_count/step_size);

%% True Start

Virtual_DG = zeros(8760,years_count);
for j=1:Iter_no
    A1 = (j-1)*step_size+1;
    A2 = (j)*step_size;
    
    Virtual_DG(:,A1:A2) = z1a_UltimateDG(step_size);
end
