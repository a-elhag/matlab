function [State_Next] = z2a_markov1(TransMat,InitProb,seasons_count,hours_count,State_Prev,Rand)

% Rand = R;
% TransMat = TransMatV2_PV;

hours_count_cal = (hours_count-1)*11;
state_count = State_Prev + hours_count_cal;

State_Next = find(TransMat{1,seasons_count}(state_count,1:11)>Rand,1,'first'); 

%% This part is important
%{
When we shift between seasons, we could have a State_Prev, that is not
"defined", impossible to get to!
This will fix that!

Eg: State_Prev = 4, but it is undefined in the Transition Matrix
%}

if isempty(State_Next) == 1
    State_Next = z1a_init1(InitProb,seasons_count,hours_count,Rand);
end

