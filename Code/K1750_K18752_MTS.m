data1mts = load("K1750_2units2U2D.mat");%%% through guided rod

figure,
plot(data1mts.disp, data1mts.f*1000), grid on,
set(gca,'FontName','Times New Roman')
xlabel('Displacement (in)'), grid on, hold on,
ylabel('Force (lbs)')

data = load("k1875_22u2d_mts.mat");%%% through guided rod
figure,
plot(data.dd, data.ff*1000), grid on,
set(gca,'FontName','Times New Roman')
xlabel('Displacement (in)'), grid on, hold on,
ylabel('Force (lbs)')

load("K1875_22u2d_mts_norod.mat")%% no guided rod
figure,
plot(data.Ch1AxialDisplacement, data.Ch1AxialForce*1000), grid on,
set(gca,'FontName','Times New Roman')
xlabel('Displacement (in)'), grid on, hold on,
ylabel('Force (lbs)')

load("K1750_23u3d_mts_withrod.mat")%% no guided rod
figure,
plot(-data.Ch1AxialDisplacement, -data.Ch1AxialForce*1000), grid on,
set(gca,'FontName','Times New Roman')
xlabel('Displacement (in)'), grid on, hold on,
ylabel('Force (lbs)')