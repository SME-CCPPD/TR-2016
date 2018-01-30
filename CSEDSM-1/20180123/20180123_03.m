%Sinusoidi con rappresentazione in frequenza...

fcamp = 1000;                           %espressa in Hz.
pcamp = 1/fcamp;
dur = fcamp*pcamp;                        %durata in campioni.
asse_x = [-dur/2:pcamp:(dur/2)-pcamp];  %simmetrico rispetto allo 0. 
amps = 1; %vettore delle ampiezze.
f = [30 100 1001 500 600];                      %con f=1001 -> foldover           %espressa in Hz.

ys = zeros(size(amps,2), size(asse_x,2)); %riempio di 0 la matrice ys.

for (k=1 : size(f,2))
  w = 2*pi*f(k);
  ys(k,:) = amps*cos(w*asse_x);      %riempio tutte le colonne della k-esima 
end                                     

subplot(3,1,1);
plot (asse_x, ys(1,:));
axis([-0.15 0.15 -1.1 1.1]);                     
subplot(3,1,2);
plot (asse_x, ys(2,:));
axis([-0.15 0.15 -1.1 1.1]);  
subplot(3,1,3);
plot (asse_x, ys(3,:), asse_x, ys(4,:), asse_x, ys(5,:));  
axis([-0.01 0.01 -1.1 1.1]);  