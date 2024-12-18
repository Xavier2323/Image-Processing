clear;
close all;

originalImage = imread('Fig0338(a)(blurry_moon).tif');

% Convert the image to single precision
input = single(originalImage) / 255;

% Display the original image
imshow(input);
title('(a)');
saveas(gcf, 'originalImage.png');
close all;

% Define the Laplacian mask
laplacianMask = single([0, 1, 0; 1, -4, 1; 0, 1, 0]);

% Apply Laplacian filtering to the input image
[output, scaledLaplacian] = laplacianFiltering(input, laplacianMask, -1);
imshow(scaledLaplacian);
title('(b)');
saveas(gcf, 'scaledLaplacian.png');
close all;

% Display the output image
imshow(output);
title('(c)');
saveas(gcf, 'outputImage.png');
close all;

% Change the Laplacian mask
laplacianMask1 = single([1, 1, 1; 1, -8, 1; 1, 1, 1]);
[output, scaledLaplacian] = laplacianFiltering(input, laplacianMask1, -1);
imshow(output);
title('(d)');
saveas(gcf, 'outputImageVariant1.png');
close all;

% Change the size of Laplacian mask
laplacianMask2 = single([0, 0, 1, 0, 0; 0, 1, 2, 1, 0; 1, 2, -16, 2, 1; 0, 1, 2, 1, 0; 0, 0, 1, 0, 0]);
[output, scaledLaplacian] = laplacianFiltering(input, laplacianMask2, -1);
imshow(output);
title('(e)');
saveas(gcf, 'outputImageVariant2.png');
close all;

% Change the scaling factor
[output, scaledLaplacian] = laplacianFiltering(input, laplacianMask, -0.5);
imshow(output);
title('(f)');
saveas(gcf, 'outputImageVariant3.png');
close all;

% Change the scaling factor
[output, scaledLaplacian] = laplacianFiltering(input, laplacianMask, -2);
imshow(output);
title('(g)');
saveas(gcf, 'outputImageVariant4.png');
close all;

% Change the scaling factor
[output, scaledLaplacian] = laplacianFiltering(input, laplacianMask, -4);
imshow(output);
title('(h)');
saveas(gcf, 'outputImageVariant5.png');
close all;

% Change the size of Laplacian mask and scaling factor
[output, scaledLaplacian] = laplacianFiltering(input, laplacianMask2, -2);
imshow(output);
title('(i)');
saveas(gcf, 'outputImageVariant6.png');
close all;

% Change the size of Laplacian mask and scaling factor
[output, scaledLaplacian] = laplacianFiltering(input, laplacianMask2, -4);
imshow(output);
title('(j)');
saveas(gcf, 'outputImageVariant7.png');
close all;



% Sobel kernels for gradient computation
sobelX = [-1 0 1; -2 0 2; -1 0 1];
sobelY = [-1 -2 -1; 0 0 0; 1 2 1];

% Compute the gradient images
gradientX = spatialFiltering(input, sobelX);
gradientY = spatialFiltering(input, sobelY);

% Compute the magnitude of the gradient
gradientMagnitude = sqrt(gradientX .^ 2 + gradientY .^ 2);

% Display the gradient magnitude
imshow(gradientMagnitude);
title('Sobel Gradient Magnitude');
saveas(gcf, 'gradientMagnitude.png');
close all;