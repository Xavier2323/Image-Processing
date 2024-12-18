function output = medianFilter(input, m, n)
    input = double(input);
    [M, N] = size(input);
    output = zeros(M, N);

    % Pad the image to handle borders
    pad_size_m = floor(m / 2);
    pad_size_n = floor(n / 2);
    padded_img = padarray(input, [pad_size_m, pad_size_n], 'replicate', 'both');
    
    % Apply the median filter
    for i = 1 : M
        for j = 1 : N
            % Extract the neighborhood
            neighborhood = padded_img(i : i + m - 1, j : j + n - 1);
            
            % Compute the median of the neighborhood
            output(i, j) = median(neighborhood(:));
        end
    end
    
    output = uint8(255 * mat2gray(output));
end
