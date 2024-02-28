clear;
delta_w=0.05;
N=256;

w=0:delta_w:(N-1)*delta_w;
wc=1;
f_t=zeros(1,N);
f_w=zeros(1,N);
omega0=2*pi/N;
t(1)=0;

for n=0:N-1;
  for k=0:N-1;
    f_t(n+1)=f_t(n+1)+LPF_func(w(k+1), wc)*exp(-i*k*omega0*n);
  endfor
  
  f_w(n+1)=LPF_func(w(n+1),wc);
  if n>0
    t(n+1)=t(n)+omega0*n/w(n+1);
  endif
end
plot(w, f_w);
hold on;
plot(t, f_t);