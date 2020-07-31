function [Logic1Day] = zb2_dura(Logic_hr,Arrivals)

%% Rearranging Matrix
% Logic_Dura in the format of: driverduration={lot_no,day}{driver_no,hour}
[rows_all,columns_all] = size(Logic_hr);
day = 366;
Logic1Day = cell(rows_all,day);

for lot=1:rows_all
    for day=1:366
        
        [rows, columns] = size(Logic_hr{lot,day});
        if (rows == 1) && (columns ==1)
            continue
        end
        j=0;
        for hour=1:24
            for driver=1:rows
                if Arrivals{lot,day}(driver,hour) == 1
                    % Sum all the values in the row of driver that equal to 1
                    j=j+1;
                    Logic1Day{lot,day}(j,hour) = sum(Logic_hr{lot,day}(driver,:) ==1);
                end
            end
        end
    end
end