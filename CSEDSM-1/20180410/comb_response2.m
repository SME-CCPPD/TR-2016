%filtro comb
fc = 2*pi;
pf = 0.001*2*pi;

a=[0.005 0.995];
W = [0: pf: fc-pf];
% Y(t) = a0x(t) + a1x(t-n)
n = 7;
H = a(1)+(a(2)*e.^(-i*W*n));
%funzione complessa
%modulo della funzione
subplot(2, 1, 1)
plot (W , abs(H))
axis([W(1) W(end) 0.6 1.03])
subplot(2, 1, 2)
plot(W, unwrap(angle(H)))

%implementar il filtro su un segnale
