function output = myFFT2(input)

    [M, N] = size(input);
    
    % Apply 1D FFT to each row
    for row = 1:M
        input(row, :) = myFFT1(input(row, :));
    end
    
    % Apply 1D FFT to each column
    for col = 1:N
        input(:, col) = myFFT1(input(:, col));
    end
    
    output = input;
end