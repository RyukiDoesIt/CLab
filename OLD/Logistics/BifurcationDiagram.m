clear;
x(1)=0.4;
t=0.001;
interval=1:t:4;
p=0;
n=1000;
m=100;
for k=interval;
  p++;
  for i=1:n;
    x(i+1)=k*x(i)*(1-x(i));
  endfor
M(:,p)=x(end-(m+1):end);
end

plot(interval,M,'.k','MarkerSize',2);