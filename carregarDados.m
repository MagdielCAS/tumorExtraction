function [ classeBenigno, classeMaligno  ] = carregarDados(tam)

classeBenigno = zeros(256,256,tam);
classeMaligno = zeros(256,256,tam);
for i=1:tam
    benigno = rgb2gray(imread(['Brain_Tumor_Code\Benign\' int2str(i) '.jpg']));
    maligno = rgb2gray(imread(['Brain_Tumor_Code\Malignant\' int2str(i) '.jpg']));
    
    %normalização das imagens
    normalBem = imresize(uint8(benigno),[256,256]);
    normalMal = imresize(uint8(maligno),[256,256]);
    
    %guarda as imagens em um vetor só
    classeBenigno(:,:,i)=normalBem;
    classeMaligno(:,:,i)=normalMal;
end
end