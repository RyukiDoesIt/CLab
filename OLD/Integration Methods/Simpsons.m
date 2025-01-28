clear;
t0=clock();
a = 1;
b = 4;
N = 1000;
h = (b - a) / N;
x = a:h:b;
y = simp_f(x);
area = h/3 * (y(1) + y(end) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-2)));
printf("Area is %d\n", area);
t1=clock();
t=(t1-t0)(end);
printf("The time taken is %d s\n", t)
