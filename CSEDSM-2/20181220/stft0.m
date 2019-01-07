clear all
close all
[y, fs]=audioread("webern-op1-theme.wav");
dur=2;
y=y(1:fs*2,1);
winsize=2^12; %4096
binsize=fs/winsize;
overlap=4;
hopsize=winsize/overlap;
rescale=2/overlap;
h=hanning(winsize);
nwin=round(((dur*fs))/(hopsize));
my_stft=zeros(winsize, nwin);
step=hopsize/fs;
t=[0:step:dur-step];
f=[0:binsize:fs-binsize];

for k=1:nwin-(overlap-1) 
inizio=(k-1)*hopsize+1;
fine=(inizio+winsize)-1;
yh=y(inizio:fine).*h;%segnale finestrato
anal=fft(yh);%restituisce vettore di valori complessi
my_stft(:,k)=anal;
end

mesh(t,f,(abs(my_stft)*rescale*2)/winsize)%plot 3d
axis([t(1) t(end) 0 10000])

