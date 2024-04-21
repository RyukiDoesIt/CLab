clear;
a = 0;
b = 1;
l = 1000;
h = (b - a)/l;
x = linspace(0, 1, l);
# f1 = @(x) sqrt(2)*sin(m*pi*x);
# f2 = @(x) sqrt(2)*sin(n*pi*x);
# f = @(x) 2*(sin(m*pi*x)*sin(n*pi*x));

for m = 1:3
    for n = 1:3
        f = @(x) 2*(sin(m*pi*x)*sin(n*pi*x));
        s1 = 0;
        s2 = 0;
        for i = 1:l/2 - 1
            s1 = s1 + f(x(2*i));
            s2 = s2 + f(x(2*i - 1));
        end
        s(m, n) = (h/3)*(f(a) + f(b) + 2*s1 + 4*s2);
        p(m, n) = round(s(m, n));
    end
end

printf(p);
