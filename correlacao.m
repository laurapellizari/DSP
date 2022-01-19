function[c] = correlacao(x1,x2) 
  if length(x1)~=length(x2) 
    disp('Os sinais devem ter o mesmo número de amostras cada'); 
  else
    N = length(x1); 
    r = (N*sum(x1.*x2)-sum(x1)*sum(x2))/sqrt((N*sumsq(x1)-(sum(x1))^2)*(N*sumsq(x2)-(sum(x2))^2)) 
  endif
endfunction