function output = Receiver(received_signal, wc, dt)
    % define t
    t = (1:length(received_signal)) * dt;

    % Extract real and imangary part
    y_real = 2 * cos(2 * pi * wc * t) .* received_signal;
    y_imagnary = 2 * sin(2 * pi * wc * t) .* received_signal;

    % reconstruct the signal
    y_real_continous = LPF(y_real);
    y_imagnary_continous = LPF(y_imagnary);

    % Merge two signal.
    y_reconstructed = 2*y_real_continous + 2i*y_imagnary_continous
end