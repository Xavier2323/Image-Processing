function output_f = wienerFiltering(input_f, H, K)
    % Compute the Wiener filter
    H_conj = conj(H);
    H_abs_sq = abs(H).^2;
    Wiener_filter = (H_conj ./ (H_abs_sq + K)); 

    % Apply the Wiener filter
    output_f = Wiener_filter .* input_f;
end
