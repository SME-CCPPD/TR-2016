clear all;
close all;
%causale
[y fc] = audioread("senza_titolo.wav");
y = y'; % convertiamo righe in colonne
sinc = 1/fc;
dur = length(y)/fc;
t = [0:sinc:dur-sinc];

binsize = 10;   
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

stem(F, abs(DFD)/length(t));
axis([0 5000]);
