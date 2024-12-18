function psnr = computePSNR(input1_s, input2_s)
    input1_s = double(input1_s);
    input2_s = double(input2_s);
    mse = mean((input1_s(:) - input2_s(:)).^2);
    max_pixel_value = 1;
    if mse == 0
        psnr = Inf;
    else
        psnr = 10 * log10((max_pixel_value^2) / mse);
    end
end