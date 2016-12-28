function [ Y ] = passaAlta( img )
nucleo = -1 * ones(3)/9;
nucleo(2,2) = 8/9;
Y = imfilter(img, nucleo);
end

