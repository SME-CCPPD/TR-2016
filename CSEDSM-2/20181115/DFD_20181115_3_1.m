clear all;
close all;
 
fc = 1000;
sinc = 1/fc;
dur = 0.5;
t = [-dur/2:sinc:dur/2-sinc];

binsize = 10;   %passo di campionamento delle frequenze.
F = [-fc/2:binsize:fc/2-binsize];

f = 10;
w = 2*pi*f;
y = 0.8*e.^(i*w*t);   %funzione

DFD = zeros (1, length(F));

for(k = 1:length(F))
fanal = F(k);
wanal = 2*pi*fanal;
yanal = e.^(-i*wanal*t);
yr = y.*yanal;
DFD(k) = sum(yr);
end

%plot(F, abs(DFD)/length(t));
subplot(2,1,1);
stem(F, abs(DFD)/length(t));
%axis([-20 25 -.1 1]);

subplot(2,1,2);
stem(F, angle(DFD));