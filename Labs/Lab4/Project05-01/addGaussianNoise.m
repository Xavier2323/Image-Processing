function output_s = addGaussianNoise(input_s, mu, sigma)
    noise = sigma * randn(size(input_s)) + mu;
    output_s = double(input_s) + noise;
    output_s = uint8(255 * mat2gray(output_s));
end
    