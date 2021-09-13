% 2021-8-19 luke
% music_3 信号与系统音乐合成大作业练习3
% music_2 基础上升高/降低八度
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

% 拼接完整东方红乐曲（添加指数衰减包络，mode=1）
y54 = get_note(1,f5,fs,1);
y58 = get_note(0.5,f5,fs,1);
y68 = get_note(0.5,f6,fs,1);
y22 = get_note(2,f2,fs,1);
y14 = get_note(1,f1,fs,1);
y18 = get_note(0.5,f1,fs,1);
y6l8 = get_note(0.5,f6l,fs,1);

dfh = [y54,y58,y68,y22,y14,y18,y6l8,y22];
% sound(dfh,fs);pause(4);

% 最简单的方法将music_2中的音乐升高/降低一个八度:采用加倍/减半的抽样频率播放
fs2 = 2*fs; % 抽样频率加倍
fs3 = fs/2; % 抽样频率减半
sound(dfh,fs2);pause(2);
sound(dfh,fs3);pause(8);

% 使用resample函数改变抽样率,升高半个音阶
dfh2 = resample(dfh,100,106);
sound(dfh2,fs);
pause(2);

