function [State] = z1a_init1(InitProb,seasons_count,hours_count,Rand)

hours_count = (hours_count-1)*11+1;
State = find(InitProb{1,seasons_count}(hours_count:hours_count+10,1)>Rand,1,'first');
