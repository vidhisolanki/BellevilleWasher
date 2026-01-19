%%% spectrum
%%% K1875
f = [(1:200)/100, 3:100];
%f = [1:100];
beta = @(d)((3.21-0.68*log(d))/2.1156);
Sa = @(d,f)((1.144*beta(d)*f).*(f>=0 & f<1.1)+(1.25*beta(d)).*(f>= 1.1 & f<=8)+((13.2*beta(d)-5.28)./f-0.4*beta(d)+0.66).*(f> 8 & f<=33)+0.5.*(f>33));
fewcvtfixed = 6.9; 
dewcvtfixed = 0.5; 

fnscvtfixed = 9.4; 
dnscvtfixed = 0.6; 

few2u2d0 = 2.9;
dew2u2d0 = 3.9;

few2u2d500 = 3.6;
dew2u2d500 = 6.5;

few2u2d1000 = 4.1;
dew2u2d1000 = 9.9;

fns2u2d0 = 4.0;
dns2u2d0 = 3.7;

fns2u2d500 = 5.1;
dns2u2d500 = 6.4;

fns2u2d1000 = 5.5;
dns2u2d1000 = 8.1;

few3u3d500 = 3.6;
dew3u3d500 = 7.8;

fns3u3d500 = 5.1;
dns3u3d500 = 7.3;

few3u3d1500 = 4.5;
dew3u3d1500 = 9.3;

fns3u3d1500 = 5.9;
dns3u3d1500 = 6.0;
%%% earthquake spectrum
load CERL005g; % earthquake record
dtug = 1/512; % sampling time of earthquake record
freq = logspace(0,2.5,100); % frequency points at which to 
                            % generate spectrum values
a00y = a0y/min(a0y)*0.5;
[~, ~, Saeqx005] = ComputeResponseSpectrum(a0x, dtug, freq, 0.05);
[~, ~, Saeqyy005] = ComputeResponseSpectrum(a00y, dtug, freq, 0.05);

g=figure;
semilogx(f,Sa(2,f),'r'), grid on, hold on,
semilogx(f,Sa(5,f),'b'), hold on,
semilogx(fewcvtfixed,Sa(dewcvtfixed, fewcvtfixed),'Marker','square','LineStyle','none','MarkerFaceColor',"#EDB120",'MarkerEdgeColor',"#EDB120",'MarkerSize',6), hold on,
semilogx(fnscvtfixed,Sa(dnscvtfixed, fnscvtfixed),'Marker','square','LineStyle','none','MarkerFaceColor',"#7E2F8E",'MarkerEdgeColor',"#7E2F8E",'MarkerSize',6), hold on,
semilogx(few2u2d0,Sa(dew2u2d0, few2u2d0),'Marker','o','LineStyle','none','MarkerFaceColor',"#EDB120",'MarkerEdgeColor',"#EDB120",'MarkerSize',6), hold on,
semilogx(few2u2d500,Sa(dew2u2d500, few2u2d500),'Marker','o','LineStyle','none','MarkerFaceColor',"#EDB120",'MarkerEdgeColor',"#EDB120",'MarkerSize',8), hold on,
semilogx(few2u2d1000,Sa(dew2u2d1000, few2u2d1000),'Marker','o','LineStyle','none','MarkerFaceColor',"#EDB120",'MarkerEdgeColor',"#EDB120",'MarkerSize',10), hold on,
semilogx(few3u3d500,Sa(dew3u3d500, few3u3d500),'Marker','diamond','LineStyle','none','MarkerFaceColor',"#EDB120",'MarkerEdgeColor',"#EDB120",'MarkerSize',8), hold on,
semilogx(few3u3d1500,Sa(dew3u3d1500, few3u3d1500),'Marker','diamond','LineStyle','none','MarkerFaceColor',"#EDB120",'MarkerEdgeColor',"#EDB120",'MarkerSize',10), hold on,
semilogx(fns2u2d0,Sa(dns2u2d0, fns2u2d0),'Marker','o','LineStyle','none','MarkerFaceColor',"#7E2F8E",'MarkerEdgeColor',"#7E2F8E",'MarkerSize',6), hold on,
semilogx(fns2u2d500,Sa(dns2u2d500, fns2u2d500),'Marker','o','LineStyle','none','MarkerFaceColor',"#7E2F8E",'MarkerEdgeColor',"#7E2F8E",'MarkerSize',8), hold on,
semilogx(fns2u2d1000,Sa(dns2u2d1000, fns2u2d1000),'Marker','o','LineStyle','none','MarkerFaceColor',"#7E2F8E",'MarkerEdgeColor',"#7E2F8E",'MarkerSize',10), hold on,
semilogx(fns3u3d500,Sa(dns3u3d500, fns3u3d500),'Marker','diamond','LineStyle','none','MarkerFaceColor',"#7E2F8E",'MarkerEdgeColor',"#7E2F8E",'MarkerSize',8), hold on,
semilogx(fns3u3d1500,Sa(dns3u3d1500, fns3u3d1500),'Marker','diamond','LineStyle','none','MarkerFaceColor',"#7E2F8E",'MarkerEdgeColor',"#7E2F8E",'MarkerSize',10), hold on,
set(gca,'FontName','Times New Roman')
legend('2% damping','5% damping','CVT fixed on spool: EW','CVT fixed on spool: NS','2 units of 2U2D - No preload','2 units of 2U2D - 500lbs preload'...
    ,'2 units of 2U2D - 1000lbs preload','3 units of 3U3D - 500lbs preload','3 units of 3U3D - 1500lbs preload','EdgeColor','None','Color','None','FontSize',12,'Location','northwest')
xlabel('Frequency (Hz)')
ylabel('Spectral Acceleration (g)')
set(g,'Position',[100 100 800 600])
print(gcf, 'C:\Users\solankiv\Documents\GitHub\BellevilleWasher\Figures\ExpRRS.eps', '-depsc');

figure,
semilogx(f,Sa(5,f),'k'), hold on, grid on,
semilogx(freq, Saeqx005,'b','LineWidth',1), hold on,
semilogx(freq, Saeqyy005,'r','LineWidth',1), hold on,
set(gca,'FontName','Times New Roman')
legend('RRS - 5% damping','TRS in X - 5% damping','TRS in Y - 5% damping','EdgeColor','None','Color','None','FontSize',12,'Location','northeast')
xlabel('Frequency (Hz)')
ylabel('Spectral Acceleration (g)')
xlim([1 10^3])
print(gcf, 'C:\Users\solankiv\Documents\GitHub\BellevilleWasher\Figures\TRSRRS005.eps', '-depsc');

