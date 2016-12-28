function [ImagemTumor, ImagemSegmentada, features] = processar(imagem)

imgMin = prctile(imagem(:),35);
imgMax = prctile(imagem(:),99.9);
Bmin = imagem-imgMin;
Bmax = double(Bmin)/(double(imgMax)-double(imgMin))*255;
normalized = imresize(uint8(Bmax),[256,256]);

ImagemTumor = preprocessamento(normalized);
ImagemSegmentada = single(normalized) + ImagemTumor*255;
features = featureDetermination(single(normalized).*ImagemTumor);

end

