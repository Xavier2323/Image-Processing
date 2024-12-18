clear;
close all;

originalImage = imread('Fig0220(a)(chronometer 3692x2812  2pt25 inch 1250 dpi).tif');

% Display the original image
imshow(originalImage);
title('Original Image');
saveas(gcf, 'originalImage.png');
close all;

% Shrink the image by a factor of 12.5
resizedImage = resizeImage_bilinear(originalImage, 0.08);
imshow(resizedImage);
title('Shrink by 12.5 Image');
saveas(gcf, 'shrinkBy12.5Image.png');
close all;

% Zoom the image by a factor of 12.5(Back to original size)
resizedImage = resizeImage_bilinear(resizedImage, 12.5);
imshow(resizedImage);
title('Zoom by 12.5 Image');
saveas(gcf, 'zoomBy12.5Image.png');
close all;