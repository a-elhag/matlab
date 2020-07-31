%% Initializing
clear
clc

%% Constant
qua_year = 5;
qua_repeat = 1;
a_Perc = [0.1 0.1 0.9251];

a_Bat = 10;
a_Speed = 0.2;

%% Loading Data
[DG,PV,WT,LD,EV] = z1_pass(qua_year,qua_repeat);

%% Percentage
[VS_00] = z2_perc(a_Perc,DG,PV,WT,LD);

%% Quantity
[EV_driver] = z3a_driver(EV,qua_year);

%% Availablity
[EV_ava] = z3b_ava(EV,EV_driver,qua_year);

%% 2) DSM
% Setting Up
idx_yr = 1;
idx_day = 1;
idx_driver = 2;

idx_hr1 = (idx_day-1)*24 + 1;
idx_hr2 = idx_hr1 + 23;

EV2 = EV{idx_day,idx_yr};
EV2_ava = EV_ava{idx_day,idx_yr};
EV2_driver = EV_driver(idx_day,idx_yr);

Ava = LD(idx_hr1:idx_hr2,idx_yr)';
Ava = Ava*3405*a_Perc(3);
Ava = Ava.*EV2_ava(idx_driver,:);

SOC_initial = EV2(idx_driver,3)/100;
a_Cha = a_Bat*a_Speed;
a_Eff_cha = 0.975;

% Equality Constraint
Aeq(1,:) = [1/a_Bat zeros(1,23) -1 zeros(1,23)];
beq(1) = -SOC_initial;

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
obj(1,1:24) = obj(1,1:24).*Ava;

% Solving
options = optimoptions('linprog','Display','none');
[z]= linprog(obj,[],[],Aeq,beq,lb,ub,[],options);


z_Pcha = z(1:24);
SOC  = z(25:48);

for m=1:24
    Ava_new(m) = Ava(m) - z_Pcha(m)/a_Eff_cha;
end



