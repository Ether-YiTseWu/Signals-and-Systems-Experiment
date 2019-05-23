clc; clear;

keys =   [ 64 64 65 67 67 65 64 63 62 60 60 62 63 63 62 62 67 67 60 60 62 63 63 62 60 60 58 58 58 65 ]; 
Fmax = 440 * (2 .^ ((max(keys)+7-49)/12));

Fs = 4000;                  %正確的取樣頻率
duration = 0.25; tt = (1/Fs): (1/Fs) : duration; 
x = [ ];

for kk = 1:length(keys) 
    keynum = keys(kk) + 7;
    freq = 440 * (2 .^ ((keynum-49)/12));
    x = [ x, cos( 2*pi*freq*tt) ]; 
end
% sound(x,Fs)

win = 0.2*Fs; 
Nfft = win;
subplot(2,1,1); spectrogram(x,win,0,Nfft,Fs,'yaxis'); 
title(Fmax);
axis xy; 
ylabel('FREQUENCY (Hz)'); 
xlabel('TIME (sec)');

%---------------------------------------------------------------------------------------------------------------%

Fs = 3400;                  %錯誤的取樣頻率
duration = 0.25; tt = (1/Fs): (1/Fs) : duration; 
x = [ ];
for kk = 1:length(keys) 
    keynum = keys(kk) + 7;
    freq = 440 * (2 .^ ((keynum-49)/12));
    x = [ x, cos( 2*pi*freq*tt) ]; 
end
sound(x,Fs)
win = 0.2*Fs; 
Nfft = win;
subplot(2,1,2); spectrogram(x,win,0,Nfft,Fs,'yaxis'); 
title(Fmax);
axis xy; 
ylabel('FREQUENCY (Hz)'); 
xlabel('TIME (sec)');