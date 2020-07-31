%% Initializing
%% Initializing
clear
clc

load('1_Data_Orig.mat')

%% PV Output Power

%------------------
% Intializing Panel
%------------------

NOCT = 45;
Ki = 0.05;
Kv = -0.27; %Kv should always be negative!

Isc = 6.43;
Voc = 85.6;

Impp = 5.97;
Vmpp = 72.9;

FF = (Vmpp*Impp)/(Voc*Isc);
Ncells = 1;
PVRatedPower = 435;

%-------------------------
% Calculating Power Output
%-------------------------

% Because of the fact that there are days with clouds and days without, we have a
% two humped shape to our distribution. Making it difficult to model. Thus to
% simplify it, we will convert the solar irradiance and temperature into power!

% Note: Divided PVdata/1000 (from W to kW) || Used twice in the code below!
factor = 1000;

for hour=0:8760-1
    tempXHr(hour+1,1) = tempX(floor(hour/24)+1);
end

for hour=1:8760
    for year=1:6
        Tcell(hour,year) = tempXHr(hour)+ PVdata(hour,year)*(NOCT-20)/(0.8*factor);
    end
end

for hour=1:8760
    for year=1:6
        Ipv(hour,year) = (PVdata(hour,year)/factor) * (Isc + Ki * (Tcell(hour,year)-25));
        Vpv(hour,year) = Voc + Kv*Tcell(hour,year); % Again Kv should be negative
        Ppv(hour,year) = Ncells * FF * Vpv(hour,year) * Ipv(hour,year);
    end
end

%-------------
% Scaling Ppv
%-------------

% Note: Due to assumed limitations of our PV panels, we will limit the
% output power to PVRatedPower.
Ppv(Ppv>PVRatedPower)= PVRatedPower;

% We will scale our data such that the max nominal power is 1
PpvMax = max(Ppv(:));
Power_PV = Ppv/PpvMax;

%% HouseCleaning
save 2a_SetUp.mat Power_PV 
clear
clc

load('1_Data_Orig.mat')

%% PV Output Power

%------------------
% Intializing Panel
%------------------

NOCT = 45;
Ki = 0.05;
Kv = -0.27; %Kv should always be negative!

Isc = 6.43;
Voc = 85.6;

Impp = 5.97;
Vmpp = 72.9;

FF = (Vmpp*Impp)/(Voc*Isc);
Ncells = 1;
PVRatedPower = 435;

%-------------------------
% Calculating Power Output
%-------------------------

% Because of the fact that there are days with clouds and days without, we have a
% two humped shape to our distribution. Making it difficult to model. Thus to
% simplify it, we will convert the solar irradiance and temperature into power!

% Note: Divided PVdata/1000 (from W to kW) || Used twice in the code below!
factor = 1000;

for hour=0:8760-1
    tempXHr(hour+1,1) = tempX(floor(hour/24)+1);
end

for hour=1:8760
    for year=1:6
        Tcell(hour,year) = tempXHr(hour)+ PVdata(hour,year)*(NOCT-20)/(0.8*factor);
    end
end

for hour=1:8760
    for year=1:6
        Ipv(hour,year) = (PVdata(hour,year)/factor) * (Isc + Ki * (Tcell(hour,year)-25));
        Vpv(hour,year) = Voc + Kv*Tcell(hour,year); % Again Kv should be negative
        Ppv(hour,year) = Ncells * FF * Vpv(hour,year) * Ipv(hour,year);
    end
end

%-------------
% Scaling Ppv
%-------------

% Note: Due to assumed limitations of our PV panels, we will limit the
% output power to PVRatedPower.
Ppv(Ppv>PVRatedPower)= PVRatedPower;

% We will scale our data such that the max nominal power is 1
PpvMax = max(Ppv(:));
Power_PV = Ppv/PpvMax;

%% HouseCleaning
save 2a_SetUp.mat Power_PV 
