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

% Transform the image to the frequency domain
input_f = fftshift(fft2(input));

[output_f, H] = addMotionBlur(input_f, 1, 0.1, 0.1);

% Transform the image back to the spatial domain
output = real(ifft2(ifftshift(output_f)));

imshow(output);
title('Fig.5.26 (b)')
saveas(gcf, 'motionBlurredImage.png');
close all;

% Compute the PSNR
psnr = computePSNR(input, output);
disp(['PSNR: ', num2str(psnr), ' dB']);

% Add noise to the image
output = imnoise(output, 'salt & pepper', 0.02);
imshow(output);
title('Motion Blurred Image with Noise')
saveas(gcf, 'motionBlurredImageWithNoise.png');
close all;

% Compute the PSNR
psnr = computePSNR(input, output);
disp(['PSNR: ', num2str(psnr), ' dB']);

input_f = fftshift(fft2(output));

K_values = [0.01, 0.05, 0.1];
for i = 1:length(K_values)
    K = K_values(i);
    output_f = wienerFiltering(input_f, H, K);
    
    % Transform the image back to the spatial domain
    output = real(ifft2(ifftshift(output_f)));
    
    imshow(output);
    title(['Wiener Filtered Image (K = ', num2str(K), ')'])
    saveas(gcf, ['wienerFilteredImage_K_', num2str(K), '.png']);
    close all;
    
    % Compute the PSNR
    psnr = computePSNR(input, output);
    disp(['PSNR (K = ', num2str(K), '): ', num2str(psnr), ' dB']);
end