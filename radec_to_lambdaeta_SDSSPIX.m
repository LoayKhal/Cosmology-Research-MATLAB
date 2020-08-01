function [lambda,eta] = radec_to_lambdaeta_SDSSPIX(ra,dec)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

d2r = pi/180;
r2d = 180/pi;
surveycenterDEC = 32.5;
surveycenterRA = 185.0;
etaPole = d2r*surveycenterDEC;
node = d2r*(surveycenterRA - 90);

x = cos(d2r*ra-node*ones(length(ra),1)).*cos(d2r*dec);
y = sin(d2r*ra-node*ones(length(ra),1)).*cos(d2r*dec);
z = sin(d2r*dec);

lambda = -asin(x)*r2d;
eta = (atan2(z,y)-etaPole*ones(length(ra),1))*r2d;

for n = 1:length(eta)
    if eta(n) < -180
        eta(n) = eta(n) + 360;
    end
    
    if eta(n) > 180
        eta(n) = eta(n) - 360;
    end
end

end

