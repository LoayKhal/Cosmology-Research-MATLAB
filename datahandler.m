function data= datahandler(ra,dec,res)
%datahandler takes ra and dec of galaxies and a given resolution, res and 
% places them in a matrix in which each element is equal area.
% Based on HealPiX ideas
%
% Uses routines myhealpix and mymatrix
% Output: data is the matrix to be fractal analyzed.

pixels = myhealpix(ra,dec,res);
data = mymatrix(pixels,res);

end