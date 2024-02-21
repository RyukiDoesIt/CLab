delta_t = 0.01;
N = 16;
t = (0:N-1) * delta_t;

f = cos(25 * pi * t);

F = zeros(1, N);
for k = 1:N
    for n = 1:N
        F(k) = F(k) + f(n) * exp(-1i * 2 * pi * (k-1) * (n-1) / N);
    end
end

w = (0:N-1) * (2 * pi / (N * delta_t))

% Plot the magnitude of F(w)
% plot(w, abs(F));
% xlabel('Frequency (rad/s)');
% ylabel('|F(w)|');
% title('Magnitude of F(w)');