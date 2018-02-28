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
% Initialisation of the programm : delete of the Command Window and the
% Workspace

clc;
clear all;
close all;


%%
% Mesh of the material

widthTot = 1; % in cm
depthTot = 1; % in cm

nbWidth = 1000; % how many points define width (tip -> min. 100)
nbDepth = 1000; % how many points define depth (tip -> min. 100)

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