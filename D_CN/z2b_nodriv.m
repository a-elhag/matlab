function [W_nodriv] = z2b_driv(V_EV)

W_nodriv = zeros(365,25);

for no_year=1:25
    for no_day=1:365
        W_nodriv(no_day,no_year)= size(V_EV{no_day,no_year},1);
    end
end