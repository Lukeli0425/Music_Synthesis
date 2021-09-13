% 2021-8-19 luke
% music_4 信号与系统音乐合成大作业练习4
% music_2基础上添加谐波分量
clear all
close all
clc

fs = 8000; % 抽样频率

% F大调乐音频率
f1 = 349.23; % F
f2 = 392; % G
f3 = 440; % A
f4 = 466.16; % bB
f5 = 523.25; % C
f6 = 587.33; % D
f7 = 659.25; % E

f6l = 293.66; % 低八度的6，即C大调的D
% 拼接完整东方红乐曲（添加谐波分量，mode=2）
y54 = get_note(1,f5,fs,2);
y58 = get_note(0.5,f5,fs,2);
y68 = get_note(0.5,f6,fs,2);
y22 = get_note(2,f2,fs,2);
y14 = get_note(1,f1,fs,2);
y18 = get_note(0.5,f1,fs,2);
y6l8 = get_note(0.5,f6l,fs,2);

dfh = [y54,y58,y68,y22,y14,y18,y6l8,y22];
sound(dfh,fs);