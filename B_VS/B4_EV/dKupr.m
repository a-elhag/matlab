%% Initializing
clear
clc

load('0cConcat.mat')

%% Kupr
% We will put zeros from 12:00am to 2:00am and from 10:00pm to 12:00am

for no_day = 1:4
    D1_WDay{1,no_day} = C5Seas_W_Day{1,no_day};
    D1_WEnd{1,no_day} = C5Seas_W_End{1,no_day};
    
    for hour_no=[1,2,23,24];
        
        D1_WDay{1,no_day}(:,hour_no) = 0;
        D1_WEnd{1,no_day}(:,hour_no) = 0;
    end
end

d = zeros(4,1);
e = zeros(4,1);

for no_day=1:4
    
    A1 = D1_WDay{1,no_day};
    A2 = D1_WEnd{1,no_day};
    
    in1 = size(A1,1);
    in2 = size(A2,1);
    
    for j=1:in1
        c1 = sum(A1(j,:));
        if c1>0
            d(no_day) = d(no_day)+1;
        end
    end
    
    for j=1:in2
        c1 = sum(A2(j,:));
        if c1>0
            e(no_day) = e(no_day)+1;
        end
    end
    
end

for no_day=1:4
    
    D_WDay{1,no_day} = zeros(d(no_day),24);
    D_WEnd{1,no_day} = zeros(e(no_day),24);
end

for no_day=1:4
    
    A1 = D1_WDay{1,no_day};
    A2 = D1_WEnd{1,no_day};
    
    in1 = size(A1,1);
    in2 = size(A2,1);
    
    count=0;
    for j=1:in1
        c1 = sum(A1(j,:));
        if c1>0
            count = count+1;
            D_WDay{1,no_day}(count,:) = A1(j,:);
        end
    end
    
    count=0;
    for j=1:in2
        c2 = sum(A2(j,:));
        if c2>0
            count = count+1;
            D_WEnd{1,no_day}(count,:) = A2(j,:);
        end
    end
    
end

%% Housecleaning
save 0dKupr.mat D_WDay D_WEnd