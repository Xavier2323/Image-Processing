clear;
close all;

% Read the image
input = imread("Fig0526(a)(original_DIP).tif");

imshow(input);
title('Fig.5.26 (a)')
saveas(gcf, 'originalImage.png');
close all;

input = im2single(input);
[M, N] = size(input);

u0 = M / 4 - 1;
v0 = N / 4 - 1;
output = addSinNoise(input, 0.5, u0, v0);

imshow(output);
title('Image with sinusoidal noise')
saveas(gcf, 'sinusoidalNoise.png');
close all;

% transform the image to the frequency domain
input_f = fftshift(fft2(input));
output_f = fftshift(fft2(output));

imshow(log(1 + abs(output_f)), []);
title('Fourier Spectrum of the image with sinusoidal noise')
saveas(gcf, 'fourierSpectrumSinusoidalNoise.png');
close all;

imshow(log(1 + abs(input_f)), []);
title('Fourier Spectrum of the original image')
saveas(gcf, 'fourierSpectrumOriginalImage.png');
close all;

% Apply the notch filter
D0 = 5;
[output_f, Notch] = notchFiltering(output_f, D0, u0, v0);

imshow(log(1 + abs(Notch)), []);
title('Notch filter')
saveas(gcf, 'notchFilter.png');
close all;

imshow(log(1 + abs(output_f)), []);
title('Fourier Spectrum of the image with sinusoidal noise after filtering')
saveas(gcf, 'fourierSpectrumSinusoidalNoiseAfterFiltering.png');
close all;

% Transform the image back to the spatial domain
output = real(ifft2(ifftshift(output_f)));

imshow(abs(output), []);
title('Image with sinusoidal noise after filtering')
saveas(gcf, 'sinusoidalNoiseAfterFiltering(spatialDomain).png');
close all;

% Compute the PSNR
psnr = computePSNR(input, output);
disp(['PSNR: ', num2str(psnr), 'dB']);


