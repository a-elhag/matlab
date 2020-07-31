function [EV_Load] = zd3_load(Dura)

% NOTE: WE HAVE TO FIX SOMETHING!!!!
% There is no solution to overflow unfortunately. That means if a car needs
% to charge from energy from the next day/year. It cannot. It will just run
% into an error. This was fixed by making the EV_Cha pretty high.


%% EV Constants
EV_Bat = 0.1; % Based on Teslas 'max battery in a car' projection (0.1 MW)
EV_Cha = 0.05;  % Charging speed is based on a slightly fast EV charger (0.05MW)

%% Simulating
years_count = size(Dura,2);
EV_Load = zeros(8760,years_count);

for no_year=1:years_count
    for no_day=1:365
        driver_count = size(Dura{no_day,no_year},1);
        
        for no_driver=1:driver_count
            Duration = Dura{no_day,no_year}(no_driver,1);
            Arrival  = Dura{no_day,no_year}(no_driver,2);
            SOC      = Dura{no_day,no_year}(no_driver,3);
            
            idx_hour = Arrival + (no_day-1)*24;
            Energy   = ((100-SOC)/100)*EV_Bat; %Energy Required
            
            do = true;
            add_hr = 0;
            add_yr = 0;
            while do
                if Energy<=EV_Cha
                    EV_Load(idx_hour,no_year+add_yr) = EV_Load(idx_hour,no_year+add_yr) + Energy;
                    do = false;
                else
                    EV_Load(idx_hour,no_year+add_yr) = EV_Load(idx_hour,no_year+add_yr) + EV_Cha;
                    Energy = Energy-EV_Cha;
                    add_hr = add_hr+1;
                    idx_hour = idx_hour+1;
                    
                    if add_hr>Duration
                        do = false;
                    end
                    
                    if idx_hour==8760
                        add_yr=1;
                        idx_hour=1;
                        if no_year==years_count
                            do = false;
                        end
                    end
                    
                end
            end
        end
    end
end