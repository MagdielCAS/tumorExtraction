function [ imagemSegmentada ] = segmentacao( entrada, t0)

%Thereshold segmentation utilizando k-means
[classeTumor, imgKmedia] = kmeansImg(entrada,t0);
imagemSegmentada=zeros(size(entrada));
    for i= 1:1:size(imgKmedia,1)
        for j=1:1:size(imgKmedia,2)
            if imgKmedia (i,j)==t0
                imagemSegmentada(i,j)=1;
            else
                imagemSegmentada(i,j)=0;
            end
        end
    end
end