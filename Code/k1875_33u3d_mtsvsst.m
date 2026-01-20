config_MTS = load("k1875_33u3d_mts.mat");

config1 = load("k1875_33u3d_ewc050st_500.mat");
config2 = load("k1875_33u3d_ewc050st_1500.mat");


lwaf500 = mean(config1.f(:,[2,3]),2);
lwad500 = mean(config1.dd(:,[2,3]),2);
lwaf1500 = mean(config2.f(:,[2,3]),2);
lwad1500 = mean(config2.dd(:,[2,3]),2);


%%% plot every n points
n = 10;
figure,
plot(config_MTS.dd(1:n:end), config_MTS.ff(1:n:end)*1000,'LineWidth',0.75), grid on, hold on,
plot(lwad500(1:n:end)-0.06,lwaf500(1:n:end)*1000,'LineWidth',0.75), hold on,
plot(lwad1500(1:n:end)-0.118,lwaf1500(1:n:end)*1000,'LineWidth',0.75), hold on,
colororder(["#0072BD","#D95319","#EDB120"])
set(gca,'FontName','Times New Roman')
legend('MTS','Shake Table - 500lbs preload','Shake Table - 1500lbs preload','EdgeColor','None','Color','None','FontSize',12,'Location','southeast')
xlabel('Displacement (in)')
ylabel('Force (lbs)')
title('K1875 - 3 units of 3U3D')
%xlim([-0.18 0.05])

