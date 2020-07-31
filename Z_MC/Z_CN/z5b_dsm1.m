function [z] = z5b_dsm1(Optim,SM,EV2_ava,SOC_initial)

% Ava = LD(idx_hr1:idx_hr2,idx_yr)';
% EV2_ava = {idx_day,idx_yr};
% SOC_initial = EV{idx_day,idx_yr}(idx_driver,3);

SM = SM.*EV2_ava;

% Adding Stuff
Optim.beq(1) = -SOC_initial/100;
Optim.obj(1,1:24) = Optim.obj(1,1:24).*SM;

% Solving
[z]= linprog(Optim.obj,[],[],Optim.Aeq,Optim.beq,Optim.lb,Optim.ub,[],Optim.options);
