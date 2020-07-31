function [Arrivals] = zb1_arrive(Logic)

%% Arrival Location
% To make our code simple and easier to follow, we will break up our code
% into parts. Even if we can find the two distributions using only one
% step!

% First, we want to find out the locations of when the arrivals occur in
% our code
% Such that, if on DAY 5, DRIVER 50 arrived at HOUR 4, then a logic1 will
% be placed in Arrivals{1,5}(50,4) = 1;
% All the rest of the values for the Driver will be logic0
[rows_all,columns] = size(Logic);
Arrivals = cell(rows_all,366);

% Lastly: What to do from the difference between HOUR 24 to HOUR 1?
% We will only have 23 transition matrices. COLUMN 24 IS ALWAYS LOGIC_0!!!
for lot=1:rows_all
    for day=1:366
        
        % This is to initialize the number of rows and columns we have for each
        % day in our 'Arrivals' matrix
        [rows, columns] = size(Logic{lot,day});
        Arrivals{lot,day}(rows,columns) = zeros;
        
        
        for driver=1:rows
            
            % Meant to skip if subcell is empty
            if (rows == 1) && (columns ==1)
                continue
            end
            
            
            for hour=1:23
                
                if hour == 1
                    % The assumption here is that if there is a logic1 at HOUR1
                    % then you have just arrived and didn't stay there over
                    % night
                    
                    if Logic{lot,day}(driver,1) == 1
                        Arrivals{lot,day}(driver,1) = 1;
                    end
                    
                else
                    if (Logic{lot,day}(driver,hour) == 0) && (Logic{lot,day}(driver,hour+1) ==1)
                        Arrivals{lot,day}(driver,hour+1) = 1;
                    end
                end
            end
        end
    end
end