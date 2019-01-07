clear all
close all

winsize=1000;
overlap=16;
hopsize=winsize/overlap;
rescale=2/overlap;
h=hamming(winsize)';
nwin=20;
out=zeros(nwin+1, hopsize*nwin+winsize);
x=[1:length(out)];

for k=1:nwin 
inizio=(k-1)*hopsize+1;
fine=(inizio+winsize)-1;
out(1,inizio:fine)=out(1,inizio:fine).+h;
out(k+1,inizio:fine)=h;
end

plot(x, out(2,:),x, out(3,:),x, out(4,:),x, out(5,:),x, out(1,:))

