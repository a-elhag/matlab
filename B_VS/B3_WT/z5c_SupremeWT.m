function [Virtual_WT] = z5c_SupremeWT(years_count)

Virtual_WT_V1 = z4a_UltimateWT(years_count);
Virtual_WT = z3a_WT1(Virtual_WT_V1)';
% Virtual_WT = Virtual_WT_V1;


