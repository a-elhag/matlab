function [obj,Cons] = zd2b_cons(a_Bat,a_Speed,a_Eff_cha,a_Eff_dis)

obj = [-ones(1,24)/a_Eff_cha ones(1,24)*a_Eff_dis zeros(1,24)];

a_Cha = a_Bat*a_Speed;

Aeq(1,:) = [1/a_Bat zeros(1,23) -1/a_Bat zeros(1,23) -1 zeros(1,23)];
beq(1) = 0; %% This will be changed in the next function to SOC_initial

for m=2:24
    Aeq(m,m)    = 1/a_Bat;     % Pcharge
    Aeq(m,m+24) = -1/a_Bat;    % Pdischarge
    Aeq(m,m+47) = 1;           % SOC(t-1)
    Aeq(m,m+48) = -1;          % SOC(t)
    
    beq(m,1)      = 0;           % Zero!
end

Aeq(25,:) = [zeros(1,71) 1];
beq(25)   = 1;

lb = [zeros(1,48) 0.1*ones(1,24)]; % Minimum State of Charge
ub = [a_Cha*ones(1,48) ones(1,24)];

Cons.Aeq = Aeq; Cons.beq=beq; Cons.lb = lb; Cons.ub = ub;