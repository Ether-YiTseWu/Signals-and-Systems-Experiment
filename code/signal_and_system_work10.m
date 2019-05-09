clear; clc;

T = 10;
t = 0:0.1:T-0.1; y = sin(2*pi/3*t);
subplot(2,2,1); plot(t,y); title('x ( t ) = sin ( 2£k/ 3 t ) , 0 ¡Ø t ¡Ø 10'); xlabel('t');   ylabel('x(t)');

T1 = 0.1; n = 0:T/T1; y = sin(2*pi/3*n*T1);
subplot(2,2,2); stem(n,y); title('T_1 = 0.1');  xlabel('n');   ylabel('x_1[n]'); axis([0 100 -1 1])% T = 0.1

T2 = 1; n = 0:T/T2; y = sin(2*pi/3*n*T2);
subplot(2,2,3); stem(n,y); title('T_2 = 1');  xlabel('n');   ylabel('x_2[n]');   axis([0 10 -1 1])% T = 1

T3 = 2; n = 0:T/T3; y = sin(2*pi/3*n*T3);
subplot(2,2,4); stem(n,y); title('T_3 = 2');  xlabel('n');   ylabel('x_3[n]');   % T = 2
