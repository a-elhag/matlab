function [Y_LOL_all, Y_ENS_all] = z3a_metrics(V_All)

disp('Calculating Metrics')
disp('Estimate Time ~ 5 seconds')

tic
qua_year = size(V_All,2);
Y_LOL = zeros(1,qua_year);
Y_LOLE = zeros(1,qua_year);
Y_ENS = zeros(1,qua_year);
Y_EENS = zeros(1,qua_year);

for no_year=1:qua_year
    V = V_All(:,no_year);
    Y_ENS(1,no_year) = -sum(V(V<0));
    Y_EENS(1,no_year) = mean(Y_ENS(1,1:no_year));
    Y_EENS_std(1,no_year) = std(Y_EENS(1,1:no_year));
    Y_LOL(1,no_year) = size(V(V<0),1);
    Y_LOLE(1,no_year) = mean(Y_LOL(1,1:no_year));
    Y_LOLE_std(1,no_year) = std(Y_LOLE(1,1:no_year));
end

Y_EENS_voc = Y_EENS_std./Y_EENS;
Y_LOLE_voc = Y_LOLE_std./Y_LOLE;

Y_LOL_all = [Y_LOL;Y_LOLE;Y_LOLE_std;Y_LOLE_voc];
Y_ENS_all = [Y_ENS;Y_EENS;Y_EENS_std;Y_EENS_voc];
toc


disp(' ')