%% load data
load('Piledisp_V.mat')    
%disp2 %(length,         material,     spacing ratio, nfrequency)
%index %1  2  3  4  5    %1  2   3     %1 2 3 4 5 10  %(1,26)
%range %10 20 30 40 50  [M1  M4  M5]   [S 2 3 4 5 10] 0:0.04:1
load('singlepiledisp_V.mat')
%disp0   %[length,         Material,    Nfrequency]
%index   %1  2  3  4  5    %1  2   3      %(1,26)
%range   %10 20 30 40 50   [0 0.05 0.1]   0:0.04:1

%% Spacing Ratio
% for n=1
n=5;
for M=1:3 %material
Lp=1
%over dynamic load
Ds1(1,:)=disp0(Lp,M,:);
Dss1=disp0(Lp,M,1); %static one at top of single pile
%over static load
% D1(1,:)=disp0(3,1,1);

if n==1 %for single pile (benchmark)
    IFR=real(Ds1)./real(Ds1(1));
%     IFI=imag(Ds1)./imag(Ds1);
    IFI=imag(Ds1)./real(Ds1(1));
else   %others
    Ds2(1,:)=disp2(Lp,M,n-1,:);
Ds2R=real(Ds2);
Ds2I=imag(Ds2);
D1sR=real(Ds1);
D1sI=imag(Ds1);

IFR=Ds2R./D1sR(1);
% IFI=Ds2I./D1sI; 
IFI=Ds2I./D1sR(1); 
end

x=[0:0.04:1];
%%
figure(1)
hold on
plot(x,IFR)
grid on
xlabel('a_0')
ylabel('\alpha_v (Real Part)')
% legend('Single Pile','s/d=2','s/d=3','s/d=4','s/d=5','s/d=10')
legend('M1','M4','M5')
% legend('Lp/d=10','Lp/d=20','Lp/d=30','Lp/d=40','Lp/d=50')
% %  xlim([0 0.5])
xlim([0 1])
% ylim([-0.4 1.2])

figure(2)
hold on
plot(x,IFI)
grid on
xlabel('a_0')
ylabel('\alpha_v (Imaginary Part)')
% legend('Single Pile','s/d=2','s/d=3','s/d=4','s/d=5','s/d=10')
legend('M1','M4','M5')%'s/d=3','s/d=4',
% legend('Lp/d=10','Lp/d=20','Lp/d=30','Lp/d=40','Lp/d=50')
% ylim([-0.2 0.2])
xlim([0 1])
end

%% Material

