function y = sistema(x)
  N = length(x);
  
  k=1;
  y(k)=0;
  k=2;
  y(k) = 2.075124843600790e-08*x(k-1);
  k=3;
  y(k) = 2.075124843600790e-08*x(k-1) -6.225374530802370e-08*x(k-2) -... 
    6.027225625034919e-06*y(k-2);
  k=4;
  y(k) = 2.075124843600790e-08*x(k-1) -6.225374530802370e-08*x(k-2) +... 
    6.225374530802370e-08*x(k-3)-...
    1.813911772320054e-03*y(k-3) - 6.027225625034919e-06*y(k-2) +...
    5.742726605370865e-12*y(k-3);
  for k=5:N
    y(k) = 2.075124843600790e-08*x(k-1) -6.225374530802370e-08*x(k-2) +... 
    6.225374530802370e-08*x(k-3) - 2.075124843600790e-08*x(k-4) -...
    1.813911772320054e-03*y(k-3) - 6.027225625034919e-06*y(k-2) +...
    5.742726605370865e-12*y(k-3) - 1.486659525523538e-18*y(k-4);
 
  endfor
endfunction
