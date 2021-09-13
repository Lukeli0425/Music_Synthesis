% 2021-8-19 luke
% music_5 信号与系统音乐合成大作业练习5
% 合成自选音乐：献给爱丽丝
clear all
close all
clc

fs = 8000; % 抽样频率

% C大调乐音频率
fc = 261.63; % 中央C
fd = 293.66; % D1
fe = 329.63; % E1
ff = 349.23; % F1
fg = 392; % G1
fa = 440; % A1
fb = 493.88; % B1

fch = 2*fc; % C2
fdh = 2*fd; % D2
feh = 2*fe; % E2
ffh = 2*ff; % F2
fgh = 2*fg; % G2
fah = 2*fa; % A2
fbh = 2*fb; % B2

fbeh = 622.25; % bE2
fbdh = 554.36; % bD2

% （模拟钢琴音色，mode=3）
yeh16 = get_note(0.5,feh,fs,3);
ybeh16 = get_note(0.5,fbeh,fs,3);
yb16 = get_note(0.5,fb,fs,3);
ybdh16 = get_note(0.5,fbdh,fs,3);
ych16 = get_note(0.5,fch,fs,3);
ych8 = get_note(1,fch,fs,3);
ya8 = get_note(1,fa,fs,3);
y016 = get_note(0.5,0,fs,3); % 空拍
yc16 = get_note(0.5,fc,fs,3);
ye16 = get_note(0.5,fe,fs,3);
ya16 = get_note(0.5,fa,fs,3);
yb16 = get_note(0.5,fb,fs,3);
ye16 = get_note(0.5,fe,fs,3);

m0 = [yeh16,ybeh16]; % 第零小节
m1 = [yeh16,ybeh16,yeh16,yb16,ybdh16,ych16]; % 第一小节
m2 = [ya8,y016,yc16,ye16,ya16]; % 第二小节
m3 = [yb16,y016,ye16,ya16,yb16]; % 第三小节
m4 = [ych8,y016,ye16,yeh16,ybeh16]; % 第四小节
alice = [m0,m1,m2,m3,m4];
sound(alice,fs);