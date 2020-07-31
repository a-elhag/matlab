function [Out] = zc_concat(In)

[rows_all,columns_all] = size(In);

Out = cell(1,columns_all);

% Did not use lot #6 (810)
for lots=1:rows_all
    for columns=1:columns_all
        Out{1,columns} = [Out{1,columns}; In{lots,columns}];
    end
end
