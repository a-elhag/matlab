function [V_All] = z1c_load(idx_vs,a_Perc)

disp('Loading Passive Data...')
disp('(Estimated Time ~ 10 seconds)')

tic
[V_LD, V_DG, V_PV, V_WT] = z1a_pass(idx_vs);
[V_All] =  z1b_perc(a_Perc,V_LD,V_DG,V_PV,V_WT);
toc
disp(' ')