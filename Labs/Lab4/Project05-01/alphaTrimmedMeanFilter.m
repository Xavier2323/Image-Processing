function output = alphaTrimmedMeanFilter(input, m, n, d)
    input = double(input);
    [M, N] = size(input);
    output = zeros(M, N);
    
    % Pad the image to handle borders
    pad_size_m = floor(m / 2);
    pad_size_n = floor(n / 2);
    padded_img = padarray(input, [pad_size_m, pad_size_n], 'replicate', 'both');
    
    % Apply the alpha-trimmed mean filter
    for i = 1 : M
        for j = 1 : N
            % Extract the neighborhood
            neighborhood = padded_img(i : i + m - 1, j : j + n - 1);
            
            % Sort the neighborhood values
            sorted_values = sort(neighborhood(:));
            
            % Trim the lowest and highest d values
            trimmed_values = sorted_values((d + 1):(end - d));  % Exclude d smallest and d largest
            
            % Calculate the mean of the trimmed values
            output(i, j) = mean(trimmed_values);
        end
    end
    
    output = uint8(255 * mat2gray(output));
end
