clear;

a2 = [3 4 1]; b2 = [1 0 5];
subplot(2,2,1); freqs(b2,a2);   %以freqs算出即可

W = linspace ( 0 , 3*pi );
H2 = freqs(b2,a2,W);
amp = abs(H2);
degree = angle(H2);

subplot(2,2,3); plot(W,amp);    xlabel('W'); ylabel('abs(H)'); axis([0 9 0 1]); %以abs運算之
subplot(2,2,4); stem(W,degree); xlabel('W'); ylabel('phase');                   %以angle運算之
