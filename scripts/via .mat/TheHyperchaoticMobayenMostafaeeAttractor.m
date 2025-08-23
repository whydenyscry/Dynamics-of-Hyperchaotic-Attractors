% Mobayen, S., Mostafaee, J., Alattas, K. A., Ke, M., Hsueh, Y., & Zhilenkov, A. (2024). A new hyperchaotic system: circuit realization, nonlinear analysis and synchronization control. Physica Scripta, 99(10), 105204. https://doi.org/10.1088/1402-4896/ad71fc

clear
close
clc

load("TheHyperchaoticMobayenMostafaeeAttractor.mat")

set(groot, "defaultAxesTickLabelInterpreter", "latex");
set(groot, "defaultTextInterpreter", "latex");
set(groot, "defaultLegendInterpreter", "latex");
set(groot, "defaultColorbarTickLabelInterpreter", "latex");

figure;
scatter3(xsol(:, 1), xsol(:, 2), xsol(:, 3), 4, 1:length(t), 'filled');
view([-154 31])
colormap gray;
colorbar;
axis tight;
grid on;
box on;
xlabel('$x_1$', 'FontSize', 14);
ylabel('$x_2$', 'FontSize', 14);
zlabel('$x_3$', 'FontSize', 14);
title(["The Hyperchaotic Mobayen---Mostafaee Attractor" "$x_1x_2x_3$-projection"], 'FontSize', 15.5);

% exportgraphics(gcf, "images_png/The_Hyperchaotic_Mobayen_Mostafaee_Attractor_x1x2x3_projection.png", 'Resolution', 600)
% exportgraphics(gcf, "images_pdf/The_Hyperchaotic_Mobayen_Mostafaee_Attractor_x1x2x3_projection.pdf", "ContentType", "vector")
% exportgraphics(gcf, "images_eps/The_Hyperchaotic_Mobayen_Mostafaee_Attractor_x1x2x3_projection.eps", "ContentType", "vector")
% print(gcf, "images_svg/The_Hyperchaotic_Mobayen_Mostafaee_Attractor_x1x2x3_projection.svg", "-dsvg")
% save("workspace/TheHyperchaoticMobayenMostafaeeAttractor.mat")

% combinations = nchoosek(1 : length(incond), 2);
% videoFile = 'gifs/The_Hyperchaotic_Mobayen_Mostafaee_Attractor_2D_projections.gif';
% 
% for i = 1 : length(combinations)
%     figure;
%     scatter(xsol(:, combinations(i, 1)), xsol(:, combinations(i, 2)), 4, 1:length(t), 'filled');
%     title(["The Hyperchaotic Mobayen---Mostafaee Attractor" sprintf("$x_%ix_%i$-projection",  combinations(i, 1),  combinations(i, 2))], 'FontSize', 15.5);
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