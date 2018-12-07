clear all;
close all;

fc = 44100;
sinc = 1/fc;

%Creo un segnale con una finestra rettangolare. 
y = ones(1, 1000);
y(1:100) = 0;
y(900:end) = 0;

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

plot(F, 20*log10(2*abs(DFD)/length(t)));
axis([-1000 1000]); %Limitando la visione ai primi 5 kHz non si vede la simmetria.
