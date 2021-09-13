% 2021-8-19 luke
% music_2 信号与系统音乐合成大作业练习2 
% 给乐音添加包络消除杂声，拼接《东方红》片断
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
sound(dfh,fs);

l = length(y54);
t = linspace(1/fs,l/fs,l);
plot(t,y54); % 显示添加包络后的乐音波形
title('添加包络后的乐音波形');xlabel('t/s');
set(gca,'FontSize',17);