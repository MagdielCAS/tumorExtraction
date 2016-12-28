function [GCMSMatriz,Contraste, Homogeneidade, Entropia, Energia] = GCMSandGabor(imagem)
    N = 8;
    GCMSMatriz = graycomatrix(imagem);
    %c�lculo de contraste
    sum = 0;
    for i=1:N
        for j=1:N
            sum = sum + GCMSMatriz(i,j)*((i-j-2)^2);
        end
    end
    Contraste = sum;

    %c�lculo da Homogeneidade
    sum = 0;
    for i=1:N
        for j=1:N
            sum = sum +  GCMSMatriz(i,j)/(1+(i-j-2)^2);
        end
    end
    Homogeneidade = sum;

    %c�lculo da Entropia
    sum = 0;
    for i=1:N
        for j=1:N
            sum = sum +  -log(GCMSMatriz(i,j)+1)*GCMSMatriz(i,j);
        end
    end
    Entropia = sum;

    %c�lculo da Energia
    sum = 0;
    for i=1:N
        for j=1:N
            sum = sum + GCMSMatriz(i,j)^2;
        end
    end
    Energia = sum;
end

