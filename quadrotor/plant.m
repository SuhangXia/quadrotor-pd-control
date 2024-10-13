function[sys, x0, str, ts] = plant(t, x, u, flag)
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
sizes.NumContStates     =   12;
sizes.NumDiscStates     =   0;
sizes.NumOutputs        =   12;
sizes.NumInputs         =   6;
sizes.DirFeedthrough    =   0;
sizes.NumSampleTimes    =   1;
sys = simsizes(sizes);
x0  = [0.1; 0.2; 0.3; 0.4; 0.5; 0.6;
    0.7; 0.8; 0.9; 1.0; 1.1; 1.2];
str = [];
ts  = [0 0];


function sys = mdlDerivatives(t, x, u)
Xe = x(1); Ye = x(2); Ze = x(3);
ub = x(4); vb = x(5); wb = x(6);
phi = x(7); theta = x(8); psi = x(9);
p = x(10); q = x(11); r = x(12);

Fx = u(1); Fy = u(2); Fz = u(3);
Mx = u(4); My = u(5); Mz = u(6);

m = 1; Inertia = eye(3);

Fb = [Fx; Fy; Fz];
Mb = [Mx; My; Mz];
Vb = [ub; vb; wb];
omega = [p; q; r];

dVb = 1 / m * Fb - cross(omega, Vb);
dOmega = pinv(Inertia) * (Mb - cross(omega, Inertia * omega));
R = xyz2R(phi, theta, psi);
J = calJ(phi, theta, psi);

sys(1:3) = R * Vb;
sys(4:6) = dVb;
sys(7:9) = J * omega;
sys(10:12) = dOmega;


function sys = mdlOutputs(t, x, u)
sys(1:3) = x(1:3);
sys(4:6) = x(4:6);
sys(7:9) = wrapToPi(x(7:9));
sys(10:12) = x(10:12);