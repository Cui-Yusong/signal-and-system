function yn = tone_vocoder(N, Freq_low, Freq_high, Freq_sample, Freq_filter, sample)
    % divide the frequency
    Freq_cochlea = cochlea(Freq_low, Freq_high, N);
    yn = 0:length(sample)-1;
    yn = yn * 0;

    for band_index = 1:N
        band = [Freq_cochlea(band_index) Freq_cochlea(band_index+1)]

        % Design band-pass filter at band i
        [b1, a1] = butter(2, band/(Freq_sample/2));
        
        % Do band-pass filtering at band i
        sample_band = filter(b1, a1, sample);
        sample_band = abs(sample_band);

        
        
        % freqz(b1, a1)
        % Do full-wave rectification
        % apply low-pass filtering to get the envelope at band i
        [b2, a2] = butter(4, Freq_filter/(Freq_sample/2), 'low');
        
        filtered_sample_band = filter(b2, a2, sample_band);

        envelope_plot = figure;
        subplot(2,1,1);
        plot(sample_band);
        title(sprintf('sample band: %d-%d lpf=%d', round(band(1)), round(band(2)), Freq_filter));
        xlabel('time');ylabel('Magnitude');
        subplot(2,1,2);
        plot(filtered_sample_band);
        title(sprintf('sample envelop: %d-%d lpf=%d', round(band(1)), round(band(2)), Freq_filter))
        xlabel('time');ylabel('Magnitude');
        saveas(envelope_plot, sprintf('plots/sample_envelop_%d-%d_lpf=%d.png', round(band(1)), round(band(2)), Freq_filter))


        figure1 = figure;
        sample_band_fft = fftshift(fft(sample_band));
        sample_band_fft_abs = abs(sample_band_fft);
        subplot(2, 1, 1);
        xn = linspace(-Freq_sample/2, Freq_sample/2, length(sample))
        plot(xn, sample_band_fft_abs);
        title(sprintf('sample band: %d-%d lpf=%d', round(band(1)), round(band(2)), Freq_filter))
        xlabel('Frequency(Hz)');ylabel('Magnitude');
        filtered_sample_band_fft = fftshift(fft(filtered_sample_band));
        filtered_sample_band_fft_abs = abs(filtered_sample_band_fft);
        subplot(2, 1, 2);
        plot(xn, filtered_sample_band_fft_abs);
        title(sprintf('filtered sample band: %d-%d lpf=%d', round(band(1)), round(band(2)), Freq_filter));
        xlabel('Frequency(Hz)');ylabel('Magnitude');
        saveas(figure1, sprintf('plots/sample_band_%d-%d_lpf=%d.png', round(band(1)), round(band(2)), Freq_filter));
        close;

        % freqz(a2, b2);
        % Generate a sinewave, whose frequency equals to the center frequency of the i-th bandpass filter
        fm = (band(1)+band(2))/2;
        xn = 0:length(sample)-1;
        sin_wave = sin(2*pi*fm*xn/Freq_sample);
        
        % Multiply the envelope signal and sinewave
        product = sin_wave .* filtered_sample_band;
        product = product / norm(product)*norm(sample)
        yn = yn + product;
       
    end

    yn = yn/norm(yn)*norm(sample);
    yn = yn.';

   