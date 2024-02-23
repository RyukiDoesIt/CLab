delta_t=0.01;
N=16;
t=(0:N-1)*delta_t;

f=cos(25*pi*t);

F=zeros(1, N);
for k=1:N;
    for n=1:N;
        F(k) = F(k)+f(n)*exp(-1i*2*pi*(k)*(n)/N);
    endfor
endfor
w=(0:N-1)*(2*pi/(N*delta_t));

plot(w, abs(F));
xlabel('Frequency');
ylabel('|F(w)|');