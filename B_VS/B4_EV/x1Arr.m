%% Initializing
clear
clc

load('0g1PDF_Arr.mat')
load('0iIdx.mat')

%% Constants
years_count=1000;

%% Simulating
R = rand(8760,years_count);

for no_year=1:years_count
    for no_day=1:365
        for no_hour=1:24
            idx_hour = no_hour + (no_day-1)*24;
            
            if idx_day(no_day)==0
                %weekday
                a1 = g1_CDF_day{1,idx_season(no_day)};
                a2 = a1(:,no_hour);
                b1 = g1_edges_day{1,idx_season(no_day)};
                b2 = b1(:,no_hour);
                
                State(idx_hour,no_year) = find(a2>R(idx_hour,no_year),1,'first');
                Arr(idx_hour,no_year) = b2(State(idx_hour,no_year));
            end
            
            if idx_day(no_day)==1
                %weekend
                a1 = g1_CDF_end{1,idx_season(no_day)};
                a2 = a1(:,no_hour);
                b1 = g1_edges_end{1,idx_season(no_day)};
                b2 = b1(:,no_hour);
                State(idx_hour,no_year) = find(a2>R(idx_hour,no_year),1,'first');
                Arr(idx_hour,no_year) = b2(State(idx_hour,no_year));
            end
                      
        end
    end
end

Arr = round(Arr);