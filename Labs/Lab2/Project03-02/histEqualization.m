function [output, T] = histEqualization(input)
    % Get the histogram of the input image
    histVector = imageHist(input);
    
    % Get the cumulative distribution function of the histogram
    cdf = cumsum(histVector); % cumsum is a great function
    
    % Normalize the cdf
    cdf = cdf / cdf(end);
    
    % Get the transformation function
    T = round(255 * cdf);
    T = uint8(T);

    % Apply the transformation function to the input image
    output = T(input + 1);
end