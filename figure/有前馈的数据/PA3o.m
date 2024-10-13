clear all
% 打开第一个fig文件并提取数据  
h1 = openfig('x.fig');  
ax1 = gca; % 获取当前坐标轴句柄  
d1 = findobj(ax1,'Type','line'); % 假设是线对象  
xdata1 = get(d1,'XData');  
ydata1 = get(d1,'YData');  
close(h1); % 关闭第一个fig文件  
  
% 打开第二个fig文件并提取数据  
h2 = openfig('y.fig');  
ax2 = gca;  
d2 = findobj(ax2,'Type','line');  
xdata2 = get(d2,'XData');  
ydata2 = get(d2,'YData');  
close(h2);  
  
% 打开第三个fig文件并提取数据  
h3 = openfig('z.fig');  
ax3 = gca;  
d3 = findobj(ax3,'Type','line');  
xdata3 = get(d3,'XData');  
ydata3 = get(d3,'YData');  
close(h3);  

% 打开第四个fig文件并提取数据  
h4 = openfig('phi.fig');  
ax4 = gca; % 获取当前坐标轴句柄  
d4 = findobj(ax4,'Type','line'); % 假设是线对象  
xdata4 = get(d4,'XData');  
ydata4 = get(d4,'YData');  
close(h4); % 关闭第一个fig文件  
  
% 打开第五个个fig文件并提取数据  
h5 = openfig('theta.fig');  
ax5 = gca;  
d5 = findobj(ax5,'Type','line');  
xdata5 = get(d5,'XData');  
ydata5 = get(d5,'YData');  
close(h5);  
  
% 打开第六个fig文件并提取数据  
h6 = openfig('psi.fig');  
ax6 = gca;  
d6 = findobj(ax6,'Type','line');  
xdata6 = get(d6,'XData');  
ydata6 = get(d6,'YData');  
close(h6);  

% 创建新的图形窗口  
figure;  

% 绘图颜色  
colors = {'k-', 'r--'}; % 第一个数据集为黑色实线，第二个数据集为红色虚线  

% 设置第一个子图  
subplot(3,2,1);  
hold on; % 保持当前图形，以便添加更多元素  
plot(xdata1, ydata1, colors{1}, 'LineWidth', 0.75); % 绘制第一个数据集  
hline = 20; % 横虚线的高度  
plot([min(xdata1) max(xdata1)], [hline hline], colors{2}, 'LineWidth', 0.5); % 绘制横虚线  
xlabel('Time/s'); % 设置x轴标签  
ylabel('x/m'); % 设置y轴标签  
title('（a）x位置'); % 设置子图标题  
xlim([0 6]); % 设置x轴范围  
ylim([0 30]); % 设置y轴范围  
legend({'x', '期望x(x = 20)'}, 'Location', 'best'); % 添加图例  
grid on;  
hold off; % 释放图形，结束添加元素  

% 设置第二个子图（重复上述过程）  
subplot(3,2,2);  
hold on; % 保持当前图形，以便添加更多元素  
plot(xdata4, ydata4, colors{1}, 'LineWidth', 0.75); % 绘制第一个数据集  
hline = 0; % 横虚线的高度  
plot([min(xdata4) max(xdata4)], [hline hline], colors{2}, 'LineWidth', 0.5); % 绘制横虚线  
xlabel('Time/s'); % 设置x轴标签  
ylabel('phi/degree'); % 设置y轴标签  
title('（a）横滚角'); % 设置子图标题  
xlim([0 6]); % 设置x轴范围  
ylim([-130 130]); % 设置y轴范围  
legend({'phi', '期望phi(degree)'}, 'Location', 'best'); % 添加图例  
grid on;  
hold off; % 释放图形，结束添加元素  

% 设置第三个子图（重复上述过程）   
subplot(3,2,3);  
hold on;  
plot(xdata2, ydata2, colors{1}, 'LineWidth', 0.75);  
hline = 20; % 横虚线的高度  
plot([min(xdata2) max(xdata2)], [hline hline], colors{2}, 'LineWidth', 0.5);  
xlabel('Time/s');  
ylabel('y/m');  
title('（b）y位置');  
xlim([0 6]);  
ylim([0 30]);  
legend({'y', '期望y(y = 20)'}, 'Location', 'best');  
grid on;  
hold off;  

% 设置第四个子图  
subplot(3,2,4);  
hold on;  
plot(xdata5, ydata5, colors{1}, 'LineWidth', 0.75);  
hline = 0; % 横虚线的高度  
plot([min(xdata5) max(xdata5)], [hline hline], colors{2}, 'LineWidth', 0.5);  
xlabel('Time/s');  
ylabel('theta/degree');  
title('（b）俯仰角');  
xlim([0 6]);  
ylim([-100 100]);  
legend({'theta', '期望theta(degree)'}, 'Location', 'best');  
grid on;  
hold off;  

% 设置第五个子图（重复上述过程）  
subplot(3,2,5);  
hold on;  
plot(xdata3, ydata3, colors{1}, 'LineWidth', 0.75);  
hline = 20; % 横虚线的高度  
plot([min(xdata3) max(xdata3)], [hline hline], colors{2}, 'LineWidth', 0.5);  
xlabel('Time/s');  
ylabel('z/m');  
title('（c）z位置');  
xlim([0 6]);  
ylim([0 30]);  
legend({'z', '期望z(z = 20)'}, 'Location', 'best');  
grid on;  
hold off;  

% 设置第六个子图（重复上述过程）
subplot(3,2,6);  
hold on;  
plot(xdata6, ydata6, colors{1}, 'LineWidth', 0.75); 
hline = 60; % 横虚线的高度  
plot([min(xdata6) max(xdata6)], [hline hline], colors{2}, 'LineWidth', 0.5);  
xlabel('Time/s');  
ylabel('psi/degree');  
title('（c）偏航角');  
xlim([0 6]);  
ylim([-10 70]);  
legend({'psi', '期望psi(degree)'}, 'Location', 'best');  
grid on;  
hold off; 