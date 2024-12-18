function output = contraharmonicMeanFilter(input, m, n, Q)
    input = double(input);
    [M, N] = size(input);
    output = zeros(M, N);
    
    % Define the neighborhood size based on m and n
    m = floor(m / 2);
    n = floor(n / 2);
    
    for i = 1 : M
        for j = 1 : N
            % Define the neighborhood indices
            row_start = max(1, i - m);
            row_end = min(M, i + m);
            col_start = max(1, j - n);
            col_end = min(N, j + n);
            
            % Extract the neighborhood
            neighborhood = input(row_start:row_end, col_start:col_end);
            
            % Calculate the contraharmonic mean
            numerator = sum(sum(neighborhood .^ (Q + 1)));
            denominator = sum(sum(neighborhood .^ Q));
            
            % Handle division by zero if the denominator is zero
            if denominator == 0
                output(i, j) = 0; % or keep the original pixel value
            else
                output(i, j) = numerator / denominator;
            end
        end
    end

    output = uint8(255 * mat2gray(output));
end
