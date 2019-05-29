clc; clear;

%-----------將號碼轉成聲音，並且透過soundsc將聲音發出-----------------%
fs = 8000;                                              %定義取樣頻率
keyNames='0905276106';                                  %定義電話號碼
xx = dtmfdial(keyNames,fs);                             %根據輸入的號碼，以寫過的function進行處理，算出聲音訊號
soundsc(xx, fs)                                         %發出此電話號碼的聲音
%-------------------------------------------------------------------%



%-----------對訊號進行濾波!!!，L、center_freqs皆為dtmfdesign所需用到的參數-----------------%
L = 80;                                                 %設定過濾器的長度等於80
center_freqs = [697 770 852 941 1209 1336 1477 1633];   %建立DTMF編碼表
hh = dtmfdesign(center_freqs,L,fs);                     %根據聲音訊號，以寫過的function進行濾波(COS函數濾波器)，以濾出相對應的頻率出來
%-------------------------------------------------------------------------------------%



%-----------對訊號進行切割!!!-----------------%
[nstart,nstop] = dtmfcut(xx,fs);                        %以寫過的function，找到聲音訊號中的ＤＴＭＦ音調（find the DTMF tones within x[n]）。　nstart為找到之ＤＴＭＦ音調起始的索引、nstop為找到之ＤＴＭＦ音調終止的索引。nstop－nstart為此ＤＴＭＦ音調的長度
%--------------------------------------------%


%-----------每經過一次迴圈（ｋｋ）便求出ｓｃ矩陣中的一欄ｓｃｏｒｅ-----------------%
for kk =1:length(nstart)                                %看輸入的號碼長度為多少，迴圈就計算幾次
    x_seg = xx(nstart(kk):nstop(kk));                   %將聲音訊號中，每個nstart索引到nstop的索引間的聲音資訊，賦值給變數x_seg
    for cf = 1:length(center_freqs)                     %看center_freqs長度為多少(DTMF有幾種音)，迴圈就計算幾次
      sc(cf,kk) = dtmfscore(x_seg,hh(:,cf));            %以寫過的function，算出score，並賦值給sc中的第kk列，第cf行
      %（This function returns a score based on the max amplitude of the filtered output.　sc = 1 if max(|y[n]|) is greater than, or equal to, 0.71,sc = 0 if max(|y[n]|) is less than 0.71）
    end
end
%-------------------------------------------------------------------------------------%



dtmf.keys = ['1','2','3','A';
             '4','5','6','B';
             '7','8','9','C';
             '*','0','#','D'];                          %建立電話號碼陣列
keyname2 = [] ;                                         %宣告陣列keyname2，下個迴圈會用到



%----------每經過一次迴圈便解碼出一個數字or符號-----------%
for q=1:length(keyNames);                               %看輸入的號碼長度為多少，迴圈就計算幾次
    scx = find(sc(1:4,q)~=0);                           %隨著迴圈ｑ的值，搜尋ｓｃ矩陣第ｑ行、第一～第四列中，不等於０的值在哪列
    scy = find(sc(5:8,q)~=0);                           %隨著迴圈ｑ的值，搜尋ｓｃ矩陣第ｑ行、第五～第八列中，不等於０的值在哪列
    dtmf.keys(scx,scy);                                 %根據scx、scy的搜尋結果及事先建立的電話號碼陣列，找出相對應的數字or符號
    keyname2 = [keyname2 dtmf.keys(scx,scy)];           %將解碼後的符號填入keyname2中
end
%-------------------------------------------------------%



keyname2                                                %印出keyname2陣列中的內容