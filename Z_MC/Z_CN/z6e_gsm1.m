function [GV3_gsm] = z6e_gsm1(GV3_gsm,LD2,LOL1_none,EV,EV_ava,EV_driver,qua_year,a_Bat,a_Speed,a_Eff_cha)

for no_year=1:qua_year
    for no_day=1:365
        if LOL1_none(no_day,no_year)==0
            continue
        end
        
        idx_hr1 = (no_day-1)*24 + 1;
        idx_hr2 = idx_hr1 + 23;
        FV2_dsm = LD2(idx_hr1:idx_hr2,1)';
        
        tic
        [FV2_dsm] = z5d_dsm1(FV2_dsm,EV{no_day,no_year},EV_ava{no_day,no_year},EV_driver(no_day,no_year),a_Bat,a_Speed,a_Eff_cha);
        GV3_gsm(idx_hr1:idx_hr2,no_year) = FV2_dsm' - LD2(idx_hr1:idx_hr2,1);
        
        disp(['Strategy: GSM and G2V      Number of Year: ', num2str(no_year), '       Number of Day: ', num2str(no_day)]);
        toc
    end
    clc
end

