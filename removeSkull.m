function [ finalImage ] = removeSkull( grayImage, crop,grayLimit, limitPixelsEliminate )
    % Crop image to get rid of light box surrounding the image
    grayImage = grayImage(3:end-3, 4:end-4);
    % Threshold to create a binary image
    binaryImage = grayImage > grayLimit;
    % Get rid of small specks of noise
    binaryImage = bwareaopen(binaryImage, limitPixelsEliminate);
    % Seal off the bottom of the head - make the last row white.
    binaryImage(end,:) = true;
    % Fill the image
    binaryImage = imfill(binaryImage, 'holes');
    % Erode away 15 layers of pixels.
    se = strel('disk', crop, 0);
    binaryImage = imerode(binaryImage, se);
    % Mask the gray image
    finalImage = grayImage; % Initialize.
    finalImage(~binaryImage) = 0;
    finalImage = imresize(finalImage,[256,256]);
end
