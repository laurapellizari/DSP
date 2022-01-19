function [freq, Ampl, Fase] = espectro(sinal, fs)
  
  fsinal = fft(sinal);
  
  N = length(sinal);
  df = fs/N;
  freq = 0:df:(fs-df);
  
  subplot(2,1,1);
  Ampl = 2*abs( fsinal( 1:floor(N/2) ) )/N;
  Ampl(1) = Ampl(1) / 2;
  stem( freq( 1:floor(N/2) ), Ampl);
  ylabel(' Amplitude ');
  xlabel(' Freq [Hz] ');
  
  subplot(2,1,2);
  Fase = (angle( fsinal( 1:floor(N/2) ) ) )*180/pi;
  stem( freq( 1:floor(N/2) ), Fase);
  ylabel(' Fase [graus] ');
  xlabel(' Freq [Hz] ');
endfunction
