function [Dura] = zd2_dura(Arr,years_count)

%% The format of Dura
%{
Dura{no_day,no_year}(driver_no,1) == Duration of Stay
Dura{no_day,no_year}(driver_no,2) == Time of Arrival
Dura{no_day,no_year}(driver_no,3) == SOC
%}

%% Simulating
load('0g2PDF_Dura.mat')
load('0iIdx.mat')
r_mu = 40;
r_std = 20;

for no_year=1:years_count
    disp(['EV Simulating Year #',num2str(no_year),' '])
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
        a2 = normrnd(r_mu,r_std,[a1,1]);
        a2(a2>90) = 90;
        a2(a2<10) = 10;
        Dura{no_day,no_year}(:,3) = a2;
    end
end

clc

disp(['Done Simulating EV Duration'])