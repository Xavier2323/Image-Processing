function output = geometricMeanFilter(input, m, n)
    input = double(input);
    [M, N] = size(input);
    output = zeros(M, N);
    
    % Pad the image to handle borders
    pad_size_m = floor(m / 2);
    pad_size_n = floor(n / 2);
    padded_img = padarray(input, [pad_size_m, pad_size_n], 'replicate', 'both');
    
    % Apply the geometric mean filter
    for i = 1 : M
        for j = 1 : N
            % Extract the neighborhood
            neighborhood = padded_img(i : i + m - 1, j : j + n - 1);
            
            % Calculate the geometric mean
            neighborhood(neighborhood == 0) = 1; % Avoid log(0)
            geo_mean = exp(sum(log(neighborhood(:))) / numel(neighborhood));
            output(i, j) = geo_mean;
        end
    end
    
    output = uint8(255 * mat2gray(output));
end
