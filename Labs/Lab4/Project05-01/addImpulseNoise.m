function output_s = addImpulseNoise(input_s, Ps, Pp)
    prob = rand(size(input_s));
    output_s = input_s;

    output_s(prob <= Pp) = 0; % pepper
    output_s(prob >= 1 - Ps) = 255; % salt
end