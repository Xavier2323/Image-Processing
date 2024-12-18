function output = spatialFiltering(input, mask)
    % Get the size of the input image
    [M, N] = size(input);
    
    % Get the size of the mask
    [m, n] = size(mask);
    
    % Calculate the padding sizes
    paddingX = floor(m / 2);
    paddingY = floor(n / 2);
    
    % Pad the input image
    % paddedInput = padarray(input, [paddingX, paddingY], 'replicate', 'both');

    % padding with zeros
    paddedInput = padarray(input, [paddingX, paddingY], 0, 'both');
    
    % % padding with mirror reflection
    % paddedInput = padarray(input, [paddingX, paddingY], 'symmetric', 'both');
    % % padding with circular repetition
    % paddedInput = padarray(input, [paddingX, paddingY], 'circular', 'both');

    % Initialize the output image
    output = zeros(M, N, 'single');
    
    % Perform spatial filtering
    for i = 1:M
        for j = 1:N
            % Extract the region of interest
            roi = paddedInput(i:i + m - 1, j:j + n - 1);
            
            % Perform convolution
            output(i, j) = sum(roi(:) .* mask(:));
        end
    end
    
end