% 清除所有变量  
clear all  
  

  
% 提取第一个图的数据  
h1 = openfig('u1.fig');  
ax1 = gca;  
d1 = findobj(ax1,'Type','line');  
xdata1 = get(d1,'XData');  
ydata1 = get(d1,'YData');  
close(h1);  
  
% 提取第二个图的数据  
h2 = openfig('u2.fig');  
ax2 = gca;  
d2 = findobj(ax2,'Type','line');  
xdata2 = get(d2,'XData');  
ydata2 = get(d2,'YData');  
close(h2);  
  
% 提取第三个图的数据  
h3 = openfig('u3.fig');  
ax3 = gca;  
d3 = findobj(ax3,'Type','line');  
xdata3 = get(d3,'XData');  
ydata3 = get(d3,'YData');  
close(h3);  
  
% 提取第四个图的数据（您需要替换为实际的.fig文件名和提取方式）  
h4 = openfig('u4.fig'); % 假设这是第四个图的文件名  
ax4 = gca;  
d4 = findobj(ax4,'Type','line');  
xdata4 = get(d4,'XData');  
ydata4 = get(d4,'YData');  
close(h4);  
  
% 创建新的图形窗口  
figure;  
  
% 绘图颜色  
colors = {'k-', 'r--'}; % 第一个数据集为黑色实线，第二个数据集为红色虚线  
  
% 设置第一个子图  
subplot(2,2,1);  
hold on;  
plot(xdata1, ydata1, colors{1}, 'LineWidth', 0.75);  
hline = 20; % 横虚线的高度  
plot([min(xdata3) max(xdata3)], [hline hline], colors{2}, 'LineWidth', 0.5);  
xlabel('Time/s');  
ylabel('u1通道/degree');  
title('垂直通道的推力');  
 
legend({'u1', '期望u1'}, 'Location', 'best');  
grid on;  
hold off;  
  
% 设置第二个子图  
subplot(2,2,2); 
hold on;  
plot(xdata2, ydata2, colors{1}, 'LineWidth', 0.75);  
hline = 0; % 横虚线的高度  
plot([min(xdata3) max(xdata3)], [hline hline], colors{2}, 'LineWidth', 0.5);  
xlabel('Time/s');  
ylabel('u2通道/degree');  
title('横滚通道的推力');  
 
legend({'u2', '期望u2'}, 'Location', 'best');  
grid on;  
hold off;  
  
% 设置第三个子图  
subplot(2,2,3); 
hold on;  
plot(xdata3, ydata3, colors{1}, 'LineWidth', 0.75);  
hline = 0; % 横虚线的高度  
plot([min(xdata3) max(xdata3)], [hline hline], colors{2}, 'LineWidth', 0.5);  
xlabel('Time/s');  
ylabel('u3通道/degree');  
title('俯仰通道的推力');  
legend({'u3', '期望u3'}, 'Location', 'best');  
grid on;  
hold off;  
  
% 设置第四个子图  
subplot(2,2,4);  
hold on;  
plot(xdata4, ydata4, colors{1}, 'LineWidth', 0.75);  
hline = 0; % 横虚线的高度  
plot([min(xdata3) max(xdata3)], [hline hline], colors{2}, 'LineWidth', 0.5);  
xlabel('Time/s');  
ylabel('u4通道/degree');  
title('偏航通道的推力');  
 
legend({'u4', '期望u4'}, 'Location', 'best');  
grid on;  
hold off;  
  
% 设置所有坐标轴的字体大小和字体类型  
axes_handles = findall(gcf, 'Type', 'axes');  
for ax = axes_handles  
    set(ax, 'FontSize', 12);  
    set(ax, 'FontName', 'Times New Roman');  
end  
  
% （可选）设置图形窗口的位置和大小  
set(gcf, 'Position', [100, 100, 800, 600]); % 根据需要调整位置和大小