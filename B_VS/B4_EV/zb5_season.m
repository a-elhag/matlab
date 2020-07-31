function [LogicSeas] = zb5_season(LogicWeek)

[rows_all,columns_all] = size(LogicWeek);

LogicSeas = cell(rows_all,4);
% Season1 = Winter || Season2 = Spring || Season3=Summer || Season4=Fall

for lots=1:rows_all
    for weeks=[1:8 44:53]
        LogicSeas{lots,1} = [LogicSeas{lots,1}; LogicWeek{lots,weeks}];
    end
    
    for weeks=[9:17]
        LogicSeas{lots,2} = [LogicSeas{lots,2}; LogicWeek{lots,weeks}];
    end
    
    for weeks=[18:30]
        LogicSeas{lots,3} = [LogicSeas{lots,3}; LogicWeek{lots,weeks}];
    end
    
    for weeks=[31:43]
        LogicSeas{lots,4} = [LogicSeas{lots,4}; LogicWeek{lots,weeks}];
    end
end