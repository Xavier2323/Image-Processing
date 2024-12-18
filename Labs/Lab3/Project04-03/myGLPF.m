function output = myGLPF(D0, M, N)
    output = single(zeros(M, N));
    for u = 1:M
        for v = 1:N
            D = sqrt((u - M / 2)^2 + (v - N / 2)^2);
            output(u, v) = exp(-D^2 / (2 * D0^2));
        end
    end
end