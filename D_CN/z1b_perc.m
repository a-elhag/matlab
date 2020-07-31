function [VS_All] = z1b_perc(a_Perc,LD,DG,PV,WT)

LD = LD*3405*a_Perc(1);
PV = PV*3405*a_Perc(2);
WT = WT*3405*a_Perc(3);

% Added this such that it makes more sense with EV's scale
VS_All = (DG + PV + WT - LD)/30;

%Change me in both this and w2_DSM