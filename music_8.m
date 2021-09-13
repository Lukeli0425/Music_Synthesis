% 2021-8-20 luke
% music_8 信号与系统音乐合成大作业练习8
% wave2proc的频谱分析
clear all
close all
clc

fs = 8000;

load("Guitar.mat");

sound(wave2proc);
time = 100; % 重复次数
n = length(wave2proc); % 单个长度
L = n*time; % 重复后总长度
T = L/fs; % 积分时间长度
OMG = fs*2*pi; % 
t = linspace(-T/2,T/2-T/L,L);
w0 = linspace(0,fs,n)';
w = linspace(0,fs,L)';
wave = repmat(wave2proc,time,1); % 重复
f0 = fft(wave2proc)/fs; % 没重复FFT
f = fft(wave)/fs; % 重复后FFT

% 绘制wave2proc的波形
subplot(3,1,1);
plot(w0,wave2proc);
title("wave2proc");
xlabel('t/s'); 
set(gca,'FontSize',17);

% 绘制不重复的频谱
subplot(3,1,1);
plot(w0,abs(f0));
title("Spectrum of wave2proc without repetition");
xlabel('f/HZ'); 
set(gca,'FontSize',17);

% 绘制重复后的频谱
subplot(3,1,3);
plot(w,abs(f));
title("Spectrum of wave2proc with repetition");
xlabel('f/HZ');
set(gca,'FontSize',17);