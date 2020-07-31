function [X1_none] = z4a_none(V_EV, W_nodriv, a_Bat, a_Speed, a_Cha)

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