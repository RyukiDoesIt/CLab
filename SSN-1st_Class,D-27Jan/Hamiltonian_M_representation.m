clear all;
N = 100;
H = rand(N, N);
H = (H + H');

psi_0 = zeros(N, 1);
psi_0(N/2) = 1;

t = 10.0;

U = expm(-1i * H * t);
psi_t = U * psi_0;

disp("Time-evolved state |\psi(t)>:")
disp(psi_t);




%disp("Hamiltonian H:");
%disp(H);
%disp("Initial state |psi(t=0)>:");
%disp(psi_0);