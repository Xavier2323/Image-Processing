function output = myIFFT1(input)
    n = length(input);
    
    % Ensure the input length is a power of 2
    if mod(n, 2) ~= 0 && n ~= 1
        error('Input length must be a power of 2');
    end

    % Base case
    if n == 1
        output = input;
        return;
    end

    % Initialize the output array of size n
    output = zeros(1, n);

    % Split into even and odd indexed elements
    X_even = myIFFT1(input(1:2:end)); % IFFT of even-indexed elements
    X_odd = myIFFT1(input(2:2:end)); % IFFT of odd-indexed elements

    % Combine the results
    Wn = exp(2i * pi * (0:(n/2-1)) / n); % Twiddle factors 
    output(1:n/2) = X_even + Wn .* X_odd; % First half
    output(n/2+1:n) = X_even - Wn .* X_odd; % Second half

    % Normalize the result for IFFT
    output = output / 2;
end