function [Virtual_WT_Out] = z3a_WT1(Virtual_WT_In)

Edges_WT_Rev = [linspace(0,1,9) 1 0];
Virtual_WT_Out = Edges_WT_Rev(Virtual_WT_In)';