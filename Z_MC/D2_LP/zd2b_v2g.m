function [Pcha,Pdis,SOC] = zd2b_g2v(Ava_BC,SOC_initial,obj,Cons)

Cons.beq(1) = -SOC_initial;

obj(1,1:24)  = obj(1,1:24).*Ava_BC;
obj(1,25:48) = obj(1,25:48).*Ava_BC; 

[z]= linprog(obj,[],[],Cons.Aeq,Cons.beq,Cons.lb,Cons.ub);

Pcha = z(1:24,1)';
Pdis = z(25:48,1)';
SOC  = z(49:72,1)';