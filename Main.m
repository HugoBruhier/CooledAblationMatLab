%% Simulation of cooled ablation

clc;
clear;
close all;
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
bulk.temperature = zeros(nbWidth,nbDepth);

% Boolean array of ablation, if it equal to 0 => non-ablated
bulk.ablated = zeros(nbWidth,nbDepth);


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
<<<<<<< HEAD
t=0:10^-11:5*2.2*10^-9;
=======
t=0:10^-11:2.2*10^-8;
>>>>>>> 2a5bf2952be0e42ff4ddbb3760691c00d27fc6b5

t0 = 10^(-9);

[T,P]=TemperatureIncreaseOnBulk(93,10^-10,t0,E0/16,t);
[T1,P1]=TemperatureIncreaseOnBulk(93,10^-9,t0,E0/2,t);
[T2,P2]=TemperatureIncreaseOnBulk(93,10^-8,t0,1.3*E0,t);

figure;
hold on
plot(t,T); 
plot(t,T1);
plot(t,T2);
legend('E = E_0/16    t_R = 10^{-10}','E = E_0/2    t_R = 10^{-9}','E = 1.3E_0    t_R = 10^{-8}');
hold off;


%% Find the parameters to have ablation

<<<<<<< HEAD
ablation = zeros(25,25);
=======
ablation = zeros(50,50);
>>>>>>> 2a5bf2952be0e42ff4ddbb3760691c00d27fc6b5
for k = 1 : size(ablation,1) % energy
    for l = 1 : size(ablation,2) % time
        
        time(l) = ((10-0.01)/size(ablation,2) * (l-1) + 0.01) * t0;
        energy(k) = E0 * (0.99/size(ablation,1) * (k-1) + 0.01);
        
        
        [T,P]=TemperatureIncreaseOnBulk(93,((10-0.01)/24 * (l-1) + 1) * t0,t0,E0 * (0.99/24 * (k-1) + 0.01),t);
        
        toto = [];
        toto = find(T(100:end) > 350);
        if length(toto) > 0
            ablation(k,l) = 1; 
        end
        
    end
end

%%

figure;
pcolor(time,energy,ablation);
ylabel('energy');
xlabel('time');
<<<<<<< HEAD
shading('interp');
=======
shading('flat');
>>>>>>> 2a5bf2952be0e42ff4ddbb3760691c00d27fc6b5

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
