function v = myconv(a, b)
   br = fliplr(b);
   v = zeros(1, length(a) + length(b) - 1);
   for k = 1 : length (a)
      temp = a * b(k);
      v(k:k+length(a)-1) .+= temp;
   endfor
   v;
endfunction
