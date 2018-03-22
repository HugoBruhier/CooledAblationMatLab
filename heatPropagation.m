function [k,l,m] = heatPropagation(bulk,t )
% heatPropagation() calculate at time t+dt the temperature in all the
% material (in 2 dimensions) using the equation of heat propagation with
% numerical diferential (Taylor-Young's formula).
% 
% Input arguments :
%   *
%   *
%   *
%   *
%
%
% Output arguments :
%   *
%   *
%   *
%
%
% Authors : Sacha GRELET-RIOUT & Hugo BRUHIER
%
%   Licence Creative Commons :
%       Licensors permit others to copy, distribute, display, and perform 
%       the work. In return, licenses must give the original authors credit.
%
%

for k = 1 : length(t) % time
    for l = 1 : size(bulk.temperature,1)
        for m = 1 : size(bulk.temperature,2)
            
            
            
        end
    end


end

