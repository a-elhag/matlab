%% Initializing
clear
clc

load('0g2PDF_Dura.mat')
load('0iIdx.mat')

%% The format of Dura
%{
Dura{no_day,no_year}(driver_no,1) == Duration of Stay
Dura{no_day,no_year}(driver_no,2) == Time of Arrival
Dura{no_day,no_year}(driver_no,3) == SOC
%}

%% Constants
years_count=2;

%% Getting the number of arrivals
Arr = zd1_arr(years_count);

%% Simulating Dura
tic
for no_year=1:years_count
    
    for no_day=1:365
        
        if idx_day(no_day)==0
            %weekday
            cdf = g2_cdf_day{1,idx_season(no_day)};
        end
        
        if idx_day(no_day)==1
            cdf = g2_cdf_end{1,idx_season(no_day)};
            %weekend
        end
        
        for no_hour=1:24
            idx_hour = no_hour + (no_day-1)*24;
            iter = Arr(idx_hour,no_year);
            R = rand(iter,1);
            
            for i=1:iter
                Dura{no_day,no_year}(i,1) = find(cdf(:,no_hour)>R(i,1),1,'first');
                Dura{no_day,no_year}(i,2) = no_hour;
            end
        end
        a1 = size(Dura{no_day,no_year},1);
        a2 = normrnd(40,20,[a1,1]);
        a2(a2>90) = 90;
        a2(a2<10) = 10;
        Dura{no_day,no_year}(:,3) = a2;
    end
end
toc

