function pd = PropDist(z)

 

% this function is used to determine the proper distance of a galaxy
% based on its red shift.  This function is called on by Distance_and_Data.

lowerlimit = 1./(1 + z);
upperlimit = 1;
integrand = @(a) 1./sqrt((0.27.*a) + (0.73.*(a.^4)));

c = 2.99792458E8;
H = 70.8E3;

pd = quadgk(integrand, lowerlimit, upperlimit).*(c./H);

 

end
