%% Initializing
clear
clc

%% Simulating Virtual Scenarios

for no_day=1:365
    
    if no_day<79
        no_season=1;
    else if no_day<79+93
            no_season=2;
        else if no_day<79+93+93
                no_season=3;
            else if no_day<79+93+93+90
                    no_season=4;
                else
                    no_season=1;
                end
            end
        end
    end
    
    idx_season(no_day) = no_season;
    
    a = mod(no_day+7,7);
    b = mod(no_day+7-1,7);
    if a==0 || b==0
        idx_day(no_day)=1;
    else
        idx_day(no_day)=0;
    end
    
end

%% Housecleaning
save 0iIdx.mat idx_day idx_season