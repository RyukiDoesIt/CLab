clear all;
A = rand(10) + 1i * rand(10);
H = (A + A') / 2;
E = eig(H);

disp(H);
printf("Eigenvalues = %d\n", E);

plot(real(E), imag(E), 'bo');