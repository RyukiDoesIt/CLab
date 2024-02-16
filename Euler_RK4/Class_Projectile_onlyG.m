clear;
h=1e-2;
N=1000;
x(1)=0;
y(1)=0;
u(1)=15*cos(pi/6);
v(1)=15*sin(pi/6);
t(1)=0;
g=10;

f=@(t,x) 0; #du/dt=0
r=@(t,u) u; #dx/dt=u
p=@(t,y) -g; #dv/dt=-g
q=@(t,v) v; #dy/dt=v

i=1;
while i<N
  k1=f(t(i),x(i));
  k2=f(t(i)+h/2,x(i)+h*k1/2);
  k3=f(t(i)+h/2,x(i)+h*k2/2);
  k4=f(t(i)+h,x(i)+k3);
  u(i+1)=u(i)+(h/6)*(k1+2*k2+2*k3+k4);
  
  k11=r(t(i),u(i));
  k22=r(t(i)+h/2,u(i)+h*k11/2); 
  k33=r(t(i)+h/2,u(i)+h*k22/2); 
  k44=r(t(i)+h,u(i)+h*k33);
  x(i+1)=x(i)+(h/6)*(k11+2*k22+2*k33+k44);
  
  l1=p(t(i),y(i));  
  l2=p(t(i)+h/2,y(i)+h*l1/2);  
  l3=p(t(i)+h/2,y(i)+h*l2/2);  
  l4=p(t(i)+h,y(i)+l3);
  v(i+1)=v(i)+(h/6)*(l1+2*l2+2*l3+l4);
  
  l11=q(t(i),v(i));
  l22=q(t(i)+h/2,v(i)+h*l11/2);
  l33=q(t(i)+h/2,v(i)+h*l22/2);
  l44=q(t(i)+h,v(i)+l33);
  y(i+1)=y(i)+(h/6)*(l11+2*l22+2*l33+l44);
  
  t(i+1)=t(i)+h;
  if y(i+1)<=0;
    break
  end
  i++;
end
plot(x,y,'Linewidth',1.5);