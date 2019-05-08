xn=[1 1 zeros(1,30)]; x=0:1:31;
subplot(3,2,1); stem(x,xn); title('x[n]');xlabel('n');ylabel('x'); %畫原始訊號

a=1/32*fft(xn);        %求出係數ak
subplot(3,2,3); stem(x,a); title('The real part of ak');xlabel('k'); %畫實部

unreal=imag(a);
subplot(3,2,4); stem(x,unreal); title('The imiginary part of ak');xlabel('k'); %畫虛部

amp=abs(a);
subplot(3,2,5); stem(x,amp); title('The amplitude of ak');xlabel('k'); %絕對值求amplitude

angle=phase(a);
subplot(3,2,6); stem(x,angle); title('The angle of ak');xlabel('k'); %phase求相位