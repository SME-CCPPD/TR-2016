%Funzione che ritorna due array per righe, uno con frequenze l'altro con magnitudine.

function [freqs, mags] = peak_frame (sig, fcamp, window, fftsize, threshold)
 
 fatrescale = 1/sum(window);  %Rescale sulla finestra di hanning. 
 zp = ceil((fftsize - length(window))/2);  %Arrotondameto per eccesso.
 sigh = sig.*window;     %Segnale finestrato.
 fftbuffer = zeros(fftsize, 1);
 fftbuffer (zp:zp+length(window)-1) = sigh;
 anal = fft(fftbuffer);   %Restituisce vettore di valori complessi.
 binsize = fcamp/fftsize;
 f = [0:binsize:fcamp-binsize]; %Asse delle frequenze.
 mag = 20*log10(abs(anal)*fatrescale);

 
 logic = (mag > threshold);  %Tutti i valori al di sotto di threshold sono posti in un vettore a 0.
 %I valori al di sopra di threshold li pongo a 1. 
 mag = ((mag - threshold) .* logic) + threshold; %Interpolo mag con logic.
 
 freqs = zeros(fftsize, 1); %Array per frequenze.
 mags = zeros(fftsize, 1);  %Array per magnitudini.

 for k = 1:(length(mag)/2-3) %Dal primo campione a nyquist meno 3 campioni.
   m3 = mag(k:k+2);
   [m, mindex] = max(m3);
   
   if mindex == 2
     [freal, magreal] = intparab(f(k:k+2), m3);
     freqs(k) = freal;
     mags(k) = magreal;
   endif
   
 endfor
 
endfunction
