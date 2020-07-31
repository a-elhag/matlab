function [Virtual_DGV3] = z1a_UltimateDG(years_count)

%% DG Characteristics
%{
There are three DG characteristics we are concered with:
1) Cap (Capacity)
   This is the maximum generating capacity of generator (i) in MW
2) MTTF(Mean Time to Fail)
   As the name suggests, for generator (i) this is the mean time that it
   will take to fail.
   For example, generator 6 has a MTTF of 450 hours. Meaning on average, we
   expect it to fail every 450 hours.
3) MTTR(Mean Time to Repair)
   Evident from name. For example, that same generator 6 has a MTTR of 50
   hours. Meaning that when it fails, it will take on average 50 hours to
   bring it back online
%}

Cap=[12 12 12 12 12 20 20 20 20 50 50 50 50 50 50 76 76 76 76 100 100 100 155 155 155 155 197 197 197 350 400 400]';
MTTF=[2940 2940 2940 2940 2940 450 450 450 450 1980 1980 1980 1980 1980 1980 1960 1960 1960 1960 1200 1200 1200 960 960 960 960 950 950 950 1150 1100 1100]';
MTTR=[60 60 60 60 60 50 50 50 50 20 20 20 20 20 20 40 40 40 40 50 50 50 40 40 40 40 50 50 50 100 150 150]';

%% Misc

years_simu=0; 
xtra_mul = 1.01;

% This is making sure we generate enough years. Since we are not exactly
% sure how much years we are generating, this code will initially generate
% iter with an extra multiplier. If more is indeed needed, then the
% multiplier is mulitplied by 1.1. Until the condition is satisified
while years_count>years_simu
    
    iter = ceil(xtra_mul*years_count*8760/min(MTTF));
    
    R1 = rand(32,iter);
    R2 = rand(32,iter);
    
    % This part we are taking advantage of Matlabs understanding towards
    % Matrices
    MTTF_Rep = repmat(MTTF,1,iter);
    MTTR_Rep = repmat(MTTR,1,iter);
    
    % Virtual Scenario Generating
    TTF = round(-MTTF_Rep.*log(R1));
    TTR = round(-MTTR_Rep.*log(R2));
    
    % Converting to 1's and 0's
    A_Sum = sum(TTF,2)+sum(TTR,2);
    B_Min = min(A_Sum);
    years_simu = floor(B_Min/8760);
    
    xtra_mul = xtra_mul*1.1;
    
end

% %% Temporary One DGerator
% DG1_TTF = TTF(1,:);
% DG1_TTR = TTR(1,:);
%
% %% Setting up Matrices
% A_Sum = sum(DG1_TTF) + sum(DG1_TTR);
% count_max = floor(A_Sum/8760);
%
% tic
% DG1 = ones(1,A_Sum);
% toc

%% Proper Work!
Virtual_DGV1 = ones(32,years_count*8760);

for DG_no=1:32
    count=1;
    for fail_no=1:iter
        
        count = count+TTF(DG_no,fail_no);
        Z1 = count;
        Z2 = count - 1 + TTR(DG_no,fail_no);
        count = count + TTF(DG_no,fail_no);
        
        Virtual_DGV1(DG_no,Z1:Z2) = zeros(1,TTR(DG_no,fail_no));
        if count>years_simu*8760
            break
        end
    end
end

Virtual_DGV2 = cell(1,32);
Virtual_DGV3 = zeros(8760,years_count);

for DG_no=1:32
    Virtual_DGV2{1,DG_no} = reshape(Virtual_DGV1(DG_no,1:years_count*8760),8760,years_count)*Cap(DG_no,1);
    Virtual_DGV3 = Virtual_DGV3 + Virtual_DGV2{1,DG_no};
end

% DG1_b = reshape(Virtual_DGV1(1,1:years_count*8760),8760,count_max);
