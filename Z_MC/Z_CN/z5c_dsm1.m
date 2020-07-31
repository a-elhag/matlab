function [SM_AD] = z5c_dsm1(SM_BC,EV2_ava,SOC_initial,a_Bat,a_Speed,a_Eff_cha)

% Constants
[Optim] = z5a_dsm1(a_Bat,a_Speed,a_Eff_cha);

% Running
[z] = z5b_dsm1(Optim,SM_BC,EV2_ava,SOC_initial);

z_Pcha = z(1:24);

SM_AD = SM_BC + z_Pcha'/a_Eff_cha;



