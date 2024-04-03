clear;
l=@(r,x) r*x*(1-x);

r=3.568759;
x0=0.5;
n=1000;
x_values=zeros(1,n);
x_values(1)=x0;

for i=2:n
  x_values(i)=l(r,x_values(i-1));
end

plot(x_values, "Linewidth", 1.5);
