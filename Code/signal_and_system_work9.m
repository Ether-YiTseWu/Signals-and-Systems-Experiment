clear;clc;

internal = 0.01; T=50; t = [0:internal:T-internal];  N= length(t);   w = -(pi/internal)+(0:N-1)*(2*pi/(N*internal));      %間隔設定，模擬範圍設定。本行的CODE對四題皆可用

x = [1 zeros(1,length(t)-1)];
X=fftshift(fft(x,N));
subplot(4,2,1); plot(t,x);    title('x [ n ] = δ [ n ]');xlabel('n');ylabel('x[n]'); axis([0 T 0 2]); grid;
subplot(4,2,2); plot(w,X);    title('Fourier transform of x[n]');xlabel('w');ylabel('X(e^jw)'); axis([-pi pi 0 2]); grid;    %第一題

x = [cos((2*pi/5)*t)];
X=fftshift(fft(x,N));
subplot(4,2,3); plot(t,x);    title('x [ n ] = cos ω_0 n');  xlabel('n');ylabel('x[n]'); axis([0 T -2 2]); grid;
subplot(4,2,4); plot(w,X);    title('Fourier transform of x[n]');  xlabel('w');ylabel('X(e^jw)'); axis([-pi pi -1000 2500]); grid; %第二題  

tt = [0:internal:31-internal];
x = [cos(0.3*tt) zeros(1,1900)]; 
X=fftshift(fft(x,N));
subplot(4,2,5); plot(t,x);    title('x [ n ] = cos [ 0.3 n ]( u [ n ] – u [ n – 31 ] )');  xlabel('n');ylabel('x[n]'); axis([0 T -2 2]); grid;
subplot(4,2,6); plot(w,X);    title('Fourier transform of x[n]');  xlabel('w');ylabel('X(e^jw)'); axis([-pi pi -200 1000]); grid; %第三題  

tt = [0:internal:31-internal];
x = [cos(20*tt) zeros(1,1900)]; 
X=fftshift(fft(x,N));
subplot(4,2,7); plot(t,x);    title('x [ n ] = cos [ 20 n ]( u [ n ] – u [ n – 31 ] )');  xlabel('n');ylabel('x[n]'); axis([0 T -2 2]); grid;
subplot(4,2,8); plot(w,X);    title('Fourier transform of x[n]');  xlabel('w');ylabel('X(e^jw)'); axis([-pi pi -6 6]); grid; %第四題  