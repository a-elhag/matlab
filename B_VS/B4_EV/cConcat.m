%% Initializing
% Purpose self evident from the name
clear
clc

load('0bSetUp.mat')

%% Concatenation

[C1Day] = zc_concat(Logic1Day);

[C2Week] = zc_concat(Logic2Week);
[C3W_End] = zc_concat(Logic3W_End);
[C3W_Day] = zc_concat(Logic3W_Day);

[C4Seas_Week] = zc_concat(Logic4Seas_Week);
[C5Seas_W_Day] = zc_concat(Logic5Seas_W_Day);
[C5Seas_W_End] = zc_concat(Logic5Seas_W_End);

%% House Cleaning
save 0cConcat.mat C1Day C2Week C3W_End C3W_Day C4Seas_Week C5Seas_W_Day C5Seas_W_End