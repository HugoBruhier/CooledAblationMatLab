%% Simulation of cooled ablation
%
% This code is a little theorical simulation of the cooled ablation.
% We use the equation of thermal propagation with a method of 
% finite differences.
%
% Written for a project in our school in a course of laser processes.
%
% Authors : Sacha GRELET-RIOUT & Hugo BRUHIER
%
%   Licence Creative Commons :
%       Licensors permit others to copy, distribute, display, and perform 
%       the work. In return, licenses must give the original authors credit.
%
%

%%
% Reminder of numerical diferencial
%
% If we use the Taylor's equation we can proove that :
%
% df/dx = (u(x+h) - u(x))/h
%
% d2f/dx2 = (u(x+h) + u(x-h) - 2*u(x))/(h^2)

%%
% Equation of thermal propagation in 2D
%    ------------------------------------------
%   | du/dt - alpha * (d2u/dx2 - d2u/dy2 ) = 0 |
%    ------------------------------------------
% where u(x,y,t) is the temperature at one point at a moment and alpha is 
% the thermal diffusivity (we consider alpha be 1).

%%
% Mesh of the material

widthTot = 1; % in cm
depthTot = 1; % in cm

nbWidth = 1000; % how many points define width (tip min. 100)
nbDepth = 1000; % how many points define depth (tip min. 100)

% Array of the temperature
%bulk.temperature = zeros(nbWidth,nbDepth);

% Boolean array of ablation, if it equal to 0 => non-ablated
%bulk.ablated = zeros(nbWidth,nbDepth);


%%
% Laser definition

timeOfImpulse = 0.150; % in ns
repetitionRate = 12; % in MHz

diameter = 0.2; % diameter of the spot in cm
section = pi * (diameter * 0.01)^2 / 4; % calculation of the section of the spot in m^2

waveLength = 1064; % central wavelength of the laser in nm

E0=320; % energy needed to get the critial temperature
Ep=E0/16; % energy of one pulse

%%  Simulation 
t=0:10^-12:5*10^-8;
[T,P]=TemperatureIncreaseOnBulk(93,10^-10,10^-9,E0/16,t);
[T1,P1]=TemperatureIncreaseOnBulk(93,10^-9,10^-9,E0/2,t);
[T2,P2]=TemperatureIncreaseOnBulk(93,10^-8,10^-9,1.3*E0,t);
figure;
plot(t,T); 
hold on;
plot(t,T1);
plot(t,T2);

%% Save data in an excel
% filename='Data.xlsx';
% xlRange = ['B2';'C2';'D2'];
% sheet='Feuil1';
% xlswrite(filename,t',sheet,xlRange(1,:));
% xlswrite(filename,T',sheet,xlRange(2,:));
% xlswrite(filename,P',sheet,xlRange(3,:));
% 
% xlRange = ['B1';'C1';'D1'];
% xlswrite(filename,'t',sheet,xlRange(1,:));
% xlswrite(filename,'T',sheet,xlRange(2,:));
% xlswrite(filename,'P',sheet,xlRange(3,:));
