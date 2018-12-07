clear all;
close all;

fc = 44100;
sinc = 1/fc;

%Creo un segnale con una finestra rettangolare. 
y = zeros(1, 1000);
y(100:899) = 0.5-(0.5*cos((1/800*2*pi)*[0:799]));

dur = length(y)/fc;
t = [0:sinc:dur-sinc];

binsize = 10;   %passo di campionamento delle frequenze.
F = [-fc/2:binsize:fc/2-binsize];



DFD = zeros (1, length(F));

for(k = 1:length(F))
  fanal = F(k);
  wanal = 2*pi*fanal;
  yanal = e.^(-i*wanal*t);
  yr = y.*yanal;
  DFD(k) = sum(yr);
end

%plot(F, abs(DFD)/length(t));

figure(1)
plot (y);

figure(2)
plot(F, 20*log10(2*abs(DFD)/length(t)));
axis([-1000 1000 -100 0]); %Limitando la visione ai primi 5 kHz non si vede la simmetria.
