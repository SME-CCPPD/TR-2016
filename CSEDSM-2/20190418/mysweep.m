function s = mysweep(dur, fcamp, fmin, fmax)
   sinc = 1/fcamp;
   t = [0:sinc:dur-sinc];
   
   s = chirp(t, fmin, t(end), fmax, 'quadratic');
endfunction
