function quantizedImage = reduceIntensityLevel(originalImage, intensityLevel)
    % Check if the intensity level is within the range [2, 256]
    if intensityLevel < 2 || intensityLevel > 256
        error('Intensity level must be within the range [2, 256]');
    end

    % Convert the original image to double precision
    originalImage = double(originalImage);
    
    % Compute the scaling factor
    scalingFactor = 255 / (intensityLevel - 1);

    % Compute the step size for quantization
    stepSize = floor(256 / intensityLevel);
    
    quantizedImage = uint8(floor(originalImage / stepSize) * scalingFactor);
    end