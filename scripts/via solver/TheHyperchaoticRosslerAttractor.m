% Rossler, O. E. (1979). An equation for hyperchaos. Physics Letters A, 71(2-3), 155–157. doi:10.1016/0375-9601(79)90150-6 

clear
close
clc

a = 0.25;
b = 3;
c = 0.5;
d = 0.05;

fun = @(t, x) [-x(2) - x(3);
                x(1) + a * x(2) + x(4);
                b + x(1) * x(3);
                -c * x(3) + d * x(4)];

incond = [-20 0 0 15];
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
view([-48 21])
colormap gray;
colorbar;
axis tight;
grid on;
box on;
xlabel('$x_1$', 'FontSize', 14);
ylabel('$x_2$', 'FontSize', 14);
zlabel('$x_3$', 'FontSize', 14);
title(['The Hyperchaotic R\"ossler Attractor' "$x_1x_2x_3$-projection"], 'FontSize', 15.5);

% exportgraphics(gcf, "images_png/The_Hyperchaotic_Rossler_Attractor_x1x2x3_projection.png", 'Resolution', 1200)
% exportgraphics(gcf, "images_pdf/The_Hyperchaotic_Rossler_Attractor_x1x2x3_projection.pdf", "ContentType", "vector")
% exportgraphics(gcf, "images_eps/The_Hyperchaotic_Rossler_Attractor_x1x2x3_projection.eps", "ContentType", "vector")
% print(gcf, "images_svg/The_Hyperchaotic_Rossler_Attractor_x1x2x3_projection.svg", "-dsvg")
% save("workspace/TheHyperchaoticRosslerAttractor.mat")

% combinations = nchoosek(1 : length(incond), 2);
% videoFile = 'gifs/The_Hyperchaotic_Rossler_Attractor_2D_projections.gif';
% 
% for i = 1 : length(combinations)
%     figure;
%     scatter(xsol(:, combinations(i, 1)), xsol(:, combinations(i, 2)), 4, 1:length(t), 'filled');
%     title(['The Hyperchaotic R\"ossler Attractor' sprintf("$x_%ix_%i$-projection",  combinations(i, 1),  combinations(i, 2))], 'FontSize', 15.5);
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
