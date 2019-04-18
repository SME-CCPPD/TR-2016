function v = dfmconv(s, fcamp)
   fmin = 20;
   fmax = 20480;  %Per ottenere un valore intero come fattore per ottenere ampiezza progressiva.
   
   shalf = s * 10^(-6/20);
   invshalf = fliplr(shalf);
   invshalffilt = (invshalf(2:end) .- invshalf(1:end-1))/2;
   
   v = conv(shalf, invshalffilt, 'same');
endfunction
