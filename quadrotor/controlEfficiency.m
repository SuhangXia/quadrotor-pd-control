function[sys, x0, str, ts] = controlAssignment(t, x, u, flag, Para)
switch flag
    case 0
        [sys, x0, str, ts] = mdlInitializeSizes;
    case 1
        sys = mdlDerivatives(t, x, u);
    case 3
        sys = mdlOutputs(t, x, u, Para);
    case {2, 4, 9}
        sys = [];
    otherwise
        error(['Unhandled flag = ', num2str(flag)]);
end

function [sys, x0, str, ts] = mdlInitializeSizes
sizes = simsizes;
sizes.NumOutputs        =   6;
sizes.NumInputs         =   4;
sizes.DirFeedthrough    =   1;
sizes.NumSampleTimes    =   0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];

function sys = mdlOutputs(t, x, u, Para)
d = Para.d;    % 半径
cT = Para.cT;   % 升力系数
cM = Para.cM;   % 扭矩系数

omega1 = u(1);
omega2 = u(2);
omega3 = u(3);
omega4 = u(4);

Omega = [omega1; omega2; omega3; omega4];

M = [0, 0, 0, 0;
    0, 0, 0, 0;
    -cT, -cT, -cT, -cT;
    d*cT*sqrt(2)/2, -d*cT*sqrt(2)/2, -d*cT*sqrt(2)/2, d*cT*sqrt(2)/2;
    d*cT*sqrt(2)/2, d*cT*sqrt(2)/2, -d*cT*sqrt(2)/2, -d*cT*sqrt(2)/2;
    cM, -cM, cM, -cM];
Tau = M * Omega.^2;
sys(1) = Tau(1);
sys(2) = Tau(2);
sys(3) = Tau(3);
sys(4) = Tau(4);
sys(5) = Tau(5);
sys(6) = Tau(6);