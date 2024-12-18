function output = powerlawTransform(input, c, r)
    output = c * input .^ r;
    output = output / max(output(:));
end