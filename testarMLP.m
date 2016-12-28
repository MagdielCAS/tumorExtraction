function [ taxaAcerto, redeTreinada  ] = testarMLP(limiar)
[ classeBenigno, classeMaligno  ] = carregarDados(12);

teste = 0;
while(teste<limiar)
[features,classes,imgsDeTreino]=treinar(classeBenigno,classeMaligno,24);

in = reshape(features,12 ,24);
out = reshape(classes,1,24);

%Rede MLP para classificar
net2 = feedforwardnet([15 15 15]);
net2.trainParam.lr = 0.01; %taxa de aprendizagem
net2.trainParam.epochs = 5000;
net2.trainParam.goal = 1e-8;
net2.trainParam.max_fail = 1000;
net2.trainParam.showWindow = 0;
net2.trainParam.showCommandLine = 0;

[net, tr]=train(net2,in, out);% Treinamento da rede
nntraintool('close');
redeTreinada = net;

z_aprox = net(in);
cont = 0;
for i = 1:24
   if(z_aprox(i)>0)
      %disp(['A RM ' int2str(imgsDeTreino(i)) ' é um tipo de tumor benigno'])
      if(classes(i)>0)
       %   disp('verdade')
          cont = cont+1;
      else
        %  disp('falso')
      end
   else
      %disp(['A RM ' int2str(imgsDeTreino(i)) ' é um tipo de tumor maligno'])
      if(classes(i)<0)
       %   disp('verdade')
          cont = cont+1;
      else
        %  disp('falso')
      end
   end
end
taxaAcerto = (cont/24)*100;
%disp(['Taxa de acerto: ' num2str(taxaAcerto)])
teste = taxaAcerto
if(teste>limiar)
    break;
end
end
end