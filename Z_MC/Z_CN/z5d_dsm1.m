function [FV2_dsm] = z5d_dsm1(FV2_dsm,EV2,EV2_ava,EV2_driver,a_Bat,a_Speed,a_Eff_cha)

a_Cha = a_Bat*a_Speed;

for no_driver=1:EV2_driver
    
    SOC_initial = EV2(no_driver,3);
    EnergyReq = ((100-SOC_initial)/100)*a_Bat;
    EnergyAva = EV2(no_driver,2)*a_Cha;
    
    if EnergyReq>EnergyAva
        SOC_initial = (1-EnergyAva/a_Bat)*100;
    end
    
    [FV2_dsm] = z5c_dsm1(FV2_dsm,EV2_ava(no_driver,:),SOC_initial,a_Bat,a_Speed,a_Eff_cha);        
end
