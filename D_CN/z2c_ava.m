% This will not be done anymore, very time consuming.
% What will be done instead is that this will be indivudally calculated on:
% 1) A day where there is a power outage
% 2) A car that actually has extra energy to give

function [W_ava] = z2c_ava(V_EV,W_nodriv)

disp('Converting EV Data to Binary...')
disp('(Estimate Time ~ 25 seconds)')
tic
for no_days=1:365
    for no_years=1:25
        W_ava{no_days,no_years} = zeros(W_nodriv(no_days,no_years),24);
        for no_driver=1:W_nodriv(no_days,no_years)
            W_ava{no_days,no_years}(no_driver,V_EV{no_days,no_years}(no_driver,1):V_EV{no_days,no_years}(no_driver,1)+V_EV{no_days,no_years}(no_driver,2)-1) =1;
%             W_ava{no_days,no_years}(no_driver,V_EV{no_days,no_years}(no_driver,1):V_EV{no_days,no_years}(no_driver,2)) =1;            
        end
    end
end
toc

% It is a cell with rows=no_days and columns=no_years
% Inside the cell, the rows=no_driv
% Column no 1:24 is the hours. If there is a one, then the car is present