clear;
h = 0.01;
x1(1) = 0;
x2(1) = 0;
y(1) = 0;
t(1) = 0;
f = @(t, x) cos(t);
i = 1;
while i < 1000;
  x1(i+1) = x1(i)+h*f(t(i), x1(i));
  
  k1 = h*f(t(i), x2(i));
  k2 = h*f(t(i)+h/2, x2(i)+k1/2);
  k3 = h*f(t(i)+h/2, x2(i)+k2/2);
  k4 = h*f(t(i)+h, x2(i)+k3);
  
  x2(i+1) = x2(i)+(h/6)*f(t(i), x2(i));
  t(i+1) = t(i)+h;
  
  i++;
endwhile
plot(t, x1);
hold on;
plot(t, x2);
xlabel('time');
ylabel('x(t)');