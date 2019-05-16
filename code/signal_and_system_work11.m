format compact 

keys =   [ 64 64 65 67 67 65 64 63 62 60 60 62 63 63 62 62 67 67 60 60 62 63 63 62 60 60 58 58 58 65 ]; 
Fs = 4000; duration = 0.25; tt = (1/Fs): (1/Fs) : duration; x = [ ];

for kk = 1:length(keys) 
    keynum = keys(kk) + 7;
    freq = 440 * (2 .^ ((keynum-49)/12));
    x = [ x, cos( 2*pi*freq*tt) ]; 
end

figure(1),  nfft = 200; 
noverlap = 0;  window=nfft; 
[B,F,T] = spectrogram(x,window,noverlap,nfft,Fs); imagesc(T,F,abs(B));
title(['PLAY A SCALE']); axis xy; ylabel('FREQUENCY (Hz)'); xlabel('TIME (sec)');
sound(x,Fs) 