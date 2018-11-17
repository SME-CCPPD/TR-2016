fc = 1000;
sinc = 1/fc;
dur = 0.5;
t = [-dur/2:sinc:dur/2-sinc];

f = 10;
w = 2*pi*f;

y = e.^(i*w*t);   %funzione

figure(1)
fanal1 = f*150.2;
y_anal1 = e.^(-i*fanal1*2*pi*t);
yr1 = y.*y_anal1;   %funzione risultante
plot (t, yr1);

figure(2)
fanal2 = f*1.3;
y_anal2 = e.^(-i*fanal2*2*pi*t);
yr2 = y.*y_anal2;   %funzione risultante
plot (t, yr2);

figure(3)
fanal3 = f;
y_anal3 = e.^(-i*fanal3*2*pi*t);
yr3 = y.*y_anal3;   %funzione risultante
plot (t, yr3);
