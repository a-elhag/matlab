function [Logic2Week, Logic3W_End, Logic3W_Day] = zb4_week(Logic1Day)

[rows_all,columns_all] = size(Logic1Day);

Logic2Week = cell(rows_all,53);
Logic3W_End = cell(rows_all,53);
Logic3W_Day = cell(rows_all,53);

%% For Finding the Week
% for x=1:366
% z1(x) = floor((x-1)/7) +1;
% end

%% For Finding Weekends/Weekdays
% for x=1:366
%     y=x+7;
%     a = mod(y,7);
%     b = mod(y-1,7);
%     if a==0 || b==0
%         z2(x)=1;
%     else
%         z2(x)=0;
%     end
% end

%% Sorting
for lots=1:rows_all
    for days=1:366
        weeks = floor((days-1)/7) +1;
        
        if mod(days+7,7)==0 || mod(days+6,7)==0
            weekend=1;
        else
            weekend=0;
        end
        
        [rows,columns] = size(Logic1Day{lots,days});
        if (rows == 1) && (columns ==1)
            continue
        end
        
        Logic2Week{lots,weeks} = [Logic2Week{lots,weeks}; Logic1Day{lots,days}];
        
        if weekend==1
            Logic3W_End{lots,weeks} = [Logic3W_End{lots,weeks}; Logic1Day{lots,days}];
        elseif weekend==0
            Logic3W_Day{lots,weeks} = [Logic3W_Day{lots,weeks}; Logic1Day{lots,days}];
        end
    end
end