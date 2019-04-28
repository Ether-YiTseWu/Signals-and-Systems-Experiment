a = [1 -0.8]; b = [2 0 -1]; N = [pi/4 pi/2 3*pi/4 pi];
[ H omega ] = freqz ( b , a , N );
subplot(2,2,1);   stem( omega ,H );  title('freqz'); xlabel('omega');ylabel('H');    

t = [0:0.1:0.5];  x = cos(t);   %設定輸入
b1 = 3; a1=[1 0.3];             %設定方程式係數向量
y1 = lsim ( b1 , a1 , x , t );  %算出結果
subplot(2,2,3);   stem ( x, y1 );  title('H2');xlabel('cos(t)');ylabel('H2(s)'); 

b2 = [2 0]; a2=[1 0.8];
y2 = lsim ( b2 , a2 , x , t );
subplot(2,2,4);   stem ( x , y2 );  title('H3');xlabel('cos(t)');ylabel('H3(s)'); 