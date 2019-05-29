clc; clear;

fs = 8000; %<--use this sampling rate in all functions
keyNames='0987654321#*ABCD';
xx = dtmfdial(keyNames,fs);
soundsc(xx, fs)
L = 80; 
%<--use your value of L
%dtmfdeco(xx,fs)

center_freqs = [697 770 852 941 1209 1336 1477 1633];

hh = dtmfdesign(center_freqs,L,fs);
[nstart,nstop] = dtmfcut(xx,fs);

for kk =1:length(nstart)
    x_seg = xx(nstart(kk):nstop(kk));
    for cf = 1:length(center_freqs)
      sc(cf,kk) = dtmfscore(x_seg,hh(:,cf));
    end
end
 dtmf.keys = ['1','2','3','A';
             '4','5','6','B';
             '7','8','9','C';
             '*','0','#','D'];
keyname2 = [] ;
for q=1:length(keyNames);
    scx = find(sc(1:4,q)~=0);
    scy = find(sc(5:8,q)~=0);
    dtmf.keys(scx,scy);
    keyname2 = [keyname2 dtmf.keys(scx,scy)];
end
keyname2