function resizedImage = resizeImage_replication(originalImage, scalingFactor)
    % Get the dimensions of the original image
    [height, width, channels] = size(originalImage);

    % Calculate the dimensions of the new image
    newHeight = round(height * scalingFactor);
    newWidth = round(width * scalingFactor);

    % Create a new image of the calculated dimensions
    resizedImage = zeros(newHeight, newWidth, channels, 'uint8');

    % Iterate over each pixel in the new image, doing nearest neighbor interpolation
    for x = 1:newHeight
        for y = 1:newWidth
            original_x = min(round((x - 1) * (double(height - 1) / (newHeight - 1))) + 1, height);
            original_y = min(round((y - 1) * (double(width - 1) / (newWidth - 1))) + 1, width);
            resizedImage(x, y, :) = originalImage(original_x, original_y, :);
        end
    end