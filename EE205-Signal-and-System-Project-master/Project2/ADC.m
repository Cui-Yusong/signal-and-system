function digital = ADC(analog, Sample_Length)
    % sample the signal.

    T_sample = round(length(analog)/Sample_Length);
    digital = 1:1:Sample_Length; 
    for n = 1:Sample_Length
        digital(n) = analog(T_sample*n);
    end
end