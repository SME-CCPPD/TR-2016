%filtro comb
fc = 2*pi;
pf = 0.001*2*pi;

a=[0.5 0.5];
W = [0: pf : fc-pf];
% Y(t) = a0x(t) + a1x(t-n)
n = 7;
H = a(1)+(a(2)*e.^(-i*W*n));
%funzione complessa
%modulo della funzione
plot (W , abs(H))

%implementar il filtro su un segnale