% 2021-8-20 luke
% music_7 信号与系统音乐合成大作业练习7
% 从realwave得到wave2proc
clear all
close all
clc

fs = 8000;

load("Guitar.mat");
sound(realwave,fs);pause(1);
sound(wave2proc,fs);


n = length(realwave); % 序列长度
t = linspace(1/fs,n/fs,n);

% 绘制realwave波形
figure(1);
subplot(3,1,1);
plot(t,realwave);
title("realwave");
set(gca,'FontSize',17);
xlabel('t/s');

% 绘制wave2proc波形
subplot(3,1,2);
plot(t,wave2proc);
title("wave2proc");
set(gca,'FontSize',17);
xlabel('t/s');

% 用自己的方法得到mywave2proc
mean = zeros(1,n);
wave1 = resample(realwave,10,1); % 将抽样率变为原来的10倍
for i = 1:10 % 叠加
    mean = mean + wave1(1+(i-1)*n:i*n)'; % 这里不加转置维数会出错！
end
mean = mean./10; % 取平均
mywave2proc = [mean,mean,mean,mean,mean,mean,mean,mean,mean,mean]'; % 拼接
mywave2proc = resample(mywave2proc,1,10); % 恢复抽样率
sound(mywave2proc,fs);

% 绘制自己得到的wave2proc波形
subplot(3,1,3);
plot(t,mywave2proc);
title("mywave2proc");
set(gca,'FontSize',17);
xlabel('t/s');

% 绘制求差波形
figure(2);
subplot(2,1,1);
plot(t,mywave2proc - wave2proc);
title("mywave2proc - wave2proc");
set(gca,'FontSize',17);
xlabel('t/s');
