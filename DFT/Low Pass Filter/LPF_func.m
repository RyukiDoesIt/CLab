function output = LPF_func(w, wc)
  if w <= wc
    output = 1;
  else
    output = 0;
  endif
endfunction