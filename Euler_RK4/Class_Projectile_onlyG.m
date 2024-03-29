clear;
h=1e-2;
N=1000;
x(1)=0;
y(1)=0;
u(1)=15*cos(pi/6);
v(1)=15*sin(pi/6);
t(1)=0;
g=10;

f1=@(t,x) 0; #du/dt=0
f2=@(t,u) u; #dx/dt=u
f3=@(t,y) -g; #dv/dt=-g
f4=@(t,v) v; #dy/dt=v

i=1;
while i<N
  k1=f1(t(i),x(i));
  k2=f1(t(i)+h/2,x(i)+h*k1/2);
  k3=f1(t(i)+h/2,x(i)+h*k2/2);
  k4=f1(t(i)+h,x(i)+k3);
  u(i+1)=u(i)+(h/6)*(k1+2*k2+2*k3+k4);
  
  k11=f2(t(i),u(i));
  k22=f2(t(i)+h/2,u(i)+h*k11/2); 
  k33=f2(t(i)+h/2,u(i)+h*k22/2); 
  k44=f2(t(i)+h,u(i)+h*k33);
  x(i+1)=x(i)+(h/6)*(k11+2*k22+2*k33+k44);
  
  l1=f3(t(i),y(i));  
  l2=f3(t(i)+h/2,y(i)+h*l1/2);  
  l3=f3(t(i)+h/2,y(i)+h*l2/2);  
  l4=f3(t(i)+h,y(i)+l3);
  v(i+1)=v(i)+(h/6)*(l1+2*l2+2*l3+l4);
  
  l11=f4(t(i),v(i));
  l22=f4(t(i)+h/2,v(i)+h*l11/2);
  l33=f4(t(i)+h/2,v(i)+h*l22/2);
  l44=f4(t(i)+h,v(i)+l33);
  y(i+1)=y(i)+(h/6)*(l11+2*l22+2*l33+l44);
  
  t(i+1)=t(i)+h;
  if y(i+1)<=0;
    break
  end
  i++;
end
plot(x,y,'Linewidth',1.5,'Color',[0.1 0.7 0.8]);
legend('Only G');
grid on;