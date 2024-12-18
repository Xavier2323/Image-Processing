function [output_f, H] = addMotionBlur(input_f, T, a, b)
    [M, N] = size(input_f);
    [U, V] = meshgrid((0:N-1) - floor(N/2), (0:M-1) - floor(M/2));

    % Compute the motion blur filter H
    W = pi * (U * a + V * b);
    H = (T ./ W) .* sin(W) .* exp(-1j * W);
    
    % Handle division by zero
    H(W == 0) = T;

    % Apply the motion blur filter
    output_f = input_f .* H;
end
