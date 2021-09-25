function Freq_cochlea = cochlea(Freq_low, Freq_high, N)
    % divide the band
    d1 = log10((Freq_low/165.4)+1) / 0.06;
    d2 = log10((Freq_high/165.4)+1) / 0.06;
    d = linspace(d1, d2, N+1);
    Freq_cochlea = 165.4*(10.^(0.06*d)-1);
end