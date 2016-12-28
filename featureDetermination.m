function [ feature ] = featureDetermination( imagem )

[GCMSMatriz,Contraste, Homogeneidade, Entropia, Energia] = GCMSandGabor(imagem);

Media = mean2(GCMSMatriz);
Desvio_padrao = std2(GCMSMatriz);
RMS = mean2(rms(GCMSMatriz));
Variancia = mean2(var(double(GCMSMatriz)));
a = sum(double(GCMSMatriz(:)));
Suavidade = 1-(1/(1+a));
Achatamento = kurtosis(double(GCMSMatriz(:)));  %curtose -> caracteriza o achatamento em relação a distribuição gaussiana
Assimetria = skewness(double(GCMSMatriz(:)));
% Inverse Difference Movement
m = size(GCMSMatriz,1);
n = size(GCMSMatriz,2);
in_diff = 0;
for i = 1:m
    for j = 1:n
        temp = GCMSMatriz(i,j)./(1+(i-j).^2);
        in_diff = in_diff+temp;
    end
end
IDM = double(in_diff);
feature = [Contraste, Homogeneidade, Entropia, Energia,Media,Desvio_padrao,RMS,Variancia,Suavidade,Achatamento,Assimetria,IDM];
end

