function [ finalImage ] = removeSkull( grayImage, crop,grayLimit, limitPixelsEliminate, showPlot )
    fontSize = 15;
    
    if showPlot==1
    % Display the original gray scale image.
        subplot(2, 3, 1);
        imshow(grayImage, []);
        axis on;
        title('Imagem Original Grayscale', 'FontSize', fontSize);
        % Enlarge figure to full screen.
        set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
        % Let's compute and display the histogram.
        [pixelCount, grayLevels] = imhist(grayImage);
        subplot(2, 3, 2);
        bar(grayLevels, pixelCount);
        grid on;
        title('Histograma da Imagem Original', 'FontSize', fontSize);
        xlim([0 grayLevels(end)]); % Scale x axis manually.
    end
    % Crop image to get rid of light box surrounding the image
    grayImage = grayImage(3:end-3, 4:end-4);
    % Threshold to create a binary image
    binaryImage = grayImage > grayLimit;
    % Get rid of small specks of noise
    binaryImage = bwareaopen(binaryImage, limitPixelsEliminate);
    if showPlot==1
        % Display the original gray scale image.
        subplot(2, 3, 3);
        imshow(binaryImage, []);
        axis on;
        title('Imagem Binária', 'FontSize', fontSize);
    end
    % Seal off the bottom of the head - make the last row white.
    binaryImage(end,:) = true;
    % Fill the image
    binaryImage = imfill(binaryImage, 'holes');
    if showPlot==1
        subplot(2, 3, 4);
        imshow(binaryImage, []);
        axis on;
        title('Imagem Binária Limpa', 'FontSize', fontSize);
    end
    % Erode away 15 layers of pixels.
    se = strel('disk', crop, 0);
    binaryImage = imerode(binaryImage, se);
    if showPlot==1
        subplot(2, 3, 5);
        imshow(binaryImage, []);
        axis on;
        title('Imagem Binária corroída', 'FontSize', fontSize);
    end
    % Mask the gray image
    finalImage = grayImage; % Initialize.
    finalImage(~binaryImage) = 0;
    finalImage = imresize(finalImage,[256,256]);
    if showPlot==1
        subplot(2, 3, 6);
        imshow(finalImage, []);
        axis on;
        title('Imagem sem crânip', 'FontSize', fontSize);
    end
end
