x=[1 2 3 4];    a1=[1 -0.8];     b1=2;    y1=filter(b1,a1,x)


x=[1 2 3 4];    a2=[1 -0.8];     b2=[0 2];    y2=filter(b2,a2,x)


nx=-10:10;  ny=-20:20;  
x2a1=[zeros(1,10) 1 1 1 1 1 1 zeros(1,5)];  x2a2=[zeros(1,11) 1 2 3 4 5 zeros(1,5)];                %設定x[n]、h[n]
subplot(2,3,1);    stem(nx,x2a1); title('x[n]'); xlabel('n'); ylabel('x[n]'); axis([-10,10,-1,6]);
subplot(2,3,2);    stem(nx,x2a2); title('h[n]'); xlabel('n'); ylabel('h[n]'); axis([-10,10,-1,6]);
y=conv(x2a1,x2a2); %迴旋和
subplot(2,3,3);    stem(ny,y);    title('y[n]=x[n]*h[n]'); xlabel('n'); ylabel('y[n]'); axis([-20,20,-1,20]);


nx=-10:10;  ny=-20:20;  
x2b1=[zeros(1,10) 1 1 1 1 1 zeros(1,6)];  x2b2=[zeros(1,10) 1.5^0 1.5^1 1.5^2 1.5^3 1.5^4 1.5^5 1.5^6 zeros(1,4)];  %設定x[n]、h[n]
subplot(2,3,4);    stem(nx,x2b1); title('x[n]'); xlabel('n'); ylabel('x[n]'); axis([-10,10,-1,3]);
subplot(2,3,5);    stem(nx,x2b2); title('h[n]'); xlabel('n'); ylabel('h[n]'); axis([-10,10,-1,15]);
y=conv(x2b1,x2b2); %迴旋和
subplot(2,3,6);    stem(ny,y);    title('y[n]=x[n]*h[n]'); xlabel('n'); ylabel('y[n]'); axis([-20,20,-1,30]);