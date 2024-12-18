function output = myDFT2(input)
    [M, N] = size(input);
    output = zeros(M, N);

    % using matrix multiplication
    u = 0:M - 1;
    v = 0:N - 1;
    W_row = exp(-1i * 2 * pi * (u') * u / M);
    W_col = exp(-1i * 2 * pi * (v') * v / N);
    output = W_row * input * W_col;

    % for u = 1:M
    %     for v = 1:N
    %         sum = 0;
    %         for x = 1:M
    %             for y = 1:N
    %                 sum = sum + input(x, y) * exp(-1i * 2 * pi * ((u - 1) * (x - 1) / M + (v - 1) * (y - 1) / N));
    %             end
    %         end
    %         output(u, v) = sum;
    %     end
    % end
end