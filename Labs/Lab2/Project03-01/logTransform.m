function output = logTransform(input, c)
    output = c * log(1 + input);
    output = output / max(output(:));
end