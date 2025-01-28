clear;
h = 0.01;
x1(1) = 0;
x2(1) = 0;
t(1) = 0;
f = @(t,x) t^2;
i = 1;
while i < 1000;
  #EULER
  x1(i+1) = x1(i)+h*f(t(i), x1(i));
  
  #RK4
  k1 = h*f(t(i), x2(i));
  k2 = h*f(t(i)+h/2, x2(i)+k1/2);
  k3 = h*f(t(i)+h/2, x2(i)+k2/2);
  k4 = h*f(t(i)+h, x2(i)+k3);
  
  x2(i+1) = x2(i)+(h/6)*f(t(i), x2(i));
  t(i+1) = t(i)+h;
  
  i++;
endwhile
m1=plot(t, x1);
hold on;
m2=plot(t, x2);
legend("EULER", "RK4");
xlabel('time');
ylabel('position');