%Regression wala file 
%Load the files

%function to get curve out of points
%Function to get inflection points out of the curve (can also be done by
%straight fit and finding the intersection points)
ft = fittype( 'poly3' );
opts = fitoptions( 'Method', 'LinearLeastSquares' );
opts.Robust = 'Bisquare';
%now doing regression of each of these temperatures with the parameters
%i.e. HR, Temp, Composition with different combinations
[xData, yData] = prepareCurveData( Temp_33C_HR_1, RL_33C_HR_1 );
[curve_1,curve_gof] = fit(xData,yData,ft,opts);
[xData, yData] = prepareCurveData( Temp_33C_HR2, RL_33C_HR2 );
[curve_2,curve_gof] = fit(xData,yData,ft,opts);
[xData, yData] = prepareCurveData( Temp_33C_HR20, RL_33C_HR20 );
[curve_3,curve_gof] = fit(xData,yData,ft,opts);
[xData, yData] = prepareCurveData( Temp_80C_HR2, RL_80C_HR2 );
[curve_4,curve_gof] = fit(xData,yData,ft,opts);
[xData, yData] = prepareCurveData( Temp_38C_HR20, RL_38C_HR20 );
[curve_5,curve_gof] = fit(xData,yData,ft,opts);
[xData, yData] = prepareCurveData( Temp_38C_HR_1, RL_38C_HR_1 );
[curve_6,curve_gof] = fit(xData,yData,ft,opts);
[xData, yData] = prepareCurveData( Temp_38C_HR2, RL_38C_HR2 );
[curve_7,curve_gof] = fit(xData,yData,ft,opts);
[xData, yData] = prepareCurveData( Temp_38C_HR20, RL_38C_HR20 );
[curve_8,curve_gof] = fit(xData,yData,ft,opts);

A=figure(1)
hold on
plot(curve_1,'-.')
plot(curve_2,'-')
plot(curve_3,'--')
title('Dilatometer curves for Continious Tempering in Fe-0.33C','fontweight','bold');
legend('HR0.1','HR2','HR20');
xlabel Temperature(C)
ylabel Relative-Change-in-Length
grid on
saveas(A,'A.png');
B=figure(2)
hold on
plot(curve_4, '-.')
plot(curve_5, '-')
title('Dilatometer curves for Continious Tempering in Fe-0.80C','fontweight','bold');
legend('HR2','HR20');
xlabel Temperature(C)
ylabel Relative-Change-in-Length
grid on
saveas(B,'B.png');
C=figure(3)
hold on
plot(curve_6,'-.')
plot(curve_7,'-')
plot(curve_8,'--')
title('Dilatometer curves for Continious Tempering in Fe-0.38C','fontweight','bold');
legend('HR0.1','HR2','HR20');
xlabel Temperature(C)
ylabel Relative-Change-in-Length
grid on
saveas(C,'C.png');
A_D=figure(4)
hold on
plot(curve_1,'-.','deriv1')
plot(curve_2,'-','deriv1')
plot(curve_3,'--','deriv1')
title('Dilatometer differential curves for Continious Tempering in Fe-0.33C','fontweight','bold');
legend('Diff_HR0.1','Diff_HR2','Diff_HR20');
xlabel Temperature(C)
ylabel First-Derivative-of-Dl/l
grid on
saveas(A_D,'A_D.png');
B_D=figure(5)
hold on
plot(curve_4,'-.','deriv1')
plot(curve_5,'-','deriv1')
title('Dilatometer curves differential for Continious Tempering in Fe-0.80C','fontweight','bold');
legend('Diff HR2','Diff HR20');
xlabel Temperature(C)
ylabel First-Derivative-of-Dl/l
grid on
saveas(B_D,'B_D.png');
C_D=figure(6)
hold on
plot(curve_6,'-.','deriv1')
plot(curve_7,'-','deriv1')
plot(curve_8,'--','deriv1')
title('Dilatometer curves differential for Continious Tempering in Fe-0.38C','fontweight','bold');
legend('Diff HR0.1','Diff HR2','Diff HR20');
xlabel Temperature(C)
ylabel First-Derivative-of-Dl/l
grid on
saveas(C_D,'C_D.png');
