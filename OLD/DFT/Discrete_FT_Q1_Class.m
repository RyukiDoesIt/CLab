clear;
f = @(t) cos(25*pi*t)+cos(18*pi*t);

delta_t = 0.01;
N = 160;
t = 0:delta_t:(N-1)*delta_t;
f_omega = zeros(1, N);
w0 = 2*pi/N;

for n=0:N-1
  for k=0:N-1
    f_omega(n+1) = f_omega(n+1) + f(t(k+1))*exp(-i*k*w0*n);
  endfor
  omega(n+1) = n*w0;
#  if (f_omega(n+1) > 0.01)
#    printf("omega = %d, f_omega = %d\n", omega(n+1), f_omega(n+1));
#  endif
endfor

stem(omega, f_omega);
