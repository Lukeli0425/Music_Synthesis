% 2021-8-20 luke
% music_9 信号与系统音乐合成大作业练习9
% 自动分析fmt.wav的音调和节拍 

clear all
close all
clc

fs = 8000;

% 读入fmt.wav
[fmt,fs] = audioread("fmt.wav");
% sound(fmt,fs);

n = length(fmt); % fmt序列长度
T = n/fs; % 时间长度
t = linspace(1/fs,n/fs,n);

% 绘制fmt原始波形
figure(1);
subplot(3,1,1);
plot(t,fmt);
title("fmt");
xlabel('t/s'); 
set(gca,'FontSize',17,'XLim',[0,T]);

% 半波整流
fmt_amp = linspace(0,0,n);
for i = 1:1:n
    fmt_amp(i) = fmt(i)^2;
end
% 绘制fmt_amp波形
subplot(3,1,2);
plot(t,fmt_amp);
title("fmt-amp");
xlabel('t/s'); 
set(gca,'FontSize',17,'XLim',[0,T]);

% 加窗平滑得包络
M = 400; % 窗长度
w = window(@kaiser,M)/M; % 窗函数作为滤波器冲级响应
fmt_env = conv(fmt_amp,w);% 这样写比用循环块
fmt_env = fmt_env(1:n); 

subplot(3,1,3);
plot(t,fmt_env);
title('fmt-env');
xlabel('t/s'); 
set(gca,'FontSize',17,'XLim',[0,T],'YLim',[0,0.05]);
hold on;

% 寻找乐音分界点
boundary = linspace(1,1,100); % 记录分界点的数组
j = 1;
r = 1000;
for i = r+1:1:n-r
    if fmt_env(i) == min(fmt_env(i-r:i+r)) && (fmt_env(i+700)+fmt_env(i-700)-2*fmt_env(i))>6e-4
        j = j+1;
        plot([i/fs,i/fs],[0,0.1],'-r');
        boundary(j) = i + 50;
    end
end
boundary(j+1) = n;
boundary = boundary(1:j+1);
note_num = j; % 乐音个数
% 寻找基频
time = 1000; % 重复次数
range = 10*time;
base_f_real = linspace(0,0,j); % 每个音的实测基频频率
base_f = linspace(0,0,j); % 每个音的基理论频频率

for i = 1:1:note_num % 遍历所有乐音
    note = fmt(boundary(i):boundary(i+1));
    note_env = fmt_env(boundary(i):boundary(i+1));
    n = length(note); % 重复前序列长度
    T = n/fs; % 重复前时长
    L = n*time; % 重复后序列长度
%   sound(note,fs);
    
    wave = repmat(note,time,1); % 重复
    f = fft(wave)/fs; % 重复后FFT
    f = abs(f);
    f_plot = linspace(-10,-10,L);
    f_poss = [];
    f_poss_amp = [];
    top = max(f);
    poss_num = 0;
    for j = range+1:1:L-range
        if f(j)>top*0.05 && f(j)==max(f(j-range:j+range))  && judge_note(j*8000/L)>0 % 选频率峰
            f_plot(j) = f(j);
            f_poss = [f_poss,judge_note(j*8000/L)]; 
            f_poss_amp = [f_poss_amp,f(j)]; 
        end     
    end

    for j = 1:1:length(f_poss)
        m = is_member(2*f_poss(j),f_poss) + is_member(3*f_poss(j),f_poss);
        m = m + is_member(4*f_poss(j),f_poss);
        if (f_poss_amp(j)>top*0.75 && m>1)||(m>2 && f_poss_amp(j)>top*0.4)
            base_f(i) = f_poss(j);
            break;
        end
    end
    
    if i>0 % 画图
        sound(note,fs);
         % 绘制原始乐音波形
        t = linspace(1/fs,n/fs,n)';
        figure(i+1);
        subplot(3,1,1);
        plot(t,note);
        title("Note "+int2str(i));
        xlabel('t/s'); 

        set(gca,'FontSize',17,'XLim',[0,T]);
        % 绘制乐音包络
        w = linspace(fs/L,fs,L)';
        subplot(3,1,2);
        plot(t,note_env);
        title("Envelope of Note "+int2str(i));
        xlabel('t/s'); 
        set(gca,'FontSize',17);

        % 绘制乐音频谱（重复后）
        w = linspace(fs/L,fs,L)';
        subplot(3,1,3);
        plot(w,f,w,f_plot,'o','LineWidth',1.4,'MarkerEdgeColor','red','MarkerSize',11);
        title("Spectrum of Note "+int2str(i)+ " f="+num2str(base_f(i))+"Hz");
        xlabel('f/Hz'); 
        set(gca,'FontSize',17,'XLim',[0,fs/2],'YLim',[0,1.1*top]);
   end
   fprintf("Note"+num2str(i)+":\t f="+num2str(base_f(i))+"Hz \tT="+num2str(T)+"s\n");
end