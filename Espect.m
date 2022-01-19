function Espect (sinal, Ts, T) %Parametros de entrada: o sinal, período de amostragem
 % e o intervalo de um dígito previamente determinado em 0.02
 
 amostras = length(sinal); %Extração da quantidade de amostras que o sinal possui
 qntAmos = T/Ts; %Extração da quantidade de amostras por cada janela de duração 
do dígito
 qntDig = amostras/qntAmos; %Extração da quantidade de dígitos no sinal
 fs = 1 / Ts; %Cálculo da frequência de amostragem
 df = fs / qntAmos; %Cálculo da resolução do sinal
 freq = []; %Inicialização do vetor que conterá as frequencias do sinal
 str = ['']; %Inicialização do vetor que conterá a String resultante
 
 for k =1:1:qntDig %Loop responsável por realizar a Transformada Discreta de Fourier 
 % No intervalo que vai desde seu inicío até seu tamanho total, 
 % aumentando de acordo com o tamanho da janela.
 S=fft(sinal((k-1)*qntAmos+1:(k*qntAmos))); %Cálculo da TDF 
 for i = 1:1:qntAmos/2 %Loop responsável por varrer as frequências do sinal
 %O Loop vai até metade da janela, pois existe simetria no espectro do sinal
 if(abs(S(i)) > 1e-13) % Verificação se o módulo do resultado da TDF é maior que 
zero
 freq = [freq abs(((i-1) * df))]; %Concatenação dos valores encontrados da 
frequencia, extraindo o módulo
 % da TDF multiplicado pela resolução 
 end
 endfor 
 endfor
 
 for j = 1:1:length(freq) %Loop responsável por analisar os pares da frequencia
 if ((freq(j) == 800) && (freq(j+1) == 1200)) %Análise do par de frequencia
 str = [str '1']; %Concatenação da string resultante
 end
 if ((freq(j) == 800) && (freq(j+1) == 1100))
 str = [str '4'];
 end
 if ((freq(j) == 800) && (freq(j+1) == 1000))
 str = [str '7'];
 end
 if ((freq(j) == 800) && (freq(j+1) == 900))
 str = [str '*'];
 end
 if ((freq(j) == 700) && (freq(j+1) == 1200))
 str = [str '2'];
 end
 if ((freq(j) == 700) && (freq(j+1) == 1100))
 str = [str '5'];
 end
 if ((freq(j) == 700) && (freq(j+1) == 1000))
 str = [str '8'];
 end
 if ((freq(j) == 700) && (freq(j+1) == 900))
 str = [str '0'];
 end
 if ((freq(j) == 600) && (freq(j+1) == 1200))
 str = [str '3'];
 end
 if ((freq(j) == 600) && (freq(j+1) == 1100))
 str = [str '6'];
 end
 if ((freq(j) == 600) && (freq(j+1) == 1000))
 str = [str '9'];
 end
 if ((freq(j) == 600) && (freq(j+1) == 900))
 str = [str '#'];
 end
 if ((freq(j) == 500) && (freq(j+1) == 1200))
 str = [str 'A'];
 end
 if ((freq(j) == 500) && (freq(j+1) == 1100))
 str = [str 'B'];
 end
 if ((freq(j) == 500) && (freq(j+1) == 1000))
 str = [str 'C'];
 end
 if ((freq(j) == 500) && (freq(j+1) == 900))
 str = [str 'D'];
 end
 endfor
 str %Print do resultado final
 endfunction