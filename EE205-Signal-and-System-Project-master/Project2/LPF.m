function output = LPF(input)
    % set ideal LPF and pass signal through it
    input_fft = fft(input);
    fft_LPF = [input_fft(1:2000), zeros(1, length(input_fft) - 4000), input_fft(length(input_fft) - 2000 + 1:length(input_fft))];
    output = ifft(fft_LPF);
end