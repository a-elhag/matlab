function [Optim] = z5a_dsm1(a_Bat,a_Speed,a_Eff_cha)

a_Cha = a_Bat*a_Speed;

% Equality Constraint
Aeq(1,:) = [1/a_Bat zeros(1,23) -1 zeros(1,23)];
beq(1) = 0;

for m=2:24
    Aeq(m,m)    = 1/a_Bat;     % Pcharge
    Aeq(m,m+23) = 1;           % SOC(t-1)
    Aeq(m,m+24) = -1;          % SOC(t)
    
    beq(m,1)    = 0;           % Zero!
end

Aeq(25,:) = [zeros(1,47) 1];
beq(25)   = 1;

% Boundaries
lb = [zeros(1,24) 0.1*ones(1,24)]; % Minimum State of Charge
ub = [a_Cha*ones(1,24) ones(1,24)];

% Objective Function
obj = [-ones(1,24)/a_Eff_cha zeros(1,24)];

% Options
options = optimoptions('linprog','Display','none');

Optim.Aeq = Aeq;
Optim.beq = beq;
Optim.lb  = lb;
Optim.ub  = ub;
Optim.obj = obj;
Optim.options = options;

