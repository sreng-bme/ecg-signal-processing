%ECG Signal Processing - MIT-BIH Record 100
%Loads real PhysioNet ECG data, filters noise, detects R-peaks
%and estimates heart rate

%Load Raw ECG Data
fid = fopen('/MATLAB Drive/100.dat', 'rb');
raw = fread(fid, 'int16');
fclose(fid);
%Convert raw integers to millivolts (MIT-BIH record 100 specs)
Fs = 360;                       % Sampling Frequency (HZ)
ecg_signal = (raw - 1024) / 200; %apply gain and baseline correction
t = (0:length(ecg_signal)-1) / Fs; % create time axis in seconds
% Trim to First 10 seconds
idx = t <= 10;
t = t(idx);
ecg_signal = ecg_signal(idx);
%Force column vectors to avoids dimension errors
t = t(:);
ecg_signal = ecg_signal(:);
% Add Noise and Filter
noise = 0.3*randn(size(t));    %simulate measurement noise
noisy_ecg = ecg_signal + noise;
filtered_ecg = movmean(noisy_ecg, 15); %smooth with moving average filter
%Force column vectors
noisy_ecg = noisy_ecg(:);
filtered_ecg = filtered_ecg(:);
%Plot Signals
figure
plot(t, ecg_signal, 'b', 'LineWidth', 2)
hold on
plot(t, noisy_ecg, 'r')
plot(t, filtered_ecg, 'g', 'LineWidth', 2)
xlabel('Time (s)')
ylabel('Amplitude (mV)')
title('ECG Signal Processing - MIT-BIH Record 100')
legend('Clean ECG', 'Noisy ECG', 'Filtered ECG')
%R-peak detection and heart rate estimation
%Detect Peaks on clean signal with minimum height and distance constraints
[pks, locs] = findpeaks(ecg_signal, 'MinPeakDistance', 150, 'MinPeakHeight', 50);
plot(t(locs),pks, 'ko', 'MarkerFaceColor','k')
%cCalculate heart rate from RR intervals
peak_times = t(locs);
intervals = diff(peak_times);
heart_rate = 60/mean(intervals);
fprintf('Estimated Heart Rate: %.2f bpm\n', heart_rate);