config_MTS = load("k1875_22u2d_mts.mat");

config1 = load("k1875_22u2d_ewc050st_0.mat");
config2 = load("k1875_22u2d_ewc050st_500.mat");
config3 = load("k1875_22u2d_ewc050st_1000.mat");


lwaf0 = mean(config1.f(:,[2,3]),2);
lwad0 = mean(config1.dd(:,[2,3]),2);
lwaf500 = mean(config2.f(:,[2,3]),2);
lwad500 = mean(config2.dd(:,[2,3]),2);
lwaf1000 = mean(config3.f(:,[2,3]),2);
lwad1000 = mean(config3.dd(:,[2,3]),2);

%%% plot every n points
n = 10;
figure,
plot(config_MTS.dd(1:n:end), config_MTS.ff(1:n:end)*1000,'LineWidth',0.75), grid on, hold on,
plot(lwad0(1:n:end)-0.01,lwaf0(1:n:end)*1000,'LineWidth',0.75), hold on,
plot(lwad500(1:n:end)-0.05,lwaf500(1:n:end)*1000,'LineWidth',0.75), hold on,
plot(lwad1000(1:n:end)-0.08,lwaf1000(1:n:end)*1000,'LineWidth',0.75), hold on,
colororder(["#0072BD","#D95319","#EDB120","#7E2F8E"])
set(gca,'FontName','Times New Roman')
legend('MTS','Shake Table - No preload','Shake Table - 500lbs preload','Shake Table - 1000lbs preload','EdgeColor','None','Color','None','FontSize',12,'Location','southeast')
xlabel('Displacement (in)')
ylabel('Force (lbs)')
title('K1875 - 2 units of 2U2D')
xlim([-0.18 0.05])

