function [sys,x0,str,ts,simStateCompliance] = TD1(t,x,u,flag)
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
sizes.NumContStates  = 3;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 3;
sizes.NumInputs      = 1;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1; 
sys = simsizes(sizes);
x0  = [0 0 0];
str = [];
ts  = [0 0];
simStateCompliance = 'UnknownSimState';

function sys=mdlDerivatives(t,x,u)
ebs = 0.10;
vt = u(1);
temp1 = (abs(ebs*x(2))^(9/7))*sign(ebs*x(2));
temp2 = x(1) - vt + temp1;
temp2 = abs(temp2)^(1/3)*sign(temp2);
temp3 = abs(ebs^2*x(3))^(3/5)*sign(ebs^2*x(3));
sys(1) = x(2);
sys(2) = x(3);
sys(3) = (-2^(3/5)*4*temp2-4*temp3)*1/ebs^3;

function sys=mdlUpdate(t,x,u)

sys = [];

function sys=mdlOutputs(t,x,u)
v = u(1);
sys(1) = v;
sys(2) = x(2);
sys(3) = x(3);

function sys=mdlGetTimeOfNextVarHit(t,x,u)

% sampleTime = 1;   
sys = []

function sys=mdlTerminate(t,x,u)

sys = [];