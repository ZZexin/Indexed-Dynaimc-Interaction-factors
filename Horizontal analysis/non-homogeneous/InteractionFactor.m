clear
%% load data
 load('nonh_piledispH.mat')    
%disp2 %(angle(degree) length,           material,    spacing ratio, nfrequency)
%index  1  2  3  4  5  %1  2  3  4  5    %1  2   3     %1 2 3 4 5    %(1,11)
%range %0 30 45 60 90  %10 20 30 40 50  [0 0.05 0.1]   [S 2 3 4 5]   0:0.1:1
load('nonh_singlepiledisp.mat')

%disp0   %[length,         Material,    Nfrequency]
%index   %1  2  3  4  5    %1  2   3      %(1,11)
%range   %10 20 30 40 50   [0 0.05 0.1]   0:0.1:1

%% Spacing Ratio
% for n=4
theta=1;
 n=2;%spacing ratio
 for B=1:3; %material
 Lp=3;
%over dynamic load
Ds1(1,:)=disp0(Lp,B,:);
Dss1=disp0(Lp,B,1); %static one at top of single pile
%over static load
% D1(1,:)=disp0(3,1,1);

if n==1 %for single pile (benchmark)
    IFR=real(Ds1)./real(Ds1(1));
%     IFI=imag(Ds1)./imag(Ds1);
    IFI=imag(Ds1)./real(Ds1(1));
%% cut off
        if B==2
            IFI(1,1)=0;
            IFI(1,2)=0;
        elseif B==3
            IFI(1,1)=0;
            IFI(1,2)=0;
            IFI(1,3)=0;
        end
else   %others
    Ds2(1,:)=disp2(theta,Lp,B,n-1,:);
Ds2R=real(Ds2);
Ds2I=imag(Ds2);
%% cut off
        if B==2
            Ds2I(1,1)=0;
            Ds2I(1,2)=0;
        elseif B==3
            Ds2I(1,1)=0;
            Ds2I(1,2)=0;
            Ds2I(1,3)=0;
        end
D1sR=real(Ds1);
D1sI=imag(Ds1);

IFR=Ds2R./D1sR(1);
% IFI=Ds2I./D1sI; 
IFI=Ds2I./D1sR(1); 
end

x=0:0.1:1;
%%
figure(1)
hold on
plot(x,IFR)
grid on
xlabel('a_0')
ylabel('\alpha_h (Real Part)')
% legend('Single Pile','s/d=2','s/d=3','s/d=4','s/d=5')
% legend('\theta=0\circ','\theta=30\circ','\theta=45\circ','\theta=60\circ','\theta=90\circ')
legend('M6','M7','M8')
% legend('Lp/d=10','Lp/d=20','Lp/d=30','Lp/d=40','Lp/d=50')
% %  xlim([0 0.5])
xlim([0 1])
% ylim([-0.4 1.2])

figure(2)
hold on
plot(x,IFI)
grid on
xlabel('a_0')
ylabel('\alpha_h (Imaginary Part)')
% legend('Single Pile','s/d=2','s/d=3','s/d=4','s/d=5')
% legend('\theta=0\circ','\theta=30\circ','\theta=45\circ','\theta=60\circ','\theta=90\circ')
legend('M6','M7','M8')
% legend('Lp/d=10','Lp/d=20','Lp/d=30','Lp/d=40','Lp/d=50')
% ylim([-0.6 0.3])
xlim([0 1])
end


