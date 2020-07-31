%% Initializing
clear
clc

load('0fKupr2.mat')

%% Arrivals Day
g1_index_day = cell(1,4);
g1_edges_day = cell(1,4);
PDF = cell(1,4);
g1_CDF_day = cell(1,4);

for no_seasons=1:4
    for no_hours=1:24
        for i=1:10
            
            A1 = ArrDay{1,no_seasons};
            A2 = A1(:,no_hours);
            no_cluster = 11-i;
            [idx,c] = kmeans(A2,no_cluster);
            
            
            
            if nnz(~c)<2
                g1_index_day{1,no_seasons}(:,no_hours) = idx;
                
                for k=1:max(size(c))
                    g1_edges_day{1,no_seasons}(k,no_hours) = c(k);
                end
                break % return or continue
            end
        end
        
        for j=1:no_cluster
            PDF{1,no_seasons}(j,no_hours) = sum(idx(:) == j);
            g1_CDF_day{1,no_seasons}(j,no_hours) = sum(PDF{1,no_seasons}(:,no_hours));
        end
        
        g1_CDF_day{1,no_seasons}(:,no_hours) = g1_CDF_day{1,no_seasons}(:,no_hours)/max(g1_CDF_day{1,no_seasons}(:,no_hours));
    end
end

%% Arrivals End
g1_index_end = cell(1,4);
g1_edges_end = cell(1,4);
PDF = cell(1,4);
g1_CDF_end = cell(1,4);

for no_seasons=1:4
    for no_hours=1:24
        for i=1:10
            
            A1 = ArrEnd{1,no_seasons};
            A2 = A1(:,no_hours);
            no_cluster = 11-i;
            [idx,c] = kmeans(A2,no_cluster);
            
            
            
            if nnz(~c)<2
                g1_index_end{1,no_seasons}(:,no_hours) = idx;
                
                for k=1:max(size(c))
                    g1_edges_end{1,no_seasons}(k,no_hours) = c(k);
                end
                break % return or continue
            end
        end
        
        for j=1:no_cluster
            PDF{1,no_seasons}(j,no_hours) = sum(idx(:) == j);
            g1_CDF_end{1,no_seasons}(j,no_hours) = sum(PDF{1,no_seasons}(:,no_hours));
        end
        
        g1_CDF_end{1,no_seasons}(:,no_hours) = g1_CDF_end{1,no_seasons}(:,no_hours)/max(g1_CDF_end{1,no_seasons}(:,no_hours));
    end
end

%% Housecleaning
save 0g1PDF_Arr g1_CDF_day g1_CDF_end g1_edges_day g1_edges_end g1_index_day g1_index_end