clear all;
close all;

%Il segnale audio è di natura causale. 
[y fc] = audioread("test.wav");
y = y(1:8000)'; % prendiamo solo i primi 8000 campioni convertiamo righe in colonne
sinc = 1/fc;
dur = length(y)/fc;
t = [0:sinc:dur-sinc];

binsize = 10;   %passo di campionamento delle frequenze.
F = [0:binsize:fc-binsize];



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
axis([0 5000 -100 0]); %Limitando la visione ai primi 5 kHz non si vede la simmetria.
