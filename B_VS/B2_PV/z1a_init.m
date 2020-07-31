function [State] = z1a_init(InitProb,seasons_count,hours_count,Rand,Edges)

hours_count = (hours_count-1)*Edges+1;
State = find(InitProb{1,seasons_count}(hours_count:hours_count+Edges-1,1)>Rand,1,'first');
