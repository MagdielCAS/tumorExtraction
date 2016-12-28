function [features,classes,imgsDeTreino] = treinar(classeUmDataset, classeDoisDataset,treino)
classes = zeros(treino,1);
imgsDeTreino(1)=randi([1,(length(classeUmDataset(1,1,:))+length(classeDoisDataset(1,1,:)))],1,1); %1-12 classeUm 13-24 classeDois
novaImg=0;
for i = 2:treino
  %la�o para garantir que ser�o selecionadas imagens aleat�rias diferentes
  dowhile = true;
  while dowhile
    novaImg = randi([1,(length(classeUmDataset(1,1,:))+length(classeDoisDataset(1,1,:)))],1,1); %1-12 classeUm 13-24 classeDois
    dowhile = ismember(novaImg,imgsDeTreino);
  end
  imgsDeTreino(i)=novaImg;
end

%Ap�s selecionado as imagens de teste, ser� feito o pr�-processamento delas
%e segmenta��o
%imagensTratadas = zeros(256,256,12);
for i = 1:treino
    indiceImg = imgsDeTreino(i);
    if(indiceImg<=12)
        imagensTratadas(:,:,i) = preprocessamento(classeUmDataset(:,:,indiceImg));
        features(:,i)= featureDetermination(classeUmDataset(:,:,indiceImg).*imagensTratadas(:,:,i));
        classes(i,1)=1;
    else
        imagensTratadas(:,:,i) = preprocessamento(classeDoisDataset(:,:,indiceImg-12));
        features(:,i) = featureDetermination(classeDoisDataset(:,:,indiceImg-12).*imagensTratadas(:,:,i));
        classes(i,1)=-1;
    end
end

%SVMModel = svmtrain(classes, features);

end

