function [sys,x0,str,ts,simStateCompliance] = wzctrl(t,x,u,flag)
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
sizes.NumInputs      = 16;
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
%%定义模块输入
x1d = u(1);  dx1d = u(2);  ddx1d = u(3);
yd = u(4);   dyd = u(5);   ddyd = u(6);
zd = u(7);   dzd = u(8);   ddzd = u(9);
x1 = u(10);  dx1 = u(11);
y = u(12);   dy = u(13);
z = u(14);   dz = u(15);
phi = u(16);
%%定义误差系统
ze = z - zd;
dze = dz - dzd;
%%无人机相关参数
m = 1.8;  g = 9.8;  K3 = 0.01;
%%控制器参数
kdx = 5; kpx = 5;
kdy = 5; kpy = 5;
kdz = 5; kpz = 5;
%%位置环控制律

u1x = -kpx*(x1-x1d) - kdx*(dx1-dx1d);
u1y = -kpy*(y-yd) - kdy*(dy-dyd);
u1z = -kpz*ze-kdz*dze + g + ddzd + K3/m*dzd;

%%姿态解算器

X = (cos(phi)*cos(phi)*u1x + cos(phi)*sin(phi)*u1y)/u1z;
if X>1
    thetad = pi/2;
elseif X<-1
    thetad = -pi/2;
else
    thetad = asin(X);
end
psid = atan((sin(phi)*cos(phi)*u1x-cos(phi)*cos(phi)*u1y)/u1z);
u1 = u1z/(cos(phi)*cos(psid));

%%模块输出
sys(1) = u1;
sys(2) = thetad;
sys(3) = psid;

function sys=mdlGetTimeOfNextVarHit(t,x,u)

sampleTime = 1;   
sys = t + sampleTime;

function sys=mdlTerminate(t,x,u)

sys = [];