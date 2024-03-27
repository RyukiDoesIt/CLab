clear;
f=@(x) x.^2;
a=1;
b=4;
N=1000;
interval=(b-a)/N;
x=linspace(a,b,N+1);
area=0;
for i=1:N+1;
  area=area+interval*f(x(i));
end
printf('Area under the curve is: %d\n', area);
