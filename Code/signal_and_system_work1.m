N=12;
M=[4 5 7 10];
T=0:1:23;

subplot(2,2,1);stem(T,sin(2*pi*M(1)*T/N),'-o'); xlabel('n');ylabel('Xm[n]');title('Xm[n]...M=4'); %�H�U���C�@��K�O�@�ӹϧ�
subplot(2,2,2);stem(T,sin(2*pi*M(2)*T/N),'-o'); xlabel('n');ylabel('Xm[n]');title('Xm[n]...M=5');
subplot(2,2,3);stem(T,sin(2*pi*M(3)*T/N),'-o'); xlabel('n');ylabel('Xm[n]');title('Xm[n]...M=7');
subplot(2,2,4);stem(T,sin(2*pi*M(4)*T/N),'-o'); xlabel('n');ylabel('Xm[n]');title('Xm[n]...M=10');