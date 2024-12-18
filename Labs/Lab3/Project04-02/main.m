clear;
close all;

input = imread("Fig0441(a)(characters_test_pattern).tif");
input = im2single(input);

[M, N] = size(input);

imshow(input);
title("Original Image");
saveas(gcf, "original_image.png");
close all;

image_mean = mean(input(:));

% padding
input = padarray(input, [M N], 0, "post");

[M, N] = size(input);

% Multiply the image by (-1)^(x+y)
for x = 1:M
    for y = 1:N
        input(x, y) = input(x, y) * (-1)^(x+y);
    end
end

imshow(input);
title("Multiplied Image");

% Compute the 2D DFT of the image
output = abs(fft2(input));

DC_mean = 4 * output(1 + M / 2, 1 + N / 2) / (M * N);

fprintf("The mean of the original image is %f\n", image_mean);
fprintf("The mean from the DC component is %f\n", DC_mean);

% log transform
output = log(1 + output);

% normalize the image
output_max = max(output(:));
output = output / output_max;

imshow(output);
title("Fourier Spectrum");
saveas(gcf, "fourier_spectrum.png");
close all;