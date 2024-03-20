clear;
logistics = @(x,r) r*x*(1-x);

r = 3.9;
x1 = 0.4;
y1 = 0.0001
N = 5000; # Number of iterations
x = zeros(1, N);
y = zeros(1, N);

for i = 2:N;
  x(1)=x1;
  x(i)=logistics(x(i-1), r);
  y(1)=y1;
  y(i)=logistics(y(i-1), r);
  #diff =
end

plot(x,'Linewidth', 1.5);
#hold on;
#plot(y,r, 'Linewidth', 1.5);
#plot(log(abs(x-y)), 'Linewidth', 1.5)
