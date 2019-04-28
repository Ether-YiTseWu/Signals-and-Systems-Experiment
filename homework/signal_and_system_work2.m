nx=-3:7;
x=[zeros(1,3) 2 0 1 -1 3 zeros(1,3)];
subplot(3,2,1);stem(nx,x);xlabel('n');ylabel('x[n]');title('stem(nx,x)');

y1=nx+2; %設定X軸，藉由變換X軸，響應不變的技巧來達成時間移位
subplot(3,2,3);stem(y1,x);xlabel('n');ylabel('y1[n]');title('y1[n]');

y2=nx-1;
subplot(3,2,4);stem(y2,x);xlabel('n');ylabel('y2[n]');title('y2[n]');

y3=-nx; %時間倒轉
subplot(3,2,5);stem(y3,x);xlabel('n');ylabel('y3[n]');title('y3[n]');

y4=-nx-2;
subplot(3,2,6);stem(y4,x);xlabel('n');ylabel('y4[n]');title('y4[n]');