%% Initializing
clear
clc

load('0cConcat.mat')

%% Kupr
% We will put zeros from 12:00am to 2:00am and from 10:00pm to 12:00am

for no_day = 1:366
    E1_Day{1,no_day} = C1Day{1,no_day};
    
    for hour_no=[1,2,23,24];
        E1_Day{1,no_day}(:,hour_no) = 0;
    end
end

d = zeros(366,1);

for no_day=1:366
    
    A1 = E1_Day{1,no_day};
    in1 = size(A1,1);
    
    for j=1:in1
        c1 = sum(A1(j,:));
        if c1>0
            d(no_day) = d(no_day)+1;
        end
    end
    
end

for no_day=1:366
    E2_Day{1,no_day} = zeros(d(no_day),24);
end

for no_day=1:366
    
    A1 = E1_Day{1,no_day};
    in1 = size(A1,1);
    
    count=0;
    for j=1:in1
        c1 = sum(A1(j,:));
        if c1>0
            count = count+1;
            E2_Day{1,no_day}(count,:) = A1(j,:);
        end
    end
end

%% Sorting into Days

for no_day=1:366
    A2 = E2_Day{1,no_day};
    A2(A2>0)=1;
    E3_Day{1,no_day} = A2;
end

for no_day=1:366
    A3 = E3_Day{1,no_day};
    A4 = sum(A3,1);
    E4_Day{1,no_day} = A4;
    x(no_day) = max(A4);
end

%% Sorting into Weekdays and Weekends
E5_WDay = cell(1,53);
E5_WEnd = cell(1,53);

for no_day=1:366
    no_weeks = floor((no_day-1)/7) +1;
    
    if mod(no_day+7,7)==0 || mod(no_day+6,7)==0
        weekend=1;
    else
        weekend=0;
    end
    
    if weekend==0
        E5_WDay{1,no_weeks} = [E5_WDay{1,no_weeks}; E4_Day{1,no_day}];
    end
    
    if weekend==1
        E5_WEnd{1,no_weeks} = [E5_WEnd{1,no_weeks}; E4_Day{1,no_day}];
    end
    
end

%% Sorting into Four Seasons
E_WDay = cell(1,4);
E_WEnd = cell(1,4);


for weeks=[1:8 44:53]
    E_WDay{1,1} = [E_WDay{1,1}; E5_WDay{1,weeks}];
    E_WEnd{1,1} = [E_WEnd{1,1}; E5_WEnd{1,weeks}];
end

for weeks=[9:17]
    E_WDay{1,2} = [E_WDay{1,2}; E5_WDay{1,weeks}];
    E_WEnd{1,2} = [E_WEnd{1,2}; E5_WEnd{1,weeks}];
end

for weeks=[18:30]
    E_WDay{1,3} = [E_WDay{1,3}; E5_WDay{1,weeks}];
    E_WEnd{1,3} = [E_WEnd{1,3}; E5_WEnd{1,weeks}];
end

for weeks=[31:43]
    E_WDay{1,4} = [E_WDay{1,4}; E5_WDay{1,weeks}];
    E_WEnd{1,4} = [E_WEnd{1,4}; E5_WEnd{1,weeks}];
end

%% Housecleaning
save 0eArrivals.mat E_WDay E_WEnd
