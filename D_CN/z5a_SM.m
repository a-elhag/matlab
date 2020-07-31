function [Pcha] = z5a_SM(Ava,VS_day,SOC_initial)

%% Characteristics
a_Bat = 100;
a_Speed = 0.25;
a_Cha = a_Bat*a_Speed;
a_eff = 1;

%% Setting Up
a_size = sum(Ava==0)+25;
Aeq = zeros(a_size,48);
beq = zeros(a_size,1);

Aeq(1,1) = 1/a_Bat; Aeq(1,25) = -1; beq(1,1) = -SOC_initial;

for no_hour=2:24
    Aeq(no_hour,no_hour) = 1/a_Bat;
    Aeq(no_hour,no_hour+23) = 1;
    Aeq(no_hour,no_hour+24) = -1;
end

Aeq(25,48) = 1; beq(25,1)=1;

count=25;
for no_hour=1:24
    if Ava(1,no_hour) == 0
        count=count+1;
        Aeq(count,no_hour) = 1;
    end
end

lb(1,1:24) = 0;
lb(1,25:48) = 0.1;

ub(1,1:24) = a_Cha;
ub(1,25:48) = 1;

%% Objective Function
f(1,1:24) = -Ava.*VS_day/a_eff;
f(1,25:48) = 0;

%% Linear Programming
options = optimoptions('linprog','Display','none');
z = linprog(f,[],[],Aeq,beq,lb,ub,[],options);

%% Output
Pcha = z(1:24,1);
% SOC  = z(25:48,1);
