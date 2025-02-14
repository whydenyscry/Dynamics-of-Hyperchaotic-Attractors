% Yi, L., Xiao, W., Yu, W., & Wang, B. (2018). Dynamical analysis, circuit implementation and deep belief network control of new six-dimensional hyperchaotic system. Journal of Algorithms & Computational Technology, 174830181878864. doi:10.1177/1748301818788649 

clear
close
clc

a = 10;
b = 8/3;
c = 28;
d = -1;
e = 10;
r = 3;

fun = @(t, x) [a * (x(2) - x(1)) + x(4);
               c * x(1) - x(2) - x(1) * x(3) - x(5);
               -b * x(3) + x(1) * x(2);
               d * x(4) - x(2) * x(3);
               r * x(2);
               -e * x(6) + x(3) * x(4)];

incond = [1 1 1 1 1 1];
timeint = [0 1e3];

tau = 1e-3;

start_ODE = datetime("now");
[t, xsol] = odeCRK4(fun, timeint, tau, incond);
end_ODE = datetime("now");

time_RKmethod = end_ODE - start_ODE;
time_RKmethod.Format = "hh:mm:ss.SSS";

set(groot, "defaultAxesTickLabelInterpreter", "latex");
set(groot, "defaultTextInterpreter", "latex");
set(groot, "defaultLegendInterpreter", "latex");
set(groot, "defaultColorbarTickLabelInterpreter", "latex");

figure;
scatter3(xsol(:, 1), xsol(:, 2), xsol(:, 3), 4, 1:length(t), 'filled');
view([-137.9 12.9])
colormap gray;
colorbar;
axis tight;
grid on;
box on;
xlabel('$x_1$', 'FontSize', 14);
ylabel('$x_2$', 'FontSize', 14);
zlabel('$x_3$', 'FontSize', 14);
title(['The Hyperchaotic Yi---Xiao---Yu Attractor' "$x_1x_2x_3$-projection"], 'FontSize', 15.5);

% exportgraphics(gcf, "images_png/The_Hyperchaotic_Yi_Xiao_Yu_Attractor_x1x2x3_projection.png", 'Resolution', 1200)
% exportgraphics(gcf, "images_pdf/The_Hyperchaotic_Yi_Xiao_Yu_Attractor_x1x2x3_projection.pdf", "ContentType", "vector")
% exportgraphics(gcf, "images_eps/The_Hyperchaotic_Yi_Xiao_Yu_Attractor_x1x2x3_projection.eps", "ContentType", "vector")
% print(gcf, "images_svg/The_Hyperchaotic_Yi_Xiao_Yu_Attractor_x1x2x3_projection.svg", "-dsvg")
% save("workspace/TheHyperchaoticYiXiaoYuAttractor.mat")

% combinations = nchoosek(1 : length(incond), 2);
% videoFile = 'gifs/The_Hyperchaotic_Yi_Xiao_Yu_Attractor_2D_projections.gif';
% 
% for i = 1 : length(combinations)
%     figure;
%     scatter(xsol(:, combinations(i, 1)), xsol(:, combinations(i, 2)), 4, 1:length(t), 'filled');
%     title(['The Hyperchaotic Yi---Xiao---Yu Attractor' sprintf("$x_%ix_%i$-projection",  combinations(i, 1),  combinations(i, 2))], 'FontSize', 15.5);
%     xlabel(sprintf("$x_%i$", combinations(i, 1)), 'FontSize', 14);
%     ylabel(sprintf("$x_%i$", combinations(i, 2)), 'FontSize', 14);
%     colormap gray;
%     colorbar;
%     axis tight;
%     grid on;
%     box on;
% 
%     img_gray = rgb2gray(frame2im(getframe(gcf)));
% 
%     if i == 1
%         imwrite(img_gray, videoFile, 'gif', 'LoopCount', inf, 'DelayTime', 1);
%     else
%         imwrite(img_gray, videoFile, 'gif', 'WriteMode', 'append', 'DelayTime', 1);
%     end
%     close(gcf);
% end