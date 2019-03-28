close all
clear all

[y, fs]=audioread("../File_audio/Violin_tremolo_tenuto.wav");
dur=2;
y=y(1:fs*dur,1);

winsize = 2^12; %4096
binsize = fs/winsize;
ssize = (2^10) - 1;
h = hanning(ssize); %Per ottenere lo zeropadding

overlap = 4;
hopsize = winsize/overlap;    %Hopsize di 1/4

nwin = round(((dur*fs))/(hopsize)); %Arrotondameto intelligente

fatrescale = 1/sum(h);  %Rescale sulla finestra di hanning. 

raw_partials = [];      %da partial vogliamo estrarre tutte le freq, mag e k    

step = hopsize/fs;    %Convertiamo l'hopsize in durata.
t = [0:step:dur-step];  %Asse dei tempi.

threshold = -40;            %Soglia di isolamento dei picchi.
tolerance = 2^(1/24);     %Tolleranza di un quarto di tono.
for k = 1:nwin
 inizio = (k-1)*hopsize+1;
 fine = (inizio+ssize)-1;
 yf = y(inizio:fine);     %Segnale affettato.
 peaks = peak_frame(yf,fs,h,winsize,threshold);
    for n = 1:length(peaks)
      p = peaks(n);
      found = false;    % per segnare se ho trovato la parziale
        for m = 1:length(raw_partials)
          fhigh = p.freq * tolerance;
          flow = p.freq / tolerance;
              if ((raw_partials(m).freqs(end) >= flow) && (raw_partials(m).freqs(end) <= fhigh))
                idx = length(raw_partials(m).freqs)+1;
                raw_partials(m).freqs(idx) = p.freq;
                raw_partials(m).mags(idx) = p.mag;
                raw_partials(m).frames(idx) = k;
                found = true;
               endif
          end
         if !found
           idx = length(raw_partials)+1;
           raw_partials(idx).freqs = [p.freq];
           raw_partials(idx).mags = [p.mag];
           raw_partials(idx).frames = k;
           
           endif
      end
    
end
cooked_partials = [];

%trovare la discontinuità: prendere ciascuna parziale
%verificare che duri piu di n frame, se false viene scartata
%quando true registro la parziale in cooked_partials
%verificare la continuità dei frame 


%trovare algoritmo per separare
tol_dur = 3;      %3 frames di tolleranza durata, 69ms
for k = 1:length(raw_partials)
    rp = raw_partials(k);
    if length(rp.frames) <= tol_dur
      continue;
      endif
    
  end
%f = [0:binsize:fs-binsize]; %Asse delle frequenze.
% 
%
%yplot = my_freqs;              % make a copy of the data specifically for plotting
%yplot(yplot==0)=nan;  % replace 0 elements with NaN
%
%plot (t, yplot, "*", "markersize", 5);
%%
%%graphics_toolkit("gnuplot");
%%imagesc(t, flipud(yplot), [threshold, 0])
%
%%mesh(t, my_freqs(:,2), (my_mags-threshold))