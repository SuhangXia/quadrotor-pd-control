# simulink-3d-scope
Multitrack 3D Simulink Scope

[![View simulink-3d-scope on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/4915-simulink-3d-scope)

[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=giampy1969/simulink-3d-scope)

This block is an enhanced version of the standard XYGraph Simulink&reg; block.
The standard XYGraph allows to plot the motion of ONE point in the XY plane. This block allows plotting the motion of SEVERAL points in the XYZ space.

In other words each point draws a line as it moves, so you end up having several lines in the plot instead of just one. Setting the camera position parameter to [0 0 1] reduces the plot to a classic 2D one.

This block is very useful when you have to compare the motion of a point versus a reference trajectory. See this blog entry for more information: https://blogs.mathworks.com/pick/2017/03/10/3d-scope/

To install this vesion, simply add the folder to the MATLAB&reg; path. For MATLAB versions older than R2014b (and related legacy information), please go to https://www.mathworks.com/matlabcentral/fileexchange/4915-3dscope?s_tid=srchtitle and download version 3.1, which contains an installer that installs older versions.

Giampy
