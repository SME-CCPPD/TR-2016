% y(t) +b0*y(t-1) = a0*x(t)
% y(t) = a0*x(t) - b0*y(t-1)

%IIR 

fc = 2*pi;
pc = 0.01*2*pi;
a0 = 0.5;
b0 = 0.5;
W = [0 : pc : fc-pc];
H = 1./(a0 - b0*e.^(-i*W));
subplot(2, 1, 1)
plot (W, abs(H))
axis([W(1) W(size(W,2)/2)])
subplot (2, 1, 2)
plot (W, angle(H))
axis([W(1) W(size(W,2)/2)])
