%% Initializing
clear
clc

%% The Format of Dura
%{
Dura{no_day,no_year}(driver_no,1) == Duration of Stay
Dura{no_day,no_year}(driver_no,2) == Time of Arrival
Dura{no_day,no_year}(driver_no,3) == SOC
%}

%% Constants
years_count=2;
parks_count=3;

%% EV Constants
% Note some Kupr was done! The EV_Bat and EV_Cha were increased because of
% the slow simulation time. Will fix in the fiuture
EV_Bat = 0.5; % Based on Teslas 'max battery in a car' projection (0.1 MW)
EV_Cha = EV_Bat/2;  % Charging speed is based on a slightly fast EV charger (0.05MW)

%% Virtual Scenarios
Arr = zd1b_arr(years_count,parks_count);
Dura = zd2_dura(Arr,years_count);

%% Converting to EV Load

tic
EV_Load = zeros(8760,years_count);
for no_year=1:years_count
    for no_day=1:365
        iter = size(Dura{no_day,no_year},1);        
        for i=1:iter
            Duration = Dura{no_day,no_year}(i,1);
            Arrival  = Dura{no_day,no_year}(i,2);
            SOC      = Dura{no_day,no_year}(i,3);
            
            idx_hour = Arrival + (no_day-1)*24;
            Energy   = ((100-SOC)/100)*EV_Bat;
            
            do = true;
            while do
               if Energy<=EV_Cha
                   EV_Load(idx_hour,no_year) = EV_Load(idx_hour,no_year) + Energy;
                   do = false;
               else
                   EV_Load(idx_hour,no_year) = EV_Load(idx_hour,no_year);
                   Energy = Energy-EV_Cha;
                   idx_hour = idx_hour+1;
               end                
            end
        end
    end
end
toc

