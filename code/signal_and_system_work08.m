clear;clc;

tau = 0.001; T=10; t = [0:tau:T-tau];
x = exp(-2*t);                                                                                         %設定時域輸入函數(講義)
X=fftshift(tau*fft(x)); N= T/tau;       
w = -(pi/tau)+(0:N-1)*(2*pi/(N*tau));
subplot(3,2,1); plot(w,real(X));    xlabel('w');ylabel('Real part of X(jw)'); axis([-5 5 0 1]); grid;  %講義範例

t1 = [-0.5:tau:0-tau];  t2 = [0:tau:1]; t3 = [1+tau:tau:2-tau];
x = [zeros(size(t1)) ones(size(t2)) zeros(size(t3))];                                                  %設定時域輸入函數(1)
T=2.5; TT=-0.5:tau:2-tau;
X=fftshift(tau*fft(x));  N= T/tau;
w = -(pi/tau)+(0:N-1)*(2*pi/(N*tau));
subplot(3,2,3); plot(TT,x); axis([-0.5 2 0 2]); title('x(t)=rect((t-0.5)/T1),T1=1');xlabel('t');ylabel('x(t)');
subplot(3,2,4); plot(w,abs(X));    title('Fourier transform of x(t)');xlabel('w');ylabel('abs part of rect'); axis([-40 40 0 1]);  grid;  %方波傅立葉轉換繪圖

xx0 = [-1:tau:0-tau];  xx1 = [0:tau:1-tau];  xx2 = [1:tau:2];   xx3 = [2+tau:tau:4-tau];
yy0 = zeros(size(xx0));yy1 = xx1;            yy2 = -xx2+2;      yy3 = zeros(size(xx3));          
x = [yy0 yy1 yy2 yy3];                                                                                 %設定時域輸入函數(2)
T=5;    TT = -1:tau:4-tau;
X=fftshift(tau*fft(x));  N= T/tau;
w = -(pi/tau)+(0:N-1)*(2*pi/(N*tau));
subplot(3,2,5); plot(TT,x); axis([-1 4 0 2]);   title('x(t)=tri((t-1)/T1),T1=1');xlabel('t');ylabel('x(t)');
subplot(3,2,6); plot(w,abs(X));    title('Fourier transform of x(t)');xlabel('w');ylabel('abs part of tri'); axis([-40 40 0 1]);   grid;  %三角波傅立葉轉換繪圖
