clear;
h=0.01;
N=20000;
k=1;
x(1)=-60;
y(1)=5;
u(1)=0.5;
v(1)=0;
t(1)=0;

f1=@(x,t) k*x/((x^2+y^2)^1.5);
f2=@(x,t) k*y/((x^2+y^2)^1.5);

i=1;
while i<N
  
  k1=f1(x(i),y(i));
  k2=f1(x(i)+h*k1/2,y(i)+h*k1/2);
  k3=f1(x(i)+h*k2/2,y(i)+h*k2/2);
  k4=f1(x(i)+h*k3,y(i)+h*k3);
  u(i+1)=u(i)+(h/6)*(k1+2*k2+2*k3+k4);
  x(i+1)=x(i)+h*u(i);
  
  k11=f2(x(i),y(i));
  k22=f2(x(i)+h*k11/2,y(i)+h*k11/2);
  k33=f2(x(i)+h*k22/2,y(i)+h*k22/2);
  k44=f2(x(i)+h*k33,y(i)+h*k33);
  v(i+1)=v(i)+(h/6)*(k11+2*k22+2*k33+k44);
  y(i+1)=y(i)+h*v(i);
  
  t(i+1)=t(i)+h;
  i++;
end

x1=[0];
y1=[0];
plot(x,y);
xlim([-60 30]);
ylim([-2.5 30]);
hold on;
plot(x1,y1,'Markersize',40)
