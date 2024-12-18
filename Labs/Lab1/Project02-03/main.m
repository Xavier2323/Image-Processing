clear;
close all;

originalImage = imread('Fig0220(a)(chronometer 3692x2812  2pt25 inch 1250 dpi).tif');

% Display the original image
imshow(originalImage);
title('Original Image');
saveas(gcf, 'originalImage.png');
close all;

% Shrink the image by a factor of 10
resizedImage = resizeImage_replication(originalImage, 0.1);
imshow(resizedImage);
title('Shrink by 10 Image');
saveas(gcf, 'shrinkBy10Image.png');
close all;

% Zoom the image by a factor of 10(Back to original size)
resizedImage = resizeImage_replication(resizedImage, 10);
imshow(resizedImage);
title('Zoom by 10 Image');
saveas(gcf, 'zoomBy10Image.png');
close all;