function[hpb,hpa]= kernels(fc1,fc2,BW,fs)
  
  fc1 = fc1/fs;
  fc2 = fc2/fs;
  BW = BW/fs;
  M = 4 / BW;
  
  h1=zeros(1,M);
  for n=0:M-1
    h1(n+1)=((sin(2*pi*fc1.*(n-M/2)))/(n-M/2)).*(0.42-0.5.*cos(2*pi*n./M)+0.08*cos(4*pi*n./M));
  endfor
  h1(M/2+1)=2*pi*fc1;
  h1=h1./sum(h1);
    
  h2=zeros(1,M);
  for n=0:M-1
    h2(n+1)=((sin(2*pi*fc2.*(n-M/2)))/(n-M/2)).*(0.42-0.5.*cos(2*pi*n./M)+0.08*cos(4*pi*n./M));
  endfor
  h2(M/2+1)=2*pi*fc2;
  h2=h2./sum(h2);
  h2=-h2;
  h2(M/2+1)=h2(M/2+1)+1;
  
  hpb = h1;
  hpa = h2;
endfunction
