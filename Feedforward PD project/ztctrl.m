function [sys,x0,str,ts,simStateCompliance] = ztctrl(t,x,u,flag)
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
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 3;
sizes.NumInputs      = 15;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1; 
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [0 0];
simStateCompliance = 'UnknownSimState';

function sys=mdlDerivatives(t,x,u)

sys = [];

function sys=mdlUpdate(t,x,u)

sys = [];

function sys=mdlOutputs(t,x,u)
%%定义模块输入量
phid = u(1);    dphid = u(2);     ddphid = u(3);
thetad = u(4);  dthetad = u(5);   ddthetad = u(6);
psid = u(7);    dpsid = u(8);     ddpsid = u(9);

phi = u(10);    dphi = u(11);
theta = u(12);  dtheta = u(13);
psi = u(14);    dpsi = u(15);
%%四旋翼的相关参数
l = 0.22;
K4 = 0.012;  K5 = 0.012; K6 = 0.012;
Ix  = 1.25;  Iy = 1.25;  Iz = 1.25;
%%控制器参数
kpphi = 15;     kdphi = 15;
kptheta = 15;   kdtheta = 15;
kppsi = 15;     kdpsi = 15;
%%定义误差系统

phie = phi-phid;  dphie = dphi-dphid;
thetae = theta-thetad;  dthetae = dtheta - dthetad;
psie = psi-psid;  dpsie = dpsi-dpsid;

%%控制律

u2 = -kpphi*phie - kdphi*dphie + ddphid + l*K4/Ix*dthetad;
u3 = -kptheta*thetae - kdtheta*dthetae + ddthetad + l*K5/Iy * dthetad;
u4 = -kppsi*psie - kdpsi*dpsie + ddpsid + K6/Iz*dpsid;

%%输出控制量
sys(1) = u2;
sys(2) = u3;
sys(3) = u4;

function sys=mdlGetTimeOfNextVarHit(t,x,u)

sampleTime = 1;   
sys = t + sampleTime;

function sys=mdlTerminate(t,x,u)

sys = [];