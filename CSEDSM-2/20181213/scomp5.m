[y, fc] = audioread("test.wav");
wsize = 8000; %window size
y=y(1:wsize)';%y:primi 8000 campioni,invertiti

passo= 1/fc;
dur=length(y)*passo;
t=[0:passo:dur-passo];
y = 0.5*cos(440*2*pi*t(1:wsize));
binsize= 10; %passo di campionamento delle frequenze
F=[0:binsize:fc-binsize];



win = [0 : wsize-1];
H = -0.5*cos(((2*pi)/wsize)*win)+0.5;   %finestra di hanning
hh = hanning(wsize)';

figure (1);
subplot (2, 1, 1)
plot (win, H)
subplot (2, 1, 2)
plot (win, hh)
figure (2)

yh = y.*hh;    #segnale finestrato
plot (t, yh)
figure (3)


DFD= zeros (1, length(F)); %array di una riga, lenght di f colonne
dfdh = zeros (1, length(F));

for(k=1 : length(F))
fanal= F(k);
wanal=2*pi*fanal;
yanal=e.^(-i*wanal*t);
yr=y.*yanal;
yrh = yh.*yanal;
DFD(k)= sum(yr);
dfdh (k) = sum (yrh);
end

#fattore di normalizzazione
bfact = (wsize / sum(ones(1, wsize)))/wsize;       #scalare di finestra rettangolare
hfact = (wsize/sum(hh))/wsize;                     #scalare finestra hanning

plot(F,20*log10(2* abs(DFD)*bfact), F, 20*log10(2* abs(dfdh)*hfact));
axis([250 1000 -200 0]);
