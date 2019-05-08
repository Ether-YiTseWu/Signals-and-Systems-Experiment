clear;clc;

internal = 0.5; T=50; t = [0:internal:T-internal];  N= length(t);   w = [-pi:2*pi/99:pi];      %���j�]�w�A�����d��]�w�C���檺CODE��|�D�ҥi��

x = [1 zeros(1,length(t)-1)];
X=fftshift(abs(fft(x,N)));
subplot(4,2,1); stem(t,x);    title('x [ n ] = �_ [ n ]');xlabel('n');ylabel('x[n]'); axis([0 10 0 2]); grid;
subplot(4,2,2); plot(w,abs(X));    title('Fourier transform of x[n]');xlabel('w');ylabel('X(e^jw)'); axis([-pi pi 0 2]); grid;    %�Ĥ@�D

x = [cos((2*pi/5)*t)];
X=fftshift(abs(fft(x,N)));
subplot(4,2,3); stem(t,x);    title('x [ n ] = cos �s_0 n');  xlabel('n');ylabel('x[n]'); axis([0 T -1 1]); grid;
subplot(4,2,4); plot(w,X);    title('Fourier transform of x[n]');  xlabel('w');ylabel('X(e^jw)'); axis([-pi pi 0 60]); grid; %�ĤG�D  

tt = [0:internal:31-internal];
x = [cos(0.3*tt) zeros(1,38)]; 
X=fftshift( abs(fft(x,N)) );
subplot(4,2,5); stem(t,x);    title('x [ n ] = cos [ 0.3 n ]( u [ n ] �V u [ n �V 31 ] )');  xlabel('n');ylabel('x[n]'); axis([0 T -1 1]); grid;
subplot(4,2,6); plot(w,X);    title('Fourier transform of x[n]');  xlabel('w');ylabel('X(e^jw)'); axis([-pi pi 0 40]); grid; %�ĤT�D  

internal = 1;
tt = [0:internal:31-internal];
t = [0:internal:T-internal];
xxx = [cos(20*tt) zeros(1,19)]; 
X=fftshift(abs(fft(xxx,N)));
subplot(4,2,7); stem(t,xxx);    title('x [ n ] = cos [ 20 n ]( u [ n ] �V u [ n �V 31 ] )');  xlabel('n');ylabel('x[n]'); axis([0 40 -1 1]); grid;
subplot(4,2,8); plot(w,X);    title('Fourier transform of x[n]');  xlabel('w');ylabel('X(e^jw)'); axis([-4 4 0 20]); grid; %�ĥ|�D  