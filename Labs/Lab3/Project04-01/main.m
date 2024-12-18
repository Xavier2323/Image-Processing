clear;
close all;

imput = imread("Fig0431(d)(blown_ic_crop).tif");
input = im2single(imput);

[M, N] = size(input);

% print the size of the image
fprintf('The size of the image is %d x %d\n', M, N);

% resize the image to 256x256
input = imresize(input, [256, 256]);

[M, N] = size(input);

% print the size of the image
fprintf('(After resizing)The size of the image is %d x %d\n', M, N);

imshow(input);
title('(a)');
saveas(gcf, 'originalImage.png');
close all;

% padding
input = padarray(input, [M N], 0, 'post');
imshow(input);
title('(b)');
saveas(gcf, 'paddedImage.png');
close all;

[M, N] = size(input);

% Multiply the image by (-1)^(x+y)
for x = 1:M
    for y = 1:N
        input(x, y) = input(x, y) * (-1)^(x+y);
    end
end

imshow(input);
title('(c)');
saveas(gcf, 'multipliedImage.png');

% Compute the 2D DFT of the image
% output = myDFT2(input);
output = myFFT2(input);

% log transform
output_log = log(1 + output);

% normalize the image
output_max = max(output_log(:));

imshow(output_log / output_max);
title('(d)');
saveas(gcf, 'SpectrumImage.png');
close all;

% Multiply the result by a low pass filter
D0 = 10;
filter = myGLPF(D0, M, N);
output = output .* filter;

imshow(filter);
title('(e)');
saveas(gcf, 'filteredImage.png');
close all;

% Spectrum
% log transform
output_log = log(1 + abs(output));

% normalize the image
output_max = max(output_log(:));

imshow(output_log / output_max);
title('(f)');
saveas(gcf, 'spectrum.png');
close all;

% Compute the inverse 2D DFT of the image
% output = myIDFT2(output);
output = myIFFT2(output);

% Multiply the image by (-1)^(x+y)
for x = 1:M
    for y = 1:N
        output(x, y) = real(output(x, y) * (-1)^(x+y));
    end
end

imshow(output);
title('(g)');
saveas(gcf, 'inverseImage.png');
close all;

% Crop the image
output = output(1:M/2, 1:N/2);

imshow(output);
title('(h)');
saveas(gcf, 'croppedImage.png');
close all;
