t = [ 0 : 10 ];                          %�]�wX�b
x = [0 0 ones(1,9)] ;b = 1;a = [ 1  2 ]; %�]�w��J�T���Ψt�ΰѼ�
subplot(3,2,1); lsim ( b , a , x , t); 
subplot(3,2,2); step ( b , a , t);
subplot(3,2,3); impulse ( b , a  ,t);

x1=[1 1 1 1 1 zeros(1,6)];  h1=[1 -1 3 1 zeros(1,7)];  h2=[0 2 5 4 -1 zeros(1,6)]; %�]�w�U��Ƽ˻�
h12 = h1 + h2;
y1=conv(x1,h12)             %�j�۩M
y2=conv(x1,h1)+conv(x1,h2)  %�j�۩M
subplot(3,2,5); stem (y1); title('y1[n] = x1[n] * ( h1[n] + h2[n] )'); 
subplot(3,2,6); stem (y2); title('y2[n] = x1[n] * h1[n] + x1[n] * h2[n]'); 