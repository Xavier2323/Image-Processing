function output = myIFFT2(input)

    [M, N] = size(input);
    
    % Apply 1D IFFT to each row
    for row = 1:M
        input(row, :) = myIFFT1(input(row, :));
    end
    
    % Apply 1D IFFT to each column
    for col = 1:N
        input(:, col) = myIFFT1(input(:, col));
    end
    
    output = input;
end