function [Pcha,SOC] = zd2a_g2v(Ava_BC,SOC_initial,obj,Cons)

Cons.beq(1) = -SOC_initial;

obj(1,1:24) = obj(1,1:24).*Ava_BC;

[z]= linprog(obj,[],[],Cons.Aeq,Cons.beq,Cons.lb,Cons.ub);

Pcha = z(1:24,1)';
SOC  = z(25:48,1)';