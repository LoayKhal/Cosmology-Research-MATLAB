function [ pixel_matrix ] = pixelization( res, ra, dec )
%This function pixelizes a matrix of galaxies based on the values of right
%ascension and declination.  This must be done for each shell.  This
%function calls ang_to_pix_radec.

nx0 = 36;
ny0 = 13;

nx = nx0*res;
ny = ny0*res;


pixel_matrix = zeros(nx, ny);
for j = 1:length(ra)
    ra1=ra(j);
    dec1=dec(j);
    lambda = ra1 - 185.0;
eta = dec1 - 32.5;

if lambda < -90 || lambda > 90
    if lambda < -90
        lambda = lambda + 180;
    else
        lambda = lambda - 180;
    end
    if eta >= 0
        eta = eta + 90;
    else
        eta = eta - 90;
    end
end

if eta < -180
    eta = eta + 360;
end
pixels = ang_to_pix_radec(res, lambda, eta);


column = floor(pixels / nx) + 1;
row = mod(pixels, nx) + 5*res;

if row > nx
   row = row - nx;
end

    pixel_matrix(row, column) = pixel_matrix(row, column) + 1;
    clear row
    clear column
    
 
end
end

