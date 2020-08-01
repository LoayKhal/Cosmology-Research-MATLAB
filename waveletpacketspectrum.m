function [k,Pk,Pksig] = waveletpacketspectrum(pixels, res, ns)
    % Setting DWT mode, finding Fs
    %dwtmode(?ppd?, ?nodisp?);
    [~,Fs] = res_to_freq(res);
    [Fsx,Fsy] = res_to_freq2d(res);
    % Generating grid and corresponding 2d-k-freq bins
   
    [grid] = est2dspec(j);
    grid = grid+1;
    % Generating the tree for the 2-d wavelet packet transform
    T = wpdec2(x, j, filter);
    % Estimating 2-d spectrum
    Ps2d = grid;
    for p = 1:4^j
        [xi,yi] = find(grid == p);
        coefs = wpcoef(T,[j, p-1]);
        Ps2d(xi,yi) = var(coefs(:));
    end
%% Spherically averaging our 2d power spectrum into linear k-bins
pbounds = 0:1:(2^j);
avgbands = (0:1:(floor((2^j)*sqrt(2))))*.5*Fs/(2^j);
xbands = pbounds*.5*Fsx/(2^j);
ybands = pbounds*.5*Fsy/(2^j);
% Setting up equally-spaced frequency bins between [0,.5*Fs].
kxbins = zeros(1,length(xbands)-1);
kybins = zeros(1,length(xbands)-1);
kbins = zeros(1,length(avgbands)-1);
parfor i = 1:length(xbands)-1
    kxbins(i) = (xbands(i)+xbands(i+1))/2;
    kybins(i) = (ybands(i)+ybands(i+1))/2;
    kbins(i) = (avgbands(i)+avgbands(i+1))/2;
end
% Converting to polar coordinates
[fv1,fv2] = meshgrid(kxbins,kybins);
[~, rho] = cart2pol(fv1, fv2);
% creating a matrix, prho, which assigns each leaf to a kbin index
prho = rho;
for i = 1:length(rho)
    for j = 1:length(rho)
        [~,k] = min(abs(kbins-rho(i,j)));
        prho(i,j) = k-1;
    end
end
 
% Radially averaging
    sz = length(Ps2d);
    i = cell(sz+1,1);
    for r = 0:sz
        i{r+1} = find(prho==r);
        Pk(r+1) = nanmean(Ps2d(ir+1));
        Pksig(r+1) = nanstd(Ps2d(ir+1));
        k(r+1) = nanmean(rho(ir+1));
    end
end