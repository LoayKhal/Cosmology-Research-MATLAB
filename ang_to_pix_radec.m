function [ pixnum ] = ang_to_pix_radec( res, lambda, eta )
%This function creates a pixel number for the quantities ra and dec
% from the lambda and eta values given by SDSS.

nx0=36;
ny0=13;

degree2Rad = pi./180.0;
etaOffset = 1.25;

nx = nx0*res;
ny = ny0*res;

eta = (eta - etaOffset)*degree2Rad;
    
if eta >= 0
    eta2 = eta;
else
    eta2 = eta + 2.*pi;
end

i = floor(nx.*eta2./(2.*pi));    

lambda = (90.0 - lambda).*degree2Rad;

if lambda >= pi
    j = ny - 1;
else
    j = floor(ny.*((1 - cos(lambda))./2));
end

pixnum = nx*j + i;

end
