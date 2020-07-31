function [EV_Load] = zd4_UltimateEV(years_count,parks_count)

Arr = zd1b_arr(years_count,parks_count);
Dura = zd2_dura(Arr,years_count);
EV_Load = zd3_load(Dura);
