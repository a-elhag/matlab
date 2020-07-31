function [Matrix] = zb3_columnsofzeros(Matrix)

% Meant to ensure that all cells have a column of length of 24 for
% concatenation purposes in the very near future

[rows_all,columns] = size(Matrix);

for lots=1:rows_all
    for days=1:366
        
        [rows, columns] = size(Matrix{lots,days});
        
        for hours=columns+1:24
            Matrix{lots,days}(:,hours) = zeros;
        end
    end
end
