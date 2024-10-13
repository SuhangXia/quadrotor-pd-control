function [sys,x0,str,ts,simStateCompliance] = UAV(t,x,u,flag)
switch flag
  case 0
    [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes;
  case 1
    sys=mdlDerivatives(t,x,u);
  case 2
    sys=mdlUpdate(t,x,u);
  case 3
    sys=mdlOutputs(t,x,u);
  case 4
    sys=mdlGetTimeOfNextVarHit(t,x,u);
  case 9
    sys=mdlTerminate(t,x,u);
  otherwise
    DAStudio.error('Simulink:blocks:unhandledFlag', num2str(flag));
end

function [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 12;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 12;
sizes.NumInputs      = 4;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1; 
sys = simsizes(sizes);
x0  = [0 0 0 0 0 0 0 0 0 0 0 0];
str = [];
ts  = [-1 0];
simStateCompliance = 'UnknownSimState';

function sys=mdlDerivatives(t,x,u)
%%定义模块输入量
u1 = u(1);
u2 = u(2);
u3 = u(3);
u4 = u(4);
%%定义系统状态变量
x1 = x(1); dx1 = x(2);
y = x(3);dy = x(4);
z = x(5);dz = x(6);
phi = x(7);dphi = x(8);
theta = x(9);dtheta = x(10);
psi = x(11);dpsi = x(12);

%%四旋翼无人机的本体结构参数

m = 1.8;  g = 9.8; l = 0.22;
Ix  = 1.25;  Iy = 1.25;  Iz = 1.25;
K1 = 0.01;   K2 = 0.01;  K3 = 0.01;
K4 = 0.012;  K5 = 0.012; K6 = 0.012;

%%无人机数学模型

ddx = u1*(sin(phi)*cos(theta)*cos(phi)+sin(theta)*sin(psi)) - K1*dx1/m;
ddy = u1*(sin(phi)*cos(theta)*sin(psi)-sin(theta)*cos(psi)) - K2*dy/m;
ddz = u1*(cos(psi)*cos(theta)) - g - K3*dz/m;
ddphi = u2 - l*K4*dphi/Ix;
ddtheta = u3 - l*K5*dtheta/Iy;
ddpsi = u4 - K6*dpsi/Iz;

%%更新系统状态变量
sys(1) = dx1;     sys(2) = ddx;
sys(3) = dy;      sys(4) = ddy;
sys(5) = dz;      sys(6) = ddz;
sys(7) = dphi;    sys(8) = ddphi;
sys(9) = dtheta;  sys(10) = ddtheta;
sys(11) = dpsi;   sys(12) = ddpsi;

function sys=mdlUpdate(t,x,u)

sys = [];

function sys=mdlOutputs(t,x,u)
%%获取统状态变量
x1 = x(1); dx1 = x(2);
y = x(3);dy = x(4);
z = x(5);dz = x(6);
phi = x(7);dphi = x(8);
theta = x(9);dtheta = x(10);
psi = x(11);dpsi = x(12);
%%输出系统状态
sys(1) = x1;     sys(2) = dx1;
sys(3) = y;      sys(4) = dy;
sys(5) = z;      sys(6) = dz;
sys(7) = phi;    sys(8) = dphi;
sys(9) = theta;  sys(10) = dtheta;
sys(11) = psi;   sys(12) = dpsi;

function sys=mdlGetTimeOfNextVarHit(t,x,u)

sampleTime = 1;   
sys = t + sampleTime;

function sys=mdlTerminate(t,x,u)

sys = [];