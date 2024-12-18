clear;
close all;

originalImage = imread('Fig0308(a)(fractured_spine).tif');

% Display the original image
imshow(originalImage);
title('Original Image');
saveas(gcf, 'originalImage.png');
close all;

% Get the histogram of the original image
input = uint8(originalImage);
histVector = imageHist(input);

% Plot the histogram of the original image
figure;
bar(0:255, histVector);
title('Histogram of the Original Image');
saveas(gcf, 'histOriginalImage.png');
close all;

% Get the cumulative distribution function of the histogram
[output, T] = histEqualization(input);

% Plot transformation function
figure;
stairs(0:255, T);
title('Transformation Function');
saveas(gcf, 'transformationFunction.png');
close all;

% Plot the enhanced image
figure;
imshow(output);
title('Enhanced Image');
saveas(gcf, 'enhancedImage.png');
close all;

% Plot the histogram of the enhanced image
histVector = imageHist(output);
figure;
bar(0:255, histVector);
title('Histogram of the Enhanced Image');
saveas(gcf, 'histEnhancedImage.png');
close all;