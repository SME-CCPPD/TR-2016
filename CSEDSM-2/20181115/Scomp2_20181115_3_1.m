clear all;
close all;
 
fc = 1000;
sinc = 1/fc;
dur = 0.5;
t = [-dur/2:sinc:dur/2-sinc];

f = 10;
w = 2*pi*f;
F = [f, f*35, f*1.3];
y = e.^(i*w*t);   %funzione

figure(1)
fanal1 = F(2);
y_anal1 = e.^(-i*fanal1*2*pi*t);
yr1 = y.*y_anal1;   %funzione risultante
yft1 = abs(sum(yr1))/length(t);

fanal2 = F(3);
y_anal2 = e.^(-i*fanal2*2*pi*t);
yr2 = y.*y_anal2;   %funzione risultante
yft2 = abs(sum(yr2))/length(t);

fanal3 = F(1);
y_anal3 = e.^(-i*fanal3*2*pi*t);
yr3 = y.*y_anal3;   %funzione risultante
yft3 = abs(sum(yr3))/length(t);

hold on
stem(F(1), yft3);
stem(F(2), yft1);
stem(F(3), yft2);

hold off
