% Li, S.-Y., Huang, S.-C., Yang, C.-H., & Ge, Z.-M. (2012). Generating tri-chaos attractors with three positive Lyapunov exponents in new four order system via linear coupling. Nonlinear Dynamics, 69(3), 805–816. doi:10.1007/s11071-011-0306-x 

clear
close
clc

a = 91.17;
b = 5.023;
c = -0.001;
d = 91;
e = 87.001;
f = 0.018;
g = 9.5072;

fun = @(t, x) [x(2);
              -(a +b * x(3)) * x(1) - (a + b * x(3)) * x(1) ^ 3 - c * x(2) + d * x(3);
              x(4);
              -e * x(3) + f * (1 - x(3) ^ 2) * x(4) + g * x(1)];

incond = [1 1 1 1];
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
view([-137 15])
colormap gray;
colorbar;
axis tight;
grid on;
box on;
xlabel('$x_1$', 'FontSize', 14);
ylabel('$x_2$', 'FontSize', 14);
zlabel('$x_3$', 'FontSize', 14);
title(['The Hyperchaotic Mathieu---Van der Pol Attractor' "$x_1x_2x_3$-projection"], 'FontSize', 15.5);

% exportgraphics(gcf, "images_png/The_Hyperchaotic_Mathieu_Van_der_Pol_Attractor_x1x2x3_projection.png", 'Resolution', 1200)
% exportgraphics(gcf, "images_pdf/The_Hyperchaotic_Mathieu_Van_der_Pol_Attractor_x1x2x3_projection.pdf", "ContentType", "vector")
% exportgraphics(gcf, "images_eps/The_Hyperchaotic_Mathieu_Van_der_Pol_Attractor_x1x2x3_projection.eps", "ContentType", "vector")
% print(gcf, "images_svg/The_Hyperchaotic_Mathieu_Van_der_Pol_Attractor_x1x2x3_projection.svg", "-dsvg")
% save("workspace/TheHyperchaoticMathieuVanderPolAttractor.mat")

% combinations = nchoosek(1 : length(incond), 2);
% videoFile = 'gifs/The_Hyperchaotic_Mathieu_Van_der_Pol_Attractor_2D_projections.gif';
% 
% for i = 1 : length(combinations)
%     figure;
%     scatter(xsol(:, combinations(i, 1)), xsol(:, combinations(i, 2)), 4, 1:length(t), 'filled');
%     title(['The Hyperchaotic Mathieu---Van der Pol Attractor' sprintf("$x_%ix_%i$-projection",  combinations(i, 1),  combinations(i, 2))], 'FontSize', 15.5);
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