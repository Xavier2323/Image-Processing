function output_s = addSinNoise(input_s, A, u0, v0)
    [M, N] = size(input_s);
    [X, Y] = meshgrid(1:N, 1:M);
    noise = A * sin(2 * pi * (u0 * X / M + v0 * Y / N));
    output_s = input_s + noise;
    output_s = max(min(output_s, 1), 0);
end