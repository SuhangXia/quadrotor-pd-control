function[sys, x0, str, ts] = attitudeCtrl(t, x, u, flag)
switch flag
    case 0
        [sys, x0, str, ts] = mdlInitializeSizes;
    case 1
        sys = mdlDerivatives(t, x, u);
    case 3
        sys = mdlOutputs(t, x, u);
    case {2, 4, 9}
        sys = [];
    otherwise
        error(['Unhandled flag = ', num2str(flag)]);
end

function [sys, x0, str, ts] = mdlInitializeSizes
sizes = simsizes;
sizes.NumOutputs        =   3;
sizes.NumInputs         =   4;
sizes.DirFeedthrough    =   1;
sizes.NumSampleTimes    =   0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];

function sys = mdlOutputs(t, x, u)
d = 1.0;    % 半径
cT = 1.0;   % 升力系数
cM = 1.0;   % 扭矩系数

Fz = u(1);
Mx = u(2);
My = u(3);
Mz = u(4);

Tau = [Fz; Mx; My; Mz];

M = [-cT, -cT, -cT, -cT;
    d*cT*sqrt(2)/2, -d*cT*sqrt(2)/2, -d*cT*sqrt(2)/2, d*cT*sqrt(2)/2;
    d*cT*sqrt(2)/2, d*cT*sqrt(2)/2, -d*cT*sqrt(2)/2, -d*cT*sqrt(2)/2;
    cM, -cM, cM, -cM];
Omega = sqrt(pinv(M) * Tau);
sys(1) = Omega(1);
sys(2) = Omega(2);
sys(3) = Omega(3);
sys(4) = Omega(4);