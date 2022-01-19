function[y]=MovAvg(x)
  N = length(x);
  y(1) = 0.5*x(1);
  y(2) = y(1) + 0.5*x(2);
  for n = 3:N;
    y(n) = y(n-1) + 0.5*(x(n) - x(n-2));
  endfor
endfunction

T = 1 / 10000;
t = 0:T:0.1-T;
s = 2.5*sin(2*pi*700*t) + 1.3*sin(2*pi*1200*t) + 0.7*sin(2*pi*2100*t);
ruido = 0.5*randn(1,1000);
s = s + 3*ruido;

F = 1/T;
dF = F/length(t);
f=0:dF:F-dF;

y = MovAvg(s);
Y=2*abs(fft(y))/length(y);
stem(f,Y),axis([0 F/2 0 2.52]),grid on