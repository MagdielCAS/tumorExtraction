function [ imageFinal ] = preprocessamento( imagem )
    imagemSemCranio = single(removeSkull(imagem,15,20,10)); %remove o crânio da imagem
    imagemSemCranio = medfilt2(passaAlta(imagemSemCranio))+imagemSemCranio;%passa filtros para diminuir ruidos e melhorar a segmentação
    imageFinal = (segmentacao(imagemSemCranio,3)); %processo de thereshold segmentation
end

