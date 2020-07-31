%% Intializing
clear
clc

%% Loading Passive Data
idx_vs = 5; % Index goes from 1-100 || Each is 10,000 years
a_Perc = [0.9251 0.1 0.1]; % Order is LD, PV, WT
[V_All] = z1c_load(idx_vs,a_Perc);

V1_None = V_All;

for no_ev=1:1
    idx_year = (no_ev-1)*25;
    %% Loading EV Data
    % idx_ev = 300; % Goes from 1-400 || Each is 25 years
    idx_ev_folder = 50; % Goes from 1-85 || Each folder is 10,000 years
    
    % The actual EV Data
    [V_EV] = z2a_passev(idx_ev_folder,no_ev);
    % Number of Drivers in Every Day
    [W_nodriv] = z2b_nodriv(V_EV);
    
    %% Charger Characteristics
    a_Bat = 0.1;
    a_Speed = 0.25;
    a_Cha = a_Bat*a_Speed;
    
    %% Control Strategy 1: None
    
    tic
    X1_none = zeros(8760,25);
    
    for no_year=1:25
        for no_day=1:365
            
            for no_driver=1:W_nodriv(no_day,no_year)
                idx_hour = (no_day-1)*24;
                
                InitialSOC = V_EV{no_day,no_year}(no_driver,3);
                EnergyReq =  (100-InitialSOC)/100*a_Bat;
                EnergyAva = V_EV{no_day,no_year}(no_driver,2)*a_Cha;
                
                TimeReq = ceil(EnergyReq/a_Cha);
                TimeArrive = V_EV{no_day,no_year}(no_driver,1);
                TimeLeave = V_EV{no_day,no_year}(no_driver,2);
                
                for no_hour=TimeArrive:TimeLeave-1
                    
                    
                    if TimeReq>1
                        X1_none(idx_hour+no_hour,no_year) = X1_none(idx_hour+no_hour,no_year)+a_Cha;
                        EnergyReq = EnergyReq-a_Cha;
                    else
                        X1_none(idx_hour+no_hour,no_year) = X1_none(idx_hour+no_hour,no_year)+EnergyReq;
                        break
                    end
                    
                    TimeReq = TimeReq-1;
                end
            end
        end
    end
    toc
    
    V1_None(:,idx_year+1:idx_year+25) = V1_None(:,idx_year+1:idx_year+25) - X1_none;
end

