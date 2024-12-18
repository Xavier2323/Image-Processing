% D0 = 60
% % Compute the 2D DFT of the image
% output = fft2(input);

% % Multiply the result by a low pass filter
% D0 = 60;
% filter = myGLPF(D0, M, N);
% output = output .* filter;

% % Compute the 2D inverse DFT of the image
% output = ifft2(output);

% % Multiply the image by (-1)^(x+y)
% for x = 1:M
%     for y = 1:N
%         output(x, y) = output(x, y) * (-1)^(x+y);
%     end
% end

% % Back to the original size
% output = output(1:M / 2, 1:N / 2);

% % show the result
% imshow(output);
% title("(d)");
% saveas(gcf, "result_image(d).png");

% % D0 = 160
% % Compute the 2D DFT of the image
% output = fft2(input);

% % Multiply the result by a low pass filter
% D0 = 160;
% filter = myGLPF(D0, M, N);
% output = output .* filter;

% % Compute the 2D inverse DFT of the image
% output = ifft2(output);

% % Multiply the image by (-1)^(x+y)
% for x = 1:M
%     for y = 1:N
%         output(x, y) = output(x, y) * (-1)^(x+y);
%     end
% end

% % Back to the original size
% output = output(1:M / 2, 1:N / 2);

% % show the result
% imshow(output);
% title("(e)");
% saveas(gcf, "result_image(e).png");
% close all;

% % D0 = 460
% % Compute the 2D DFT of the image
% output = fft2(input);

% % Multiply the result by a low pass filter
% D0 = 460;
% filter = myGLPF(D0, M, N);
% output = output .* filter;

% % Compute the 2D inverse DFT of the image
% output = ifft2(output);

% % Multiply the image by (-1)^(x+y)
% for x = 1:M
%     for y = 1:N
%         output(x, y) = output(x, y) * (-1)^(x+y);
%     end
% end

% % Back to the original size
% output = output(1:M / 2, 1:N / 2);

% % show the result
% imshow(output);
% title("(f)");
% saveas(gcf, "result_image(f).png");
% close all;