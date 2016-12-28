clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
clear;  % Erase all existing variables. Or clearvars if you want.
workspace;  % Make sure the workspace panel is showing.

grayImage = rgb2gray(imread('Brain_Tumor_Code\Benign\1.jpg'));

imgMin = prctile(grayImage(:),35);
imgMax = prctile(grayImage(:),99.9);
Bmin = grayImage-imgMin;
Bmax = double(Bmin)/(double(imgMax)-double(imgMin))*255;
normalized = imresize(uint8(Bmax),[256,256]);

final = preprocessamento(normalized);

figure;
subplot(1,2,1)
imshow(grayImage,[]);
title('Original');

subplot(1,2,2)
tam = size(grayImage);
imshow(imresize(single(grayImage),[256,256])+imresize(single(grayImage),[256,256]).*final,[]);
title('Segmentada')


