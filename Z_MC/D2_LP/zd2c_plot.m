function [] = zd2c_plot(SOC,Pcha,Pdis,a_Bat,Ava,Ava_new)

subplot(3,1,1)
stairs(SOC,'r','LineWidth',1.5)
title('SOC')
xlabel('hours')
ylabel('SOC')
xlim([1 24])

if isempty(Pdis)==1
    Ptotal = Pcha/a_Bat;
else
    Ptotal = Pcha/a_Bat-Pdis/a_Bat;
end

subplot(3,1,2)
stairs(Ptotal,'LineWidth',1.5)
hline = refline([0 0]);
hline.LineStyle = '--';
hline.Color = 'k';
title('Pcha')
xlabel('hours')
ylabel('Pcha')
xlim([1 24])

subplot(3,1,3)
stairs(Ava,'k','LineWidth',1.5)
hold on
stairs(Ava_new,'m','LineWidth',1.5)
hold off
legend('Old','New')
title('Available Old & New')
xlabel('hours')
ylabel('SOC')
xlim([1 24])
