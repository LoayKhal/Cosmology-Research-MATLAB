function [boxsize]= cal(freq,f,pi)

area= 1/ (freq*f*pi / 2);

boxsize= sqrt(area/pi);

end 