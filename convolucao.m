function[y]=convolucao(x1,x2)
  N = length(x1);
  NN = length(x2);
  y = zeros(1,N+NN-1);
  for i=1:N
    for j=1:NN
      y(i+j-1)=y(i+j-1)+x1(i)*x2(j);
    endfor
  endfor
endfunction