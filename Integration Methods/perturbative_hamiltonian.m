clear;
m = 1;
n = 1;
a = 0;
b = 1;
lambda = 0.1;
N = 100000;
h = (b - a)/N;
x = linspace(0, 1, N);
tol = 1e-12;
s = [];
for m = 1:3;
    for n = 1:3;
        f = @(x) 2*lambda*x^2*(sin(m*pi*x)*sin(n*pi*x));
        y = 0;
        z = 0;
        for i = 1:N/2;
            y = y + f(x(2*i));
            z = z + f(x(2*i - 1));
        end
        s(m, n) = h/3*(f(a) + f(b) + 2*y + 4*z);
        if s(m, n) < tol
            s(m, n) = 0;
        end
    end
end