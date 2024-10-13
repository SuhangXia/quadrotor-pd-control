function[sys, x0, str, ts] = torqAssignment(t, x, u, flag)
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
sizes.NumOutputs        =   4;
sizes.NumInputs         =   4;
sizes.DirFeedthrough    =   1;
sizes.NumSampleTimes    =   0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];

function sys = mdlOutputs(t, x, u)
Fz = u(1);
Mx = u(2);
My = u(3);
Mz = u(4);

Tau = [Fz; Mx; My; Mz];

M = [-1, -1, -1, -1;
    sqrt(2)/2, -sqrt(2)/2, -sqrt(2)/2, sqrt(2)/2;
    sqrt(2)/2, sqrt(2)/2, -sqrt(2)/2, -sqrt(2)/2;
    1, -1, 1, -1];
Omega = sqrt(abs(pinv(M) * Tau));
sys(1) = Omega(1);
sys(2) = Omega(2);
sys(3) = Omega(3);
sys(4) = Omega(4);