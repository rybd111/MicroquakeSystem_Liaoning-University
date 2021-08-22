function [bb]= b_pro(fudu,zjmax,zjmin)
%shijian2为到达时间单位为s
% fudu为最大幅度
[m,~]=size(fudu);
zhenji = fudu;
% for ou=1:m
%     zhenji(ou)=log10(fudu(ou));
% end
% b值计算
%%%
% 1-7对应：fd=0.04，dt=100或者50均可
% 1-5对应  fd= 0.04,  dt=40
% 1图
% fd=0.04;  %分档间隔
% dt=40;  %样本数

 fd=0.9; %分档间隔
dt=1;  %样本数
qw=fix(m/dt);  % 以dt个事件作为一个b值计算样本，qw为样本数, fix 取整函数
b(:) = 0;
for ii=1:qw
    zj=[];
    zj=zhenji(((ii-1)*dt+1):(ii*dt)); %选择样本
  %  sj12(ii)=shijian2(ii*dt);
%     zjmax=max(zj);
%     zjmin=min(zj);
%     zjmax = log10(zjmax);%
%     zjmin = log10(zjmin);%
    mm=ceil((zjmax-zjmin)/fd); %震级分档总数
%     mm=1;
    M=[];N=[];
    for iu=1:mm
        hzjmx=(zjmin+fd*iu);
        hzjmn=(zjmin + fd*(iu-1));
        M(iu)=hzjmx; %该档震级
        yt=0;
        for iy=1:dt
            if (zj(iy)<=hzjmx && zj(iy)>=hzjmn)
                yt=yt+1;
            end
        end
        N(iu)=yt;
    end
    c1=0;%左上部 M*log10(N) 求和
    c21=0;%右上部  M求和
    c22=0;%右上部  log10(N)求和
    c3=0;%左下部 M*M 求和
    for iu=1:1:mm
        if N(iu)==0
            continue
        end
%         c1=c1+M(iu)*log10(N(iu));
        c1=c1+M(iu)*(N(iu));
        c21=c21+M(iu);
%         c22=c22+ log10(N(iu));
        c22=c22+ (N(iu));
        c3=c3+M(iu)*M(iu);
    end
    b(ii)=(c1-mm*c21*c22)/(c3-mm*c3*c3);
end
jj=1;
for ii=1:qw 
    if b(ii)==0
        continue;
    end
    bb(jj)=b(ii);
  %  sjsj(jj)=sj12(ii);
    jj=jj+1;
end
bb=b;
end