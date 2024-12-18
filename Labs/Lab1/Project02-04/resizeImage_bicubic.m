function resizedImage = resizeImage_bicubic(originalImage, scalingFactor)
    % Get the size of the original image
    [height, width, channels] = size(originalImage);
    
    % Calculate the size of the new image
    newHeight = round(height * scalingFactor);
    newWidth = round(width * scalingFactor);
    
    % Initialize the resized image
    resizedImage = zeros(newHeight, newWidth, channels, 'like', originalImage);
    
    % Bicubic interpolation function
    function w = cubicWeight(t)
        % Based on Wikipedia: https://en.wikipedia.org/wiki/Bicubic_interpolation
        a = -0.5;  % Common choice
        absT = abs(t);
        
        if absT <= 1
            w = (a + 2) * (absT^3) - (a + 3) * (absT^2) + 1;
        elseif absT <= 2
            w = a * (absT^3) - 5 * a * (absT^2) + 8 * a * absT - 4 * a;
        else
            w = 0;
        end
    end

    % Loop over each color channel (R, G, B) or single channel for grayscale
    for c = 1:channels
        for x = 1:newHeight
            for y = 1:newWidth
                % Get the new pixel coordinates back to the original image
                X = (x - 1) * (double(height - 1) / (newHeight - 1)) + 1;
                Y = (y - 1) * (double(width - 1) / (newWidth - 1)) + 1;

                % Get the surrounding pixel coordinates in the original image
                x1 = min(floor(X), height);
                y1 = min(floor(Y), width);
                
                % Calculate the distances between the original and new pixel
                dx = X - x1;
                dy = Y - y1;

                % Initialize the interpolated value
                pixelValue = 0;

                % Perform bicubic interpolation on 16 surrounding pixels
                for m = -1:2  % Loop over a 4x4 grid of pixels
                    for n = -1:2
                        % Get the pixel position in the original image
                        xm = min(max(x1 + m, 1), height);
                        yn = min(max(y1 + n, 1), width);
                        
                        % Calculate the cubic weights
                        wx = cubicWeight(m - dx);
                        wy = cubicWeight(n - dy);
                        
                        % Aggregate the weighted sum
                        pixelValue = pixelValue + double(originalImage(xm, yn, c)) * wx * wy;
                    end
                end
                
                % Assign the computed value to the resized image
                resizedImage(x, y, c) = uint8(min(max(pixelValue, 0), 255));
            end
        end
    end
end
