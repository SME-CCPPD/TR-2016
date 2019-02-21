%Creazione della parte inferiore del "contenitore".
xlo = ([1 1.2 2 3 3.9 4.6 5.4 6]-1)/5;
ylo = [50 40 30 50 45 70 80 500];
plo = (polyfit(xlo, ylo, length(xlo)));
X = [xlo(1):0.01:xlo(end)];
Ylo = polyval(plo, X);

minylo = min(Ylo);
Ylo = Ylo-minylo;

%Creazione della parte superiore del "contenitore". 
xhi = xlo; %Per comodità usiamo le stesse x.
yhi = [50 150 400 550 650 700 650 500]-minylo;
phi = (polyfit(xhi, yhi, length(xhi)));
Yhi = polyval(phi, X);

maxyhi = max(Yhi);
Yhi = Yhi/maxyhi;
Ylo = Ylo/maxyhi;

plot (X, Ylo, X, Yhi)

%Stampa del file da leggere con Ruby, quindi utilizziamo la sua sintassi.
fh = fopen("tables.rb", "w");  %Generazione del file di Ruby e apertura in scrittura. 
fprintf (fh, "T = ["); %Inizio da stampare dell'array dopo il quale vanno scritti i valori.
for k=1:length(X)
fprintf (fh, "%.2f, ", X(k));
endfor
fprintf (fh, "]\n");   %Fine dell'array. 

fprintf (fh, "F = [");
for k=1:length(X)
fprintf (fh, "[%.2f, %.2f], ", Ylo(k), Yhi(k));
endfor
fprintf (fh, "]\n");
fclose (fh); 