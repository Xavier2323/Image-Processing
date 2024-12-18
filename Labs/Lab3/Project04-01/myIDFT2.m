function output = myIDFT2(input)
    [M, N] = size(input);
    output = zeros(M, N);

    % using matrix multiplication
    x = 0:M - 1;
    y = 0:N - 1;
    W_row = exp(1i * 2 * pi * (x') * x / M);
    W_col = exp(1i * 2 * pi * (y') * y / N);
    output = W_row * input * W_col / (M * N);

    % for x = 1:M
    %     for y = 1:N
    %         sum = 0;
    %         for u = 1:M
    %             for v = 1:N
    %                 sum = sum + input(u, v) * exp(1i * 2 * pi * ((u - 1) * (x - 1) / M + (v - 1) * (y - 1) / N));
    %             end
    %         end
    %         output(x, y) = sum / (M * N);
    %     end
    % end
end