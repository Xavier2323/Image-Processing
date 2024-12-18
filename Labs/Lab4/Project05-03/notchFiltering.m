function [output_f, Notch] = notchFiltering(input_f, D0, u0, v0)
    [M, N] = size(input_f);
    [U, V] = meshgrid(1:N, 1:M);
    
    % Center the frequencies
    U = U - N / 2;
    V = V - M / 2;
    
    % Calculate distance for notch locations
    D1 = sqrt((U - u0).^2 + (V - v0).^2);
    D2 = sqrt((U + u0).^2 + (V + v0).^2);
    
    % Ideal notch reject filter
    Notch = ones(M, N);
    Notch(D1 <= D0) = 0;
    Notch(D2 <= D0) = 0;
    
    % Apply the notch filter
    output_f = input_f .* Notch;
end