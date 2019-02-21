close all
clear all

[y, fs]=audioread("webern-op1-theme.wav");
dur=2;
y=y(1:fs*2,1);

winsize = 2^12; %4096
binsize = fs/winsize;
ssize = (2^10) - 1;
h = hanning(ssize); %Per ottenere lo zeropadding

overlap = 4;
hopsize = winsize/overlap;    %Hopsize di 1/4

nwin = round(((dur*fs))/(hopsize)); %Arrotondameto intelligente

fatrescale = 1/sum(h);  %Rescale sulla finestra di hanning. 
my_freqs = zeros(winsize, nwin); %Matrice.
my_mags = zeros(winsize, nwin);

step = hopsize/fs;    %Convertiamo l'hopsize in durata.
t = [0:step:dur-step];  %Asse dei tempi.

threshold = -40;  %Soglia di isolamento dei picchi.

for k = 1:nwin
 inizio = (k-1)*hopsize+1;
 fine = (inizio+ssize)-1;
 yf = y(inizio:fine);     %Segnale affettato.
 [my_freqs(:,k), my_mags(:,k)] = peak_frame(yf,fs,h,winsize,threshold);
end

f = [0:binsize:fs-binsize]; %Asse delle frequenze.
 

plot (t, my_freqs, "+");