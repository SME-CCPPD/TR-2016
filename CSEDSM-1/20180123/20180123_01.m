%Sinusoidi con rappresentazione in ampiezze lineari.

fcamp = 1000;                           %espressa in Hz.
pcamp = 1/fcamp;
dur = 300*pcamp;                        %durata in campioni.
asse_x = [-dur/2:pcamp:(dur/2)-pcamp];  %simmetrico rispetto allo 0. 
amps = [1 1/2 1/3 1/4 1/5 1/6 1/7 1/8]; %vettore delle ampiezze.
dbamps = 20*log10(amps);                %vettore delle ampiezze in db.

f = 30;                                 %espressa in Hz.
w = 2*pi*f;

ys = zeros(size(amps,2), size(asse_x,2)); %riempio di 0 la matrice ys.
ysdb = zeros(size(ys));

for (k=1 : size(amps,2))
  ys(k,:) = amps(k)*cos(w*asse_x);      %riempio tutte le colonne della k-esima 
  ysdb (k,:) = dbamps(k)*cos(w*asse_x);
end                                     %riga.

subplot(2,1,1);                         %per inserire due grafici nello stesso 
plot (asse_x, ys);                      %plot.
subplot(2,1,2);
plot (asse_x, ysdb);