clc; clear;

%-----------�N���X�ন�n���A�åB�z�Lsoundsc�N�n���o�X-----------------%
fs = 8000;                                              %�w�q�����W�v
keyNames='0905276106';                                  %�w�q�q�ܸ��X
xx = dtmfdial(keyNames,fs);                             %�ھڿ�J�����X�A�H�g�L��function�i��B�z�A��X�n���T��
soundsc(xx, fs)                                         %�o�X���q�ܸ��X���n��
%-------------------------------------------------------------------%



%-----------��T���i���o�i!!!�AL�Bcenter_freqs�Ҭ�dtmfdesign�һݥΨ쪺�Ѽ�-----------------%
L = 80;                                                 %�]�w�L�o�������׵���80
center_freqs = [697 770 852 941 1209 1336 1477 1633];   %�إ�DTMF�s�X��
hh = dtmfdesign(center_freqs,L,fs);                     %�ھ��n���T���A�H�g�L��function�i���o�i(COS����o�i��)�A�H�o�X�۹������W�v�X��
%-------------------------------------------------------------------------------------%



%-----------��T���i�����!!!-----------------%
[nstart,nstop] = dtmfcut(xx,fs);                        %�H�g�L��function�A����n���T�������Ң�ۢԭ��ա]find the DTMF tones within x[n]�^�C�@nstart����줧�Ң�ۢԭ��հ_�l�����ޡBnstop����줧�Ң�ۢԭ��ղפ���ޡCnstop��nstart�����Ң�ۢԭ��ժ�����
%--------------------------------------------%


%-----------�C�g�L�@���j��]���^�K�D�X����x�}�����@����������-----------------%
for kk =1:length(nstart)                                %�ݿ�J�����X���׬��h�֡A�j��N�p��X��
    x_seg = xx(nstart(kk):nstop(kk));                   %�N�n���T�����A�C��nstart���ި�nstop�����޶����n����T�A��ȵ��ܼ�x_seg
    for cf = 1:length(center_freqs)                     %��center_freqs���׬��h��(DTMF���X�ح�)�A�j��N�p��X��
      sc(cf,kk) = dtmfscore(x_seg,hh(:,cf));            %�H�g�L��function�A��Xscore�A�ý�ȵ�sc������kk�C�A��cf��
      %�]This function returns a score based on the max amplitude of the filtered output.�@sc = 1 if max(|y[n]|) is greater than, or equal to, 0.71,sc = 0 if max(|y[n]|) is less than 0.71�^
    end
end
%-------------------------------------------------------------------------------------%



dtmf.keys = ['1','2','3','A';
             '4','5','6','B';
             '7','8','9','C';
             '*','0','#','D'];                          %�إ߹q�ܸ��X�}�C
keyname2 = [] ;                                         %�ŧi�}�Ckeyname2�A�U�Ӱj��|�Ψ�



%----------�C�g�L�@���j��K�ѽX�X�@�ӼƦror�Ÿ�-----------%
for q=1:length(keyNames);                               %�ݿ�J�����X���׬��h�֡A�j��N�p��X��
    scx = find(sc(1:4,q)~=0);                           %�H�۰j������ȡA�j�M����x�}�Ģ���B�Ĥ@��ĥ|�C���A�����󢯪��Ȧb���C
    scy = find(sc(5:8,q)~=0);                           %�H�۰j������ȡA�j�M����x�}�Ģ���B�Ĥ���ĤK�C���A�����󢯪��Ȧb���C
    dtmf.keys(scx,scy);                                 %�ھ�scx�Bscy���j�M���G�Ψƥ��إߪ��q�ܸ��X�}�C�A��X�۹������Ʀror�Ÿ�
    keyname2 = [keyname2 dtmf.keys(scx,scy)];           %�N�ѽX�᪺�Ÿ���Jkeyname2��
end
%-------------------------------------------------------%



keyname2                                                %�L�Xkeyname2�}�C�������e