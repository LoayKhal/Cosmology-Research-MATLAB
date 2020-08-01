function [ matrix ] = mymatrix(pixels, res)
% mymatrix takes pixels and puts them in a matrix

nx0 = 36;
ny0 = 13;

nx = nx0 * res;
ny = ny0 * res;

matrix = zeros(nx, ny);

for n = 1:length(pixels)
    column = floor(pixels(n)/nx)+1;  %Unbalanced or unexpected parenthesis or bracket
    row = mod(pixels(n), nx) + 5*res;  %Unbalanced or unexpected parenthesis or bracket

    if row > nx
        row = row - nx;
    end
    
    matrix(row, column) = matrix(row, column)+1; % should be modified to use wt
    clear row
    clear column

end


end

%gave zeros matrix