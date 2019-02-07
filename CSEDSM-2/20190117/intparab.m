%Funzione che interpola 3 punti e ne restituisce magnitudine e frequenza del 
%picco massimo fra i 3 punti. 
%La funzione ritorna un array con mag e freq e riceve due array (per x e y)
%contenenti i valori dei 3 punti. 

function [freq, mag] = intparab(x,y)
  a = (y(1)+y(3)-(2*y(2)))/2;
  p = (y(1)-y(3))/(4*a);
  b = y(2)-(a*(p^2));
  
 xs = [-1:0.0001:1];  %Frequenza di campionamento molto fine per disegnare la parabola.
 ys = a*((xs-p).^2)+b;
 plot (xs, ys, [-1 0 1], y, "*")

  freq = x(2)+p;
  mag = y(2)-(1/4)*(y(1)-y(3))*p;
  plot (x, y, freq, mag, '*')

endfunction
