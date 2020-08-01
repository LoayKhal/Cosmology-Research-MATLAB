function [ index] = myhealpix(ra,dec,res)
%myhealpix takes ra, dec, res and returns a pixel number based on 
% healpix ideas and SDSS geometry.
nx0 = 36;
ny0 = 13;

% some constants (seems to)
d2r = pi/180;
r2d = 180/pi;
etaOffSet = 91.25;
surveyCenterRA = 185.0;
surveyCenterDEC = 32.5;
node = d2r*(surveyCenterRA - 90.0);
etaPole = d2r*surveyCenterDEC;


% Converting RA-DEC -> LAMBDA-ETA   by    %calling radec_to_lambdaaeta_SDSSPIX
[lambda,eta]=radec_to_lambdaeta_SDSSPIX(ra,dec);

% Converting LAMBDA-ETA -> HEALPix index
nx = nx0*res;
ny = ny0*res;

pixnum = eta;

for n = 1:length(eta)
    eta1=(eta(n)-etaOffSet)*d2r;
    
    if eta1 >= 0
        eta2 = eta1;
    else
        eta2 = eta1 + 2*pi;
    end
    
    i = floor((nx*eta2)/(2*pi));
    
    lambda2 = (90 - lambda(n))*d2r;
    
    if lambda2 >= pi
        j = ny - 1;
    else
        j = floor(ny*((1-cos(lambda2))/2));
    end
    
    pixnum(n) = nx*j+i;
    
end
index = pixnum;

end
