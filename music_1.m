% 2021-8-19 luke
% music_1 信号与系统音乐合成大作业练习1 
% 播放正弦乐音，拼接《东方红》片断
clear all
close all
clc

fs = 8000; % 抽样频率

% C大调乐音频率
fc = 261.63; % 中央C
fd = 293.66; % D
fe = 329.63; % E
ff = 349.23; % F
fg = 392; % G
fa = 440; % A
fb = 493.88; % B

% F大调乐音频率
f1 = 349.23; % F
f2 = 392; % G
f3 = 440; % A
f4 = 466.16; % bB
f5 = 523.25; % C
f6 = 587.33; % D
f7 = 659.25; % E

% f1h = 2*f1; % F
% f2h = 2*f2; % G
% f3h = 2*f3; % A
% f4h = 2*f4; % bB
% f5h = 2*f5; % C
% f6h = 2*f6; % D
% f7h = 2*f7; % E

f6l = fd; % 低八度的6，即C大调的D

%播放C大调乐音
sound(get_note(1,fc,fs,0),fs);pause(1);
sound(get_note(1,fd,fs,0),fs);pause(1);
sound(get_note(1,fe,fs,0),fs);pause(1);
sound(get_note(1,ff,fs,0),fs);pause(1);
sound(get_note(1,fg,fs,0),fs);pause(1);
sound(get_note(1,fa,fs,0),fs);pause(1);
sound(get_note(1,fb,fs,0),fs);pause(2);

%播放F大调乐音
sound(get_note(1,f1,fs,0),fs);pause(1);
sound(get_note(1,f2,fs,0),fs);pause(1);
sound(get_note(1,f3,fs,0),fs);pause(1);
sound(get_note(1,f4,fs,0),fs);pause(1);
sound(get_note(1,f5,fs,0),fs);pause(1);
sound(get_note(1,f6,fs,0),fs);pause(1);
sound(get_note(1,f7,fs,0),fs);pause(1);


% 拼接完整东方红乐曲（正弦乐音mode=0）
y54 = get_note(1,f5,fs,0);
y58 = get_note(0.5,f5,fs,0);
y68 = get_note(0.5,f6,fs,0);
y22 = get_note(2,f2,fs,0);
y14 = get_note(1,f1,fs,0);
y18 = get_note(0.5,f1,fs,0);
y6l8 = get_note(0.5,f6l,fs,0);

dfh = [y54,y58,y68,y22,y14,y18,y6l8,y22];
sound(dfh,fs);
