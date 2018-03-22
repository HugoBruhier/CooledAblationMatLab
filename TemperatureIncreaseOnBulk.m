function[T,P]=TemperatureIncreaseOnBulk(T0,tr,t0,E,t)
% TemperatureIncreaseOnBulk() calculate the temperature increase on
% every point of the bulk.
%
% Input arguments :
%   *   T0: initial temperature of the material
%   *   tr: inverse of the repetition rate
%   *   t0: thermal relaxation time
%   *   E: pulse energy
%   *   t: Vector of points
%
% Output arguments :
%   *   T: Temperature of the bulk
%
% Authors : Sacha GRELET-RIOUT & Hugo BRUHIER
%
%   Licence Creative Commons :
%       Licensors permit others to copy, distribute, display, and perform 
%       the work. In return, licenses must give the original authors credit.
%
T(1:length(t))=0;
P(1:length(t))=0;
Cooling=@(t)1/sqrt(1+t/t0);
T(1)=T0+E;
c=0;
for i=2:length(t)
    if mod(t(i),tr)==0
        c=c+1;
        T(i)=T(i-1)+E;
        P(i)=50;
    else
        P(i)=0;
        T(i)=T(i-1)*Cooling(t(i)-t(i-1));
    end
end
c=c;