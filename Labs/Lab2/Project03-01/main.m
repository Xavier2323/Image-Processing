clear;
close all;

originalImage = imread('Fig0308(a)(fractured_spine).tif');

% Display the original image
imshow(originalImage);
title('Original Image');
saveas(gcf, 'originalImage.png');
close all;

% Convert the image to single precision
input = single(originalImage) / 255;

c = 1;

% Apply log transform
output = logTransform(input, c);
imshow(output);
title('Log Transform');
saveas(gcf, 'logTransform.png');
close all;

gamma_list = [0.2, 0.4, 0.5, 1, 2, 3, 5];

% Apply power law transform for each gamma value
for r = gamma_list
    output = powerlawTransform(input, c, r);
    figure;
    imshow(output);
    title(['Power Law Transform, r = ', num2str(r)]);
    saveas(gcf, ['powerlawTransform_r_', num2str(r), '.png']);
    close all;
end

