function resizedImage = resizeImage_bilinear(originalImage, scalingFactor)
    % Get the size of the original image
    [height, width, channels] = size(originalImage);
    
    % Calculate the size of the new image
    newHeight = round(height * scalingFactor);
    newWidth = round(width * scalingFactor);
    
    % Initialize the resized image
    resizedImage = zeros(newHeight, newWidth, channels, 'like', originalImage);
    
    % Loop over each color channel (R, G, B) or single channel for grayscale
    for c = 1:channels
        for x = 1:newHeight
            for y = 1:newWidth
                % Get the new pixel coordinates back to the original image
                X = (x - 1) * (double(height - 1) / (newHeight - 1)) + 1;
                Y = (y - 1) * (double(width - 1) / (newWidth - 1)) + 1;
                
                % Get the surrounding pixel coordinates in the original image
                x1 = min(floor(X), height);
                x2 = min(ceil(X), height);
                y1 = min(floor(Y), width);
                y2 = min(ceil(Y), width);
                
                % Calculate the distances between the original and new pixel
                dx = X - x1;
                dy = Y - y1;
                
                % Perform bilinear interpolation
                pixelValue = (1 - dy) * (1 - dx) * double(originalImage(x1, y1, c)) + ...
                             dy * (1 - dx) * double(originalImage(x1, y2, c)) + ...
                             (1 - dy) * dx * double(originalImage(x2, y1, c)) + ...
                             dy * dx * double(originalImage(x2, y2, c));
                
                % Assign the interpolated value to the new image
                resizedImage(x, y, c) = uint8(pixelValue);
            end
        end
    end
end
