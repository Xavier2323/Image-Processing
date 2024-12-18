clear;
close all;

% Read the image
input = imread("Fig0507(a)(ckt-board-orig).tif");

imshow(input);
title('Fig.5.7 (a)')
saveas(gcf, 'originalImage.png');
close all;

output = addGaussianNoise(input, 0, 20);
imshow(output);
title('Fig.5.7 (b)')
saveas(gcf, 'gaussianNoiseImage.png');
close all;

output = geometricMeanFilter(output, 3, 3);
imshow(output);
title('Fig.5.7 (d)')
saveas(gcf, 'geometricMeanFilterImage.png');
close all;

psnr = computePSNR(input, output);
disp(['PSNR: ', num2str(psnr), 'dB']);

output = addImpulseNoise(input, 0, 0.1);
imshow(output);
title('Fig.5.8 (a)')
saveas(gcf, 'PepperNoiseImage.png');
close all;

output = contraharmonicMeanFilter(output, 3, 3, 1.5);
imshow(output);
title('Fig.5.8 (c)')
saveas(gcf, 'contraharmonicMeanFilterImage(pepper).png');
close all;

psnr = computePSNR(input, output);
disp(['PSNR: ', num2str(psnr), 'dB']);

output = addImpulseNoise(input, 0.1, 0);
imshow(output);
title('Fig.5.8 (b)')
saveas(gcf, 'SaltNoiseImage.png');
close all;

output = contraharmonicMeanFilter(output, 3, 3, -1);
imshow(output);
title('Fig.5.8 (d)')
saveas(gcf, 'contraharmonicMeanFilterImage(salt).png');
close all;

psnr = computePSNR(input, output);
disp(['PSNR: ', num2str(psnr), 'dB']);

output = addImpulseNoise(input, 0.1, 0.1);
imshow(output);
title('Fig.5.10 (a)')
saveas(gcf, 'SaltPepperNoiseImage.png');
close all;

output = medianFilter(output, 3, 3);
imshow(output);
title('Fig.5.10 (b)')
saveas(gcf, 'medianFilterImage.png');   
close all;

psnr = computePSNR(input, output);
disp(['PSNR: ', num2str(psnr), 'dB']);

output = addGaussianNoise(input, 0, 20);
output = addImpulseNoise(output, 0.1, 0.1);
imshow(output);
title('Fig.5.12 (b)')
saveas(gcf, 'GaussianSaltPepperNoiseImage.png');
close all;

output = alphaTrimmedMeanFilter(output, 5, 5, 6);
imshow(output);
title('Fig.5.12 (f)')
saveas(gcf, 'alphaTrimmedMeanFilterImage.png');
close all;

psnr = computePSNR(input, output);
disp(['PSNR: ', num2str(psnr), 'dB']);