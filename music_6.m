% 2021-8-20 luke
% music_6 信号与系统音乐合成大作业练习6
% 读入fmt.wav并播放
clear all
close all
clc

[fmt,fs] = audioread("fmt.wav");
sound(fmt,fs);