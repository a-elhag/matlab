function [Virtual_PV] = z5b_SupremePV(years_count)

load('B2_PV/2b_Edges.mat')

Edges_PV_RP = repmat(Edges_PV,1,years_count);

Virtual_PV_V1 = z4a_UltimatePV(years_count);
Virtual_PV = Edges_PV_RP(Virtual_PV_V1);


