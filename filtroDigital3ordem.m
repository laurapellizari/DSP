function [y] = filtro3ordem(x)
  tam = length(x);
  fs=10e4; 
  Rp=10^(-1/20);
  Rs=10^(-25/20);
  ws=2*pi*550;
  wp=2*pi*150;
  N=log10((1/Rp^2-1)/(1/Rs^2-1))/(2*log10(wp/ws));
  N = fix(N) + 1;
  wc=wp*(1/(1/Rp^2-1))^(1/(2*N));
  k=0:2*N-1;
  s = wc*exp((j*pi/(2*N))*(2*k+N-1));
  
  se=zeros(1,N);
  n=0;
  for k=0:2*N-1
    if real(s(k+1))<0
      n=n+1; 
      se(n)=s(k+1);
    endif;
  endfor;
  
  kf=180/(wc/(2*pi));
  Hpf2 = tf(wc^N*(kf^N), real(poly(se)) .*[(1/kf)^N, (1/kf), 1, 1]*(kf^N));
  Hpa1 = Hpf2*tf([1 0 0 0]*(1/(kf^N * wc^N)),1);
  Hpaz = c2d(Hpa1, 1/fs, 'matched');
  
  [b,a] = tfdata(Hpaz,'vector');
  
  y(1)=b(1)*x(1);
  y(2)=b(1)*x(2)-a(2)*y(1);
  y(3)=b(1)*x(3)+b(2)*x(1)-a(2)*y(2)-a(3)*y(1);                                                                                        
  for k =4:tam
    y(k)=b(1)*x(k)+b(2)*x(k-1)+b(3)*x(k-2)+b(4)*x(k-3)-a(2)*y(k-1)-a(3)*y(k-2)-a(4)*y(k-3);
  endfor 
endfunction
