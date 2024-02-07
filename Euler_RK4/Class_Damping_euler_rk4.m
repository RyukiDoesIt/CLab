h=1e-2;
n=2000;
k=1;
b=0.5;

x=zeros(1,n);
u=ones(1,n);
t=zeros(1,n);

f=@(t,x) -k*x#-b*u-50*cos(5*t);
g=@(t,u) u;

i=1;
while i<n
  k1=f(t(i),x(i));
  l1=g(t(i),u(i));
  k2=f(t(i)+h/2,x(i)+h*k1/2);
  l2=g(t(i)+h/2,u(i)+h*l1/2);
  k3=f(t(i)+h/2,x(i)+h*k2/2);
  l3=g(t(i)+h/2,u(i)+h*l2/2);
  k4=f(t(i)+h,x(i)+k3);
  l4=g(t(i)+h,u(i)+l3);
  
  u(i+1)=u(i)+(h/6)*(k1+2*k2+2*k3+k4);
  x(i+1)=x(i)+(h/6)*(l1+2*l2+2*l3+l4);
  t(i+1)=t(i)+h;
  i++;
end

#plot(t,x);
#hold on;
plot(x,u);
xlabel('time')
ylabel('x value')    