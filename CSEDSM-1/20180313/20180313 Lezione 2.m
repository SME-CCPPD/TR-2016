freqc = 1;
W = [0 : 0.001*(2*pi) : freqc*(2*pi)]; %tutte le frequenze
n = 1; %prova anche non con interi
H = (1 + e.^(-i*W*n))*0.5;

figure (1);
plot (W, abs(H));

figure (2);
plot (W, angle(H)); 

%gli zeri del filtro sono a frecq/n [Hz]. 
