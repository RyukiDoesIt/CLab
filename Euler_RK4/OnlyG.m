projectile_motion=@(t,y,g)[y(3);y(4);0;-g];

RK4=@(f,tspan,y0,g,N)...
rk4_impl(f,tspan,y0,g,N);

function[t,y]=rk4_impl(f,tspan,y0,g,N)
h=(tspan(2)-tspan(1))/N;
t=linspace(tspan(1),tspan(2),N+1);
y=zeros(length(y0),N+1);
y(:,1)=y0;
  for i=1:N
    k1=h*f(t(i),y(:,i),g);
    k2=h*f(t(i)+h/2,y(:,i)+k1/2,g);
    k3=h*f(t(i)+h/2,y(:,i)+k2/2,g);
    k4=h*f(t(i)+h,y(:,i)+k3,g);
    y(:,i+1)=y(:,i)+(k1+2*k2+2*k3+k4)/6;
  end
end
g=9.81;

tspan=[0,10];
y0=[0;0;20;20];
N=1000;

[t,y]=RK4(projectile_motion,tspan,y0,g,N);

plot(y(1,:),y(2,:),'b-');
xlabel('x(m)');
ylabel('y(m)');
title('ProjectileMotionwithoutAirResistanceandWind');
gridon;
