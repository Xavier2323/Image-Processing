clear;
close all;

originalImage = imread('Fig0221(a)(ctskull-256).tif');

% disp(originalImage);

% Define the intensity levels as powers of 2
intensityLevels = [2, 4, 8, 16, 32, 64, 128, 256];

% Create a figure to display the results
figure;

% Loop over each intensity level, reduce the intensity, and display the result
for i = 1:length(intensityLevels)
    % Reduce intensity levels
    quantizedImage = reduceIntensityLevel(originalImage, intensityLevels(i));
    % Display the quantized image
    subplot(2, 4, i);
    imshow(quantizedImage);
    title(['Levels = ', num2str(intensityLevels(i))]);
end