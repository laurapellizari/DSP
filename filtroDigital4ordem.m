function [y] = filtro4ordem(x)
  tam = length(x);
  
  [N,Wc]=buttord(350/5000,110/5000,2,30)
  [b,a]=butter(N,Wc,'high')
  
  y(1)=b(1)*x(1);
  y(2)=b(1)*x(2)+b(2)*x(1)-a(2)*y(1);
  y(3)=b(1)*x(3)+b(2)*x(2)+b(3)*x(1)-a(2)*y(2)-a(3)*y(1);
  y(4)=b(1)*x(4)+b(2)*x(3)+b(3)*x(2)+b(4)*x(1)-a(2)*y(3)-a(3)*y(2)-a(4)*y(1);
  
  for k =5:1:tam
    y(k)=b(1)*x(k)+b(2)*y(k-1)+b(3)*x(k-2)+b(4)*x(k-3)+b(5)*x(k-4)-a(2)*y(k-1)-a(3)*y(k-2)-a(4)*y(k-3)-a(5)*y(k-4);
  endfor 
  
endfunction