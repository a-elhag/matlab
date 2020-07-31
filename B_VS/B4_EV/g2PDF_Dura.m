%% Initializing
clear
clc

load('0fKupr2.mat')

%% CDF

g2_pdf_day = cell(1,4);
g2_pdf_end = cell(1,4);

g2_cdf_day = cell(1,4);
g2_cdf_end = cell(1,4);

for no_season=1:4
    for no_hour=1:24
        for no_counter=1:24
            A1 = DuraDay{1,no_season}(:,no_hour);
            A2 = DuraEnd{1,no_season}(:,no_hour);
            
            g2_pdf_day{1,no_season}(no_counter,no_hour) = sum(A1==no_counter);
            g2_pdf_end{1,no_season}(no_counter,no_hour) = sum(A2==no_counter);
            
            B1 = g2_pdf_day{1,no_season}(:,no_hour);
            B2 = g2_pdf_end{1,no_season}(:,no_hour);
            
            g2_cdf_day{1,no_season}(no_counter,no_hour) = sum(B1);
            g2_cdf_end{1,no_season}(no_counter,no_hour) = sum(B2);
        end
        
        max1 = max(g2_cdf_day{1,no_season}(:,no_hour));
        max2 = max(g2_cdf_end{1,no_season}(:,no_hour));
        
        if max1>0
            g2_cdf_day{1,no_season}(:,no_hour) = g2_cdf_day{1,no_season}(:,no_hour)/max1;
        end
        
        if max2>0
            g2_cdf_end{1,no_season}(:,no_hour) = g2_cdf_end{1,no_season}(:,no_hour)/max2;
        end
        
    end
end

%% Housecleaning
save 0g2PDF_Dura.mat g2_cdf_day g2_cdf_end
