clear;
close all;

input = imread("Fig0441(a)(characters_test_pattern).tif");
input = im2single(input);

[M, N] = size(input);

% show the original image
imshow(input);
title("(a)");
saveas(gcf, "original_image.png");
close all;

% padding
input = padarray(input, [M N], 0, "post");

[M, N] = size(input);

% Multiply the image by (-1)^(x+y)
for x = 1:M
    for y = 1:N
        input(x, y) = input(x, y) * (-1)^(x+y);
    end
end

% D0 = 60
% Compute the 2D DFT of the image
output = fft2(input);
% output = fftshift(output);

% Multiply the result by a high pass filter
D0 = 60;
filter = myGHPF(D0, M, N);
output = output .* filter;

% Compute the 2D inverse DFT of the image
output = ifft2(output);
% output = ifftshift(output);

% Multiply the image by (-1)^(x+y)
for x = 1:M
    for y = 1:N
        output(x, y) = output(x, y) * (-1)^(x+y);
    end
end

% Back to the original size
output = output(1:M / 2, 1:N / 2);

% show the result
imshow(output);
title("(b)");
saveas(gcf, "result_image(b).png");
close all;

%D0 = 160
% Compute the 2D DFT of the image
output = fft2(input);
% output = fftshift(output);

% Multiply the result by a high pass filter
D0 = 160;
filter = myGHPF(D0, M, N);
output = output .* filter;

% Compute the 2D inverse DFT of the image
output = ifft2(output);
% output = ifftshift(output);

% Multiply the image by (-1)^(x+y)
for x = 1:M
    for y = 1:N
        output(x, y) = output(x, y) * (-1)^(x+y);
    end
end

% Back to the original size
output = output(1:M / 2, 1:N / 2);

% show the result
imshow(output);
title("(e)");
saveas(gcf, "result_image(e).png");
close all;